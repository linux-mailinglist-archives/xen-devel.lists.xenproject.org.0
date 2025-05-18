Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36743ABB02B
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 14:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989065.1373402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcxU-0007tx-0K; Sun, 18 May 2025 12:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989065.1373402; Sun, 18 May 2025 12:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcxT-0007r3-TY; Sun, 18 May 2025 12:17:35 +0000
Received: by outflank-mailman (input) for mailman id 989065;
 Sun, 18 May 2025 12:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGcxS-0007qx-TG
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 12:17:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134ade6c-33e2-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 14:17:32 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601d66f8cafso645080a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 05:17:32 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e6884sm4431540a12.46.2025.05.18.05.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 05:17:32 -0700 (PDT)
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
X-Inumbo-ID: 134ade6c-33e2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747570652; x=1748175452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhM4ll+Pf7AZWlafB4PyBxXbX9rlK3MfptihHp7sVMA=;
        b=cCPHVcePLX9A2HFdfILyRULNFUg0mUKtsmzmYQeJRS5gfOohOE+vYMzeDgnUIdLBwj
         wDV3a/ouyvh6LOz/flcbztlOD3FkAqWM9A9Qfl/gqqVHOE2xxv3Z/2RnfgWT7kQtAU7K
         i1FMKyPIaOhE6L5H5glJD56XhiAHv09iJNy7JBNrvsFGO177A0e13GjZ7xjVbNrQ9Ol7
         5+w07X5UoMCkuaYpuV7LXiVGuAx3ETS4bbJUXNMqG+HrxeM6HJ6eI6Jv9fRsmGkJNm0S
         2OQmt+ntJTtRc7lyF+VQbYExocWVHIx0zyMVPMfpxz78ECtBu2Gyq47fEFlG069hpXTZ
         6Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747570652; x=1748175452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhM4ll+Pf7AZWlafB4PyBxXbX9rlK3MfptihHp7sVMA=;
        b=Gjpy7KF01TDp5q50C74CPTctzqwgvWrUJWTZluoYC2dPiHvBQxp2amJh3+U1yv1fRy
         1w6e7EcWerX1DZmz1OiO3IqJsuhY6rLz0aYOV9KLDSSrxEuJiuS3y7C8OHDEXpiafOIz
         p361mHfl5wRxRJoFg2LVlHjplALsxs8s3gCZyRSa5j+HXigXwJunM16NsMrP7RKwM9Rc
         CHp6qwWBIAMynr+rkhn507wsLFzZzlPAGsh2NMyaqbMsnFYKzLNCbDwQAcvUxo300mV0
         wDGjZFwUD9i+o90Dr7sBOOUZnCP+kMLrux+L2yUScyeEkEQYKsDoNJ0NF1zgeO4VoBNh
         MKmw==
X-Forwarded-Encrypted: i=1; AJvYcCWf3SP2m8tX3fjwC+IJE6/UYMxPxBP3XonR7vAGbt7x4tZuCbMSR3NP3IoKHkea5fi8hGekDhJGtO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY59zv+VFu8kwzsL9QSi9AdITo0lpGJ3yelcSsuCJ+FYxe1P/W
	QgfMiqDAm2dPyJbZZxqEh0X2I+b4V20msSBxgM5THeSNAk4+fH1icSaZOOjQVld8aw==
X-Gm-Gg: ASbGncueA+Hlw6L48JTNAD5mV4ZpzJGUM+vPhjCuFyflVfL6ZnKd3xrGMqr6Y1Kax1q
	QcCBVO/zvoAVR9S/Z5Km//Z1sMCXM3I40kxuM+Xl5qdDDAZ+BDN2AgKinlbN5ZtdulGn/YNLFFb
	R5+CJ1TTbqMGtu+ZtaPsKW737hv5g/Zv4YoczMvpcUAohelpc2opnCOQQ4oQlkHqM1g1kZoBGYK
	oxpyAyzaoQ6+8B/I1/jbF34TJ60SmClKFwCerLMQPC89357nffbnjW5NaEv/YVJm8AL3sW5+HCD
	JC3ZF1UQHyVQsBELlB7XlGR65Q0/+ADwA7onLPVGUgdT2OW3CDL6ryzxPNCOIMOhpH5byPoFmCe
	cpBPUFz/2NnjxFgUAN9OITCNh
X-Google-Smtp-Source: AGHT+IEcUcYHG7dzzvuINpaUvk5JXz8kItDV7ikg9RCI4yBuWLtYlKuyEFtdOKrMmdrtB+buIl48uQ==
X-Received: by 2002:a05:6402:5cd:b0:5f6:4a5b:9305 with SMTP id 4fb4d7f45d1cf-60119cd4192mr7388978a12.33.1747570652370;
        Sun, 18 May 2025 05:17:32 -0700 (PDT)
Message-ID: <2c5fbc92-c81f-452c-8a5a-3f1eaf53dfdb@suse.com>
Date: Sun, 18 May 2025 14:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] livepatch: Load built-in key during boot
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
 <20250515093822.659916-5-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250515093822.659916-5-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 11:38, Ross Lagerwall wrote:
> @@ -73,6 +75,10 @@ static struct livepatch_work livepatch_work;
>  static DEFINE_PER_CPU(bool, work_to_do);
>  static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +static struct rsa_public_key builtin_payload_key;

__read_mostly or even __ro_after_init?

> @@ -2287,6 +2293,31 @@ static void cf_check livepatch_printall(unsigned char key)
>      spin_unlock(&payload_lock);
>  }
>  
> +static int __init load_builtin_payload_key(void)
> +{
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +    const uint8_t *ptr;
> +    uint32_t len;
> +
> +    rsa_public_key_init(&builtin_payload_key);
> +
> +    ptr = xen_livepatch_key_data;
> +
> +    memcpy(&len, ptr, sizeof(len));

Doesn't this (and the similar one further down) need to be an endian-
ness conversion? In fact, seeing how the data is being built, it's
not really clear to me what endian-ness the field would be written
in, when build host and target host endianness differ.

> +    ptr += sizeof(len);
> +    builtin_payload_key.n = mpi_read_raw_data(ptr, len);

Whether there are endianness concerns here I also don't know.

> @@ -2305,6 +2336,11 @@ static struct notifier_block cpu_nfb = {
>  static int __init cf_check livepatch_init(void)
>  {
>      unsigned int cpu;
> +    int err;
> +
> +    err = load_builtin_payload_key();
> +    if (err)

Nit (style): Missing blanks.

Jan

