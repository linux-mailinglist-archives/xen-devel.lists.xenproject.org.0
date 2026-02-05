Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIOwBfyChGl/3AMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 12:46:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68673F2049
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 12:46:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221815.1529943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxnp-0006WB-Lw; Thu, 05 Feb 2026 11:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221815.1529943; Thu, 05 Feb 2026 11:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnxnp-0006Tw-Ie; Thu, 05 Feb 2026 11:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1221815;
 Thu, 05 Feb 2026 11:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnxnn-0006Tq-NS
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 11:45:39 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 300f4da9-0288-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 12:45:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806f80cac9so5171675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 03:45:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483179d7346sm65272075e9.0.2026.02.05.03.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 03:45:35 -0800 (PST)
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
X-Inumbo-ID: 300f4da9-0288-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770291936; x=1770896736; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XKYdeorIhN6a8TiGdvI1xLIVgV+JHMCc78x+DSpvIrA=;
        b=IGIKL4qhfyRLc9dsDoR45x98wdQrlUK3V6XlqP6Q7le6goWuRnUX7Ix2MNxAhbscs/
         0gfJ02cn6DDmRd+1YuB4ww6dJUCvBm697aHxoqZ5ZiChFh/Fgc2/u9u9EbxOYfNyo+GC
         fCU1CDBHDbgv+Gbl0fKPGKEQWraHYsHs2MUrqEL26iYj2oiPPYy5DJxG8GdllmjHo614
         96R6im+qLRKuh55NzSe2R/dN+G8i5Se5MNzdbPQ8qAfHKm7nrXTrz0+WrwxMuqbXkBie
         IJ5ww72woDMaNGJZQE5UQBrWY9u5suUCRJjlTjvKEmAyYf3utyi0dI6iKsUt5MziG3YA
         zf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770291936; x=1770896736;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKYdeorIhN6a8TiGdvI1xLIVgV+JHMCc78x+DSpvIrA=;
        b=AazVVlJkAjYQeWy/WFaKT1i2r2O0wTUZDpUzCeqnMKZ/XZk/vVLvRE4Fl/8EmRtaTS
         xKFFKr9CKktjI/Kpx4ymHrSvDcwopy6VxbYIQN/5maE1IDewu4KHF1UUjRux4mBM4amd
         wuYVVJIyE8nwY82s0F3it1mRqiimWwSMW4dgP1NyHm4ITdcYsBMsMUQfbujEwZCPsMoa
         pqTiUPr5hDiJcALZO3GY0UIPF+V2JSV8BWytjC1YLH5Gs6ATt7ZHuWBCwh7M/t0fTI3v
         lZisJvy9OCdSAiiw0k16TOdLAfG2hJ4BhwXzOc/Zei+jU9/yJ7E2izQriL37tWRH2eDB
         oi5A==
X-Forwarded-Encrypted: i=1; AJvYcCVeuOoa1vfdLkDZNqER8dfr1BiUrGBtlpZ6k0FSa13TiURCcygSiyLXICATJ31384Z0NkBsEdmeDo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl/BZF0/eNLqyjS/thN+Jq2yJS7b8bTdN3KxpF63lCXM5+RhON
	C5mBik1HhkHAxXbRDuXZEsquzDgNhTFhbbo9vKcS54d05ZqfNPk+WRLq65lqGdYo/g==
X-Gm-Gg: AZuq6aJCtDM2hEoQXnM/mvUd79C+j+trMEYZFAKMJ+DIzNOazZZx1POD9SD0ba7ZYEc
	ejqmPF6vkRmhZ4uKeB+iwOTHZbGNRrG3lyNTAbbSRWEmYmRKSv8T+EbBEtReTkAirfv+xr7aq9K
	e6f2cxhtSwbr4303ZdxEiVRViAscUPaZru5244YVVWYZXYsiAVGEiRtfRfM6YYH8o0NtQpgPMpJ
	UR9+2WLPEZ/5Rq03e4J3yBfYYYZKPDtwmBs25LEZGYSwXPEdWWmFx2QKbLOsvn4SisJYG3VWJTc
	7C+35LYAZD1uX6FJve3OQpnI6NUeLsJhvo52v3vQFcdbB/28RGlC+4awOpmo5Sgc2aKqf78CqXr
	KbYUPPHP6s4LFconsCkmvJdp0FB1uFCsNH9Tp37ouvVL/iqqJCls5ohbrJD5DndwC9U2Tw0re1k
	i34U47srOSPRVAJ4XxVwiG0l5pXXnYp0L5xW26xGgKpWwTt1DFhh+9luvBGAozZs1mgUjXIZ31u
	hs=
X-Received: by 2002:a05:600c:3baa:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-4830e968e57mr93549405e9.17.1770291936533;
        Thu, 05 Feb 2026 03:45:36 -0800 (PST)
Message-ID: <1a0c5e48-5457-414e-89c8-0f12cfa55a96@suse.com>
Date: Thu, 5 Feb 2026 12:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: Use MFLAGS for silent-mode detection
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
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
In-Reply-To: <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 68673F2049
X-Rspamd-Action: no action

On 05.02.2026 12:33, Bertrand Marquis wrote:
> GNU make 4.4+ exposes variable overrides in MAKEFLAGS after "--" (e.g.
> O=/path, FOO=bar). The silent-mode check searches for "s" and can match
> an override value, forcing silent output even without -s.
> 
> Use MFLAGS for short options and filter out any long options before
> searching for "s". This preserves -s detection while avoiding false
> positives from overrides.
> 
> Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rule")

I don't think this is quite right: make 4.4 post-dates that commit by about
2.5 years.

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Nit: No blank lines between tags, please.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -113,10 +113,11 @@ else
>      Q := @
>  endif
>  
> -# If the user is running make -s (silent mode), suppress echoing of
> -# commands
> -
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> +# If the user is running make -s (silent mode), suppress echoing of commands.
> +# Use MFLAGS (short options only). MAKEFLAGS may include variable overrides

Why "short options only"? It looks you mean to describe the macro here, not
what's done in the ifeq(); at the very least it can be read both ways.

> +# after “--” (GNU make greater than 4.4), which can contain an “s” and falsely

4.4 and newer really, as 4.4 itself is included in the affected range. I'm
not quite sure anyway whether the comment really needs to go this far. This
kind of detail can be had from the commit message of this change, if needed.

Happy to make adjustments while committing, yet I'm not sure whether you
agree in all regards.

Jan

