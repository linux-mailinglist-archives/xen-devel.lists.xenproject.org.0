Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O07EEG9BmqMnQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:29:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1984549FF6
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 08:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309588.1580629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNm2h-0002kY-CQ; Fri, 15 May 2026 06:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309588.1580629; Fri, 15 May 2026 06:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNm2h-0002iV-9o; Fri, 15 May 2026 06:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1309588;
 Fri, 15 May 2026 06:29:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNm2f-0002iP-A5
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNm2e-00GsWT-MN
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:29:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06bd1c-2eae-0a2a0a5409dd-0a2a4508d95e-44
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:29:00 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06bd2c-63b5-0a2a45080019-d1558034adb6-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:29:00 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso59914825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:29:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe57944c1sm46121035e9.7.2026.05.14.23.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:28:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1778826540; x=1779431340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M5XCzQF9XEa/h3T9jxj3vH1bGhcJUXcxttoji8bGPFc=;
        b=StJzXZ1DpvMrrIWx7wp3GfoO+5khoVJq3YPOlO3Ges7JI7RE1FRdfUiVTBnIsayA3y
         ZZXBQ5ONrJhNaMLPpTpA2xcoNyzInSajuNiDgmnAtbMTVPSj4zEK5gxIXnTVNnr+YSUj
         QVAUqCORaBDZR2XzHe3eFYlXCFE34mJaTJUq5nIm+GId5udYrsIZc2Bjdr2oVTYP1kRA
         y6oinVEbV8vrzs8givY2E3ISVNaa/6oHFcZuEDeEv+gPlU3ic6M5xbQ4ZYYtAZw+Nk36
         yZzASms3vzk+IGKqi9mFZKw8Ya6Z41ci5ZWjpR0kJwIqId8OQMlyvIm4IywR7ElIhh7n
         NGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826540; x=1779431340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5XCzQF9XEa/h3T9jxj3vH1bGhcJUXcxttoji8bGPFc=;
        b=bwS4ELglpeFOprQPWfl+Kor1wqYVKZAwbJyI+13+ixQbgiHZxXPTT4wgFkfVmGIsG9
         GI6UBugZPuXijgsAeIdiIt6kqWsjaSOJfVPzAnOYZIc76Rk7fi3rNIRIJuVDB2kv4bt0
         KCd3q8Nea4gPeKO8UYoMZfsQK4v6U01arXAvGTPDRxt4qSQ0EKLjNusO7cN5hDz3m33I
         vg3FEYo9W19Uz/9nWpOcEOaatT1b5st2IHFNCelQQzPauqHlG2HZ0I5GrX/BxneK7z/y
         fvMUP6kq2bO9gbx4ZJqdduPKb6q/DwcAxtf8oj8LRELvspT75lBR5h+PfMxgk5dDkS/M
         Kv7Q==
X-Gm-Message-State: AOJu0Yye0cvoQj89hpahZDNreuSX/AKPlyNn2kXddniLFpfF4YfRrJx+
	7jZHeJY/fcd+rPrByY/LDlYD2aCKU4UK80DtYkkSrC+Kfvwi7ZLRZqX8XfnIWXuckA==
X-Gm-Gg: Acq92OHAm3bNen1vlnY0wij6yONugoGt5ZjOpemQe/hyoDElvDtPkhfnM8CSwnGVifV
	/Qn/1VOjF2nRJSi21q0wWAKKoYTGTjRT9Y3eDYYHW41buSX6tCGgQeh6WkiEGmOxh80kdxFEBYa
	grUEojmMoJQ/MgLP0LlI1P5FmxUoKNz/UVaFNEbGPU/E1qU2QP3izuk9Cw8sE/PUgEkeMjrQUwQ
	juA8Dy03Le0IPieGRAQ7ySbHnbloLQbHA14GflAZxeSeV+aZw6vKTk+iAaUdrWx+UEfxFpW0S3N
	WAHKwC5ZTWGZ3Sk+qk5lBSX/Yzg7vtoHtJ6yWU2dpFOZW6081Sms+65Rb6isaiVmxXWBUeXkYnd
	ZUM8hoIHPhVpyt4Fk6CVPGJoue9FMIZXHxDIj0qVUoeB2w6OQPg3mkPDSxLuxhe/rvbuZ7GTU8R
	UWqWGKySZmRw4gOngNVPg/P7YrZCMU5EF9MEo7xg5kH+cmrJO7kDvbJd6DiNIIYfmqkPJsZ+XRe
	V1J1hLsutFBLEI=
X-Received: by 2002:a05:600c:4e4e:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48fe5fd4747mr34284205e9.6.1778826540133;
        Thu, 14 May 2026 23:29:00 -0700 (PDT)
Message-ID: <5dc8ae7f-3aed-4e25-b2b8-6bb0feb7f61a@suse.com>
Date: Fri, 15 May 2026 08:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
 <36723a55f4465ab1a99041b8bb0575c4@bugseng.com>
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
In-Reply-To: <36723a55f4465ab1a99041b8bb0575c4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1778826540-B6975DB1-097DE2A3/0/0
X-purgate-type: clean
X-purgate-size: 1174
X-Rspamd-Queue-Id: A1984549FF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 22:47, Nicola Vetrini wrote:
> On 2026-05-13 16:03, Jan Beulich wrote:
>> ... ("Conversions shall not be performed between a pointer to an
>> incomplete type and any other type"): Add an intermediate cat to void 
>> *.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
>> (covering more than just this)
>>
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
>>
>>  #if BITS_PER_LONG == 64
>>
>> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
>> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
> 
> Notwithstanding the comment from Andrew, I think a comment here could be 
> nice to explain what it going on, otherwise the double cast looks quite 
> odd.

I've added

/* Two layers of casting to cover Misra C:2012 rule 11.2. */

> Unrelated: why not contextually marking this rule as clean to prevent 
> regressions?

Isn't this rule (and the others my patches were targeting) marked as clean
already, hence why the allcode job fails?

Jan

