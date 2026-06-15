Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X38lG4G2L2oAFAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 10:23:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77668481D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 10:23:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NV8dLQ6q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338051.1599065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ2am-0006Nh-QB; Mon, 15 Jun 2026 08:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338051.1599065; Mon, 15 Jun 2026 08:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ2am-0006L5-Ma; Mon, 15 Jun 2026 08:22:48 +0000
Received: by outflank-mailman (input) for mailman id 1338051;
 Mon, 15 Jun 2026 08:22:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ2al-0006Kz-Aa
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 08:22:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ2aj-00BPmE-MJ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 10:22:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fb652-5cb7-0a2a0a5109dd-0a2a450b9fb4-18
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 10:22:45 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fb655-212f-0a2a450b0019-d1558033b433-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 10:22:45 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso37213885e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 01:22:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492203bfb27sm262307385e9.11.2026.06.15.01.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 01:22:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1781511765; x=1782116565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g6baOI2xojFKk6nBmI/VcA2+TjGmEsRZzpOqmXG3pdk=;
        b=NV8dLQ6q0CvjZzO/cNvbwopWt7/s7+Yhovdw9did0Lz9c9VBCnASNx27YyeyF6Q2M6
         n8KnuxQ46GGNAMeT5K5Z4ceQquOMvxmFSzhSZxQoT5aU7eFxbXq+o9m4wyA/PY18RQae
         yjXGeGZ0LZfCBE1IoxO+shIxEETL6+FvWtUHQQfYthA2jdZ96Acx++vQgV+I2sRcJCdV
         10MwhJfugz8njVmlo/5vd607Ug+/6B/ZodY84xVRbMYdSqiuoJeAsBJz3nE6LSDes49t
         hd2V/CiPgpsevwITgV3ncklDxv7FeUDo7nTkHx4CtH+sxTBFY1HM8dJe+QWHUyeXn2D3
         mTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511765; x=1782116565;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6baOI2xojFKk6nBmI/VcA2+TjGmEsRZzpOqmXG3pdk=;
        b=q8MTOFIjg3IxcTS6q/LHuv1Bi2C8b2625dA9hjGco1io5pjYitUs6tP2apz/GlZoXH
         t6YUqNEcZnN2sVSfRswd0thvblmvXJVQMwhC5mT7B3VZIfhvfwMbCmX7NIgM5VlHe+Gn
         6MUdzUCp9Yd0muhWx5LQAlLO5jpCsoRGpXUxgZrarTaeid/f2ASNgZ8DvTvVs35+YAki
         zCvx42v3c0wMnU4JlXFMBq7VC9eiuQR/IIHnba9lHpyLh1l2ZFNkd0OS6pgR7wJcC9zl
         Y8qpLIdT3DKzRmiDLyWaeMmZ1V/y6Xrj1yNo7/Udjf150sdPKjH8IvqARXgSLmzw9bNp
         qytg==
X-Forwarded-Encrypted: i=1; AFNElJ8D3Prdm/SeyhGXRfioU7p3sLJh7VUNlwD4BJAMSqJb2Fc/EFq8q7Tv4aPPshoNli5beh56ODxEqbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFTn/U6jFBRE3VYYFUT/hkgIr9srjTp6lYNILLOkRXwYTAMaA/
	xA6L03KNhnInsFvL0LH8QDZxudhwWT96hCXS0HLwgTbCnnpVerFo5NcCFaajJp4reg==
X-Gm-Gg: Acq92OE+Yqe4BVO91Bt60xY00VfaL+qT7SsCr0l2lTZBHl0WDWX5A3RWx19OmygKF6O
	JLAGe5izTYbYCMVFgVRKVZ2jCgjtF0MSCD9egjzl0UYckaVsIcDUnPeo/GJ5K/ZQy+hNXT3OcLE
	1RC0XR9ytKPsdFpM3AhGGBJPOV4hRK63O9k+DU97VheunPRZN9oz7DMWQy+b8NiXChaPK0Pdz4r
	WbHKc2n28l4XOZeBUEL9Ljfr1wTxl82NA+8atgNDVkCR8jXB3XJycHyM6OG7Zw3Zv9RSkiEqO+1
	ikiIL/uHZEdS9OMVinr82e45aHspe6qEfL2ZWsMEbStD8mQ5as1t6tdpeSRmsxOOTtfuPl2XSY6
	yW7svJYILefD5pn3RJFJSwuddh0WPHS882QqF3Yj4w1nFNSBNoI9Z5CD6Fx0M3drgWd90R86Wd1
	kzAATFkiZf+VqWggIOTx5TZBqMTQl+30KF0/se7yXWz83eBD8/04nVqrMUQ7RI98GxUcGaivl7S
	vsSGcYNaQzBjKo=
X-Received: by 2002:a05:600c:4693:b0:490:cdb2:fb5e with SMTP id 5b1f17b1804b1-490ec504d88mr199330875e9.22.1781511764604;
        Mon, 15 Jun 2026 01:22:44 -0700 (PDT)
Message-ID: <308c29f1-98e6-4271-9a27-01d405922cba@suse.com>
Date: Mon, 15 Jun 2026 10:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.23] xen/kexec: Drop the obsolete v1 hypercall
 implementation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Kevin Lampis <kevin.lampis@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260612102727.3121098-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260612102727.3121098-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781511765-18F66F3B-98AF72D7/0/0
X-purgate-type: clean
X-purgate-size: 1231
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,xenproject.org:url,keepachangelog.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA77668481D

On 12.06.2026 12:27, Andrew Cooper wrote:
> The v1 interface was declared obsolete in Xen 4.4 (2013) when kexec in Xen was
> overhauled.
> 
> The only known user of the v1 interface was the classic-xen fork of Linux.
> Linux PVOps does not interact with Xen kexec directly, delegating it entirely
> to userspace (i.e. kexec-tools).  Xen support in kexec-tools was part of this
> work, and uses the "new" interface.
> 
> As such, there's no way to test changes to the interface any more.

Maybe yet less ambiguously "... to the old interface ..."?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with another nit below:

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
>  
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
> +## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +
> +### Removed
> + - On x86:
> +   - The kexec "v1" interface, which was declared obsolete in Xen 4.4 (2013).
> +     The only know user was the classic-xen fork of Linux.  This does not

Nit: known

Jan

