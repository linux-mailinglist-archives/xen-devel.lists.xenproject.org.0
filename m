Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOQmEzuY+GliwwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:59:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A484BD52E
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299897.1574461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJstF-0003nP-N9; Mon, 04 May 2026 12:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299897.1574461; Mon, 04 May 2026 12:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJstF-0003kL-KE; Mon, 04 May 2026 12:59:13 +0000
Received: by outflank-mailman (input) for mailman id 1299897;
 Mon, 04 May 2026 12:59:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wJstE-0003iw-4k
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:59:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJstD-00G9N5-21
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:59:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f89819-5cb7-0a2a0a5109dd-0a2a4509e9dc-30
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:59:10 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8981e-2497-0a2a45090019-d1558033cdd7-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:59:10 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso36306855e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 05:59:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7d035sm23960546f8f.5.2026.05.04.05.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 05:59:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1777899550; x=1778504350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GP43b9Z5tMemuOZBWC17D6oVT4FU12xTRNjr+Xzrrv4=;
        b=AQ2EF3Or55HujdDbG9JyQHyS9d37HIMQDmDr92tZkNwpMJNnOSITdQgKdCxVqiVyXm
         wmv8A8+vg03pGydACvTLTETrpOTpy4s7Yg9fvm9WtHOEi+AcuMNXsc0EIgVjR2PLvHGn
         0itUggNtMU0aODmjOSc/Nqs3eILhv0l8cA2d7b3W9sWz8gg/8XtTUKnGfu8PwppKiM/f
         DudjE8SkQLa813m3V8AQ3yFgXPoB8tO4m5v4GuLX45WOD67NhO6PAxMqaRbh7aOqP9x/
         WiOIOmm10r5KXZOvt/sEB+k3qL8FkhNKeF6tg2if+T27GntsvCeEU1kDk1rjFVxYSQ7q
         DZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899550; x=1778504350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP43b9Z5tMemuOZBWC17D6oVT4FU12xTRNjr+Xzrrv4=;
        b=fo7RdCsgo/jQG1TPjuENZ9YpJulZiwf2grzYnW9dvgkFUfyzJ4AG7yiecLUQQ8Cl+k
         s6K3ZQTAu+c000rAofTwtnKGLg0yTabJx0NxXDAOfT4Y3pSYF/87vInECPj+mdaWrKpg
         lSSK/uusykFTGEdVIivihM12vIILaOhYS04qVy88+cdS7Q+uMVHmBgq0Xr4QlaqjGrjh
         BiUZ0tFjbVTog9iU4A6mpjzwSTTAMENj/urimizrWWeOyvOAwBRtOR0G1kHb3QweUS2f
         aafEcPcxACszZVK4GKmCMckL6jZJjbfw+D8d4pu+e4kpK/R33W8SwBLZZyFOAGA6I35J
         SU6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+LlqjPQ4HxmjfTXilF94CViHq4HmbX4k1yv3Ju7T4Ng/yilgjQxKoxBwGmlthalufblrP6OxS3Ka0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTP9VYhaL7PKF3urFU3+xy/e+U2vosqKXY5MCCCh9GFArzo3bN
	QYk+TIL8Sqad9vnN1a8c8PAzNbKUaMBFIsEcrJSo2B4VwlO7isO4I+MWATH0OWLjDA==
X-Gm-Gg: AeBDievLBS401Vv/oaMxryrpVJw69kP3LMu/5Y6eqFOUZBZgNNlmohNgt8dNMtAnS6c
	YO6MwUcQxIcRTOxjGbF+sVdOulBAdMuPpp3rCg9erw42hUo0y9Tzkyz7/3TBEFXLdKgCWxDheIQ
	RIlPLyLTaQ0skQyipUjOwtADuRFsDOlV71wLkCgQ7PG7Z4JTmzLnsk5wrHtJopH5w7NYIAJ0EqC
	Hs290wupnn+RkeWimGie9/Do+PHJVtU5d/raN7AWdBJvfWsEysT+DZuxT+OcaB4AOD6OOhCf8gD
	DuAsGUsIWrXcyYscsnK8oh40W6a9pIII+XdJuFyonCs50Jg2VybveC4kHLktwt8nGLE4Fcsjbys
	8fitWRhRdyAMxY7Hg9WNnRHbvAGJZO2VEk3Jy8whVIdvVjKeClsTF2IMx5H7dSl6Ycgu9oJNEVH
	6rBCy3OjwNo9Fm7fx7YodJVKZbSCKmTKkoOpV6swBmoIk4FjkDbEKm3lDD2gV1Qol7Io75DZ3rn
	lxcvL2iH+BafrGytBEBg3vNaQ==
X-Received: by 2002:a05:600c:348b:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48a986589e9mr167660415e9.16.1777899550482;
        Mon, 04 May 2026 05:59:10 -0700 (PDT)
Message-ID: <80f67b9a-2b42-409f-90d8-587a07d57d26@suse.com>
Date: Mon, 4 May 2026 14:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] xen: introduce domain-layout.h with common
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
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1777899550-42F76A53-C00D81B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1701
X-Rspamd-Queue-Id: A0A484BD52E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 28.04.2026 16:33, Oleksii Kurochko wrote:
> domain_use_host_layout() is not architecture-specific and may be needed
> on x86 [1]. Replace the ARM-specific macro in asm/domain.h with a common
> static inline in a new dedicated header, xen/domain-layout.h.
> 
> xen/domain.h would be the natural home, but placing it there would
> require including xen/paging.h (for paging_mode_translate()) and
> xen/sched.h (for is_hardware_domain()), which would introduce circular
> dependencies. A separate header that callers opt into avoids this.
> 
> Adjust the implementation to take paging_mode_translate() into account
> so it works correctly for all architectures, including x86. Some extra
> details about implementation [2] and [3].
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop/
> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop/
> [3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3148344@ubuntu-linux-20-04-desktop/
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With the SPDX tag added as indicated by Luca:
Acked-by: Jan Beulich <jbeulich@suse.com>

One further minor remark:

> --- /dev/null
> +++ b/xen/include/xen/domain-layout.h
> @@ -0,0 +1,27 @@
> +#ifndef __XEN_DOMAIN_LAYOUT_H__
> +#define __XEN_DOMAIN_LAYOUT_H__
> +
> +#include <xen/domain.h>

This isn't really needed. It is ...

> +#include <xen/paging.h>
> +#include <xen/sched.h>

... included by this one anyway (pretty much unavoidably right now, I
guess).

Jan

