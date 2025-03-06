Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FDA54ED7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903720.1311695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqD3L-0001E2-OQ; Thu, 06 Mar 2025 15:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903720.1311695; Thu, 06 Mar 2025 15:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqD3L-0001As-Kj; Thu, 06 Mar 2025 15:22:27 +0000
Received: by outflank-mailman (input) for mailman id 903720;
 Thu, 06 Mar 2025 15:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqD3K-0001Am-Ix
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:22:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc55dcbe-fa9e-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 16:22:21 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bcbdf79cdso5195885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:22:21 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb79cfsm2371007f8f.10.2025.03.06.07.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 07:22:20 -0800 (PST)
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
X-Inumbo-ID: cc55dcbe-fa9e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741274541; x=1741879341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IPQ35TqkoU0Z/YMA44V8bs0kfvQmDFCjA71bpBt2D34=;
        b=nm8qS5m1k4ZNyMmInVIuLf5IDZ1pd3A6f9gaFW0BbMytd22KE8KXu5PIvleY3lNG/i
         Vnb2oIt0IKm6KsIZG4aNllTFJXaaJwQA5KVkWOJx9/7Xzv8spMC67/5TTpOIyZrdGCcP
         t5J/M3sUZbH7lOhZH3xcpSHihGlHwIwBA9Cdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741274541; x=1741879341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPQ35TqkoU0Z/YMA44V8bs0kfvQmDFCjA71bpBt2D34=;
        b=Qy1Lx0e6c10hCRj00SdRohmfpdex0/kQB9CF+HNbi1V4xZU7+x1Np+5gy70RDcd5YV
         7HYovtaIPRMsGURlsaL44GeAb8bRME2fP3cSuaHulkuyIwa/phaT5s4x3xflWa+ericK
         JF2Tsk7zCyQpepMOG/L8WNu0sFay6izffv0TZf5VlzysMxKTvDpuUf7TmCef4u134q4E
         mF8/yTRpIdxDb/dZTZMRMfxDqqmmDLLNb3lq6seo62Rw5MAsvJrC/nPdIKvJcr3UHJlo
         PoqRb5wYfE1A6ywZw/zQ3di8/CX3GsGNw1dqnn39dtCdoG2LT+f2uT1s4Igs0s3aHrUd
         V5Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVuEKi8ACodsEnpONjbufT9nGeW6MzDs4Uh/gC8QSU2HJRzZKmKtElj3Xxv/b8txMjMBJpEWWnPOGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxW968C+Ul6EpMiu5YOgvwx9FR0HDQEiIE5EGsV9GTznEHNGL7e
	AghNf7ZK13eFPjTsg7GujNY17AJopqtCc4IfC7as8oOdnYRVtnEvffkTLy83V6k=
X-Gm-Gg: ASbGncvx/fHWtTRCyqyGrxqNHcqGTg8CGC+dvAfRmSV+zy3O+Oc9Nmh/yDqj9yjYucc
	L0AsEdLV1L0LrFzHah3dTBgQHXOUrXvy2Pn+I4l5w0l7XV5YC1j8Hix5tc4Cs3wwu15LEurg5jw
	/Aj+4sRInwIXnXgS5cgshzCsail7cmiaYUuUknPGq1CxwwgyJEscEYKQ2IxfLu0th5BnleTCIzL
	mKfv6KyJCTtLRQaDNfPkmoKWLvoUK/xH7l4qgN4pT4+TJ3Apw8PAmm4/AoX0QNpPJCnqbaPINIQ
	te29XEDOupyvAFbj2+mGoKb69MvJGL5VPtxGlpckleZ2gfv1Mf6ACbC97wCnqHZwteyiSk6p++5
	VRrStoOIm
X-Google-Smtp-Source: AGHT+IHNowB5/ZE0ZHWbpkouCgQePefDiVlCP33DaXM+BX57LKGgiCfPU+sStoDwvHVVwHnPqDEEwg==
X-Received: by 2002:a05:600c:548a:b0:43b:d025:76aa with SMTP id 5b1f17b1804b1-43bd29c4f3cmr53781515e9.23.1741274540680;
        Thu, 06 Mar 2025 07:22:20 -0800 (PST)
Message-ID: <d5419da1-02de-4e18-a1cf-e2aaa9d4f988@citrix.com>
Date: Thu, 6 Mar 2025 15:22:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/apic: remove delivery and destination mode
 fields from drivers
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250306145733.99927-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2025 2:57 pm, Roger Pau Monne wrote:
> All local APIC drivers use physical destination and fixed delivery modes,
> remove the fields from the genapic struct and simplify the logic.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/genapic/bigsmp.c      |  2 --
>  xen/arch/x86/genapic/default.c     |  2 --
>  xen/arch/x86/genapic/x2apic.c      |  4 ----
>  xen/arch/x86/include/asm/genapic.h |  5 -----
>  xen/arch/x86/io_apic.c             | 16 ++++++++--------
>  xen/arch/x86/msi.c                 | 11 +++--------
>  6 files changed, 11 insertions(+), 29 deletions(-)

Definitely going in a good direction.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

