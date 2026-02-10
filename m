Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDJVDINOi2mWTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:28:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905AF11C76E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226512.1533022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppeL-0007c7-U3; Tue, 10 Feb 2026 15:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226512.1533022; Tue, 10 Feb 2026 15:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppeL-0007Zd-Qa; Tue, 10 Feb 2026 15:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1226512;
 Tue, 10 Feb 2026 15:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vppeK-0007TH-0g
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:27:36 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0614ff16-0695-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 16:27:34 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so41624295e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 07:27:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7f09e7sm71233705e9.14.2026.02.10.07.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 07:27:34 -0800 (PST)
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
X-Inumbo-ID: 0614ff16-0695-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770737254; x=1771342054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw8PP5+zcNgh17HMGxYbPU+TEVxxfZufWgkan98Rhpc=;
        b=b7q22dlpmRB/nLRGORnb7lP/lluz03RtZEUO+3adYuGPlIqxm4/jkfWWw2V4tLxkVt
         OayiNJsl/jvEv1FH/8K+6KTRJJyx5LxgHZFf7L5x0QFKf6IzzSUP0WaZQUaWXM0N7hbX
         8wATAkpc9spYGVopLZxXm823oy5aqK5Nhe4isUF5UMYxSHWT2cVXlDPu73sGcSp6xVd+
         cTisqo3uoseSefttb4IqOvRt3P0uCNMwKyDeXw98qERuwCyLv4D4L122Bu9LvWf7n4sw
         qlf7LHDjpNCp9ih6NuEiJPyOP9zlhpLnBvKhik+zK8US6AUicx6qdSb5pxxCJfIbG/B4
         RwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737254; x=1771342054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw8PP5+zcNgh17HMGxYbPU+TEVxxfZufWgkan98Rhpc=;
        b=savGsD9H9WoNVnDpBHDNHRTdDBv/gnoVurf63DEE4ghd0wTKLBfZAJGOivHdu6WnTd
         Y66dFQs9tYn31dG50lmYGR6K5WCYTGrw6hmvldd7Pbzd8fea56vdTKj3iWVHcJcCkIKY
         kU5lS6GuSUx5pI/DQ7fpImMBA9p7k8J34hokYR5vaNn0M6exZjOXoX+7ZCi8/ls3JiJn
         Q5QllAmzNckNMDxdp+MJrDOyY7vRnQse6F4VcI9o4saxP5Q6wkUWD2Tq/6j7/7AJdFW5
         J+98r8Hc4cPBWpyiGqTTpFhacPQ759hUZnUZj7zzSgpoR7a6SRO82PpZAJsF2wWWgA/n
         Z/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWEG4fkSTDymGztStgUriPQjen9fjUvH/1vE7Lvlh/uZXL3/20uKcDrsPEo3q7cJx9hUwKg7vtC0oA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysYe3n7Mgegx9ahl9DDMX2v1FsCl27jez0RFSDUB7B+Bzu+4MU
	bRIMmgRXtJlh2dF4o2xqE0Jp9ZaEpbzbUWr54XWu3PY819JSChouGe9bRsca15xlwA==
X-Gm-Gg: AZuq6aKl1GEGNScNBomjVZzfh54bcC/AZs9RhIGMcZQPkdGHuasNviyYfk696wPZI73
	q7TWIsgvY401Yu/1G514Ptf6Vj2mQz0DdDwiXeqU73n1S6Y2IEESJTN+rKH/eQql9ljgeKIe0M9
	1QxApk9NR6D0hzZZz9cfgn5c4tV/gZdQla1KWB5JRLGntVNduWy8bRKyckOVGSyEna57SbN2nQF
	vM/dWQDnc6rUdhWNqBv9rzWSpFvutEKbf1zAVsfNYg697IMMyQx9QDSCO7z7edK034LIZvB962b
	FE5vU8LkdsPg5MglO8dsFYLK3FLarSkT/VWLTv3gzvfkeuSdLAJAuc7IJr5Sek9Lj0ZEyo6eUdG
	PxYt6J6pi9ZZNwgUOOdjnYCmONuaoKhtwwXbkaiwquj8Zeao3wvz5HcOzyNRi8G0R/IVFuf6G0F
	dECKQ5ThFtd2lXxllbUcHnwPmfYhJSl37QDrl+a0phEtatvkhricEInOWtXGVhZ1g/o2fkaFIoU
	a4lxAMdMSm3Wd75CNSU9+e0+g==
X-Received: by 2002:a05:600c:3553:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-483201da2d6mr199025625e9.3.1770737254226;
        Tue, 10 Feb 2026 07:27:34 -0800 (PST)
Message-ID: <8bef9911-2f37-4cd1-bf18-29cca646fb09@suse.com>
Date: Tue, 10 Feb 2026 16:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: always consider '/' as a division in assembly
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260210151110.26770-1-roger.pau@citrix.com>
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
In-Reply-To: <20260210151110.26770-1-roger.pau@citrix.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 905AF11C76E
X-Rspamd-Action: no action

On 10.02.2026 16:11, Roger Pau Monne wrote:
> GNU assembler will consider '/' as the start of comment marker on some
> platforms.  This is incorrect with Xen's usage, which does use '/' in
> assembly files as a mathematical operator.
> 
> The behavior of the assembler can be altered by passing the --divide
> option; unconditionally pass this option when available to force the
> expected behavior.

I'm fine with this in principle, but I wonder: What about Clang? If it's
properly compatible, it ought to also take '/' as a comment char for
those same targets (in particular for the plain "x86_64-elf" one).
According to godbolt it can't deal with -Wa,--divide, yet there I also
can't control what exact target the toolchain supports (i.e. this may be
only a weak indication of lack of support / compatibility).

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -405,6 +405,11 @@ $(call cc-option-add,CFLAGS,CC,-Winit-self)
>  CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
>  CFLAGS-$(CONFIG_DEBUG_INFO) += -g
>  
> +# The GNU assembler will interpret '/' as a comment start marker instead of a
> +# divide on some platforms.

Could I talk you into s/on some platforms/for some ELF targets/ ?

A more fundamental question is: Do we really mean to support (allow)
building with arbitrary-target toolchains? There are other subtle
differences, which may be hard to evaluate as to them possibly affecting
the Xen build.

>  Pass --divide when when available to signal '/' is
> +# always used as an operator in assembly.
> +$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)

I don't think this should be done here: --divide is an x86-specific
option.

Jan

