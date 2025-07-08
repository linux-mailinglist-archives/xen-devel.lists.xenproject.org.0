Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB3AFCB3A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036491.1408751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7wt-0000DU-73; Tue, 08 Jul 2025 13:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036491.1408751; Tue, 08 Jul 2025 13:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7wt-0000BB-3U; Tue, 08 Jul 2025 13:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1036491;
 Tue, 08 Jul 2025 13:01:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ7ws-00009X-Bc
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:01:26 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a775dcc5-5bfb-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:01:25 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso1914396f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:01:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845801b2sm108039275ad.169.2025.07.08.06.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:01:23 -0700 (PDT)
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
X-Inumbo-ID: a775dcc5-5bfb-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979685; x=1752584485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wRoPfX2BzJ/dQcFmXsctI1wFLcyFz7ELtTEfeyjYFM=;
        b=OngPSY6ZAhmKR5kMU1cm3QX591I8hkz32Ietes5tUD7JX4mXjMN9M0/UJ7u1XrhvIE
         KzrzARggpVNVddZUo8Nw9qXBcIdCsuYJrPi3Bf8i0GMRuhdjt/p4prVgEF14fykpej2Z
         2KF/+GxiaWoJDXALth2MOsYX8mxU2eSjskOu1Lzh8/JIvyIAl9EBJncy9WO8v1MXoHwi
         luSqyznbQ1MJ/oQ2N/LvOXGuirDK5T/0/yZM+efHj0J2PpIw6lwLKFcCScsdZrqjas8q
         3fStXhr0E/5svszEAwrQ3PBNWu9ap3Laa0YkK/71ULHIhHqddq48y5LqXWveeH4LzeYA
         aLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979685; x=1752584485;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wRoPfX2BzJ/dQcFmXsctI1wFLcyFz7ELtTEfeyjYFM=;
        b=pxM9buGjrM9q6bp0eOc33brR0kPmTjQgs4m75GUBd5BOj5ZWXUMgrdyFIn24w8eToT
         id5il7siIIc1bmb2URgXrOGYexNsf7gG+ELTgQpfo8DHq583UtGe/jLwpEkZ4OoxQ/oJ
         Myi8ph0P/ZDCcIYDh3CObwZQC9Z7L0qEv+cVuIIT78MwJTRAsbyD0ePYZPqZMoU87CMB
         SjN4MIoqLT/NBrp4ycCv7Xq9weNmGmze1TnrfLMto11Fi/YQmPuIke8oRNXQAw7yjEG2
         RKVjbP83pL1BWejtdlIjgJ8VKC2cX7vW233caoZofs8cyn1N8ZiY7J3GYoDZkpdpwrgM
         9aVA==
X-Gm-Message-State: AOJu0YzxqwFLabNP4tyZ4dLir6hdbFdyyCXFVMehNMQoR+EsFPTFZ8Jc
	Kww/p6sbbEdfxLSnxEUUduLnmnCP5ljlTR/CPZEx10qg/jAZ8GFYv415PhjhmEW3380TSw8yc5m
	e5LU=
X-Gm-Gg: ASbGncsnLDrOeXH2/mTTvXVocw2e80bt0tililE4I3xnI0vatU4bH4GHhAJB5fXzC/D
	FChtSTLy5n6jILEKuXPnf18AkVEXCYKDsB1Qkdg2aQHLbMePnrJV6daug25kc51rY2aCuVeUyOG
	dmBtL3Xb77Y1O05rI5wyI2k6qNyZlwGz0S7vn0dhAWeLVSo7DxIhmfDPhhIKDTXwO2YEAbo1LQ1
	4Sxivh1LUfzsV4ZPDdYCg46mmiY2J4Qtn6ojeDlOpxZzVRznF8ouf9R5U2bWfzoELsIEDrhRlit
	Y/0ProI9HDhiconGy75AHrb1f+sOvopZYGG1uuQLVSd0GBCL2awXmQU2AAs9mdAWUR5+JQgOh4a
	xJgnxtWMfAA3sTzt/tJn8+w0TXQqbHnWbDvD58tBH9u9oF7g=
X-Google-Smtp-Source: AGHT+IFZoasQvlk+4gCjMGro7YeoRxYtYF8fNflLe0jowjDgDB/Xai5pLbizuU0UnXBnzOaxuFcBpw==
X-Received: by 2002:a05:6000:2c10:b0:3a5:3b14:1ba3 with SMTP id ffacd0b85a97d-3b5ddf0142bmr2088488f8f.49.1751979684207;
        Tue, 08 Jul 2025 06:01:24 -0700 (PDT)
Message-ID: <7e9d9be6-aa5a-454c-953f-91ed6a813015@suse.com>
Date: Tue, 8 Jul 2025 15:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 9/9] x86/mwait-idle: add Clearwater Forest SoC support
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
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
In-Reply-To: <1df49875-99b8-4302-aed7-5a75dbdd85ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Clearwater Forest (CWF) SoC has the same C-states as Sierra Forest (SRF)
SoC.  Add CWF support by re-using the SRF C-states table.

Note: it is expected that CWF C-states will have same or very similar
characteristics as SRF C-states (latency and target residency).

However, there is a possibility that the characteristics will end up
being different enough when the CWF platform development is finished.
In that case, a separate CWF C-states table will be created and populated
with the CWF-specific characteristics (latency and target residency).

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20241203130306.1559024-1-artem.bityutskiy@linux.intel.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git eeed4bfbe9b9
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1350,6 +1350,7 @@ static const struct x86_cpu_id intel_idl
 	ICPU(ATOM_TREMONT_D,		snr),
 	ICPU(ATOM_CRESTMONT,		grr),
 	ICPU(ATOM_CRESTMONT_X,		srf),
+	ICPU(ATOM_DARKMONT_X,		srf),
 	{}
 };
 


