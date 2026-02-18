Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBquM/KzlWneUAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 13:43:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC115664E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 13:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235526.1538489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsgt0-0005a2-9Q; Wed, 18 Feb 2026 12:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235526.1538489; Wed, 18 Feb 2026 12:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsgt0-0005XI-6M; Wed, 18 Feb 2026 12:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1235526;
 Wed, 18 Feb 2026 12:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsgsy-0005XC-9U
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 12:42:32 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 499158e1-0cc7-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 13:42:29 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so604531f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 04:42:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm42861886f8f.13.2026.02.18.04.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 04:42:28 -0800 (PST)
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
X-Inumbo-ID: 499158e1-0cc7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771418549; x=1772023349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QjsBI+rSXWKql+KkhJ7vyVH9gn95LudD4Z5hoDYety4=;
        b=fnJeXeymMI/sFA4nKCk2i9hHI1grO+JJ48iaqGsVwLFO1zd23GbHahYBftPN9nVAv8
         Eyw/9iRjpEWOHsyIfkrBHvS43X4sT06MVeU/6MP6o1JoKTIsC9IEZt759LrZGFNu/veG
         n7mPwScANEqnBgEYhpYZRd5S3WHHS2n7vr0GCl1p7hfSxDVTiEq7nbAPaBIZxhSk+4mC
         0GLz8R/srCbn0p95EUplN/WSqm/ZZiE8N0/8IffpYqNtMWvf4McI+clngHibgPzVbNEc
         fY82hvBKt8+tcz0X156noqDra1Ufy6ej8EMOAnYzNwzjWXrnbJ2+HvRXcJp7q2+RrV25
         0XJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771418549; x=1772023349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjsBI+rSXWKql+KkhJ7vyVH9gn95LudD4Z5hoDYety4=;
        b=SckFPwpL3yVc2PSJdCcjVcQwpZRqSCPdyPvlEprb41smT0xJEMTl3vQoSY6zq5V6CH
         p9p7XOcYTteIJLA8rwoZkmuOTJDLGq3ZOBoEUMJkhOPLkfNaChGhVGprwFdLld+jiziy
         tflueeAy2ZUpbaU6a6AhPDyv0izhQFaCDQ4GaHRM+qu2ycdqYfvrHO2kEtt+joGDnf0M
         3khRKvp8M8KsKo1wuTvXrBGzjMIlHTJ1eQShU5qRAVASAaD37nBLQf1HEiFypw51mhx6
         vrNWMSTHf0EZZ7mIcyeX3mnNwn1sZ/iuZh+1YgSJMgEQDOpo5uowPNfNv4LGHZbfF9UM
         kbIw==
X-Forwarded-Encrypted: i=1; AJvYcCURvIt0i+AUz9UFn7YQ3L/c/wO49DIRXaNl2h/kyoLoJXCD43Jwd+U1s8QBPGwrSuvDLUEGI+nykxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSNWTTAmkF5fjvPs7pYddB4fblOP85euc1NgQTNdw4+tyBFcmd
	TgHssBCLl0IpC0nqHbqzsPuFzvxu2QRqTi8ohHEEBgKnZTv/2gmii5h1OeXQnfbsWA==
X-Gm-Gg: AZuq6aLUm33K26FfN8jm0kvfJvq9s5AB/Y13zHujWs1je4jd5kuUo7XXxs8YvlDMAwW
	sdGMh8QdehMdM5oQ+uul56X+83l99iYqU1OEC5Ax2ta/KylbD7teLZHsjqLI6NeVLmdkA96XK6b
	5E6x6NDNW13RKqUOYp5OXBi6ljPvSla9KyNkJf/2N/emnbRsyjcYG+hh6pNivtFkEpcsd4R8odB
	yWLnPEWO43ZASeBFzKsCs76D9xmGjur1WnrNhiMe8cB3ATsUGJ6JqGksI20jJ61Kqa6t7As3nKK
	NIewNskYxJUm+olKDJNC+RDIyXGp6zt76LwJfssPLR5oiaBcMVK/+7eoUfMUVrGsV6CxM4iqp5k
	U0Tu9YW1MD9Sex4+LLddObGGtSmWQyC+6UHHWy/Ob3HY3tJCK4p7BGkkQIZ/TjxCt++TARaRRqJ
	OHgDLYi/B0XY+2FAruBiWmx11On9qUKqhbO0qPfoa8rlbRACmzN+8/bjrjZBG0RL/riR93at7JO
	lXd6f7wQ1Z48u4=
X-Received: by 2002:a05:6000:1448:b0:436:8f7e:a486 with SMTP id ffacd0b85a97d-43958c0338dmr3139970f8f.11.1771418549166;
        Wed, 18 Feb 2026 04:42:29 -0800 (PST)
Message-ID: <a0ff4341-2754-404c-8b42-95747e3cb6ab@suse.com>
Date: Wed, 18 Feb 2026 13:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: don't use #if in macro invocations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
 <60a1bc11-f9a6-48c3-b7d8-d007799fbe91@citrix.com>
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
In-Reply-To: <60a1bc11-f9a6-48c3-b7d8-d007799fbe91@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 35AC115664E
X-Rspamd-Action: no action

On 18.02.2026 12:30, Andrew Cooper wrote:
> On 18/02/2026 9:03 am, Jan Beulich wrote:
>> As per the standard this is UB, i.e. we're building on a defacto extension
>> in the compilers we use.
> 
> Is it a real extension, or just something that happens to work?

I was hoping I would not need to go through that large swath of gcc doc to
actually figure, because ...

>>  Misra C:2012 rule 20.6 disallows this altogether,
>> though.

... this I assumed was reason enough. Still, now that you forced me to: In
The C Preprocessor the behavior is described as intentional, but not as an
extension (section "Directives Within Macro Arguments"). Now you get to
judge whether that's a "real" extension or a "de-facto" one.

>> Use helper always-inline functions instead.
>>
>> In sh_audit_l1_table(), along with reducing the scope of "gfn", which now
>> isn't used anymore by the if() side of the conditional, also reduce the
>> scope of two other adjacent variables.
>>
>> For audit_magic() note that both which parameters are needed and what
>> their types are is attributed to AUDIT_FAIL() accessing variables which
>> aren't passed as arguments to it.
> 
> This is grammatically awkward.  IMO it would be clearer to say "For
> audit_magic() note that there are more parameters than might seem
> necessary, caused by the expectations of AUDIT_FAIL()." 

I've switched to using that, but one aspect is lost this way: I would have
preferred both gl1e and sl1e to be plain entries, not pointers to ones.

>> ---
>> Leaving even the fetching of current to the helper in
>> sh_rm_write_access_from_l1() looks tidier to me overall, albeit this means
>> the fetch will now occur once per present L1E.
> 
> This will not make a dent in the performance of the shadow code.
> 
>> Converting the #if to if() and #ifdef to if(IS_ENABLED()) wouldn't work
>> here, as identifiers are used which aren't available when the respective
>> conditions are false.
> 
> Personally, I'd have put this in the main commit message, because it's
> the justification for why out-of-line static inline's need to be used.

I was wondering, so I've moved this up.

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -395,7 +395,7 @@ static inline mfn_t cf_check sh_next_pag
>>      shadow_set_l2e(d, sl2e, new_sl2e, sl2mfn, SH_type_fl1_shadow, sh_next_page)
>>  
>>  static inline u32
>> -guest_index(void *ptr)
>> +guest_index(const void *ptr)
>>  {
>>      return (u32)((unsigned long)ptr & ~PAGE_MASK) / sizeof(guest_l1e_t);
>>  }
> 
> While fine per say, this doesn't appear to be related to the patch?

It does, the compiler told me to: type_from_gl3e() uses it, and I really
want to keep the const-s on both of its parameters.

Jan

