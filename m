Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /XDrGarrH2qrsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D452635E2D
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TWr46iqx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325893.1591245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhLm-00033F-TB; Wed, 03 Jun 2026 08:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325893.1591245; Wed, 03 Jun 2026 08:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhLm-00031X-QP; Wed, 03 Jun 2026 08:53:22 +0000
Received: by outflank-mailman (input) for mailman id 1325893;
 Wed, 03 Jun 2026 08:53:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUhLl-00031R-3O
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:53:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhLk-006MmE-Fo
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:53:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1feb74-e002-0a2a0a5209dd-0a2a4506aefe-30
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:20 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1feb80-7371-0a2a45060019-d155802cd4fa-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:20 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so16238125e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:53:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2eadefsm6125947f8f.11.2026.06.03.01.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:53:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1780476800; x=1781081600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fHIXIQVcRjHRmkbPY6aMuQuPGnuY6bysYXmT3BcesdE=;
        b=TWr46iqx6hHeIn9yJGViT3RZcMUdcbCCg2RGz6ZkilElS2hTiH5DmWzDAks8029b+K
         bXKn+mu8TC47op632o6MhOgtSBOIvfFabEYWi4ruYZu/NvZBcnOKAXSszoF6q2WRI06K
         IWlzylKKwvBErt6QOlvZ4CUuJWa0ZdtcZMnuQd5hSw3rtn5gQu6TfzIRzfK1WWO8NVRV
         EqoaSquENWAq2KDH8TRBRO6v7DM8vuQjdz1wpRjIySHKMryo7vwgZiG2XrrR3jUapNWa
         vz8O2a6Iv0JCL/alzKfYTVDHCV4UacEtLW7K2wsVoBrQN/UjQBRmanlmLiDx+lLhHZCz
         jLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476800; x=1781081600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHIXIQVcRjHRmkbPY6aMuQuPGnuY6bysYXmT3BcesdE=;
        b=cZ9w2T2QGLgioknY5HGag9PXTNBb6HTMwj/DE7/8SVVc6BJ9LYwPmXyQVSXIyTOktP
         j3eLoWaQ1lrTqn6UGhY76x1TCxfqSnoOPhcvjty72l3dlLr7xA4WbaO1L+20l2ITZ5/f
         KJs6c+vQMN0dXkVlbayXY5RssSzYh+z9u48dJQJf2smCr/PvfcCuumwFGQaaY3oKdlWy
         JkA9YGEfHA8mr3vH+xOrvvUkzYyoxRzvHzM0Otd5PuS6Sx1otOMGAEYi2sFsTWaygCOY
         RIn6dlfyUIOkCB4Yi3OZ5b46s+4lvFdM208tWYT5r6P2KYqGNeCn+hgyS9QKhg4PDDO4
         MRYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hQ1aiKglfTFwZ0dAo889tyeIx5V75qq0666nC0x19GPkO2DBdcJNRYoGroXC0ZKPT6FCcxhm2VLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygfavF5pumBhlHKRTKwFl/dcj4a/BEW52NAORl70OG0x3NTJne
	vw9G8Rs2MzOCPpHGXuDvHbo7cfrGLjsjUX0b3syTmzaF5L58i7jbZSuFwmERNt98xw==
X-Gm-Gg: Acq92OE2Oiv2SNsRUzFyTLj4WCdOsQxLqU8hMC+fXTBe47Zr7c9a1d2qqOg7c0tOcPf
	QAf6vDyEWoH5s3/L3g3g6Ytvm1g3EpbFHgkG2jth8dlOSQi0xWvEohRHd9bpdlTaQQNa2bPEoBO
	xJcPGRmrgfvUhpd42IH0tjHBdiZdLg3bGJO4zVIhhgZTkm28o4rosBd7hJx6Vf9P59EC1ryC2By
	X3UOZyw45uTeq1c0DzYRNpdvP6kOyE7yYuIhE1r2PEmZhnwbyKnPXna6ugA3EusaSLIKuATefZ1
	4o2iVazf3PvHXIeo3xePbm98++8n5KIg/x+Nan2Otr6Hnt6BAoA07pB9ei7NR5Axwsr0RZqMhPa
	94/Q4KFUder46EAP7UsgCJohSHWbXwtnh2m/yUH6SHV3iWlVmg9wf+8zRtOSjaUYiINB6+Dr/ol
	tPNXlxZ5X3bJzr6F7046PYEiZXY+q968itRCizcxIfQEXvPEG/MIqspzGtRuRvFU229yt3RyZas
	y0o2YccJY52GVX+Ac0R/kMiw3j7Zm10qZhH
X-Received: by 2002:a05:600c:354a:b0:490:44eb:c1ec with SMTP id 5b1f17b1804b1-490b5fe14f5mr37880985e9.27.1780476799800;
        Wed, 03 Jun 2026 01:53:19 -0700 (PDT)
Message-ID: <de557b90-e5dd-468b-ac34-dcf463e95cad@suse.com>
Date: Wed, 3 Jun 2026 10:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-6-roger.pau@citrix.com>
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
In-Reply-To: <20260601154332.30797-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780476800-8D584D75-CCD474C9/0/0
X-purgate-type: clean
X-purgate-size: 934
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vates.tech,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D452635E2D

On 01.06.2026 17:43, Roger Pau Monne wrote:
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
>  
>      for ( i = 0; i < numnodes; i++ )
>      {
> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
> +        /*
> +         * Round down start address: if start is not aligned to the memnodemap
> +         * chunk size the tail remainder might not be added.  Overlaps created
> +         * by rounding will fall into the same NUMA region.
> +         */
> +        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
> +                                       1UL << shift);

Imo this rounding would better be done ...

>          unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
>  
>          if ( spdx > epdx )

... only after this check (and then perhaps also after the subsequent if()).

Jan

