Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297FB8B760
	for <lists+xen-devel@lfdr.de>; Sat, 20 Sep 2025 00:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127131.1468246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzjRC-0006bF-JL; Fri, 19 Sep 2025 22:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127131.1468246; Fri, 19 Sep 2025 22:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzjRC-0006Yj-GW; Fri, 19 Sep 2025 22:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1127131;
 Fri, 19 Sep 2025 22:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzjRB-0006Yd-3x
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 22:18:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98272faa-95a6-11f0-9d14-b5c5bf9af7f9;
 Sat, 20 Sep 2025 00:18:40 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so1241595f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 15:18:39 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f1550f890sm1219235b3a.94.2025.09.19.15.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 15:18:38 -0700 (PDT)
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
X-Inumbo-ID: 98272faa-95a6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758320319; x=1758925119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=baPEA6cf+OKNa1p61wS3dSmn5pKTAbVkmCQSRs6VlJ4=;
        b=PvhiY81Q3YN6GxETETQVB8TJrjJvwa/aE6unl0oqKzWNyL2C7xydmfa2bwh0AVjqjf
         cScQl2hBuQVlk/r/8UCOu9L1SuNKiYNfs5CferInASkcKjOtSjFOQBD/Ou7ylj68FvXY
         31Ml0HWMi28iRDis6OZEO3m79KWlbwoUVW1bKvFfqAsOXLLTgRXSbNBHN3ctzzwwC/Ty
         HqQYjQl59AFnFwmQ6XbWMPajWBmjN7GvLvLdZOzWJsyEJyUnneRXz+lrPMYA3XByibzz
         ftnPVf2CUVNZc9QRdgL6KE/Aj2197PujxcAisDJYpfCQJV1kTBNGDxyogXKYlIS54Iu5
         Jbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758320319; x=1758925119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baPEA6cf+OKNa1p61wS3dSmn5pKTAbVkmCQSRs6VlJ4=;
        b=m3MDchTAbV+Dg7gYoFtKM0KRu5l2xfSlpCcIZj6MnORxZLQhPI8FKgXTZoc36mHLPo
         mUS01/J4EwSenOiSfxeBTym6OrkPvmrMSEdiOfg9mDYkdRrteDhZG2TQ74FUo56uBPgt
         FeJ6M6TFNxEL53gEF0qELF2KRT8n4NXjkD4RYE3gqhYXH5WkJgi6bGPjSxAUH1xP2HgX
         PhLal7oNn4DYX4DPOR87XO4ntWvTrWrbQaJJwmNx5HggOW/fCVJkFbdUSmSPiSjpdbL4
         W4ji0mKTIXi0O/L0ViczrBuoNC7C7qzogqgZqCuCvsk9oEXQAZbrVXKbVtY5NVc9uUrH
         y8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1zRokcwvJiAoxqHb4hak8f7Yz70Hr5u0CFONDdezCQZV7kVOoBcjtPTcn4Kh/jJH9ompjYMhJzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQHh+ddqUnQ8YUvPm+73BpQl2WTXHrelfTY2E/YB1r5apBiIOQ
	LXD4iE3eOxXd95Qjv+clIzo0MWnwHndqfrhjF4aSeU6v8tVVPaKkO8qxEpMZpo+qLw==
X-Gm-Gg: ASbGncumF4t6ERdvZiYQHA7kcbI3dtOPj50z82fdgjjU/BqmfCbla6rzwx7IF29jNH5
	Hugo2XLHB6fVuKPSZrbtO3DUMNlIyDOfQj5HgpaZONxhtRKOq7f0LFEoSK7Y35Ye+BPwIsTkGW3
	YjN5EgkKTrUDBAJOhA6KDzhO0VFirN2rPhGjZZuXxVL4ETBmOZcwLLgO/HrZdC+zvAQgpEHOYO1
	JVTaH9n4ZXhR281AhpzOS7LDeMR1oaUydC7R9p841FpWJ0QvJE/qowU/Ga2vZ6nFK+ZIaIJ/o5X
	4x7YTISkzXJQoLAXPnj7v/Qnu6iXt5+a1eo5D8l8V5xg6elx0ZglxiYpi2qU9kAjDXLZkAIx/Kn
	J7gl1v/DnYjm7kuj+xJnQY0yDNPrzR+cN07v7raN0px0=
X-Google-Smtp-Source: AGHT+IHtHES68iwcfr3MwCv3K44afpRZswTm4gwrCyRSXpXMm1rNMskjjkIvjw4jwJdJ+BsAYaFDYA==
X-Received: by 2002:a05:6000:1a8b:b0:3ea:80ec:854c with SMTP id ffacd0b85a97d-3ee7d0c8adbmr3929036f8f.19.1758320319301;
        Fri, 19 Sep 2025 15:18:39 -0700 (PDT)
Message-ID: <94703a57-aef4-4d74-af36-03b4b2bea666@suse.com>
Date: Sat, 20 Sep 2025 00:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/18] xen/riscv: add new p2m types and helper macros
 for type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f73aac6730819132923e0ccf57eec87f4c9955f8.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f73aac6730819132923e0ccf57eec87f4c9955f8.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> - Extended p2m_type_t with additional types: p2m_mmio_direct,
>   p2m_ext_storage.
> - Added macros to classify memory types: P2M_RAM_TYPES.
> - Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
> - Introduce arch_dt_passthrough() to tell handle_passthrough_prop()
>   from common code how to map device memory.
> - Introduce p2m_first_external for detection for relational operations
>   with p2m type which is stored outside P2M's PTE bits.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - Drop underscode in p2m_to_mask()'s argument and for other similar helpers.

Except that ...

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -64,8 +64,29 @@ struct p2m_domain {
>  typedef enum {
>      p2m_invalid = 0,    /* Nothing mapped here */
>      p2m_ram_rw,         /* Normal read/write domain RAM */
> +    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
> +                           PTE_PBMT_IO will be used for such mappings */
> +    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
> +
> +    /* Sentinel — not a real type, just a marker for comparison */
> +    p2m_first_external = p2m_ext_storage,
>  } p2m_type_t;
>  
> +static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
> +{
> +    return p2m_mmio_direct_io;
> +}
> +
> +/* We use bitmaps and mask to handle groups of types */
> +#define p2m_to_mask(t) BIT(t, UL)
> +
> +/* RAM types, which map to real machine frames */
> +#define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw))
> +
> +/* Useful predicates */
> +#define p2m_is_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)
> +#define p2m_is_any_ram(t_) (p2m_to_mask(t_) & P2M_RAM_TYPES)

... they're still present here. With these also dropped:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

