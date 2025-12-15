Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDBCBDA31
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186916.1508347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7AW-00050u-UE; Mon, 15 Dec 2025 11:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186916.1508347; Mon, 15 Dec 2025 11:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7AW-0004z7-Qh; Mon, 15 Dec 2025 11:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1186916;
 Mon, 15 Dec 2025 11:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV7AW-0004z1-1A
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:55:12 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7cc04e4-d9ac-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:55:09 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so42424725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:55:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b26fsm31252679f8f.40.2025.12.15.03.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:55:08 -0800 (PST)
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
X-Inumbo-ID: e7cc04e4-d9ac-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765799709; x=1766404509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sjuHSq8h84FCm+1YVHRK6Isnwzx1r6c6eHy4YXikf4Y=;
        b=caTc5gPLn7OqJ0lGEzKByw6rG5s35w8zDghmdEIrFPW5E2mcLe2ZtmbPTz7m9132pI
         auAjSYmOszJ245cCNIqA5lO2uESu4j/rrMzYvesgfslwlSw3D/whJg1dGNct7/M5/whn
         wtDHHGdYf+A44UfvnnLSqEK3thOLgtyXxcNoRu8IdLAMZK9/czRv6o24860yKiDMDEnD
         DGz97lpMQKzyNzNBtIO0RL/eIxUWBRpZx7ToM3UTLwO1nbVsNMuV1hFWJWWUAJAPcHvI
         CcfNraDl7qKG54Th8djERQHL49x7Oq+dZodpZAQsEb6hvHe2zDFdheY6RH/OcyDfzQD7
         wrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765799709; x=1766404509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjuHSq8h84FCm+1YVHRK6Isnwzx1r6c6eHy4YXikf4Y=;
        b=ubTd7QyIPpwXWAXLkwLdLSSOgm77ec7q//4v7sHYwWalb269cfX+1GCAmCp1xZ2LHq
         WmkZfifiHd0dK5hWrnIiUJJ7ZxA2mNfaS7aiZoCZ+3ehudZ6OQJQUafgCzGMvYSDIzBp
         Nj7mudA+maeluC7RGQ+8h9IxO8juFXYrbX5qpCcfxSEYt1rGDcRBZZ1J4lly0Wrrk9AF
         5GqjTGRoKc+IJjDyr7GmgTm+7bdubMaUZ6z4MQJTOK0d5SUccSABQ3Gxiez14xHK/6UC
         uBZJr0hYltXqY8n5uWKgRb940RWnEB+9qfU7FmNMdxilHVbRMGawBAGvefGQXH69STZ4
         V3hg==
X-Forwarded-Encrypted: i=1; AJvYcCWe1kSXqN99BHpVw/rZPnMzdZGeEURSU9ouzF0vaMJwea4uUzUL5+Wu0FX+wnGdGYUJisioCZSxzwI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMLxX8iixatlrJe1cd5PQN2ubammyU6zMKKCxyIMpbVv4+d+5J
	1QFpJFCalYGY1fIsXMqgxVVJmtLnb14+qN7szg61sjgVMeow9aNOuIZsOmwM2oNnKA==
X-Gm-Gg: AY/fxX4L2ge3AfIl+FPTLzeidXqWV0cO7XE5kYUFBSbsPfn1Rlo2e6GvZ1MuIYy6Bmy
	7sVrydwtAfBRXJsQg+e9jLyPi+c+iH29GEQTC6ya+lSpLnkkpHnVNCOD5AMBDQTuLJXy/ZLZA8K
	pAOdSo1bX1O3W9fE0x7iT8OE6JUicgExgJOab8EWwAv7qEHot4xhbZEY3yVGws8PPJGz8x2Kza5
	ApX0dfzE2bhvEfCUYAhUv64A4pTqB/5ZPSV9xaP63R+ep3CGArZ5uUIk8BzH997jTSxwE5+N4/E
	5ZCKtMlh8aRYG+GLcbhDpRi4z40WmVmnTv4/ntA3nUtOyAmpJVDJD/BJKqot8zG5mNjjS7eLQHc
	XN9PfEAlKM9W1dc91UPwkemAPHePydXHvfRsATbLPR7eJgUe99OOt3jiHQSQH/QVcBf6YvinMl+
	0eB51NN/N1MZwSve6eH7E45hg2uJOZHlKR9ssHyFNMwt+BABxXeMQfA2+LVPBVJJu/ms7LvC2AI
	30=
X-Google-Smtp-Source: AGHT+IF6ktL+2lwO6UtDjZzMOBi4xITykOt045Q+rt88fJt49UF4+ujnM0F7GaymLPJE3W7FFOCs2g==
X-Received: by 2002:a05:600c:1c9d:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-47a8f903800mr100886385e9.20.1765799709061;
        Mon, 15 Dec 2025 03:55:09 -0800 (PST)
Message-ID: <807efc08-b805-4a33-8001-ef0ab70f7d05@suse.com>
Date: Mon, 15 Dec 2025 12:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] Disable domctl-op via CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jason Andryuk <jason.andryuk@amd.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:01, Penny Zheng wrote:
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> via disabling some hypercalls handling code, which may not to be used &
> required in such systems.
> We are introducing a new single Kconfig CONFIG_MGMT_HYPERCALLS to manage
> such hypercalls.
> 
> We are trying to disable hypercalls in the following aspects:
> - sysctl
> - domctl
> - hvm
> - physdev
> - platform
> This patch serie is only focusing on domctl-op. Different aspects will be
> covered in different patch serie.
> 
> Features, like VM event, or paging log-dirty support, which fully rely on
> domctl-op, will be wrapped with CONFIG_MGMT_HYPERCALLS, to reduce Xen
> footprint as much as possible.
> 
> It is derived from Stefano Stabellini's commit "xen: introduce kconfig options
> to disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
> ---
> This patch serie is based on "[PATCH v3 0/7] consolidate vm event subsystem"
> ---
> The following commits are prerequisite, and could be committed independently:
> - xen/xsm: remove redundant flask_iomem_mapping()
> - xen/x86: library-fy cpuid-releated functions
> - xen/arm: move dt_find_node_by_gpath() to passthrough/device_tree.c
> - xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_HYPERCALLS
> ---
> Penny Zheng (24):
>   xen/xsm: remove redundant flask_iomem_mapping()
>   xen/x86: library-fy cpuid-releated functions
>   xen/arm: move dt_find_node_by_gpath() to passthrough/device_tree.c
>   xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_HYPERCALLS

From past discussion I would have concluded that this is what wants doing first.
Is there a reason this isn't the first patch (and hence it's unclear whether it
could go in as soon as you managed to chase the - apparently - one missing ack)?

As to missing ack-s - may I once again point out that it is on you to chase them?
(Daniel, first and foremost to you: Hint, hint.)

Jan

