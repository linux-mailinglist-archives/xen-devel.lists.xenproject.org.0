Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA4F818C1D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657024.1025634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcsz-0003uF-Cv; Tue, 19 Dec 2023 16:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657024.1025634; Tue, 19 Dec 2023 16:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcsz-0003sa-9Q; Tue, 19 Dec 2023 16:24:01 +0000
Received: by outflank-mailman (input) for mailman id 657024;
 Tue, 19 Dec 2023 16:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcsx-0003sU-Tu
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:23:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 033ccad4-9e8b-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 17:23:58 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3367632ce7bso435495f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:23:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z3-20020adfec83000000b0033676f9e4cbsm625678wrn.36.2023.12.19.08.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:23:58 -0800 (PST)
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
X-Inumbo-ID: 033ccad4-9e8b-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703003038; x=1703607838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoj6+varfKGT2kHc4ZbbguG1N80tdkubtxBSA/xNDS8=;
        b=T9/1g96h0QcTpypaRgyokL5IENw5QhM56b7uVTGsTVNdvUgv76pNcpWyrjYhdMOw1z
         hU3qStiSXGdar92cwnHdSdBdon62yDI9ekIqOr4jyG1MjnXt3zVbUX6lYLX66ilepf5t
         qMpoCvCSc3Y//fwKCjq4nEtUwhXJYFXRdOqxvD0dvcdD4/L8Bt0Nr5XmlmlMjUgW6bkE
         V9xIh1P2fGuaJW07x3/OEcSYXwCGn77ez6vAqb592WIb3GQnuZDdKVSuWds1fCuhV4Le
         ncyhSffYC4sXJKP4oLlfSi7GZjUMUE9BfcemIWCFPDkXFDCA2UTO/oUedPiRHtXFQTq5
         TAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003038; x=1703607838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoj6+varfKGT2kHc4ZbbguG1N80tdkubtxBSA/xNDS8=;
        b=VSjCaLThLQ3BM2Y/5Z4d6fmg0QYZ2ZDdKRBTc1VVf98YoH6cPlz9VolAaXADla438e
         p2s9w7sPOsB679ufrvXe72dU8zNUCUVz22B8+L3fNCZd4kz/XEC6FuZdcNF4NusolGZf
         3fNkGDwEoFKK2RujZ6oc1kuzMXBiJFmUVI92vZUB6GIKRQuDZcYaIABC8cGqES2gL6cM
         ssOkLiM4OT8nNyzJd3QmM252d2YQaM548EIzSNjLdPkyfp2/byR7fHG8qwVtfoCd6qix
         b37kSLVVpwTIaJqU9R784uK/+KFoiIXG17v6d7QroHwUCWSjq/Nhnf85fblooc/NRGmh
         Id+Q==
X-Gm-Message-State: AOJu0Yzc8Jworzxcklt8EZWWQnYy+2YKea4AuSmy4ksIxxWw54ZUKDV3
	1El3+hh6fsdFbOpGpD8MSrTO
X-Google-Smtp-Source: AGHT+IFvFelU4q0InQyzPAbbQPJ7Flb+BD/6jQvaioOm6WoJD4Mc3mF74Sl8xLuTLP+uxSkpU4ZNCg==
X-Received: by 2002:a05:6000:1d97:b0:333:2fd2:8163 with SMTP id bk23-20020a0560001d9700b003332fd28163mr10399768wrb.128.1703003038305;
        Tue, 19 Dec 2023 08:23:58 -0800 (PST)
Message-ID: <02a8e90e-dc4b-4fda-a2a7-50c12d356c63@suse.com>
Date: Tue, 19 Dec 2023 17:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] x86/iommu: cleanup unused functions
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-8-roger.pau@citrix.com>
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
In-Reply-To: <20231215141832.9492-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 15:18, Roger Pau Monne wrote:
> Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.
> 
> Adjust comments to point to the new functions that replace the existing ones.

And because of this affecting what was done earlier in the series, perhaps
best if patches 5-7 would be committed together.

> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


