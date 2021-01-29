Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318D3086F1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77775.141071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Oz4-0006LQ-Aa; Fri, 29 Jan 2021 08:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77775.141071; Fri, 29 Jan 2021 08:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Oz4-0006L1-7H; Fri, 29 Jan 2021 08:18:26 +0000
Received: by outflank-mailman (input) for mailman id 77775;
 Fri, 29 Jan 2021 08:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Oz2-0006Ku-8b
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:18:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4d694d1-1c01-4087-91d8-b09fcb01aa6b;
 Fri, 29 Jan 2021 08:18:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05AB3ACB0;
 Fri, 29 Jan 2021 08:18:21 +0000 (UTC)
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
X-Inumbo-ID: b4d694d1-1c01-4087-91d8-b09fcb01aa6b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611908301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y6nsR+YvrCpNyiP9yeLVwtQTmOzd2dnRdUmgkQnQz80=;
	b=EB5vXn6EKiQ0ydBOz90XRshBFbCwl3wsDLM9Zch338zZXnGWdDjfMI0V6GlNVOV39lWVUx
	8Wxk5UXqjF4W3ddecNMMkGqk0Mt3DTQBTTEc7ewZkoQRx25EMKxHuelmo2DcG7Ked5lTgz
	oXpZ6PWbsTL+NjGG8KKxIKhWP+j2pa4=
Subject: Re: [PATCH 3/3] x86: Support booting under Secure Startup via SKINIT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Norbert_Kami=c5=84ski?= <norbert.kaminski@3mdeb.com>,
 Marek Kasiewicz <marek.kasiewicz@3mdeb.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>,
 Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Rich Persaud <persaur@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-4-andrew.cooper3@citrix.com>
 <7c24ddd1-a443-9da8-d840-93a5518b741f@suse.com>
 <15d53d9c-0e05-c4cb-f0e6-ef7eb51e1c9a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c23f7076-836c-4fae-d2da-0f1a8e114515@suse.com>
Date: Fri, 29 Jan 2021 09:18:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <15d53d9c-0e05-c4cb-f0e6-ef7eb51e1c9a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.01.2021 21:26, Andrew Cooper wrote:
> On 20/01/2021 09:19, Jan Beulich wrote:
>> On 16.01.2021 00:10, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -834,6 +834,29 @@ void load_system_tables(void)
>>>  	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
>>>  }
>>>  
>>> +static void skinit_enable_intr(void)
>>> +{
>>> +	uint64_t val;
>>> +
>>> +	/*
>>> +	 * If the platform is performing a Secure Launch via SKINIT
>>> +	 * INIT_REDIRECTION flag will be active.
>>> +	 */
>>> +	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
>>> +	     !(val & VM_CR_INIT_REDIRECTION) )
>>> +		return;
>>> +
>>> +	ap_boot_method = AP_BOOT_SKINIT;
>>> +
>>> +	/*
>>> +	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
>>> +	 * enabling GIF, so a pending INIT resets us, rather than causing a
>>> +	 * panic due to an unknown exception.
>>> +	 */
>>> +	wrmsr_safe(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);
>> Why wrmsr_safe() without checking its return value? If the write
>> faults, we're hosed anyway, aren't we, so we may as well crash on
>> the offending WRMSR rather than some time later?
> 
> Paranoia.
> 
> Xen's old MSR behaviour would have leaked INIT_REDIRECTION into guest
> context but discarded writes,

In which case there wouldn't have been any fault to catch and
ignore.

> and there are usecases to keep
> INIT_REDIRECTION enabled (if you're willing to sacrifice PV guests to
> avoid #SX-over-the-syscall-gap or back-to-back-INIT-on-IST shaped
> security holes).
> 
> I can make it unconditional if you'd prefer.  At the moment, all this is
> is a best-effort attempt to get back into the old state, so development
> can continue more easily.

I'm not sure which variant is strictly better, but if you stick
to wrmsr_safe(), may I ask that you say this is out of paranoia
in the comment, so future readers will not wonder like I did?

Jan

