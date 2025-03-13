Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B42A5F601
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912152.1318476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsifz-0004or-Ve; Thu, 13 Mar 2025 13:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912152.1318476; Thu, 13 Mar 2025 13:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsifz-0004nG-Rq; Thu, 13 Mar 2025 13:32:43 +0000
Received: by outflank-mailman (input) for mailman id 912152;
 Thu, 13 Mar 2025 13:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsify-0004nA-0Z
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:32:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a317bfc8-000f-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:32:41 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso6330145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:32:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a4c2dasm20311705e9.33.2025.03.13.06.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:32:40 -0700 (PDT)
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
X-Inumbo-ID: a317bfc8-000f-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741872760; x=1742477560; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS91R4lqSFQb5EgX2ajpaaJQDBB/79zDPw+ncyKE3OM=;
        b=QuwrPqI9Yw5yhIlcGrG1QMkdxN5yCaYJtdSRzPQDUmwdNVJ5S8i0FGDd9lh7s72vhm
         L7ET544K/M8wOwkgtJe2xRpA2WZAKNW3W33273bxdvM85Ny8RbelU8QjUFhZH/gEZtGk
         wsOl937P0Fzyw/R76TlJ+NoKgWTVMPhd7s4yrE0Efgfy6Gfx0omVLTUOQPzhwYfqgFvi
         ShmNXRUbmerkyq3ooDysztPMWKqf8g/0P0qhkzZoZXulLC1TpVQrdRWL7f/XnlcO0RpK
         Uotq3lOjYFB+yL4tdoQV82etquADMPPIN39w71GM0jZYE0DBaovwRlF9VqRADsHbQSFM
         Vd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741872760; x=1742477560;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pS91R4lqSFQb5EgX2ajpaaJQDBB/79zDPw+ncyKE3OM=;
        b=bdE4UBq6xpyILRF5kUyH/xVRTgp4Ej/BmW2HLrtL9qmfRgtqWeqvyVWuqC2ncuehRG
         KNS3vIcNlOfunfp6xeDL/ou6uRuaQPXnV/flqsKelMXKLb4Nb77vtBIyVvqqPxxPTmqw
         xz84hn4brSgrofDGL5qPOEAl0txnCRmAkzE1tWceJP01RHcxG8IuiWuZYFWj7K4M19O+
         J8b7mYvAdURp+WJOtycTSZpo4YLzcg6wiOr2thZc/EsU+3K/qCzkxV4vzz5KFgu/UCnQ
         GOWozgwVbV88qqMfe82lsPi1zqZr6MRBCUVcb6okORc8duCXWHxmzb6nVEeJorBVGT7X
         ngjQ==
X-Gm-Message-State: AOJu0YzdiWWBFCiuo3VByqTNi96u/FFlUm+eIfMp7txdkvdOZ0E3TbPN
	uvYDSsUBsj/vzLq+nXd0ecdvNbim+XpHWhjulXJMd6r8kXFG8ahQiMke4JJJ+Hfkvmo6k3SMnnU
	=
X-Gm-Gg: ASbGnctd0dCjvsYibX9M9GfFZXYaflPa29Y7uEjji5wnqG/FX1y9lFJdr8Ddy4jUcfG
	tOQk4rqMjLmdMbsGJGRdaViMDREoI5H6DfqfADuBWhDb4BlptNxEzv0OvZvFgE1LBmnQw1WgqRm
	9c378KM3SUr3IHadPwcZwJ4O54xeXQwKAUVFj51Uf/r9NbcC5gVVhV8vaJ9m03lRXKPMk04hqKv
	DdsiKFpPbLOw41c13+cNL9za9A20mRGbqLTkV52kBDuzWOjtoyG8KQD7HMrF6DRAoKJe4VnTJ82
	kTG0jpnaFkD8ScuVbaDLH1QGdnHk59XmLUX/Qs/obh+34jK5OMDXc75GHDDObT7SPznnDZuPH2y
	IaVGDBXgmu3n0PpwMigAWDPHFA3QDlQ==
X-Google-Smtp-Source: AGHT+IHillONlWUY4GDGVx5bJ0xxX0XbLzFEBH3X+TGyQsDtrVhiA2kkPIlffRQodAO/IsKai8qz9g==
X-Received: by 2002:a5d:5f93:0:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39132da07d0mr21436154f8f.39.1741872760483;
        Thu, 13 Mar 2025 06:32:40 -0700 (PDT)
Message-ID: <8b610dba-0ce9-47ed-808d-035dc48f4f04@suse.com>
Date: Thu, 13 Mar 2025 14:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] VT-d: set_msi_source_id() (XSA-467 follow-up)
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

1: move obtaining of MSI/HPET source ID
2: have set_msi_source_id() return a success indicator

Jan

