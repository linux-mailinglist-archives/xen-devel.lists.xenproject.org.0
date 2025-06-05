Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7BACEE4D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006635.1385860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8Qm-00084M-21; Thu, 05 Jun 2025 11:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006635.1385860; Thu, 05 Jun 2025 11:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8Ql-00081o-Up; Thu, 05 Jun 2025 11:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1006635;
 Thu, 05 Jun 2025 11:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN8Qk-00081i-JE
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:06:42 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28bb2e49-41fd-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 13:06:41 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a51d552de4so476915f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:06:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235eaa07e4esm18339225ad.54.2025.06.05.04.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 04:06:40 -0700 (PDT)
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
X-Inumbo-ID: 28bb2e49-41fd-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749121601; x=1749726401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5TL2OKvnFRZvlLf1NeBvt0g3XWO8GC90uoai/s0OHfE=;
        b=AoIIRt9PFw7enhE2SEfE/s0u7MnFdHhqrDHTralm3SsTUn6geRApjqY/iUNL9G/WtB
         1Ijk4sEBgemGLQSRrYJ47T6U52DOepdeS0aXtgPzNRLDXvUibrw6tFkoibtmvB7arY3c
         SRNIeKQFVBBjig7miat8zKuCr3aBF3il2Jzokvgx204xQYA3chxveHZeGAAaosUtBkT+
         0OjDSfX6da3k9z5h2s+9w6WSUcNulbqAcyFNATbh7iQ21LEvOV/hIZRAuZjGb1ErrIi+
         oOTJOHRRbBE2W7GsnyrNWNY4jqi/+1n4t6FvV0c9vF4czGALJfyb53nordY3ERQBn5Jf
         UIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749121601; x=1749726401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TL2OKvnFRZvlLf1NeBvt0g3XWO8GC90uoai/s0OHfE=;
        b=wLtkuEuXcDc8bGuSAG0Sf6PzTEShyKpa69O2ahSbucSbato2c/oYpuBXe+9oGBBFBM
         MFJVYP9RIrIZsrvMccWzJL1C2b0f1HXW+it3n+6SxhG1xU/aoDIo0uaWjCfKzSab9pJA
         fS2wenlaqVhTSz0TrYGOu+OYPSr/Fh9PfNo4ROWlv5MhkxgTAeOpsL7BomD9Q66b0ecc
         y/kSrTv2UOFFOnhA60y1JXOSIyJFPocnznZx57JE29+/tdk1e80AKsE9RDSSyf41k/wT
         ammA7kENw+3gybUWyfGLqDRmFy4X/TM55flo+H57+S69boxZTjxUQS0W8SQxritB+UNY
         2nQA==
X-Forwarded-Encrypted: i=1; AJvYcCUNeNbfcA4di0OB1OizaRm6hKBurQ/8e+5uPzNkOvEoC9tJS670jkXItaFXEXySeObES6XGsSWPupQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw32LBhwnU7/R7xowjj++EbuvpIJx1+sphAaJPS2e8A7uXDedjC
	LkjelVpystdNuEO1ITkxiUUEIVtjKz0sDAChQ3xd5/jRcTuAg+S30KOUTd2uKYyOkg==
X-Gm-Gg: ASbGncuDtqVZ1YJgFH3MmdbVufa7QwJoDwk4h6xM75Jabacx4x2x8bhCem9E1xcAAKD
	+uv2GzQjn+qhh3UtUIsdX4ffRosYFMgn3b6FzajbNBe+OR4x6rh+7Phm4fzmQI6P+wW/K1XBjCG
	+mxEDONTpJIRxX4m4hjHpk5x2lP12hO6yRONK0rUPsYni1wnKS9B0loGBrNOkn6L6h19kJmXnco
	IJv14ECfD/BjGnWBjtHYKAXWkpU50rv9X4Yt8cJeq8OCjS8yJuoZarcm7vjzT8TU6J/Q8kKyPne
	F0qp9SMsVHFkGrruMS+SYnfPNgNthhCOz8jz7s0DTQJz0EGHCtVx8MsOl00y3T255IYmCxmpW1w
	SFOQ+1cDtRtg/pDzcEUxPaDgxAT7BOKZI5PiI
X-Google-Smtp-Source: AGHT+IGz0R9HriHQZSH4zKGGAi9IPK4HigC20jCS63PZqUJLXSskun3P4fssi5FN9L+mjAAqakzU3Q==
X-Received: by 2002:a05:6000:178e:b0:3a4:fbd9:b93c with SMTP id ffacd0b85a97d-3a51d961b26mr5392800f8f.30.1749121600927;
        Thu, 05 Jun 2025 04:06:40 -0700 (PDT)
Message-ID: <bbf64feb-e6bd-48e9-a1c0-460bdad020ac@suse.com>
Date: Thu, 5 Jun 2025 13:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] crypto: Add RSA support
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-4-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250602133639.2871212-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 15:36, Ross Lagerwall wrote:
> In preparation for adding support for livepatch signing, add support for
> RSA crypto.
> 
> The RSA code is extracted from Nettle at tag nettle_3.2_release_20160128
> (https://git.lysator.liu.se/nettle/nettle).
> 
> The MPI code is extracted from Linux at commit eef0df6a5953 (lib/mpi/*).
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

This looks like it's independent of the earlier patches, and hence could go
in right away. Then again maybe doing so wouldn't make much sense prior to ...

> --- a/xen/crypto/Makefile
> +++ b/xen/crypto/Makefile
> @@ -1,4 +1,5 @@
>  obj-y += rijndael.o
> +obj-$(CONFIG_PAYLOAD_VERIFY) += rsa.o

... this new Kconfig setting appearing (eve though the lack thereof wouldn't
break anything, afaict).

Jan

