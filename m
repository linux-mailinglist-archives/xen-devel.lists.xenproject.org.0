Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NXdqK1vMKmqgxAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:55:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185EB672DBC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:55:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aBmubILe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335736.1597910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgoG-00052F-Uw; Thu, 11 Jun 2026 14:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335736.1597910; Thu, 11 Jun 2026 14:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgoG-000500-RW; Thu, 11 Jun 2026 14:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1335736;
 Thu, 11 Jun 2026 14:55:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgoF-0004zu-P8
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:55:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgoF-00B9F4-0V
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:55:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2acc49-e002-0a2a0a5209dd-0a2a450c9bc0-12
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:55:06 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2acc4a-62f1-0a2a450c0019-d155dd31cd22-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:55:06 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso6649379f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:55:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm78957452f8f.12.2026.06.11.07.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:55:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1781189706; x=1781794506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bPklNMEdDJVPISd4ec5Zz91FVOxy0gGVzXI4MpItx34=;
        b=aBmubILe1Dh8r6PlxZ/SzQGS6LtnBKodbvyPDsAbPtxlYze6LzYC5ugAk9ZB8cjvuK
         X0zA6dxKF1VlqEmWFn240JbXzZGOgBUnJH4fU9bMKY2lv03z+aqTeAzuAauya0d2uStK
         W7qc79fRyPS8gBnsvBBEsyAqcCA7Q/S48f6RGsZhhSOXH2qeHPgCMdwmZuoEaM6fGbxS
         Fjog1kH8BVX6bN/624BXrretSyB1heak26B8sAWPnWR6nS3Y1ilWQKSAt2swcDWq+2PF
         ZsM6yVkMNQk2MQ5tzTKiIHt3HcJi7zxTaQ8nAg1jXdggLGOqz+KKCPjuGAqEa+kZi0Cy
         mSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781189706; x=1781794506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPklNMEdDJVPISd4ec5Zz91FVOxy0gGVzXI4MpItx34=;
        b=FYzg8OhJVIIiORPlmNYyW4YR0HWr+HjnRkMOztbjM3lYji/G92qXBziG6emZwvLgTy
         yhPsHmDB/F33abinMWPCnNvWkDrjkBlzzv2wLGKLsTn/tng2n/n2EQjfMkA+pOSvhn2T
         MivCZ8r+7VxHbFw34zdxoFB6pTMdtxgSNFwpeMVPKWWmVeyIY1tFxdnTiulB7gfiU4tW
         sDkd4fy8QYhNnC5443IlnVnK7AxOpChCpDtN6ZkLji2CulGHtnhecnf0PL3GTY0gU+2R
         SL42Ha3ddH3NRwm9hAvLqd0skjbQxw9t1WRL9rEcnnNZ7xELS3aPTdYSYOAAA337RbJE
         QtFg==
X-Forwarded-Encrypted: i=1; AFNElJ8CYkOYonvf+nstQ3xnQisjlh+CN9gzrzE41mGBNmyqFvd32IcjvQU3ZxNaMqIxOCK2c2Idxo+5CV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywissh8UP/p3pwMK5A1FWRMrUBJpt9kXrN6uPPAJj6vVT9iUnFl
	22RdQJStPL5TXhIdGQKGe7JGcH5YTkMP5vqpHRK2pDevyCZOB8O6hkK6sN1ogOtQng==
X-Gm-Gg: Acq92OG1jY8IxXYGhjkN730Rb0rC/Rj08ypbvAF+xhS/XhWfMKPdERGQHBmJC/7Zs6J
	VnWr5seHxn/MzLa0asN19pUcoKwIruLmsuvqySTtBMD+erpYYfhsHpbpcsthx19f9GklWhO5iSY
	flmdA48zotawvSPR5MoSyQ1QZKUGW+2Z2s42ipIMWqOBWPZjiNWw2LSZ2+NtSahXmoBgHxQEV8p
	cZlfFCrgpnFeSRzr6lIXcTCSOhYZnkWoAMVVuiPGEHcZ/Pz9v9Zv6VBJv3TfgIhC3fKN/XDBL1g
	BmnDe/5/3m5+QgRX0GU7blROs7RdJQ7MeJflKv09lwdDLgLXCxD1eEL+zCs5+hQpJZaVqfDDstW
	67+vya1PTe6oKxZbjfnxygj1GYQUvDYmAs8YE26GU5vLWHuwrSRH8pmX+Wqk0or3PgnnKYjlccF
	YOXpGPTsu4d+bu0wf7fl5ppg/BTzXAM8MZbj4avD823rqKLACgYJ+zUtgUhpvzaHXk6rg4KXRu9
	qGpy/HfBzdbh332n0RN7SHPalm1waz+p///5cYUVSWY5MWC+dXSGs1GNQ9khHVC6HxLGsBg5GuV
	0GInuQ==
X-Received: by 2002:a05:6000:41e6:b0:45e:f228:830d with SMTP id ffacd0b85a97d-460677ce997mr4931807f8f.23.1781189706131;
        Thu, 11 Jun 2026 07:55:06 -0700 (PDT)
Message-ID: <3034d82a-f1ae-4c6c-a293-ca44b7e086fc@suse.com>
Date: Thu, 11 Jun 2026 16:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] domctl: Avoid taking domctl lock for certain ops
 used during migration
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
In-Reply-To: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1781189706-E2F72CF5-C7A0C7C8/0/0
X-purgate-type: clean
X-purgate-size: 1000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 185EB672DBC

On 09.06.2026 17:15, Ross Lagerwall wrote:
> When performing multiple migrations in parallel, the domctl lock may
> become extremely contended:
> 
> * Operations like "xl vcpu-list" were observed to take in excess of 20s
>   to execute.

Does "xl vcpu-list" involve ...

> * The "clean" shadow op may pause the domain, restart with a
>   continuation and then become blocked on the domctl lock, causing VM
>   downtime in excess of 20 seconds.
> 
> These issues can be fixed by not holding the domctl for the frequently
> called operations during migration.
> 
> Thanks
> 
> Ross Lagerwall (2):
>   domctl: Handle XEN_DOMCTL_getpageframeinfo3 without the domctl lock

... XEN_DOMCTL_getpageframeinfo3?

Jan

>   domctl: Handle some of XEN_DOMCTL_shadow_op without the domctl lock
> 
>  xen/arch/x86/domctl.c    |  4 ++++
>  xen/arch/x86/mm/paging.c |  8 ++++++--
>  xen/common/domctl.c      | 13 +++++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 


