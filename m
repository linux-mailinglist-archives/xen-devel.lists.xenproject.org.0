Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBzGFWZB52no5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:20:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88AE438BEB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 11:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288719.1568955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7HC-0001GI-93; Tue, 21 Apr 2026 09:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288719.1568955; Tue, 21 Apr 2026 09:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7HC-0001DY-5o; Tue, 21 Apr 2026 09:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1288719;
 Tue, 21 Apr 2026 09:20:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF7HA-0001DM-UW
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:20:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF7HA-006oFz-7B
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:20:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e74148-bab6-0a2a0a5309dd-0a2a4505c0e2-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:20:11 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7414b-aaa8-0a2a45050019-d155dd34c053-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 11:20:11 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43d7badbd7dso1878742f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 02:20:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc0f31sm36032437f8f.12.2026.04.21.02.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 02:20:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776763211; x=1777368011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i6l9gYu7gHPdw1kCWuemUJlGY5BoSwxWKZbYuCjWyZs=;
        b=c5XMhJZ5VE8DsN4IwiliuObOQpUxaKAXyB/T0r6k5/cxjYjcFficFZwDbAh+GrYTx+
         33+1ghwzpdNsOG2IjcofBmgE7rG5urOhivbYiJU1tVWugKXaqE9HZS1fjUk856tLEybd
         BkfdBMNWXtjWRZ/1YqN97pA2MmM7cK1IkzhoLX8s6b+cZ6FwEW5TQLvHS4VIpJJazBTK
         FXmFl21GbuXVFMvcojdpskppPpBes4FL7omOd9eRcA/u2j2d3ZCSW6tHRR0Hysat9SMg
         1PQiAD0yk5MZjLpDrsf5C/m5M092DDC9FGnCjMzwfea1UuqciL8G/0IJqUuPZdSFOrfK
         gSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763211; x=1777368011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6l9gYu7gHPdw1kCWuemUJlGY5BoSwxWKZbYuCjWyZs=;
        b=pmMrrp2Z95blGR9vI8pbboeC+pNJOiOSPzNADPzyztJmP5JGPMF1fSVb2h1s3E5xY9
         kdJrXHnm4JrtmxsdNT/v46aYteoafa2xgz6xF+tMO36AwfdiHZmfwEPnH5cfIfWPzbzn
         WtGNcskTLptBAvyMWyBbGJz2Nf939WFWHr10ljaH6rqLN++1keJUvIZryj784QEv4QzY
         f134T6RjUI7BQYEtdBhfeefZ2bbkNSAIFKULEWAYhxGXxltD8svJ7jiRy6QGVuq4VEoc
         /m2P0D7Wwhcsygig5fMKM89S7nnVdJY113b7XwWlYxvGcj2d6tlOG1zO0VqZdBA7wyaU
         yLtA==
X-Forwarded-Encrypted: i=1; AFNElJ9qNzkFv9VyJNMxGJNXq5GrGoUS/S8408tEw1fSftN1ErFJt6Fc20sATzkigJFy8fW/Qp2GBf57Qr0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRueHrD35xSaXDH4CbOXEWwGlZwWfhr3KLKjUag5ir3OdUkVbt
	v0Hwl31blarA2hKoorC6GU9BJFPuc/4Y2Cib5UYeztOwGUvzc8Tn4cnZK/8X3mTn5g==
X-Gm-Gg: AeBDieuGr7WFkNONQCBRkhu6I1paIR63ugJYUa/pSGH1hv2aUlnoHRu5k/BLdIxP+Xc
	zeHs56/NFUXQ11fM/XFMzej1jLl7C8XKL1ZzIq80TPtPE6jhXjohXFevTH9VQ41RQ6GihLj4SPq
	fqRqRZfUtsDcH8onhr2mtVi7xwArpSY5eJxb9qRAyhxkIbwC8n1xdA4TtZzyuUK1DTgZ3lEHegW
	e6WIctk5jsPA4/DlwpOIeBt7aERHLYoNCCW6Z7LAKnWlvFRug3wbU0HA1H3EDGHGqfaZ7jEDNFp
	iYmUSCjkpCkPuR56Iwj8fNR3SAAnBAgDMbHFjuFfQG7cv49WGnzMMdT3wa8UODUdOZmWr3k8k6O
	wWICdvIedyCQwvhWodHehAEgJ3kISmlSUSkQncwUx0dqFyjMU7dr7HUOn1RvbuTVJSZlMzRl1Ce
	pZ/neKkdoUHJqMtuYI4ajVhDzvhoyeSqgKJSf5Lp2eCD0uNc3VB/fsGpjUOSHthamrYu7OgSUzT
	7oR8T0zTd3csj+SIkNgQmbenMzZ5gmjmDxF
X-Received: by 2002:a05:6000:1ac7:b0:43c:ff58:35c2 with SMTP id ffacd0b85a97d-43fe3dc5eaemr27167215f8f.20.1776763211244;
        Tue, 21 Apr 2026 02:20:11 -0700 (PDT)
Message-ID: <702045f6-a342-4662-9eaa-76f7be1df8fa@suse.com>
Date: Tue, 21 Apr 2026 11:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] xen: introduce domain-layout.h with common
 domain_use_host_layout()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <2057380b431df202adedf852ad492dd0f156f863.1775836193.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2057380b431df202adedf852ad492dd0f156f863.1775836193.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776763211-E2B68443-8D69B6B3/0/0
X-purgate-type: clean
X-purgate-size: 1256
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A88AE438BEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 17:54, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/xen/domain-layout.h
> @@ -0,0 +1,28 @@
> +#ifndef __XEN_DOMAIN_LAYOUT_H__
> +#define __XEN_DOMAIN_LAYOUT_H__
> +
> +#include <xen/domain.h>
> +#include <xen/paging.h>
> +#include <xen/sched.h>
> +
> +/*
> + * Is a domain using the host memory layout?
> + *
> + * domain_use_host_layout() is always False for PV guests.
> + *
> + * Direct-mapped domains (autotranslated domains with memory allocated
> + * contiguously and mapped 1:1 so that GFN == MFN) are always using the
> + * host memory layout to avoid address clashes.

What is "to avoid address clashes" about? If GFN == MFN, how could there
be clashes?

> + * The hardware domain will use the host layout (regardless of
> + * direct-mapped) because some OS may rely on specific address ranges
> + * for the devices. PV Dom0, like any other PV guests, has
> + * domain_use_host_layout() returning False.

This last sentence is somewhat redundant and somewhat in conflict with
what is said further up. If you did s/guests/domains (including Dom0)/
there, imo this sentence would best be dropped from down here.

With these adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

