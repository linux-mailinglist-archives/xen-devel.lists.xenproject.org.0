Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHpDO12b2GkgfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:40:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673A3D2DC3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278363.1563224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5XG-0005GZ-F1; Fri, 10 Apr 2026 06:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278363.1563224; Fri, 10 Apr 2026 06:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5XG-0005Ey-C8; Fri, 10 Apr 2026 06:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1278363;
 Fri, 10 Apr 2026 06:40:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB5XF-0005Es-3U
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 06:40:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5XD-00Ay3M-VX
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:40:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d89b3f-2eae-0a2a0a5409dd-0a2a4503cf82-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:40:07 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d89b47-02b3-0a2a45030019-d155dd2ca8be-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:40:07 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo961306f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:40:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5d85fsm4346745f8f.36.2026.04.09.23.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 23:40:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1775803207; x=1776408007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e/IPyXzqdpbTutGWDnypeB9UGv93dbAo3m2Ajd7h1s4=;
        b=Uh+rjmN7s2CA/WCB7YA/fglFuSrXegAVc0n6TaInuSioiaNUB1Noca9EyFpis4g8la
         0q6fdCLpgVa4XluR1ZcIvFlZ6VYYfX/RHWuT6IzFSQFBEzldH0aE00fvRLx+3Y2sPpln
         M3FYfjo3/i8OfNa75dI32V2Zm052vCVLVmnFw8eGJ7STsjwjBlC2fYd8l105VRkLLRtF
         N152HdvAM5szKob0Tmxia6x62XoCxQH73KLmsk3Jf/GLdOKxFFunZV1q4+guR3oh4QHz
         K8yQo18oirA2vHEiYFtXLRlhb1zTwrR0xUZBSeLOgO4nh4qz5Hr6q0pqkJZklBi44SZK
         8JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803207; x=1776408007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/IPyXzqdpbTutGWDnypeB9UGv93dbAo3m2Ajd7h1s4=;
        b=QDvCgFkTQWOUmEfVRH5VEYwPtzSuOILAKH9jOmhPeYxjKYnr8derKFNkX50RQqLQLn
         UnMm40v0PuHTGJ/IRuJc5l/MvVjVMKyLNPoHKF6HBw6g0RC7obLjrj3vq+j0BeY6UBSV
         MTTIRkIgDI0oGlFLQz4S8VT42VANWORSUPUiQspF6OoyFoP5ghHpduQWqb+ScXTdE53G
         1nFe5Wznr7J2O6TS0TgL1vxmFpVCpcqZAZqoCA/mKwl+YIkNCQ5nNSKUDrsPqhUV1lQ8
         yavfe1jY7rGPs/3REbVwwn7XMxgdFiHGo0uu8KyPhS9CWHaFw8csS6qyvIFjvkhHl5c2
         nw4g==
X-Forwarded-Encrypted: i=1; AJvYcCXMepbMZQuCcS3bGqOuEJvv6Lbie/x0a4DNoRTwBOrAElj/DeeT1DA3W1TECn7HHss29mDh5uoLY8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhcEftIZvbe/8bFjmce7h3EsYxjPQTG8yPRtLARx9GVhwgaKq7
	CH6W4XDQIDWouIT82T92QBHUpN756Z5/+WXP+2yi+9ukLvgOHtY8JaTfVvGWYftt5w==
X-Gm-Gg: AeBDiesrK4N9siLfSabPT+EAiKKCUJPqDonxb/XxUlnajqjpLVGuNI7/UGPMGYxj++k
	Mgjusbvm/WIqMjh4fZdewU9YxeVn4vWWYN3Z0lNWnZtqB5rE/Kr2ypueRxdzNdrDgekDlSKNH1U
	1pafYji7Ezz2CrqphVDx86GFeL7hxetuRYFJdsz5vy/5iycOiTDA/xzI1Kpl8/RQLqP1jF7Kpox
	F8gFcS9SDiIY8ySTH+YJUKhBWXCxamA2iUkGWmRAdbfxmS0C48NIzNMFeaRfJ/sKxnOnP+Zp3cF
	TSLQnEVward/yGaU1jB6GvgVY/9ht0v8uzAz/DwDaFYpXR7A2qAPbYbB9JAHUn//QArwKhOdwVq
	qPE0e8IV+jEtVv8Ri7VZYKi1sBrxzvQiVVLb0uOWcXsM+5rkZnSHI+8V5P/rnmM2R5mTFHNf/o1
	/vtCqto5FwEWWFCW+ANDUZ4SUA3L1v2mGJVG9DHnKrnVjz/x6unNP4vgrLaGBTJ2KYUagXCi/+w
	rcpVZpmSMkiKlA=
X-Received: by 2002:a05:6000:410e:b0:43b:8add:e469 with SMTP id ffacd0b85a97d-43d595cd702mr5340198f8f.22.1775803207291;
        Thu, 09 Apr 2026 23:40:07 -0700 (PDT)
Message-ID: <0c68ca5e-51d3-42ee-aa27-301ffafefc5f@suse.com>
Date: Fri, 10 Apr 2026 08:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/its: Decode BASER cacheability field before comparing
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
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
In-Reply-To: <dba15db692025c75f8bd3a2c5dab2654eaa4e896.1775801199.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775803207-C9D3CC9A-C665EEE1/0/0
X-purgate-type: clean
X-purgate-size: 790
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5673A3D2DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 08:09, Mykola Kvach wrote:
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -496,7 +496,8 @@ retry:
>          }
>          attr = regc & BASER_ATTR_MASK;
>      }
> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
> +    if ( ((regc & GITS_BASER_INNER_CACHEABILITY_MASK) >>
> +          GITS_BASER_INNER_CACHEABILITY_SHIFT) <= GIC_BASER_CACHE_nC )

Are you aware of MASK_EXTR()? This is one of the cases that we have it for.
Really all *_SHIFT constants should be purged, as they can be calculated
from their *_MASK counterparts (leveraging MASK_{EXTR,INSR}() to keep the
code readable).

Further, doesn't gicv3_lpi_set_proptable() have the same issue with
GICR_PROPBASER_INNER_CACHEABILITY_MASK?

Jan

