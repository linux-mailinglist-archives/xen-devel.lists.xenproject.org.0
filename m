Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB47A1A93
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 11:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602973.939824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh59J-0002To-Dc; Fri, 15 Sep 2023 09:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602973.939824; Fri, 15 Sep 2023 09:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh59J-0002P6-Aa; Fri, 15 Sep 2023 09:30:05 +0000
Received: by outflank-mailman (input) for mailman id 602973;
 Fri, 15 Sep 2023 09:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=upey=E7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qh59H-0002Av-VU
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 09:30:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72079673-53aa-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 11:30:02 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-403004a96a4so21432285e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 02:30:01 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b0031fb91f23e9sm3968812wrx.43.2023.09.15.02.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 02:30:01 -0700 (PDT)
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
X-Inumbo-ID: 72079673-53aa-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694770201; x=1695375001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GtmmLcHcRD+wlcitNaQuNNPcuwSgAbCwQKzzoSQ/4Bc=;
        b=ut3s+W6R2RtI6dR+uzDFzyOSGsdyqwzkYVddm3jljtHARiiNQagD5pH9yTT2V7kEZb
         9j3XerYiM6warq0l/0nJAb2FmBrN/Pb6iKYpmNHXyigBnn/EDJ4O1UHbjEOjGPL7PGdA
         fjSZKMf56WXjnX7hjqaWjCPI1lgrJ5SIfzHow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694770201; x=1695375001;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtmmLcHcRD+wlcitNaQuNNPcuwSgAbCwQKzzoSQ/4Bc=;
        b=VbVLerCupfuxKldO7lAHmVANxId/mV7l6KDK3sIK7Xb7Urcckparf9ukkvMhYbo/fj
         qY5tAVOJR0pZeHJ7AYakeXsblLhxsiLHmNdtz/29U8yPi9x33MyUhiMVvXREBtndN9iL
         ZoBXNFoLeHSAkTvGx2BzyyP1r40zsmweWy/BQE90Bvu9wknIrRDfYOiGX6nCqKCCAByh
         Mu38HbeG1CRf8Nm8/0xCmp5bdkEuZ/ZDivnHchGAU7GBQ1MvgX3W7Nc1OvyqkqemRKgv
         Wtoq5DDunzg3Ny08VFTpCQExj+6tzA4uBoKoj3NRAn1U+fxtoAmMRngNqsNqZysk8pmc
         ehyw==
X-Gm-Message-State: AOJu0YwRAPjoxu+VtejhtIDYQieaibuSHfEvdSOxziCtZEr//6josS5f
	cgNTJXECCsa0rwvtzWZ+TALbcA==
X-Google-Smtp-Source: AGHT+IEm2FEBv2wfHIRlMUCHtKhHdrR2XAJVDrPOpdc9HJcP5BNekEAjBEiHoZ8x4u5uBuzDbMyBJw==
X-Received: by 2002:a5d:4248:0:b0:31c:6409:df17 with SMTP id s8-20020a5d4248000000b0031c6409df17mr927675wrr.41.1694770201337;
        Fri, 15 Sep 2023 02:30:01 -0700 (PDT)
Message-ID: <7701767a-5323-8115-04aa-ad7f35224924@citrix.com>
Date: Fri, 15 Sep 2023 10:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/8] x86/entry: Track the IST-ness of an entry for the
 exit paths
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
 <20230913202758.508225-7-andrew.cooper3@citrix.com>
 <762b58fe-a841-f92c-93a8-77dbb86bf118@suse.com>
 <fb9ec99d-9c76-82ff-9b82-22fff1a62c6c@citrix.com>
 <b6640dbb-05e5-7114-dc70-012c27dd96e7@suse.com>
In-Reply-To: <b6640dbb-05e5-7114-dc70-012c27dd96e7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/09/2023 8:13 am, Jan Beulich wrote:
> On 14.09.2023 21:44, Andrew Cooper wrote:
>> On 14/09/2023 10:32 am, Jan Beulich wrote:
>>> On 13.09.2023 22:27, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>> @@ -142,10 +142,16 @@ process_trap:
>>>>  
>>>>          .section .text.entry, "ax", @progbits
>>>>  
>>>> -/* %rbx: struct vcpu, interrupts disabled */
>>>> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>>>>  restore_all_guest:
>>>> -        ASSERT_INTERRUPTS_DISABLED
>>>>  
>>>> +#ifdef CONFIG_DEBUG
>>>> +        mov   %rsp, %rdi
>>>> +        mov   %r12, %rsi
>>>> +        call  check_ist_exit
>>>> +#endif
>>>> +
>>>> +        ASSERT_INTERRUPTS_DISABLED
>>>>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>>>>          mov VCPU_arch_msrs(%rbx), %rdx
>>>>          mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
>>> Even here I don't think I see a need for the addition. Plus if the check
>>> is warranted here, is it really necessary for it to live ahead of the
>>> interrupts-disabled check?
>> What makes you think there is a relevance to the order of two assertions
>> in fully irqs-off code?
> You explicitly making it more churn than strictly needed. IOW I was
> simply wondering whether I was overlooking some aspect.

That was just the diff algorithm after accidentally removing the newline
after the ASSERT.  I've undone that, and the hunk is simple additions
for the check, like it is in the other two hunks.

~Andrew

