Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D59F69A2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860542.1272558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvhk-0006Bd-Vt; Wed, 18 Dec 2024 15:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860542.1272558; Wed, 18 Dec 2024 15:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNvhk-00068x-SQ; Wed, 18 Dec 2024 15:11:16 +0000
Received: by outflank-mailman (input) for mailman id 860542;
 Wed, 18 Dec 2024 15:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNvhi-00067Y-VW
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:11:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5272a0c2-bd52-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:11:14 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43635796b48so6053205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 07:11:14 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b01fefsm23752915e9.18.2024.12.18.07.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 07:11:12 -0800 (PST)
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
X-Inumbo-ID: 5272a0c2-bd52-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734534673; x=1735139473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ESBXjJKdyeviMwknJZQygCKQt0UNyn+8eReM75yQv4c=;
        b=RCc2q0+9exQ3dNBuN2DbLD83wvukwoVwHQEEPUDK17/sZ03YRsyOOrwpvzC7Dq57Nq
         a8F0Xd+JOuYH3htV+NwzbPT3+aiRLIjIxoZ2xkxTZPeQY6OOHKTQ6X+kl9+3+xJv07NW
         eOrjTGyzmfEyFEzAQWzAzi9aASWirchl484uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534673; x=1735139473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESBXjJKdyeviMwknJZQygCKQt0UNyn+8eReM75yQv4c=;
        b=HXXugFqSllaL5JBNWw2VVXhZF2vRv8ThvA23RK9zn6KaasUVGGI2GvBiSoFMmASka1
         ALKzPJUw9cN+oLSnl52qmfjkkt4dDwAJbwFKgESd1kAoXjGIdSURGPCJEw1rn2iQNdPd
         eivdfYg1VXC1OK2EDt3Ma3Z5x5Li6Rtyi9EoA0M8bHAFmkbggh+0ZF880Ik+nhJZ9fPr
         dfkWZ2fMgKqKv25WzNqg3DJF7hHm215FWVTBy8FjtgQrwZtqBPA2f8qMlzhjiS1mBQmq
         g/iYKCuhcYssa5URBYpvn/QP1mdM/vmNKrGRzb8AzrKEGPTB2aTeaWJzylFySogvVW/6
         WfUg==
X-Forwarded-Encrypted: i=1; AJvYcCXjt4DRfTZVUuXg7wjNHOiLojfWkHygx3pVE9JIztWKnaesClUz3sOc9/wXbOQDTjJfKc7wChW/oxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaPlBdLwJVOko4ZAxdJMwaVVUBJjcXbNjoF/ODszkJlknp/tom
	Aw/h/xubEyyObnD44Fy+vmCbEla6dwClfXWzBZlK3F9PJGFzFDLPSULh6Yv40r8=
X-Gm-Gg: ASbGnctCGEf5w3TLjKqOf32cY7MvKgvHA49M3nJD0PGRU+MoYoYhHY6HNVLwUXs23FF
	MYl2pihTK6MuKsiUjuh8fn0r50Odxlltjs1ROZfQBPA54aDbNVEnVj7lK2hwkoEo+/GqrIyrPXi
	3IH2H1LBuf5Hh45MJxqZV65LnXsCOI7/M+YW2nWKvbGEBQ4O9CtoSVqDkKlyhlOftKthaMz76gd
	iBQkpo+v5A+AfZKVdhXku1m1o9wtQEJFqkHLLF3lfdNn27nDvoS/52aaOVPMEzd8KGYKz8Th8sz
	KqACxSVxq7jjNkXHlVY4
X-Google-Smtp-Source: AGHT+IEkXbYqqTzpwF8+hUdcb9z1RfX42EMnjNLzupu3pnyxOnZ/xbsl8qTb54brQ58lnD0Uvz+bdg==
X-Received: by 2002:a05:600c:4686:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-4365537640emr29113215e9.11.1734534673342;
        Wed, 18 Dec 2024 07:11:13 -0800 (PST)
Message-ID: <a23b9fff-7b27-4907-a35b-2ef16689989e@citrix.com>
Date: Wed, 18 Dec 2024 15:11:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: firmware: Add SCMI over SMC calls
 handling layer
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2024 10:11 am, Andrei Cherechesu (OSS) wrote:
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> new file mode 100644
> index 0000000000..62657308d6
> --- /dev/null
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> +bool scmi_handle_smc(struct cpu_user_regs *regs)
> +{
> +    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
> +    struct arm_smccc_res res;
> +
> +    if ( !scmi_is_valid_smc_id(fid) )
> +        return false;
> +
> +    /* Only the hardware domain should use SCMI calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_ERR, "SCMI: Unprivileged %pd cannot use SCMI.\n",
> +                current->domain);

Minor points.

gprintk() already renders current at the start of the line, so you don't
need the extra %pd.

I'd suggest simply XENLOG_WARNING "SCMI: Unprivileged access attempt\n".

A double "SCMI", and trailing punctuation is not useful in the log.

However, I'd also suggest using gdprintk() because this is guest
trigger-able and not interesting to see in a release build.

> diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
> new file mode 100644
> index 0000000000..57cc9eef86
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/firmware/scmi-smc.h
> +#ifndef __ASM_SCMI_SMC_H__
> +#define __ASM_SCMI_SMC_H__
> +
> +#include <xen/types.h>
> +#include <asm/regs.h>

You can remove the include of asm/regs.h, and simply declare:

struct cpu_user_regs;

here.  Nothing in this file needs to deference the pointer.

~Andrew

