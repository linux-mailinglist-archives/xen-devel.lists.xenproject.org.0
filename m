Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1981A537
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 17:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658175.1027248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFzVs-0004Cs-VR; Wed, 20 Dec 2023 16:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658175.1027248; Wed, 20 Dec 2023 16:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFzVs-0004A2-Sk; Wed, 20 Dec 2023 16:33:40 +0000
Received: by outflank-mailman (input) for mailman id 658175;
 Wed, 20 Dec 2023 16:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WYL=H7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFzVq-00049l-Pf
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 16:33:38 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 862e4f63-9f55-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 17:33:36 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1517012f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 08:33:36 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h18-20020adffd52000000b003366af9d611sm7344440wrs.22.2023.12.20.08.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 08:33:36 -0800 (PST)
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
X-Inumbo-ID: 862e4f63-9f55-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703090016; x=1703694816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2n2ISEPUBB8lidZsJ7at41/6CfeyELW3PZfKA99iEVs=;
        b=MNC4bBtGwzFdEBV+fiyBJJlZpVnLsgrnPtjGBHw2W88AEaVTyJ7m1LTOV9RLd7ao+Z
         mBjTN7xnzzxP7e9PsCPm2yIcLyUg4fvR0z8nOuo62ZUjsQ2Bv/JCBmEyq0OEQcoqD/QE
         kosD0E2za+DkDr96L+oBN7VO5I3qCCWXn+3QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703090016; x=1703694816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2n2ISEPUBB8lidZsJ7at41/6CfeyELW3PZfKA99iEVs=;
        b=ZsFC0l9Bxf6wNfaOWOyEUbnx+b5Mdb0kJ4D3TwLYAhzVAZj6dcm4wSe25D4eGo69a0
         wm2NVxXEPruYZNqrbKpx7vWW9Rngo2qKhAlk7Om98slkpwZuxRRm0ROETyLlc5/0nPMl
         Qopx3Y4eJxa/l1gUwvdVoQ2A+rZa223KRYxl3vgejGqWbhOd51KgIDYUyETXw3NnQQp6
         0MMh06C19Dw8Cq8Xnk0SbplWeo/DiQtlJ8nLBVM7TcHDAoMx4oPkkPsOKR8Iv9WRKi8i
         DgBcFbOg9cIY1kWbSrQvXhdVtpYk6jXJ7OMVms7+I8KO6QLLo7NehyZ6faD4IUkdMj5X
         KuTA==
X-Gm-Message-State: AOJu0YwSyiefBkwUMnIuRGscwtJplScLS1r/TVuHGakF3O0sU8t4IUmN
	EwoYctCEJS3K9nT0EmkpZvT+UQ==
X-Google-Smtp-Source: AGHT+IFpt0nwweaiBKIT3PmDnJuKlwFaP+lgYYMYNUyMojp6mP6vr3fPggmdzEVs2jMOhV4SzBkSaw==
X-Received: by 2002:a5d:690d:0:b0:336:7f02:6e6a with SMTP id t13-20020a5d690d000000b003367f026e6amr426317wru.61.1703090016263;
        Wed, 20 Dec 2023 08:33:36 -0800 (PST)
Message-ID: <a4dccfb1-6bbf-418d-b8c5-1e99c75d1b64@citrix.com>
Date: Wed, 20 Dec 2023 16:33:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2023 2:08 pm, Oleksii Kurochko wrote:
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-generic/monitor.h
> new file mode 100644
> index 0000000000..74e4870cd7
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/asm-generic/monitor.h
> + *
> + * Arch-specific monitor_op domctl handler.
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + * Copyright (c) 2016, Bitdefender S.R.L.
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_MONITOR_H__
> +#define __ASM_GENERIC_MONITOR_H__
> +
> +#include <xen/errno.h>
> +
> +struct domain;
> +struct xen_domctl_monitor_op;
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on GENERIC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);

Turn this into a static inline like the others, and you can delete:

arch/ppc/stubs.c:100

int arch_monitor_domctl_event(struct domain *d,
                              struct xen_domctl_monitor_op *mop)
{
    BUG_ON("unimplemented");
}

because new architectures shouldn't have to stub one random piece of a
subsystem when using the generic "nothing special" header.

Given the filtering for arch_monitor_domctl_op(), this one probably
wants to be ASSERT_UNREACHABLE(); return 0.

~Andrew

