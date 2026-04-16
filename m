Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH33DJPx4GkZnwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:26:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BD940F8C9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283570.1565761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNfS-000711-N8; Thu, 16 Apr 2026 14:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283570.1565761; Thu, 16 Apr 2026 14:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNfS-0006xy-KW; Thu, 16 Apr 2026 14:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1283570;
 Thu, 16 Apr 2026 14:26:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDNfQ-0006xc-Ef
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:26:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNfO-00EUyY-9o
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:26:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f160-bab6-0a2a0a5309dd-0a2a4502b5fc-48
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:26:03 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f17b-af86-0a2a45020019-d155dd2ba87b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:26:03 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d70c30767so436657f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:26:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3ebaf1sm14379690f8f.33.2026.04.16.07.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 07:26:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1776349563; x=1776954363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y1EiZRrmvmLsUk5kd4nFHM1hnrne3bEEkRcTKkmmAe0=;
        b=JlEjQBOWXov8LBALCVH54o8vOFR8f9xouNxSe+rqX1KxKM6D4tibcwDOpCQhZjAH7X
         Ohk4zcx+VFuceDDqlWWGD+CcQIDTPxKwes0HKy9KmjB/ifcTE0GBb/HhkH71cns3DkDC
         QcgDPUfKWz4RZ90qmJjmRKxncvjNggjQkt5LNB5XeLGeq9xuvT7ecU5Q/RotRvtFAJyc
         /Bpy32ib3nN05zJ58HBxCp145v0xeRMbjhAcMbpcF5zGwoiNio2Gr/gwnq8o8loNO70v
         ccdJW2VPBP0pP8Vh0SiBR0L94NhjOfnvwcBW6zxV8LmiwmR8zG7hyroXFi45cxM+OVOU
         Mbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349563; x=1776954363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1EiZRrmvmLsUk5kd4nFHM1hnrne3bEEkRcTKkmmAe0=;
        b=raHUySO86FwimIs4m/gBYhvzqRQJKkhbz48A22G+akyqm2/IlBt0LEb27xaHJBdFkF
         vuHR82gzI9OLLchAQQxjK1JL+QYHly3Nq//V5rfLUAQg+s1DhkRod7Fr+FaMapw008pJ
         ODDTmGogebspPJKsrYq/AYFLVbPQFZI/mjMN9rLk9qHirxapLRr9uqrEmKcriD4oc3B9
         dTzOurWc49euyJ1ZBTpLGMUtk0j/df1e3x+1jRIuNC8vJQ+NNP4thASELi7UoWlPn1iG
         jdtW8KJ53fYH4nmEb+IsR4+vKp7iAXspcyUGL5AhmVGrC+Rzg3AGj/2Di6dvVgNXDPUf
         80dw==
X-Forwarded-Encrypted: i=1; AFNElJ9JOdwn60WsC22wJhkje78JTzYWCB4GtGaYVk+smkjoszgqB5MUt/ULc3Jm20mgLDmBL6NIchMeY3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymP5xrKh9P4xlQC9aLztJJspD3ZeRva5ImImF+hqakJBpXP3eT
	YouGA9T3URHVU8LJ3Vbp0bhxhBMvu3mZ82A2P3/+Gd+libiOHthhHSxWtKHcWsQTfw==
X-Gm-Gg: AeBDiesBj93KQhqLfF5fVgxdobwGNtCV1EEsIhSl4Tj9f7EGrxix3v1glVUj/XPuSsi
	22GJYS+sm/38yHIp3jE9O+Gp6focARPSJuMqZOPckOMeD5IEFkI+tzLpRUCgTEWF3r04h6LHUJe
	97Pbal2lK0Knlxog3Z7dEqDU5x08vf62zbw41DYXRiRcXb/AeXZONv/wAp47wKSk7iM1syXMZS+
	d55PRfVW6o9DQbKv8zQEw9HPZ7oLQp48f7pOnsFYt7cHNK0ViYJ9Zu8E9BFL36dB1vzw2maF3T7
	SLF7smLVXjG5di9DDKhPPWdVE7aNw3qNCzxj1TEEhmLPi0yrRQeMaXEY1rDyL4pvSwrzKZRmgXW
	qy+dWQz1WwO6p8VaRLHkY+4hp1ymfJ4M80WLd2zpq/bTLqDDdFwJXg9MUPOIq2iB3KMrpq5NG9V
	VaSNDc14pnRsp2iMD2gAVpET+xtuv2/8yZUkx7gr+rJt3rs3e9rl+j9X5gb2++XFYbUnZDFs+HC
	61kHClJ1zB8vJrA9Lri6ULu5vaVad4b9uO4
X-Received: by 2002:a05:6000:1865:b0:43e:531f:720c with SMTP id ffacd0b85a97d-43fdbb400a3mr3674655f8f.11.1776349563039;
        Thu, 16 Apr 2026 07:26:03 -0700 (PDT)
Message-ID: <ed24f4f3-935f-4e60-b5ae-f5df49ae06d9@suse.com>
Date: Thu, 16 Apr 2026 16:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] vpci: Use pervcpu ranges for BAR mapping
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
 <20260406191203.97662-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260406191203.97662-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776349563-81772161-99629E44/0/0
X-purgate-type: clean
X-purgate-size: 1823
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,epam.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 98BD940F8C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 06.04.2026 21:11, Stewart Hildebrand wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> There is no need to store ranges for each PCI device, as they are only
> used during the mapping/unmapping process and can be reused for each
> device. This also allows to avoid the need to allocate and destroy
> rangesets for each device.
> 
> Move the rangesets from struct vpci_bar to struct vpci_vcpu and perform
> (de-)allocation with vcpu (de-)allocation. Introduce RANGESET_DESTROY()
> macro to free a rangeset and set the pointer to NULL.

I'm struggling some with this description. On a typical system I might
expect far more vCPU-s to be there than there are PCI devices. In which
case "There is no need to ..." and "This also allows to avoid ..." feels
like an attempt to mislead readers: We may end up with bigger memory
footprint, when my reading of the description suggests you're trying to
hint at a reduction.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -455,6 +455,8 @@ static int vcpu_teardown(struct vcpu *v)
>   */
>  static void vcpu_destroy(struct vcpu *v)
>  {
> +    vpci_vcpu_destroy(v);
> +
>      free_vcpu_struct(v);
>  }

Can't the resources be released much earlier, somewhere during
domain_relinquish_resources()?

> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -40,6 +40,13 @@ struct rangeset *rangeset_new(
>  void rangeset_destroy(
>      struct rangeset *r);
>  
> +/* Destroy a rangeset, and zero the pointer to it. */
> +#define RANGESET_DESTROY(r)  \
> +    ({                       \
> +        rangeset_destroy(r); \
> +        (r) = NULL;          \
> +    })

Please note the subtle but important difference (in ordering of operations)
from e.g. XFREE() or FREE_XENHEAP_PAGES().

Jan

