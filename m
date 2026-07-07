Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 315bDi+jTGrdnQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:56:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2FF71830C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:56:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DWDUbVyz;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355959.1610627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzjH-0000qs-Bg; Tue, 07 Jul 2026 06:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355959.1610627; Tue, 07 Jul 2026 06:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzjH-0000p1-8f; Tue, 07 Jul 2026 06:56:27 +0000
Received: by outflank-mailman (input) for mailman id 1355959;
 Tue, 07 Jul 2026 06:56:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgzjF-0000ov-TZ
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 06:56:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgzjF-00AuRj-90
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:56:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ca309-bab6-0a2a0a5309dd-0a2a4502b596-36
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:56:25 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ca318-5a27-0a2a45020019-d155dd2ac5a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:56:25 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47640541585so2328003f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 23:56:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d7801sm31810515f8f.16.2026.07.06.23.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 23:56:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1783407384; x=1784012184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RyYW1LbO/KwLt+HdMhzGpf50WP7aQjl3/dikEuIxNHI=;
        b=DWDUbVyzP+kxKhvUQ4LLVLBb+KtPQUUcFm5IplNx0XjnjLVI9axWlmrcTX7Ubx96nS
         oO/71v8mPjzZcWwf+MqlQyIfuKhhQ+MtNvdNWcsG+NMx/YNjf+g7Y4d+ktbtc8qe7PQj
         yh2tiKQ0clftDGH8Nl520EWKgr62eIJt5pTqYrHwSow9TSjED1lPiNormroi5pjdN27I
         MTrhkoQojr3TVBit7wRD0ACPJbBl4qqOL+0zRfSBIsgim+yarWDKUsVw0+WJzXpl400T
         Y8f882ZjIjQ2ZpSIgoL0pq37KLQqHY2j/CnMaB49AxMafX6h6Cobz57p+0HgwKRcRnS1
         JAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407384; x=1784012184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyYW1LbO/KwLt+HdMhzGpf50WP7aQjl3/dikEuIxNHI=;
        b=BS4j19CiRxV3/oYtKEcBP9PpkRdaGBP727E3HxRbNru0Y8yxZB6DBu9DW0Yh99//XD
         TMo76sP3dewKHMwI9UsxzmquH9EoZIviKYKZMmsx2ksUrMT2GOjw9ICkeu7kZxNkpSSZ
         ZQH+nSxCWo2/iKaUhI8fMkDD2CqiXQ59POKy2KadYKHg1z9sqWPeVb0xsY0YLnqAVLAz
         NUi24EsD3Yf2Ffe3NiNpBBVC8TvqBcQYtx48n3WoSvoCkiL2HNZWO+tRS8XJQ3qKqo7f
         3OGhCzhiup69claHV+z3yanfhq/aadFlMDmHd81nOo9zHQKdyxjT5EtPMCqIdpnFTWul
         9wIw==
X-Forwarded-Encrypted: i=1; AHgh+RpWkk3LsK/3BBT/EzRAZ2HILX+35evzmTjQeK1VLBi1JwyO6AngjRhPTNObv4FXX5LhFwJ8l5DM+8g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyC+iBMd/32jjGa8Mlam0YKiJGGgtQTcw78OShlg3lPQyZMgdX
	p7FEOxeat1nMwvLAGRT/SU/TaB2xn04C8XbwJC/8QpkEs4dtGkvTmoBLEU3Q2Bvb0w==
X-Gm-Gg: AfdE7cnZcqWySr0YlwU2YVOrCi2kdJlEcbSMYWJjvm+Lj3i2TNWYnMpHpDoQkTTah8f
	wie9wCpsKRJG66V82582cCShkaBrq7TlI732UjDnWrcevP3WQpvQfmk/s1fWlJbahiVf+DT9gPJ
	THhyVv7qzS6mo0+2rcdTnxl6x1Qwwa/s/N4Y+k5cxi616iVrwf5qUYGL6qQh0RS3cDo93/Ir+DZ
	AriWkMwNvcK5V33czHRHfGFFGssHf1Y1tFegDrJOXvAq4j/uUVKiaQxFye5ctgqQ8fhKq+XX7og
	5KJikt1wf6tbxTNZYexyCe65wNnoiuiVSkIlaoCVxp7V4rIwAEYnW9+eLmcigaR4P43INYUfa3I
	v597dsfygGayEd1ofiLDRlzaUCXx18F38n/ffAkmshSTj3xNzoeSMNTDGuC5AjVySxj5DHlSra8
	8RJyxFjHzS/uB9mjobUXuD0irj59VIPhTr6zj3g77RHYMa3EM2PZJ9eDaa/LTbhtwR51pl8PB0X
	v3I
X-Received: by 2002:adf:e004:0:10b0:47d:e678:1dd with SMTP id ffacd0b85a97d-47de6780407mr2844420f8f.28.1783407384629;
        Mon, 06 Jul 2026 23:56:24 -0700 (PDT)
Message-ID: <a8b83f78-94ea-4bf9-abca-924513e250aa@suse.com>
Date: Tue, 7 Jul 2026 08:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/hvm: Use PUSH_AND_CLEAR_GPRS in preference to
 SAVE_ALL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260706153415.1264750-1-andrew.cooper3@citrix.com>
 <20260706153415.1264750-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260706153415.1264750-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783407385-560EF7C5-816B7917/0/0
X-purgate-type: clean
X-purgate-size: 448
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,citrix.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 8D2FF71830C

On 06.07.2026 17:34, Andrew Cooper wrote:
> SAVE_ALL hides a CLD instruction which is not needed anywhere here.
> 
>  * VMX VMExit always clears flags.  VMX VMentry failure never switched away
>    from the host flags, so they're still good.
>  * SVM VMRUN always saves and restores the host flags.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


