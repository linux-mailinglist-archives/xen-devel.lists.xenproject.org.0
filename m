Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53986C83851
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:45:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171699.1496702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmnE-0003AI-K8; Tue, 25 Nov 2025 06:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171699.1496702; Tue, 25 Nov 2025 06:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmnE-00037t-Gi; Tue, 25 Nov 2025 06:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1171699;
 Tue, 25 Nov 2025 06:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNmnD-00037n-L9
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:44:51 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cceb270-c9ca-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:44:49 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779a637712so30927405e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:44:49 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a8e:d5b9:723c:3555:44bc?
 (p200300cab70c6a8ed5b9723c355544bc.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a8e:d5b9:723c:3555:44bc])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf36f535sm238027715e9.8.2025.11.24.22.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:44:48 -0800 (PST)
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
X-Inumbo-ID: 3cceb270-c9ca-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764053088; x=1764657888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V4PsvJUFPqval9XT2fjByGBFC2K0wNjKtflpyzIW4RQ=;
        b=DHfhxuNlTZgDRz1OQt0gVVcXqQcAhhVuZ1AVIwEMV6rfuncKYOD9eMOP/3YM38/hEv
         gH/kkSPDDMH19WwPAl6XCkPBz0T3wzs81i7QxWOSVG04pf+poACgWdv6N9DkB4Wu9rg7
         3LvfX87gk2V5wUgjVa4sHPKArGhJUToGT2X4M2yfg5o55HMop+Of5VFQYMLR/7BQOIaQ
         pUT/NDR+Ds5Q8rafoyepbXrbAbCos6dJFLe3OowDWxg8ZFHzyH8lMopXdL9vA/pDTvNb
         nOgoKwsZMqBKxPIKSNPYU515JWZjIPfAXJ/93jSlavk+RTKparpDW8nVVfilPkZUoV8h
         Q4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053088; x=1764657888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4PsvJUFPqval9XT2fjByGBFC2K0wNjKtflpyzIW4RQ=;
        b=kQVbjRrT9nMS0SJKO6bcwQUv9vvf7yHCmwp7EUGk7Sh2uKbVTPOrwoLr474Jjo9E4o
         CrqgmY6SzEYVsUPiT6Od/T3fqrbgJNMaDzspmHM5Uy3h2ocpOxwq4EZUFbWAzTx6hL80
         F/+3M0+51o0QDsxf2QjV9LZyvV5odePZwtbOA3soRosmSVkfK92I7P5tUn4UAJX92Y/e
         +8cSZIXJAqUra4rGBJTYbCffGQDP/cnkmPeOfiWJC3Vp4OWJT7ydu9BAqTT7HLea2jPl
         +tN3oppQQW95lyHGy97/d1kxP1oGjvLtvThuG3XduScIgf30KNwNpmulOJTvyCf52gRK
         7XKA==
X-Forwarded-Encrypted: i=1; AJvYcCW0tqMnQSIXSdPKs+VMO1AU+FXwUcDZAtmxztmRvOpzPZchv2D6sdkTsBPGENqXsi0xuHtK9HlgNlI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf6xQjY7ciZDtcWJBLVTSDzWjKg0poi/X6LIgY84yEJAwrATvY
	QS4yb9MS0hFiPvKEbgOI+ofkmQj6sv307EKwvMHJ41qOI0gh8kbBD+sPlW25Nv3lHw==
X-Gm-Gg: ASbGnctly8H8UfAlKrqqKa9/LEXUUXdcUrlOAg0uZALDj8waqkfLBhADj+vJgwqwYlr
	8eR9ddgFtYov6g7jVk7YnuhbD6PTacL/pIVab3ApEY2UA9mdHbE8EIhstkQ2p3iZdvPmtcQn9oD
	ZY2aRfw/Ulk10NoiniAaDtkWMSTkbfNfqyyD0uSs9JSEx6axKPK2Sx8muTRrmgpPospDZ6rnvxu
	izFaGblTxHWCzFXAQLbBSQ6EcQfV8aLchWUrdMZNxX+5wOXptrF5BXnJuQ3B1L16lWdrGVxejWe
	PTU1k8EdqOV/cr2LMMIGnyuieqttUMnUG884dzVMBY+cpU+8TyPUGZY5d7QzTv91vi000pHXMUj
	VyTrE6dnLdxIVtJ6IDQzzy3IAOIkoWwjUhlncS7GNxB/6Bt6l4PU5lUojrWzvtIWr4JiROBSNEV
	r/0Gao8vcbkcl+IoaRhnFU7el6wnYbQkS1XwawU89fT6dUbQBLxfeXjkyzfITSoB+hNrw2J5e/M
	7MHBtDh7sn5sZ6Dg9Ogulm/Xko38oKcK8hglLUSCmFsKa5h
X-Google-Smtp-Source: AGHT+IF0lw6UPMxOI54GCBo7JKJG1+LZ2rspYqDbLEvP1hNh59C8ceGCTKvMsqz7bx9lnRT8BvUC1w==
X-Received: by 2002:a05:600c:840f:b0:477:952d:fc00 with SMTP id 5b1f17b1804b1-477c0176752mr164597045e9.12.1764053088489;
        Mon, 24 Nov 2025 22:44:48 -0800 (PST)
Message-ID: <65690c5d-4adc-47d5-ba33-dca5c79327dd@suse.com>
Date: Tue, 25 Nov 2025 07:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/24] xen/domctl: consolidate domain.c with
 MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-7-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20251121105801.1251262-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> The following functions, scattered in common/domain.c, and are only referenced
> and responsible for domctl-op:
> - domain_pause_by_systemcontroller
> - domain_resume
> - domain_set_node_affinity
> So they shall be wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise it will
> become unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra
> rule 2.1.
> Move them together to avoid scattering #ifdef.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I again think though that the title doesn't quite get it. While "consolidate"
may be fine here, I'd like to suggest s/with/towards/ or some such.

Jan

