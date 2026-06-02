Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJbCOgeqHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:01:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FD62C0F6
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324694.1590186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULw0-0002gD-W8; Tue, 02 Jun 2026 10:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324694.1590186; Tue, 02 Jun 2026 10:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULw0-0002dw-Sz; Tue, 02 Jun 2026 10:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1324694;
 Tue, 02 Jun 2026 10:01:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wULvy-0002dq-VR
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:01:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULvy-00GUZq-7i
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:01:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea9e7-2eae-0a2a0a5409dd-0a2a4501e104-14
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:01:18 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea9ed-c1f2-0a2a45010019-d155802cf0fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:01:18 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490af320e2aso12018325e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 03:01:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c127befsm100122775e9.31.2026.06.02.03.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 03:01:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1780394477; x=1780999277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8CN1AeAvG4UJAecDEpuSW9GZEkGmEK2ZjPeGd2lMrcQ=;
        b=YGvMp8W2EeywsX/DM2Y0yYLd14f8CqNCApZx68WFXIcR7MU/zOpDAndArSnvwQMJDe
         VvL0fxL5T9LPphoY8Qq6bBVRsdQyO8Q5ltphVnA+o2kE3PCYdopSH3DMOwHAnjMkgaZu
         lxcGbw/ms9TMySsCcwFLrp2uSEsiJ5oIqNzvfGg6MeudoUPU5z9JTOqEU8pIA0Qdrk+9
         L6q+InaQj+09yOM91PiFNcRPlRG6nkj1VGp/LT5REuPUFcD44TVvFDJ8Lm7qp8NFba8K
         C0HW8iKaJJyCzyMM7gcgUHqPg9DEkxHLUYZf7N0kXJrDuZd0zcMFiWMdperaTnsJLwiJ
         +Qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394477; x=1780999277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CN1AeAvG4UJAecDEpuSW9GZEkGmEK2ZjPeGd2lMrcQ=;
        b=fvoEKa65+ulvTa0UzNyLNrpkhqiJr9xqFy/0uFfLfdWG/kXICnXMM166hYe5woUIBj
         DQQnbz2IubwN6WYKorR/0qtpgCyCq1imMZ38b8eQsHmGpY7aE4kiKq+97EqWaP4+GMtC
         KbWqSlRuPsw2VTOoVYdxLU3O55NZyLeKFtSG1F6rN8Sn9Hh+7B4S+q6gBvRtWdlhiWFu
         BgiMlDd0f640Us2Plst7sK84A5J3qSVGnGnqfdDTCtAdmtmnd+W1JpVPgCg1P50VBfEO
         keyBl1Z/QYgckAFTtxUBuyZb3R9W4+J77DQwbeOycKQIzW+/hmtSIBIioZD1MYnVb5n4
         cElw==
X-Forwarded-Encrypted: i=1; AFNElJ8aAOQoAnOIYI0zNc9iJnQYcFKC/kAOyEBopoBVWcuHlWopOVyUQgfNHrscf8khYJ6vqI4K/SQlHGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz06ShCuU1W5bBZV+ddhu2m/09hoWviBMu53TL2cqXGPIZKXmKB
	w9Nvk6WZzJuzUBc1AdwV2zs5ogME13U8cQsx977hNG3N3gGSlHGo/MJFVssubVeNoQ==
X-Gm-Gg: Acq92OGhPFW768IbiM47YzefhHNHXCWD8RPgBPc9AGkw55OS/orIwmwVX2ZQPoQPuos
	oIRw5cJLIYLsTEOVsb3w6dlXASWdfmiNYU0AIsBr1kPvhwIddoeul/g4hfaosmvxO1hlO8BbvY6
	vomRpc1hQl0HxCxSbQFfaumi2wsE2zv85lRRrPyxU5oTHJBFUPjijJpij0kE+RrsGRjhWrb6ScX
	jsw23tijL0rEiA4/nk09W+TWqv3613qzHA20/Gtll3IIAa0KBLFVknDIHdFRBhJkAAK4HGXwLON
	cqflPIErkGeLh6KeUpUDlddZPZyg0qukJVtpuaRilO4+Wf71vdI6OtuL4i7SJWUykmpu68PtIQ7
	ejdXkKYm9cwf9XAZnng+aHTRI4S8kNCdOYKZIhRwcd5jjUHQX4fd0M2Eg4SzUUk1fiawwmH+kwa
	qyvV3lPn/3/bqEBWYkiNr4S1mU4z0rmbtX+OtHwjEW+jD5WD4oVHjNZq0sYGIN2DwNK8kH50p22
	lanmx+zbr6T2puicYuMWOMlRg==
X-Received: by 2002:a05:600c:1d29:b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-490a6469e5dmr70803815e9.6.1780394477608;
        Tue, 02 Jun 2026 03:01:17 -0700 (PDT)
Message-ID: <fe9e3f66-5f69-43e2-b367-af8a8e152c41@suse.com>
Date: Tue, 2 Jun 2026 12:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] public/xen.h: Update mmu_update comment
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260528075539.10209-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260528075539.10209-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1780394478-AE342FF4-822D1C39/0/0
X-purgate-type: clean
X-purgate-size: 459
X-Rspamd-Queue-Id: 634FD62C0F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 28.05.2026 09:55, Frediano Ziglio wrote:
> Frediano Ziglio (2):
>   public/xen.h: Update page table layout comments
>   public/xen.h: Update comment for mmu_update hypercall
> 
>  xen/include/public/xen.h | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Considering these are (doc) bugs, I think I'm going to shovel the patches
in without asking for a release ack.

Jan

