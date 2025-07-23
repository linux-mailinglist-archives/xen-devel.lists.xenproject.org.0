Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA42B0EF96
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053717.1422507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWYZ-00043m-28; Wed, 23 Jul 2025 10:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053717.1422507; Wed, 23 Jul 2025 10:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWYY-00041x-Vd; Wed, 23 Jul 2025 10:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1053717;
 Wed, 23 Jul 2025 10:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueWYX-00041q-MF
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:18:37 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63bf1a36-67ae-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 12:18:34 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso5769436f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 03:18:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ffb69b8sm8501644a12.71.2025.07.23.03.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:18:33 -0700 (PDT)
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
X-Inumbo-ID: 63bf1a36-67ae-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753265914; x=1753870714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=owwXQGUS++Tkp1IlXzaA/XdD1K8YbVG7sAfgC1SIjzc=;
        b=C2SZfstNxaGFzFx2PRHhyJo2kipgwSktxIcynGptoG2GHjeIBDo4v4yEbFNC+z0vYA
         JKZ5JafDDMezXlXgGP7q6YTO5ampqZCkQjk4sicXUp/fxeomrnck6VrxGSvjN/XGSEnX
         x97BtPOp2eBfqRcGun+Z+RGyLl1X+gfjQlafjt5Ie6W/91Thcyi1eymKpXdqHLjcfwCc
         CeJVpqLrk/F0+m4rj+rfkrgimZUvGxRJjfXQEpAXyvV+zCDWje/POkjwXNNNViDFjZ5h
         9amFjf0Ju8QM+bB7eTQooyPpQNsWblnwaBmEd303wJqynHJuiw8/HsgdHwlg2EszPHb8
         s0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265914; x=1753870714;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=owwXQGUS++Tkp1IlXzaA/XdD1K8YbVG7sAfgC1SIjzc=;
        b=EjLB6bJ6FUYRcmKY1+vgB1P1tdRkpeDLpmVt0sRhi1vIWMCKi5YbtBuXQ7z2L4OxBn
         FuCswXpfKlhyzeDlHM48qYS4HoJAytBD91buX4JxQX6CU6obATyeVHYrXppK8vwKafWE
         BP0ZUV8U4BjAcvEgZajHUkxFI9vTktBIxKY7R/X6WbouFfVuCJNIOHsBMoYoq0vYSi8H
         Mxl5x4deKIfsSBt5O4yNkh/r8MP1ocWDhu+WUmJV2V34JK3JPxueDEBCnKHf0xZwA+1U
         nWDaTqhroNw8vlCP0JTshMDJPjxOAopBg1hE0/N0ECxThEkiEpK8p81e4HoUTNJ3AeIv
         ibYg==
X-Forwarded-Encrypted: i=1; AJvYcCWuHvIcWFEmfc9HVgIxQ1BLG9o9T+T5B3W4HpLX7lkHMwe/PO35uHiJf4cw7Qs3uB6QKg8O97Vq9+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyJoEIGNkudk3MvXJrFOgZVCuyC8O/Hep3CSwI1vpubw2SldYb
	BtaZfgy/oSLETmeEb8dVrw62kNhXoPVOcq/Ysm2WUmlcfbDO38RB01e9RvoEakHELA==
X-Gm-Gg: ASbGncu1jfUJu1QOQEyehJLcp+H0eE5heMC9f+x5+bt0Z/h85+3y/Hi6oLDPU+G/iUB
	nmabCCRfLBhlIyU4bGkA3/t0q+rOLrhsB3sMM07Qxnku3pn/eCFLlENmLG9X4AcX1783L1kEizm
	2C5/y5eEgap5CadyA4QgdyjiQHdxD7thiekV9NguiCDj3ua0uJLLXU//3VsMwaSPKyr9CwcNgpi
	HzLXZesiP9Py88fzuyU90vag71s4EZi+JRrxD8k+UgkL/Gsy8VZacCzm4nKWWIFeIQL7QIIS7UU
	tHTzc/2jGM3NesR+P/SW/wm0sxcJE1nDVn16ClgRonRBPMqAcqGzLITJRQ3DN1I+3AYTHw49scl
	dICIriuxSqmnTZcwXOxFtVBIlGCFGzBeNVuTbqeXgbTxX6GjYUW+ZjqeuFOxUxJTlv4PT6YNsj9
	t1GzUNPdU=
X-Google-Smtp-Source: AGHT+IGUeASFfYxsz6pqqtaVZIoBYJGRVaOgrrgyZ8n0ekElFvqHjxYkdSlPlvNlnhoeqUuH1Zr7RQ==
X-Received: by 2002:a05:6000:1884:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3b768ef6c48mr1780230f8f.29.1753265913711;
        Wed, 23 Jul 2025 03:18:33 -0700 (PDT)
Message-ID: <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
Date: Wed, 23 Jul 2025 12:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20250613154847.317979-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:17, Stewart Hildebrand wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,8 @@ config ARM_64
>  	depends on !ARM_32
>  	select 64BIT
>  	select HAS_FAST_MULTIPLY
> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH

As I just learned, this change (or maybe it was the "select HAS_PCI"
further down) has exposed the quarantining Kconfig option prompt, which
(aiui) is entirely meaningless on Arm. IOW I think further adjustments
are necessary.

Jan

