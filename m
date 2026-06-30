Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xZsxAn5rQ2qvYAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:08:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6586D6E0FAD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:08:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=M7BKwjJc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348373.1606164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSZj-0007Nk-2H; Tue, 30 Jun 2026 07:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348373.1606164; Tue, 30 Jun 2026 07:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSZi-0007L4-Ul; Tue, 30 Jun 2026 07:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1348373;
 Tue, 30 Jun 2026 07:08:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weSZh-0007Im-2p
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:08:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSZg-002zgd-Fg
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:08:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a436b46-e002-0a2a0a5209dd-0a2a4504d60a-42
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:08:04 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a436b54-a01d-0a2a45040019-d155dd2cb47a-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:08:04 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-46e4764ca48so3807949f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:08:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cf1asm5107627f8f.18.2026.06.30.00.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:08:03 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782803284; x=1783408084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CJKOPJ9Q046WmuqYMMKs1TFQ2tB55rVr8p+5Wemr4Rs=;
        b=M7BKwjJcVCY0Y8OMrDLKKa9FE+85UXwC//GlJGVX4PwMh0c1ZP3diloDS1aFxqIB36
         DSrd4JJkmZA6mbnMEkb7Zi/EJkX9dEmMfZmwIXvKNtMDL5VWoZ++Pd8PcX/fUyAnjEJU
         EX3pa+YOHGsf1jJQMZOvzsVtq7mzXjnuiE9cRGz6qOMqLDT2J+UYlQ+ZC5cpcSy6+t8h
         G30Btl+/GI08Yx3ko4tv0EJ7p5E0ilbo4R+4bOtaBgtROUjz1n3DXH8/h+7pK5vhKVa7
         59sYUF/eQKFfxplHEIYfTg2K+sfg1/jOsCsuCK3ER04j2PoRg9jUgaCY9av6ouS8L3S5
         4Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803284; x=1783408084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJKOPJ9Q046WmuqYMMKs1TFQ2tB55rVr8p+5Wemr4Rs=;
        b=Ad5LyIb/+4OTZtSVVyjfx4cahbuBgTsPBt3Ps/JU//ftxDLnw3eB0L3TeoZgxv/qDM
         fAmmowPkAw8ZjmteoxUBMrOI2m7FLYHGuyJt/Ihx00tV5HRb3YcnITiBU+hCxbeBpG20
         gnCv1MzXPQH4obupk1nam1zrbTyfftqPVVBlCmUn/gB/MWUKKEPO8S+NtJoB99G9IY31
         ypIIVXFFdIXRUEl3HVsHSu2gvxWX+yNY5wg6NxS77dFas6VKxyJxR1tMMYL4ihlfZ/RK
         ibxlwlXxFe/nucG3qm5zTBm2Td1ykIyXkun+lMI9YUR000vYGLt3sDbAZ0j7n0yaeHHx
         o91w==
X-Gm-Message-State: AOJu0Ywb4hw9nCNUWwrc0BybLgKpJbPHZVmx1RY2Shz+YGq5TyEA5UNG
	bp6p3NcS4ysM/KiDqQ5Gz6aCaiu2QpzGBK0VPV3bk+jiF9tqlcUEsQpwaDD/Jsm6Qw==
X-Gm-Gg: AfdE7cm8qj7wZBcwy6czhrJnQICGEuaKfeWiPNnrNykqyqA0aIkvj4J62vnUgSdtQsX
	2egS12hAmsOVdbf7nyHKCC4eriG+DlcYug4V1nqjh0Cwz+9Nq7nwhqToum2JFoyZ1eurQGp9HHQ
	0u2uBSmFJjhDzzc6h/SxkTVrDNBNYgRPesBHcz9y4zuTZiDrxgd9TZeM+ZKIyiin3RXYD5Y3hu9
	dREAgK2cbr1xb2VQ1q5LCoXfUWfvBlDurZ16+r9xc8TW8GOcZ6lGG6Yc4pmKh6rXh0jXak8KYLa
	vWpLmm7ln3wUguCoN3sPIe6diksP2FQhMFT27Qo+L3p9n6e4GC52KXIJsX33eDHyRfG/kQdgGrm
	+NDCNpgwkdDXssiPNCNtkkj0hTTRG1C0CiFuP1pd91+MGNtPJJ2f1r+CGv53QksWjdyozUkXdLT
	BcWXKmca2nfBTUpSJ1haDaeQz3g3FNLAyxAqYR2+JwXtpb4SHsYVna7ajqFTfrqwb9x6Ikv2xQj
	nzh
X-Received: by 2002:a5d:5585:0:b0:46d:cc92:e00e with SMTP id ffacd0b85a97d-475535e7876mr2207287f8f.35.1782803283695;
        Tue, 30 Jun 2026 00:08:03 -0700 (PDT)
Message-ID: <7b0be62a-879b-4fd2-b1aa-5fa8448c7288@suse.com>
Date: Tue, 30 Jun 2026 09:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] xen/arm: Device Tree based CPU topology support
To: Hirokazu Takahashi <taka@valinux.co.jp>
References: <20260629215806.11610-1-taka@valinux.co.jp>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20260629215806.11610-1-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782803284-2DBA01CC-57502B01/0/0
X-purgate-type: clean
X-purgate-size: 1077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6586D6E0FAD

On 29.06.2026 23:58, Hirokazu Takahashi wrote:
> Changes in v3:
>  - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the sparse
>    map mismatch issue on ARM Xen has been split out into a separate patch.
>  - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
>  - Allow the system to keep running with a degraded fallback even if
>    the topology table allocation fails.
>  - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
>    from RISC-V and PPC processor.h.
>  - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
>    Elimination (DCE) where possible.
>  - Clean up the code to follow the Xen coding style. Please let me know
>    if I missed any style nits!
>  - Verify successful builds across x86, RISC-V, and PPC environments.

Having this here is better than nothing, but may I please ask that revlog
information be per-patch? It's there where you look when reviewing
individual patches, and having it separated also helps understand which
item applies to which patch.

Jan

