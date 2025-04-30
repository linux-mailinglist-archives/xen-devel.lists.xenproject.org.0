Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF3AA5060
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:35:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973765.1361818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9TE-0004JQ-ER; Wed, 30 Apr 2025 15:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973765.1361818; Wed, 30 Apr 2025 15:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9TE-0004HY-BK; Wed, 30 Apr 2025 15:35:36 +0000
Received: by outflank-mailman (input) for mailman id 973765;
 Wed, 30 Apr 2025 15:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9TC-0004CA-L3
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:35:34 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2cd32a-25d8-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:35:30 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so11990295a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:35:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb0becsm930188666b.167.2025.04.30.08.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:35:29 -0700 (PDT)
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
X-Inumbo-ID: bf2cd32a-25d8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746027329; x=1746632129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lGt5RB/CuWxG3gjCtbFUNTnvTo8j63pP6rCc1owRjsM=;
        b=ckixHHTq7OxHx04APlzVFoyhIrYQDgJmPprslTHOBtnbvpb45Fyneg1Diw3+Xg289i
         8PWpxpp4CW1g08k7Ht9vci/D+ubJxZgTWdRJf0AtXm1m8vHOZYKTy3nyldhrPnjY6yI+
         vfJnS/RC8pa2HnhcX9CEiEZ91t0wuEFPWaJk6JS+c923z9U3x+/DgYlwBsZpVKMgrgl2
         echINKtKUwnVDOx0+TV/TMSLWxRIN9Vgly+SGqLqJh1IGIqgh3uvwDTrhRYyqkPpxpT3
         vR4kC/QtRGaxnmiNZFT7yaWId/FSiiPZlwS5by418pF2rNRR3YZhMAYKtamPnJNLXmDj
         1mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027329; x=1746632129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGt5RB/CuWxG3gjCtbFUNTnvTo8j63pP6rCc1owRjsM=;
        b=F17ik/LXInUleuLSz3KbAKZ2UmNLyzI7rF2j4ANWIYPu2nuhMPNstoNU2FBPd090+A
         d6IXMkf5xocp5FdS245Tm0S6ukw0qfST2G/NRl4+5U/tkkE5dWGK8+slYxIJuJNmnvSR
         TXJf65ioND5uvyyRwCKvIAr8fJR7MI02DUd5ELqhrFy7qchxm/QDiplmp8BWomKc/pTs
         cHUU/huB0vdr0xzFfhT7u0Wh2HGdV9aGfQ33pRkycHQCz7aMczzryxXn+arKaybLfAJQ
         PiXWD3cADoLVuI7+fsnPoSZQRuVHCr+pQuUrnZxuuttHG6RNw7IbG/t5n/+s9JMM9Svm
         Ybcg==
X-Gm-Message-State: AOJu0YwkEfylhux8UZTWeCcmPfOt3uHFY0lcxKA1wHLGZjqXRt54aFFL
	s3qBa+qPK0MFFu6DPtDum3IJR0FKHyPmqgPNqH7KHCEGfRmfyB+HTbscJt8v+w==
X-Gm-Gg: ASbGncuH5CntCN7ZA//6v9W074wfpy6XxMLcTu30XD3ogJOd6Y04/2lmFA1pChai/WM
	vDktehIOGCAGRDqZODtuwyvZNxDETaxb8omlxhnyFLnPgYf+SBlZPa/Gb05cTT7UXcWhifBHww1
	ruX9M8/UBPCA6bcCrpiziHfi0dylTsn12vtqgPGjeNvMLH+b0462xeP8Ql1zL8OWYatVevIL2Pf
	dMjIe7DdLemZnSVZZ7UX6dEQnwWYQgjRiyJ7Djt1nFftxeQqlTcYXncVxK+Dca+0zgvZTQZ4o5I
	gll1R7RMDxc/alfc66BogvOf7qSarD87cK1dLaiz0kL96ADPDqNUNeFCm3P4DVJsL58PGCSp8Mf
	rRuSoOHhDYOYN6PgFRRiPXN7ulA==
X-Google-Smtp-Source: AGHT+IFAQA5qed+p9F5KNLRJkfcEF8DBXe8AB05z75IZ+KIniEpjta4LKZo9WU5vwqxYvqJrBtnZ9g==
X-Received: by 2002:a17:907:728f:b0:aca:b45a:7c86 with SMTP id a640c23a62f3a-acedc579956mr359528466b.1.1746027329506;
        Wed, 30 Apr 2025 08:35:29 -0700 (PDT)
Message-ID: <5d57691b-4f77-4c1a-b504-cb6dd8405704@suse.com>
Date: Wed, 30 Apr 2025 17:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] xen/sysctl: introduce CONFIG_PM_STATS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-12-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2504211412370.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504211412370.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.04.2025 23:12, Stefano Stabellini wrote:
> On Mon, 21 Apr 2025, Penny Zheng wrote:
>> We introduce a new Kconfig CONFIG_PM_STATS for wrapping all operations
>> regarding performance management statistics.
>> The major codes reside in xen/drivers/acpi/pmstat.c, including the
>> pm-statistic-related sysctl op: do_get_pm_info().
>> CONFIG_PM_STATS also shall depend on CONFIG_SYSCTL
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



