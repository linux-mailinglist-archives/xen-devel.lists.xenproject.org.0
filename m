Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rx0SEp79HmrpbwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:58:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3363006A
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:58:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=O8WaJzGH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325229.1590718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURUi-0007rD-E3; Tue, 02 Jun 2026 15:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325229.1590718; Tue, 02 Jun 2026 15:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURUi-0007pW-BQ; Tue, 02 Jun 2026 15:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1325229;
 Tue, 02 Jun 2026 15:57:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wURUg-0007pP-So
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:57:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wURUf-004FkR-7g
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:57:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1efd37-bab6-0a2a0a5309dd-0a2a450682de-36
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:57:29 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1efd68-7371-0a2a45060019-d1558031e57f-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:57:28 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso2260005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:57:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e20a76sm71446015e9.4.2026.06.02.08.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:57:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1780415848; x=1781020648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cMx8yEFH6S2n7qOs9P64MXib2huJ3gAjAjLaDYQUGNw=;
        b=O8WaJzGH9VUlYn/IkHtsvY0qd//BkkTv7JqHPzhQsAG7zDnH+6JlZz3HvTvWji5H3I
         uhvy22RH/QH8yhRgiQ9owP9Ud+5gl2IFWEjFJ9z1VV2tFbUjKbDcCUvP+UInBp1B0Pt8
         A2So3tY0/6jSeu4o/+x6ijmstGvB9AMn8LrvEt8FemI1ElEZj+fjuPMNV52jTK+8fkTR
         Zd7nmLucbxg+O4mNy/G7SEEmALjsDaaLZpHLsYvQVWnXSc5zCtJOZVgI0X3yfOLMKfws
         J2Icmi6KDN0VY3yHShMX8rPTx0NRf0dm3KXpsmJlGpEEV6Y8CybGbv3uHTERr1E/kW02
         5DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780415848; x=1781020648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMx8yEFH6S2n7qOs9P64MXib2huJ3gAjAjLaDYQUGNw=;
        b=bjMw3p3JfW9zg+xrwRf/OfFED66f9D1dNYLFIBgYvvjEAo7Z3VIWSslOKCpLQ2lR+V
         KcEsKtfw8VNWV7hjwWtHDB6ri0T891/8CnkfykNVhtZy7RstvOrBRA+GGLi72jHHIldd
         JGzJYLdoGhUxCYNbBj6Y7zA8ZR/MdxItslSskQp+22wmyiw/oxaBUpCF2S9Nq6TL9Jdq
         arYn9wXdmWEZ6ECy5A7QNyfAmKCu3WophFzF+7xebsgKsVvxUpLh752fnPpHH8nx4wHv
         eLGlII3Db+pEy8/CHZMEHsodbY0p8DJ/LgcAvbdmusgJpKFEO/FkIDRx2K2+T0SvEGvB
         hY2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UlXynZj1OLjibRpCjZqekFeMjQ2xT2fa/mHl2acNVs4+mrUElUFRFbpF9hS0Jf4rr9NhTdnuV9CE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJrbrLJtMJeUid/BbUQIXAu+Ecw57nU6/S8oj3lsZHbCaD9wTw
	nR6khD/ckgvEF8j18LXhHiXaXhmlY5j6lLg8I6Gnxje8QcJLlN5ozqzR6SpFJ7a4bg==
X-Gm-Gg: Acq92OGzznwIJmGzkL/qm3kcOD/g39PJrqKcUIIysh/mlorEAlkmE+jo8ABvcr6lK/f
	z829KIuDvPX5XQ+mO0iWfYPOP3TJO4K8GBHh77a68NT/7V69brBMM+102fuQvXk/YywHb8uXymI
	M/tXKmdWxjgpjYRgtd+olAIGOXHQ+sISBolBawOLWBD+LnOFZT6l1eV4uPjSEKrHvaCPNIFxKRI
	JnpvSJ7SwLahU9jhLWNnfMqo5qqEYEQnOp7mLWJCA+cgPPEveDw4b7n18qTcntnajUMc0xtU2+X
	bz7IDw129fgf5XWf1D85F389iIVXptmDM6uHhWI9r3yd7sETDvM8LRzrE0MHIw9iOmTzzewQHCI
	cImu6UtKqWkWtOVs08N2LeKwXMpme0j5CwX0Pscxy4Rl8u9thV/yR0+FzmD9ne4Wo6wLPm7JlBn
	ziNvUrs6ngoW4ElZgWustkLqkM29nTQYAzxC+mgQd5MG4OQQ7OhsXtph3RJTr8AONMEsTXVcGyQ
	aBwT34KtucBzeN0dAUV+Ug5Eg==
X-Received: by 2002:a05:600c:348c:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490b506a773mr6650275e9.8.1780415848398;
        Tue, 02 Jun 2026 08:57:28 -0700 (PDT)
Message-ID: <528ca4ba-7b3d-4cff-b05a-5b9307f5604a@suse.com>
Date: Tue, 2 Jun 2026 17:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: reset PFN_ORDER for offlined buddy heads
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779980244.git.bernhard.kaindl@citrix.com>
 <9ffee13184b4499218fc80544bd3ee1a06aa2898.1779980244.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <9ffee13184b4499218fc80544bd3ee1a06aa2898.1779980244.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780415849-8CC78D75-59BD2085/0/0
X-purgate-type: clean
X-purgate-size: 1161
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
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
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
X-Rspamd-Queue-Id: 95D3363006A

On 28.05.2026 16:58, Bernhard Kaindl wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1485,6 +1485,13 @@ static int reserve_offlined_page(struct page_info *head)
>          ASSERT(node_avail_pages[node] > 0);
>          node_avail_pages[node]--;
>  
> +        /*
> +         * All offlined pages are standalone pages: If this offlined page was
> +         * the head of a higher-order buddy, we need to reset its order to 0:
> +         */
> +        if ( cur_head == head && head_order != 0 )
> +            PFN_ORDER(cur_head) = 0;
> +
>          page_list_add_tail(cur_head,
>                             test_bit(_PGC_broken, &cur_head->count_info) ?
>                             &page_broken_list : &page_offlined_list);

Again, with this separated from and moved ahead of the new test:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
I'd suggest to drop the rhs of the && though: There's nothing wrong with storing
0 when the field already is 0. I actually wonder whether the if() is needed at
all. Unconditionally storing 0 is going to make the code more robust against
future changes elsewhere.

Jan

