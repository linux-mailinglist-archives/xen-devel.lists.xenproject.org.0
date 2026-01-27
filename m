Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAXDBW7XeGmUtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:19:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE896886
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214930.1525174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkpw-0003Pm-8c; Tue, 27 Jan 2026 15:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214930.1525174; Tue, 27 Jan 2026 15:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkpw-0003O3-5S; Tue, 27 Jan 2026 15:18:36 +0000
Received: by outflank-mailman (input) for mailman id 1214930;
 Tue, 27 Jan 2026 15:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkkpu-0003NU-F3
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:18:34 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71235b1e-fb93-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 16:18:32 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so685418866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:18:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b419642sm815958166b.28.2026.01.27.07.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:18:31 -0800 (PST)
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
X-Inumbo-ID: 71235b1e-fb93-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769527112; x=1770131912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KNigdRr74qq+jkaoZzcUK4eaKZQ83q+VeyOdY5hB6hY=;
        b=JO+ZfcWJQre9c5FcVEKpVJGUKOgWEffJYfcao4VtH7VuEMT38715f0Jqfhai96u+t5
         CbXS2Hbo440OLYM4MSFXPfNGNGAEu6gXa4F80WuSMakEpKPrhds0jZXBs8/tCDctYDQL
         IXTm6ldqNLaFgNwXfjYWQwFMfw+h6YZA9MKW/JSOjLQ+lYspNTMGgvxd1qL36SE6Zcts
         vSXoZaEZKoBzfWg0UQ+/l2f0DF8c/2cmDK50ERny3JKBR8KVKVGylvHwMHRo1NyQwVMt
         aJ5VKYTLsMpDTd7AH+HmXxn1MKi0bB3Ro8dVJO7ie6wF218K0wji5DwIfedqMFRR1oIk
         VS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527112; x=1770131912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNigdRr74qq+jkaoZzcUK4eaKZQ83q+VeyOdY5hB6hY=;
        b=kQrUUcqjcSD02qoqxC0kb5PDtU9UaZAztVGptg7uUhpqGxaHZlrpPR5Hmu+/uagrbi
         Q+tVi7Ts8xrH44ubx0qetc7ddCIieznM3ambXMvBddwi+O84Pzf4rkKQCG+aA5nHUJ5N
         j68MnLVAi36ubncNZaBe5kGz+72EpyJOh4JSYiETJvmGPJKbaKPKWbKWtmyTr5YJZHG9
         I+h+aSdTr/6+phDRkJdH6ava2qJKNj+eXBfOu+glZYXDQ2PnnzRUI2cde1u14DrrCldk
         CaTvtEdbqB/yKVK9K7w4y2KHaq+fYFUIZHgzreKi7pNeE3qLIaqTEud2/+d7TNhPL6wD
         U0HA==
X-Forwarded-Encrypted: i=1; AJvYcCUPEh65VYcDF/52+95IK5MxjxKwSvBtpHN5P2hkjGkRix0X8LimQguPUre9Uv+Nx2aonq9BWRX1CYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+I2TSn+ebQMsN4ezR8Z4+XOLwWgWaw/sRDOvt/L6aY+Hthoie
	XhcqgeVGowADorAV00saL/48NovS22I0HPJHGPkwiLeX1ENAhaUAcaIX4oIKfRckiw==
X-Gm-Gg: AZuq6aIlh8xwH2SbMK+/TDniVhPHff7vpbolU5AM52tXJV/QPNhAoaSKHRSlVCUYWbW
	dNkE0tAWY0sZ8imjDsD0iFvHpsekLMAuELg1gNIL+eLOncQvy8tDjXW+2I9NZDRXtyBE+2NpRhl
	pm2sI2/TbnLCxpJnXzGeCaMCLXdUdRgO6U7UAqiaKYpgb5AR2WBRS6Of1YUt/xysfF5BYpNUjwy
	To1Mk3nRmqtL4MNZi68JanPUtSC+U6tEq4avh6ms0e2/mBv1e59cz0AysgsbteZMf2g9HiM/Bwn
	X1/6Wfr5tewLkuL4T8c1Hnl9O4pzQP55Q6L5mJ0bdqNRMBa6AmoBxK4i5vvyegJ1v8Ao9OAAxpb
	JQErRvfMiMt+nq8lhpRNJ/9tsLVbuYUMs0URm0/duRKemzTGf6WjqY8jJU7jsvBhwFfK9rmTlea
	15gCxJVy7zMyxx8bZ/k1kC0BD+AiFdLJVZLqY3i9ie/xH7ueitoV6vcNLR/K5+xWc0Kj68MuSII
	DEsM6q80kJoUg==
X-Received: by 2002:a17:907:d22:b0:b8d:7c0f:5bfc with SMTP id a640c23a62f3a-b8dab4c7003mr158164466b.64.1769527112068;
        Tue, 27 Jan 2026 07:18:32 -0800 (PST)
Message-ID: <e7036c68-6009-4c44-bbc8-1cf92dab718b@suse.com>
Date: Tue, 27 Jan 2026 16:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] x86/intel: Always check MSR_MISC_ENABLE on all CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-10-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E3AE896886
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> Currently, the BSP only leaves instructions for the APs to adjust
> MSR_MISC_ENABLE if the BSP is found to need adjustments.  Particularly if
> XD_DISABLE is needed on an AP but not the BSP, the system will triple fault
> with no information provided to the user.
> 
> Rework the BSP and trampoline logic to always read MISC_ENABLE, and clear
> CPUID_LIMIT and XD_DISABLE if either are set.
> 
> Repurpose intel_unlock_cpuid_leaves() to be intel_check_misc_enable() and make
> it static in common.c.

Being able to make it static is of course nice. But moving Intel-only code
out of intel.c isn't. Personally I'd favor it staying in intel.c.

Jan

