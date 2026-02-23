Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFJtNdovnGkKAgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:45:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63B175148
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238989.1540376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTRb-0003KP-Km; Mon, 23 Feb 2026 10:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238989.1540376; Mon, 23 Feb 2026 10:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTRb-0003IO-HX; Mon, 23 Feb 2026 10:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1238989;
 Mon, 23 Feb 2026 10:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuTRa-0003IE-UG
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:45:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8c3ada7-10a4-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:45:35 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso27694995e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 02:45:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31f9475sm238043825e9.14.2026.02.23.02.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 02:45:34 -0800 (PST)
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
X-Inumbo-ID: c8c3ada7-10a4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771843535; x=1772448335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gez+XyJ1U49Esroum8FQ7DptACwgoCF/NJWJFuR/ccU=;
        b=NVcwdl1rewpRftLDjhe+VW4ksgTUYjp5rmiIw8yhSOOZ8G38YzqC/3PUZIsM0eihDr
         Bs1ufAzMltlaMZX5YVc3gmFeh8VgF5cFWeb7bBE50iMuLoALNUiCSu5N38UTvCubGq6S
         8S7mg8TrnXdlJJXm9mFX6WYKX5pkyLFiH+hu6txiIY9TmRTCPUMwJBDPt7GGYXNSsq0s
         r1ZIzoLaVrWVdalaQU/EifD9xuidYTV9eo9+2uDNkIlqzYzrVoOKUQ7WfMb5GYQxPH09
         awJIOcVFNrZroFyGF86873tOJ5GCrFz2cuooOn2Cf2SlpmnYxU2E7sSBMBBsbkQnXDFH
         3VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843535; x=1772448335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gez+XyJ1U49Esroum8FQ7DptACwgoCF/NJWJFuR/ccU=;
        b=pDTWvAh+/xaSm9ivOISuT/o0CvaE3kiP2JVPF3KjIUa96oCTph/4WNRPy7iaWYoaLZ
         QKyyzEFM/YXbSy4QabPM3RS9AkD+GMBKiV26jtzfFWcgfSv9vAgZkRyWprYxMIdA8u0Q
         vwQlKKHjDuAr4xCb+7ejE2tJb+OOjTGpbIj3Cf49bCzg5adA89kXdnDJ0pUA65YcVNcm
         4RPkxwkay5ha3ncLasAJQ5dQemllCWmGjeIWHl76e4owkyNSWlpIR2Wi4W1hEUvtnq+a
         6besTpBVtV40AOTwIBj20GvsIevNLgmr3a5G9DC0W9zkaa7XX8Sdj38ssLbsO87YsMpZ
         nq9w==
X-Forwarded-Encrypted: i=1; AJvYcCUH7IzI9X2zOfP3rkfXHLdcBUiplnyv8qnntDA21JIR0cEZ6Ow4RHOrukcyVo9mI0EjqedfObj9vRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOmJEt4RsJ7U8haWwTTM15IbUQNAVUR3u7+2mM1f9OQbUPNGwE
	MPyjRqyVj5iFJRThlg/e8bS9qvC2XXc/V8aGcxJFAOgezfNjTEg04NznrIlEOP+FYw==
X-Gm-Gg: AZuq6aKs9Ke3J+xG33XixD7XMXIIWZN0yGREQhR6izTzsQT3ied1pMJ7/wDvS/r1Y27
	JcAZrT+smINF++I6AFBzzQvY8WwH1BxjAdvePQRWBdDHG1+/jFk1tuZtlElYiU+AkRwsA0b+eB9
	Nb+DJ3ah1m12/g6Wq43cmJtC0eY35mzdGBe9b67WEkREz+Sx7XxRq7k/VbzCOafkL1eQLEzn9Yj
	rAJjiiZkf9SaW4xVB4Cm86cH+YRjDT4Mimr9rFFYonN50+WFEE+yz8hbSAhuQ1XDYGSq03fBfbj
	1SzplccBdHPMApeDmjm79q/oxoQCId7RId5UFOM9j3m3DOxxgSnK38o27HjHtWAwpi3364L03s0
	IuqifL85KzEa42uhx5iCH/aJ6/Vrqao67+fUJEg0DZpwYMqa8eIb6DdtKO6QLv4DWmzriXVuhRa
	fLYafZPo4xYtdRYODhazLl7oLS3jKeq6eb2TaxE3DVYYW6UHSlJvJq4TuCi0Y/EWQmHbh0iGVZO
	HPxDK7Z3oIaJz0=
X-Received: by 2002:a05:600c:3b18:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-483a94923bamr153889375e9.1.1771843535001;
        Mon, 23 Feb 2026 02:45:35 -0800 (PST)
Message-ID: <5c4c76f5-508c-4917-8fa5-9e3e2ab41926@suse.com>
Date: Mon, 23 Feb 2026 11:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] xen/vmac: Const the key parameter of vmac_set_key()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260220214653.3497384-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:email];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4A63B175148
X-Rspamd-Action: no action

On 20.02.2026 22:46, Andrew Cooper wrote:
> Eclair complains that tboot_gen_domain_integrity() is casting away
> constness (Rule 11.8 violation).
> 
> vmac_set_key() doesn't modify the user_key parameter, so it can become const,
> removing the need to cast.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


