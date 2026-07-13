Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sgt3H8+QVGqvnQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:16:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D355F747ED3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:16:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fzdyRHye;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361450.1613683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAtm-0008OH-7R; Mon, 13 Jul 2026 07:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361450.1613683; Mon, 13 Jul 2026 07:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAtm-0008Mt-4c; Mon, 13 Jul 2026 07:16:18 +0000
Received: by outflank-mailman (input) for mailman id 1361450;
 Mon, 13 Jul 2026 07:16:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAtk-0008Mk-PC
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:16:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAtj-00E60t-73
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:16:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5490b5-2eae-0a2a0a5409dd-0a2a450cb936-44
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:16:15 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a5490be-e897-0a2a450c0019-d155dd2de0dc-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:16:15 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so673976f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 00:16:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039ad21sm82481698f8f.20.2026.07.13.00.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:16:13 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783926974; x=1784531774; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlmfLJJ6+tnrj+qljMV4+1CBvZid0jZ9a0kpjA/rmEA=;
        b=fzdyRHye7cVbnwwFZ7B43+2VCr4ZqmQCanNPcNFxipU3Tkq259ICl72zdkF3lYi2rg
         uUTRjrUT1p9ebb+Jv7BhzNa7r5AiKSkyTJunt/WasI17nqNQ2I36beuRxdSINg7y8vaL
         z0yJ5jbfrZO8z3zBJdi6HaCaVg1Y0c94SMjl6GFw0PKW3A4/Ic8ekLNyFna4AQPpt2zE
         gkRR4r9RaeDx1Brk696aulPOuaKeye8IIDMtje6I1mSVEr7cN2lHrpTEr0UvzX/KfLfR
         JsCJhHujQuw5UN9BHjwTC4XlgRSxa9JBignf+Z6W8fqHRw69KaGjFP71qyrP2js3fAIZ
         aSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926974; x=1784531774;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlmfLJJ6+tnrj+qljMV4+1CBvZid0jZ9a0kpjA/rmEA=;
        b=V6sDO7q2kwtS69WSiea7CvNM5R4x1ytKRL1BEIrgzC8rOHW/tWDzV5W09uRsklSMU5
         uI1VpbVuu8ASwh2sGgskja3Fz/Yo1iMPvUs9fQ/gZXK1aae9rKoSzqnrc/POYElIF4z/
         pzX7dD4Kbgk6onPsFcEPgzl0DkMR+aIpcDjAya/be7oz+CaoNiZhS2fJj06TMYTyin0V
         Zy3j48Ma32sujw0Ww8hGmJc223U2o38193+dpWzZw9Msti37N/uEWCFm92U1DRidYj3o
         /9m96sBh2N2FFqgYAlDiVpGAsRaQwkHf/3hN777Lwapc3CS12gRFPAkgMNZJopx0S7N5
         +PTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpea8sdtITtZYbpW0VdQSoLLJ6pAmUqMR5I3SRNQSsTubYp7N4ClrTKUoS9iUJ/kLxEfvWKMx8KiQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4vhRRL19DCewjE170n47DUtynA62cw9Hdp1F/qwH/gYzqFBj/
	Qw33CtwsC8gCMeA/WOgxgBWOFwrI4kyqC2IhCqvwQgaD1Mgskty9SPUNeoJIk+2UjQ==
X-Gm-Gg: AfdE7cnfmBn2F6VqmB5aOzypQqK0DOlALGt0OT+p/ieyGVHmP0egLInzE9maSjDVPP7
	XieayKNBMGd1MwpWqZwDna40ETfRI8jnXhh2Epf7h5KyX2YwNBsORn0XkutjKKmzr7N6l4Agysb
	ee+msvCB6Tk/2ofRrn1OqS/C7Ypvbbxs07wxklbRNN3a+F65vfFO5DCuFL/IBbNHle5i1RwMXox
	NdU/lcziMCfIH6poGm9Fth1ltlfAu55uJ6OAvUgK7PlZC2nOBSxZZbT35p918YU0gb+DB31hyMn
	+0Phykkg8KP+MiIrGq8fiY4Yuzuzdf71UounZAo+O8c88M0KPouzzplATupTUyupdwZy86DR6kW
	i+0ajvJe/iDubdyrZWk3mr8zcxE0eMGnW+q+Ot5JJP6VOvZVdTb925qe6wM7ZKwbTAr/EZ5aoXN
	26J6VP4mW+qFcEF5Xkx1UfZ6hDnMUcS0YceiF2ZFbXq/d4gD8Wz33elcI31Iykt4MmV5SfCsgj5
	euV
X-Received: by 2002:a05:6000:1866:b0:475:f0d1:eb56 with SMTP id ffacd0b85a97d-47f2dd0d63fmr9045766f8f.49.1783926974536;
        Mon, 13 Jul 2026 00:16:14 -0700 (PDT)
Message-ID: <92872742-7fa5-48da-810a-8ab5dae792af@suse.com>
Date: Mon, 13 Jul 2026 09:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
 <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783926975-460F56B2-3E19DCB9/0/0
X-purgate-type: clean
X-purgate-size: 626
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,epam.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D355F747ED3

On 12.07.2026 16:04, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
> names".
> 
> Update ECLAIR configuration to deviate identifier and macro name
> clashes by specifying the macros that should be ignored.
> This includes 'hypfs_alloc_dyndata()', where the real function takes
> an allocation size and the same-named macro is a typed convenience
> wrapper that expands calls using sizeof(type).
> 
> Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


