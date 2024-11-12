Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D399C5410
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 11:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834320.1249939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoGC-0008B1-FZ; Tue, 12 Nov 2024 10:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834320.1249939; Tue, 12 Nov 2024 10:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAoGC-00089X-Ci; Tue, 12 Nov 2024 10:36:36 +0000
Received: by outflank-mailman (input) for mailman id 834320;
 Tue, 12 Nov 2024 10:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAoGB-00089K-GR
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 10:36:35 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9fb4ad4-a0e1-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 11:36:29 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so62488331fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 02:36:29 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a184f8sm696678566b.15.2024.11.12.02.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 02:36:27 -0800 (PST)
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
X-Inumbo-ID: f9fb4ad4-a0e1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzEiLCJoZWxvIjoibWFpbC1sajEteDIzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY5ZmI0YWQ0LWEwZTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDA3Nzg5LjUwMTY3Niwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731407788; x=1732012588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5N6mUBfnjANcbqqKZi3hpTQhpUm/LDFiBxo4h1NI6SU=;
        b=QW+ZkDn4tZ+1l4/8QtSGX4Vf2PjsBxLbWbrryOogiqItMpzb6aZuMVmQLvzODeNxBu
         /h1O4R6SBWxOxY31A92SAt8kwFtRnsWI6FSFDaFKNT5sF547NgGahVV3EB4tpPk4/H1p
         c/hcYkypaxJcy9O5FixLC+ehyuNKFYlYbPVLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407788; x=1732012588;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5N6mUBfnjANcbqqKZi3hpTQhpUm/LDFiBxo4h1NI6SU=;
        b=RTE8hsOATFTP6Zf79PayzfZrpOtDdPCTTWF2VusTt5GBP5i9LS88gBbsQEc2pyjVW0
         xZXO91bAmeLnDRxafK0t81XjnaaZ1xrEhXeGFPv6Sat9lC8ppeQxbcAac126rpiTQ9zu
         clYbGE2x9AgWvjc46ABwOgReonC0wJdWgwsiHTBj8sLANlG/7BaPYNXcZt9ZxI85Eh4G
         /CRtKxTxDxpuMG3lts1xvcmiayUxoKQih7kwcd+4hEcuyqsuGmEdakx5fYVndpnoIH0s
         NYJz/o8sdW/m2RZ1xAA5sURFVYKa1GjcJ7UoRWmjRiEqDpz/NxgwYijPT7RyV0FmY8uX
         6MDA==
X-Gm-Message-State: AOJu0Yxwn6HfPEmh/DrVz/lp/PgSUX+8SrTG3+DGfOZOK0p747MNLlvs
	WPTh3LsJaTWgNYNR74zJEEMaLMS/mkfNrQVL+w7R26h6Vi6R6czqGM7ZSlx00gRFF51++zBDKcA
	V
X-Google-Smtp-Source: AGHT+IHUIp++kgaxv0hcJMmmRcWurIDhfOgc4Fx6tIZY6ldnHMJMkX4LQOHvyXo5A2JfdgMLVfK/Jw==
X-Received: by 2002:a05:651c:b20:b0:2f7:7be8:fd89 with SMTP id 38308e7fff4ca-2ff2016262fmr114694111fa.6.1731407788175;
        Tue, 12 Nov 2024 02:36:28 -0800 (PST)
Message-ID: <6d972a06-4acd-4b6c-b8e9-543a338d66ae@citrix.com>
Date: Tue, 12 Nov 2024 10:36:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
 <20241107122117.4073266-4-andrew.cooper3@citrix.com>
 <5aa29b23-cf22-45a5-b7b6-7e307a2238d2@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5aa29b23-cf22-45a5-b7b6-7e307a2238d2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2024 9:58 pm, Andrew Cooper wrote:
> On 07/11/2024 12:21 pm, Andrew Cooper wrote:
>> With the tangle of logic starting to come under control, it is now plain to
>> see that parse_blob()'s side effect of re-gathering the signature/revision is
>> pointless.
>>
>> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
>> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().  For
>> good measure, the apply_microcode() hooks also keep the revision correct as
>> load attempts are made.
>>
>> This finally gets us down to a single call per CPU on boot / S3 resume, and no
>> calls during late-load hypercalls.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Slightly RFC.
>>
>> Just before posting, I've realised that cpu_request_microcode() does actually
>> use the current CPU revision, and it's buggy, and it's the cause of `xen-ucode
>> --force` not working as expected.
>>
>> I'm tempted to do another series cleaning that up in isolation, such that this
>> patch becomes true in this form.
> Actually no.  Having tried a bit, I think it's easier to do with patch 2
> already in place.
>
> So instead I'm tempted to edit the middle paragraph to note that it
> currently uses the revision but that's going to be fixed shortly.  The
> rest of the paragraph explains why it's still safe anyway.

So, after the latter series, this patch happens to be accurate.

cpu_request_microcode() does read the revision, but discards the result
of the calculation which used it.

~Andrew

