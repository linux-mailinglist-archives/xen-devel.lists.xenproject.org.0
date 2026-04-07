Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEIBEPfI1Gk0xgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:05:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F93ABBAD
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 11:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274552.1560646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2NQ-0003Jq-BO; Tue, 07 Apr 2026 09:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274552.1560646; Tue, 07 Apr 2026 09:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA2NQ-0003Gp-8J; Tue, 07 Apr 2026 09:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1274552;
 Tue, 07 Apr 2026 09:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA2NO-0003GT-Ih
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 09:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA2NN-000w4h-Gk
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 11:05:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4c8de-5cb7-0a2a0a5109dd-0a2a4508ccd2-16
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 11:05:37 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4c8e1-fab6-0a2a45080019-d1558031d46e-3
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 11:05:37 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so43541705e9.0
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 02:05:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f5294sm45279320f8f.35.2026.04.07.02.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 02:05:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775552737; x=1776157537; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+iipnUvWf3VyQXpeoKOUwRCi2Sd72keEL26IKUnCmEI=;
        b=ZqibR8WGV/wciesuuE7VCZciTuMHDGX8aj56sl79ZaMeA1q5CukgsAXXulNTRToe85
         cGp+zhgA9pMGWBZL1fPa1CVDFxWBPI5g4RtnVEo3+Gf6xzLIi3bgRbewuDZ4sr2DIEGE
         T+QHKwhptZep2YyFDcBT5CM4fd8/kkecPGbT657h8OrBfHmbzlV7SnzGjm7oQUvOUuYC
         hoPSTeyct4RrIT6S35ESnLh8QvotDWDgqdM6COhoWdxTHxWeA5BvaKLR3uOx+2PIusrK
         8sNuve/zF4Dj3R6Wd+ECu6ABHbwFwpI5/scvD901OHRk67KbqOxwnLPNr/M5I7I3qGZG
         Bpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552737; x=1776157537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iipnUvWf3VyQXpeoKOUwRCi2Sd72keEL26IKUnCmEI=;
        b=artYPTpe4/I7XIhJroKgNHYiz8JTlDWoYyv9fnaQwdIvIxZQyqVDnIQ37TstBBqrHi
         5TVpEinXkF8rxKChJMR0Cc1mJADewz/f7R8ZM26j3BUyn/zezx5LgVTuVnNsdVng4P/Y
         xE12+JXUIR5UiAhptYE+m/AKKwRUSnAuCbyEVMejAhk3dkn9oCDxYmHdFxb0FRCWebby
         E2K+RJUjAvO6A7+fTqxyEowJEYlhgsKNKHHhiyX1Sd7JA0mQMvayppff2fAFnAjaKXX4
         Ss6Uhi2VOe65d3m5bvzXNaaquyuARfDSzC1N9hQnK6Mm091gTCij6ttS6bJtfqoAZCjb
         EQ8g==
X-Gm-Message-State: AOJu0YxY3jQ2guHmXAqKjnqDUU6bM4srAiuUdBIVgBXb9cB5qC3zdA9O
	BEqV2N8wlyW3OtSrmHqbI0JWSBLiY6SfT022dxWGJPcrAlbAXloiEk3gq4NDb6BcZg==
X-Gm-Gg: AeBDiet/gn0DD0XD4mPoJprZjyeLMliDbRZ88vV97YJVsTKuf98oSMmYaQeLvNDj9ws
	3C9qIroJRtrsmYJmBRWYORqsy9PCO8ar4LEIKxafZ9a0jTUdMq2fF3j3ddcXNNGarhFrXI4jvKS
	y/C7sqS58Jc+wbwNM/OHV6ifr5IA4CRrWStrjCvoQOstBQH3ww8Gv0gN0EBzoM8LFV7lgADwOHa
	5pgQYLCIimfp8gGj8K7hzI0Webd68Kle9IY+LnUJ9ecrcKKoLw3XuoXxspdUQEtAvDkBJ1xMzow
	d8TwCXhbYBoYNLdzN5ie9ChRmogvjk1yJBQpfdc15iLoKxyAUrQyEhC5HD+RwMcvbSLN+GMk0a3
	YMPxEurVDMx0urZHqRtMNo6FE1xK+/2ynRXp+ROPNDLzFcvBU2A2qpcg7mVXvqMRviGSpec2bir
	rwN8Yb8oO74aJaolqCWPKVsmxPn+6o4CUxWPHp2s36BNtIP1pDvD14c0pnb5KmBDdyN6FJoOrol
	s0cD/pGoljzqfQ66gJQrpJ37A==
X-Received: by 2002:a05:600c:638e:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488997c13femr221244405e9.25.1775552736614;
        Tue, 07 Apr 2026 02:05:36 -0700 (PDT)
Message-ID: <1f1cfdeb-adbd-420d-a187-d0007fcad123@suse.com>
Date: Tue, 7 Apr 2026 11:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen on Zen 3
To: =?UTF-8?B?TWF0ecOhxaEgS3JvdXBh?= <kroupa.matyas@gmail.com>
References: <5490687.niJfEyVGOH@rivendell.hailstone.cz>
Content-Language: en-US
Cc: xen-devel@lists.xen.org
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
In-Reply-To: <5490687.niJfEyVGOH@rivendell.hailstone.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775552737-F7149497-34A61169/0/0
X-purgate-type: clean
X-purgate-size: 2132
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:kroupa.matyas@gmail.com,m:xen-devel@lists.xen.org,m:kroupamatyas@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,fedoraproject.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xen.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 880F93ABBAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 10:08, Matyáš Kroupa wrote:
> Hi,
> I am trying to run Xen on a bare metal with Zen 3 microarchitecture (to be 
> specific Ryzen 9 5950X). I am using Fedora 43 as Dom0 in PVH mode. However, the 
> Linux kernel crashes early in the boot causing Xen to reboot. I am not exactly 
> sure if Linux or Xen is the problematic part. The kernel boots fine without 
> Xen. Before Ryzen 9 I had Ryzen 5 3400G (Zen+) which booted even with Xen.
> 
> The Xen is a backported from Fedora 44 (not yet released) because I need Xen 
> 4.21 features, mainly ReBAR support for the Arc B50 GPU. Package specification 
> with build commands can be found on https://src.fedoraproject.org/rpms/xen/
> blob/f44/f/xen.spec. There are also downstream patches and configuration.
> 
> I have set up a serial link, so I have some logs. They are in the attachment. 
> I have used gdb to translate the binary offset to source code line. The 
> problematic line is https://elixir.bootlin.com/linux/v6.19.10/source/arch/x86/
> kernel/amd_node.c#L296. It seems that linux is detecting zero PCI roots on 
> non-zero number of nodes causing division by zero.

Not exactly, there is an earlier exit from the function when num_roots is 0.
If that line is the problem one, then presumably num_roots < num_nodes, thus
yielding roots_per_node as 0. Sadly you didn't enable enough verbosity for

	pr_debug("Found %d AMD root devices\n", num_roots);

to actually leave a trace in the log. I'd guess the value to be 1, but there
being multiple nodes at the same time. You may want to instrument the
function a little more to be certain.

Seeing

static inline u16 amd_num_nodes(void)
{
	return topology_amd_nodes_per_pkg() * topology_max_packages();
}

I'm not overly surprised of problems, though. Our topology representation
still has a lot of work to do before the data can be reliably used.

For your immediate purpose you may want to change the "!num_roots" check
into a "num_roots < num_nodes" one (on the assumption that num_nodes
can't be 0). Whether that's acceptable upstream I don't know, of course.

Jan

