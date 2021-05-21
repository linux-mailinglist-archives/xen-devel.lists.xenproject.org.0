Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8238C0B1
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 09:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131165.245293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljzXw-0001b4-0D; Fri, 21 May 2021 07:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131165.245293; Fri, 21 May 2021 07:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljzXv-0001Y1-TQ; Fri, 21 May 2021 07:26:11 +0000
Received: by outflank-mailman (input) for mailman id 131165;
 Fri, 21 May 2021 07:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qZ6I=KQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljzXu-0001Xv-Fq
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 07:26:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f31b127d-d8d8-43de-bf31-c4e7d1435439;
 Fri, 21 May 2021 07:26:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1B53AB64;
 Fri, 21 May 2021 07:26:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f31b127d-d8d8-43de-bf31-c4e7d1435439
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621581968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QgWvsxiemLxZi6Uo1RdnfIDagmZQ6WxkASMEMiRYIuw=;
	b=ApjhcA9Onsc9oxlCzlv1VwnpqrBBAlRvnZAy4KReIEJDcHvIuwESNFDFJRelvJaQpoin/f
	lBUmfBRQ4nqTEmqzBPd2mcrIfhfnTIIkrqqBffYNhkB7XzxywFBKOWKscjsUuF7Y0ZViHO
	xmwqgFAU9P1ZKwQ40yVFoshHwtMTF8A=
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
 <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89c46d1a-9474-0f17-3fda-4809a14adb45@suse.com>
Date: Fri, 21 May 2021 09:26:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <3953076f-c2fa-2e2a-4b07-fb610046a27d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.05.2021 09:18, Juergen Gross wrote:
> On 20.05.21 14:08, Jan Beulich wrote:
>> On 20.05.2021 13:57, Juergen Gross wrote:
>>> On 20.05.21 13:42, Jan Beulich wrote:
>>>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
>>>> For this to work when NX is not available, x86_configure_nx() needs to
>>>> be called first.
>>>>
>>>> Reported-by: Olaf Hering <olaf@aepfle.de>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>
>> Thanks. I guess I forgot
>>
>> Cc: stable@vger.kernel.org
>>
>> If you agree, can you please add this before pushing to Linus?
> 
> Uh, just had a look why x86_configure_nx() was called after
> xen_setup_gdt().
> 
> Upstream your patch will be fine, but before kernel 5.9 it will
> break running as 32-bit PV guest (see commit 36104cb9012a82e7).

Oh, indeed. That commit then actually introduced the issue here,
and hence a Fixes: tag may be warranted.

> So I will take your patch as is, but for kernels 5.8 and older I
> recommend a different approach by directly setting the NX
> capability after checking the cpuid bit instead of letting that
> do get_cpu_cap().

Right - perhaps the only halfway viable option.

64-bit kernels predating 4f277295e54c may then also need that one,
but perhaps all stable ones already have it because it was tagged
for stable.

Jan

