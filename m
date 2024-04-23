Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C608ADE54
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 09:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710333.1109501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAfg-00012Q-Rl; Tue, 23 Apr 2024 07:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710333.1109501; Tue, 23 Apr 2024 07:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzAfg-0000zZ-Ob; Tue, 23 Apr 2024 07:34:32 +0000
Received: by outflank-mailman (input) for mailman id 710333;
 Tue, 23 Apr 2024 07:34:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzAff-0000zD-3o
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 07:34:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea8ce151-0143-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 09:34:28 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41a72f3a20dso11915055e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 00:34:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b0041a7581f8b6sm4757174wmb.23.2024.04.23.00.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 00:34:27 -0700 (PDT)
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
X-Inumbo-ID: ea8ce151-0143-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713857668; x=1714462468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97QhYCUQ9SYFVXSWo94Smhv3XFLVTUuPkLvG8lCphCU=;
        b=E6aY9HJ6bDcrsPVk8VLjCKpASqvbE+zLSlVduNPrKWd8r2WS5UbBhcUnvzzscVnD87
         ExTH5v1DUGkSJD02wYSmWjM47AFLiG70XWhyURWByqy0gawRrdMEdO314fN6VP3Z/Hlc
         hZ4IqAkKSv4+7+aTr/gLWXpykoRWisGekiut5UG36IgTtDzIS46oYAuJwFxl+vhHoemU
         o3/URGVGDoxIxeRivCAwGIuQN0Y5yDGlDYYG/x+PWZirTWKnG8riNldDRVGT0GdkcFYM
         xg6DsnWTfmfsD9ko9ytlaWgoxcUzTDBU/37wQLDLmIK/GAYvkYz6mB/Z1Xf4/NQZlhMp
         DC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713857668; x=1714462468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97QhYCUQ9SYFVXSWo94Smhv3XFLVTUuPkLvG8lCphCU=;
        b=OJU+/27lzY8NE1jX2QlFZGDazIisrPW4W1td2Qo6dOEp2LaH8hiqgrHj0ap+lNCIrJ
         EflnQY+dBXM2VCQKGKDe/hRBkBkTAEH3CSNfJA/Rwi3LyyQXxe+jtPtGmIkLQHJMXa20
         0EAkTU3SiEJQgVd+522uf1/Xbd6oybp4r36Go4s837L/5fKXtcuWSNHPpCV0d3UvKEIZ
         FD6f0XLVpqG4g5/OKGi0BMqIs+wDI0Hns1QVNaiDeLBlKBHD4ky37IrmfVG6e8sfWcJ/
         5MPoOpP4ax7yk8qfScvlpB52enbmG9C68LwWU+NRekdfekGa040eIITlNYIXG+gkiKfF
         ONmA==
X-Forwarded-Encrypted: i=1; AJvYcCW/8Wbmz24MHD7LWL/JDr57hELo//Lcl0dZqfnm2mw2j249CTJiIS9eMfONpW5sxYAt6ad3hEIY3k76tdDuMUe6asHmUI5fbBzpxZxr/cU=
X-Gm-Message-State: AOJu0YwRcVaoM1iU3oIGigHAUFyfbcShNrEOxMBAr2BB0tXMB6BzW3LP
	2XcuMOWckXlKKUXAL57yJEAO/VnvY+tb2fJkF4FP+Z9dQcbYgtu+thgmEYbAmQ==
X-Google-Smtp-Source: AGHT+IHwhhQi9hS+qmkR0fkG2BzLE8SctzMxRTYPm6ZuS03oHBLHe9IcXitJ2GHWE+RvYfoVIYlbnA==
X-Received: by 2002:a05:600c:b86:b0:41a:c8f0:95d3 with SMTP id fl6-20020a05600c0b8600b0041ac8f095d3mr312384wmb.16.1713857667714;
        Tue, 23 Apr 2024 00:34:27 -0700 (PDT)
Message-ID: <a486f474-1c44-4409-bdcf-a51ed2635446@suse.com>
Date: Tue, 23 Apr 2024 09:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] x86/mm: Do not validate/devalidate PGT_none
 type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1698589351.git.matias.vara@vates.fr>
 <dc05dc908f0a39e26e589099a4dd79404d5f32b2.1698589351.git.matias.vara@vates.fr>
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
In-Reply-To: <dc05dc908f0a39e26e589099a4dd79404d5f32b2.1698589351.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2023 17:22, Matias Ezequiel Vara Larsen wrote:
> This commit prevents PGT_none type pages to be validated/devalidated.

This isn't quite true. It is rather the case that (de)validation of this
type is trivial, and hence can be short-circuited just like is done for
certain other types.

> This is required for the use-case in which a guest-agnostic resource is
> allocated. In this case, these pages may be accessible by an "owning" PV
> domain. To lock the page from guest pov, pages are required to be marked
> with PGT_none with a single type ref. In particular, this commit makes
> the stats_table resource type to use this flag during
> get_page_and_type(). 

Imo the change here wants to come first, so that stats_vcpu_alloc_mfn()
can use PGT_none right away (rather than being transiently broken).

Beyond that I think justification needs extending here. In particular,
"lock the page" is at best misleading, considering page_lock() and
PGT_locked that we have. What you mean is "lock the page read-only". You
may want to further refer to the place where this is also done
(share_xen_page_with_guest()), just without get_page_and_type(). This is
not the least to explain why share_xen_page_with_guest() cannot be used
for your purpose, or why doing it this way is a better approach
(potentially then wanting using elsewhere as well).

Jan

