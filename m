Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB84AC8E2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 19:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267391.461137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH98K-00088c-Rt; Mon, 07 Feb 2022 18:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267391.461137; Mon, 07 Feb 2022 18:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH98K-00085k-OL; Mon, 07 Feb 2022 18:53:04 +0000
Received: by outflank-mailman (input) for mailman id 267391;
 Mon, 07 Feb 2022 18:53:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH98I-00085e-Hb
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 18:53:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH98F-00022N-9f; Mon, 07 Feb 2022 18:52:59 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH98F-0004OE-2D; Mon, 07 Feb 2022 18:52:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=LjFK9kSn+qCo144a/hzlwdWrolI/1oXV5tiXZ6qnNj0=; b=CH3gxZ1fGL+Go86DUviSW7ZGc2
	HCxXwXCX7VtYwrJThxvZOpMltgLDpzfwdCP7/Rhq5WaW+1QPjS6VKFj2jbx7pGFgg/gYOuUSR+W4w
	9Sto+CGkgpGswIskjCbi/6QR59wO9ka8/fki6K79NpIh0pKxZnXdgEzGLyqIMs7eqQsM=;
Message-ID: <26cdd9cf-15d6-a463-b1bb-28964005f618@xen.org>
Date: Mon, 7 Feb 2022 18:52:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH RFC 1/3] xen/efi: Always query the console information and
 get GOP
To: Jan Beulich <jbeulich@suse.com>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-2-julien@xen.org>
 <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/02/2022 08:46, Jan Beulich wrote:
> On 06.02.2022 20:28, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, the EFI stub will only query the console information and
>> get the GOP when using the configuration file.
>>
>> However, GRUB is never providing the a configuration file. So the
>> EFI framebuffer will not be usable at least on Arm (support will
>> be added in a follow-up patch).
>>
>> Move out the code outside of the configuration file section.
>>
>> Take the opportunity to remove the variable 'size' which was
>> set but never used (interestingly GCC is only complaining if it is
>> initialization when declaring the variable).
>>
>> With this change, GCC 8.3 will complain of argc potentially been
>> used unitiatlized. I suspect this is because the argc will
>> be iniitalized and used in a different if code-blocks. Yet they
>> are using the same check.
> 
> I'm inclined to suggest this wants to be a separate change, with its
> own justification. You're not touching any use of argc here, after
> all.

Ok. I will split it.

> 
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>> It is not entirely clear to me why the GOP was only fetched when
>> the configuration file is used.
>>
>> I have tested this on RPI4 and it seems to work. Any chance this
>> was done to workaround an x86 platform?
> 
> This was done so in the context of making the code work for Arm. See
> commit c38cf865ec82 ("EFI: ignore EFI commandline, skip console setup
> when booted from GRUB"), the description of which explicitly says
> 
> "Don't do EFI console or video configuration when booted by GRUB.  The EFI boot
>   code does some console and video initialization to support native EFI boot from
>   the EFI boot manager or EFI shell.  This initlization should not be done when
>   booted using GRUB."

I read that and still couldn't figure out why this was done like that.

> 
> What you say now is effectively the opposite (and unlike back then
> x86 is now able to use this code path as well, so needs considering
> too). Cc-ing Daniel for possibly having a GrUB-side opinion.

I am quite interested to know the answer. Linux is able to use the EFI 
framebuffer when booting via GRUB. So I am a bit puzzled why we are 
preventing this setup on dom0/Xen.

Cheers,

-- 
Julien Grall

