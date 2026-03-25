Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBp0Kl6rw2nAtAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 10:31:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1B322400
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 10:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261803.1554568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5KZp-0007UZ-NU; Wed, 25 Mar 2026 09:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261803.1554568; Wed, 25 Mar 2026 09:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5KZp-0007SE-KJ; Wed, 25 Mar 2026 09:31:01 +0000
Received: by outflank-mailman (input) for mailman id 1261803;
 Wed, 25 Mar 2026 09:31:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5KZo-0007Rv-Ip
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 09:31:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5KZn-00FyKt-V9
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 10:30:59 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3ab52-bab6-0a2a0a5309dd-0a2a4503a898-12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:30:59 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3ab53-1947-0a2a45030019-d155dd29c85b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:30:59 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439b2965d4bso3426863f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 02:30:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703c7fsm45600471f8f.23.2026.03.25.02.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 02:30:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1774431059; x=1775035859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AOFWphkWWjRveNWf8Bwmoa61sWxixQrPMGYPVT7DGcc=;
        b=QQIT/TmaFP9I67aB7NLGaX6j998/ETP5GIJ7ewRY/yew0k4Y10sMNYR8Yc3Pbw8jI0
         u/WIB/U5A3aPsU6NqIqyJwhfjxauAP4llfJiSceF1OudHkSXtVYO98GsYbk0OPrnMmcV
         i9tbpRD+DLRWJwkWjddQU+0qhT08eOxRSMzYb0jJjC5gNtIQtQusdxPgbTSejIr3fKIt
         5g0xfUziORVQogsz0USm+iqv/nqX+5Q+9Vf26qbqOOn+FUzZuoLHywpGYmNESUq06rJ3
         AlNg39KT5+RxSDXLsTsca6TES5MFkuVPhvnAIUf7C1JSHGldBx4P4gYFSR5bvZAoU8/U
         qARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431059; x=1775035859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOFWphkWWjRveNWf8Bwmoa61sWxixQrPMGYPVT7DGcc=;
        b=j0yWCudD/0rQhFQ27AXM717Pq6MHP3NrnvGMXsHoI7y006sTbbHBwffCen3SYnY83n
         ypDequxRo0uZyh7lDV9xmH+Ym/iFmct3X2An21+ssDMWPaR154udYFAf3Dm38Kd8XK3u
         jMHMu/ecnRsQtVNBnVatZJ0zD/kIjwXBart8Gx9GlBz6fhCAufIKXtFynqT1W8bY1pKk
         axFN8SI7hm+rMsjuL6q+75Z4P1pZJ/H6qaabBZ16Gt3suX2o5hkDErtF3is+ioJqJuh/
         B93XefJpZd5EE/euUh2JG88Pe/orKbd+KkeCB6klz1k26AGz/gomYVRNYC68clT1pCbB
         Ezng==
X-Forwarded-Encrypted: i=1; AJvYcCWqQuPKP6ZTphpksQMV3uAMaxuo0OShIywQGEekkz7k6UM3e6eXejXi5eVRjrTnNEO6PHYcsJkDM5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy84aqy90XJXxHq7v2Ita0qpuyUh0vAMI1+KduWsm2BpwpVES+h
	vMSS2gz3B40tUXsLdSuTtywAh4Ym170PgUKTKPQ2grGMBU3OYOo0BbITnMHJn9f/QA==
X-Gm-Gg: ATEYQzyf9pWoaMt8QrEcdEjZUGJ9WCYl255L4FJDMIV1NtL4tayO3SpmtEwQWgP+v0K
	6XMQlmPI9JCX+t0OnykA4SbYGdWmECwmz2I48sngzxPOmzO1r5i+f1s8Bb2KdtcuLSB2i/zZ+LQ
	G570jgiI2ghkXZKw3oyyND86iCg46s+9q1e+vZx/XOdVOm37JF1XMUtb5020ATX291YPBlgmIDS
	Z+wHqdzMsQj1fJ5ngGA1REtlF9iqH8tEMbroEferN1ivA7xUg/ptJmpdu+jfW7XVzoVyk/UNYXS
	kUBE0zzzBogRw9CuWsV4rThB8+MjqAs1rS51BIhilwN5XEZzmzGXJYB7tY9jD36HVbKS4lGFeua
	vScbLL/1LKE1boLQCDKvYM7VjIpXojiFnOIS36qA4cT0i/FATkFVC3ZvpCFS7y8sji0XT/jFywJ
	8G3qp/08ycpIN2WBb1ZZf5nE9BmNU6FHbBmSr+JrFwmkOitIZcyvZCqxz+3Z2xjWTX8TqPcTfXI
	ciT2Z+K1D1O/WTjipGxh3h4tw==
X-Received: by 2002:a05:6000:2909:b0:439:d8cb:1392 with SMTP id ffacd0b85a97d-43b88a0513fmr4324315f8f.26.1774431058752;
        Wed, 25 Mar 2026 02:30:58 -0700 (PDT)
Message-ID: <33af69c4-3e35-4baa-abdc-57902a0db4bc@suse.com>
Date: Wed, 25 Mar 2026 10:30:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] x86: Remove fpu_initialised/fpu_dirty
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
 <20260324181937.2465574-8-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260324181937.2465574-8-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1774431059-EAC8472C-C5575400/0/0
X-purgate-type: clean
X-purgate-size: 601
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1EB1B322400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 19:19, Ross Lagerwall wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1409,8 +1409,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>          c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));

It ends up a little odd to clear VGCF_i387_valid here, just to ...

>      else
>          c(flags = 0);
> -    if ( v->fpu_initialised )
> -        c(flags |= VGCF_i387_valid);
> +    c(flags |= VGCF_i387_valid);

... unconditionally set it afterwards. Could I talk you into cleaning
this up right away?

Jan

