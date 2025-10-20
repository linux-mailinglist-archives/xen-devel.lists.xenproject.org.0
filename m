Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F24BF1C89
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 16:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146417.1478848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAqgP-0004RD-8a; Mon, 20 Oct 2025 14:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146417.1478848; Mon, 20 Oct 2025 14:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAqgP-0004P5-5i; Mon, 20 Oct 2025 14:16:21 +0000
Received: by outflank-mailman (input) for mailman id 1146417;
 Mon, 20 Oct 2025 14:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAqgN-0004KG-Ro
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 14:16:19 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5658f4cc-adbf-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 16:16:14 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-471076f819bso35474725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 07:16:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a976sm15776556f8f.32.2025.10.20.07.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:16:14 -0700 (PDT)
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
X-Inumbo-ID: 5658f4cc-adbf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760969774; x=1761574574; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqfIIo6PgW0lz2KZFcKSDOnylps/yjtNFJ13LO/S3Ec=;
        b=GIdAGA7iv3uz62d9+zVDG2zF1/LotXC+d3myX6hnhXEoH7i0U1rymHrw+ih5lmykvT
         kyz/C5sHQt+zfFoexmDBhJm/j3c0km5Pofn+2v00cFb5F909oa1KUpRCZNEtf7YkPFiN
         T1BJTeMZOKhvsDQf/FUAusCsO+UmGJKcA9Lo8XaB5ltt3UyPOwT7ZsmQji1yXFTdsR1+
         f2tpoyxD3uErNGl7DcxovPVWtpexLDQaGtV7BPoY5y/G6z6vHLWppbQTVMFGfSMLGxTC
         qq8u98RPdjFkTI9Rupb2ynm3cZOmPWb3dyBuGoRQ3Ao2j5mTAFWjBGEpp+4BxT4idIws
         dE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969774; x=1761574574;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqfIIo6PgW0lz2KZFcKSDOnylps/yjtNFJ13LO/S3Ec=;
        b=U8yiJCOCktHiKkjsV+UTYW2Xi+Ym6tVDgChI+2Sn8CfMpWi5tonB4dRKB4iba84DPg
         Ovo9Y5jdEv7QVSYf/816gX7lQ+k4WNk06mv2haf6FceLM5sxROuzEmNHXJzGRxDQAEiP
         Pd49u/M7AvY+lKj64SK4EDMDs/Yt9KEbW9sTVNUnMniw0caxhzwMj9TxgbM+QnXgezy4
         bNokJEQ7XuoV0DxTMjkhdWSVk/ZGzj6aOjiu1BTGZ4uc6rQrSfmzSUYewGC+XGPcqpZj
         RUwfZgdazMwY1i7Z8gsaJfZog+v7pzjb6x8xHAWC6IV/JZ2ItqVQnAcI5jc0xkmi3vlD
         mNBQ==
X-Gm-Message-State: AOJu0Ywg2heQzCPaDlJhf/BynQlovPYVOKK0jWnRtg02GsbFwc5IpWR8
	AoAvT6BF3/ijekyr2CJmrKXytpl4i2qG3Zo5g3AToyVSMvOR9JRfB8zGeJ2yOwmg435Honml1I0
	rfkA=
X-Gm-Gg: ASbGnct4/sxbEsy3NEc2VRAS+bQsrZWrZUuLe+VoH+oZU87hsnM4E0+9A3OYRVTaONs
	TV9oyJsiEKYkLC2aYRpWrs93VDB6KhHKCz5sCm2WRwD3UlbsBWl3GgKvUPHRizv/n9KEmYkq+s5
	EZ2M2ZljjaqoTIhxmpF4wc1ZOuL1yna94WWAwgknx6JNB/0uWNpEqXFCS/rFWloz7NOZckL2SlM
	ampDF4OWbNjnTAipE3wYLECb5P4FhCVT2Im6xj0A6Qq29z7n2BONqbPmWz8ROD3HPWuSbPDqYCK
	6qmXbePrcHFMivI9PBhMBa20tv8O3E5dyj2GYhZpHM/3pMWp8LByik1LrWHK58HhrT+UsEIixz+
	ogiEHH0nSsvWgag5XHf2WKRvcuji6hAtAJvW8cXiIpQk+DhfcHjDHUkhCn532TVIncJTghSygin
	sWRQNps/owQ9WtoseC2OHGW/4qfwJAfpYnKuqUgGt7PIk2rsFaDSgP8zBK62vF6mjYN7zJxTU=
X-Google-Smtp-Source: AGHT+IFWE1QaKjWzKyNk1bCcxuJUT7rYs3sHnyTRfp4cruvDT0F2PMRqQY4VTDgl46U8DTfsVodS3w==
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-4711790bf23mr92699555e9.26.1760969774332;
        Mon, 20 Oct 2025 07:16:14 -0700 (PDT)
Message-ID: <3cfa136c-3689-4d47-8a69-ce7af12ed9d0@suse.com>
Date: Mon, 20 Oct 2025 16:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21?] AMD/IOMMU: unshare IRQ .ack and .disable handlers
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

A .disable handler can't typically be re-used for .ack: The latter needs
to deal with IRQ migration, while the former shouldn't. Furthermore
invoking just irq_complete_move() isn't enough; one of
move_{native,masked}_irq() also need invoking.

Fixes: 487a1cffd71a ("x86: Implement per-cpu vector for xen hypervisor")
Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -428,8 +428,6 @@ static void cf_check iommu_msi_mask(stru
     unsigned long flags;
     struct amd_iommu *iommu = desc->action->dev_id;
 
-    irq_complete_move(desc);
-
     spin_lock_irqsave(&iommu->lock, flags);
     amd_iommu_msi_enable(iommu, IOMMU_CONTROL_DISABLED);
     spin_unlock_irqrestore(&iommu->lock, flags);
@@ -442,6 +440,13 @@ static unsigned int cf_check iommu_msi_s
     return 0;
 }
 
+static void cf_check iommu_msi_ack(struct irq_desc *desc)
+{
+    irq_complete_move(desc);
+    iommu_msi_mask(desc);
+    move_masked_irq(desc);
+}
+
 static void cf_check iommu_msi_end(struct irq_desc *desc, u8 vector)
 {
     iommu_msi_unmask(desc);
@@ -455,7 +460,7 @@ static hw_irq_controller iommu_msi_type
     .shutdown = iommu_msi_mask,
     .enable = iommu_msi_unmask,
     .disable = iommu_msi_mask,
-    .ack = iommu_msi_mask,
+    .ack = iommu_msi_ack,
     .end = iommu_msi_end,
     .set_affinity = set_msi_affinity,
 };

