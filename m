Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNI3IwO5jWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:26:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011FF12CFCB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228794.1534899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUqK-0003Cd-VJ; Thu, 12 Feb 2026 11:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228794.1534899; Thu, 12 Feb 2026 11:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUqK-0003AI-SK; Thu, 12 Feb 2026 11:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1228794;
 Thu, 12 Feb 2026 11:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqUqJ-0003AC-Q7
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:26:43 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ffc496-0805-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:26:41 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43622089851so2847337f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 03:26:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d30f6dsm10659698f8f.3.2026.02.12.03.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 03:26:40 -0800 (PST)
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
X-Inumbo-ID: b3ffc496-0805-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770895601; x=1771500401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bJgMNSyfVxMOJ5zA27aLzggAh0duDDgQYh/XvNClOII=;
        b=FLCQxdiWTEn9caeNfK4gv7iVBk0450DkLquHGQNcvIgkn2bZgJEReU7nXmymAMbbWO
         eQdn/5Z38cCQsqrwJr4P7w0u65A+tYeQsyfrzmSK5xR7dU/qXWnOwP2d7W3nOwm3X8Pv
         id42DbQe+k1a+X6j25BEgjjORg3RNbha7FO6/UgmXOjOGAc/LCDQuQtaYaJ803bXw4Ea
         TaSla6t88tHDIQqauuX2YY0NqRonjhk2i527aUmgbQPv3U1mZDetVoZeXASgQWuaRdM0
         jV1UCYqnlyIE1uJa7HTRlcV9sXKlP/QN1Zze60w36tPHF8JKAFQWMiqDnyHwqvHhVS1V
         HmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895601; x=1771500401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJgMNSyfVxMOJ5zA27aLzggAh0duDDgQYh/XvNClOII=;
        b=R4Hmhi+G5LkEBeGkRhxY03wQi8RxEyvfdjsdR8JWrtNieZMs8iG/FYRFC4kRiKgFJi
         ubHVVfDs1BVHnE8VWuRgifNhJa+fDG3OGfF8FOVqDMNPz55ws26c6G3Inz2sODNXBh08
         8ZG6zGb66U0PJgI1o5H731Ds34F7cXScwHqf7Z74ewrIMEGYb+C1wSYbTyZMSHy96/rY
         BmRnJDOfHdcjY5B6RfaYOf6LJtutA+rw+Lau5W2W1xaqyq8Lj/zBLDzNMLnaocWgqe8V
         iLetro5MzpRi2nn11naLdRrAF8/GE5Nbtufmhiw4w7hPV7LOHGtUxlJ+0rWGOXBHuFnR
         AR0A==
X-Forwarded-Encrypted: i=1; AJvYcCWEllwgosx2rkzVGqPQlvs2WSIprAda+dQkO88rOshC3zEM5gQhUVX98BlTFWWP3gDTMeFbO7Nx9cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuncWktGhvSZXPXMj4ArcvTJ1bfsWBWoC0SdeztZQ0XqfbiTIO
	gXfoMjlN/N65PH+OxaIn03dQXs8TwEl4pdNQZGEgO96RH6NHQi3HGjvpCbHO6vJLDA==
X-Gm-Gg: AZuq6aJm0J8O3r2Sv0a7FONyGCHjcPbywJNZegDiYwNIh+mrm85mU0c0unVOqdp/BPq
	Mk4VsR5/pUXcbh4Pu3Rh5v9/KXJO+q/ViHy6AlYEY0x9VpfBQIVVnm6yq3wYfeZyxQipxcNcpgJ
	BZ5JaMEDOyT56O6Sj52cwyEbEoMakdfPG/3GXDsHh6chDEWKrO5jOEhu9/cy5sGe51+8/0X+TeE
	E8Sknm6bJ9Ka1brwnh3CNmI2z0YWlWFgZmWJNa+1WMGVlwskp0tg/gDaujyUzNrJCVXhJRFIEkS
	ZKO52RO89GIsBRkGzCpankgai8d7EgIM/cYeu+QqEC3NOLETMuS4bRp31+EdzW4WIBztCJpPoK4
	nsqFVUD2n9Rt0w0H1k3wggu7XC8KEP3NY/WKgvsdvG86eIfDOzS+XTWTfMGH/c90MO2r42xlctB
	xl3B2v+PfHLETPBMXtoSmPzahaf7ogrPXnVA/9MS9ry4go4ZQZc89ZRlRAAtBYh1smG/bgf9xVL
	ISPJP2Ksb0OUOc=
X-Received: by 2002:a05:6000:18a3:b0:432:dfea:1fa8 with SMTP id ffacd0b85a97d-4378f167793mr3666159f8f.45.1770895600788;
        Thu, 12 Feb 2026 03:26:40 -0800 (PST)
Message-ID: <100f63bf-cc79-43c3-a0f6-147d2dff080d@suse.com>
Date: Thu, 12 Feb 2026 12:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] x86: Have x86_emulate/ implement the single-vendor
 optimisation
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-8-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-8-alejandro.garciavallejo@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 011FF12CFCB
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> Open code the vendor check through the policy as a one-off. The emulator
> embeds amd_like() in macros and is called in MANY places. Using a
> local variable (cp->x86_vendor) makes it a lot smaller (300-400 bytes
> smaller). So treat this as the exception it is and let it use the policy
> rather than boot_cpu_data.

As elsewhere you mainly discuss benefits for the single-vendor case, is the
above about the opposite situation? Else why would codegen suffer this much
here?

Using cp also is preferable for test and fuzzing harnesses, which don't
even know boot_cpu_data.

> @@ -30,8 +31,15 @@ void BUG(void);
>  #  define X86EMUL_NO_SIMD
>  # endif
>  
> +/* intentionally avoid cpu_vendor(), as it produces much worse codegen */

Nit (style): Capital letter wanted at the start.

> +# define x86emul_cpu(cp) ((X86_ENABLED_VENDORS ==            \
> +                           ISOLATE_LSB(X86_ENABLED_VENDORS)) \
> +                               ? X86_ENABLED_VENDORS         \
> +                               : ((cp)->x86_vendor & X86_ENABLED_VENDORS))

Nit: Indentation. The ? and : want to align with the controlling expression.

Further, is this a good name, without "vendor" in it?

And then I'm of two minds here as to the use of the macro parameter: On one
hand we can be pretty certain what is passed in won't have side effects.
Otoh in a hypothetical odd case (seeing that this lives in a header file,
not local to an isolated piece of code) where there would be one, the
argument being evaluated unreliably could cause an unpleasant surprise.
The more ...

>  #else /* !__XEN__ */
>  # include "x86-emulate.h"
> +# define x86emul_cpu(cp) ((cp)->x86_vendor)

... that the same wouldn't be observable in the fuzzing or test harnesses.

Jan

