Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CvcG9WjpWngCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 15:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34221DB2E3
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 15:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244279.1543721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4bg-0003Zo-Ay; Mon, 02 Mar 2026 14:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244279.1543721; Mon, 02 Mar 2026 14:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx4bg-0003Wh-7n; Mon, 02 Mar 2026 14:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1244279;
 Mon, 02 Mar 2026 14:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx4bf-0003Wb-8X
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 14:50:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f40d36c-1647-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 15:50:41 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439b7a87fb5so640404f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 06:50:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503424fsm11376873f8f.22.2026.03.02.06.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 06:50:40 -0800 (PST)
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
X-Inumbo-ID: 2f40d36c-1647-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772463041; x=1773067841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=olwvB+jj70z4Qp6+y38rWMh4PGJTz8qqZg+5vvB8Bi4=;
        b=bj+t/u+heQkUWn8jBSONrdWeVm2YBqQ3T0ZD5zAqWwi6gMXksX/64ftHwqHFNd3vmK
         1Y+EZV4OBZWWYZclU63Fo1kH87SdoktvDc/nh67PyrhqvKCMGAcHTWn8bGibndAKg92d
         ufkaPR2ySZv6a4mUCYJdu8qVQks9j4dD8eujZ4Mwiqm4GTQZ+aoOJiB9VD6iLb0uacz3
         4ABs70grZfaB52Bc5B9KzKkJOMyh/JpDaF5h4GmGgO4vLOtT35ijLMD2ZwUKGieUQ/sj
         Ji2vzcBtNEMXCGgAOLxCU1UO7FziL6sPTUgSoOsVqj+lGpVqh+5WklwDnDAAZQdInF7x
         nMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463041; x=1773067841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olwvB+jj70z4Qp6+y38rWMh4PGJTz8qqZg+5vvB8Bi4=;
        b=PQMvGBE8QWgMQjaZ7EtoaSdAhtCRh65Ek3prNtX7gLag1qGI+t6WqoAKSf4mfcUm6F
         RBxV6pEV5fsISDVG1Bt6FQ8I9YE7zot6BjY8qRGC9vK+siR6MoR/emUdA/91vX6Bt1e3
         uuUzMgLpV9/sIQdRt1m/ya0Bam2ZGgtHYnF2g7J8BFfyTwTDCCU5QW6rKv5uM4n3Kxzk
         5e4LkAvbGsez3775G/MdNYMRUD3+1TAQLDDrKzZGBP08pLW0wKzS5Ky0s/8uPW71P6KQ
         0EEycPG2q6nbOWuduqJj3R4wc5TLBeZhyDNWZUzQ5IxOy3Ft9oEnNYzHrznGqy/VR5E8
         xayw==
X-Forwarded-Encrypted: i=1; AJvYcCUV9xMabRSrkTWd3B4ilbrUHgUP8GJviADTRfVHFqTjw0Ug6UdJX/l1YXga7egc+oUpZopaqq/lInQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9c/5pwv+9Z9//fkd4zvlgnYBisaR1XfRqVSNCT4p398K+rU+A
	GUS4Zhee7ltbqCO4Dnd46YWkgsD/9yAarIWdkKn1rZWJI/Huy1XPnVhQRq8rIU3FLw==
X-Gm-Gg: ATEYQzwsxVErkoLhcIGMcUuDugB++4PG0C7RwMMqKR5pG0eq5bM56EKjaseMZIuqTAR
	hK4zsSKExUWyPe20+j/YcdT68Od1d8Tx6yHNMrsImBfL6HjKJtwnZnRkAOgJT2aUfMj8CHTnc9o
	ATUxMbXirPzSwu0dwdsZImt9vGIkR+P7qWMMoKlNBcS2pArcOYrT81fFzBwLlNxupKl+Ct2MjiN
	VLZgroLAMNAZioJHwLQ3kRGx/N6VUMelR78pfLOAkJuM2/xCr36cVtBvT4+zvnhrU6wSu49pAoD
	9K2ht38VVsCTPL9uzyyA7CTmFBgJDfSuhaeLWiBBBF5RBkIpl/McXfs4VHOYgWb7vddOOUurohQ
	3tGAwlZeQlK5SvnElUd1wPI6vQGNPxGloGhxorsgnkLfyJMCE0Zgeu2JnZA8WGVqVt1Sa96LO3C
	S++R/0jfuexFvfMHSAWrWY17A+d5k4IRb06Kun8mG4wIX6Bad37BMjdn0r80dkrU00/RoQ8jUZJ
	KNrSDAX+ce+pa0=
X-Received: by 2002:a05:6000:2001:b0:439:b4c9:9061 with SMTP id ffacd0b85a97d-439b4c99198mr8946651f8f.5.1772463041130;
        Mon, 02 Mar 2026 06:50:41 -0800 (PST)
Message-ID: <f3e84e41-438f-4a28-a2e6-863f818e948b@suse.com>
Date: Mon, 2 Mar 2026 15:50:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] x86/traps: Don't configure Supervisor Shadow
 Stack tokens in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D34221DB2E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 28.02.2026 00:16, Andrew Cooper wrote:
> FRED doesn't use Supervisor Shadow Stack tokens.  This means that:
> 
>  1) memguard_guard_stack() should not write Supervisor Shadow Stack Tokens.
>  2) cpu_has_bug_shstk_fracture is no longer relevant when deciding whether or
>     not to enable Shadow Stacks in the first place.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> The SDM explicitly points out the shstk fracture vs FRED case, yet PTL
> enumerates CET-SSS (immunity to shstk fracture).  I can only assume that there
> are other Intel CPUs with FRED but without CET-SSS.

Isn't CET-SSS still relevant to OSes not using FRED (much like you do for
the fred=no case)?

Jan

