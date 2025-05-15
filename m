Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0DEAB7EDE
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 09:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984834.1370766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFT5l-0006Da-7K; Thu, 15 May 2025 07:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984834.1370766; Thu, 15 May 2025 07:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFT5l-0006C6-3b; Thu, 15 May 2025 07:33:21 +0000
Received: by outflank-mailman (input) for mailman id 984834;
 Thu, 15 May 2025 07:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Gu8=X7=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uFT5j-0006Bv-79
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 07:33:19 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd6eafab-315e-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 09:33:17 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54F7WfsF3336298
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 15 May 2025 00:32:41 -0700
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
X-Inumbo-ID: dd6eafab-315e-11f0-9eb6-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54F7WfsF3336298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747294363;
	bh=FTKlSsiJd9+jpos7AVLXF8LAqgwtfl1Qy7H7vRzCDXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OeZftPa4P2RcLNrfq7mYvwL9TgxRMcLlkVGZC6h8vETFbJVCjpBbzmpzH5AR13wKx
	 15mv9dkcpvv5ouP63h6d4FyAbbBv4ahXZZT/mJEs0YcVe4dSsuiidCYyb5eLIFmmab
	 KZh7WExvvM7f5dcUXiiH4kI087BVfYMnwIxDBqPfWZBau2sgqY1q7vFYn0CwCYjxM9
	 k2IdZTAsWYVBOheuyRj88cuKgPcjoyTQbvMyOTslRINSkfMVXRDIiVGVCAqieKjmOF
	 vIstWyCK+xY4GqiDXwaoMJ8FcLhCdyf9Y7Wv9kaBeH/qOTfV0h+xsRne4kDWAibHx3
	 4HrOazqt1wu0g==
Message-ID: <652dfd63-e41c-4d7a-8fea-40509e8191ef@zytor.com>
Date: Thu, 15 May 2025 00:32:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
To: "H. Peter Anvin" <hpa@zytor.com>,
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
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <DDA7C560-1BD9-40A6-8B93-28D5AC10EBB2@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/2025 3:24 PM, H. Peter Anvin wrote:
> On May 12, 2025 11:06:02 PM PDT, "Jürgen Groß" <jgross@suse.com> wrote:
>> On 13.05.25 07:55, Xin Li wrote:
>>> On 5/12/2025 4:24 AM, Juergen Gross wrote:
>>>> Now with the mentioned patch really attached. :-)
>>>>
>>>
>>> Does it allow patching with an instruction more than 6 bytes long?
>>>
>>> The immediate form MSR instructions are 9 bytes long.
>>
>> Yes, shouldn't be a problem.
>>
>>
>> Juergen
> 
> However, it is more than that. The immediate instructions have a different interface, and it makes more sense to use the extra bytes to shuffle the bits around for the legacy forms:
> 
> Write:
> 
>      mov %rax,%rdx
>      shr $32,%rdx
>      wrmsr(ns)
> 
> Read:
> 
>      rdmsr
>      shl $32,%rdx
>      or %rdx,%rax
> 
> For the write case, this also means that two separate trap points are needed.
> 
> As far as Xen (the only user of pv msrs), note that it only paravirtualizes a very small number of MSRs, and some of those are fairly performance sensitive, so not going through the Xen framework for MSRs known to be either native or null on Xen would definitely be a win.
> 
> 

Hi Juergen,

I have some update on this thread while working on it.

If we continue down the path of maintaining pvops MSR APIs as this patch
series does, it seems we’ll need to duplicate the ALTERNATIVE code in
three different places.

1) The MSR access primitives defined in <asm/msr.h>, which is used when
    CONFIG_PARAVIRT=n.

2) The pvops native MSR functions pv_native_{rd,wr}msr{,_safe}() defined
    in arch/x86/kernel/paravirt.c, used when CONFIG_PARAVIRT=y on bare
    metal.

3) The pvops Xen MSR functions paravirt_{read,write}_msr{,_safe}()
    defined in <asm/paravirt.h>, used when CONFIG_PARAVIRT_XXL=y.

hpa had mentioned to me earlier that this would be a maintenance burden
— something I only truly realized once I got hands-on with it.

Maybe you have something in mind to address it?

Also add PeterZ to the To list because he cares it.

Thanks!
     Xin

