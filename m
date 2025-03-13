Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D415A5ED86
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911324.1317775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdYj-0001pI-0x; Thu, 13 Mar 2025 08:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911324.1317775; Thu, 13 Mar 2025 08:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdYi-0001nZ-T4; Thu, 13 Mar 2025 08:04:52 +0000
Received: by outflank-mailman (input) for mailman id 911324;
 Thu, 13 Mar 2025 08:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdYh-0001nR-TQ
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:04:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61176d3-ffe1-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:04:50 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so3982675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:04:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0ca2sm44315325e9.37.2025.03.13.01.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:04:48 -0700 (PDT)
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
X-Inumbo-ID: d61176d3-ffe1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741853089; x=1742457889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wRCbB4hgvl16dZkTT7LAZzvbc8nJY8+d+MZ2cB8yygw=;
        b=Woexr9urJCgprEbyA97mL4FdzuGhF/HS+5dAW3n/279I1WuRE9gOmP48HW98kAviLU
         pQS0SWardMdpnTDAAk2CEFe4cjRqmdqsCQttJwIHnLqqSseIblqMKVySM3Emc+cB+p21
         hpNorZceKuwtXEPUhkoUgfVgRUnCnO/oSczI+ghaGrhV349ldHs5+Zk5EhBMZLDqtYwG
         MGSTgJ6iKH+llukUwDkID00U1+swOatDbO8lNZ0DniCc/YuqpkYX7DdPewQsI8QqsmeT
         EYcf4pwV2Ly+4shcrIVjds9hm+dbCBh8EBWBLUmxHQbSMEKYSL6Ng34Sg79ViJit/BEJ
         Hhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853089; x=1742457889;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRCbB4hgvl16dZkTT7LAZzvbc8nJY8+d+MZ2cB8yygw=;
        b=hJAY2MmzojZDNjF8TI2CdL30Yy+oWOvrZDORGMUycfHM2Hl0M20bG+nBB8SpDALo8o
         R/Yho24l06M2AH3EdC8Htf5F8C2BVZJPspfLKLX1lxat6a9+qJKM0sEnX8Wdg+I2nhOa
         c1mXhlqAx0wBiMYEuefamt63yE4Pa581CXFzB/iEKIHc4RSjsDmV582mKY8MXZGEOMIM
         DhMWl1JyHERtOYTUNLBqXmuztQffR/4gS45ZEzsra9trOhBlluLYcWS+Mq4A3ZefVnZd
         kKSiGv+99KIPNE+0aee1ZeCdw8HfI/Tf2C4ZO0ST8WmPcfK4wKFoR7TRJ/9XB2Txh0tL
         cE7A==
X-Gm-Message-State: AOJu0YxeOedb3CvE8iHh3Rx2+u0v2+PBu0GduuHWbfSdXpKZfT/A2HFJ
	8cLSDcw4Tl/bxjB8KK6N2kuy9ZX4YURZwKQq8mee6ftYNb8xYgZaKLSokNJU+vSGvdhp1iTLguI
	=
X-Gm-Gg: ASbGncuO9tMKy60XtRHFoTKv8AU6VhbPZ7CcfDkkPu+l/Xdeprc0SLeJzTHgfwjeqYn
	sSC7XP6AvVACKIIgrF0SP34FGZoNaOifIDqwokxEqHVY/o+erLLlOIXgDBeEsJfhL7Zfsu5FGya
	8GOBo6y+IT6F9sZpzZdDpCBXp2M4p8zCNaFLwq5Zar/lkxFJ1SjA41aaAYQR13G6NFCtqptlbeK
	p/xedJy2b3cOl3G5knwKyBVoBQX2ZWsQ5k5oAI/b7edh7wekTomNfCvWrj64fLwxqOXDzveuMIZ
	wJ0CB3uILTegLUYGjjVn2iHY9OeFzApK1PvRgH+s886YJATLm2UQrsIqty8706BD9Kv1qKXlwco
	RGzbCDn2DisVJosbC7gKiB+zcgEjRwg==
X-Google-Smtp-Source: AGHT+IFvujoEfpihy9PKG2IZcip5fOo1UWkC+FsVKTGdKQYyUwjzJIPbs29LmiODz4mY15fYCrBQ5A==
X-Received: by 2002:a05:600c:46d2:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43d180a4435mr10696445e9.13.1741853089130;
        Thu, 13 Mar 2025 01:04:49 -0700 (PDT)
Message-ID: <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
Date: Thu, 13 Mar 2025 09:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 RESEND 0/6] (mostly) Arm32: add/convert entry point
 annotations
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
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
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(re-sending upon Julien's request)

Besides the (now) last patch only Arm32 adjustments are left in this
series.

1: Arm32: use new-style entry annotations for library code
2: Arm32: use new-style entry annotations for MMU code
3: Arm32: use new-style entry annotations for entry code
4: Arm32: use new-style entry annotations in head.S
5: Arm: purge ENTRY(), ENDPROC(), and ALIGN
6: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions

Jan

