Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixfCBDXOKmr2xAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:03:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC736672E5B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Vl+iEhCF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335742.1597919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgvN-000745-KY; Thu, 11 Jun 2026 15:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335742.1597919; Thu, 11 Jun 2026 15:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgvN-00071Y-Hi; Thu, 11 Jun 2026 15:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1335742;
 Thu, 11 Jun 2026 15:02:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgvL-00071S-ME
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:02:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgvK-00DFwJ-S4
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:02:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2acdfb-5cb7-0a2a0a5109dd-0a2a45098396-22
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:02:26 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ace02-2497-0a2a45090019-d155dd36b87a-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:02:26 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso6347847f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:02:26 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f2710sm63963025f8f.14.2026.06.11.08.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:02:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1781190146; x=1781794946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K6UVZZE8h1cEWvbz96LqlxMrECq0XtvdJCYmIs3PbBA=;
        b=Vl+iEhCFCcbF10iThflqrxsjOPpXEtFWJF03L5rY5fPkFqfAiQOFFYfc2dcNbKST3b
         jqGXLMrxHVbnbj3jSxjml5QJdFWWbpHUuYZP2qI72Y0YqJ+sA3ii1xwSRkike1Up4x96
         BU5SUO2htJ8UeLkzm6UY5Eu2ecIybxoXhlkvT+no0XY0FmqUN+ApvUdAmDmFb3F512tp
         RAsqdirnztQCTpaFqntVS6op7+jY/KwkGPHDy0kTgpUBGFkcQZ4jIXubPXn4qXxhFaZF
         aWPnqzLOa6Klg7LTtw80aoBKKDipGl46bagXUuwP47eRO0ki7EMv6WEUJGnuLKEE/7Et
         6PdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781190146; x=1781794946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6UVZZE8h1cEWvbz96LqlxMrECq0XtvdJCYmIs3PbBA=;
        b=Af8tFZ+vWMG4f6pgndaLpAag79RKghsaWkafkdnE/4d2OVq9C3ovO7iNPqVbK6x1SA
         hLBSf9PJutgSHDPiaPlZCmrAaNmvdQGOfoQW1w8g7tyV9nHIK/ss86p30OIjM3RMZSQc
         pQJUd+DrhGKvW2e67sERRYtJsBqv02npwCo5HW0ge7ScDD5rzxPgyE5EwbJNDzss9ezg
         p0q3m9n1Q0igubjG3gEnZhUfPmsrEtP4QJyoJSdl2MKZzFHPtY5l1pLFdK9bNAS11d/g
         B4jQm/lR2/2awRvv37cNI7JTbvQm3xvuOKEvpHDu2r2379g4PZkkilITrFt2p5jkCxou
         r2eg==
X-Forwarded-Encrypted: i=1; AFNElJ+PjRLHwQqy/iXD4KkfF9IsQLwNJADKfnPkeuPtYgIGK0Y5+j9BuL6g03OTKH+XahXJVF2oECVMvfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo1/ARHtlwHLhvXXQS3AzJMa9fl+OeJ+5h/bqMRO20bUxKcaLe
	gsGyh/0fqcuoPHQe8WWgy5zZeyahKvvFc166qdmQ53cF35CtC4EZBJOp5eZK0MAkow==
X-Gm-Gg: Acq92OEKnfFWGqZlZ6UpsxxmILJt/OOgSHQZDdTzkWgr4UyYdFRBGI32h4oxTGqe6lo
	u0J/vWlF1gjbc8f/XqZK2dTWfAHDtzmKrsMVoWXSIdRM2NWefBkZbqvhLedjRAlBN0URkap3NlG
	+h2RzN+4+fJ5MyGD50D8g6zSAXcOZ82P0LOIvPlfMcAHIMpf+doR8nUU3yQKMO7J2YrRdwPIZEK
	IPgd8Rzf0wO1n0Zbg2iY64XnWVBHl4FCgydzjPVxrTK9mr32K7g7WwJam/XqWMcHZSlmwyfg6gA
	FdDrVr72Z6zUkAdqeSlT1sGeh9uzbVeK9A1ukbku+M4PhoAyYZ9Bkgu1MRpjBvadf4TcNbjvFTC
	n3cY6wgvJw4VFLj/A8kGTDsqs1Mm/i/4pOHPtP3ToSehENpBqiZeh4k7B5QC29iZOcQ4ydjOHIf
	Puubreagi5cv9lyE/q1+TJk/LhFMmOoceR6xG+m92I1CgNv0WcA/P0LZLG6hRUnN/YydH/4Yd7p
	OcgmhgTnCKBqd0AOnbkv4B9MDWXq7UzIFsOFMNmVpxF3zBVUE+4DuFuqrkqKxDpLV64XvE=
X-Received: by 2002:a5d:64e6:0:b0:45e:de0a:1773 with SMTP id ffacd0b85a97d-460677a8feemr5070104f8f.33.1781190145446;
        Thu, 11 Jun 2026 08:02:25 -0700 (PDT)
Message-ID: <83d5f566-37b7-4365-bbf0-ae28abc521a4@suse.com>
Date: Thu, 11 Jun 2026 17:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] domctl: Handle some of XEN_DOMCTL_shadow_op
 without the domctl lock
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260609151528.2426788-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781190146-42B70A53-B54B80E5/0/0
X-purgate-type: clean
X-purgate-size: 1208
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.90 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out];
	TAGGED_RCPT(0.00)[xen-devel];
	ALIAS_RESOLVED(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	URIBL_MULTI_FAIL(0.00)[suse.com:server fail,lists.xenproject.org:server fail];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC736672E5B

On 09.06.2026 17:15, Ross Lagerwall wrote:
> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -746,11 +746,15 @@ long do_paging_domctl_cont(
>      ret = xsm_domctl(XSM_OTHER, d, &op);
>      if ( !ret )
>      {
> -        if ( domctl_lock_acquire() )
> +        bool lock = !(op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
> +                      op.u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK);

I realize this has been committed already, yet I'd still like to mention
that I never really understood why expressions like this (with a negation
which can easily be avoided:

        bool lock = op.u.shadow_op.op != XEN_DOMCTL_SHADOW_OP_CLEAN &&
                    op.u.shadow_op.op != XEN_DOMCTL_SHADOW_OP_PEEK;

) would be used. Personally I consider such hampering readability. And
no, the other expression (in do_domctl()) being

        if ( op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_CLEAN ||
             op->u.shadow_op.op == XEN_DOMCTL_SHADOW_OP_PEEK )

imo doesn't justify that either: While in the patch they're close
together and hence the analogy can be easily spotted, in the ultimate
source files the two expressions are far apart.

Jan

