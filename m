Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB419BB025
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 10:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829908.1244832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tes-0007lJ-J3; Mon, 04 Nov 2024 09:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829908.1244832; Mon, 04 Nov 2024 09:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7tes-0007iL-Fx; Mon, 04 Nov 2024 09:46:02 +0000
Received: by outflank-mailman (input) for mailman id 829908;
 Mon, 04 Nov 2024 09:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7ter-0007iF-Bz
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 09:46:01 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9798e172-9a91-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 10:45:57 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d4d1b48f3so2341338f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 01:45:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b65sm12950798f8f.4.2024.11.04.01.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 01:45:56 -0800 (PST)
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
X-Inumbo-ID: 9798e172-9a91-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3OThlMTcyLTlhOTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzEzNTU3LjgyMzc5Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730713557; x=1731318357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHjpiI+hsQFCfWSmo5YO072DGevyxIxowQYYAL4a8rc=;
        b=BIbE95GoA7LkxM6ZC5bMoE+IRi0CB+WmO20acHWEu0W3ejp7B1hz4mE9+gAt9AgWGY
         zA8FI785errus+UAD77iJH4Mab86SxKZbBRTNwW54as65FoY+if+sLATJDQUeu/5w9n7
         gu6l9yjpgIXknHjV6DyHphTgqmq4jO9bIYL+xH8NNjlxIi90/pzAq6wqGaqujyWjctXa
         ofjT+EtGEWmJvtAdOcv3TBea88FXZ2ekIDqWYxvws6eL2quB9cWPFL9mXbdYwGk533FA
         GoIlfByib7me9FmIVo0y8M8OYR5vIucvmVwVEoK7vM386hfpSLqZDZ+hyBYeQqG17EaA
         JtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730713557; x=1731318357;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHjpiI+hsQFCfWSmo5YO072DGevyxIxowQYYAL4a8rc=;
        b=rc0k7X5t5VObzQqEV1ttEa3u5E8i4cDn0RJgDOIdMNrEdWAg/4l8Z1Yy0d1SnsSy5S
         SnMWyDPcfEknNO259ljGdoEQeY44skJvbd+YFavT9f5xnvm2d4p63XRh2MvYeVqNMF6a
         Qgd1dgk4ibrn+VIX5e6gktP+sORyichbcfrIb/yt2WNLGE7egWDLTG07Gxn8aexTs9Ix
         nlCgyxUIGUDeo18IFJ1bG/I+7YLQlxqQW3nbv+o5C/2XMx/CJfmEStTDpfa+8P0vSUuU
         /F6hm+ib2doYtI+wpcvzBBn7VDnS1rRXBRjfBEOel51qG3LMaY7jzJ50kvdiL/K2BgxT
         8Vxw==
X-Gm-Message-State: AOJu0YzI7FoScN6mFcZOld130UIyC07OkEHPv6MtuRdTKUsF3m2Wt5/Z
	Ydhy6QgT+ICxSgZGtrjhPVT4JR4rY2bWgF3jh5pCJPjWavMvp+05BLs9k2I/Ew==
X-Google-Smtp-Source: AGHT+IHucd91DePuOx9qDbyjZ8vRFv8X3jFWKqaMXQrrzGuwVhoInslZuqRZp8NiA5q6kRDCEappWg==
X-Received: by 2002:adf:e686:0:b0:37d:3964:e0f1 with SMTP id ffacd0b85a97d-381b70578b3mr14785028f8f.4.1730713557165;
        Mon, 04 Nov 2024 01:45:57 -0800 (PST)
Message-ID: <43d270c6-a237-4b6d-ba25-5b3ecce03147@suse.com>
Date: Mon, 4 Nov 2024 10:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v7 00/11] (mostly) x86+Arm32: add/convert entry point
 annotations
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 17:11, Jan Beulich wrote:
> 01: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions
> 02: VMX: convert entry point annotations
> 03: x86/ACPI: annotate assembly functions with type and size
> 04: x86/kexec: convert entry point annotations
> 05: x86: convert dom_crash_sync_extable() annotation
> 06: x86: move ENTRY(), GLOBAL(), and ALIGN
> 07: Arm32: use new-style entry annotations for library code
> 08: Arm32: use new-style entry annotations for MMU code
> 09: Arm32: use new-style entry annotations for entry code
> 10: Arm32: use new-style entry annotations in head.S
> 11: Arm: purge ENTRY(), ENDPROC(), and ALIGN

Patches 2-6 went in. Arm maintainers - what about 7-11?

Jan

