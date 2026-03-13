Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMnPNYe4s2nbaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:11:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102527E8EE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253278.1549553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wfd-0004Kt-JN; Fri, 13 Mar 2026 07:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253278.1549553; Fri, 13 Mar 2026 07:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wfd-0004Ib-G2; Fri, 13 Mar 2026 07:10:53 +0000
Received: by outflank-mailman (input) for mailman id 1253278;
 Fri, 13 Mar 2026 07:10:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wfc-0004IT-8p
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:10:52 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4163377-1eab-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 08:10:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so18018185e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:10:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe20b544sm16037226f8f.20.2026.03.13.00.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:10:49 -0700 (PDT)
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
X-Inumbo-ID: c4163377-1eab-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773385850; x=1773990650; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IkELls+cI5NtJoMoohsJg9eiOC1UmK6cR3HNcFjiUX0=;
        b=OB93GFTUVDeYHUveOnK/IlNToflKll3Z2qoftyNgavoEu3d6EYp7SC+X0EUsA08k1r
         bKE+eGpoo6NSlxZs7LittOulb6UGQX6Il6oc6p5BQe+1qfZnV5kk1okS4AU2uBfaagAJ
         818Nbbguf7S/kkt4yuQYQ9H/qJTQgjvTtpOGnFVX7G4vKHY/ZBNrtpr0n57bqe9sLGbe
         Ih3M/3mFGXE0k8wn3ZwkZ0puavnirgQgBWH3BPm+VjLpSRu64PmGC9XW0gn4h0/HS5fu
         zs9Hv6Ye/bwhZs7d/h6xqGCCLZIFIDGHJ9Isw0TgcWbYHQHmyMr7a2f+C0diYYSN7RZK
         cNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385850; x=1773990650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkELls+cI5NtJoMoohsJg9eiOC1UmK6cR3HNcFjiUX0=;
        b=Hkwa+IjggJ36AwwEkvZ8rm/BoOEL6mWIu8K71M1uiWH85WfOdLCF17/o6AHXyzybQ/
         6RFk5LMQ98EoLzhnaiqpChF6zqZYZp5P63PyF35RV+xeWk5SESw7/0TkSbLVn2Gf0YgA
         qvISs6Rz45Yj1qGdIg3k/9yWs2ik3ZJ9afh33ql6/IrNqaPDBJumC43PgA05COw6rJ5O
         DGtNbYKpZJmTIpXAzNCnGzj7iNj2oG/bD8QOKuy35mKySTHeq8zeeC5CPfv1eTZH9zWR
         1fx9svsVLmvSiKAgVfR9Ipkzfrgu/3tDdWD3Wp2wDY6HetvpsB8OJpsG+YvUTU/RUBqy
         enGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbe1zU6LDS+VudgYgXSDHR6FjHGerFpYcqMxjIBf4qP4Ih0VYOybq19g0nWkMGNxYaWnl4Sgt1wh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUCVp2+zA1n7s3um+NBSBRi6740CnbAG6jG6Hk1lnZDKw+7xWp
	ZkHKvZPfVnkF6Kx48qvv0LLuxiH7Lp5DXDLdJWK45+pBOL/zuKAVzvBMzAbA+AJXzz1Y4K1RBA8
	VgJw=
X-Gm-Gg: ATEYQzxsuz5/vGWODGoXun6W82CzNlRAAknKSYK+zN6qL6l7Bsq3dpElGzTODImmG86
	YUSSNFPT1BmEcXVDFVZRV2H9OdFKxrK4ZZAKNeoe4Ze+Z8GMS9mDk/2VSg9SoIaGywmJIELbraW
	6vTNkap1uuRj1Z12wYUhYb6UrxJDUiw4kUPRnR0YDEWDViYBc9cBuX/Rt9HyscT/GNUp6vHXOYN
	5XrxotvsWNuv5RyZWYciNJIKmWVz9BS2CM6dIgdnydGLxRv2KjUAemnSOqT0/lja52eGXIf82EA
	VMTdwvwgx07KzJJcCk2A9CJY/OgyjQK2Eh9WqwGRpvROMPdpTQu9mpH4MMwJfRnM/1PjByhEAn3
	qgHk1047cz/tZcbNfRsH8G9JTT+3gbU5CWToVxDVwxo5QtJUXpJZflNCKBwXdyFXfiefYfN2S+x
	iqoXlhdsjFqb46PBxL+vcGQJXp8F2z0LXJkbY3FlKI5YueeZltj3Dr6vIw9DtcrQdHmS/zCLWcS
	ZlTLuw2zOx/nzU=
X-Received: by 2002:a05:600c:64cd:b0:485:4533:9c47 with SMTP id 5b1f17b1804b1-48556705203mr31220845e9.22.1773385850347;
        Fri, 13 Mar 2026 00:10:50 -0700 (PDT)
Message-ID: <60349979-7dc9-4ff2-9043-957cfc039c6a@suse.com>
Date: Fri, 13 Mar 2026 08:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 2/7] x86: Remove x86 prefixed names from acpi code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-3-kevin.lampis@citrix.com>
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
In-Reply-To: <20260312204339.740403-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8102527E8EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12.03.2026 21:43, Kevin Lampis wrote:
> @@ -1059,8 +1059,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
>       * is not required while entering C3 type state on
>       * P4, Core and beyond CPUs
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL &&
> -        (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
> +    if ( c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH )
>              flags->bm_control = 0;

Similar issue to patch 1: Here it ought to be possible to leave just the vendor
check.

Jan

