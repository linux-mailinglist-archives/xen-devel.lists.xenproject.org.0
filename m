Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0CAD576F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011752.1390222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLjf-0005jh-O9; Wed, 11 Jun 2025 13:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011752.1390222; Wed, 11 Jun 2025 13:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLjf-0005iF-KP; Wed, 11 Jun 2025 13:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1011752;
 Wed, 11 Jun 2025 13:43:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPLje-0005i7-5F
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:43:22 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09ab2243-46ca-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 15:43:20 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so5069052f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:43:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2360340511bsm87632865ad.151.2025.06.11.06.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:43:19 -0700 (PDT)
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
X-Inumbo-ID: 09ab2243-46ca-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749649400; x=1750254200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lIlw7TTTlgpwJKtxaMWIeoHSH2fi1PnxZXuPFmmoc24=;
        b=G4tVtbBjLJhk7p7u4iHipY1iO9iSs+nFPapRw+0V2hyY5gvG2lzoe3MJYf1L48sB9C
         eEcTHPtKG90TKM/9fdjDeNeHgbwZsXl9yllSNxri4SMteqDeoKN9LhnbgsAt9RmsjJcI
         oyu/A5O+mFO+E5DZIKfHFS5WKiQCIjzBkzhavFou6bADnJd4HrcW/Zl/T1m4BhPd0OoV
         4L7wRShDBUtF5HjnnXoiaaFJtAim6+cEPbvvhWvYFntE2gSWWP8VjpYFs41yqCBkB2Ub
         jZod56cNxdgZ40vp371QPqmaJNJN9e9AlIBmNbvpXj3P2MtyA5p5oaBFP1CVjNr+A1jt
         n+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749649400; x=1750254200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIlw7TTTlgpwJKtxaMWIeoHSH2fi1PnxZXuPFmmoc24=;
        b=BkC64sxofJM43q0Ub8WCBBXyVSFoAYqFFJh6i6TOGAzz+OWB6BUtCPDnAEfIiDq9jO
         fKR06dOX8LpW/46Ag+77lU+5cMU2Xz341xagPOjKZq1gpMfJLs2tXFk/3QzvcvdmIC/h
         UbolRwRDWqkwrgziBe4l9jJuxv1O2ZeC5W0R/Ir/9N8628vOK+C545QF6RyBfre+F2qL
         pTau61N04GhzfCqJsgg9XXX/BgrORQgfsev5nHWcLX3+KTdr/x5BQeVrbP8HOkgdzsK7
         7zJsCTYhz2k+7pa+XR2ujo5Pl1E4iLpcQgZ6RHkMC6I/gxMo0B/nTRlPZaLJ4+ZsHq8h
         YVUw==
X-Forwarded-Encrypted: i=1; AJvYcCWvNQCEztH4J8j7tcKIK/vaF6nWLpeuzVPDE55f9lsoiKcTrO+XUcoYoNqONvYWBsz0Y2bS/iwaqUk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiX56wC84XW7uiw4Lvx6gukTZKC8u65Zf+NVZLD2ac+zgRdkES
	JfY90fwLRvnD15zb/sltXv/HaVL00pxnawIcFUCk+g9Ih2tmfaecVfuPhJ2F3sHTkw==
X-Gm-Gg: ASbGncuo8ATV2PBzXfGFDdY2RCizdp5+HXMMzC3E/h/pDyjfBftTAY1FW0Y0tdblmia
	rxvLrcfgI4Ri1DjrLqa8h5XcaAN/UJvr5VTMWk1W5gC550NuogWMNV8W/+d+akS/oF7VMK8jy8a
	MqcNM4jPaNBCFig4i1D3XTioHxdu/FjabTOAEsVQw/6I/AdtPGZ9dEXglSp8wy+FKLoyfkl6+MT
	itm0Pi8WdRbagys8NSsR67fnalWz2cjhIp7bXR9GQuXSCTsQVb0HfgBQIXDnsOS4z9HI0abANY5
	xto2uvos3EZALK69uVvZibuTRbPxzZcWHQIxCcOuifwl0m93ZgCUVJFQz61ZY3NkAfUyjl+tkPq
	2RGJWK8NcgFNwmdV0pPkdhtyXOy5kbnZDtlB4PV48TIZrCu8=
X-Google-Smtp-Source: AGHT+IE4FqPtkFu5cGDmbTxtODkIQIl1TcfmB7iY/9xlteRJ4SYHkx//3gjbqsEpAQsIpMe6jwrEww==
X-Received: by 2002:a05:6000:1acd:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3a558acbc72mr2113096f8f.34.1749649400368;
        Wed, 11 Jun 2025 06:43:20 -0700 (PDT)
Message-ID: <aa25e7cd-f9d1-46ce-bcaa-67784643b08b@suse.com>
Date: Wed, 11 Jun 2025 15:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] xen: Add node argument to
 domain_{adjust_tot_pages,set_outstanding_pages}()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-5-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250314172502.53498-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 18:24, Alejandro Vallejo wrote:
> domain_adjust_tot_pages() decreases the outstanding claims of a domain
> as pages are allocated, so that'll need to take into account the node in
> which an allocation is done. Deallocations just pass NUMA_NO_NODE.
> 
> domain_set_outstanding_pages() takes the node on which to to stake an
> exact-node claim, or NUMA_NO_NODE if it's a non-exact claim.

This doesn't fit the code, where you make both callers pass NUMA_NO_NODE.
With that it's hard to see why ...

> Not a functional change, as neither function uses the arguments for
> anything yet. It's a prerequisite to simplify for the following patch
> that introduces per-node claim counts.

... this part of the change would simplify further changes: Any actual
use of the parameter would be meaningless as long as no caller passes a
valid node ID. IOW it looks to me as if this part of the change wants
moving elsewhere.

Jan

