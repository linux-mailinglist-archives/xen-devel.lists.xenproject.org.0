Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80FAB90C8
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 22:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985974.1371739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFf8s-0002Br-Fr; Thu, 15 May 2025 20:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985974.1371739; Thu, 15 May 2025 20:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFf8s-00029k-DE; Thu, 15 May 2025 20:25:22 +0000
Received: by outflank-mailman (input) for mailman id 985974;
 Thu, 15 May 2025 20:25:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W6IA=X7=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1uFf8r-00029e-C7
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 20:25:21 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b77b061e-31ca-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 22:25:19 +0200 (CEST)
Received: from [172.27.3.244] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54FKOiar3684076
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 15 May 2025 13:24:45 -0700
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
X-Inumbo-ID: b77b061e-31ca-11f0-9eb6-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54FKOiar3684076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747340686;
	bh=wKRRKSoScdWzuK4LlPzka9ZNoM1J1rtc/6+sJ4Fs1a4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gJKDU4MfBzkQmOtQ+brwkqwBjCxpL4Aoh5vuHM2zX07AMP1wouqPEkZ8t8Zginx95
	 wrmSUhstmpIg3W+8NMVN1RGPGaCkTLgFMExrIr20QNTYQRF46w1HKoY9N6cJgNIhyK
	 YfMXFT27hXu6tuIYlmOvWObaWramdivO/S6ueWlBtJVzLXf7gEn2jGGveuRTSOLWRj
	 ITIda0Xuqsd0g1cIxraDOX6VAsxa53a1lW4KgwnGcozRFvWOR9nw+SD9cjfC3VTvtl
	 a476jFIreR9+e7oW2CgniF1eXFe20zxaA95VXTbYl8aUxx0lJ3rvMXY0vwewtm9KAu
	 aiJHfA6ipWCUA==
Message-ID: <8d61e7a2-5eba-43c8-a38d-ca6ae59172b5@zytor.com>
Date: Thu, 15 May 2025 13:24:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
To: Xin Li <xin@zytor.com>,
        =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        virtualization@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.amakhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
 <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
 <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
 <ff567466-a46a-4f66-935a-8fae1140c1a2@suse.com>
 <eb077393-ea95-4ac0-9479-980e227f7bff@zytor.com>
 <6cc20ef6-d8e5-4c74-89d9-6a949c84b397@suse.com>
 <DDA7C560-1BD9-40A6-8B93-28D5AC10EBB2@zytor.com>
 <652dfd63-e41c-4d7a-8fea-40509e8191ef@zytor.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <652dfd63-e41c-4d7a-8fea-40509e8191ef@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 00:32, Xin Li wrote:
> 
> Hi Juergen,
> 
> I have some update on this thread while working on it.
> 
> If we continue down the path of maintaining pvops MSR APIs as this patch
> series does, it seems we’ll need to duplicate the ALTERNATIVE code in
> three different places.
> 
> 1) The MSR access primitives defined in <asm/msr.h>, which is used when
>     CONFIG_PARAVIRT=n.
> 
> 2) The pvops native MSR functions pv_native_{rd,wr}msr{,_safe}() defined
>     in arch/x86/kernel/paravirt.c, used when CONFIG_PARAVIRT=y on bare
>     metal.
> 
> 3) The pvops Xen MSR functions paravirt_{read,write}_msr{,_safe}()
>     defined in <asm/paravirt.h>, used when CONFIG_PARAVIRT_XXL=y.
> 
> hpa had mentioned to me earlier that this would be a maintenance burden
> — something I only truly realized once I got hands-on with it.
> 
> Maybe you have something in mind to address it?
> 
> Also add PeterZ to the To list because he cares it.
> 

Having the code being duplicated is definitely not a good thing; 
although I'm not one of the x86 maintainers anymore, I would consider it 
a strong reason to NAK such a patchset.

At one point I was considering augmenting the alternatives framework to 
be able to call an ad hoc subroutine to generate the code. It would be 
useful in cases like this, where if PV is enabled it can make a callout 
to the currently-active PV code to query the desired code to be output.

There are 16 unused bits in the alternatives table (not counting the 14 
unused flag bits), which could be used for an enumeration of such 
subroutines, optionally split into 8 bits of function enumeration and 8 
bits of private data. In this case, the "replacement" pointer becomes 
available as a private pointer; possibly to a metadata structure used by 
the subroutine.

This could also be used to significantly enhance the static-immediate 
framework, by being able to have explicit code which handles the 
transformations instead of needing to rely on assembly hacks. That way 
we might even be able to do that kind of transformations for any 
ro_after_init value.

I think the biggest concern is how this would affect objtool, since 
objtool would now not have any kind of direct visibility into the 
possibly generated code. How to best feed the information objtool needs 
to it would be my biggest question (in part because I don't know what 
objtool would actually need.)

	-hpa


