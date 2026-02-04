Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDYSLJxwg2mFmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:15:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE9EA0AD
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220982.1529381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfX2-0004Yr-FB; Wed, 04 Feb 2026 16:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220982.1529381; Wed, 04 Feb 2026 16:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfX2-0004Wu-CT; Wed, 04 Feb 2026 16:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1220982;
 Wed, 04 Feb 2026 16:15:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnfX0-0004Wo-Nz
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:15:06 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac4d355-01e4-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 17:15:05 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so38283f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 08:15:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e3a3bbsm7325354f8f.15.2026.02.04.08.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 08:15:04 -0800 (PST)
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
X-Inumbo-ID: aac4d355-01e4-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770221705; x=1770826505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z58d4S9BEuC94xRqazpHNOAF3THVDsFtvqddJg/YMcA=;
        b=a32hG5d1e/sedeiSV8navzD1FrdOvS6g9YDFNlPTHws2kHUlhK91tOBbl0rfmz+C/J
         sa4ZuM0XpMJA9XuOjc3Yuve7gLupBySMajbqHCk9vyGEHYwXtyCLZJlDrrdoQWLiiN0v
         Xb2qNQtuT82cZ3eaSu9Fwu5BryhW1k2E9rGzR3bvrxSFxAleZkauz9eysVYbAWannbnh
         Z8zdC/7MXtPrQqXJ6e9jVGvAGae1faRpm87Uar7ZeXG1IHZy/yvsV38lcvDt2iriN1jd
         xkERutqMIMGklyOcNC+2YOQgENgvghaJfNeAbFf51Q/9/eN+GKmMXH1hzE9gMUW2ixRt
         iFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770221705; x=1770826505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z58d4S9BEuC94xRqazpHNOAF3THVDsFtvqddJg/YMcA=;
        b=uzgQN/fYF8Yj7OsKbN2wJsNo+h1BNyyOg36A6q5GJmG8D7vMVUvpa7gDPHyHXv7lUg
         Qyv4zVg7x7pVM1uMlufnvx7j9WKAuWCYGSecdZoPNozdxERIl1EsNsbTPrvtIJ06Fp9n
         /dFRC6t0ej1E61P4cAiKy3GX3VFNsKF4pjiZcGxoUO+BpE9XwPLE+bo53P7drBrshcrZ
         IdzK+U1m4mDRw9Ud7wBhfNUisKqBUmvfxjdwL5JE52ewhT1rhzI69whK3hVzrmoI1CPp
         849tdvunG+uVGY7ZSn/FQ/3Z7wfJWuuTqrunbz3CqE2eWoc6uFXPSDOg3mOD9vkEk6OE
         XeFA==
X-Forwarded-Encrypted: i=1; AJvYcCVzSji9/MuVFUdxyln8+C6jBjcv5+DG+8Pf7Iq+TCvvVx+rNBpguqeNR9UG/3wHLuNU0PMyXuyA2XY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvIjVtragIXRnE2qQaoe3oXpkfVu1vL+Vixk/+7WiTgjq3MoG8
	jAN/SM1Ih90z3AVmy5t7TTv/hc46+QyWmxPY6bKOHYVG4knbUZA5NQthtxHH9fTh+Q==
X-Gm-Gg: AZuq6aKuNqljLiueFmt7Gp6m/NHFTm23qCurKSutEdI15zQJcFCSsCms0rqmxnzhvNY
	RcXQLnA3iGdxpE2qoYQyxomF7j7SbnLKEgGuGKrZ/9YK3pn2JBF87SyjMzOqnJCzSZCAZu7H5lJ
	XLE5ChlVIphb5GAYqGcT3d1+0DjzRkKDLOfxnfnTiIilfvxbhUVgXwNi4X8P1jqz3WlwTWwGSsa
	WEl4VZ5UfZaJUB++3iu9ZE5dPsLKxNQHO1lDm00OJvbwInnae/TzObs4JUACShviwiP5R92Eb2D
	+sZ2sxBLBqG/HEUahGFy4mlVCEQNUbGvX42vUQ5MfDMdhkJK1YUtZW+CUWpF3fhUs2yZysesw8z
	FG1D4PS0B/KVek/O2OaepTa+zICYbB7Pqj1GM5WZPSR655N5CpGKaYr+BxKoBMHW1UhA4BnCUT7
	CF9q+cvFVX+fcBy3pjKSdgkC1u7RsfvUH65zbbqPOaENBNBOTuYxFayAvYwSUgocvYPmc6ORlMS
	yk=
X-Received: by 2002:a05:6000:26cc:b0:435:f29d:8c41 with SMTP id ffacd0b85a97d-4361805fb9dmr5651182f8f.62.1770221704999;
        Wed, 04 Feb 2026 08:15:04 -0800 (PST)
Message-ID: <eca1e783-b147-4230-a340-41b8cb694c5e@suse.com>
Date: Wed, 4 Feb 2026 17:15:02 +0100
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
In-Reply-To: <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: 21FE9EA0AD
X-Rspamd-Action: no action

On 04.02.2026 16:45, Bertrand Marquis wrote:
>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.02.2026 14:16, Bertrand Marquis wrote:
>>> Xen does not currently document how to build the hypervisor on macOS, and
>>> there is no Darwin configuration for a Homebrew-based toolchain. In
>>> addition, the Makefile silent-mode detection can be tripped by -I paths
>>> that contain an "s", which hides build commands unexpectedly.
>>
>> This wants submitting as a standalone fix, so it can be backported. But see
>> also below. I don't, however, understand how -I could be useful here - our
>> build system is self-contained, so any include directives used should be
>> satisfiable without any -I.
> 
> This is added automatically inside our Makefile if you build out of tree:
> 
> MAKEFLAGS += --include-dir=$(abs_srctree)
> 
> which ends up being -Ixxx when tested.

Hmm, but I do have an 's' in my source path, yet I need to explicitly pass
-s for the build to be silent.

Jan

