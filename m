Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F40B10229
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055380.1423805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqfy-0003mO-6C; Thu, 24 Jul 2025 07:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055380.1423805; Thu, 24 Jul 2025 07:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqfy-0003kP-3c; Thu, 24 Jul 2025 07:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1055380;
 Thu, 24 Jul 2025 07:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqfw-0003kH-RY
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:47:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 715589e1-6862-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 09:47:26 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so7317535e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:47:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705378f4sm10090295e9.2.2025.07.24.00.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:47:25 -0700 (PDT)
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
X-Inumbo-ID: 715589e1-6862-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753343246; x=1753948046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9pNFc+iqFp92PzHJvPpRZLWn5vrA8c4dyXuM8BxvkcU=;
        b=WG3S25sSvEkQpVFkZ0bmYcwUF9IJoflvFB2ma6W58uO3kJzq2fohXH8+cdHwfN9kmC
         okZFHIxEvwBxpVLDGoOwPMNLjE1etumeEX51QCrZajvE4ghRIbBJGzMnRH9lDWlGCgiR
         Vo6UORMATQr+wzuxJn+N5V4em1lol245i0TRNqCQBH/ZDviJ3l+q9eytXooOtVTsWvPo
         FsgD8ZTFpwuJbvcx3IT6OrudPe8rB+nIVQ511bz/vI3xLTg0QhP30bdJLJS6KLP6Amxl
         iYBhvi9sFKeeRd40/IlH8Qido2q+TdvSzEdPKU/bE5egHEfEpcp4/OnF9wCpFKArScbe
         sRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343246; x=1753948046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pNFc+iqFp92PzHJvPpRZLWn5vrA8c4dyXuM8BxvkcU=;
        b=NS4teDCK3T5IuhyTH3RyNatiKovejDkAzYJyElBdYg1YPG6cszr5I45z+5TvnTcCs0
         Rv3yanYQ2ZdysKQjeOepbHOrWDPaIqbhB+x7JkN3tMiQksLxpq2yghIBCm3w+xD4uqnO
         89qJn9D/kcMWUAXRARJ1+rS4RiL3jNRDFrTRVEfRJWDbegHwhzB5rYM8DgW5xqmAMu3T
         4MPVwm+bkX/n0rqbu9eVTw12MIUUd9/2Ahma9F5xP0yL0ktvfpGCvrILillcdxozqCE7
         uMXrT+LZbvVKFHstsYDlgPtdSxGEWXePYdLqkcY6BSiD6NqXLVyZid+l6Z6MJABMkIHY
         EczQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuPsW/X1HMnRYd1oVH2EqbIZwHLx2Ld+Bzr9eTavBb9eeaG9zUboidF4a9FJ5mYyRHH2pqwkjX9U4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUZt4b61dErk6eBZ0nOqFOEZQQJ6Fk4FEpqyXxjRb6YWOI6jZF
	3ZLSktC7o0N1w60i/UbkH/dNOccCoDrVr8BYLXGCIM++RHt+RI3Cj+Ov1wkHUjoZGQ==
X-Gm-Gg: ASbGncuSfNKCOgoCNYx8bp+PmO25Ip92L5fQlZpW38eB+EHaG2My5uUZEh0R3nOFw+i
	fo9IRWTSeQSeRJaH6GAMCeOPz2Glct4uTiQRxikuWa9g4Pl481//PabqEhPPlMlb/WqXX5euXTx
	F1/fT4HR3dSTgvYz/yAxj+ummcmKrF9LMkaGLCFerHKncDTE6wkSHDk9w3ceWtaYhKMG2HC72pF
	/u0nKZb1Brj/6i5MYgc9JNYRlYjErz1N6EVhU5eDaoWWtXHz/j+Qmc+Mh75PnGYtxUD+vPNMm87
	BwOEXBl3uH6sQXPGOed3rS0pHeHXFYbh9eweetJXB3BkjQqZmaskNFGjRB7AsIOWBrolaWHGCdQ
	SbiGJqEMBD6eY6Yg3eDlpZCjMlXxw+dsy8h+FPynO8yzOotSJQ1nbRgrwV89x7thU3iokSnkW6e
	PGWbZv2Gs=
X-Google-Smtp-Source: AGHT+IH7FFLQwdPOwvsXVcp6HG+g7u/Fov7U/T0fnHVPRow/UnjkXaMtZ0YBABfmKVnTuEqKBA0Jlg==
X-Received: by 2002:a05:600c:1c20:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-4586f216f43mr10608215e9.25.1753343246117;
        Thu, 24 Jul 2025 00:47:26 -0700 (PDT)
Message-ID: <ffebedf9-c987-4f99-8ab1-de84df67d8bc@suse.com>
Date: Thu, 24 Jul 2025 09:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] vpci: allow queueing of mapping operations
To: dmkhn@proton.me
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
 <20250723163744.13095-2-stewart.hildebrand@amd.com> <aIGh2i5+Z2CW0mPr@kraken>
 <aIGrin7bHQr5KvtJ@kraken>
Content-Language: en-US
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
In-Reply-To: <aIGrin7bHQr5KvtJ@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 05:42, dmkhn@proton.me wrote:
> On Thu, Jul 24, 2025 at 03:00:46AM +0000, dmkhn@proton.me wrote:
>> On Wed, Jul 23, 2025 at 12:37:41PM -0400, Stewart Hildebrand wrote:
>>> Introduce vPCI BAR mapping task queue. Decouple map operation state from
>>> general vPCI state: in particular, move the per-BAR rangeset out of
>>> struct vpci and into the map task struct.
>>>
>>> This is preparatory work for further changes that need to perform
>>> multiple unmap/map operations before returning to guest.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> v1->v2:
>>> * new patch
>>>
>>> Related: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
>>> ---
>>>  xen/common/domain.c       |   4 +
>>>  xen/drivers/vpci/header.c | 197 +++++++++++++++++++++++---------------
>>>  xen/drivers/vpci/vpci.c   |   3 -
>>>  xen/include/xen/vpci.h    |  16 +++-
>>>  4 files changed, 139 insertions(+), 81 deletions(-)

Why did I (and many others) end up on the To: list of this reply? (Breaks my
rules of sorting incoming mail into appropriate folders, for context.) Also,
please trim reply context suitably. Without you doing so, every single reader
will need to scroll through the entirety of a long mail just to find (in this
case) a single line of reply (somewhere in the middle). Of course you
shouldn't be too agressive with trimming, to retain proper context for your
reply.

Jan

