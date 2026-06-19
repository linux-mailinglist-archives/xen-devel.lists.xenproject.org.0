Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4hmK8f8NGrulgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:24:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E46A4960
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 10:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=I7AKAFN5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341906.1602200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUWJ-0006uv-2h; Fri, 19 Jun 2026 08:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341906.1602200; Fri, 19 Jun 2026 08:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waUWJ-0006sC-06; Fri, 19 Jun 2026 08:24:11 +0000
Received: by outflank-mailman (input) for mailman id 1341906;
 Fri, 19 Jun 2026 08:24:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waUWH-0006s2-S2
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:24:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waUWE-00E6aD-SR
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 10:24:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a34fca2-bab6-0a2a0a5309dd-0a2a4509963a-0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:24:02 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a34fca2-4999-0a2a45090019-d155dd2acccb-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 10:24:02 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so1517403f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 01:24:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-465090c5176sm5866807f8f.12.2026.06.19.01.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 01:24:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1781857442; x=1782462242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HgltI3hYdYJxkkjW63dEk3mjZl7bGQ1QfCqfK1Uzux8=;
        b=I7AKAFN5zgRaNwuEVrFtTP2gzCpXXvfVOUzBhsAIWPBJRagnLQ+NaL+KR9hvBfwFZA
         rC9/l6Z1vy2IB0cLiy7wOazr48CLmaFgiM8X7H1iP+HCdNnLCtehpry6yBV9CP5Ebfve
         +dMQjxg8PhlDeggYb2uK2Dj0Ls00epkuOyq2vp3irYQyxSgVZEpOGSjc0wusoQohGbqm
         u48++6rQdv9UPy9f0v4ldV0iJcGSfluxrtmJHIirD6U0hPQft0aJ6diqxRZNmY5scOEU
         B5tTTHrnjcU5JFbnbsoHXAYZnW10bBUz6Q6XFYjNaq4LADazBRC0+/VLnvd9CxplUple
         csJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857442; x=1782462242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgltI3hYdYJxkkjW63dEk3mjZl7bGQ1QfCqfK1Uzux8=;
        b=nM3Tsllhn/lukPqt1UJlBF+Omw3Cx4aMS1aiT7QwzESt0MptccPuutkVlghl0dYCaa
         B7s1ZyjEVXgsFEdC8Pz4NPYgUrBBmLU2rFkfDAdmnTJTJ29Mho/NVXt/MKjcNg784ZnW
         Q42CqV4zTS1dsVgP3KKkMTamnWoJincHE9nvpo5ERegJx8oIXlyN0DKBvIcO50+dRzU9
         vrs+lLo2EN1mTXUGog5SkHsG0hVgQyeYuvSGpmSVWOadkzwXc/9TjLXo35LcVUTcqobA
         uXtCQEEOshgRd7yyAkjUw0AY0n5uiIfIL3+BfMe1O9GoKlq+VSD9biixw47ZKAwvJTqf
         ytYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yJAcAHM/O1efmMS9obxKDhQvr1ff93lomDWnkrrkC1zKnHz/NZODC03Q7pw75ON3pwQHTzb9hvvk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb/sntP9loVjF+4vO+KzMAVh+3WNTkUkCK1B+6okaqbcVzFfRl
	RtN33oBIzaAx557IRXaBS7eTXkTx+tWmoW3OtnYT6UEyyY9JALbkVSME+spDQXhiBg==
X-Gm-Gg: AfdE7cmFA96m+DWRK8qardpTtMit9s0VEgt3VgxkCZdd5uprJ3sIFQzDogBrf+7M4vV
	jHkYsYeeqbm4FVjTiqPyBh2RVp5sAuINVaS1IBW5uXzX4Bh7Qc5bW9niPKdm2uUInHb4ti+QQTL
	5ku4Yam9BVkuKMB9E4UPfDLHlIGXikbM3oDM3B3N6lWpa1ZQ08KdWFAucwTuj7ILSNw1ghTXk7i
	43V7SHCqPUI0GCdM8p10yytfMxuo/b4BkZ3O2FGqwpIeuAzoNkGsBafu1hMKbu375IsO86B4XV1
	ye4YCuvoShNjxjRekVLUywAUIaU0/Y/+AE8DxOlHtOLDoQKjuPtYqZdB9LYZFWDsJrQ7KPTS+/d
	7IUJwJzLS1hV85aTk4tULBe3LtCdX+CDFeGL+iOGUxkpXUPTuJm3bBuUi8t99x0gZu0dla8XGOi
	e4G5YVZM34vvx2giPwPT7S3l06IDJdyKDtio3H+FYLgY+COLZnnLokzSqw6oP9BDgJn9bDN0LqY
	7qv
X-Received: by 2002:a05:6000:1248:b0:45e:7997:8b7a with SMTP id ffacd0b85a97d-4650043985cmr2987416f8f.16.1781857441826;
        Fri, 19 Jun 2026 01:24:01 -0700 (PDT)
Message-ID: <3aefcd7c-d911-42b7-b731-5fc657b26622@suse.com>
Date: Fri, 19 Jun 2026 10:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] xen/common: Default function to get the distance
 between nodes
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-3-taka@valinux.co.jp>
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
In-Reply-To: <20260619075011.377116-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781857442-F51F3744-8AAFCC6E/0/0
X-purgate-type: clean
X-purgate-size: 1108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 191E46A4960

On 19.06.2026 09:49, Hirokazu Takahashi wrote:
> --- /dev/null
> +++ b/xen/common/numa-distance-map.c
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/nodemask.h>

Why would any of these be needed here?

> +#include <xen/numa.h>
> +
> +#define LOCAL_DISTANCE      10
> +#define REMOTE_DISTANCE     20
> +
> +/*
> + * Get the distance between node 'from' and node 'to'.
> + */

In the description you say this is a fallback, but that doesn't become
clear from this comment at all.

> +uint8_t numa_node_distance(unsigned int from, unsigned int to)

If both parameters are node IDs, then why aren't they of type nodeid_t?

And then why is the return value a fixed width type? See ./CODING_STYLE.

> +{
> +    if ( from != to )
> +        return REMOTE_DISTANCE;
> +    return LOCAL_DISTANCE;
> +}

Nit (style): If you don't want to use the conditional operator (so the
body would be a single line), please have a blank line ahead of the
function's main return statement.

Jan

