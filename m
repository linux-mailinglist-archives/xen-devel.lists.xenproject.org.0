Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5927AD56F0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011732.1390193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLU9-0001g6-00; Wed, 11 Jun 2025 13:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011732.1390193; Wed, 11 Jun 2025 13:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLU8-0001di-RS; Wed, 11 Jun 2025 13:27:20 +0000
Received: by outflank-mailman (input) for mailman id 1011732;
 Wed, 11 Jun 2025 13:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPLU6-0001da-Fc
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:27:18 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb06ef7d-46c7-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 15:27:16 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so3809632f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:27:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0eb103sm9076866b3a.166.2025.06.11.06.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:27:15 -0700 (PDT)
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
X-Inumbo-ID: cb06ef7d-46c7-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749648436; x=1750253236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TXLxo3XrwtxMwBNolptB8epMRFTAs3vg/bezIDgzMu4=;
        b=IUYhNQvwgtRdYql86uCHLmLZWXzAF/6241TC9JDmoUGjQurXzbTJwh7Wj4XpP4wMXq
         n0gP0+RBtPYCSnnVUMN9dsuVcHAHnSrhhNp3YhtRaKMUE6q6MCXRl2yOBsVOaa941Unr
         PxbHAQPTQV9PVNTAn86QUKnGwrHDwlEkCCyF/6yk6LX+jkD6GtQJ3MSnvzone1Dz3Qsz
         puJl4PBEpTu8a11rl0wxlJuQR/8vRgXPiqOJvieMK2/cxdF4egL8PCIV64jFFVKv9EoZ
         XUrRtUJdFWFLRCIrXiYaFkX8++2L7Fsgy484qEtQCNvsIyTllDeL9xGcU2XsiEfYxvm6
         4ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648436; x=1750253236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXLxo3XrwtxMwBNolptB8epMRFTAs3vg/bezIDgzMu4=;
        b=a3vVmrq+a/PaVBybVfroQTt6E7g2BxQL6JpeNDoU8yUm9cDY7e/bH5okSY0a1CClRZ
         +g3ZtwYk4tT3gAGrcGe8rRaJ3fmbgrjk+KSpwzEKKDpWRZ1l4fDfjLBS84MNt9P2lOlP
         sG50LHUEW+z8WD6HRRHOl+SSw/fEhCzoZUedvbFaYnDeNBAixjk6khD0nlz3wAqpRAPD
         CLIHBSAg+tXLBH0alqANCJ0TBriGg/ndYMMbA7e25CBrb04VrFwgDZM7Y7/nfqZfAyk6
         x2JbOUxdEJl6iYA8THjhd3S8bYL2ppigE51YzzwNzsMc9PDx2m16O9N4iBfbZA3KI9bN
         BdRA==
X-Forwarded-Encrypted: i=1; AJvYcCUq/62DoFdPjtJnnL7cPD6TpqQg8oJTwOlzASkan+Qo1WNtIInpTAd4kDhSQ6hLJmSfcTg10Xf2BnY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoykDog3JZYXGX4G/99cIRq/YAE6DdfaZdcUAcN91fcgS7f/9a
	hE9LsCf4Cxam1lsxczRznXvYs//9thm3RX/HENFvyEtsuYICblbMvzTqideoSyke8w==
X-Gm-Gg: ASbGnctX4dCaVK19VwFHyWvSE7/UqcZf/uu8wbQoSPgXei4AM+9tmeYcl3fCefQ//tU
	AySU+wn55or1CT7dbPwOPOcBtIRCQVmIW0NzsCBqAng0cESqPpvhDquTAyilo2mT+O7bkRvPKch
	6X8jOI4cQCoy0urrR29HLxpJeblffyAYsdLWXZetGJ6gU9mpaY57xFqs+TQi7NpgYxb+57N/ZHL
	2cxjx4w8SvEBwrODKHFpk2JGVxXbKzRFJcGOTEGcOXrEA4loc13KX1eHdtMlHivF4x7+uueDK2r
	NZYsJUQ0LaFGn1GrsZ44jRuYX4XFSC/r+OK7ZDdqZfz0ifnLx5JxGBioNFnoGWcbdN9K23mZS7x
	ZOEXJUMH2dlp2WpcF2ivDCng7y3NDNLu1qNAsCLy4Lmz2f4o=
X-Google-Smtp-Source: AGHT+IEBbrCzC93ctz5/x0wQ90UpACLEdUHNmCWQz4qsP1a3gZ1tmDxizmY1483TmlWPOmEXSXnDdw==
X-Received: by 2002:a05:6000:2506:b0:3a4:f5f6:b4ab with SMTP id ffacd0b85a97d-3a558a3257emr2373135f8f.30.1749648436335;
        Wed, 11 Jun 2025 06:27:16 -0700 (PDT)
Message-ID: <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com>
Date: Wed, 11 Jun 2025 15:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-5-jason.andryuk@amd.com>
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
In-Reply-To: <20250610225737.469690-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 00:57, Jason Andryuk wrote:
> Allow the hwdom to access the console, and to access physical
> information about the system.
> 
> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
> permission would be required.

Why would xenconsoled run in the hardware domain? It's purely a software
construct, isn't it? As a daemon, putting it in the control domain may
make sense. Otherwise it probably ought to go in a service domain.

Jan

