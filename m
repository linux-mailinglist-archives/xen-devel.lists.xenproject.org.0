Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CFA5E067
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 16:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910491.1317197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsO4k-0007Ve-Ly; Wed, 12 Mar 2025 15:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910491.1317197; Wed, 12 Mar 2025 15:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsO4k-0007Sx-Hc; Wed, 12 Mar 2025 15:32:54 +0000
Received: by outflank-mailman (input) for mailman id 910491;
 Wed, 12 Mar 2025 15:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsO4i-0007RY-Le
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 15:32:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fb9b21c-ff57-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 16:32:47 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso692571f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 08:32:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfdfdsm21917117f8f.34.2025.03.12.08.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 08:32:45 -0700 (PDT)
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
X-Inumbo-ID: 3fb9b21c-ff57-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741793566; x=1742398366; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxCyHPjJpwg6yP5Nlr+dL1vqYCjXP6NLSGpQyf0ERGY=;
        b=DAzTRsuSsNfWdbeWHketdRppze7/2vLJy+mDiS3xfoyB/BGxw3Kue3F91CRnryYmB1
         tK19fQf521xsRCYNx5mU9i8z2YWUYVyDG8N4U3Oh3n1MC4VGbFDw/lXJc4iNhzzKRm0/
         399TlUwTpMVofMaJ6Rbubn6vSzNRm/SXLRYkUSP0qxY4yknC7QhX1HU7GOjvh8ThKdY8
         L+Z1qpbFmcpw+nrYVNcsgrgPS23jt4DtDxTv+muUqfJzJ/6MoU1mOLpusvpKTVF3m1/F
         8RoGRsmaE0DAj8ZBEaHkBbhjHsZGeFfArPtNU4X/uqWo6ClouTF+AE0jxUp6idENgdvm
         iuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793566; x=1742398366;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxCyHPjJpwg6yP5Nlr+dL1vqYCjXP6NLSGpQyf0ERGY=;
        b=FCBiV112RwjLc98qNrp89MzdxapiouHq7DhSAHlrwX7WMeybA2HgEafrZDHSLmwq3+
         k+b5ETpIiG0IOz1SQgrlCoQx1TR4qZpamVohYt0tHbggaZX0pG9uqhBZxDueih/er3GR
         QPomxh17XMjkeUsKDUDl8x4wPCYfY+S9T+x0Fzfz8OeHVadMyIDBNfsS6yviePDQ1U7C
         mCa+aI1MQ13cLAjubboLo0xWPHfrSH0hpYlZErPhykD13lpq3ZroDW2neAcvLKoYXLKO
         8MwDaXOOfKnstTIJ464MPuf46LZlbsH2kBFwRas9Cp9CKccL1nJEjHJ18G1M5D1qjvQ3
         fRKw==
X-Gm-Message-State: AOJu0YzNTzNTXgiFFqaS4jC3RXwF2QEiVsIg2UKh6OeMFIkuMA6pCpax
	fYgTIGuudU+VLw3Bnnxgl1/vh1Zj8E1l6KycvzkJHATkN2D+cO4pLU+QYJV4bt2MCUAEWN+UfOE
	=
X-Gm-Gg: ASbGncthv/qC9tvlRpnWJ/GcGxtIdtOdhnHHa1X8yns/KZk19h8r7qANi9Ghi88uq5e
	fX9i4ePVJKoFwjTkCRzpctq4sF8IdBDyeBErytPmil1Z6T2NY+bjo2ZitLxN79ogKVq55Ks1h7b
	vI5yI82eU35XTD5mSQGWrGLNi4Lrl3X+pFEYnmCxw9QsNWihf+KX64ci+B6a909kD++I8xch+Wl
	IbR6wu6iR/qrNbeCPHcU1nspUEtxnqUuqKXA5xH18U2m2lL8X/q9gOXmXy/1cQ+3+v7avnLJEgq
	iwrFw/AH4oJm7tsycAKbhL8qbsxDpLVOtoq2bXjGSoxu364RmVcWyZsKdAEAQB97WcYeWbRgc5O
	As/nCe3bQtRxDLzQcw1mNS7mikfhwlA==
X-Google-Smtp-Source: AGHT+IH+IpVhh6VN5RVy1O/tVBPqyslmDMP8jddtNDQ34jYFUHz56rhEsAs3+tLOuoYYb9DNqO0Wxg==
X-Received: by 2002:a05:6000:2a2:b0:390:f9e0:f0d0 with SMTP id ffacd0b85a97d-3956cab9cc5mr1735f8f.6.1741793566252;
        Wed, 12 Mar 2025 08:32:46 -0700 (PDT)
Message-ID: <15d5e7fa-ec5d-422f-9319-d28bed916349@suse.com>
Date: Wed, 12 Mar 2025 16:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenfs/xensyms: respect hypervisor's "next" indication
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

The interface specifies the symnum field as an input and output; the
hypervisor sets it to the next sequential symbol's index. xensyms_next()
incrementing the position explicitly (and xensyms_next_sym()
decrementing it to "rewind") is only correct as long as the sequence of
symbol indexes is non-sparse. Use the hypervisor-supplied value instead
to update the position in xensyms_next(), and use the saved incoming
index in xensyms_next_sym().

Fixes: a11f4f0a4e18 ("xen: xensyms support")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Not sure if this is to be considered stable (backport) material.

--- a/drivers/xen/xenfs/xensyms.c
+++ b/drivers/xen/xenfs/xensyms.c
@@ -48,7 +48,7 @@ static int xensyms_next_sym(struct xensy
 			return -ENOMEM;
 
 		set_xen_guest_handle(symdata->name, xs->name);
-		symdata->symnum--; /* Rewind */
+		symdata->symnum = symnum; /* Rewind */
 
 		ret = HYPERVISOR_platform_op(&xs->op);
 		if (ret < 0)
@@ -78,7 +78,7 @@ static void *xensyms_next(struct seq_fil
 {
 	struct xensyms *xs = m->private;
 
-	xs->op.u.symdata.symnum = ++(*pos);
+	*pos = xs->op.u.symdata.symnum;
 
 	if (xensyms_next_sym(xs))
 		return NULL;

