Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC64986855
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 23:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804618.1215659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stZZk-0005rA-Vx; Wed, 25 Sep 2024 21:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804618.1215659; Wed, 25 Sep 2024 21:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stZZk-0005oo-So; Wed, 25 Sep 2024 21:29:32 +0000
Received: by outflank-mailman (input) for mailman id 804618;
 Wed, 25 Sep 2024 21:29:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stZZj-0005og-Sy
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 21:29:31 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ee45318-7b85-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 23:29:28 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso42192066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 14:29:28 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134a97sm264614266b.207.2024.09.25.14.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 14:29:27 -0700 (PDT)
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
X-Inumbo-ID: 3ee45318-7b85-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727299768; x=1727904568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GogM9yRFHrnlxx5yGVTNJNqwfxiaE2vxod6EsEK2SmM=;
        b=RqTmdbkTXCJdEyNhbiL5gCBkcy5op++p39U+SqtjZqWBZyTTz1+up4TCb2NUHMge/9
         5z/AS4MptjNMxNBSmS0RU4iU4UxM7jczcym2DHZdaBEtMfpVX8BErxC8EgjcNPZ8rbcP
         96jC/9e0sFAU6IbY/qeYUQGRbZZrLATTycL9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299768; x=1727904568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GogM9yRFHrnlxx5yGVTNJNqwfxiaE2vxod6EsEK2SmM=;
        b=Z6d12KwbVi/u5BRYowBZfFKytTJRsNRrPNRGAatYRfXkGZVG+iilawayh8tzVCEr8Z
         FKh9k/iyyrqLVTJiWL/Qwa6WSDfeJqeg5TUXRvUTzDUleL+SbwOunpbWCBFYhnWqyFMO
         n7Vt6RKkbjEGdpR96MfkaQ5nrKpP7OhkEdJ3m8Sj2LBFycqWmMf7GSawuwt1CGGjwXGg
         0GQiiqiVoTq6Olm+TnG2dFl2jin3iTFzaR5bbi3E0DP+2QSNrLaUG5TZTEruh4U3OUJU
         Ua8fEM/8qtpk1VrY2HeAynsLTql0W7qSI1hQCD0Ixn7saSi8e24z1gUD+sDYpzgLswZ/
         nw3A==
X-Forwarded-Encrypted: i=1; AJvYcCWnrAUJxArf/PZ+T/CJ6yh7TLiqLthmIB4/6s+slDlGcp2muPpa62la3J2pr4qcKpyNNVwXvXknWBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1K+DwhjXSGoAIelPPW78yHGciTBckPRPldz4rFwfEy1/tDrWJ
	bKSn2XqLgn8/yweIx6/HY2npZlltxLWudQhQdj5jo/9iJqVcXUkDJWvcrQdUEZ8=
X-Google-Smtp-Source: AGHT+IGAqoEEnMZzx4bWA+QI3Pz4r1jdENghLOUeXL5I+yddFk9m8d5P6oCP/Kn+yEA6lRhWeXuIPg==
X-Received: by 2002:a17:907:7f23:b0:a90:b73f:61d7 with SMTP id a640c23a62f3a-a93a0617d22mr387164266b.42.1727299768191;
        Wed, 25 Sep 2024 14:29:28 -0700 (PDT)
Message-ID: <cb713898-ed4d-49dc-b621-8228c0d1ace4@citrix.com>
Date: Wed, 25 Sep 2024 22:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/alternative: Relocate all insn-relative fields
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-6-andrew.cooper3@citrix.com>
 <b0412697-d258-447a-9470-09590744c2c9@suse.com>
 <2b84b989-ec54-4e43-8c55-ed60cb5838a4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2b84b989-ec54-4e43-8c55-ed60cb5838a4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 6:54 am, Jan Beulich wrote:
> On 23.04.2024 16:59, Jan Beulich wrote:
>> On 22.04.2024 20:14, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/alternative.c
>>> +++ b/xen/arch/x86/alternative.c
>>> @@ -244,10 +244,31 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>  
>>>          memcpy(buf, repl, a->repl_len);
>>>  
>>> +        /* Walk buf[] and adjust any insn-relative operands. */
>>> +        if ( a->repl_len )
>>>          {
>>> -            /* 0xe8/0xe9 are relative branches; fix the offset. */
>>> -            if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
>>> +            uint8_t *ip = buf, *end = ip + a->repl_len;
>>> +
>>> +            for ( x86_decode_lite_t res; ip < end; ip += res.len )
>>>              {
>>> +                int32_t *d32;
>>> +                uint8_t *target;
>>> +
>>> +                res = x86_decode_lite(ip, end);
>>> +
>>> +                if ( res.len <= 0 )
>>> +                {
>>> +                    printk("Alternative for %ps [%*ph]\n",
>>> +                           ALT_ORIG_PTR(a), a->repl_len, repl);
>>> +                    printk("Unable to decode instruction in alternative - ignoring.\n");
>>> +                    goto skip_this_alternative;
>> Can this really be just a log message? There are cases where patching has
>> to happen for things to operate correctly. Hence if not panic()ing, I'd
>> say we at least want to taint the hypervisor.
> Actually, after some further thought, I don't even think we should skip
> such alternatives. Think of e.g. cases where in principle we could get
> away with just patching the prefix of an insn. Yet even without such
> trickery - there's a fair chance that the alternative doesn't need
> fiddling with, and hence putting it in unaltered is likely the best we
> can do here.

Following Roger's series, it needs to be a `return -Exx` and non-fatal
in livepatch context.

That said, the point of the SELF_TESTS, and the userspace harness I
didn't finish for v1, is to avoid (as far as possible) getting into the
situation where we can't decode the replacements.

~Andrew

