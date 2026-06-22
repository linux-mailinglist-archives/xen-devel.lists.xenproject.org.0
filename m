Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X8YsDTodOWo6nAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:32:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD86AF18C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XTIUUkdC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343655.1602901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbcs7-0007X0-5N; Mon, 22 Jun 2026 11:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343655.1602901; Mon, 22 Jun 2026 11:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbcs7-0007UE-2h; Mon, 22 Jun 2026 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 1343655;
 Mon, 22 Jun 2026 11:31:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbcs5-0007U8-DX
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:31:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbcs4-007Zd7-LC
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:31:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a391d00-5cb7-0a2a0a5109dd-0a2a45058464-34
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:31:20 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a391d08-ef3d-0a2a45050019-d1558032b1b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:31:20 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso34897245e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 04:31:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944fbbdsm230383495e9.12.2026.06.22.04.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 04:31:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1782127880; x=1782732680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YEtde28m6TgS/wf8VYChM89lkdHfmNxREwvNSMc62Hc=;
        b=XTIUUkdCtLUc7rQC6tH13eUr0nxKwMyyksVyoHgqQl1s4UvpUt5CnGAvl7ADTk72eF
         SLiPcsxlXCC03GR23YSAL0sjyEikOhRvMIfEOW13pvZL9lOGWOiaQBXrrWVYVhG8QpOr
         L8UL3oL9HeGPAPNQkTb58siszZafzXlbHFlMckcoFBjqK/9DMFXMPeZ/Qv8mjcM/KjSh
         L2Wkl9EcrJbImkoNG4n6iixYhIqBKVkALWx46bhuDIr3sY8wMdzWKYO95OOWS2VTSWRo
         rKfReU2FfiRzc0AiPLpH6/vKQNdobfr65zsbVhNncUtqRm7Be6sZteLG8n/MP8vmKWFH
         SPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127880; x=1782732680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEtde28m6TgS/wf8VYChM89lkdHfmNxREwvNSMc62Hc=;
        b=sy1B6vsgTr+ojEZgdxduSHxDlLVAemDI2zCQ8dyD/+Y2KbL33uO2HaPlij+V9fwUtx
         DgyFlEMssXZ8hWAzrM7XAZyaZtZsu2QVMyn8ToqCQTW7xFsTgMs7eBu8TvFzMBcJK4Yj
         ta1C3qj4eKOaXQsKgZF3GDUzirrm+P9QiFtX6B0X+RK049eLZNYvdYjhzeJyag3O9KrN
         xSwvBuCP8kc22g0fJ7TKEPszSsj7F/5vkpBPrUZc0t/kKumynD32qSnTUnfcfTzyb15k
         PL6CWQ41dBI/t+Vf/8/F3VekmXHs6BeOm2r5ZqjhlKqbgiqsIZ5PLhEGKA4fo91INiWl
         zMtw==
X-Forwarded-Encrypted: i=1; AFNElJ9RCxVleTzOYcJioAlXx/1INpd9XGrUdLpeW0J3jrW/Ep4Ejz7wPmiyuUOs2Qw+Gbl/7h//0seO8UY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaADzG0s3o4UFvAw1W2MnBe1Oly6plLlwz+Oh8wFK+R/FFCTce
	cb4ExFdfP6V6m8ZaZCY4X7LrvpRWRQA0uP1Fs7umv/71i5QCaeaT1n20+LjfgJPCfQ==
X-Gm-Gg: AfdE7cmwH3ANiRD76O674ykffsPnsq7Jcw5EWen3Gc+t6Dc1R7kXBPRMUngN7UW2G+M
	OvCyfF9ApDJ6ZyXgUTJp4kBlxXk7+dZ9TTCNfMMkDcEawKeOYQJcTnnz/l/vV1JvqyJ+4qO1yDF
	9WXlzVYqq9kwGndIG5Zz6Op2z0o/bV26QqYn9kRPTHkLpw79fJDwiV3Kv4jQWDTmmpqfPfsVqlv
	Z8bdvWQdpipboG+GZ34V0Dcxxn0Dq8BXdsgiE7aWOXpWxqXtyse2/TilyKXfcfNUozasUF/yXcx
	eXjWrQ1p0jqKPufLNUeXsslooT0W6jxq9C4aBMn69PSSO0Eg79Q/fSiahg9MnCaI6o1inAdlzEb
	maAbPqXooqqo6RLeWAtjsFXNK944wWiPLHaIYjnPCJCXsmj4jsBpEJ5OUYhbwznOtNWDXJq6amk
	4h+aGkG3HpPbwBXCkQnLvn9Y5sDr9Rb/rzmxHIggsIfhqNrAW6N9IGns4tqtgMPV8ljG8DQzZ8X
	DbF
X-Received: by 2002:a05:600c:630d:b0:492:46c3:c7dc with SMTP id 5b1f17b1804b1-4924908f450mr147657835e9.14.1782127879854;
        Mon, 22 Jun 2026 04:31:19 -0700 (PDT)
Message-ID: <78189a1e-3465-4bbf-a2d4-53c2754f43f3@suse.com>
Date: Mon, 22 Jun 2026 13:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] vtd: Rewrite igd device check in
 acpi_parse_dev_scope()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794558.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@vates.tech>
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
In-Reply-To: <1781794558.8631fc262581453bbf619ec5b2062170.19edb3b524c000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782127880-F7DD3127-F06EB016/0/0
X-purgate-type: clean
X-purgate-size: 733
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86CD86AF18C

On 18.06.2026 16:50, Teddy Astie wrote:
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -389,7 +389,7 @@ static int __init acpi_parse_dev_scope(
>                                      PCI_CLASS_DEVICE + 1) != 0x03
>                                      /* PCI_BASE_CLASS_DISPLAY */ )
>                      gfx_only = false;
> -                else if ( !seg && !dev_sbdf.bus && path->dev == 2 && !path->fn )
> +                else if ( dev_sbdf.sbdf == PCI_SBDF(0, 0, 2, 0).sbdf )
>                      igd_drhd_address = drhd->address;
>              }

Just like we have mfn_eq() and gfn_eq(), should we perhaps also have a (typesafe)
sbdf_eq() for use e.g. here?

Jan

