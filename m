Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKcGIBjEu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:38:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16002C8CD8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256871.1551346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39pc-0002wc-Ly; Thu, 19 Mar 2026 09:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256871.1551346; Thu, 19 Mar 2026 09:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39pc-0002v0-J9; Thu, 19 Mar 2026 09:38:20 +0000
Received: by outflank-mailman (input) for mailman id 1256871;
 Thu, 19 Mar 2026 09:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w39pb-0002uq-9P
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:38:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ad2b089-2377-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 10:38:15 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso5019415e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 02:38:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8b1fe65sm52722725e9.5.2026.03.19.02.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 02:38:14 -0700 (PDT)
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
X-Inumbo-ID: 5ad2b089-2377-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773913095; x=1774517895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0E1jdT84aMWdUrU+mv82LQHDdSY+qanWP01YXxfclZ8=;
        b=SY0y6maNPRbnWWVvu+/d5QYkx4srZvS3Y87J2ZRu7TWdeAf1N8JvLUYW8decP+5DTk
         ToqZ25OhlY81+BKXVOk7tsqolOni//5/hptZ5ZODhPsGvQTR7oQ7uNAIq/nZb0en+1hG
         BUJBw0FccUVqvwgoilTNmz/DeMv2HpenLbVxgLKKxxUkdxSN0UrkavW9Q+WXGq5VQD93
         gcdLxa7J/+FyIyICJN3zbTv2A4dPANgK+YnP5EBGcKmL+bt4mSxEbt3xd7hqLyzU0uJ/
         n2Rif0hyUD2eQEPVS0foJfXL20SJt50rsvNr8UWJmbGjONKUr7NSg6movhjIh6vuboRm
         NXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773913095; x=1774517895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E1jdT84aMWdUrU+mv82LQHDdSY+qanWP01YXxfclZ8=;
        b=dsIBFKUUtreA4QyTTB2Fjh1JAf2hfeBTds0DVH8K8Vdapp2HdXQINnysIX1HFoCCIX
         uHShYIuAbsLrikoGBeAdJ0W7MCqNVpHi13vRHgwBFFV+S9UZGCe2sw2atDAJ+PpinTdn
         ss9BM94NbObV784qPRDnGYBHSuveEqfmlE3cZbq3HEply+MC09IYPI94aFPqTb8R71ER
         E61PTJzQy+UefA6RbsFzCkl7RzNXh1Zt9UC5h+L6a1CspUnQvnX1bjoV7i3Y7sgpypB6
         ZKdzl8m8EkoVDqGvMiFLhl5Lf6Fmp2H7H7/POuXQoViWBDvruEV5rIuD3+Zqhc2uFlDQ
         isXA==
X-Forwarded-Encrypted: i=1; AJvYcCWP9OVGfd24ZJaWqN0IW9raxYWVBi/DhjjG/DiFSi5bxxhAB3bEg03eoITpIWxNodOGya8AeZQWiD8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBPpgsq/Z5sQLPwyp39A0fU5M3nVmvwHZ2knvjtNWxL9H1hQ6Q
	o5t7G1kKO9eYlF71yYeAjekPEzkspDzaFuuwm2UXFzjzMIDv3GezoQZPT8yUpjjXKg==
X-Gm-Gg: ATEYQzxT0kslmHi4MandvJoI8TWFkzPdBO/w956kQrwCCcNXm+Lb5eeYtwetD8TC5sa
	0piMjZHr1QsImsSd0TsMuQbT3RJdbjZv3xDE4HtfoWAhBli6Z5u2rMjGFRVDt0Eab/OIE2ZSS+L
	YWwePialE+3fPuOYvnyFy+kbmSFL2b+EdAp+8wVA15VW9u4bYpYXrG5KqYGMJkdzzOKIEpWz8hb
	WlgXOMN459+albBZwTUfIDhl80zAF+8H8EF3JVPw/VmLpfHsZuwiiQDqRsHg4ZypIwPWMbKXS6v
	VmJ/X0RzBC2FQPYhnP/xHBohFqjlNJkuJoCsLjYrPpw60dFA/udXdZVBd+mBXXF3uReIFaYsqbW
	QpMO999KSBMHvIZcvAIoNyGh7MCV5HA94H8ua1xGIjQU90aZHdbb2JoLBhvm7Bl8TGGDO9eMojH
	io6fv7JVXzlIbnxyiqldlOL2o6z0qJRer42NMaVpWZSp5kHX81zaJZfJiQ5vGj+OO7KUWlU9JQa
	NQ3V56paknmNNQWwuGzrPYy0w==
X-Received: by 2002:a05:600c:19d2:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-486f44435c8mr105289775e9.17.1773913095175;
        Thu, 19 Mar 2026 02:38:15 -0700 (PDT)
Message-ID: <03b9bdde-ad5f-40e7-afe0-107a471fc0a2@suse.com>
Date: Thu, 19 Mar 2026 10:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Exclude Zen6 from entrysign mitigations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260316120605.661823-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260316120605.661823-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: F16002C8CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.03.2026 13:06, Andrew Cooper wrote:
> Family 0x1a covers both Zen5 and Zen6, but the latter is not believed to be
> vulnerable to entrysign.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> This does want backporting, but it depends on 8e4775d118c327 which collects
> leaf 7a1 early enough to be used in this way.  So, it should hold off for the
> moment until the FRED backports are finalised.

Okay.

> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -59,6 +59,8 @@
>   * For Zen3 and Zen4 (Fam19h) the heuristic is the presence of AutoIBRS, as
>   * it's Zen4-specific.
>   *
> + * For Zen5 and Zen6 (Fam1ah) the heuristic is the presence of FRED.
> + *
>   * The caller is required to perform the appropriate vendor/family checks
>   * first.
>   */
> @@ -66,6 +68,8 @@
>  #define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
>  #define is_zen3_uarch() (!boot_cpu_has(X86_FEATURE_AUTO_IBRS))
>  #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
> +#define is_zen5_uarch() (!boot_cpu_has(X86_FEATURE_FRED))
> +#define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)

A more general remark here: This, I think, is one of the (rare) cases where
we may want to use the raw CPU policy, for the distinction to remain
unaffected by "cpuid=" command line options. Thoughts?

Jan

