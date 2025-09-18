Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5522B85671
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 16:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126265.1467896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzG6O-0004kh-Am; Thu, 18 Sep 2025 14:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126265.1467896; Thu, 18 Sep 2025 14:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzG6O-0004iC-7V; Thu, 18 Sep 2025 14:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1126265;
 Thu, 18 Sep 2025 14:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzG6M-0004i6-Jz
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 14:59:14 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 079fcddd-94a0-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 16:59:09 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45f2313dd86so9650425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 07:59:09 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802dec24sm28520165ad.95.2025.09.18.07.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 07:59:08 -0700 (PDT)
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
X-Inumbo-ID: 079fcddd-94a0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758207549; x=1758812349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTfkSnSYwiU5udv5diwAMqTPemsGptsgzUIXwiXjAHM=;
        b=MASaSB94nVG/8dRB/x4Q7dMVKUH3QFLqTOQXM9hJ17Ic1PHUcX5tF8PCRfd4LemKVZ
         1jnlLUCkH8qJ38VH0WR8xW01jonDTgX9rc42N0liMWbAVqb7AlxxY0oE8eM5JNv6KNu1
         EwGRIauP9qr0qNzaD4tnzje7v5ajH8cE44+Gp7BGxXM72GfdH/hcsxF6NFHxfPNTT7qA
         W/tfMF/QrUPmPQSNqHexlxN85gRgR2AMz1xCKdUY1BEfqpzycAKZDyJ3IoAAqsd5wlIB
         ctNe/CpjA41uAxnKsGwCnVweCrCxeXd90W+l9gz/oNOY80VtntbGfInC9JSiq27rRfsp
         6qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758207549; x=1758812349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTfkSnSYwiU5udv5diwAMqTPemsGptsgzUIXwiXjAHM=;
        b=LmdRM4ttIiwAWcqup3vwVnP91jn7JuXoaOBavDPQWVizs6XNjli/WxVPG5Z4qKyExC
         WdbnZ9Da2DTHrZMMW7B1n6NASlXhdiAbLM/y/QuwBCGCGdWOhz/1WSsQKsSwZGP8lC4+
         HUZ01DF81TisVBkGSULlg+77E00Mz0MwkhaeVYZoOo6Twtx3C3fWB5d9KvWec/xDL2Rb
         L7J47opa/MlM9Jp3/rWRCfMBMv82ZARUDzveyNoibwgOUkRPF3DH9n19fE/E3V74jCLz
         9/WEB0Ux1I3yNsiANoI69WwatUAHhj17s2WZXoynS/zQP1EtH7vhbSYys3va3fupwSF9
         ErzA==
X-Forwarded-Encrypted: i=1; AJvYcCVzvB0DyG1eGZ8Z13zXNt9zo20Twami1wv+BlruJ0RySxRPE+LmJFYFPjpon2pcgqWe5BXMvqhJnzg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2eny78C0K1AZa1oZeq9F6KJTvae74LQRAAp9RMgPjmgfrjBT7
	ejeDbk6j/AzfdmWvlGwlWSyjWMYqfDn7QBsgplN+Cet3u1qvOFXOuRLgZc7fTlPwdA==
X-Gm-Gg: ASbGncvanvHf49SaDLDonFFaarIp75qb5+YNn+UpQD1Qdpd1odPVK0SJhQNy1zvIjFj
	cjBo07ZqlF8wO9LMbrnS9cxyVJi3/WyBS73aulUBPiozkq7mLkS41ceVi5fjfq1+EBokkkVXQBQ
	eFx9iqQnDC9lB3XWg4GprkhXGOZya27lW6djJNFU7/LZ2gVgFfvB0Krgn6m2FuNhI2kRnTpEOcy
	aKwUtCsIWh3k5yit/KhSooSkDNH71ky4bd5wmjABU9oEKMa6qpYWa01Lr/JlEPoI/2rR9RayyDs
	U49nycxnvC6VyizcE+tOKWbitnEMUmFbeH7bcxr0g2kTd5iZBRLK4DivLZ2ii01KPzuHB/vULo2
	jbqLvls/+jDz5PLzA4mKa0saJUhGpChiOdeC4USUarrWZy4jNXw==
X-Google-Smtp-Source: AGHT+IH0+bxw/Xh3i0xQHHG1wNB7IZkixQekc0mjDdBAbUMZ4Nvc98UXDXX6wIVgutnADSb6YSFqsQ==
X-Received: by 2002:a05:6000:2512:b0:3ec:db87:e908 with SMTP id ffacd0b85a97d-3ecdf9afb8cmr5042088f8f.7.1758207548722;
        Thu, 18 Sep 2025 07:59:08 -0700 (PDT)
Message-ID: <337596e3-e522-4770-a64b-6c8137134739@suse.com>
Date: Thu, 18 Sep 2025 16:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <7d10f4d063a55920acbb8d477b885552379a6116.1758197507.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7d10f4d063a55920acbb8d477b885552379a6116.1758197507.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2025 14:16, Mykyta Poturai wrote:
> --- a/config/arm64.mk
> +++ b/config/arm64.mk
> @@ -1,5 +1,6 @@
>  CONFIG_ARM := y
>  CONFIG_ARM_64 := y
> +CONFIG_HOTPLUG := y
>  
>  CONFIG_XEN_INSTALL_SUFFIX :=
>  
> --- a/config/x86_32.mk
> +++ b/config/x86_32.mk
> @@ -3,6 +3,7 @@ CONFIG_X86_32 := y
>  
>  CONFIG_MIGRATE := y
>  CONFIG_XCUTILS := y
> +CONFIG_HOTPLUG := y
>  
>  CFLAGS += -m32 -march=i686
>  
> --- a/config/x86_64.mk
> +++ b/config/x86_64.mk
> @@ -3,6 +3,7 @@ CONFIG_X86_64 := y
>  
>  CONFIG_MIGRATE := y
>  CONFIG_XCUTILS := y
> +CONFIG_HOTPLUG := y
>  
>  CONFIG_XEN_INSTALL_SUFFIX := .gz

I realize you only do what is already being done, but I question this
way of doing things when the scope is tools-only. Any CONFIG_* put here
cannot have an identically named, but potentially set differently
Kconfig setting in xen/: Any use of such in a Makefile could end up being
wrong, and would pretty surely end up being confusing.

Jan

