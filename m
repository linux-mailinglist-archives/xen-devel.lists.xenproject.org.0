Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED7B2F184
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 10:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087985.1445853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0dK-0000QW-Ep; Thu, 21 Aug 2025 08:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087985.1445853; Thu, 21 Aug 2025 08:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0dK-0000P3-Bu; Thu, 21 Aug 2025 08:26:54 +0000
Received: by outflank-mailman (input) for mailman id 1087985;
 Thu, 21 Aug 2025 08:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up0dI-0000Ot-AA
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 08:26:52 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9620442f-7e68-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 10:26:51 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78d5dcbso106116166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 01:26:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4790bbsm349217566b.56.2025.08.21.01.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 01:26:50 -0700 (PDT)
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
X-Inumbo-ID: 9620442f-7e68-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755764810; x=1756369610; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lWE24kU4jNhTwSigocXctoFrQCO2MCM1AssF2iUCj0=;
        b=VskbHI+OS7X5AjckIFXB9Ji8eVbUPJjGJ+UEsHXS9mPZsEZKSKTiHf3ZVYjuBaFsDi
         QlDpvTa/wGPGJlpWy3Fr2q+BueHme/Z8tqWx25MKs1JsS3arhQ8XtP31TYi1uQGVApdm
         tschkQzIUC1VHDKw23IVv+YVF3bkfTnwYUMC1atuAD8lm3A9Xy7ATpOd0K/DLQ50EnHd
         5rdoEgXFvdiZBD56i1DmGcUDW2DmEva4EyYg58t8AvaOybX7ZsnPx5YVS0e4TIWD0/8l
         UUw8LrOAekuQid8iMi7MEcLM1V/pveFrr/oDcjgphoFix4FveMkGX8Mxh82FKekvuFue
         s4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764810; x=1756369610;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lWE24kU4jNhTwSigocXctoFrQCO2MCM1AssF2iUCj0=;
        b=ATX0iTQJC94+5ToImBbEcTpw1RnKvzVMqeI08qJc7fQOHJ8RhlFhxnc4DUmk2OKMsx
         nDM3u27YdYp4/crpkgCGsXIzTq8patuylpC3RBuU4wuVcM1RgIyTdVglmyipFQSvxNLa
         ZvvdnjHmabNOI3LTVIrmVtQetOXPWsDD+Cwe5ylynayVdpmapSt7o68B6PO+1NO3ABN9
         GY4pusDx1niXzArI1C26HkHYWXo9HtqMXRAKJA/HDJfSNgIwDN/ja2h5mqv/GbLTnkD9
         o6E049wY9I2Es7MDbvTbCkcI659630kgEeKEoepiXmDkT02dx4MvVS/WQaTQD4HeFfw5
         0FiQ==
X-Gm-Message-State: AOJu0YxDWRajPbBNFA9KILiAaDbzMTzrWdoN68fXyNDdLZYn9rToVgFr
	KJpEjNkZGhg0RLIT/APL2i/rubNKw6IGEJ9EcrCjCXQQ0VKxvwdUxYSDBwpboV27EQ==
X-Gm-Gg: ASbGncv/O9cl7Y1fMMmNof3E2/HD2VgDdi2PJlxzSFFXtkKa8cRx0hZz0cB/yTGdGat
	bf0e2rdgaPldhF6e/CMjsxzy85H2GFAUyyZZm3A4DLvbEfSZ0ocY7Tabl2tyUAoGoFrr3Px1LHW
	fLgKyB4OLGAJarulQdkeBBkjoS4XGxQuQ9kq7MGbl1eBQLdglFDSzAZWzfJ5mOTwWyQosaTTclh
	NGpw5oNlMn07KUgDVaY1IpBLE0LNqOkKlzokIXXq+z21py7hZHlJJbVgXtOmUpfSxa74+zsibcM
	8xp5tcR9Ti3l08sS90KqLD9ckg0gqmUaA8ITdNYWvMs97weU7U/rt1d2/y2JiU5vldIRwjPVitS
	zRcMMKbSNudmRu3/J6JHKSWbtT/6cVCSyhWJG0MnqsHtBLHwi21BhcXjuTx8Xx/EfkzJqpNhppA
	IpQom8CA4=
X-Google-Smtp-Source: AGHT+IFhml7crmfz+RjhfADhyzd4xaAwo2+TLB0VPS2VHr+AMSihzIdgsPSf1858/Brwo3se76Yyzg==
X-Received: by 2002:a17:907:983:b0:add:fb01:c64a with SMTP id a640c23a62f3a-afe07c153d1mr158481466b.43.1755764810321;
        Thu, 21 Aug 2025 01:26:50 -0700 (PDT)
Message-ID: <312c4802-0c15-4d2b-a98c-13d1ed75bcaa@suse.com>
Date: Thu, 21 Aug 2025 10:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/3] pci/rcar: implement OSID configuration for Renesas
 RCar Gen4 PCIe host
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

(sorry, original patch already gone from my mailbox)

This looks to have introduced a new randconfig failure, as per CI [1]:

In file included from drivers/passthrough/arm/ipmmu-vmsa.c:54:
./include/../arch/arm/pci/pci-host-rcar4.h:7:37: error: 'struct pci_host_bridge' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    7 | void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
      |                                     ^~~~~~~~~~~~~~~
./include/../arch/arm/pci/pci-host-rcar4.h:9:39: error: 'struct pci_host_bridge' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
    9 | void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
      |                                       ^~~~~~~~~~~~~~~
./include/../arch/arm/pci/pci-host-rcar4.h:11:36: error: 'struct pci_host_bridge' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   11 | void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int reg_id,
      |                                    ^~~~~~~~~~~~~~~
./include/../arch/arm/pci/pci-host-rcar4.h:13:38: error: 'struct pci_host_bridge' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   13 | int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge);
      |                                      ^~~~~~~~~~~~~~~
./include/../arch/arm/pci/pci-host-rcar4.h:14:38: error: 'struct pci_host_bridge' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   14 | void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
      |                                      ^~~~~~~~~~~~~~~
./include/../arch/arm/pci/pci-host-rcar4.h:16:38: error: 'struct pci_host_bridge' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
   16 | int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
      |                                      ^~~~~~~~~~~~~~~

We either need a quick correction, or this may need reverting.

Jan

[1] https://gitlab.com/xen-project/hardware/xen/-/jobs/11087233227

