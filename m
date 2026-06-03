Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oy4/Nt3rH2q9sQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E44635E51
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=e5PV1Ibr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325915.1591282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhN4-0004sb-59; Wed, 03 Jun 2026 08:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325915.1591282; Wed, 03 Jun 2026 08:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhN4-0004pn-1y; Wed, 03 Jun 2026 08:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1325915;
 Wed, 03 Jun 2026 08:54:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUhN2-0004pc-VX
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:54:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhN2-006N2H-Bx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:54:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1febba-5cb7-0a2a0a5109dd-0a2a450cd138-44
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:54:40 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1febcf-62f1-0a2a450c0019-d1558034e5dc-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:54:40 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso8090485e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:54:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b79d64e8sm32676405e9.0.2026.06.03.01.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:54:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1780476879; x=1781081679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MvCg0eeCMW6aRP6vqfCPBGQJAFMK+FvjHRVTwGL3U2I=;
        b=e5PV1IbrcdPnra6WNLJKf3xXLr5zuWNUMtv7tez+jsgqWG/DovcwpEtq2Wg52JYspK
         d3lQSXqgdahaIu1RXkkquNA777VeYyiccoDHlUg8ThRJslCEmRp1UkJKC8HEJpW4AkaT
         hoYmfYGq1WYy9bu0GwHdoAvuTIIc2+q3JMIznGp/m3h+u3OUHNREbxmZa8BNeIGH2k1L
         xlTzUFsrgP1rTCkMA1ArlkCVAIrmmnd2nyCFb5UgtOmKHXvVRU1Nv8N6XYx3DT29UbO1
         6zhgC0t+BkHAj+FnLdFVmiz7EghU8BY/r99oruHItSeed/R1awednfW/xbfb08oqr4Bn
         nw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476879; x=1781081679;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvCg0eeCMW6aRP6vqfCPBGQJAFMK+FvjHRVTwGL3U2I=;
        b=dDiLmuh8jWO0Nv1xUvBEtLjgfOR0Q3uc4v+t2hVkUYehkb1Wg2lULgRVLKR9yEUxG2
         w4PKTUhuyIbU4pvPk1U7A0y/EI9yWORYB1Hosgz4tMv+OvlBur5whCGq6hcJTUduKzhu
         1778nJbgd+r2fDvBgc3swkVUiF7uXzrFgWWD2Vt+v3rYheR63uiol2AYhCnxNfswUBpk
         o+7BwIEWB8nmDVgDRF1lk4XKqOzZYVTK6j8UJ0SXkvmQRW/DM/wjpNFiGy9jNlo/o8sD
         yvMRXX2yga9lEhf449MFT62EVOH8qJl7cd83WtiqWzo+39etMc1dSQlZP1HZa/+czukl
         dIFg==
X-Forwarded-Encrypted: i=1; AFNElJ9f5XzAtTzgkPIxbvYadPi7mpJJhtTh67XFDsoRsoKZalW2YRmgrl46k72vD+GZjimefFWbtVDAMgY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3or97CCexlmLuE1JMiAfEIpJAXJ2W8JGHz0COyjQ2meptVOYQ
	VzzHMMdJIxHPB8frfiuSAPaP3PIOx6F0ZL9GYRT56SwOeAB3Zm9oeJ0BgfV2lUbwRA==
X-Gm-Gg: Acq92OEo6WGr5jXNR9rSGfjmEPZFIL5xoWNtYd+EmRgLSp5ML2gnEv1j6FYuongMtzg
	EJ7gnySzxS+QdKwqryYs2z5cUc6Yhd8Gk9GxDGS9scEpO5eVGatJ9WwDt51QII6tVMxPVd0QASL
	qa0nxzFWroEe60XN/wMD7cOCRlMoJxkWW4gqOIZnXauen7+IpX0LpTUKnxnqIV0M9klMp6mifdC
	VLU0aNQmPs3ZbdskzeJBL8ToVxcJ2S2d6TnlOVF/VvuB+UsC4HJviKKncLc0lXa+KMi01FXZNvl
	jHKi8WOzEVJY6qfBV6p9GyImaBl2NeoKlPd1IAq5nxW9OzIX7NBP+cNvKAnwfRk/lZEu+HxK9JA
	6PN3Vdg+hNp/1hRCMfBiqQp53N91PHd3NSL8J/nkSIaLXgOS79PzSN9hfCW2/7m0V4qevjt9YHi
	EvB7xugaAL9Pfse/F++DGtCFIjZ/8wz+R/44aNqlGz9mN+/6z+3DWqyoT2UZZ4MHiJppQD6OrV3
	s9EKP/2rn1T0byba6QZVWpBUA==
X-Received: by 2002:a05:600c:470a:b0:490:4f91:5519 with SMTP id 5b1f17b1804b1-490b5e51b3bmr41098265e9.18.1780476879472;
        Wed, 03 Jun 2026 01:54:39 -0700 (PDT)
Message-ID: <d17f835b-3095-4d08-b2bd-7ab69e08db45@suse.com>
Date: Wed, 3 Jun 2026 10:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-6-roger.pau@citrix.com>
 <de557b90-e5dd-468b-ac34-dcf463e95cad@suse.com>
Content-Language: en-US
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
In-Reply-To: <de557b90-e5dd-468b-ac34-dcf463e95cad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780476880-E2B74CF5-377995DB/0/0
X-purgate-type: clean
X-purgate-size: 1083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vates.tech,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 44E44635E51

On 03.06.2026 10:53, Jan Beulich wrote:
> On 01.06.2026 17:43, Roger Pau Monne wrote:
>> --- a/xen/common/numa.c
>> +++ b/xen/common/numa.c
>> @@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
>>  
>>      for ( i = 0; i < numnodes; i++ )
>>      {
>> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
>> +        /*
>> +         * Round down start address: if start is not aligned to the memnodemap
>> +         * chunk size the tail remainder might not be added.  Overlaps created
>> +         * by rounding will fall into the same NUMA region.
>> +         */
>> +        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
>> +                                       1UL << shift);
> 
> Imo this rounding would better be done ...
> 
>>          unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
>>  
>>          if ( spdx > epdx )
> 
> ... only after this check (and then perhaps also after the subsequent if()).

Oh, and: With that adjustment
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

