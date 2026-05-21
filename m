Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB5cF7yhDmpCAwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 08:10:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B225C59F4EA
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 08:10:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314795.1584763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPwaQ-0002NC-V2; Thu, 21 May 2026 06:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314795.1584763; Thu, 21 May 2026 06:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPwaQ-0002Kx-Rx; Thu, 21 May 2026 06:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1314795;
 Thu, 21 May 2026 06:08:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPwaP-0002Kr-0m
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 06:08:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPwaN-000v1c-BV
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 08:08:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ea16a-e002-0a2a0a5209dd-0a2a45068d88-16
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:08:47 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ea16e-7371-0a2a45060019-d155802db9da-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:08:46 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48ff4f8ef0dso62328415e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:08:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c22d97sm8655395e9.1.2026.05.20.23.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 23:08:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1779343726; x=1779948526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y7kIHZzlotLB68oXuC02FuqM+ANZWIfcpe9XcjNznU=;
        b=b28JB5e+pwpyeSvamK4RK3BwU9rbnyAm63dy3nskGiAOzTK4HU2VbZtEj+oXA5hkqx
         DXiu03J4eFTkqfR3fsRIZFP5vQ2UryGytnAgeOvdDW1DW2FfnPP13PxPspTmqKoNSvqx
         1NeU/7mAlV3LwPd+fykqqmVC0AxplmiCrKsUbD3IWl6anG4Zjor6oS79xZHLBHTtRijF
         mhtuULxkAK+yjLcphr+1v9zuAkaFo0G/EPbm5tyDadr9SsTLnWxDu4EX8Y20uBEQAryk
         YLSYb0vi1xkkc2umKYshKi1KrQ5Cv36Gx1vx6IwuDqS1fPdECHFFIVyzeGIcZHlv4mq5
         gZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779343726; x=1779948526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y7kIHZzlotLB68oXuC02FuqM+ANZWIfcpe9XcjNznU=;
        b=ilOjlqSPXHVY5Ksa5SEhZ1p7laBvKLVioj8hIHnlsJhDy6LjGd0oOfXrCj0GvXNVuk
         bOxgk24Y+bz+5q/U+jdr1dVS+pYcKnhJAEL5C1INQDmxj8N7k6ZhHTMG8b2KDYZgCEn4
         7NalZiIXR0bouV5/HCWfXFi8IzMICuc0O06lUcuBD0ihFCygdvXvwL0uZ8vBzqp3upna
         hAQqwKgQingSc+Jt8twKcOkCR2niF94Ijmsr6u9DmOAPOlEJHsDz11z9TbjvwWUgQe8q
         q9eTm0Cm6eg/gRL+Rf5gDZ4qftMHtaexCTvKCCm5h9C5fVcuPL2J2oZeN/j5YK7VomqT
         enXA==
X-Gm-Message-State: AOJu0YzONRCYBtBMEm8al9RVGq/cEYRxBWWJNXTPWrHykyrflvnIhWaf
	Yufj1gIlE2FgkDf0MWgb/tKbsPs4oMAHUeGmc7LxgCOhNX13aEIblbVPz7d9QNl3gR3tLR3honM
	tOwE=
X-Gm-Gg: Acq92OGRh/M0XzhT94JhIqQOYx+LoGAvjM0NTSzSQFjMJkartSI/fadnIivmJYaObUd
	+phzlBWps1vIhm2y28kequmy7JnbDXAJMdNxIwK/ZXWuUMApG2q4REJIyswi8wO/nFJpBdPCl6q
	LpV8sUf9BOr/FgeVk0X/5aRyKKqaBnx7yK2pBcuDjJXDJc5iR4/Vzm9YNGXDHDOTItdbx0ldNzX
	gzANkAKZxl4aXkMUCx9zIYVGtxLYUu79ws+EEQ+pU1OW50c5y12ClBd2Jgg03amUYtorSeyhN2P
	70FtNv90B72sLRXjJAt5b4rQyk4ngwn0ezgNtQwWx5cnBZ2hJoi572B2k+hcKvPcoGbPFHCYX8F
	eD50JkpGtakFXu4nCxBxoTbzxNP+gvK9S4qEsuS9Wrc/bT9x8Ckae6u8GDbs0KggOOTKQNqIelZ
	IkngMrvDSwTUwFEHkZKWlC5IGBEa3lmobQwLZgvLqgDOC1w28QJD+f998G2v7XmOaUZbfe9heSK
	BnaCy+6w22BidvLU5OHHCDDSA==
X-Received: by 2002:a05:600c:c0c2:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-490360eda02mr13047275e9.31.1779343726464;
        Wed, 20 May 2026 23:08:46 -0700 (PDT)
Message-ID: <e3a08386-7b3a-4127-9127-f484ff8bcac8@suse.com>
Date: Thu, 21 May 2026 08:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: do a 4th linking pass if necessary
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
 <1779293000.8631fc262581453bbf619ec5b2062170.19e46209296000f373@vates.tech>
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
In-Reply-To: <1779293000.8631fc262581453bbf619ec5b2062170.19e46209296000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1779343727-8EF89D75-07A65ED5/0/0
X-purgate-type: clean
X-purgate-size: 2893
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B225C59F4EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 18:03, Anthony PERARD wrote:
> On Wed, May 20, 2026 at 01:53:34PM +0200, Jan Beulich wrote:
>> Once we generalize linking, we may want to introduce an equivalent of
>> Linux'es KALLSYMS_EXTRA_PASS as well. I don't think doing this right here
>> would make overly much sense, though.
> 
> If you generalise linking, you are going to put it in a shell script,
> right? Because this recipe is getting very complicated, for within a
> makefile.

Well. Prior to this change I was definitely hoping to spit the big rule up
into small ones. Whether that's still feasible with an optional path I'll
have to see; I very much would prefer if I could keep everything in make
logic.

>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -99,9 +99,20 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
>>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>  		> $(dot-target).2.S
>>  	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>> -	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
>> +	if ! { $(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o) >/dev/null; }; \
> 
> This `>/dev/null` seems to only suppress the output of the `diff` of the
> macro, is it what is intended?

Yes. All errors and alike should appear normally.

>> +	then \
>> +		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>> +		    $(dot-target).2.o -o $(dot-target).2; \
>> +		$(NM) -pa --format=sysv $(dot-target).2 \
>> +			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>> +			> $(dot-target).3.S; \
>> +		$(MAKE) $(build)=$(@D) $(dot-target).3.o; \
> 
> This new block ignore all errors, from LD, NM and MAKE. We want
> a `set -e` before the if.

Hmm, perhaps I should add that, yes, albeit ...

>> +		$(call compare-symbol-tables, $(dot-target).2.o, $(dot-target).3.o); \
> 
> At least, an error returned by `diff` in that macro should be taken into
> account, for now.

... I expect this would fail if there was an earlier error.

>> --- a/xen/scripts/Kbuild.include
>> +++ b/xen/scripts/Kbuild.include
>> @@ -65,7 +65,7 @@ define compare-symbol-tables
>>      $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
>>      ln -f $(2) $(@D)/.cst.$$$$; \
>>      $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
>> -    rm -f $(@D)/.cst.$$$$
>> +    rm -f $(@D)/.cst.$$$$; \
>>      diff -u $(1).sym $(2).sym
> 
> This macro is missing `set -e`, if both OBJDUMP command fails and create
> an empty file, `diff` will return success.

Whether to have "set -e" here is an independent question, I guess. To avoid
the case you mention, maybe better

      $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym || rm -f $(1).sym; \

?

> But looks like `set -e` in
> this macro isn't going to work in the condition of the `if`.

Whereas the above would be compatible with both uses, I think.

Jan

