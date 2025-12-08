Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0122CAD8D4
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180843.1503954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSd17-0000no-9T; Mon, 08 Dec 2025 15:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180843.1503954; Mon, 08 Dec 2025 15:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSd17-0000mM-6P; Mon, 08 Dec 2025 15:19:13 +0000
Received: by outflank-mailman (input) for mailman id 1180843;
 Mon, 08 Dec 2025 15:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSd16-0000mE-0c
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:19:12 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e8bcbdf-d449-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 16:19:09 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so58703425e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 07:19:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479310b8e70sm250146325e9.5.2025.12.08.07.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 07:19:07 -0800 (PST)
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
X-Inumbo-ID: 3e8bcbdf-d449-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765207149; x=1765811949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oqjc25lmzwJXbi+0B52kYvNqRwfKzeAlxRIwcAAlDFI=;
        b=HEw83Y9qtgI6henYvcuUW63rwS5IbrJ4MbOOlEv2r6oWAKLC/euGU41FuAYUmvJX5f
         M9vGkNUraRgdb+gjKCXdlG8kurtoAIOMbMzPtf0PN9WsUIz6GasnsXvHgyGlHHmtM0DO
         PAf+4UP7gdtmBo9FAOYFXMl5mkvP49SDHz3HlA0GAOJeqn+M+yLIcxuGzZXdXz8lQe1p
         2xil3RBBiEqV37uDZ16DGGJ4hI9IPTD1DhnQA1Wo4TEOGi1XZGPO1/ojkVm9fI4GdNfT
         aIJ38gFFFQMha3dy3zaP4gDZWbmVI9Gzpi5Wfe9KKLF/VRYtGg64kxhnsp+DOiD1hTL5
         MO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207149; x=1765811949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqjc25lmzwJXbi+0B52kYvNqRwfKzeAlxRIwcAAlDFI=;
        b=o5oRdX0GRnhzLb3dE6lbdK3Y3VlsnJJgIIa3fYn4+lVqTDGkl/gaMNNDdBqGmghJFk
         mZNiVy4dALhbi52jVp7lUcg1hQOJk9jxyQM9k4mm8optwJJ5c7zcx8kxiyuGA7suSSy1
         e0Gc0HgSZNaSpeKIFHzX3sQ8/cJdioTpSaVR5Fc7MvVdMRcOoWSBev3ORDX0/0z+Qz6M
         J1Y4WbDhJAtTXeuhu7Uo+8iTg1fZRPRm+OM79dcw4L47oNSOGUF+T0GAUaKxuCCxliUD
         MdfqfJgNPlFTsQTi3Y98ImFg1NC1lrHSzc98bZXsjjhA9Razf/fcQWIsQLbgVewTGhws
         lQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0lycCImxFSbunpqpytBO6dp7PUy4spxO5n+m4k4fsRG404UpOj4SUq+IneXXpVFKkzAorx7OUbhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygn0m6Ap79oINsuq/bIC1SfSHTizcss43iZx/fXzJs8wfUAMcm
	Lt9YS5sGB7v+f45qEP7OLBdqF51RmITmkgm4fp9e85Cg7auq+fS69VVverQrPI/f5g==
X-Gm-Gg: ASbGncsXyHO4KwAbw3ZKyN+58Ez7KSo0f9G3OwP5S8KvQo7nwb/q0KSorTmY2IZZK8y
	3BDxGDaNEBfjmWKJvh8DLnwkbPY5YSgciwUeXXuywEGWaRP9EPfw3muDE0mcXw4hPYbwu2EsaN8
	vPN0ZpO8QMYkx20Sb5/5b5dYdZRRkPDPPDH21Q7s4UhSf3Bq8BrtAxuzxcULgkDL8PbdKnS2Tjz
	EFdjfvQ2992vUQZ621QGRhxLsNaGeAKrYy97nLET7AJ0J8ywFu8x+QEE8w7R54AOwUXsHm+Dzeg
	arSCEn1h+N5tENljJ4Rpe9kyM+FvMxfgZPkct8Fw/vFE9hdtt7SSb//U33zZOB5Pt49fwBCLQH8
	gu/dQQG1/0wyndNqvAzN7pur5KcsdJE1cqL6DuKYYcc3zM33EqLzwSmdzlEP4+nkOSPomUJC1KJ
	A0Yo2KMxwo1JCPhYYZaVCR41sLDRJS1pT3gC+GlRyJjFV7nqBSVA2hwJCErQiQDzqmZM9uEHonr
	BQ=
X-Google-Smtp-Source: AGHT+IGTskQ/B7PoIdaipYl6QrK1fZeTpnKq0qyym0GU1/DhOjCFDXpCmkahadHsUsBoNnd4yCgOeQ==
X-Received: by 2002:a05:600c:8108:b0:477:a977:b8c2 with SMTP id 5b1f17b1804b1-47939dfdc1fmr72398925e9.13.1765207148908;
        Mon, 08 Dec 2025 07:19:08 -0800 (PST)
Message-ID: <88f0f740-34e4-45b3-8a12-a6c5463e52be@suse.com>
Date: Mon, 8 Dec 2025 16:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/svm: Use host_cpu_policy instead of open-coding
 cpuid
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <200f5b367f3a375382324f778c730bc63124d47d.1765204254.git.teddy.astie@vates.tech>
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
In-Reply-To: <200f5b367f3a375382324f778c730bc63124d47d.1765204254.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2025 15:58, Teddy Astie wrote:
> host_cpu_policy already fetched the SVM CPUIDs, use it instead of open-coding cpuid.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> It very likely doesn't work right now, as host_cpu_policy is not evaluated at this point
> (start_svm is unfortunately called before calculate_host_policy). So this is mostly a intent
> rather than something ready.
> 
> There are also some other things I would like to improve on this, but not sure on the approach.
> 
> It would be nice to move svm_feature_flags to host_cpu_policy, alike other
> bitmap-like leafs we have in cpu_policy. IOW move most of arch/x86/include/asm/hvm/svm/svm.h
> to cpu_policy infrastructure, which could also serve later for properly managing nested SVM
> features of a guest.

See https://lists.xen.org/archives/html/xen-devel/2024-06/msg01546.html

Jan

