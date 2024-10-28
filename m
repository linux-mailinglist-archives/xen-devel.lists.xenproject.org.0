Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587039B33C3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 15:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826614.1240932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Qsr-0000gF-12; Mon, 28 Oct 2024 14:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826614.1240932; Mon, 28 Oct 2024 14:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Qsq-0000el-UQ; Mon, 28 Oct 2024 14:38:16 +0000
Received: by outflank-mailman (input) for mailman id 826614;
 Mon, 28 Oct 2024 14:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Qsp-0000ef-AX
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 14:38:15 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42980083-953a-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 15:38:13 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so657351566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 07:38:13 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f2982e1sm386366466b.99.2024.10.28.07.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 07:38:12 -0700 (PDT)
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
X-Inumbo-ID: 42980083-953a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730126292; x=1730731092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+MecUKJiR5cXcEL9kXdb3EAYSjLxZtq8PeDrtzJXvSw=;
        b=JQQ/Bzih/q3Jz4zPq/RhL1edM6vMmK2no5rdVbPsefBDlx+6QCOSSoPXCoCDtB51FQ
         p2UUUkl4Hmp1o/3tkFy1XdEW3DwXjeOhPq8Z3ADfexmaq5DmCZGlDMzLlBOG3HjZZjO6
         rzTxn1VB4VqtwBIv+Go3ARV5nVkLN8HpYp5i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126292; x=1730731092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MecUKJiR5cXcEL9kXdb3EAYSjLxZtq8PeDrtzJXvSw=;
        b=APbrXlkO/TgcMJXoI2zPbqs75c/eDqBC4CT7k8hj95edqYRXtKOiC71ojxlW9x3kz2
         oSydmdpYH2u3OtBdDlz+/xXoUPnlV7RxMrCC4EGiuW+QJxB+b8v7quCOrM11EhTQAA/p
         zIobuXQU0k+2rHcEJ5fVOasXJNywPoWr90OQ0q93vskBGxgLpZALyOuUZB99h4UPjCsF
         JAq9J5Mljw/es1ACje5mN5u2mkOVuSEqFNrqzlcViBsjiKMTaKbFSEkgr34KP2OQsvgG
         MZS3sXMPRJIr7gspAXPDJSaCH02g+7s2vNCTaQKCJkTSXLPaDNWnIph6a7L1wzjE+9CJ
         yNbw==
X-Forwarded-Encrypted: i=1; AJvYcCXOnvhZSdct7wmsokkzWg8euEGGU4aeUU9Oln+f25T2Yu5pzsVaYYEN8J75ZFYxg1qO3o5BPJ0t2cc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdxWEjTTb3bEyVIcVTIrufbJoNd8AagOBysT4iwy77i0cua7S+
	cdjyEO4DiuhkjHYDR0uK4crrka27kATsxzTk731dm7L1Mky93/ZdbdV6ivn9BqE=
X-Google-Smtp-Source: AGHT+IEqisa0UcsacRN36IYBdQeSn/UH4dbEHoC/gE+00RPMwsh7WxRCtDjNpqSH7A1oCwcCahoJVg==
X-Received: by 2002:a17:907:3f20:b0:a9a:375e:c167 with SMTP id a640c23a62f3a-a9de5c91a19mr805275166b.1.1730126292449;
        Mon, 28 Oct 2024 07:38:12 -0700 (PDT)
Message-ID: <d54ed169-fd41-41b3-9222-50e858c0b622@citrix.com>
Date: Mon, 28 Oct 2024 14:38:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] x86/ucode: Move the CPIO path string into
 microcode_ops
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-8-andrew.cooper3@citrix.com>
 <2e3dfea1-8277-4d4e-b594-87b3cac3052b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2e3dfea1-8277-4d4e-b594-87b3cac3052b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 2:25 pm, Jan Beulich wrote:
> On 28.10.2024 10:18, Andrew Cooper wrote:
>> We've got a perfectly good vendor abstraction already for microcode.  No need
>> for a second ad-hoc one in microcode_scan_module().
>>
>> This is in preparation to use ucode_ops.cpio_path in multiple places.
>>
>> These paths are only used during __init, so take the opportunity to move them
>> into __initconst.
> As an alternative to this, how about ...
>
>> --- a/xen/arch/x86/cpu/microcode/private.h
>> +++ b/xen/arch/x86/cpu/microcode/private.h
>> @@ -59,6 +59,13 @@ struct microcode_ops {
>>       */
>>      enum microcode_match_result (*compare_patch)(
>>          const struct microcode_patch *new, const struct microcode_patch *old);
>> +
>> +    /*
>> +     * For Linux inird microcode compatibliity.
>> +     *
>> +     * The path where this vendor's microcode can be found in CPIO.
>> +     */
>> +    const char *cpio_path;
>     const char cpio_path[];
>
> inheriting the __initconst from the struct instances?
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with a slight preference to the form without the extra pointer.

I'm slightly surprised at this request, given that the form with the
pointer results in less data held at runtime.


>  Except that:
> gcc14 looks to be buggy when it comes to the copying of such a struct. The
> example below yields an internal compiler error. And the direct structure
> assignment also doesn't quite do what I would expect it to do (visible when
> commenting out the "else" branch. Bottom line - leave the code as is.

It's unfortunate to hit an ICE, but the copy cannot possibly work in the
first place.

ucode_ops is in a separate translation unit and has no space allocated
after the flexible member.   Any copy into it is memory corruption of
whatever object happens to be sequentially after ucode_ops.

The only way it would work is having `const char cpio_path[40];` which
is long enough for anything we'd expect to find.

But again, that involves holding init-only data post init.

~Andrew

