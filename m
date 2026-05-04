Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DjKCsZh+GlJtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:07:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64C4BAC13
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299609.1574153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpGc-00009h-7U; Mon, 04 May 2026 09:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299609.1574153; Mon, 04 May 2026 09:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpGc-00007T-4a; Mon, 04 May 2026 09:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1299609;
 Mon, 04 May 2026 09:07:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJpGa-00007N-3d
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 09:07:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJpGZ-0056Pn-BI
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:07:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f861b5-e002-0a2a0a5209dd-0a2a4508a590-8
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:07:03 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f861b7-63b5-0a2a45080019-d155802dc17f-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:07:03 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso29743715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 02:07:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fee8751sm124105855e9.9.2026.05.04.02.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 02:07:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1777885623; x=1778490423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IDNdKbz4/mVge7LIb2ZjTaQ0/+HfE9dBeBLZ+RTYE78=;
        b=CUIBGH3Ybw4/9vekcjcrzMHlQQXz/5DXnbUqnuJAvvUOuPAYfX3SexUQg/IXEsHD+I
         mvoqOiWXjaZ8MnsCNd/W0Qha8NgzRKjRrkVAsf1E467dWgtXwjw96egEXyHG8OPkW8sZ
         +BWx3hQuZy6lteJhtIoaXVOQ+hSt8eYB3vVpgOTW+VL6vptOUPXD6Tl3Fh8yS/EN+rgy
         /OI8+ooAWRfRMElUtTcG7kKMI2AwtIKOzGqsqbLn5v7KyWXNqmH4dnq7vAMjJ/ncIq6Y
         A71oMsSa9UNC9daFAPtI/lgbp28DoRPvrzsKMVgpV8+Gd3cr1v5iHKuwIRTxHkNdI7Sn
         g+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885623; x=1778490423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDNdKbz4/mVge7LIb2ZjTaQ0/+HfE9dBeBLZ+RTYE78=;
        b=ilEemSL+qt9w7zHmSN2MR8MKIFv7BAhxzgQtZ+reMijdbs8EFF0s4tYwIAu1AmHyu8
         1qNHQhTsHNu11lppODd66Npoz2vIWLte4MhaqZ1v3er/ax2WvIqeJcwlj3wwVpz+OPR9
         o907M59XfmFm9K+wF36NO10HDFbBapdkP13uwEv/x4azQkZK9kE+c0GozEqf+h8L2raz
         7A/Mkk6Mk/RQky7h0H+HoBPNC2CnZdbjUEKsvM0DQ4kqUQ5S/HFj/hXtdTGdNNX7+osZ
         SqNUoKp90skXq8Y0IR37Rddmbh8wGn6calBoYP5tJwkTeffHl2N0WXOz0fAf1dwqh1IQ
         SSGA==
X-Gm-Message-State: AOJu0Yzv1gQHUey3hhexCshSrMgLGzqXUaTqgHTaxzTItdrc03rcDX0Z
	dd95vq0PzXyUSiDsKCbGuFm0unSKBIn0Ck5K7ui2bv6z6PupLh03fU6Gt62B2bRM/JEuQRXhdJn
	E5Mk=
X-Gm-Gg: AeBDieuh76QnzSle/Llrc/ukTyK5eFFILt9piDqPR84+JwdHiZLGTAhazIVJUESdwlo
	8vRutcB5GzcBUWkacgSlPrd7fU30f421yPDB1Ncaj0LLoc0xm7tM8ok/6wLZ/AQPcinFOwurfZy
	NtqAvT7vDWDnxFaiTlzDI67O1cUwkJLapDbdxFiuZrgrg37xExr8ht+ihsYj9RQAST+djYC7Dtv
	XnKJIe0ceQVULq/45frYVZdgCcJKDbHzbbf0iIyEkl9S7brQzVIZZSMo0CpyAD/Vpzk+Yuu7+0W
	CT2iC51OQPWL5Fw4JnBIeqAK6y+O9j59yqUx4usDsC59Nt8juB/DPVPX0LJFNjUp3sY8UWSJy8M
	SLLdjIUC0Kc+vfOREAUiiZsL37Kms1DocVLCF2QSczeNOaMjPm8MLrGpnGLqbhN98xVndcUwuP5
	W5wVNsTn1qSFFHaNbBuXDdL/viVRn+FIkvvlEp9q8RuPabzZby1dLQjcyCCxVJ59iwhOrKgKobU
	zyeVJNYnAxmj6ilQReoo3/Dpg==
X-Received: by 2002:a05:600c:a302:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48a98638a65mr100195835e9.8.1777885622564;
        Mon, 04 May 2026 02:07:02 -0700 (PDT)
Message-ID: <64d45064-de32-47f3-b4b8-809b3cc4cc16@suse.com>
Date: Mon, 4 May 2026 11:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] x86/mwait-idle: clean up BYT/CHT auto demotion
 disable
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <b906c3d5-5256-4ddf-9186-b52d8280e2ec@suse.com>
 <aeuCcSSBJ4H9UwOB@macbook.local>
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
In-Reply-To: <aeuCcSSBJ4H9UwOB@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777885623-C3171DB1-EA58A83C/0/0
X-purgate-type: clean
X-purgate-size: 914
X-Rspamd-Queue-Id: 8A64C4BAC13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 24.04.2026 16:47, Roger Pau Monné wrote:
> On Thu, Mar 12, 2026 at 05:54:56PM +0100, Jan Beulich wrote:
>> @@ -1700,12 +1694,24 @@ static void mwait_idle_cpu_tweak(unsigne
>>  	case C1E_PROMOTION_PRESERVE:
>>  		break;
>>  	}
>> +
>> +	/* Pkg-scope MSRs on 1-socket-only systems need writing only once. */
>> +	if (!bsp)
>> +		return;
>> +
>> +	switch (boot_cpu_data.vfm) {
>> +	case INTEL_ATOM_SILVERMONT:
>> +	case INTEL_ATOM_AIRMONT:
>> +		byt_cht_auto_demotion_disable();
>> +		break;
>> +	}
>>  }
>>  
>>  static int cf_check mwait_idle_cpu_init(
>>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>>  {
>>  	unsigned int cpu = (unsigned long)hcpu, cstate;
>> +	static bool first;
> 
> I think you want to init first = true here, so that after the first
> call to mwait_idle_cpu_tweak() it gets set to false for future calls?

Ouch, yes, definitely.

Jan

