Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D2ABDEB9
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990927.1374857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOmE-000351-2n; Tue, 20 May 2025 15:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990927.1374857; Tue, 20 May 2025 15:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOmD-000331-Vq; Tue, 20 May 2025 15:21:09 +0000
Received: by outflank-mailman (input) for mailman id 990927;
 Tue, 20 May 2025 15:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHOmD-00032t-CE
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:21:09 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d95cd18-358e-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 17:21:07 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad52dfe06ceso458059166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 08:21:07 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cc7a8sm752504866b.171.2025.05.20.08.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 08:21:06 -0700 (PDT)
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
X-Inumbo-ID: 0d95cd18-358e-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747754467; x=1748359267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kdg//HoaOC+XVQF0Tuk3ZZfVypmDhwbCo/5NABwZuRc=;
        b=WH5b/ZKZyjNumpXhJY/gp7CaLHIJSQOYLCSPEkpvLaGvzTKEmiTRkVVGf6i05wr4Bx
         FPhs95w59/H3X1RIUakHt/YpPi8twJZjJCHX6lqT6WTh7i322IWMZX4oaM8pLBju3QCf
         8EF8X7mrxkOFT+lrMz+c7dDQPSzHz8vr1DV/46RSeY2qtmAULNgeqTNWZUf+Et3KC7Xy
         kAsJLdG8vk7OGgaWr15I6rwVWda6xGaIt2D31rspNEOktB5n/TMlStIeFHiiZ02OZnEh
         kqulvFHKUiS8ovijMW1CA9eCED4xgNzMaiO4uH3flnouy/1fjtbNGiHSselFhxJuWiV/
         jhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754467; x=1748359267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kdg//HoaOC+XVQF0Tuk3ZZfVypmDhwbCo/5NABwZuRc=;
        b=WGhUAjih9LSH22YtbLXrsaC2IReTp4JMyNioXiNBrSBfvRT3JJI+YGHSGuuY1+dGqU
         4/jl5PDFrqd2c4+rQpBZAuheGQi0IlM2F7I6t0qLPjis96youfutrmAGitbKi3rY7vZa
         yrAemeWAtjRIxgJh+zqfwPoMBnH8DXclpWeBLxOOeQ6D7KafXO8CwVx/HZj39trAkmYM
         J/B/fiYXFJj3gNobhchfzdLSS9y22ZBM7aXuGVtZ4jKyTGZbJQblwnyVB5bRX9dQkSTL
         w668gSLTapPVaQ0Q+gdrVIY/4HUUHdTy/AOiiYyVc2ygmKeWo/PwJAcR9E4BRWwD6+EJ
         wcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWevxjze3UjzbJ56aIReIL7YsLGeqVDpm0UBTxepG5bzgyOcR4+sQ38oaWiSkUfB89Z/eeIhfOlFsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG+Z7CUBuOF7CUC4rlCiBI8hIs7Ej9jOf+RUsiAoCrSuS86y3W
	PumWpoXc0jLev7WShDYRLohARA59Z96k6u4aooHStGEtLr+sP4II1jFF3hpDVkCxOQ==
X-Gm-Gg: ASbGnctNCHqDtApAk4OD2dengHgarC1Egvy/FgF1611jWIF5czc1Pc+IMv/xc5vnPZx
	YsO7LJclFabSxoHxd7grT2Qjf+1n/9rYUzQS7vF3RhFldYLl/yR7w6dhSz05KCBQs8FoC590uj0
	qRdQr7DfAU+7CCbYnpkhxjOjhct3h6QH2hWS+zft34raJ7HIxaoSQDx4vxTk/625mP80VWd9Wa4
	eXWMivOq8TKBGopXDQJoeMIoLGipZlmA3MRXnYM2Z18KOTsRzn4IJqRn299ljxg6K+sEhd01vNZ
	hM3gZPfRj3gFlaeZKl9MeB8TwD8FMbsLcWwfsjwuGqzv0ScII5ed4Ghwkm53EQ==
X-Google-Smtp-Source: AGHT+IHajIpu5O6FJVFyzn/erJ/X8l7jYcg4NYHQIz1YhsTYD3IOgrbm2C5PDlKft6diDJ8wrNbaAA==
X-Received: by 2002:a17:907:7fa1:b0:ad1:e7f0:d8e5 with SMTP id a640c23a62f3a-ad52d4b3b69mr1819789266b.16.1747754467398;
        Tue, 20 May 2025 08:21:07 -0700 (PDT)
Message-ID: <effb68bc-003c-4db2-b05e-5138142e5ec5@suse.com>
Date: Tue, 20 May 2025 17:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/domain: introduce non-x86 hardware emulation
 flags
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-2-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516022855.1146121-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 04:29, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Define per-architecture emulation_flags for configuring domain emulation
> features.
> 
> Print d->arch.emulation_flags from 'q' keyhandler for better traceability
> while debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped comments
> ---
>  xen/arch/arm/include/asm/domain.h   | 1 +
>  xen/arch/ppc/include/asm/domain.h   | 1 +
>  xen/arch/riscv/include/asm/domain.h | 1 +
>  xen/common/keyhandler.c             | 1 +
>  4 files changed, 4 insertions(+)

If every arch gains identical fields, accessed from common code, why would
those need to live in struct arch_domain?

Jan

