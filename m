Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5107A042D4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 15:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866409.1277739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAlc-0001Xc-3t; Tue, 07 Jan 2025 14:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866409.1277739; Tue, 07 Jan 2025 14:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAlc-0001Up-0d; Tue, 07 Jan 2025 14:41:12 +0000
Received: by outflank-mailman (input) for mailman id 866409;
 Tue, 07 Jan 2025 14:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJXC=T7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tVAlb-0001Uj-BO
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 14:41:11 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f17c7ee-cd05-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 15:41:09 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385dece873cso5849133f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 06:41:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4d7sm598932225e9.34.2025.01.07.06.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 06:41:08 -0800 (PST)
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
X-Inumbo-ID: 6f17c7ee-cd05-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736260869; x=1736865669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZxbVhDdkRSxrvbRhEhdp/w6Gmm99GNwUld0zkWBH74=;
        b=Wyi1ROoBtH+7PxDQgrHUQ0QtJ6UykjFBWYpwubZsobNt+dyhDB8ZZO53tBde+nQbV7
         An5Wkk/G/o6SOp1syBbUbPgFTczsPoCnFasGV1UPr/qXJitfdRxa0npXK2pSqhQHZJQ5
         0iuHfk7lAMtk6BM5JZfpETWaDg4ejcooZr8QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736260869; x=1736865669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZxbVhDdkRSxrvbRhEhdp/w6Gmm99GNwUld0zkWBH74=;
        b=H9yuZUHOAtEsgOzgwW+vZOVQwmD8H4AHu6BaZfHzq6fl1SWx2T50E31MnYbHVGemSs
         IduA/McqM0PnPLHikNIAyWaEzpeVAQm5XOD8Kpu1FwQehyD/pwjsF6sM1YOoy7IVDpIp
         Prb2mycTY3ZCriquiKG63xkY9kOxHv8Z02cBNimkWRqvJJ3D7GXBybFlH3I2l/bqQSXi
         W+PM5fXgflA5Je4ZTEEOfp2X55sYN9ljPwDHEa3z4EL7nEkuAC55i7m5Em2kultgyzth
         fVNjw+PVaFT36Xdi7Eh/LnqWOFVBYf3omOzPIP35yHJ8GHhi+UH4AtCHRsOdAV/+gDlY
         C6Zg==
X-Forwarded-Encrypted: i=1; AJvYcCULACiH6/L/yM3fOp7BgAcvr8wnIrrMDFi9GEdFIgNzeo4xZnkjyI8sRql3igdJWjGI917GgZZgZWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE2RboIO3chqj0WnTm//rCVLwwrImSfaHJ6s0XpYKPh9H5Tl9t
	goH/Cvxb3ZCzTaVIotI6ZBYn4ykoLnL/ebFPmxKc7OpmzkzoBNP38rAPaT0Udco=
X-Gm-Gg: ASbGncvN/4623uAWYUOJA4e2UlDMvLF8sMc1E1gF4U2prF64GI8wBWDpnqNkIHLrJw7
	AwNdjQuEHsNLvdafJ/Mb09zCxb3GONPNF0ffp9X3cbpYluQ8NFsSYMCSrkUHdrNcNljP+cqsDCv
	2l6sdC9+0LxZuPMUdOj2TUEA4RxD7jzWBdFEsxZf2k0XoiByAtWkkSbI8uVD8oM+cNBkKYCts7E
	kqLBYxtoIPrjkPrn+ARQzUey0JMUWH+UTyxZ1R+rDdehi1rPL1QCvYrFlJve0uWx4UORGCLUYHF
	Aj+7EkqErt5a9nW4I9cI
X-Google-Smtp-Source: AGHT+IEvAbHNsN288w4MrIHxN7go0dzUJnHRsRd43qKA01D9UuWwNLnGxNgF5k2YuzXhhnpxE/DfcA==
X-Received: by 2002:a5d:64ad:0:b0:385:e67d:9e0 with SMTP id ffacd0b85a97d-38a221ffe1bmr49349107f8f.29.1736260868999;
        Tue, 07 Jan 2025 06:41:08 -0800 (PST)
Message-ID: <7ea74155-8b86-43de-9e98-cfea071c1d99@citrix.com>
Date: Tue, 7 Jan 2025 14:41:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: VCVT{,U}DQ2PD ignores embedded rounding
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <238beefd-126a-4a2d-99de-dc5675c88ef6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <238beefd-126a-4a2d-99de-dc5675c88ef6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2025 2:32 pm, Jan Beulich wrote:
> IOW we shouldn't raise #UD in that case. Be on the safe side though and
> only encode fully legitimate forms into the stub to be executed.
>
> Things weren't quite right for VCVT{,U}SI2SD either, in the attempt to
> be on the safe side: Clearing EVEX.L'L isn't useful; it's EVEX.b which
> primarily needs clearing. Also reflect the somewhat improved doc
> situation in the comment there.
>
> Fixes: ed806f373730 ("x86emul: support AVX512F legacy-equivalent packed int/FP conversion insns")
> Fixes: baf4a376f550 ("x86emul: support AVX512F legacy-equivalent scalar int/FP conversion insns")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

