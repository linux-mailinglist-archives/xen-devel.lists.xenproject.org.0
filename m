Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGrdK1x0y2k3HwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:14:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F6364E6D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268520.1557780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7TIK-0007Ge-Ld; Tue, 31 Mar 2026 07:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268520.1557780; Tue, 31 Mar 2026 07:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7TIK-0007Dw-IB; Tue, 31 Mar 2026 07:13:48 +0000
Received: by outflank-mailman (input) for mailman id 1268520;
 Tue, 31 Mar 2026 07:13:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7TIJ-0007Dq-FS
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 07:13:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7TII-00AfeV-3z
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:13:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb741d-bab6-0a2a0a5309dd-0a2a450c85f0-34
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:13:45 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb7429-f93d-0a2a450c0019-d155dd29cc26-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:13:45 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso1866721f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 00:13:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e3602sm25364673f8f.4.2026.03.31.00.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 00:13:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1774941225; x=1775546025; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=phZwkPlAN02gMSmPXafDDWQjYupInVaASDaMnTzYCDc=;
        b=Tl3Ey3EQ6lmv3hIpwqKBCP3K0Ja6+j1s49qW2H6PktXE73HhyIJl99oN0WqlZwKo69
         BWBuBSVAK1HhtS2nHTP0zlFmw1gFzPkqkJ1Ro1+N0n5bgdG9YMzAF/DIpZU65RbAsaVA
         llkQZaEIhcgjCsTI64vTbJgfQrGn4LUyoPAKJu7vOqopJ/+RYdSShMz8fBLd1Bz+j1kf
         BGiRq8DNtj2JojYJ2yLPihwicKu5+1AzhEfMu/9Mso3bwww6C4WI9STMA9YZSDnTZJGi
         ukdW57xPYP/T+3hkWUP0h8OiI9CToQCxycMQEo8u81ZQuLyJIDQ8DTLDQOwGyCGnEiX5
         IRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941225; x=1775546025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phZwkPlAN02gMSmPXafDDWQjYupInVaASDaMnTzYCDc=;
        b=QvEfOaa4AUsteSa4Go9qnXs3LxGVCb//VOXGcYqMT+ymUTDvtSM26zT9T3aYhffh1p
         zUmlZqSaMhKvIiRzAAMwPgGUz3AJM/O7ld/Pw1Q75zMWmj0+lpvQrgpwsbDj/12JAGpg
         qXnKLzgvd10ldGWd3+9Rflj9w4jfDHxBD2MD72hCZg7R8clciJNThuqPmYoLV4uk3BeS
         YPu2haFH7qVii4/emoh0f1AnDVTanzp+alAncuFptBpTRNmTxzoxmNpp1d0AP1z2Br0L
         lkW4WJpOFkyUDC1Cd0x4cA8fPfeVL4H2MSMaLrWtMuurN0IPnBge4VNUO+zCiv4zhNP5
         JgBg==
X-Forwarded-Encrypted: i=1; AJvYcCVGacWQGAOki7Z63xalaesjITsiHVlLaIWOW+WbjaCI/MjeXGxSOqpiF9/DYQgogajSfTT63gx4Zy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw98S/Xkl2BQzh2k2vqdwkwzSfK2MVVCvsXSvdGlZN/gzrIG6OC
	uGJ+GX0k/XmQQn1uIRQCFtXsbxU4endiRrVRnebc8zSv1h2k4jzeMtwqHjoBU34EnA==
X-Gm-Gg: ATEYQzwqUE6zj/C5ZSXneKhGOTQ2RUJkNf1oom4cXZDw4bQ0SGjXYM1uYaFAIkESBvn
	dTIHl3xBF4kU+B+W/C+aTyFYuzOt7osRugm2xrhe3lhR/Cx2Sz+1qcuthMmQd2CWcfpnR69w7LJ
	XGbBTjhpLXg+EbP91441bSK/3D1/HnSaNQlI8GBdRBeECTv2s4MAAgDeKemIloI3nHEHAoOHzB3
	nMDjQkuYVyOVl9tN6u4NY+LAXN2tmGDn9D/P0uQ/ivmwMxf+/vCBhKVnfnexY0HK+apVLNuwbrG
	Q1oXw72xnO9YH+C3JAZrfY+GmcdqZrE7sZxe6EqBImPc0kg3Ch8agXEkO8vKzmpwkxgDekCjQB1
	5FNhRXyIBkSvtmQmoUZ6vlBCNZvMI7/XrGWrROywZgtLijnDkwOHXJJrPOnW/p4cqjyaZXZLqe4
	oCAs3s1Dv7pDhsY5Qy557xCft45sCUIo0v975xomHXfIkcV9hWfZzvl85aUa23mVuCf8AlLxYDn
	++o323jIE8GjJs=
X-Received: by 2002:a05:6000:2506:b0:43c:fd4d:2404 with SMTP id ffacd0b85a97d-43cfd4d25f8mr13177933f8f.7.1774941225377;
        Tue, 31 Mar 2026 00:13:45 -0700 (PDT)
Message-ID: <d393d3b0-a7fe-4798-85cd-ae661ef1becb@suse.com>
Date: Tue, 31 Mar 2026 09:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] tools/test: introduce a 'make check' rule
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <aa855bc8e8721bd799c7699525b68d67430eb9cb.1774886602.git.edwin.torok@citrix.com>
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
In-Reply-To: <aa855bc8e8721bd799c7699525b68d67430eb9cb.1774886602.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774941225-6D6B7734-1472F7D1/0/0
X-purgate-type: clean
X-purgate-size: 1693
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 155F6364E6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 18:17, Edwin Török wrote:
> --- a/tools/tests/Makefile
> +++ b/tools/tests/Makefile
> @@ -17,5 +17,23 @@ ifneq ($(clang),y)
>  SUBDIRS-$(CONFIG_X86) += x86_emulator
>  endif
>  
> -.PHONY: all clean install distclean uninstall
> +.PHONY: all clean install distclean uninstall check
>  all clean distclean install uninstall: %: subdirs-%
> +
> +# Subset of SUBDIRS that do not depend on xenctrl
> +# Thus these tests can be run in the CI directly,
> +# or on the developer's machine.
> +
> +SUBDIRS_CHECK-y :=
> +SUBDIRS_CHECK-y += domid
> +SUBDIRS_CHECK-y += pdx
> +SUBDIRS_CHECK-y += rangeset
> +SUBDIRS_CHECK-y += vpci
> +
> +SUBDIRS_CHECK-$(CONFIG_X86) += cpu-policy
> +ifneq ($(clang),y)
> +SUBDIRS_CHECK-$(CONFIG_X86) += x86_emulator
> +endif
> +
> +# Ensure tests can run in parallel, the for loop in ../Rules.mk would serialize them
> +check: $(foreach subdir,$(SUBDIRS_CHECK-y),subdir-run-$(subdir))

As said in reply to the earlier patch, the emulator harness is special.
While its building is suppressed (not causing a failure) when the toolchain
is too old, its running isn't suppressed like this. Instead, if you invoke
one of its two run* targets, it is assumed that you would override e.g. CC
to be capable of building the harness. (This is particularly important for
the run to actually have full coverage, since - as also said in the other
reply - blob building may fail with, at times, not bleeding edge tools.)

Perhaps its running here could be keyed to it having been built
successfully before. And then, if (on a 64-bit host) the 32-bit harness
was also successfully built, it probably should be run as well.

Jan

