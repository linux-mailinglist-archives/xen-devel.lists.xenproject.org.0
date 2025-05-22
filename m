Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A9AC0D37
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 15:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994009.1377050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Ir-0001J8-NL; Thu, 22 May 2025 13:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994009.1377050; Thu, 22 May 2025 13:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Ir-0001HZ-Kl; Thu, 22 May 2025 13:49:45 +0000
Received: by outflank-mailman (input) for mailman id 994009;
 Thu, 22 May 2025 13:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI6Ip-0000u0-Ka
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 13:49:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d2895d1-3713-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 15:49:43 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-602346b1997so3355164a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 06:49:43 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d490794sm1086836666b.131.2025.05.22.06.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 06:49:42 -0700 (PDT)
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
X-Inumbo-ID: 9d2895d1-3713-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747921782; x=1748526582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bguN6QIP6SXRfeuBxWBu86UjfJCaa83xJednlwyBjlY=;
        b=DQt/nE2+ZXNW4mXFQvHNubPhMWTiSwkRRc/4hdaReOZd8i8z5vFHQRs9kbeRRI91NI
         ZoQilUFZ+SntI++TXoc5vMyP97HA62LHpiK5D/47DKNtVDECfCmwGPSuQj42l3adh8i8
         aSDjNCpxWwMOJCBSmspbvRNB+l1Zt+INMGFvFSHM0Z4szIIsIId0NXCLyKkCp09jKiXU
         ohzKxmYXdn+kNxvoSoDErunwg73dRX2Q2lxqmxX4w2DiQB3Lq/rTCmaa7xnlbvdFBDvk
         Cqk0lBzffi4W8P/3gOgv8gNkp0YB4dc+mHGx53UxLMWh5GtIU6lQRQKESwUjmCPYDqcB
         m5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921782; x=1748526582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bguN6QIP6SXRfeuBxWBu86UjfJCaa83xJednlwyBjlY=;
        b=PZXfvk1jnfKDmw4hwqI2bz6I/jVNitBGzxU0bOLG+dgTjX1XOsoOlwKPydj7B/tXBv
         E/q2nf5nWkWiC93w0Q7ITUm2VFxmQVT22iOY6f2RqB4OQY0EZDMQV6Gg20XwZrbBSELg
         1CpeyM71XROCOdBuC2tbf8SBE6e/nUerBfgT8ZL1GShonOWcxgamrlqlQHUlgy+T/QMz
         prFFUauhKyVpaUwDEEAp0aB+LlxEKKOf4SBKnGqyi39sfGkGFQ/POgLz3POsL+p7vkIT
         iGJAp6+JpDBw4v/zi7SuI2t8QyEKlJi/wwA1EMGdPnbhnPcUMHCnB96zsOpIggQLrJDJ
         8mdA==
X-Forwarded-Encrypted: i=1; AJvYcCVrpMwuwNDK0TWwZYvkk/DmX6GDchL2oESJjF5islOInMxkg1SfY0c3D56Tb1d8+8xFIXAnjdDavg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyienNYYo6rwUgMCx4CQO44sUwkcItl+3iXYQK00iMOzqv6Lhs1
	Xkb3ekPfMpAA9H2TRuXPkbw3RgMDOj5Cq7rAiw+ZrXuyqx0m/kxvmRwaeyw7pyjWXg==
X-Gm-Gg: ASbGnctEnNcDXPf71iIv9+k8+3OCTSMWVFJ8XAgRWPlZfrCj5uSNIm/KBo+xzBxvaxg
	XFMGt43LMVI9xnYEPCyx9Hl5CSHkekhABEIf5zbKr1Kkxl0dy5C6YcnCS8Ur6r60xhM4bOmDhV1
	stp894a0bKPv+rv6zR30awWwTVFahLfVBbWTdjqb7DNZIeoM0aTIFlyxo7TR1pKEtcZnyaPT9Is
	4S4eU2LjdpSqdVlXO5bMGHLkGCX8u5ECi5/WhMQcO6d0a8Y/vnoC+OjlT/CD6odf3/424SIVlpr
	eMJPSNcgaL3l18SpgUM=
X-Google-Smtp-Source: AGHT+IHVZTm7TS2S00qnyi38JmIODR3gNER1tTUeFvB+3ypKJ7tIJe5QmJQTZaxgqr60N+QceaFTSg==
X-Received: by 2002:a17:907:708:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-ad5c46240c4mr368090166b.16.1747921782430;
        Thu, 22 May 2025 06:49:42 -0700 (PDT)
Message-ID: <3d87f964-4836-43db-8d98-cfa8bcb0c167@suse.com>
Date: Thu, 22 May 2025 15:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] xen/riscv: introduce register_intc_ops() and
 intc_hw_ops.
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <bd5472b8042aa5074d8870df054c77c8cbdb6c16.1747843009.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd5472b8042aa5074d8870df054c77c8cbdb6c16.1747843009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 18:03, Oleksii Kurochko wrote:
> Introduce the intc_hw_operations structure to encapsulate interrupt
> controller-specific data and operations. This structure includes:
> - A pointer to interrupt controller information (`intc_info`)
> - Callbacks to initialize the controller and set IRQ type/priority
> - A reference to an interupt controller descriptor (`host_irq_type`)
> - number of interrupt controller irqs.
> 
> Add function register_intc_ops() to mentioned above structure.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


