Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73AADD399
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018315.1395210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYjF-0006Se-QD; Tue, 17 Jun 2025 16:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018315.1395210; Tue, 17 Jun 2025 16:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYjF-0006P2-Lo; Tue, 17 Jun 2025 16:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1018315;
 Tue, 17 Jun 2025 16:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRYjD-0005wN-FK
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:00:03 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ff59d6e-4b94-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 18:00:01 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso4390097f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 09:00:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488ffed093sm9036662b3a.3.2025.06.17.08.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 09:00:00 -0700 (PDT)
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
X-Inumbo-ID: 1ff59d6e-4b94-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750176001; x=1750780801; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ki4IbC7ROqNGLBYTQOjKQFfjkG1lVUcOescUCgLCdP4=;
        b=YpoxWDKfpN5MVHO3UPIz7FqemKM4K2tEr6oq/KUM7Br9KCQf72Vd85VnPS90DvxTJI
         UvyjfBF2qe2pO6zSevXDQPNbSZ+muPWjzVFyiPtNHgFEI2RHrN/beAtx7KwBNZLYTpz5
         xvGW056WlbhOJZWdyPrz6QhR0BDFcyDNUCf2dBu09SnY9mvMXyajqrVQQxe5xD53mYOz
         ktNYQK7GmeTE6FxWjhgUw4lO98+Y69v4fOTpwr5mAH2Fe98E7ZUSg6WE30cEEAnOxWsj
         grt+bi4OTDgPBCPGWFBM8qiJHOdqKGTVYspCpQZOt/wptWCmKi3wx9Sz0xCgLfQnRP6Z
         s/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176001; x=1750780801;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ki4IbC7ROqNGLBYTQOjKQFfjkG1lVUcOescUCgLCdP4=;
        b=rwzj6An/g89gNedbXJT56bB+X6HlQG/rbTaav+o/yj+OXxWh24QPnJqL7XZata40n7
         6NQkuuKS1/zik4eMhK/tNgJGwINzu5QHLXgjVY1UUH3XiDjr69ZYNC9mJ4QarJq30lPZ
         f2LePOMajl33RBXEcuCFEKKbQBXnmVdVu0E8e/9ON+ARdVAdsghhPTX61KkOr+WHY7BQ
         sLoSSS9mM8d77UchRDSjR8KVCcdMVr0mDwEzIsw/hRfDAr1Rjqp0Rizw5APcdnnoKQ/U
         m8P7DmRwm4C9aie5Yli2nOlsAn9s0n8ra/oy7j+ryKa6L0iLIWTanWQjQVhlZ39GzpZS
         +UNw==
X-Gm-Message-State: AOJu0YxQMHNDLoEkxDKzqoADaUUzFQLRUTSQaNUfM4l88LtK289ZLfyV
	itOW2P4VMjpopQiabD1BqZ2yUkg8zYYmfAqW0oS9Lme5BXXT01DbWFCD1x6WbnB3l866a8f5CAs
	/ANE=
X-Gm-Gg: ASbGnctpfhaIq/vf58ckOfNrSaWRoY/s5WZphhJoGz6sXhHdpOHKSqjyqf8uMhhHX0V
	HRjUkLiJGus7Hdm5WIsYUIS8CR0ycVwd2XVToULWVlh8D2SZd1j2f0+PSCVZ3T11Ght1SK/9dqy
	/TBmMT0sMCCd2QAYR+Ooxne9HUX5Y3rZcFLgBsr+OLpsSQlmaWZTv2t4Y1aWIO79YTlz6fOHJwz
	vfwxKxuc2EuFdayHjsCsGBZ2ZP+MrF0Hird6Sd1HgAfktLQGm/r57toigUHP3vE31DmInJNm4LA
	3OPK+YUWbV+npaI5aOUUrp4psqouHd8JrzNOW2OFdGQ8Ui45blBKQ3f5DUy/b7qxlg/+56wrr29
	XiByJHA9Ec7146GTvgkbzDrMheWhiVEeOt845iFoPO2OZNoY=
X-Google-Smtp-Source: AGHT+IGINzCxn2M3ByB5Ku7GU9Z5rnexHKxsfNOb13WFVyR36K5BdxVRGSVr1fVyEKIrERZHk/JQ4w==
X-Received: by 2002:a05:6000:4387:b0:3a5:2d42:aa23 with SMTP id ffacd0b85a97d-3a5723720aamr9692354f8f.22.1750176000682;
        Tue, 17 Jun 2025 09:00:00 -0700 (PDT)
Message-ID: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
Date: Tue, 17 Jun 2025 17:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] vVMX: VMX insn handling
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Originally, while dealing with some other patch, I merely noticed the
issue addressed by patch 1. That quickly grew then, though.

1: adjust reg_read() for 32-bit guests
2: adjust reg_write() for 32-bit guests
3: prefer hvm_long_mode_active() in decode_vmx_inst()
4: operand size in decode_vmx_inst()
5: address size in decode_vmx_inst()

Jan

