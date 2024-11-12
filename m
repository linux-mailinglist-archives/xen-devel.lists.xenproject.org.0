Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31829C550F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 11:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834355.1249979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoad-0004kI-SR; Tue, 12 Nov 2024 10:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834355.1249979; Tue, 12 Nov 2024 10:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoad-0004hJ-PC; Tue, 12 Nov 2024 10:57:43 +0000
Received: by outflank-mailman (input) for mailman id 834355;
 Tue, 12 Nov 2024 10:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAoac-0004hB-TH
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 10:57:42 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edc99eea-a0e4-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 11:57:37 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cec8c4e2f6so6552112a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 02:57:37 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb7fcasm6093636a12.52.2024.11.12.02.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 02:57:36 -0800 (PST)
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
X-Inumbo-ID: edc99eea-a0e4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVkYzk5ZWVhLWEwZTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDA5MDU3LjYwMDY4OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731409057; x=1732013857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6UcTBSXAx3PKE0e/FmnBYsAf3qSMpifSzX92eXRQCAw=;
        b=SkAA2kqYEMkvuiwbgyiJPHH7TLA44CIykgNbqx1HB2plyGWiuY641SQ8gfGnsmB1xF
         f/QwP+s56+LaNsgCReVdcswx6BVTQGuPxoXfLFIIk1XRYXqykn/1N0/DUWiIs0b4EnJ3
         6jdwz8pqvDoS10eeuVkbY5S0lPL0r+qwNULUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731409057; x=1732013857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UcTBSXAx3PKE0e/FmnBYsAf3qSMpifSzX92eXRQCAw=;
        b=EXRv3enrbEdwVkuxAJmby8kw8D/FCljQWshDorESL1yeFMaVJR2FgC5hLW57DFDhxh
         bNZDYP0cUq34UQRzqu14RFDlAfajO78pt3XtvqiL32EwXqrsE5P/a5L/wyV3a0HQYrl4
         jhpWpjdSVyc9w0XVF+03/5x+4sPkmLQhCW5mBFSijVgtjZyEwh11KIskljR3JcLOExaT
         AODYMeghd0U639Zhs+eK7ot25Bumwm3x4s8bL5xMsqp3sk/BuNen0IjuTrVjJoGL2xYp
         4+xZBSA9KjyHDVE+zGnyUMoj1F7Udvi32aSII3ghW/1P9kSbq9nYaWqdeen4yGYtPJph
         GwhA==
X-Forwarded-Encrypted: i=1; AJvYcCXpb0oUhWcM/qbvmL6tcwDDsR8KDaOzGWpjKnBNDZGH369IcoA5qnhZBNK4SbHWCr8umBdPHndPzQk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwffuUDoqK/NNPA6ePlTyDxjB3Yo4qUluvp2eiff29Yo1pWO7Ov
	TcnB7dm2XIH8z9o1m18cL/WU9FVA7qLyx2riN7kNyU3deYTKIbVJaK/b7wXpnLE=
X-Google-Smtp-Source: AGHT+IEwczYs7aBpaEpvQ2pEECZs66fYdWTHEsfED50h1Hq8TQZKZmaHi7CO9mdEztaBy4gHNRLoxQ==
X-Received: by 2002:a05:6402:5255:b0:5ce:de18:3fb7 with SMTP id 4fb4d7f45d1cf-5cf0a4475a7mr12238981a12.21.1731409056934;
        Tue, 12 Nov 2024 02:57:36 -0800 (PST)
Message-ID: <aae641b2-23e3-4631-98e6-454376ff3b9a@citrix.com>
Date: Tue, 12 Nov 2024 10:57:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
 <20241107122117.4073266-4-andrew.cooper3@citrix.com>
 <5aa29b23-cf22-45a5-b7b6-7e307a2238d2@citrix.com>
 <6d972a06-4acd-4b6c-b8e9-543a338d66ae@citrix.com>
 <3f0ad893-4a67-488d-a350-020fdef2ad1f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3f0ad893-4a67-488d-a350-020fdef2ad1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/2024 10:49 am, Jan Beulich wrote:
> On 12.11.2024 11:36, Andrew Cooper wrote:
>> On 07/11/2024 9:58 pm, Andrew Cooper wrote:
>>> On 07/11/2024 12:21 pm, Andrew Cooper wrote:
>>>> With the tangle of logic starting to come under control, it is now plain to
>>>> see that parse_blob()'s side effect of re-gathering the signature/revision is
>>>> pointless.
>>>>
>>>> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
>>>> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().  For
>>>> good measure, the apply_microcode() hooks also keep the revision correct as
>>>> load attempts are made.
>>>>
>>>> This finally gets us down to a single call per CPU on boot / S3 resume, and no
>>>> calls during late-load hypercalls.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Slightly RFC.
>>>>
>>>> Just before posting, I've realised that cpu_request_microcode() does actually
>>>> use the current CPU revision, and it's buggy, and it's the cause of `xen-ucode
>>>> --force` not working as expected.
>>>>
>>>> I'm tempted to do another series cleaning that up in isolation, such that this
>>>> patch becomes true in this form.
>>> Actually no.  Having tried a bit, I think it's easier to do with patch 2
>>> already in place.
>>>
>>> So instead I'm tempted to edit the middle paragraph to note that it
>>> currently uses the revision but that's going to be fixed shortly.  The
>>> rest of the paragraph explains why it's still safe anyway.
>> So, after the latter series, this patch happens to be accurate.
>>
>> cpu_request_microcode() does read the revision, but discards the result
>> of the calculation which used it.
> What's the intended overall sequence of patches then? With two series that
> (aiui) now have grown some sort of dependency, and with this series have
> gained a 4/3 patch, having a clear picture would certainly help. Might it
> be best if you merge both series and re-submit as a single one?

The order turns out to be as emailed out and threaded.

~Andrew

