Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALNtFthThGkx2gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:24:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0347EFDD5
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 09:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221588.1529768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuei-0000SP-LD; Thu, 05 Feb 2026 08:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221588.1529768; Thu, 05 Feb 2026 08:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnuei-0000Ql-Ic; Thu, 05 Feb 2026 08:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1221588;
 Thu, 05 Feb 2026 08:24:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnueg-0000Qe-UF
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 08:24:02 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01af84f8-026c-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 09:23:53 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so675484f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 00:23:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805faddsm12073754f8f.33.2026.02.05.00.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 00:23:52 -0800 (PST)
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
X-Inumbo-ID: 01af84f8-026c-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770279833; x=1770884633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iSs5qsGCzxCT3MdfmtcnrUblKn9TOmm3mSQZl3vyvMQ=;
        b=MTYdf9MaQaqCd1juYkScoNWh8VPj/HjFu9nTNC0JpmJ/RufkEuD7KoI6w6J+4xnaD5
         KP544Jex5/tja4jh3TOWwxJdH+fWxr1b5WBjA/W++vngmApx70mCdemTTeub45mGhjb/
         d5qEHcovrQ3U9miBRMIatIXqNV98oTc8CWzFT1ecAdLNSeMxy7Sdur25+JLl1OsdtcPB
         Yb2Df835dRDitasodaDmtdr3aIDixLkEikq4T0DGC0jxcrG42MznMoXl8qUzxe5ExyHI
         Sx6sAPQtULs1kyeQD49oa28Hzsz5LoQ876jlOgxw4M1lDFVvTu6X60MytJIW5vo3k8yy
         JT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279833; x=1770884633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSs5qsGCzxCT3MdfmtcnrUblKn9TOmm3mSQZl3vyvMQ=;
        b=JICTerNRBO9jJO4xmDX81LWOL59e8AQ5xaJGaDsOjR/cY2btNtTcjoxmuseNGDatQQ
         1K22dZ3l4aQ9FtXEqicFctd5APtZItyn8yOK0SWf4+DOkadTLYVg9iQkTFayqHuFNfKI
         H/DSKZkQMnDc5ELsEKxNVFVdu67kweNHcHn/6TylU+WUKQ76B1ldv3JWDw/qAl4/AzfJ
         Nh7I/ch04lkA/jF6MLTICgbIcqmhFrdFPVjvQwyfVEBePh10gK9B8QFtG2HekRfio+kk
         59MF//WuJFuyp0gsKAiNRSbBmQcSDHlW2QB53xezWqR8U8N97Nb7wJX3ZiJv07JmUUQJ
         E6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFaG0Xu1Vf0W1UiNaAuLcDoLphIIWe6UqrpJjBCH42oXABF9o1FMUw4HFvRzsOJNLv67vs0V5G2WQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrcAxq7d3JOI9f9DeMv7/68Whs58KvjdCAOCDm1taOOlcxfhjU
	3WcZff1zXxA8i7gQpUovv4sWslsmvBBEtiKSCcLXQuN2nATabN30HBDRg5yNACCJig==
X-Gm-Gg: AZuq6aK7dd6EJFF04ow1b44Ur4DhYMrpMagUk8d4S2HZMqwKCNGy5QiFMgqM1dLXNmj
	uwNUoeZSbRIitnZ4x9B3GsPCRfhVD1Tv241m6ozFDjpWDJRqxlGq2g9eqMuJANAT0/8H0NAlcpm
	uE49od+h92MPr7qsveUTGixuN5DWh9j1PQeuslErZczFpdNGVDm6JaFrZ0mQ3O7x0BxxN/fvPwM
	OZahYvOmLOqnl6ss56Uq2VeRqJQZg+IWglRCNqWMwYvzEEpQwKK5Xw3gU0a2q4lMICDLO7ELad1
	H2tR/UtP9RVSlJKzRr4Ix8V9/YypFG7I2sJ9lvSCmggEaYWplw29yYj8IFzL0+k8jWfqioaObFl
	Lpkg4S8tBMMpefJs7G/J32IIfjOAmOipsH1o9pNrOUjrw0WzW9TOHmcqP5Kx73k4zqocMUgXgfd
	v2rsfMLYIG2Hdw8qlFw2Svd9H/PLmINVr85oRTPAoElmPGY1c8p4n3hDoJEzuIJov4WlbHgtPFc
	3IO3upbLoB6MQ==
X-Received: by 2002:a05:6000:2310:b0:435:9f41:d43 with SMTP id ffacd0b85a97d-43617e40ba0mr8673859f8f.15.1770279832824;
        Thu, 05 Feb 2026 00:23:52 -0800 (PST)
Message-ID: <eed4bb7b-5836-4345-984d-c542b9f1da34@suse.com>
Date: Thu, 5 Feb 2026 09:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
 <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
 <65D4FEA7-DECD-4DDD-B119-4625F72ED585@arm.com>
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
In-Reply-To: <65D4FEA7-DECD-4DDD-B119-4625F72ED585@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C0347EFDD5
X-Rspamd-Action: no action

On 05.02.2026 08:44, Bertrand Marquis wrote:
>> On 4 Feb 2026, at 17:15, Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.02.2026 16:45, Bertrand Marquis wrote:
>>>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>>>> Xen does not currently document how to build the hypervisor on macOS, and
>>>>> there is no Darwin configuration for a Homebrew-based toolchain. In
>>>>> addition, the Makefile silent-mode detection can be tripped by -I paths
>>>>> that contain an "s", which hides build commands unexpectedly.
>>>>
>>>> This wants submitting as a standalone fix, so it can be backported. But see
>>>> also below. I don't, however, understand how -I could be useful here - our
>>>> build system is self-contained, so any include directives used should be
>>>> satisfiable without any -I.
>>>
>>> This is added automatically inside our Makefile if you build out of tree:
>>>
>>> MAKEFLAGS += --include-dir=$(abs_srctree)
>>>
>>> which ends up being -Ixxx when tested.
>>
>> Hmm, but I do have an 's' in my source path, yet I need to explicitly pass
>> -s for the build to be silent.
> 
> I did further investigations and my previous assumptions where actually
> wrong because i looked tat MAKEFLAGS value once the whole Makefile
> was parsed and the include-dir flag is added after so it was not the reason
> of the issue.
> 
> In fact the issue is coming from variables set on the command line (and
> in my case O= with a path containing a s).
> So you can easily reproduce the issue by just passing XX=s to the make
> command line to do a test.
> 
> As a consequence, your proposed solution filtering -% is not working and
> the only reliable solution is to actually use firstword to actually get the
> short options list. This is making an assumption on MAKEFLAGS having
> them first but my tests are showing that it is always the case.
> I would propose to put a comment to explain the assumptions on which
> the filtering is based on top:
> 
> Something like this:
> diff --git a/xen/Makefile b/xen/Makefile
> index 13e336ba5484..a7924fcb7af5 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -113,10 +113,10 @@ else
>      Q := @
>  endif
> 
> -# If the user is running make -s (silent mode), suppress echoing of
> -# commands
> -
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> +# If the user is running make -s (silent mode), suppress echoing of commands.
> +# This relies on GNU make encoding short options in the first MAKEFLAGS word;
> +# if this changes in the future, this check may need revisiting.
> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
>      quiet := silent_
>  endif
> 
> Also i can put a fixes tag if you think that is useful:
> Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rule")
> 
> Please tell me if that sounds ok for you and I will resubmit this as 2 different patches
> instead of a single one.

Sadly no, see my other reply sent earlier today. Furthermore, as said there, even
with O= I can't repro what you say. In fact with a Makefile containing just

$(warning MAKEFLAGS="$(MAKEFLAGS)" ABC="$(ABC)" XYZ="$(XYZ)")

all:
	@echo 'MFLAGS=$(MFLAGS)'
	@echo 'MAKEFLAGS=$(MAKEFLAGS)'

I can observe (with both make 4.0 and make 4.2.1) $(MAKEFLAGS) expanding
differently depending on where it's used (I'm passing ABC= and/or XYZ= to
experiment): Only the use in the rule has the variables. What version of make are
you using?

Jan

