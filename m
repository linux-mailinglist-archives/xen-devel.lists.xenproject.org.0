Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9DD3ACAA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 15:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208131.1520372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqWX-0000H4-Gx; Mon, 19 Jan 2026 14:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208131.1520372; Mon, 19 Jan 2026 14:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhqWX-0000Eu-Dk; Mon, 19 Jan 2026 14:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1208131;
 Mon, 19 Jan 2026 14:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhqWW-0000Ek-67
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 14:46:32 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a46d932c-f545-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 15:46:31 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee4338e01so17856695e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 06:46:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926ff1sm23285772f8f.13.2026.01.19.06.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:46:30 -0800 (PST)
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
X-Inumbo-ID: a46d932c-f545-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768833990; x=1769438790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xnRmTKXNteKMqdZEfaFQJUrsWcgVdqBEXTb4msepQGA=;
        b=fzxAM5LHtstpodnYk6gZik5wMRfgUlFcrxYMH3MzZoR2CfhZvg59HfEQGkD1rk3sof
         MmFS7pNhaoXwlfbB26p3FCmRJ1jlL8ZDBCkSQA+m5Nl92HnFWlkc1d7yR3z0maZwOj7w
         HRpmOZ6rfhHqekWEWG7i/3ac+ZW/fEAI3OW+w03llZ0KfTDtYeqdbhJ6k73okMGSCDiW
         fvEI2w1gFp8yQiykmZeFGfe6zopiGK3wDm0YOqDgGndxRkl0UxUtybzUWkoQCAwDJXr9
         NQ9C/PZz6lfjwLN0qQYTj2tXm08CYBQNSPBGHm2Og463k6UChDX21GWtI9IymLPuyeFK
         pLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833990; x=1769438790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnRmTKXNteKMqdZEfaFQJUrsWcgVdqBEXTb4msepQGA=;
        b=jo885fV91QoDYB1sfHpm2w29TqtiKu9oOtAwJFhFEF1IynmfB1Ib9nGe2j8/rLd5tV
         vrNELBjcsfjYIyd20PLnOeh/Mwv52x98GUU7tG0HSq250X8btnK5VaqwIeAKqi5g25XD
         oGJcTsWa8eaE/hlTGGY5jtaDViKaFdBQp4t5oxLkIQDhxgQIHi+eFVtPubZvdu8bbL5d
         zZCzEDCJHMc8B3wGfrRlD3rbpLhQavad0YVyW0srmteeoN1iC80fZ9pxCsbAQw6je/DD
         mjmMbFM4PQfMjGEvQlWXx3KoOBSggfai4y98JXm4BU2huSAx+9zB2LmqwMv/hON0GZg/
         BYdw==
X-Gm-Message-State: AOJu0YwQ0TpMvftWjRNwfhme0Hbc1aozmIajwRkSpEPR+qQc3/HCy489
	7V32fOrCRdDk9pCqtTvAh7AWNKtflXhxsFgJMTuKzXp0fKdlMtz2A3Jn0xMGvUmMPOta/yAMy6G
	eEbA=
X-Gm-Gg: AY/fxX4qJPOMv+wOJYsDBSWAfqAt0g6QBLh7an8TA8e0g4ZAUw66PQywAqFf0a+BMKM
	dMBDufznPo33PEwOIt3eH21kFxZRcqqx5O6G5SGxyniZdLKOagYrU0j9amRuBjn7zZGFdvZW2Kj
	g5vueQ/rwVfPJdiEjMGLhjViGcpPQ7+G4+pxz/rIx1YBg8VVVg6//AnCU/qk9Ei6UFIA5b7YivP
	vRrNAWOAWOpPI7askf3Q+KzNhja4VX02mIcqD/E4LKkbqaUY8jhc9WzgnAKvIId/PwBLnRwC7Dt
	u+H5OYNqYeA146vSJ5agTSM5pK0che3jrEZszZ4RVEGiPoru1851lIcJpu1FBpdR9RXBwryp5zX
	iIWVXmsnS46bfNx02sHeeXjIioeof2445Zwg+0Ny15ikr+NzU7xisFmZq66KjF4zAeUFMcjEMUh
	fWvadZGVmKCxKOUq6rw5ViSXe/Kim9fGfEI6ecmGhNg08RMIVFx4chN2NlVLe0KCcD7CdJhaaOb
	4A=
X-Received: by 2002:a05:600c:6489:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-4801eac331bmr135763005e9.13.1768833990294;
        Mon, 19 Jan 2026 06:46:30 -0800 (PST)
Message-ID: <f2dbd694-5e20-4560-9933-12cd98b23e20@suse.com>
Date: Mon, 19 Jan 2026 15:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] PCI: handle PCI->PCIe bridges as well in alloc_pdev()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
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

It's not clear why the enumerator was omitted, as these clearly shouldn't
take the "default" path (issuing a warning). Handle them the same as
legacy and PCIe->PCI bridges.

Fixes: e7e08d86ad2f ("IOMMU/PCI: consolidate pdev_type() and cache its result for a given device")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -351,6 +351,7 @@ static struct pci_dev *alloc_pdev(struct
         unsigned long flags;
 
         case DEV_TYPE_PCIe2PCI_BRIDGE:
+        case DEV_TYPE_PCI2PCIe_BRIDGE:
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
             sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
             sub_bus = pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS);


