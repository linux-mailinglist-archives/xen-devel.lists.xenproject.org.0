Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B8A1DB02
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878130.1288305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSac-0001AF-9x; Mon, 27 Jan 2025 17:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878130.1288305; Mon, 27 Jan 2025 17:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSac-00017I-6x; Mon, 27 Jan 2025 17:07:58 +0000
Received: by outflank-mailman (input) for mailman id 878130;
 Mon, 27 Jan 2025 17:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcSaa-00017C-S8
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:07:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fd1e898-dcd1-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:07:55 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso6882306a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 09:07:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fbb72sm607883566b.129.2025.01.27.09.07.54
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:07:54 -0800 (PST)
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
X-Inumbo-ID: 3fd1e898-dcd1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737997674; x=1738602474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkWSPQfFGGALKROvEt8ur9Kvmpc0vvx3Pu+8NgfsJQ8=;
        b=IF1WYxE7DT0DPnqfJB7juhGVU7hBwzuIfgtqdMhgCm9ACQ0wGMaeHJSHgFbB2kIGP5
         AqILL2lEQWn1Tpz3/AhXFRVfKXjMa+BTMSNf3Pr3q5GsDWZoVkcytHX77tLurw6DKvt7
         UoyW5Re3G4QT06CN2e/3oN2lvCXN631F/JjNmK1PQJoXKt0G7DLGxKlZTNB8dQE3Vren
         2ohHGdhbRKaOkaEUC+Q1UFK8wGq8NktDKTcqPzjE6FDkv7loDZPTyGhXWU9gIPShaA8P
         vXNZMlSTwUpbiy47QbsAdN4Um3f8+F0dmz5pcBBHCAKj8T92+22MxASxQpArakIfnw1G
         g38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737997674; x=1738602474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkWSPQfFGGALKROvEt8ur9Kvmpc0vvx3Pu+8NgfsJQ8=;
        b=XP4+GvmJTXrfPVmqk2AMHHLWgldNMiGq+VreJ8rWYMLOnLZW/bfogjceB5t532cwsh
         eRUgVifcSmrX1HbhNCIzo90wls/whqqDupjNveWOwNPIRcOOvBzCZ9iE4/6KXhs8r2QW
         oMZI3jTe6H1iwA2F47fu4H7WZwFeJcOaUv4jNOQ53uh7Hny1IuEHTwH7FtmSxGPpYRBa
         vXQ+pC1SblWAtYQV1LtrcUpqV+ZnCxw/HDk+F9E1TqYyp45bbG4xbBxgdgU3RiwP0EyW
         d2naiqWJJrhEZFwu68QLmi79L2eDqi9hlCh/8Sz//68e4/MXTVhQcgOrgVqmcMzw9vqz
         iHGQ==
X-Gm-Message-State: AOJu0YwJFWJ5N5o+Ko7LsWJhN2AAmFCI2aARkxOToQwXb6OY30C5p8QN
	s68T0r/z3UdVN4BXS/4ysODLXpoCE6NrzTEn51nuJ1lq/21VXUAtI5lL6HfRsMGRsMxZ16pjYHA
	=
X-Gm-Gg: ASbGncs3KoFFu5yC3+eniMNAMfXF/Da0lq7aaNUSLlCRRvAfJaM7Ci6Oz1dYbpaD/yo
	VuVY510isAUI5/uf/F+AeghXySJZebHWFh3YY4nxZo4EOwwiF+WKHZBA+Xh57tukQ744W6a5fKW
	nQ0xNfoWJt9yBtruEq6+2Abj9T7IgbjvPTxJq8ZuJvERK99oM40MJmXMqdMhs6aAPNcwU7Kxohr
	JriYyyZUHvM/Nlxhl8HbBv7yEh7LeMMbCWoZNlDr64uSfLQ65Semf/eVz0Y/DbQ0paV8uCa39Dg
	U3RQPOevg0LeORhRaqPg/V/2Oj1ZFoIzdUiP42Z9686zG7c9ZCTW7vxHcgvv5qNaEfhQVjgSB/S
	R
X-Google-Smtp-Source: AGHT+IFlDaqcmM36p6m2nT3Q+BG6v9q4+UVWKaD/1m51bXegfjS47j1J1UrrX4U5TA6htHlKbeDPaw==
X-Received: by 2002:a05:6402:1e8e:b0:5dc:1059:6b2 with SMTP id 4fb4d7f45d1cf-5dc105a5ec1mr39324079a12.7.1737997674416;
        Mon, 27 Jan 2025 09:07:54 -0800 (PST)
Message-ID: <a4bd29bb-b0c5-43c6-812d-c4a612eba4d7@suse.com>
Date: Mon, 27 Jan 2025 18:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 8306d773
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6797bc1732efe_2ec90a4585b4@gitlab-sidekiq-catchall-v2-55c8c7cfb7-5j44d.mail>
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
In-Reply-To: <6797bc1732efe_2ec90a4585b4@gitlab-sidekiq-catchall-v2-55c8c7cfb7-5j44d.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2025 18:02, GitLab wrote:
> 
> 
> Pipeline #1642654016 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 8306d773 ( https://gitlab.com/xen-project/hardware/xen/-/commit/8306d773b03acec6062c0547ac05e3dd4a6960f6 )
> Commit Message: x86/PV: further harden guest memory accesses ag...
> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1642654016 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1642654016 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 2 failed jobs.
> 
> Job #8960344816 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/8960344816/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc-cppcheck
> Job #8960345099 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/8960345099/raw )
> 
> Stage: test
> Name: adl-pci-pv-x86-64-gcc-debug

Both look to have failed due to testing infra networking issues; I've
restarted them.

Jan

