Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0306D1E6B4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 12:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202966.1518342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfz7n-0000kB-5e; Wed, 14 Jan 2026 11:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202966.1518342; Wed, 14 Jan 2026 11:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfz7n-0000hp-37; Wed, 14 Jan 2026 11:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1202966;
 Wed, 14 Jan 2026 11:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfz7l-0000hU-78
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 11:33:17 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1533ed6-f13c-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 12:33:16 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so86354375e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 03:33:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16d2sm51118032f8f.13.2026.01.14.03.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 03:33:15 -0800 (PST)
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
X-Inumbo-ID: d1533ed6-f13c-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768390396; x=1768995196; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BajQDAKIgQ5gDjKtFsgRWf/pFzpGJIzi2y6k/uBcInE=;
        b=Kp04JN81c40zLsCtZfeSiPAKPdciNDt9v9VeO4ZU4qKd1n1KBpRAN7AirVmhg72jfM
         ummQATZ4+D83xJa4Wf1mLt1M7WINLdvtCW5pWLbFtEYe3iBC7SX02lRInwY01Gk0T8se
         j6kF/iYGTTO4EJhpUD5CRSFAOS0dXBTu874H1U36A6XzrxTrpgNnUV6eqLrmvmhm4TLk
         GsKqJP3qtyL6dLQf1dvguweHnv6J/MZ0J/mI/1KvlMhG1bY1s2XqfDgFaGAE5SSkYCYt
         B8hjzJo7+hzmqrE+iZ5zXIMHoknzFVq0YS9bAwWQD9PGsIbHWEzYtmbuRkfORmMkB1hn
         z3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768390396; x=1768995196;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BajQDAKIgQ5gDjKtFsgRWf/pFzpGJIzi2y6k/uBcInE=;
        b=wscLVuRakr6pjzFkz+qB9Mwv+6rTnPAzR2PprCU7C5mp6NF7ljRdM6nbztbEl+L6pm
         CZXWS352/GyqhsGVhc1M5PS6cSwuN+5+P75FyEW8IB9ZaVwj9PHLsr8Pzr64fQrwtbrQ
         3+mXuMieTMYJvdGhndTXG13fYMlweyoHBGSRBf7wM+1bb1uvNJx2tkj83hunWihNFOan
         xuriF/71lb1b5Ms6mFgYPN+xEwRpMHtLLiQrZAcgLjCm1mm570YjnxSTokC2TtlNsvl+
         zbvotFfXCcLiQEUbJygczW9uDgKg7xb6Eehrdf27RfkOOH1fhOTiWCCJrCIde1i9+ANF
         rQjg==
X-Gm-Message-State: AOJu0YzT5PgLK/KNuiJE60qI7IS26sh2tudCvJ4OyXWKCK9e7Ow9vkV7
	TbVVj3NNBdW8jrOuX8c79xPs5aYxDNJBRspZAIg+K5dc45GZ//iO2gACGNvyUj8IIoRMMdRi4G4
	wd5Q=
X-Gm-Gg: AY/fxX6u82y2HjTOZH5QzBAN+yVuYCCtbJ5LI5AJHaHIEydO/dGUYPwZlSOujcWl+8P
	z2TXRD0nyOeI46kd0XdzoVMuHxH0imolZ611rLviFSnQ+G98RY1RE47kn+GdmI42WgWe/AEos8X
	foGiUZxQv12eqwsgbCaj+8SoBGUSajMjw3vZVTM9L7vmc8SuN5IBCBO99REwDaSzOa8ZQoY+NMP
	Ux3VOhgp+QzWhz4FMkvLs5lxhsJVipmlvEDZX4j/SRhdDz4ENENEVi7mPA9IwNemn0gmXE+/QB2
	fpoKBDt8+7XXIG2idbYo5LhA7nZf5NoX9ezqySvhOIEBCH26V3yMt/W5ywmyAM71gwTBTMXaJBZ
	xEOuLv93tqh/2t1PdHvOhcngTSjfycZ8hui5d6Ioj/uCrH/Y+rd7lyPLxCvurjp8PUKFcvNCqAB
	RuXZ90hi+jJPN37eYa92Po/PZPQKVoX/CJ2oeCU0ELRyViyFqNfKgaUCyU2LT1wsW5q0V3skDqJ
	4I=
X-Received: by 2002:a05:6000:200d:b0:432:5b81:483 with SMTP id ffacd0b85a97d-4342c501318mr2508314f8f.24.1768390395541;
        Wed, 14 Jan 2026 03:33:15 -0800 (PST)
Message-ID: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
Date: Wed, 14 Jan 2026 12:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] kconfig: adjust NR_CPUS defaults
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Discussion of a RISC-V change revealed that for PPC and RISC-V we don't
really set any default, but rather rely on internals of kconfig picking
the lowest of the permitted values in such a case. Let's make this
explicit, requiring architectures that mean to permit SMP by default to
explicitly record some sensible value here.

Leverage the adjustment to the "1" case to simplify all subsequent ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For not-yet-SMP-capable ports we might go even further and use

 	range 1 1 if !X86 && (!ARM || MPU)

at the top. Thoughts? (I've not done this right away as it is liable to
get unwieldy when we have a larger number of SMP-capable ports.)

--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -9,11 +9,11 @@ config NR_CPUS
 	range 1 1 if ARM && MPU
 	range 1 16383
 	default "256" if X86
-	default "1" if ARM && MPU
-	default "8" if ARM && RCAR3
-	default "4" if ARM && QEMU
-	default "4" if ARM && MPSOC
-	default "128" if ARM
+	default "1" if !ARM || MPU
+	default "8" if RCAR3
+	default "4" if QEMU
+	default "4" if MPSOC
+	default "128"
 	help
 	  Controls the build-time size of various arrays and bitmaps
 	  associated with multiple-cpu management.  It is the upper bound of

