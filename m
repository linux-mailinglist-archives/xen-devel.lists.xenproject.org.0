Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4eZQLyN4Q2oXZAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:02:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646226E181A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 10:02:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fbnU8ho4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348458.1606227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weTQB-00041P-Rz; Tue, 30 Jun 2026 08:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348458.1606227; Tue, 30 Jun 2026 08:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weTQB-0003yo-P0; Tue, 30 Jun 2026 08:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1348458;
 Tue, 30 Jun 2026 08:02:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weTQA-0003yi-IQ
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:02:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weTQ4-003GD6-VH
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 10:02:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a437803-5cb7-0a2a0a5109dd-0a2a4505a018-4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:02:12 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a437804-3cb2-0a2a45050019-d1558031d5df-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 10:02:12 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so29611375e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 01:02:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8c66c15sm51335005e9.2.2026.06.30.01.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 01:02:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1782806532; x=1783411332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GEZnOyt2AKXn+DK3V3NAplo0he5189VlXr9TYOOq5yM=;
        b=fbnU8ho4Yb0vJfpN6u+jMX2FN6Do2VYtz36dp8px0u35TfkPyHH5b7TVKFKilOWxel
         JGLegZwvLRw2IM429BiCDUMdWjTJSBL3QQLPOTOBiwgvWwsXByOJWiGi4+CXDa37Tc3N
         VrSCiE+rYhrQ5yISoNDnQmEPVGIBK4PcM9CiLD1xs6N/GjXlmeR8PAvhLdHIzrVw+sgf
         cidAAphypWzHdIRkuCzi+SB25ZkC2GidfyBJFxXecdYDFBWiSAxbQMUj29O+mCwIEzwH
         Mo5Bp0D6XcaAsk56qeImIJ9zkcmHqHI1qBav40u4n5pdBvYRkjPuh15F4iLElc3DKv/D
         OG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782806532; x=1783411332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEZnOyt2AKXn+DK3V3NAplo0he5189VlXr9TYOOq5yM=;
        b=GnFc6QRRD7jX2WztZCzukSlr+bN79cT8fMLcVl5R91d1qJTtPon2z0vR0Z0SZ7WwIE
         a2hwi+74DWe1Twq7TPeSArvYVOKiVH2NwpIRYaQ2jSMkMCNRNC5m8iHJpLDlXf35Slk4
         vhyvUlPIVVYhuNwJ5uQJL0Dvj2MzskdCfmg6Sx/QJIS68AX+QrPXME3Wapcfaez8krk9
         tRtcULhB4gsMxy/wl9YBLSUIDjtJt9sht3Ox5K90GkuxWKfNA3i/RB9KJj9pkJ+SQW8a
         Uc3tGxWWazDb7AorJBwQczr8Zqz2/V6ZLS5Ka9+zBWHdqkEQSpKNk0uoou8JmOYLvSpj
         L+WA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/jA8WiI+bYjC1eYAumZ55qR5cmeuuE1leDs/clz4v3gin5qMC7vhHJTrtoh4F/o34oSJVwzvYjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN0dR5lwaCpQZEKNwbUU7R3D8/ZfoxWm5QIVFNdNfOfeHVq7X5
	yQfoH/fvY3msoKDc44ldYt4FJoI/gswvt1W/cfVmDhyla5TDvwPIAmbc8rJ7fScOoA==
X-Gm-Gg: AfdE7ckf3k/J4gTfc2SKG2Uwm61JUjQV7qvt3s6ZRWngqh2fOHwAkPCJgq8Xs4fXODO
	x6BYH3Dr5NvmYm4VGdBhUWIaXjTzVFxcqdeusQ+Od3vn0JzX20uOxCJQRTPhUX159RzKcRgw0v9
	8RIpIYgIkRB5nQ34MP1I1wD+4FqRORW9EHdhTsYL/ha6UQuoNKO1udive32VIqaoO/OPP9dd/se
	ZB0j/M/WiwXv2D+62m++V5W2NC+Cc/IyzpUsiWrQnursjBA4EYW+KC/Bba+VOyDDj281ctPxLRb
	mZHy4CdOVwvC8AMxSj46+JtRWnoDMdv5r+PqskoRvD8h7So/z6g9kBmbrRb0s2Td3gyL3y5hUId
	MjAS0y5gTPhpFw4sCZM2pY/NhSyh7OT8qduSS6lfE4e6eQ0sbGBo7C16A3d8Om+2yKXnILFwbPG
	dcGVBy0hkyoYCgUgtYmRscAd0e992od3LB4/7zlyPVVSewA1pBPIajGTRTpmv5LNkSHFSd+Nuvs
	wDm7lVM/4QFSBw=
X-Received: by 2002:a05:600c:3e16:b0:492:5a58:3c6a with SMTP id 5b1f17b1804b1-493b827f54cmr37521355e9.5.1782806532230;
        Tue, 30 Jun 2026 01:02:12 -0700 (PDT)
Message-ID: <ab0c89f9-8610-42f6-95ef-5e58a011e02f@suse.com>
Date: Tue, 30 Jun 2026 10:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] xen/common: Allow building ARM32 Xen with
 CONFIG_NUMA
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-9-taka@valinux.co.jp>
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
In-Reply-To: <20260619075011.377116-9-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782806532-549E22B8-729F5B0F/0/0
X-purgate-type: clean
X-purgate-size: 798
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 646226E181A

On 19.06.2026 09:49, Hirokazu Takahashi wrote:
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -439,7 +439,7 @@ static int __init allocate_cachealigned_memnodemap(void)
>      if ( !memnodemap )
>          panic("Unable to map the NUMA node map. Retry with numa=off");
>      size <<= PAGE_SHIFT;
> -    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
> +    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %"PRIpaddr" - %"PRIpaddr"\n",
>             mfn_to_maddr(mfn), mfn_to_maddr(mfn) + size);
>      memnodemapsize = size / sizeof(*memnodemap);
>  

According to [1] this looks to break the 32-bit toolstack build on x86.
tools/tests/numa/ re-uses the source file.

Jan

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/15098327812

