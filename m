Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFAF77D344
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 21:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584042.914440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVzaB-0001gU-OH; Tue, 15 Aug 2023 19:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584042.914440; Tue, 15 Aug 2023 19:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVzaB-0001eb-LQ; Tue, 15 Aug 2023 19:19:59 +0000
Received: by outflank-mailman (input) for mailman id 584042;
 Tue, 15 Aug 2023 19:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVlh=EA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qVzaA-0001eV-2e
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 19:19:58 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b321b1-3ba0-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 21:19:55 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 169212719094347.38102617187451;
 Tue, 15 Aug 2023 12:19:50 -0700 (PDT)
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
X-Inumbo-ID: b6b321b1-3ba0-11ee-8776-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1692127193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mSnMzPq7+sdaxlojyTmhiSKToReqbOKU3hGCAevbOjcLL8Wjf05VimrM+C4FZNZrS5uKbMFyG29UIMcVgoN6eFUfkqadZmvA7hzy54bBldgdTH4S+OGew5On7JEmqtJdtYSAC7RdWWVVyJcBWPTgPhiPzgcTJRFtAC3AzIYJOYQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692127193; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rwzP4TaIwcHatVRrjDzhTH0GjGPudFzkLSV2NYiflIY=; 
	b=D1WJXz+EkURLfFS4NBOrSMwaK53z00i9z3yzxJKNvtYKsuUtmSIHYC8ik+afQ0ardZ9rHDVVmtaAfVLPMcySMC4c9ZMKv5AK6bylG6AgEacUSbz+gXn8XN/IL9J7/2O7tBZ2/55lsCk/gwYQBN1ShBpHIKd0PYSYqqXouXuIYXo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692127193;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rwzP4TaIwcHatVRrjDzhTH0GjGPudFzkLSV2NYiflIY=;
	b=iI/z7rX9wyKdHO76Yv5+88XmiDQnI3RieeV4MWk5cl/D6TW3wXpmBT5ImYXGzgGw
	V8jvq3w6rNVfu+FsC1lwGokdq32QO1CGCci2NM9cl9H0PjoxEgCI+DgnnRbjJUz5Mab
	4Y4kv7UvYt2LrCpDzVR+MBoxQsIiRUupLbz/3Rqk=
Message-ID: <c3a2059d-4601-f881-cafb-1bd4c4f74e42@apertussolutions.com>
Date: Tue, 15 Aug 2023 15:19:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] tboot: Disable CET at shutdown
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230815161120.33007-1-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230815161120.33007-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/15/23 12:11, Jason Andryuk wrote:
> tboot_shutdown() calls into tboot to perform the actual system shutdown.
> tboot isn't built with endbr annotations, and Xen has CET-IBT enabled on
> newer hardware.  shutdown_entry isn't annotated with endbr and Xen
> faults:
> 
> Panic on CPU 0:
> CONTROL-FLOW PROTECTION FAULT: #CP[0003] endbranch
> 
> And Xen hangs at this point.
> 
> Disabling CET-IBT let Xen and tboot power off, but reboot was
> perfoming a poweroff instead of a warm reboot.  Disabling all of CET,
> i.e. shadow stacks as well, lets tboot reboot properly.
> 
> Fixes: cdbe2b0a1aec ("x86: Enable CET Indirect Branch Tracking")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Without this fix, Xen subsequently hangs:
> 
> Reboot in five seconds...
> [VT-D] IOMMU1: QI wait descriptor taking too long
>   IQA = 484897000
>   IQH = 0
>   IQT = 820
> 
> with no futher output.
> ---
>   xen/arch/x86/tboot.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
> index 90f6e805a9..86c4c22cac 100644
> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -353,6 +353,16 @@ void tboot_shutdown(uint32_t shutdown_type)
>           tboot_gen_xenheap_integrity(g_tboot_shared->s3_key, &xenheap_mac);
>       }
>   
> +    /*
> +     * Disable CET - tboot may not be built with endbr, and it doesn't support
> +     * shadow stacks.
> +     */
> +    if ( read_cr4() & X86_CR4_CET )
> +    {
> +        wrmsrl(MSR_S_CET, 0);
> +        write_cr4(read_cr4() & ~X86_CR4_CET);
> +    }
> +
>       /*
>        * During early boot, we can be called by panic before idle_vcpu[0] is
>        * setup, but in that case we don't need to change page tables.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

