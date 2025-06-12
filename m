Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A9AD6BD1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 11:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012616.1391097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdy2-0004Pw-R8; Thu, 12 Jun 2025 09:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012616.1391097; Thu, 12 Jun 2025 09:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdy2-0004ON-O2; Thu, 12 Jun 2025 09:11:26 +0000
Received: by outflank-mailman (input) for mailman id 1012616;
 Thu, 12 Jun 2025 09:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPdy1-0004OH-LI
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 09:11:25 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36a5c92c-476d-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 11:11:24 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso769793f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 02:11:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c19cd5a6sm989222a91.12.2025.06.12.02.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 02:11:23 -0700 (PDT)
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
X-Inumbo-ID: 36a5c92c-476d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749719484; x=1750324284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cDo1BlM0RzNvp++24metczxxzGHEiglnNNeFZVof03U=;
        b=fF8S1cXocXbrGnEzsKg8x9SEdpdBbj54hAzfSDyX4Crj2wGuVPV1Uo8y+0kiXKJ72B
         RQSq1NdcP6BMbWmqI0fYz+GHjYss4sxIV/lUIJdqn3t8qGSpei50YYmvI0gN4vRNMuLO
         00vLhN8uoQgwHnX5hH2ZoequS8GcMRT9jmi8JbMWTbxl5GKi6/vA9LymY7WQz05iVoJZ
         D+5QVXVQnfcnw+ii2DriTjj2Ghl1udJfoVqu1VWR89Ph0NDImUuwuW9CRVzXD5OZ4aMq
         /SFBZuD9DRddjnNQBJ8sJVmOhRgt20wpTE3UNBrk7WWYSpMUdFe912KAYZS8WzJSHd1o
         4r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719484; x=1750324284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDo1BlM0RzNvp++24metczxxzGHEiglnNNeFZVof03U=;
        b=QKQk3eUcgsgJlvVm+Irmu+L+L3N+SEu3z7JTEECdfAE4eSU3n+SoQskutylT398gXK
         EGVXw5dXiZ+K2+mZE+ejvp2yMwzJfY7XY6f6klZG3fpRkduwsyhvc4TJ5EzaFaS1dpJF
         DHukNHrl54Z8kAcQXo1/dg6JJkSJ5njGbtvYh0996wteLf9Z84Gb7jcAW56pz5sNXVdN
         BotNStaOsYahx90USAUsjE3YYoAVXCYuA9/N6KI0jX8AAaKxh68b/YpfeoK4DPP1ivYv
         xql2wFWvEPGtyZ4f7lim9WDculkdB9O6iA16spHYncN5vXfb+kIiqsUVlo9ul0aKjLJP
         5Mkg==
X-Forwarded-Encrypted: i=1; AJvYcCXP19BCxqAw9NMiNe7fqVhNzTH7T44mpQ6J2DSsfiXoFiXrELXr+W2guVeMAG/KxNfRWiuA/lLVVl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKO6duAGs0kjb7POYbKEfuQh+oxLCkbhTs6XLQA21dITORUxw+
	KmDVckwLoUhbjgpga/z8u2XCCxErqXG6qLBsa+IeT0+dFLcktrp/fe5eti4tv84Fv/orcW0PXh0
	BflA=
X-Gm-Gg: ASbGncsV42t4ePSAtBy8iYl7uv8ZJfwDRsaOVxVxa2DZgs7EePRztK5Rs46fOCoPsZu
	FveK3aaaHOg1TJ6MF146oBz7Wy2/CLCy309fZK1wRbxL1JWl3xuQk7i/0GDeD0PcIx2BHK6/YAm
	m+PlLWPm4FkNl116ZYT6LCLP57dpW6pv+T6qdPpmz4kSGtTUF4D9P3VCynoeTnoID2ouW0G0WKq
	WRmCNgyjiFeNTiTRmQzmp7ncteVOguuv67sE3X8tzsISna8sLTs1T/0v+BJrDtcUzS9jN36KwqG
	s5dlikFkZWXQpB8rP6awow32mt04H1Urez07nt3fYb3BlstabeqQwoePT77beV+jdmfcyUL3ShB
	Ic7aE0x3Ll/CgKpgePDw9hdz7VAumwt/qwidL9P3kJ5GI8iI=
X-Google-Smtp-Source: AGHT+IE/4oylP0h+5B2xCyXE+noN/ul9jshwhNwmViWNVgnpBKJsxA/LpcqFjEJkLr4VA5HHHzcYOA==
X-Received: by 2002:a05:6000:2211:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a5607485c1mr2268374f8f.1.1749719483747;
        Thu, 12 Jun 2025 02:11:23 -0700 (PDT)
Message-ID: <9e7925c4-3695-4320-8552-4ee0e39350e4@suse.com>
Date: Thu, 12 Jun 2025 11:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] pdx: introduce function to calculate max PFN based on
 PDX compression
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-3-roger.pau@citrix.com>
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
In-Reply-To: <20250611171636.5674-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 19:16, Roger Pau Monne wrote:
> This is the code already present and used by x86 in setup_max_pdx(), which
> takes into account the current PDX compression, plus the limitation of the
> virtual memory layout to return the maximum usable PFN in the system,
> possibly truncating the input PFN provided by the caller.
> 
> This helper will be used by upcoming PDX related changes that introduce a
> new compression algorithm.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/setup.c  | 19 ++-----------------
>  xen/common/pdx.c      | 25 +++++++++++++++++++++++++
>  xen/include/xen/pdx.h |  8 ++++++++
>  3 files changed, 35 insertions(+), 17 deletions(-)

This is all fine for x86, but on Arm you introduce unreachable code, which
Misra dislikes. Yet then it feels like it's wrong anyway that the function
isn't used there.

Jan

