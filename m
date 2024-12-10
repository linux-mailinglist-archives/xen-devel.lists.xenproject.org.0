Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB59EB2DE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852483.1266261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0zO-0006gV-Tj; Tue, 10 Dec 2024 14:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852483.1266261; Tue, 10 Dec 2024 14:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0zO-0006eH-QC; Tue, 10 Dec 2024 14:13:26 +0000
Received: by outflank-mailman (input) for mailman id 852483;
 Tue, 10 Dec 2024 14:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0zN-0006eB-BK
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:13:25 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea4e553c-b700-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:13:23 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-435005192d1so12775175e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:13:23 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386220b047dsm15975045f8f.100.2024.12.10.06.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:13:22 -0800 (PST)
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
X-Inumbo-ID: ea4e553c-b700-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733840002; x=1734444802; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LEi4sYW9tslY79x0s7lrA3FZuLBUhpRBvUZs1d+7ffM=;
        b=RRggAGu+Xfb/jRSrSYuYMVODMNLappNPySwxMwsdOkNy6GsYEH9n6sua8hdG0HSQY2
         M+TJ1oshqY5Fsthm8JJnEeLZ/y7yT6I9Fsh7CI47kfuXfT6ZaAWI41LZVAjAMRNwBinT
         0m/pTwG0mqSasENewJcn64U8r+WcEWbv6ACf9O1cvr0TBTfvOWXcaZ9DxHc8X0p9fJWV
         stm24iRgeN6niwgoq2wKIM33AT4wpLOJiBZ5ybE3iIoJJKb8/snPIjV7BDaJHmhOnYCr
         JZfsQcp2x8+Y8ynjLKV05689A77VbHrQgKyGn3Rjt4Cr8/OlY/oO6MRoR5fP9Gd0+U6V
         E6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840002; x=1734444802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEi4sYW9tslY79x0s7lrA3FZuLBUhpRBvUZs1d+7ffM=;
        b=XsQygHcu0vp7hWunnhaiLxgDUs0VN3d1341r5X4RzQvLGmTMWAKukaTLMmg94177fM
         oVfJPFS+WfjnxT80WI+vRRbrg/ZekTSEdxvPY35wcpg+R+/Itt/KRTXk3hG5YGj0Z1OU
         CJYJ+cw7o7qwzgqkeesL1RQ8IMjLaaXHrAkq/imifKNQICahDf8ca1N50Kz+vkE0QAAf
         ggmBM0FY/NkI7hzsgFeoramJsuBpmn9SJD5tLRMgvw3shDvDKY4KxXwFH4Vg+DTAD/Vy
         71jHSCSL4vUkmeU4G1zbWdORv0tKjojYm+CWtCizHxPzEOliEMdo5Vhtn7fcKIzLpoaS
         sztw==
X-Forwarded-Encrypted: i=1; AJvYcCXGkhIckOhXsHac0IdBLuBpkrm/lmo27K0vmNz54r09blYSvq7ef3g39qgff4vm/aG699mnKocyLsk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyt7G0duOOEvOEdIbDUhHaj3Tt5e0xwr0TgIZy3zo3wuBqDXhJa
	y9AivO2aMHN3VE9a78iGtooq0T7s76LQWeJbrNKRiRv4entfh1wqHogqYGucLw==
X-Gm-Gg: ASbGnctKlhgfblU54MjPdvf6ArFrs0val9WATkYch41+FI6t+TxpdOTejwP2lYuUq8d
	2KlbfGfcvvD8T26Mw6YKSgHuu3R7BDY7uxWJmY5b0pIzn8R/1SlRuaePgsBnn2pJb78lD/NUbWZ
	/HlUwSaqUiq9PG3vadv7hxubv0gGqDltXxjYO3pPvkODLKjp9V2iv9vV34Ax9C7h1RxNS2l4lVs
	MHW2JgFecQV1tja2j+fzFmSbaF1vTzoRaNaNUaBdLxlovwRy2dfpmtsKfUR+04go3tECd1v1CpO
	V50+3zmkdbdqEn7hvnYddlpKDMM9mL/IZim00e4pW1xwulr3DMFQ51CwTCOavhaDXzD+YUzzoJ/
	KdlIToMi1Yg==
X-Google-Smtp-Source: AGHT+IGZhYb2KtlxKgJzXm8nhnYihwQ2Vni/SzK1O4MOiNxsfFZT/PBQGG4t4U7N7DG66PVKnjCRHQ==
X-Received: by 2002:a05:6000:4704:b0:385:f44a:a68 with SMTP id ffacd0b85a97d-3862b39d760mr11555402f8f.35.1733840002548;
        Tue, 10 Dec 2024 06:13:22 -0800 (PST)
Message-ID: <eb9246cc-059d-4dca-aca8-e75976537206@suse.com>
Date: Tue, 10 Dec 2024 15:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/35] xen/console: rename switch_serial_input() to
 console_find_owner()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-14-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-14-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Updated the name to highlight the logic of selection the physical console
> owner: existing code does not switch only serial console, it also switches
> video console and debugging console (debug I/O port and console hypercall).

I'm especially surprised you mention "video console" here. Afaics all of
this is only about console _input_, and no input comes from a video device.
Arguably "serial" in the original name is too narrow now. Yet "input"
continues to be quite appropriate.

Jan

