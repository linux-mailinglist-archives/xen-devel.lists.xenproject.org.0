Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF7AE65ED
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023679.1399720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3T1-0001CU-OD; Tue, 24 Jun 2025 13:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023679.1399720; Tue, 24 Jun 2025 13:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3T1-0001AC-LX; Tue, 24 Jun 2025 13:13:39 +0000
Received: by outflank-mailman (input) for mailman id 1023679;
 Tue, 24 Jun 2025 13:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU3Sz-0001A5-Q3
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:13:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0994087b-50fd-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 15:13:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so292735f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:13:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c882cd07sm1925774b3a.91.2025.06.24.06.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:13:35 -0700 (PDT)
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
X-Inumbo-ID: 0994087b-50fd-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750770816; x=1751375616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KI6wTPA9FrUcD9wPw3OdqkghzxDhy0OsQuP83Sb1dwo=;
        b=N9lluWg1svRd/r4ETPZoqkohPztrY06YUId4yLRZATeZGjsSpAaE07Ng5eqhdSIQBK
         Wf8bP3M/BhLDMR6ZS8gBxwTnDmF/9d1ofOAdaEVHUdFoIgs8v1flXBwcl+QEHhUpLTgF
         8Cz0hcIB01M+4kCsg0/vCBDWfEVr5jX+Ys2FNyuQwW9Zn/HbHSMzufOEYXULdgKW+Ftb
         T8Q0anU/BFOyeq9PwhROQKeV9EORKrY3RT+K+jVuTyov6mNhTs0RvxOhUq94zZWaQl8N
         CszQhqakMKlIbY/f8NkpAKHDLq/+bcoeQXBoHDNwKgdogpfmrcVJkPARzc9AvdFbMmBU
         f5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770816; x=1751375616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI6wTPA9FrUcD9wPw3OdqkghzxDhy0OsQuP83Sb1dwo=;
        b=h58YnzEQameWF9jjG51LeCcKZmSSNJie+7PU3zcZrU/uXt1FU4I304eU3+gNFo2tNR
         zpvyJvlVHJ/rAisGBo4rsZwVVlPyGMsmnNNfIL3/zvYTvcWx+Egn28OKTNdbN7UfzjUK
         g0BTCej2pFIPbdcsZQUUPOpq9xDBLH1MCdqmjwgil5Tyiyak20RfXSv9GcHUiW3Xn8PQ
         MLpU6TAzYQEcW2p2ZRSikwWDXKzUuplCiQlbxL73r8ziA8uBUZovQiqpqYcXCCD5WA7o
         Ld6EURiiignA7dqjLYtHxFu6swQk+7cPpJ0316GJIKKq75kF9b7TETT9XnOV4jwdLuok
         qYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVobrqPN7ebSi1YMHfVAOiLlRf3nbIdSJuM4BK0LJ0J0KIcQSMjqx0tU+YcsiIAkZDai2E257QREyA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNix/gpqwrblmcqPFXQ/xu6EDz9l0AwZ/8IfD7dkJsSmoYDYC3
	CqmfwgFyput4F+2kdZSg4KTC6ceGVg2jiI0JDyNlCyzeGvAXHjUEFDs17/nmfGkM9A==
X-Gm-Gg: ASbGncstHoHnO1a5+xPDdEvrb2Zi33+eKFKyOzRPPDmOhDvJ504domEAOSlflgwcNx2
	nMeSgG0ZFS9EjL7A1siuwtCCTF8YIIgKOpLvyWQxf5l0MYt/Y9VRlcmjs/FwMHA7Ukpd5cL72Ta
	geDKiVwKhj3mtHt63BPIQ4VelCDBdlhKULabgE5eMqDC929/3jjckz4e3FnKVJl+3XSLihzEkKY
	X8Y08IY+2C14NLQmeV+0P81ARV9V7Np9J7sGOWk2U/TrxWQ9ltOLoyzrcIjnRtMACZWg7FrMXD/
	BbUOXS/jbUgI9lMya061pEUjUWtGQCuugOp9K5x2lx3NMkYkDidBcByUaS0aHhDoFT5INxmhBrh
	QCcuiRIPRhyFk8YstEgK4gf+4vnSxms10uzsxxxPv+3Mw0sw=
X-Google-Smtp-Source: AGHT+IEkkKUT/mSazdN0INAwMCREK8oDfYmFU9fmUey7ACSfRphlCTCqK0d05Hu2pD0PouDQc2IBgQ==
X-Received: by 2002:a05:6000:491d:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a6d12d92e1mr13156650f8f.36.1750770816076;
        Tue, 24 Jun 2025 06:13:36 -0700 (PDT)
Message-ID: <bd844f21-ce43-41a2-baf0-db92ccef7c2c@suse.com>
Date: Tue, 24 Jun 2025 15:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] kconfig: turn PDX compression into a choice
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-3-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
> Rename the current CONFIG_PDX_COMPRESSION to CONFIG_PDX_MASK_COMPRESSION,
> and make it part of the PDX compression choice block, in preparation for
> adding further PDX compression algorithms.
> 
> No functional change intended as the PDX compression defaults should still
> be the same for all architectures, however the choice block cannot be
> protected under EXPERT and still have a default choice being
> unconditionally selected.  As a result, the new "PDX (Page inDeX)
> compression" item will be unconditionally visible in Kconfig.

Just to mention it: Afaict there is a functional change, but one I actually
appreciate, at least in part. So far ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -52,9 +52,10 @@ config EVTCHN_FIFO
>  
>  	  If unsure, say Y.
>  
> -config PDX_COMPRESSION
> -	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
> -	default ARM || PPC

... for x86 (and RISC-V) this option couldn't be selected. Whereas ...

> @@ -67,6 +68,17 @@ config PDX_COMPRESSION
>  	  If your platform does not have sparse RAM banks, do not enable PDX
>  	  compression.
>  
> +config PDX_MASK_COMPRESSION
> +	bool "Mask compression"
> +	help
> +	  Compression relying on all RAM addresses sharing a zeroed bit region.

... this option is now available, as the prior !X86 && !RISCV doesn't
re-appear here. (As the description mentions it, that dependency clearly
can't appear on the enclosing choice itself.) Since x86 actually still
should have mask compression implemented properly, that's fine (from my
pov; iirc I even asked that it would have remained available when the
earlier change was done), whereas I think for RISC-V it's not quite right
to offer the option. It also did escape me why the option was made
available for PPC, which I'm pretty sure also lacks the logic to determine
a suitable mask.

Jan

