Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFA36D3BD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 10:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119068.225388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfGh-0001pC-Ac; Wed, 28 Apr 2021 08:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119068.225388; Wed, 28 Apr 2021 08:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfGh-0001on-7N; Wed, 28 Apr 2021 08:09:59 +0000
Received: by outflank-mailman (input) for mailman id 119068;
 Wed, 28 Apr 2021 08:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbfGf-0001oi-Jp
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 08:09:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97d2edf3-2dee-4b06-9462-9ca424369808;
 Wed, 28 Apr 2021 08:09:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C77B6AF95;
 Wed, 28 Apr 2021 08:09:55 +0000 (UTC)
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
X-Inumbo-ID: 97d2edf3-2dee-4b06-9462-9ca424369808
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619597395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fReZqMPUNfMhAARkRPCF3f9jLn936E5fNOwz/nQswsY=;
	b=WqVVf0hnfDFxavXCaWh0g7ObHvSMn7huwszwhHZx17BQkNobBJIcT3+MHTBBOVks431nit
	n1v3juvO9/ma7AxfFDMD9OUFgWSid0j0M29HLz+rq1ifQ7Hb5g53qBxNLXhlDAkdwCk3bK
	NDsX0HGJgxVE/eVIIsZ8W/WfkKe+BgI=
Subject: Re: [PATCH] x86/pv: Drop HYPERVISOR_COMPAT_VIRT_START()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210427130201.2142-1-andrew.cooper3@citrix.com>
 <bdc85c8d-db7c-e9cb-d436-317a31f96e69@suse.com>
 <bdd45821-5164-a785-67bd-8f660c6353cf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <159b5b07-7d09-3cf3-0ce9-4280d931480a@suse.com>
Date: Wed, 28 Apr 2021 10:09:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <bdd45821-5164-a785-67bd-8f660c6353cf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.04.2021 20:05, Andrew Cooper wrote:
> On 27/04/2021 14:18, Jan Beulich wrote:
>> On 27.04.2021 15:02, Andrew Cooper wrote:
>>> --- a/xen/include/asm-x86/config.h
>>> +++ b/xen/include/asm-x86/config.h
>>> @@ -254,21 +254,16 @@ extern unsigned char boot_edid_info[128];
>>>  
>>>  /* This is not a fixed value, just a lower limit. */
>>>  #define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
>>> -#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
>>> -
>>> -#else /* !CONFIG_PV32 */
>>> -
>>> -#define HYPERVISOR_COMPAT_VIRT_START(d) ((void)(d), 0)
>> ... this to allow things to build in the absence of the actual struct
>> member.
> 
> Hmm - I really should have got this change in earlier, shouldn't I...
> 
> For this example you've pointed out, feeding 0 into the limit
> calculation is not a correct thing to do in the slightest.

Does it actually get fed into any such calculation? From looking
around yesterday as well as from when I made that change over
half a year ago I seem to recall that all potentially problematic
uses are already suitably guarded.

Jan

