Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA58AE8904
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 18:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025292.1400925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSYZ-0002Q2-L9; Wed, 25 Jun 2025 16:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025292.1400925; Wed, 25 Jun 2025 16:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSYZ-0002ON-Hy; Wed, 25 Jun 2025 16:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1025292;
 Wed, 25 Jun 2025 16:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUSYY-0002NC-DU
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 16:01:02 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 966fd072-51dd-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 18:01:00 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so4614046f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 09:01:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8608d4asm134216355ad.128.2025.06.25.09.00.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 09:00:57 -0700 (PDT)
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
X-Inumbo-ID: 966fd072-51dd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750867260; x=1751472060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoKjuD0rlflwuG2CSjCcyB+nKRUBL1XxuyWu9Ue/1o=;
        b=hGQIcWpJXDIJMhNYlFbXrrKEFO2z7GE04dO55ytJltRPpJRnjyXindPTpoWoL+kp50
         RQSJOA8+Utp4lbk3t/rJz5cIrqT+nAl3qoWrHO5ZqN3RfsMYxWw8nZo2I1ITu05M0pEs
         gVpfg6+Wq8rYfY7IAJu63szm6FcfIaIdlVaat0G7wM0D2hArKotM9Rg+vCSBphehLJW/
         K1UuV+6jAG7ki35dmHHk4nteZvjN2hwXVHMVmPXtIk4zFaoyY5bNFfiAogeK0VYws9pT
         1rIe+LkU253slpX8T75cSsJVVEkLuhohKfthO4VuS1P2gIxIMKPRKDyhOr+hLrMLZGq0
         4Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867260; x=1751472060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YoKjuD0rlflwuG2CSjCcyB+nKRUBL1XxuyWu9Ue/1o=;
        b=nu0ct3U6g1ScStPzFxsrQHvfKc/fsllNxXdKIF+AR+uYALFEj1PcLgTiDf2xfy3xTt
         yz4uy3sfCsbmkn9wyhX5bBRDgVDZGxuHEqz55Q51Axtk7GVMr4zLit/zVYjHlDPxRhvE
         VR1OdAhtaId0TGshn4ity9bgIsodErvpQzPbLjuLnxi7ZTWydYhHq49yZjUXpotiHm/h
         6+Fp0/e+qt8hUrt26X/mmD9pWIwZlSqahqvEUzOcIB3kxscrQ7RCjuwNUoIfaA3XEFMD
         xVIfckmDMdaRMY1IhC/70b3YtLzo86WNPZV6024j3l5zh746kn10WQPBnMzLgMp5e4aK
         Fhag==
X-Forwarded-Encrypted: i=1; AJvYcCW2BaNyReE+WUEMFQNJ64BiB7LLJojd8ByQuLt7O/do0GesfCb4+tL+rOj55/gQPDSU0oTHCD71Tss=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzxpR+natIr1rhGcVYRVLTHeZAXH8ecUNuESiQ8FDcyyEg1laV
	yBKSzWZv1LrFw9N3hEtNc3wSLxTa/90Q+zzx0MVGYReEBKuCXnPDFjXu8oJWwvQB6w==
X-Gm-Gg: ASbGnctrhsGF6YMDWZenMrVNQeUGNCik+9eALaL6hPwjCfp8AZyUKpcxD8YlXxeKGST
	TRs+vbIwhZ774IHAqyaT2V87PdMx1Z/VpWUZfWb/7Y1zWtdS+AYCoFFNSER07aQa8C2mT/OULVO
	7oXS7WVtjItrOo1hO7B98b0TQYNneIilFxe1g7WsCsZbbTEgt0C8yfdjPBlheY0ig1Yb4djcg0A
	X9gxkcXH8ULHdlODtJM86fFSiKHJrBKdK4/CYusRtwLkzXp9gChlf7WbangGO/1yzs6ayiwOZtn
	BYM/8DFBGugHja13r1rOExBL1jV6Hupauy9mcpC0mdh5uGv+rSB0cqCxsW3hexQ48+cwcorLvMB
	+26hCq+MrKEMZNRgm3hnhK2iUbZhhOIcXlyZUyPadTx9BwGk=
X-Google-Smtp-Source: AGHT+IGAN80m9k6Oyy6oEXPrzAvQ9yy96RroQd9YnSikeRZ9hK7mZo9QObVzXl5ukovbf9U0SGioRw==
X-Received: by 2002:a05:6000:2082:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a6ed5f20e5mr3463691f8f.13.1750867258104;
        Wed, 25 Jun 2025 09:00:58 -0700 (PDT)
Message-ID: <23206592-6016-47cc-87a6-151c76f254d6@suse.com>
Date: Wed, 25 Jun 2025 18:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] pdx: introduce command line compression toggle
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-5-roger.pau@citrix.com>
 <b7e9bca9-5fd6-479c-91eb-202f85efa44e@suse.com>
 <aFwZ3dSo1MHMf-Em@macbook.local>
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
In-Reply-To: <aFwZ3dSo1MHMf-Em@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2025 17:46, Roger Pau Monné wrote:
> On Tue, Jun 24, 2025 at 03:40:16PM +0200, Jan Beulich wrote:
>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>> Introduce a command line option to allow disabling PDX compression.  The
>>> disabling is done by turning pfn_pdx_add_region() into a no-op, so when
>>> attempting to initialize the selected compression algorithm the array of
>>> ranges to compress is empty.
>>
>> While neat, this also feels fragile. It's not obvious that for any
>> algorithm pfn_pdx_compression_setup() would leave compression disabled
>> when there are zero ranges. In principle, if it was written differently
>> for mask compression, there being no ranges could result in compression
>> simply squeezing out all of the address bits. Yet as long as we think
>> we're going to keep this in mind ...
> 
> It seemed to me that nr_rages == 0 (so no ranges reported) should
> result in no compression, for example on x86 this means there's no
> SRAT.

Just to mention it: While in the pfn_pdx_compression_setup() flavor in
patch 3 there's no explicit check (hence the logic is assumed to be
coping with that situation), the one introduced in the last patch does
have such an explicit check. Apparently there the logic doesn't cleanly
cover that case all by itself.

Jan

