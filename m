Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1377A1D3E2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877545.1287677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLnU-0003t8-Sa; Mon, 27 Jan 2025 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877545.1287677; Mon, 27 Jan 2025 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLnU-0003rF-Pk; Mon, 27 Jan 2025 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 877545;
 Mon, 27 Jan 2025 09:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcLnT-0003r5-Ei
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:52:47 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b981d8-dc94-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 10:52:46 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5db689a87cbso8496135a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:52:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbc99sm563124866b.145.2025.01.27.01.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 01:52:45 -0800 (PST)
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
X-Inumbo-ID: 75b981d8-dc94-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737971565; x=1738576365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5M2E1AkkkWgWZtZwdKL1Yi0bCFjwUkgo3HRAIXK7BEQ=;
        b=cWjeG5lgOFfUALrpr//DtF6ru9n5flTtW2R0ad7wDFSm4xbPQ1d7HGLy7kuQvsxPgh
         6y+kll9X1GxdR12Cdo3pDmQJt01N89fTGt/KLQivF7VEfJw6twruWOWoChLZKs8/K8HV
         hwctHAvtzbn//RTPfDuPFUADf3MJ2e6EtDw0QQc11LnP2c2MArtkmYqN2vf7F0AsP97u
         VEAhkIJVhAFCD3CixTaH8JGLG9RM9gg+Vt6dj3Szg6iUXOugOoVn0G00EpH0T+UZp5AP
         +6T7LRnJE4ULaPFY8OiWiPo2n1GSWSSlasZdi2MV1tGwFlAjxa57yEefcYZq2kXwAmb3
         LIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971565; x=1738576365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5M2E1AkkkWgWZtZwdKL1Yi0bCFjwUkgo3HRAIXK7BEQ=;
        b=Nqm56JpMGmKYudmsvWFlYt6pubu4jSADF5xX5+2BNAj8lIMT0XV+esMjbFL6kVS/6V
         hJeVRYED4gO6dFFQxWqTDvGqhTZocC4lLwMnIm3UNkZgpUbS1vyKQd2vtCJckSKcgxjs
         b/MvnZBMPNfngVxuivBbQFrLiHavEr4dMhOwC0LMHJL0sNvUOd9wi4lySPzRsgG+EXhX
         nd6lsltlUVnPFGGsrfBqUqDBLdb0qpheITnSG4Jzwg5FXNcmDYlxW7Pm741SveqzwwaZ
         uBqm2e01aU+Kj/AU3uwPcJaC/OVDdLCmum7qYZtERcwEmM2nuJ3NwHYdf+aZZYA6FE0k
         eClg==
X-Forwarded-Encrypted: i=1; AJvYcCV6riJ8vXV5gzkhR+Xq/ZGv3T1sibsBqloML/wslEmi6MMXNcPpXSUee1zzPWvzzdfG03NBu9cr1Tk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKpzAQbP5JAIKp+iB/wO8XdZmlhQyxW4DfVKsAPbkFgnRRwi9M
	0fDiPKHCl1tHwqHgkrAM61eHDkkIgDkRbM0AN196tCCBQe13l57VywbVglb9YQ==
X-Gm-Gg: ASbGncvAIH9MUhnS7CUW2n2oSI4Y/yGDTX+RbJ5OOhy/0PH+XKrP861pnFP3urmf0ZJ
	9CXv5KlpEkBqTyBr+Jwu88jCaDkedQHD6Leqx/hFcFvqQH/nycUYlMtMHZcVxgc19YX7vgoh1Tm
	Rp87xi8XC2Jg+RSA4tEUWL2cDJERkBXlhSQokQFJ0hEtu53CQGNxYEDPPBacI1qhAzQ4oFIPZUF
	torZdIC8RBLVd8TIw1Q5+SyimBeKxKEDJywwE95eukKQdtahSNeHTRRECl0kSF0xIStXQt8jnCu
	z5dAFlVu4WiImyGQA3Mt6w3f+tOkfie2+67kCWVE5UJcUM7CREDNMbLs5GsgwbIxbQ==
X-Google-Smtp-Source: AGHT+IEOS0gkaKPanKwaw5CcR07g8/MqPbS7atMUmzLmH8awyOus7kkmq/Tz18+pIU6XLns+PbJxnw==
X-Received: by 2002:a17:907:7eaa:b0:aac:4324:977e with SMTP id a640c23a62f3a-ab38b163018mr4375245666b.27.1737971565546;
        Mon, 27 Jan 2025 01:52:45 -0800 (PST)
Message-ID: <5395ceb7-60a0-471f-ab23-451ac7937873@suse.com>
Date: Mon, 27 Jan 2025 10:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] iommu/vtd: remove non-CX16 logic from interrupt
 remapping
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250124120112.56678-1-roger.pau@citrix.com>
 <20250124120112.56678-3-roger.pau@citrix.com>
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
In-Reply-To: <20250124120112.56678-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2025 13:01, Roger Pau Monne wrote:
> From: Teddy Astie <teddy.astie@vates.tech>
> 
> As CX16 support is mandatory for IOMMU usage, the checks for CX16 in the
> interrupt remapping code are stale.  Remove them together with the
> associated code introduced in case CX16 was not available.

Perhaps insert "now" before "mandatory" (then also in patch 3)?

Jan

