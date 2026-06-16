Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JnpSEFVDMWqlfgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 14:36:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA368F659
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 14:36:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QwU55tWX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339186.1600327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZT1j-00056Q-Ly; Tue, 16 Jun 2026 12:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339186.1600327; Tue, 16 Jun 2026 12:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZT1j-000546-HR; Tue, 16 Jun 2026 12:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1339186;
 Tue, 16 Jun 2026 12:36:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZT1h-00052v-Rk
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:36:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZT1h-00FLaj-0n
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:36:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a314331-e002-0a2a0a5209dd-0a2a450ac57a-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 14:36:20 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a314344-56b3-0a2a450a0019-d155dd32e4bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 14:36:20 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso3047355f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 05:36:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea961f18sm339903885e9.2.2026.06.16.05.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 05:36:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1781613380; x=1782218180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qjkt+xX1tHIFNRgs5C18PWlmRBvQl4r9HAbI4bVVrmE=;
        b=QwU55tWX+unTI9e/wMJ3VC2rXOTtSgwvrWo2W3mUYENDDzCKGqCWzULqpIIcEw6GsR
         wIHkMDIY+oWxe7fTkJswL2Kfi8BYxPrCUYA7UBGTssJ4HQd7pqnKIGiE4tGW8I6dDc3Z
         FoD3WPu/hcjBUQnv7Ti98K0UqyhEWKvwaUnHHYP85Dlq9nfLYYAxBffMnUjzQd8AQan4
         dq+hXz2z6XX6fIKIs81zpZyVzCJubNuwAoVkMrr0IO8AcFgYmJPEeJ+3HWbxRQvCXyRZ
         4RTI1oMo23adMZB1R32gLPD4IECr3oSo3RallGGt16oJitFGMXRozZgL1bWUcAhZgvPq
         miGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613380; x=1782218180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjkt+xX1tHIFNRgs5C18PWlmRBvQl4r9HAbI4bVVrmE=;
        b=qraXPKU0JGprm/6mRj5Ef7jFsFhoKmutJV3z5SZ4JA3axKXXhH2sMA18gF1CCXyyjb
         5O61EDeV515W6qYCAY3aOAT/ouUWHz55L7gtvKWPvVu7fi8wxL5iWrv/2hd4uHj/P2fa
         heKDWiIAfEZNgO7EcTo5x/pGQHz4WhySZZZedK7LdIe66JwPurZK4u/4cz1Irk5WtHNc
         uAdRcp59EYdwqx7CL8MLxvrbmQ4sECWQDgsntsCD4Kmn3pHVXad6bWNX1yEGbWP+PaA/
         Vh4OvDy2MFoOnH8TJWYtQs8IRsUd7WAYWkRvBwIxZvo9HHhzY80ljhy/tlEHgVGxQEdm
         468g==
X-Forwarded-Encrypted: i=1; AFNElJ8YhQcPXVXAoFxIMDTTs1BQgJoMGEhS0/3DUXDZt3VWyG/p9PyR6gjywZLopu3YDzAXuQsfCfbbT00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBu+tdPd2o5Sof0iXzkRbrFJJARtPflwEIWMU1X30e1+neMmpQ
	XkKYtHFk/ZeaxCMB7KVNDaTb/VjMCB7et36sNur2qsIK5e4d+sQxyAlaOwsMjk4jNA==
X-Gm-Gg: Acq92OGAIj+stw+Yio/iZUiuf6y/rSuCMkt+hrB3PEBt5oWLXe1CML8VDO+C5g/L5io
	WJrtQD7kh3UV+07g2ZFnK0B0jpNwgaRs6mgwno6E7jb52ROAIBqLaVUg/uRuBMI8hOuJqO8onS8
	M3lQd1m1FawwXS8AJnbs+17pn3e19foZ+wearliOrOXLxtK2g9Bngav9QNJQAXjIVD3TBNyPzCp
	YahHo9ckWIihn9JQ3l29sGKDK8nwB822h2YVeHuvmqw8+S7QdtDP3ey4bk1iKmwjHHVWXVAheo3
	oFbMLk7+ANkao0k62h06iH6YUiwbxWd6mDiwU48j58mzaGqXUJKMUGubDQ8h3I1cnxRUgT0egGX
	1l/VR2F92A6G3Y1Z1MbxXN8a7yErtA4olwLn3v+KOlRVRc0YW38agTjRpt4brsW9uXgWRUvYaUt
	6LJFxYkeAGTIpxIN7ltXzPmpWP2RMlvahsdF6N+zAJ+vSuYpKm0wHhZ2+bX+H5lqLhwxmAkBVYQ
	oY/9t4GZBvACkD7gKzUi7HGWg==
X-Received: by 2002:a05:600c:3f10:b0:490:bad7:3634 with SMTP id 5b1f17b1804b1-4922ffb6c1dmr50003575e9.19.1781613380398;
        Tue, 16 Jun 2026 05:36:20 -0700 (PDT)
Message-ID: <ef1f84c3-68c4-4619-9e32-b008e91725f5@suse.com>
Date: Tue, 16 Jun 2026 14:36:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/ucode: Exclude Zen6 from entrysign digest
 checking
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260616104534.22995-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260616104534.22995-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781613380-6FB5F8B7-AF12B5FE/0/0
X-purgate-type: clean
X-purgate-size: 1046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,boot_cpu_data.family:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CCA368F659

On 16.06.2026 12:45, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -128,7 +128,8 @@ static bool check_digest(const struct container_microcode *mc)
>       * the digest of the patch against a list of known provenance.
>       */
>      if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
> -         entrysign_mitigated_in_firmware || !opt_digest_check )
> +         is_zen6_uarch() || entrysign_mitigated_in_firmware ||
> +         !opt_digest_check )
>          return true;

Besides being somewhat fragile towards future changes (to the family range
covered), this also sets a bad precedent towards the comment ahead is
is_zen<N>_uarch() saying "The caller is required to perform the appropriate
vendor/family checks first." My understanding was that a single family
should be checked for in all such cases, not - as is the case here - a
range of families. Using the (seemingly) opposite is_zen5_uarch() wouldn't
be correct here, after all.

Jan

