Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RZPRE09US2riPQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 09:07:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259F70D4E8
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 09:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GI0OBi1j;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355060.1609859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgdPv-0007lw-AN; Mon, 06 Jul 2026 07:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355060.1609859; Mon, 06 Jul 2026 07:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgdPv-0007jF-7S; Mon, 06 Jul 2026 07:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1355060;
 Mon, 06 Jul 2026 07:06:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgdPu-0007j9-CT
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 07:06:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgdPs-002EKk-Tv
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:06:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4b540c-e002-0a2a0a5209dd-0a2a45029d48-10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:06:56 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4b5410-5a27-0a2a45020019-d155dd35f19a-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:06:56 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-475881b9a4bso2265699f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 00:06:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9b4d850dsm23116278f8f.0.2026.07.06.00.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 00:06:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1783321616; x=1783926416; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixgw4sga4KdnrbZMauOznZXsvGKJMRN7WaUBDWbAfwY=;
        b=GI0OBi1jg5xYPpgI7ogz1kjHQSOfKuLH56AwW23jJFAz3Tq8GjK2fewLZgpB19U6nj
         RBF8XIMnMHYoclevsOkv5M/R29RsMwscrfmNqZQbqfXy6dEKC6oP12MS7yED1ByulxBs
         gCoGdXJsa48kNFF77s/ivB3OANr6WeexO/dyMpB+Bsq+q/fWnFAJshlgnvc+hgoNIeIi
         sVfrbnNuSm6fMvwToGc4hEx8gYRKobRwqzhNxUyqYpJtfzDe9lwYQuCoFsZxTUpjpVWK
         k8AZcGE7zbjKuhEW9Sr5N72Dl2G1ia2oZBbBqHKSaTJHaOt1pVrqfJ/ZMy3NgckvM4hr
         alYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321616; x=1783926416;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixgw4sga4KdnrbZMauOznZXsvGKJMRN7WaUBDWbAfwY=;
        b=Ml9PXB+5VdHMhbV5u3d6IU4/Jiip5t52gqtJ8qte6q+wMylQXBJ5ntjf7zFIyQSJ9W
         LIQk0gddjq/oBeu8BmWDUbfvkyGSVkMe7hqujipnfuL4lFp/S0yrTlydev1YrqR/zLIO
         x/Qzc266FfcOT7IlQvTk8iUptKo/SxY1TGi6OpvtdmMmR67SheIXFQvR5h11jBJyHQiT
         yRAENgpGM75dQltlmsvBxbLZxoGpLSP+XPQ4jpkhu5SaUWsVCvod6VXO3+hSsp3MWv9r
         vl5t9tvKsAWH9oTWSyaKuYcO7lKXi5QpPH7i5gnYVkasSP15BKD7+Wca7OkuGc+Wt3nz
         f54g==
X-Forwarded-Encrypted: i=1; AHgh+RrKMrvzMdb81Yxic6ZSLNzxPV0hZuudemGn5wNKQ0JIs8rAgtZRQxtgYxMsZl4Bql9zwAcZBuUvXhw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yykfv/xuysDnrZJGwKivBVEhuev9szgFUUcnNT9PV0KNfFGOYpY
	Dm4fQzRwxEvHQpbV8Qh3LJ7P+iMrEKjUqWxbnzGseqTz2ZLV0MmH2FSTUWXN5fFl4Q==
X-Gm-Gg: AfdE7cn3j/EcTLFOPMwNZvIGdt0w+sIYgsH4qYN+2FDJFxC6JEeZclKBDHhiwKQQALc
	tZoP0kxwWI30FFF9YZgHWYDQJSA9H1Evi9Kn+VCtiXB5uRgvqHrAuLoMEX8/Zvb/KFXxGkTSNjc
	iacHxRKDD/2VBLNgcGzdhraC8Qzhw2TNIPW6JLkq8VudmxSxsvNPHlHyyCjl+pCU3RZyj/AkQ19
	GejfUOHtXnffS02d4LUpePKK0TON19ZvfJdvTexyQnkhPpEdmaI/VRYOieVxy64o4ox2w8QTxV8
	fCDgn9dVcDZ3A8NupQWptKFMTCLLIyVLvEnzZy9oM7YOExMbLuVEJdo3jjbTw3ueh28FOMUicz/
	cA8TrmDswWNd8GO+vEAgufx+0gelqAX131wLn/AC5sZ8t22UrcM5LhFmXwyv5Zltm/RvOzUk+7N
	LY+n6e+lm5fhk06RQ1jHf9A1pnzDvT4ebWaCuVJFai4NPIPpoZsLdKgS00l2qR2l5D2AeWkDCi8
	8yi
X-Received: by 2002:adf:f004:0:b0:473:6e8d:7f3 with SMTP id ffacd0b85a97d-47aab57d2acmr6745984f8f.1.1783321616053;
        Mon, 06 Jul 2026 00:06:56 -0700 (PDT)
Message-ID: <083d91f7-af98-473c-89d2-363e69248b0b@suse.com>
Date: Mon, 6 Jul 2026 09:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] x86/cpu-policy: set up host policy earlier
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
 <1783085859.8631fc262581453bbf619ec5b2062170.19f2833024000080a8@vates.tech>
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
In-Reply-To: <1783085859.8631fc262581453bbf619ec5b2062170.19f2833024000080a8@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783321616-771127C5-BD4AC79B/0/0
X-purgate-type: clean
X-purgate-size: 1749
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,invisiblethingslab.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9259F70D4E8

On 03.07.2026 15:37, Teddy Astie wrote:
> Le 03/07/2026 à 08:28, Jan Beulich a écrit :
>> --- a/xen/arch/x86/include/asm/cpu-policy.h
>> +++ b/xen/arch/x86/include/asm/cpu-policy.h
>> @@ -30,4 +30,10 @@ void recalculate_cpuid_policy(struct dom
>>    */
>>   void calculate_raw_cpu_policy(void);
>>   
>> +/*
>> + * Collect the host CPU policy.  Called after collecting enough CPUID output,
>> + * and again after all feature overrides have been put in place.
>> + */
>> +void calculate_host_cpu_policy(void);
>> +
>>   #endif /* X86_CPU_POLICY_H */
>>
> 
> That looks quite confusing.
> 
> As I understand it, (ideally) host CPU policy (which I suppose, contains 
> "non synthetic" cpu featureset) is about the CPUID info that Xen is 
> allowed to see and rely on, while "synthetic CPU capabilities" is more 
> about Xen decisions.

I'm not sure what the long term plans are here. Likely synthetic bits need
to remain separate from the policy, yes. Yet I don't see how synthetic bits
matter here - x86_cpu_featureset_to_policy() doesn't consume any of the
synthetic parts (those covered by X86_NR_SYNTH and X86_NR_BUG).

> If "cpu featureset info" and "host cpu policy" can get out of sync, then 
> recalculating host cpu policy each time we make a modification of the 
> cpu featureset sounds like a bad idea, and we probably should try to not 
> end up in this situation in the first place by not having host CPU 
> policy and featureset competing on what hardware feature Xen should rely on.

Well, that'll require a lot of work, as effectively to avoid this the
duplication needs to go away. Hence adjusting the policy when the featureset
changes is (imo) the least bad option for the time being.

Jan

