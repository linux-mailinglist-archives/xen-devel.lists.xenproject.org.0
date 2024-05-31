Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB128D5D17
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733467.1139741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxvo-0000X6-Ow; Fri, 31 May 2024 08:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733467.1139741; Fri, 31 May 2024 08:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxvo-0000VB-MB; Fri, 31 May 2024 08:48:12 +0000
Received: by outflank-mailman (input) for mailman id 733467;
 Fri, 31 May 2024 08:48:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcd8=NC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCxvm-0000TX-Px
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:48:10 +0000
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [2607:f8b0:4864:20::a32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 803e95be-1f2a-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 10:48:07 +0200 (CEST)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4e1c721c040so632905e0c.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 01:48:07 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794f2e519bdsm45059785a.0.2024.05.31.01.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 01:48:04 -0700 (PDT)
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
X-Inumbo-ID: 803e95be-1f2a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717145287; x=1717750087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iyBk0SEk1iT3MmDI59PUcjBu+s31PdxzRAU73P5bf2U=;
        b=tn+6hOc1bmkz6ih8kYQDiInYqeWqw2e383MylOOKKcj7uCZz0zJKzvp87HMDqRDq8x
         pDI70eXhzXaevKXFJicB+oDqheB3F9Tz/fj0CcwgmbcnVMDdwzl6zey/j7q8BKuf3UJ8
         aTzk5T0x5Sok1bEVN3380YPPp9oH+tWb+B+Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717145287; x=1717750087;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyBk0SEk1iT3MmDI59PUcjBu+s31PdxzRAU73P5bf2U=;
        b=cCRqwNrre7/Z3HxakOAKqInR8D9uVaaWwuPVbzsk+ytt15KfM4696EYG3i60jz9ITN
         iC/tgKdJN/6HX8OArSfoe7JPhvozj/8dMnzwc+y8tqxXxhYLj9nn6MBrTO5ssX+57dIs
         DrdqdRQTz3XOwBpnA8pZtKbx9TVEh2V4wwi7QG3d29O9r3uzJYbS5Afsh6sPpKNV9vcM
         YHtbg9LOi3PsbXaYef/Cl7ZEKM1Sb7mW6lni41ib9ZAJ0IaprxzY5U5iNRnyyUJ3Zqeh
         qbTHT3i4H283984sTsizt2RIBpwlgbtAYTxAWCle7CWo8dcf+sYt5LMSLQryPAkoR4wE
         HJeQ==
X-Gm-Message-State: AOJu0YwqTfgjp3+VPM4ao92ryCK9E1mDaK+mH9ilz2ODxZEXXoYognSi
	VPlzN5WU6nsNtK5OXB1e24m7F/+8h8Q1HHX0bdgCAef/3IJ3zzJ4+I43aac2ufY=
X-Google-Smtp-Source: AGHT+IGOdwtoan576X8wy5jkS+8Seuy1wz66gax1o6n3YYLQjdPD4LH7phll1qqxFdR96Ms8lFrZbw==
X-Received: by 2002:a1f:f24b:0:b0:4e4:e8a7:2620 with SMTP id 71dfb90a1353d-4eb02ede2aemr1211079e0c.14.1717145285071;
        Fri, 31 May 2024 01:48:05 -0700 (PDT)
Message-ID: <f7ea72c3-45ef-43cb-ab57-b375a4fbc683@citrix.com>
Date: Fri, 31 May 2024 09:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] xen/bitops: Implement ffs() in common logic
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-7-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2405301809170.2557291@ubuntu-linux-20-04-desktop>
 <7b974b36b89c216379b86170af9de451@bugseng.com>
 <2917e122-51d8-4caf-ba70-52da70d1342a@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2917e122-51d8-4caf-ba70-52da70d1342a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/05/2024 9:34 am, Andrew Cooper wrote:
> On 31/05/2024 7:56 am, Nicola Vetrini wrote:
>> On 2024-05-31 03:14, Stefano Stabellini wrote:
>>> On Fri, 24 May 2024, Andrew Cooper wrote:
>>>> Perform constant-folding unconditionally, rather than having it
>>>> implemented
>>>> inconsistency between architectures.
>>>>
>>>> Confirm the expected behaviour with compile time and boot time tests.
>>>>
>>>> For non-constant inputs, use arch_ffs() if provided but fall back to
>>>> generic_ffsl() if not.  In particular, RISC-V doesn't have a builtin
>>>> that
>>>> works in all configurations.
>>>>
>>>> For x86, rename ffs() to arch_ffs() and adjust the prototype.
>>>>
>>>> For PPC, __builtin_ctz() is 1/3 of the size of size of the transform to
>>>> generic_fls().  Drop the definition entirely.  ARM too benefits in
>>>> the general
>>>> case by using __builtin_ctz(), but less dramatically because it using
>>>> optimised asm().
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> This patch made me realize that we should add __builtin_ctz,
>>> __builtin_constant_p and always_inline to
>>> docs/misra/C-language-toolchain.rst as they don't seem to be currently
>>> documented and they are not part of the C standard
>>>
>>> Patch welcome :-)
>>>
>> I can send a patch for the builtins.
> That's very kind of you.
>
> In total by the end of this series, we've got __builtin_constant_p() 
> (definitely used elsewhere already), and __builtin_{ffs,ctz,clz}{,l}() 
> (3x primitives, 2x input types).
>
> If we're going for a list of the primitive operations, lets add
> __builtin_popcnt{,l}() too right away, because if it weren't for 4.19
> code freeze, I'd have cleaned up the hweight() helpers too.

Oh, and it's worth noting that __builtin_{ctz,clz}{,l}() have explicit
UB if given an input of 0.  (Sadly, even on architectures where the
underlying instruction emitted is safe with a 0 input. [0])

This is why every patch in the series using them checks for nonzero input.

UBSAN (with an adequate compiler) will instrument this, and Xen has
__ubsan_handle_invalid_builtin() to diagnose these.

~Andrew

[0] It turns out that Clang has a 2-argument form of the builtin with
the second being the "value forwarded" in case the first is 0.  I've not
investigated whether GCC has the same.

