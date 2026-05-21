Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NzhBAKqDmr6AwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 08:45:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E559F998
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 08:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314821.1584791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPx9P-0000Q5-46; Thu, 21 May 2026 06:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314821.1584791; Thu, 21 May 2026 06:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPx9P-0000OD-0o; Thu, 21 May 2026 06:44:59 +0000
Received: by outflank-mailman (input) for mailman id 1314821;
 Thu, 21 May 2026 06:44:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPx9N-0000O7-T2
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 06:44:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPx9M-009teX-Nf
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 08:44:56 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ea9d4-2eae-0a2a0a5409dd-0a2a450c945a-28
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:44:56 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ea9e8-62f1-0a2a450c0019-d1558034e1c1-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:44:56 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso55951755e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:44:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490387d16basm4312945e9.35.2026.05.20.23.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 23:44:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1779345896; x=1779950696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IxAi5nkJaxI+gIswepAgokuD+M7PHwZBEoGb7t9APro=;
        b=J7TWjKCa6Oy4qBSlyueh3Mg5os+Ptzv9SKdzyjt1nv7c5ybcgGFh3faCEEY88KQ1eb
         Sl3j3NE7GaRcBYNvd0/K8ljExMSKhhci4Xf0e0+hOJ8TOYLZE0imcnndCjY3R3TVkyv8
         sulwJYJTfd9WucT6th7SI9uWD9pN9g2XMAHzBR/SzDXU6/wgrsVPK4wsewsEiXZ2sP0v
         dEk1vaTT5WKDwvWu7MwwTiOb55gYRFJsTdtTosf8TGCa6ZEKg+guDa4KVECKz5rHMDd6
         F+gu9RKCXyQIVP9OWOO1BayICpTPbO2UjNwtjMKBBJG2EHJUcbN8QfNfNS0yNzHGh0BW
         Hk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345896; x=1779950696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxAi5nkJaxI+gIswepAgokuD+M7PHwZBEoGb7t9APro=;
        b=HvT2jTNmc/JwKvN68gwjBJkEkq98SO2Hcg/C3ihSXIAPRhjVO9mpxSlxUIQRaCkmri
         1WI14iCPBe3vDxhNEujJ7K1GQm0jXfqKEmG+Olf+UxMx5RVP0619hTfk+NKVGKtpTUva
         fjDg/VUd4j9SX3wUt23ZZWTE4HD+Vr2lWa1ev+iMPY0Pfzz20/4RR+XRKPVpktgnWnqZ
         NtRfe6G8eNl0TkM6cqMtpFWZSzuB95s/7eRG/mOmLBjznhd4DtD9HZhwB0P2XcfIhrwF
         UoMzsbN0rKwmgdF8H7E0aOfAGyWyqUXSTVX+2qiPxTP8LKgno7gwYVowG5Yja/4y+IwD
         L5fg==
X-Forwarded-Encrypted: i=1; AFNElJ/gwjJx4dCjtFIc1C87ubVlHwFpNvtjKi+ep8v2xyZMrYCmqCLSBHegzs3gWU6Tfh14qhqmSMrKbFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiEb6KHy8Bz7PjW9KpxrFH1/dCaz1mRLQ8zIjbXQUHHn5X0Ukn
	L5FjI7NGPykVBqoTKamXfIwf8NRxrZ6KkqQAcFO3h3h0Fk6ULDQWsuFijt9m+WSyag==
X-Gm-Gg: Acq92OGnr1ib1Ms7U00EF8fvbVtJu95udBMgqnYEi/I8KCetlUNXkKI2gJwl5i5LF49
	bALoeI+837bY2fTG5xFVkra0nPfzlWKqFxfAZN+bOXIq7tbUSsNJbhoCNTzgIjT97Uy4/8XWoxB
	ehFcrPz+pr1mBpEMgAq61WToVKr6kDF3A1Njt1scEXPvwQMnSjn9mdk8RK5AUO9YJq/dyUE+QCJ
	cXHnOSRpM1vuuzC6IN6dXtBJT7Wl3BF9QqiRsDdDR5Htqf4daAzBF3GtstupOd4viRWcPUeByeI
	kzqSzVnVtw4XLY4VAR5rwlTCeATn+55PEAJYJVmzoMdnPs78RKwRnVKQmJsJn13jf60rvv+mAcg
	Z60sEvoZQxzMfuoxZNq5/WaJmZT5obL8d3uzkPhqYV1QXsn7oSAapsFxW/oG96s06U/97hfV8YO
	f4i8DnWE7eMSi7exPQmAx/1133gnT705fqFXa9M9HSMNFQWyBMpvXhIFtOlcmIxvSGxxe/uJeOi
	uOMH1teYN190uM4IDdGBU+MYA==
X-Received: by 2002:a05:600c:4f04:b0:48f:d612:3c6e with SMTP id 5b1f17b1804b1-4903602cb3emr17372345e9.2.1779345896057;
        Wed, 20 May 2026 23:44:56 -0700 (PDT)
Message-ID: <799796e6-901d-47a4-b097-e97bf65a130a@suse.com>
Date: Thu, 21 May 2026 08:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>
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
In-Reply-To: <93cbe99f-a75b-4837-be6b-d6621d9f4d6d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779345896-E397DCF5-26C85A25/0/0
X-purgate-type: clean
X-purgate-size: 1042
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 696E559F998
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 18:27, Andrew Cooper wrote:
> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>> __{put,get}_guest returns -EFAULT on access faults which causes
>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>> incorrect.
>>
>> Fix the computation by relying on copy_{from,to}_guest_pv which
>> reports the number of remaining bytes instead of a negative errno,
>> such that we can compute the offset properly.
>>
>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Given it was __*_guest() before, I think we can use the
> __copy_*_guest_pv() variants.
> 
> I can fix on commit if you're happy?  Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>
> 
> Jan, this wants committing ahead of your MISRA change, as it needs
> backporting.

It would be slightly easier in that order, but adjusting the backport
wouldn't be overly difficult if the Misra change went in first. Yet
that's still lacking an ack anyway.

Jan

