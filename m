Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F7B0F1B9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053828.1422617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY4c-0005Ue-9I; Wed, 23 Jul 2025 11:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053828.1422617; Wed, 23 Jul 2025 11:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY4c-0005SB-6f; Wed, 23 Jul 2025 11:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1053828;
 Wed, 23 Jul 2025 11:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueY4a-0005S5-IY
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:55:48 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7ecbc1a-67bb-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 13:55:46 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so7710925e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 04:55:46 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458691aaec8sm21597705e9.23.2025.07.23.04.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 04:55:45 -0700 (PDT)
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
X-Inumbo-ID: f7ecbc1a-67bb-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753271746; x=1753876546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3BKhdwqZZCcimM62EGtthz1EOZ7fdsj9VYznIBKvZcg=;
        b=Pw05iu4OW0C0NwTb2BoG7+vP8NGr5n/GkM+tj7+eBREeo4nlj3ak0uIyLseSaQEvxB
         xkRwNmQHSR03lpcOem1izIwTnvGUkPC1kBpRXOkOEGdI5xLUn3UkVWpxcOUFbjiSxH9A
         x7No+/S9cbDkV4bpXJMyzjmyfP1SUELaLlcNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271746; x=1753876546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BKhdwqZZCcimM62EGtthz1EOZ7fdsj9VYznIBKvZcg=;
        b=UlB6koBQb+rxm8lDFD1m5yYXKPJ5R5Hf8cwJ7yTGiUAGOetzd3WhUUQZNVO+P2GC++
         NeU3yMY0nem8x1niAM5RbRNG7p5zd/CABBB3OMJg6OVhFFShDkcupDvANPGsG5z2BWdV
         BrUdqFcMA6Q9MdC2UqSjezCNxhlWgnpsKEZyUQQu2z3/W06ob1lZkD/aaQOFTue3RGaZ
         Cb6n0klfakAkrxHbKOrIUij4Jq1M1jaFSB/Qkz7O2oZG7SsPz4rtmWdkNByGRlbWytLf
         HR6ntFV/ZcRVVzIM27t1nXfA2mLGKaJofw5x/SYZyq40KZfvKNfvGU/E7L9teWjK4k8I
         CexQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwWd/qn0WPXyH2y4JrZP4PA3R+8bSUvCRw2iiu4rL6FJ0hkTwLC1RUGEjX/xatYqQ8sg4HMugtYrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyk2qJYyTX1gMVRSPvY64dqoeI0R1EVSWgYsiKOPlqLThCdaVus
	YeCvPUbXzpJX6FlcfOeG0xwCYPmkvFuy1zsFgv+40+pJn3xtpRdMq+kGHWRLNXrkzIs=
X-Gm-Gg: ASbGncsc/TWpnd4QQUSUA4XmVVpzeF7SP0leNp2MJ1UF6x9PNqSBZdla0gqhZPDoij0
	Xgnqe9/4z1RLVvutpNoRM/RiAhiMG4LXAej/dtlbj+LuA+HrMplz1tLOu2OFFw2oYSMcFxHef6Q
	6+lLLdA2XwTKKplr/+FLRerM9IlTA4Ff5fNi4Jm71HqNXZrpTlwtefMcaL7ptj2YnlI11FXAhiG
	ZVZybOi07wxeoxovJU2bT9vntwqwGfD8DYGOrkcOptXw7/Reg2N4xN+mGF7djFiFFOmC7wlibcv
	Vf1dbWtzbpYe8J3l0F+eBrnVQ5yszv7RAB2zBg0+F5Xl9B2lWoKjhwmcuMklfrcw+cxTPq0lLgd
	HIIjgFEfV40AQdmyK1BXqD/T5JpwShjmCYeaietGgW5ijIxpiwXyZUR0dbV6xBVJcbBHE
X-Google-Smtp-Source: AGHT+IF1rKCXEuULHTQeYCVAm2DMEek5P3/TeSHJAwox9/s3+CJ51PqagghUFdnuISW+jWulM5QmAA==
X-Received: by 2002:a05:600c:2044:b0:456:12ad:ec3d with SMTP id 5b1f17b1804b1-4586277488bmr52871215e9.14.1753271745960;
        Wed, 23 Jul 2025 04:55:45 -0700 (PDT)
Message-ID: <eaafcb47-7ad2-4c54-a6bc-1c47abbb5c77@citrix.com>
Date: Wed, 23 Jul 2025 12:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Always flush TLB using TLB_CTRL_FLUSH_ALL
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ead69886558e6c18662a4755f4a11382e66fa810.1753193439.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ead69886558e6c18662a4755f4a11382e66fa810.1753193439.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/07/2025 3:20 pm, Teddy Astie wrote:
> Xen currently uses an ASID scheme where:
> - ASIDs are cycled where a "TLB flush" is performed
> - When ASIDs wrap around, perform a full TLB flush
> - In exceptional cases, stop using ASIDs
>
> However, the TLB control mode used only flushes the current active ASID of
> the logical processor. Which mean that will supply "stale" ASIDs (not flushed),
> because it hasn't been actually flushed (TLB_CTRL_FLUSH_ASID only performs a
> TLB flush of the ASID set in VMCB).
>
> This affects CPUs where flush-by-asid is available (Fam15h (2011) and later).
>
> To fix this, always flush all ASIDs even when flush-by-asid is available.
>
> Fixes: 64b1da5a2fcf ("x86/svm: Use flush-by-asid when available")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> This patch has been sent first at the security mailing list (security@xenproject.org)
> which asked me to publish it publicly due to it being actually safe in practice.

Having talked to AMD, we believe the algorithm Xen uses (and has done
since it's introduction) happens to be safe for microarchitectural reasons.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

