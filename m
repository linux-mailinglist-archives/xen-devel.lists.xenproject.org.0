Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FA849C41
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676086.1051915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzPW-00057C-7K; Mon, 05 Feb 2024 13:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676086.1051915; Mon, 05 Feb 2024 13:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWzPW-00055F-4R; Mon, 05 Feb 2024 13:53:22 +0000
Received: by outflank-mailman (input) for mailman id 676086;
 Mon, 05 Feb 2024 13:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWzPV-000559-4p
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:53:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb68434a-c42d-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:53:19 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fdc653665so6486715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:53:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b0040fc76ed923sm8733163wmq.6.2024.02.05.05.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:53:19 -0800 (PST)
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
X-Inumbo-ID: eb68434a-c42d-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707141199; x=1707745999; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIKjvlVFi5CkKNLwlSC6jlcSYTnjZwuK2qb5cT77qAw=;
        b=BM7u4dQr9bLjPafSMCpRGr9BT1E3tQsnAggTT/6Jd+JT2rA25Ls4XtBQlTycW56D55
         6pYmZivgYbarPPaf5NdU+Wz9dRyYDCW7JcHvagWWSmXCXm1+93DN+VrsQNEjaConZ8FC
         XHEx+Ss/2q8FxA3PTyMD6W/oegoXWb06+tn83Q6MxC92SAiAetU0IFGLKp76878Er741
         3WdmXJFcit2m0dU7k0aoFuK6jXVnqN3y+FZ7s8Ghr5HZd7MwrTY9P4StkuQJP6d03xcV
         ZS3skGUptbD8Ypxb2Ro6oCf5ajXZhg5KN7nBYMMGVpUOTHvZ0zl1Zmjo7kDGXIj3qWI0
         wkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707141199; x=1707745999;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIKjvlVFi5CkKNLwlSC6jlcSYTnjZwuK2qb5cT77qAw=;
        b=DAjN0f/8683kOPbCCW2J12Kfb34d+SOUUg7Elk7MER46+qGc23WQpT3uhwMMbdGPoJ
         v6SVh5Mq0qQWwf4mEGY8ERVoXPHtfZ1+dbogBsbenpPu03s4JTjYm5MpE5kPF8I8/s/R
         aPNeAGE/KVnhsWJQjAQtzczYE3zs/8Udsql26yCp88JOc7qoxE20q+lE5a3dBn2zlMlo
         P8dtVL2BZbfye6f5Njuei8fwWosc4Dnw7dl/GTAAUtM6Uy/n3GHNTxg8XRkkMTaqm5Yv
         +Hn/VADTITDkMJPdrpeFreuTWpZ4j+pLOQnUmR0eARDR5ZNEz/fuEJ+UF2lNxIgPSEC9
         Vp/g==
X-Gm-Message-State: AOJu0YywcAL2XkIPW74pd0iVfhvc8xDRLW8hUHVUmGnbgZxTEy2/ShvZ
	ZJlSCSMBGMDY1SeIoUmRHZbON88VuM6kwXRe+Iu7EBdIJU4n71Zxr3SW4NCiiJ/3pWAzO6+taK8
	=
X-Google-Smtp-Source: AGHT+IHs2ujKhyGseOly8on/SYHeEp19k590Bb3bNtNsSuvLOS0B5sSukZEsVkDwE7MjYnZZnafLzw==
X-Received: by 2002:adf:e50f:0:b0:33b:1ac9:1545 with SMTP id j15-20020adfe50f000000b0033b1ac91545mr7656047wrm.17.1707141199504;
        Mon, 05 Feb 2024 05:53:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWBIQGtkyXi2j0tqiTFXHiVLevIAVSsJfACJXnoa707jZzkY24vls+WEmiZr5qbDyWWeV1bB6MREOXsp/bF1S0wBcvoQUMqwEUerEvOskpyB4yt
Message-ID: <25506838-b818-4686-8c16-3a198338af44@suse.com>
Date: Mon, 5 Feb 2024 14:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] VT-d: SATC handling and ATS tidying
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

On a Sapphire Rapids system I noticed a line in the serial log
indicating a DMAR entry type we're not recognizing. While arranging
for it to be both recognized and respected, I noticed some further
potential for cleaning up.

1: VT-d: parse ACPI "SoC Integrated Address Translation Cache Reporting Structure"s
2: IOMMU: rename and re-type ats_enabled
3: VT-d: respect ACPI SATC's ATC_REQUIRED flag
4: VT-d: replace find_ats_dev_drhd()
5: VT-d: move ats_device() to the sole file it's used from
6: VT-d: move dev_invalidate_iotlb() to the sole file it's used from
7: VT-d: move {,un}map_vtd_domain_page()

Jan

