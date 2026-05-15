Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCUbHCC+BmqMnQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:33:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1254A056
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309597.1580638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNm6I-0004ZN-Qe; Fri, 15 May 2026 06:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309597.1580638; Fri, 15 May 2026 06:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNm6I-0004XO-O1; Fri, 15 May 2026 06:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1309597;
 Fri, 15 May 2026 06:32:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNm6I-0004XI-28
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:32:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNm6H-009baf-AX
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:32:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06be07-bab6-0a2a0a5309dd-0a2a450ab714-18
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:32:45 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06be0d-56b3-0a2a450a0019-d155dd30e4c9-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:32:45 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so986157f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:32:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b60csm7973375e9.6.2026.05.14.23.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:32:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1778826765; x=1779431565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nhUAK+YyTl1z3qYEKR9NLomFdozpuVBKk6zzjbyF/Ow=;
        b=YgnwrO0i711aA4l5mmusYiWHQFp0cZ2qpnC7R8liPlEwvE9r2XyzZXQa+WEaqd9HcW
         lcOHsgA1/V60g8CELX+fowuzwpblITsZxaO/bjagyqzvJqxntAP6XLrPgTx1L24VMHol
         0MxXfN/bIcyvwEcJdKSTZkHcGEP7AJ9MCt4hjd/jTFh1IYqaWkl/uvaAvapWOQkwaLkk
         gCOWqK6ZC2jLyCyPYTyo7bElGL6g1dYU0jwexwl91TExnz9CfDNR8u0Si1xRcSdXLl6C
         TuMngPu878CsZBg4h9+GfFQ+M1vptlMUzozTDPmcLNDlZoOrmty9UIAtn4iIJG6wEA2k
         4H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826765; x=1779431565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhUAK+YyTl1z3qYEKR9NLomFdozpuVBKk6zzjbyF/Ow=;
        b=mLeU536ejkcJz+KYMNxx+r7ef5ZedeTbwkGqZzkAtQFMCQpho/514DJIPM1ttAdALo
         pW2ghEXk5YaBBsSCD2bAew+zApgdTYnGVlbL8j1h6SW7JoC32wKJbyVSQBNjgBRL6Yce
         F2DyccJmqIOijTh2oHw3TmM7WpDdKXkhYZZsCsbaUWOEiI/HRjI7tWxQSfzeRLM+qIlh
         ZaGl1JJX6Nyhj9OrelJm+XAazw+TCl8jAHpp1U4N2PA262RPfBeqcigH3xRTOWlz3Vom
         xbQMkk3i3j8Q16vomI4jhqSidqmZzfievb7lz0jVSvTlSRlGqiChAT8G6MMpsFQcg130
         shcw==
X-Forwarded-Encrypted: i=1; AFNElJ/eWA49dKm7N1MGFYTh+xMNrDd/oE+0cQRtUc53IT5OfDEA9b7jK52lzkJ/M0AiBV+7XC5LlxIj+QY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxibN0+LX8hRo7ztXyY2Fj9sLx8b+WgbPiLOsv7l+zHriqs7ikK
	vc1POc5+VgE6Vx0mjEWQk990X28POEHe0s+PVFAjpjrTC+D6mzR59VUkJE0TgswHsA==
X-Gm-Gg: Acq92OENmwFYUI6w835KfoDAGrt2RKWAgvmN0lVTGM0zPhM1fxWIedpNao0ACDiHYs2
	GPQMG3uWbwIpRCOr0U1erOkPuh1m8rCGpIVtpbhBS/QAr53hNNNFSh68yq2j61+3+L/jt2/pZvL
	MLSNhYCXkLdtgerO4AFPbJ94+Xmb8cxIShRV+6eVtEHegMLJQWGnbvCMUh1xYq3kmnXJa+DJmAb
	3G2tZDqrBS4kJAQAU7jAqu+LNM9V6mGb3kv3m0JJBCjzfW/5y7L2gAPh3P5mChgCpu/E8jKvccK
	EKmtRalSKmF6TrJgMlorE6NmWxFJ5WFxcRHc+1bs36f9t5XROcaXq8UYkpezNmbHU6knv/5dBP6
	9lCzZml8e+57ijQ1UyLqJBaL/1nSDOjOOB942bHRYfU1iAT8iL2lF86Dho647i6qruBuR30k8XC
	gQUKPXLKcakUD90Ch0wt0yAIm6hkIrVsdcWzPkidMIdcycui+WcolAkogon5RIjDHiIop3m0VE9
	sbcZIzAc7r8FCsaKXl3r49thg==
X-Received: by 2002:a05:600c:34c7:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48fe60ecd93mr35809795e9.12.1778826764782;
        Thu, 14 May 2026 23:32:44 -0700 (PDT)
Message-ID: <1019524f-bbe0-46b3-b742-d7404732bc66@suse.com>
Date: Fri, 15 May 2026 08:32:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto/vmac: adjust for Misra C:2012 rule 17.5
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <036752dc-5333-4d01-acaf-ed450e09fe48@suse.com>
 <7ef99f0e-2847-49d8-8701-8243e4b073ed@citrix.com>
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
In-Reply-To: <7ef99f0e-2847-49d8-8701-8243e4b073ed@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778826765-7236B8B7-EFC504A4/0/0
X-purgate-type: clean
X-purgate-size: 825
X-Rspamd-Queue-Id: C9C1254A056
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 14.05.2026 20:07, Andrew Cooper wrote:
> On 13/05/2026 4:51 pm, Jan Beulich wrote:
>> ... ("The function argument corresponding to a parameter declared to have
>> an array type shall have an appropriate number of elements"). Instead of
>> casts, (ab)use unions.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The Rule 17.5 violations aren't reported against this function.

The report is against uses of aes_encryption() from this function.

>  They look to be addressed by one of your other patches.

I don't think so. That other patch is independent.

> Which rules is this addressing?  I can't locate anything referencing
> this function.

It's still very much 17.5, which the job runs also confirm (the other patch
didn't eliminate the violations here, while this patch does).

Jan

