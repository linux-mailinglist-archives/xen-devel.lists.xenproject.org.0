Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E9AC059E
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993023.1376473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Jd-0006Mg-Mw; Thu, 22 May 2025 07:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993023.1376473; Thu, 22 May 2025 07:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0Jd-0006KF-KR; Thu, 22 May 2025 07:26:09 +0000
Received: by outflank-mailman (input) for mailman id 993023;
 Thu, 22 May 2025 07:26:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI0Jc-0006K9-0t
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:26:08 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05ff9608-36de-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:26:06 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-601dbd75b74so6862873a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:26:06 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e637dsm10291631a12.43.2025.05.22.00.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:26:05 -0700 (PDT)
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
X-Inumbo-ID: 05ff9608-36de-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747898765; x=1748503565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbZM+QuaQvX+gygVGE/ecAx0nAKkgKv/oaZIxVbXDqQ=;
        b=IOzEvGzPKWSRa/kY7iPxUrPMrdk8c/FaQuxyWTjjUfhAxfDtL0wsrS6IzMqoOC7rMi
         QW15xC5Uk+U/fbVIKDkS8dtVllswdcSiec3jKYoAV1WQOwkwo0qlQjIsZnFWV3MPNkzX
         QsKS2v58FzKtOJnUaxnTOY7r6DpdHgZPvD1dGPiCMjk/0tMewUtFsViVJjWxghyQM8zJ
         VeNpBoQa1dHQ7A3zEu+wgUxT9o3G/imbQKOH8FzSM/T2+N+09XH7m4W96QJEX6kvEsZT
         6ozTnom2KQMvug33CXd5vRzoyllLmVqNV7bgw8tWah9ZeSzKnBsKExYl2v3mkz9jMAJk
         kS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898765; x=1748503565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbZM+QuaQvX+gygVGE/ecAx0nAKkgKv/oaZIxVbXDqQ=;
        b=OvJgNdNnx1ZcdPCnZVncaLpao6NPs/EtqNnahp6RKQH3q4QHCRXFn/FV9zSAZ5KPCM
         Y/s0qZNIq99W/vnrxag7gPZwJQmuppmhsX0tQJctK3XVveV9aPYvYP8Lb6zotbiEm1/D
         ApiAek6rZy85CEz5fehs56UHb0tcFSIOJ3aSCq2zRQZR8WJ05il5dTGn0dTTMxtBZG4H
         Q5TVy/Ti+S3m8aPK54NBb00ZtIYtNGr5oztrue6loDSiN64rohyHP26h1xKJQAMy4+hp
         R2Ad6V1LKOtM6k0HGcfetqYc/okDu5Ybn8YY17DJDghqArz/t7lEENbjQ6mmDkf5WfgA
         v4OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVROfKeZ8CuVfmEMRHvUAT59KOcqvwzWcKb4nBA3kmORD7c6keRYTdGFST38fTfUqAf2mA9prVFA28=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYbAb1XaKTFLAQATKICB21a6giWEGbUDQzFQ58m7t9LhYjmQR+
	92YC7+s19f8FCvYcFwptOLprteV4fPTK7I2ByOrQuiCTcnL6FA8d1B2WRayYEfc/0w==
X-Gm-Gg: ASbGnctAHLLotuRcipUeTeDlOBjX1JYo2Z944+I3QoUKFnqz6x6A7CQWIGQoljX6tnW
	P8FrEb/nmmZhuPSu7QPJigwtPw2Y5+m8nDh7U12sNLcpQWpZ1zNaungbGxbSIJD3sGzCIebE0k2
	+E6m0ofyKB3bAESOfR4bul5wIK5RG4t5RJSMuqMXpsLNeJCQ3FWrJXlZrTJGDLYfVl5oGgt+SU1
	sNnCEv5THu2a/xWR5Y8c51kSBH2P7sTlCm1NXLg4nHVW+zc3FO0TntytMdMaF199lGA5cquxQBt
	kR1cndcvOhI9ggxfqJc9FnSomkpxrSu+lxZpOtTv7RJpkdNtAFkqKqgiNHSyZA==
X-Google-Smtp-Source: AGHT+IFVxBhZuXZ1CI0vYz9ek/esarR3ttsOcco8NqT8KgK2yzY0s88AarG/NKhcgjaNwdLM6gqWnA==
X-Received: by 2002:a05:6402:d74:b0:5fd:c426:9d17 with SMTP id 4fb4d7f45d1cf-60119d2305emr17422949a12.34.1747898765517;
        Thu, 22 May 2025 00:26:05 -0700 (PDT)
Message-ID: <3eaba65b-5b36-433c-afbc-ed17886916a9@suse.com>
Date: Thu, 22 May 2025 09:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] xen/riscv: introduce support of Svpbmt extension
 and make it mandatory
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <f1c19b5dec9e00b112d97324d582191fe127eb83.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1c19b5dec9e00b112d97324d582191fe127eb83.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> Svpbmt extension is necessary for chaning the memory type for a page contains
> a combination of attributes that indicate the cacheability, idempotency,
> and ordering properties for access to that page.
> 
> As a part of the patch the following is introduced:
> - Svpbmt memory type defintions: PTE_PBMT_{NOCACHE,IO}.
> - PAGE_HYPERVISOR_{NOCACHE,WC}.
> - RISCV_ISA_EXT_svpbmt and add a check in runtime that Svpbmt is
>   supported by platform.
> - Update riscv/booting.txt with information about Svpbmt.
> - Update logic of pt_update_entry() to take into account PBMT bits.
> 
> Use 'unsigned long' for pte_attr_t as PMBT bits are 61 and 62 and it doesn't
> fit into 'unsigned int'. Also, update function prototypes which uses
> 'unsigned int' for flags/attibutes.
> 
> Enable Svpbmt for testing in QEMU as Svpmbt is now mandatory for
> Xen work.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


