Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A78CB56EF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183794.1506380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdT2-0005Dx-Pt; Thu, 11 Dec 2025 10:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183794.1506380; Thu, 11 Dec 2025 10:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdT2-0005Az-Md; Thu, 11 Dec 2025 10:00:12 +0000
Received: by outflank-mailman (input) for mailman id 1183794;
 Thu, 11 Dec 2025 10:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTdT1-0005At-JU
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:00:11 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d1fb0cd-d678-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 11:00:09 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so5858145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 02:00:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89ec10c0sm9902355e9.4.2025.12.11.02.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 02:00:07 -0800 (PST)
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
X-Inumbo-ID: 2d1fb0cd-d678-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765447208; x=1766052008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kfSXw/4VSCUYXNegNgt2F7rCXtfWURjtBtK5YXjrgEs=;
        b=PGGCHsJRTQwpdzSHx0lFKxkCjfnBBDmPsN2u/DyainXeQHJf0lhUxCTfTqVnYInBJt
         i+AqntT2jn2iViIIjzZBtx4gs84otawnPJS3883r+A5nF6abcj1Thkff/6BwYLAiXlrg
         UdEmDEHMdsd9Lg2h9kUN6SSAQc5fB+j7hKdee8Y1Hpj33bNYZerP+rZ6Z1Y0YjmkPdNr
         Q6vcYZo7h5Q5O3nBo5XbxQLvrWeL77MU6Y0GyXKp2avLW0JkOZ5cMkqqcwpxK0e+QA9M
         pIBAiOXj/qJTBqpi8x8g+MTlNsYS9CEbn+IqEmSK26qtEiTJLfEy8PbkfyEAz6rT3/fE
         oxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447208; x=1766052008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfSXw/4VSCUYXNegNgt2F7rCXtfWURjtBtK5YXjrgEs=;
        b=J1cWdWjiSrfl1/7tuW+KmoPw8+90c3ASurgxYp4D2hTWhx1szL2cmJuDePIoTxpOEh
         cLvABzWRGQs6aWW0u63kTfAh/dgzCdmb4QKnZ2HXQJbxWhm/7pqWxrmysSYmM5x5a3Vq
         Rzd+UQjcNWaT7o/DegIlX/CJ08hEgSxO8aa/8Nuvs/vvKsB01hfTmB4VfuyGoXrml73Y
         k3DX7h8tZINOxJ9GO8F6qpLONUS7Y19PTwKRVD65ZikVKqoDDi9w6nRkvU97IVxbgsfQ
         vZav3+XzogcK0MZUbo4uba9QJGytNH0xJ72d61tpcLSSCQYVYailKOPezZnjlxnBOtFH
         bqpA==
X-Gm-Message-State: AOJu0Yx/wIsjHRKm/YMZ85Kbt/3VA9+7J91rw3BdqqM3SwvRucOVLgZw
	QsYKiX9HGWShkxDAx5kq/El+v1sxxBw7JHw53rcMyPDfKqYVTNbQvj4TZhpf35r0BsIWuh+cqav
	Sq+4=
X-Gm-Gg: AY/fxX4eaf8mqc7Z8iv/YzPpnuGlaHCXjig2R3lFRhvIBCY3dAlS+rBBqgvMsQmxj9q
	KRmlN+dcQ48KKr+ndEqchgUTfvYK2HnSyeF8o/MuaO5h+t9GEQHRErJwMJomJrhjmVJsTiO4aZG
	TfzGlFNARD3AhFl/6wdX4gV4RCvaZajw6HMSFStzWMM8rmkiraAIsdQoUndJXU8O6wyVWDstaG6
	IWbYdkxYEaGwwQBM9E87o5R4smfM8nqfQczTbwfZ/24V2QhkabGX271aGoJYELouuaSSACZ0Mo8
	+1GpMLN0Q3iRbusN/u73km10lEbzPmXfy1r4E/pYVps1OqCm1ZenFnDFrG+qikjPUOSZGXG+HFH
	+NgrPpCcs9RLDxB5tLJjPl3/ycSQpgP6LMleS9w9A5th9v7lsKok7n5sm2g4VAQ7wdSdQnz6UUS
	udyT4kNHC+Hjp8yYCgFJOCs0eVmQF4kIWx9pg4xZ8ll7cPqWAE1n0ohLRZ2IRMHp1jF5SNNN5j9
	iU=
X-Google-Smtp-Source: AGHT+IG/DVpt0dxZ0MnA7UvA5fs/4c9qFNsMZgo1v8KDLDsz11Od/u42IMN/L+3rY8HUsJLaobS7Yg==
X-Received: by 2002:a05:600c:4693:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-47a8b561a33mr10136105e9.31.1765447208204;
        Thu, 11 Dec 2025 02:00:08 -0800 (PST)
Message-ID: <c0d5cf8c-cb57-47a5-a989-f65677e565aa@suse.com>
Date: Thu, 11 Dec 2025 11:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Eclair analysis
To: xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
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
In-Reply-To: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 19:14, Andrew Cooper wrote:
> The Eclair step is now the dominating aspect of wallclock time.  While
> the recent changes were a step in the right direction, we need some
> adjustments.

One other question, related to the "dominating" aspect, but not to any
of the points raised so far. Can scan results possibly be recorded
somehow, somewhere, such that upon re-scanning the same tree (pre-push
test followed by post-push test) the identical re-scan can be avoided?
And perhaps even incrementally - if only .c files change within a (set
of) commit(s), only re-scan those, rather than everything? Could be
extended to .h files if dependencies were properly taken into account.

Jan

