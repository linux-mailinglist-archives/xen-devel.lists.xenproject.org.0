Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /W7LECxF/Gn9NgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:54:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4764E4478
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302230.1576207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtYT-0005oj-Ei; Thu, 07 May 2026 07:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302230.1576207; Thu, 07 May 2026 07:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtYT-0005lw-Bk; Thu, 07 May 2026 07:53:57 +0000
Received: by outflank-mailman (input) for mailman id 1302230;
 Thu, 07 May 2026 07:53:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKtYS-0005lq-7R
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 07:53:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKtYR-00C5dA-KV
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:53:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc4503-2eae-0a2a0a5409dd-0a2a4509884c-40
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:53:55 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc4513-2497-0a2a45090019-d1558034d92d-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:53:55 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso4473525e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 00:53:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53110aebsm53428625e9.3.2026.05.07.00.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 00:53:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1778140435; x=1778745235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8cpiZsq5QxQBhxrwredKlRb+311uA3g17xBJM/KVw7Y=;
        b=gdnVFLAlJSx3t5AuZGSe0dcxN4kONMC1xZk+NzR584DuvMwtPslY6+daN+plflKgU7
         OA4H4vtXwdc5PX6vUWS1RIZqxif+jFxcxcrx0104JetKbMpw/vwNiJJxxou/xSWB2a/z
         ZswW6UxYJMn6cfOem1IB59zgfFwMzk4VJ2GwY/73Ip3EeotOieHNPVdCjc18pZPLEd2i
         d8LqbnGGm+HPkQcf6fInqOLVoVb70/D0gmC/ud9nRZIQdLqEkpMbU7/W4UGJ/Dq0G8np
         Otmc3oWdh8RipxvYp6X3XRQJnUwoFvlNPdNzzUMY9+C3lsRdbe54Zycer2XJyuNv8UfR
         27bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140435; x=1778745235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cpiZsq5QxQBhxrwredKlRb+311uA3g17xBJM/KVw7Y=;
        b=pqJd+h/igTCbDjhh9AJp9aLpjlOyqxJEPJcp8I+hz//vv96y/5q/xIHKRyT+stA3aE
         irbFY39f83s31Og7YA3LqKkgCevxSORKJb4ZAdFkKFx4+iLfjbSR+5lD4G1IKQMEERrE
         iJbYnYmjvl3KojgBMEx/DnusRYNKJ6tVqfj1TFjFnrU5tmlUXI25jona7D3f5JvOrBAV
         sxYCs0W1Zm1YIVEC4AaQRcVn2k6eOKr2bYgUrI6FueRxxv4fBNfvhz7D9Z9SKrmvUc3P
         SR7ncTQQNxBk3CENbLa5uSuDlg505rnJJ3wjimRDWObEDs7z+5b1OSsgiuKEgNZsJ1n2
         rp/w==
X-Forwarded-Encrypted: i=1; AFNElJ8vmETF9LVlOqJouNrDhCM1PkwaUaSJLzYZIrHU3ygHHNjQkGAVX39pV5XHyugfm711u5GbjPes2CE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt5QBKRF6lqJ7VtbFoa2wYJfvREueRUNS29r0xNvAH/kyqWhqd
	pjsckoFiruJpOWtqLrzrJJSugBrhkopenL/uHmv6nj7EghA9bcf/Tr9Cd9lkI8rBmA==
X-Gm-Gg: AeBDiev/oyh7kdrtqg6miKaExVUEmt8FzqdPm78aTzmknSSvDWIze9A2fD/iMVgIiGk
	MCEjm4SE+7r4L6yx+vywsb7TsRcTds5sNnCn3f3W7bXG+K8CViybE2epJzTm1R58zKZnvATrISO
	ikIEtejUT7LeMT9P3l/Ulbzuy8RvTZJtI3FVVwpUzj7rl7sjzFiwwsIxLNJcY7Ca4ytAJOJcYbw
	oHf+QBZ2stQZgASUhdkHL4kLYPAItK9XGvTj7B8NpJNUZCUcHRz9fn7+mbwTu3P5Gm4oHdoN7kZ
	NznuZspyb5jD3BC1QU4FV4VF0C+/Q5PtjdTVtL92WQfs3eKsDD9Dk5fr8gNbKV2cDjYPDse4g5p
	AuxCIMHX7qEa4Uu0aDm1TXHrmEIx7iMJcucQo6Al0aTMfRMhzlsyoN9VZdeJJLGDjux6ZVC7gW4
	vSdC4KKfzbpuIrtIsVZt/j5NEKH3Qb7hYdxST7+mSLPqRG+IxHhRVSymw17IgfL3sLUu2bpxDN1
	92XBRZgc9B5pwM79nqqWIkcGL7jbhOWu786
X-Received: by 2002:a05:600c:8b8b:b0:489:1aed:1658 with SMTP id 5b1f17b1804b1-48e51f3fd03mr109878535e9.23.1778140435044;
        Thu, 07 May 2026 00:53:55 -0700 (PDT)
Message-ID: <231c1198-c267-459b-88ce-2b29d1625596@suse.com>
Date: Thu, 7 May 2026 09:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools/xenstored: remove permissions related to
 dead domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260429120619.1013440-1-jgross@suse.com>
 <20260429120619.1013440-5-jgross@suse.com>
 <e9cfb86e-704d-4a5d-bc59-ad05d07bf69a@amd.com>
 <199b54b5-8571-4a18-bba6-226a5a94ecc9@suse.com>
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
In-Reply-To: <199b54b5-8571-4a18-bba6-226a5a94ecc9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778140435-88970A53-30E5C3FF/0/0
X-purgate-type: clean
X-purgate-size: 935
X-Rspamd-Queue-Id: 9D4764E4478
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 09:43, Jürgen Groß wrote:
> On 29.04.26 18:41, Jason Andryuk wrote:
>> On 2026-04-29 08:06, Juergen Gross wrote:
>>> Wit unprivileged domains now capable to use the @releaseDomain watch,
>>
>> s/Wit/With/ again.
>>
>> Regards,
>> Jason
>>
>>> there is no reason not to remove any node permissions which relate to
>>> a domain which has been removed.
>>>
>>> This resolves a complex scenario where a new domain could inherit the
>>> permissions of an old one with the same domid.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Can this simple fix be done while committing, or should I send V3?

Afaic - of course it can be. Aiui the series wasn't committed (and can't
be) because patch 1 still needs a REST maintainer ack. As per earlier
comments throughout the history of the DOMID_ANY patch, I'm hesitant to
offer it.

Jan

