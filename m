Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25868D3ACB5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 15:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208161.1520402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqXy-0001sk-D3; Mon, 19 Jan 2026 14:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208161.1520402; Mon, 19 Jan 2026 14:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqXy-0001qx-9K; Mon, 19 Jan 2026 14:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1208161;
 Mon, 19 Jan 2026 14:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhqXx-0000Ek-9C
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 14:48:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c8ef6d-f545-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 15:48:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee4338e01so17864775e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 06:48:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996dad0sm23506468f8f.27.2026.01.19.06.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:47:59 -0800 (PST)
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
X-Inumbo-ID: d9c8ef6d-f545-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768834080; x=1769438880; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LxIHHnoWmRfEZQKRp7c/KawtwyGIc/YRyMoiBmbjtBI=;
        b=TxLaI9HOXth5fRHyIUzPjqNZQ/ALpBNqQAdYSVadlU7apUJdF09BgIAr25iW0Dx4vd
         DFjR/2czV2Yw1lf4/lHA6lzSWWisPIkVeqwlAQTZWkm1VeS71kBZlrlryFg3IhDTpUUw
         elTM7fXLAEjzS2CSHAHfYht9460x/3XZ5c+gMTv2qPADdQ2c3FniwTJpPBRo0g478ei8
         Tgv/0TehDcKJV3aPNKPSzj8FsejjFYw1FtAh+7Id05fUjGLKw/umx62oUqZiQABb0VTp
         UwOCJaSOlD4DimMFxpVUAwHvT0vrhH/Y2cxsx6vUPM3kZH/yBmaKD1aIVmLX5HAWBW6v
         aShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768834080; x=1769438880;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxIHHnoWmRfEZQKRp7c/KawtwyGIc/YRyMoiBmbjtBI=;
        b=jAY7K+3u/QGxsci/KC+WjuokVd8MrjtIbGe27pY+KzExfixf0PSLj9aQXrnT4Rt0Sy
         rWc1FAaSW2nAES7fb90q4qAZHieVjpYNaJTxrLLAIJ9u7keuvrM+p+T8tfeVbQaOn+k9
         nALC4PGYPPa/0fsKiRe8fKjSoABv+qWcDSHdIMPGVbe/IIDAlP3tLMFuOap1gz4yPcA2
         UEPijMY/SowRakrNSn74+YvA8YFjP0/5+qSClp3tFdG7Tekzgs21pzQAeHDVJbEKsn6m
         fyvJcF+xVfY/mY63rzUAbA3Z9lzAIY/AMOWcGDyg5iVWY2FIzkaP/OsY6hmt/d7e+GEZ
         OTOg==
X-Gm-Message-State: AOJu0YyFGVglj6FjUY4QEVowa0QgV+f6cBbld5a4xxop/n9R06WA04K6
	A0SgjEItb2q4O+TiM9yJGv4LgRHLm9a63VFbiTlLQxbBT0Zz9wRHty4s6VLW7kzok8GDl3SRcRd
	lBjg=
X-Gm-Gg: AY/fxX4ltqcCjE2sDxeUotr4Ohvhi67PzdJXIUeTmDAZSWzgVmDvn3VSfPvFbcG4dJx
	nlo9f/mF9D8tmT1f57FaJEVeavb0a1/1aOgVSwb1qdvu0hIQYk3J69vAL7JqLU6vFUMRXX5xgQ/
	yT+RhZaigJNzczvzxtejUmtnu3nzEMqlv+bw0n1xZZcjm0QjNlSpyZ62kThEymdht0YX28Ps2LW
	APBF7q7Y720Jj87+P0EPLZE4zO9X3Zm9meCQ+kGHNhePSX9v55jcGY9zDwhXbrwuY3jDkQ+LL8u
	kNilLvwFLDi7YghZCO9c4yCjJaGvLrcPSIYZO7Edb2WwmHh6pzCx9SorAThmZC5ltNnRQgGd972
	aP3KvTx3Mq4WqQ903EQkesp899JSt75VDiTwCuC6RZFVOOoIY9LAR/MiE6oyjtzTB/LY9OslGWQ
	MWMyRggYpBh0egCevZjypN14zwN/crcISaz3jComFHtcKPXGK5tAz3kulsJtl2LLC1sSk+copYK
	qQ=
X-Received: by 2002:a05:600c:4e15:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-4801eb181a8mr149210435e9.34.1768834079918;
        Mon, 19 Jan 2026 06:47:59 -0800 (PST)
Message-ID: <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com>
Date: Mon, 19 Jan 2026 15:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/4] vPCI/DomU: really no ext-caps without extended config
 space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
Content-Language: en-US
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
In-Reply-To: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Whether to emulate accesses to the first 32 bits of extended config space
as read-as-zero or read-as-all-ones depends on whether a device actually
has extended config space. If it doesn't, read-as-zero isn't correct; not
getting this right may confuse functions like Linux 6.19-rc's
pci_ext_cfg_is_aliased().

Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -830,9 +830,14 @@ static int vpci_init_ext_capability_list
     unsigned int pos = PCI_CFG_SPACE_SIZE;
 
     if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( !pdev->ext_cfg )
+            return 0;
+
         /* Extended capabilities read as zero, write ignore for DomU */
         return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                  pos, 4, (void *)0);
+    }
 
     do
     {


