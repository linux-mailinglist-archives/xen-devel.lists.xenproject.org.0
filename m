Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBOCAnt+rmlfFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 09:02:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515C235342
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 09:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249156.1546661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzVYY-0003R3-Gy; Mon, 09 Mar 2026 08:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249156.1546661; Mon, 09 Mar 2026 08:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzVYY-0003Ok-DL; Mon, 09 Mar 2026 08:01:38 +0000
Received: by outflank-mailman (input) for mailman id 1249156;
 Mon, 09 Mar 2026 08:01:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TKtW=BJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzVYW-0003Oc-Vy
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 08:01:36 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e47894-1b8e-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 09:01:34 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-483487335c2so94070185e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 01:01:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853a310b8fsm86052215e9.11.2026.03.09.01.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 01:01:33 -0700 (PDT)
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
X-Inumbo-ID: 30e47894-1b8e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773043294; x=1773648094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZTM1bGALy2lCngF9Ee8Ep5UL3DY9PWcQzrczS1SlxE=;
        b=W/MyENh1TJVN9CjnXw9LXI8ec935qBVNix04SHyT/LjGJBJThsqP3Y4GPVVCsA/VhL
         Zj2M1Z6sTz+QYIs4KIZVc/Ff68/rJg7X3TBBfu4AGqHpaMF6+RjvClmuCll4uHrftHXe
         02SckAEla6VbQBnra+pS+Bdgoz6TmAfViM/y/L5TgOvMlCUCgSj1afMzjA9SQ5IzPpCS
         sGQXSg3241RBmsXKjogX1AK6qz3+r+6285RLzyPscWFs/az2ulvDNZA3R5fkWkJDCNZi
         ezqqTMH4w7cR8Tne9KC2MWTQR4NmAp0rU8x1hC8l58EU4uUgRlb85Ffq4DCK76QEXmQ+
         1bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043294; x=1773648094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZTM1bGALy2lCngF9Ee8Ep5UL3DY9PWcQzrczS1SlxE=;
        b=FH8VCdrxrNwNuNOZ5BmYnz4MxtoaZkE8Uy60kYV/ftij5y9VjMA0EOjbFxwFOAV66E
         0pNDJRu3UoagR663S1HQL2m7fBwgjzWwnXdX46yvEQmGMzKpkew2arbTr+E/PorYBtM8
         MxgnIPP70V0zc+5PdONdyLw5PSAEfnD7fwU2N2yrAOP0tWjcGxU8SxUMO5+7TRiyXfv6
         4hA43bvIvdY0YkRltaE80ihk+gmrvXZ9HYkwsOeWsslHRQhFNO6lqiFGKwuNJy4b6587
         aZHsO1o24cTW6V9nigEVFs2PHU00mf86vYjpPTyP441gsy6zoWiFIB9RqelwQrZ+mhsC
         ELhw==
X-Gm-Message-State: AOJu0YzKNtx/uCIGlAqm9ONVef35Cjx5fZpqORVBV9iou5fjoBICmCaX
	sW+huxNvgEGc3dXj4OZAEPJCyliD725UTJA0LCnz5piYxKyXuqsLG3mxjTAUhGAUhw==
X-Gm-Gg: ATEYQzwmGMw7kjZJ7Y4f/PCVvLMd91cp/H79HSSKiuqODYL8WbMSz7w4fS3/kHHY34/
	5jBZpqEoQwJq+Wu3Kg9COJfEfXHiOhWZl8kDJGIRUcMYuuWss5u80XB50dBPH2Cm6uBCLkMjwgd
	/oBW1wEhDVd5mnAhya61UuemlfqTSRZaRdrJNfJTAEYdhSNbmM0nQqgnrkIogZb74DsFpcAlbTD
	iuO2kWZCPSbLSvLag8y0zMo2iuqSMAHAHQfXLkG/M8XJH6aXcsj4HOgtiLclZQylx7X+rEqZ5FI
	RjombZtdpWqsL+eNgWSu7XFRHZGYRuD/0cxAygDTsaVCY8mABBYuhWkHlPEHrd/JG9BKtYP6lid
	CkGenjfysAEus9L7IaVE5iUbK3eTODSgHQP14IdQiZwJLtVEpEGbsGo+ikyX4rK8R97vv/vpwO1
	k+Vs03JkpU5ffHZj8ef3ESYzx4vAf8yMnszEYVeMhYFEPIy/RCBMNSeCO9N7QRlleRIB2I+1v/u
	BnhYqwy/B6gWOC2UXvoa1EVYg==
X-Received: by 2002:a05:600c:81c8:b0:485:3812:36f6 with SMTP id 5b1f17b1804b1-48538123973mr63720905e9.21.1773043293760;
        Mon, 09 Mar 2026 01:01:33 -0700 (PDT)
Message-ID: <8b7e5cf6-e259-46a1-9af9-8b75242d9c7c@suse.com>
Date: Mon, 9 Mar 2026 09:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] core-parking: shrink and relocate core_parking_cpunum[]
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <af03f611-ef38-49d0-ac7b-4bad39db46c1@suse.com>
 <aarik2Zlgxc6-Ffp@macbook.local>
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
In-Reply-To: <aarik2Zlgxc6-Ffp@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5515C235342
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06.03.2026 15:20, Roger Pau Monné wrote:
> On Wed, Nov 12, 2025 at 04:38:13PM +0100, Jan Beulich wrote:
>> This NR_CPUS-dimensioned array is likely unused on most installations.
>> Therefore it is especially wasteful for it to consume more space than
>> really needed. Use the smallest possible type.
>>
>> Further the array having all fields set to -1 is actually useless. Nothing
>> relies on it, and core_parking_remove() doesn't restore the sentinel for
>> vacated slots. Drop the initializers, moving the array to .bss.
>>
>> Finally take the opportunity and update an adjacent variable's type, where
>> a fixed-width type was pretty clearly inappropriate to use.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I assume there is a reason this is acting (mostly) as a LIFO. Else a
>> simple cpumask_t would suffice.
>>
>> An alternative would be to use the new BRK allocator, at least for NR_CPUS
>> above a certain threshold.
> 
> Can't we just allocate this memory using xvzalloc_array()?  If we do
> care about it being too big certainly allocating only when needed, and
> based on the number of possible CPUs on the system would be much
> better than playing games with the array type?

Hmm, yes, how did it not occur to me to dynamically allocate the array?
It can't be used ahead of core_parking_init(). (Not shrinking the array
element type will still be a little wasteful, but perhaps that's
acceptable to keep the code simple.)

Jan

