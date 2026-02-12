Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNQ9N9PFjWnT6gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 13:21:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758312D666
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 13:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228879.1534964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVh8-0004tR-VP; Thu, 12 Feb 2026 12:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228879.1534964; Thu, 12 Feb 2026 12:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVh8-0004rI-Sd; Thu, 12 Feb 2026 12:21:18 +0000
Received: by outflank-mailman (input) for mailman id 1228879;
 Thu, 12 Feb 2026 12:21:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqVh8-0004rC-3j
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 12:21:18 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 537fcf23-080d-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 13:21:15 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso1382415f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 04:21:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfda71sm12320198f8f.18.2026.02.12.04.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 04:21:14 -0800 (PST)
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
X-Inumbo-ID: 537fcf23-080d-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770898875; x=1771503675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zkg5vJhcnBz0LY6S63OSzCHQNrKJ7chF4k9jV5aFnG0=;
        b=ZVZddvdEv/bDf6Y/9dVBQhLiHmPTp1OjVVpVZ7wgS7SHP5LUXklYxkAmgcbLdO0uib
         9tcLbOCXCu/qlsb9TGRYcbwfOF53T6Jag810m7WDwx8fdqoCDLk4421SXlQ6aW4qST1H
         NFeD15HF70+r9VZfhMxQfF8uzRA3t99eDwLznKTayeJ+sjO+UhV6otZ6I4GzcFQhSZx6
         XFdrKklnP9sQ3bmPJim898vZenmjuX8gquC2IcNvRKqg2PAYZqmF5gjMD4wxwmegGjfN
         Os8TjrD0W2xEQK5P4ZYNsNpPwKbSEEGskfW/vRVkLmTqLCBg/oiudCiQx5gg2JsLxK4a
         Tq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770898875; x=1771503675;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkg5vJhcnBz0LY6S63OSzCHQNrKJ7chF4k9jV5aFnG0=;
        b=dZAWonjRSQg1J7qibjmz+N4Vj5AbvRw6I71SF6Pgg+n5xHhiYKSmv923PqGOEvB2x9
         0Vtk2KU6M9t5XwnF1NSptGbYBuj8ihWRDX2kceIT/CMgmwp/8CrYfT2MSidfooa3YTGm
         hSinhIOaYn62ehYaVh02VRtvfWODwza4XUfhvMZviJ5fEp4uE0XdR7tdYQbSEieNrkla
         GkZKjv7kONa/WzZHrAN40q0JxtJnWzRtcqR2BRzm4Voy6wIJ83ZUpknD3cGST0SECf8f
         X+Ul/sawKpseaTeKRnYtE70z5u08ArnRCDnrqv/Lnh3oG8LLFTxv3fO+Z/1THwetY2bg
         A2/g==
X-Forwarded-Encrypted: i=1; AJvYcCWjVC/eh56rsAmevydK0y2wWyUn2oH/Di5whOPZpnKR8c/DfWiojTuPMo+RKXo5JM5MnSrY3y7HvVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIv6l7jipfZu7ktxZX5arkpULdYPPcquBm1JNzmmiSrAdhKutJ
	s75xha1bPIPdKbfQmljcPMa8W+T8MZRWpqwn/BLyp7yQ/pMYn0+93GUCcfDIX+V9Pw==
X-Gm-Gg: AZuq6aLDiopTApHhPKE+Rf19oxIXvV6BNiFj05nrQen7UoXV5OgKvG4bKX1UyAm7b/c
	J6+uhiwAw53Jld9XyzWCzxOedREy4bm7K9Dg1xMkIReNxAOyV4O8WtrRMzqzxy4CymIvFgdZXTs
	QBWxF+qXr5MVb7Tetii5PSkO/Az5tm3luqMAPje35kpKUu3a2yuylUjadxpkJ+ysTTqwMYmKiq4
	3k9p8/jk0bht9QdYTXyDwEWVFev8DD5E3epfYZip4Pq0Er2z/KmiDaylSQ4o1mhFfhoLT6LFd0i
	/qGPWYSYFmQ20hD8q0498gFZJbegmarf5uh1VspmT2TSO0MF27kSYBP5h9nG2SqVQmEiaK1g8jX
	VbcEqiwekjkI2OJHbfIngS5eZG7LpWqAGpoL9K2On5n2YHjdY0z3qpxr0aKL6rDNzdDDqs7d647
	Ebkvsy3YU6OPhe5cVbwb75egghD7Hf9klLs0GiZ+19awZ4FWkjjjsUvsEovUAwzPpIO2X8WseNG
	4JNUZ3uf8MwYaA=
X-Received: by 2002:a05:6000:420d:b0:437:6c0c:346c with SMTP id ffacd0b85a97d-4378e73b090mr4290471f8f.28.1770898874863;
        Thu, 12 Feb 2026 04:21:14 -0800 (PST)
Message-ID: <38288209-7344-4982-872f-01684bbecb94@suse.com>
Date: Thu, 12 Feb 2026 13:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] x86/mcheck: Migrate vendor checks to use
 cpu_vendor()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-12-alejandro.garciavallejo@amd.com>
 <18795ddc-c558-4a51-9b61-717e96bf5150@suse.com>
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
In-Reply-To: <18795ddc-c558-4a51-9b61-717e96bf5150@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4758312D666
X-Rspamd-Action: no action

On 12.02.2026 13:02, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> @@ -862,7 +861,7 @@ static void x86_mcinfo_apei_save(
>>      memset(&m, 0, sizeof(struct mce));
>>  
>>      m.cpu = mc_global->mc_coreid;
>> -    m.cpuvendor = boot_cpu_data.x86_vendor;
>> +    m.cpuvendor = cpu_vendor();
>>      m.cpuid = cpuid_eax(1);
>>      m.socketid = mc_global->mc_socketid;
>>      m.apicid = mc_global->mc_apicid;
>> @@ -964,7 +963,7 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
>>                          &xcp->mc_ncores_active, &xcp->mc_nthreads);
>>      xcp->mc_cpuid_level = c->cpuid_level;
>>      xcp->mc_family = c->x86;
>> -    xcp->mc_vendor = c->x86_vendor;
>> +    xcp->mc_vendor = cpu_vendor();
>>      xcp->mc_model = c->x86_model;
>>      xcp->mc_step = c->x86_mask;
>>      xcp->mc_cache_size = c->x86_cache_size;
> 
> What we do internally is one thing. But what we report to the outside shouldn't
> be inaccurate, imo.

There may be an underlying issue here: For the former case, struct mce is an
entirely private definition, having in particular:

    uint8_t  cpuvendor;        /* cpu vendor as encoded in system.h */

which pretty clearly was inherited from Linux, and hence was broken when we
disconnected our X86_VENDOR_* values from Linux'es (in 4.9).

For the latter case, xen_mc_logical_cpu_t is part of the Xen ABI, and hence
it got screwed not only as per above, but another time when we converted
X86_VENDOR_* values from enumeration-like to bitfield-like (in 4.13).

Question of course is - if there were any consumers, they may have followed
our breaking of things. So it's hard to tell whether fixing might do more
bad than good. (I'll make a fix nevertheless, just in case).

Jan

