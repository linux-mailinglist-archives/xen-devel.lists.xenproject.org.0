Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPYcCSSAjWmp3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:24:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74112AEDD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228420.1534599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqR3W-0007TZ-4g; Thu, 12 Feb 2026 07:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228420.1534599; Thu, 12 Feb 2026 07:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqR3W-0007R6-1T; Thu, 12 Feb 2026 07:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1228420;
 Thu, 12 Feb 2026 07:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqR3U-0007Qz-Gq
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 07:24:04 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce9c4e19-07e3-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 08:24:03 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so11486105e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 23:24:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm77244195e9.8.2026.02.11.23.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 23:24:02 -0800 (PST)
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
X-Inumbo-ID: ce9c4e19-07e3-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770881042; x=1771485842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jOpneSJBbwAN6aS6wQfFmE03qDcmY636ojL93q89KbM=;
        b=KN9gUBKb+e0NSJW8wGxs47ZlYCUh3JXauwHii0Lf7tcf8OFbpfdOsvxHPIZMp8Sxga
         /ezIskVRf929gVJ2BZKreyBjY5AkvDivkCh6JfblcvNdzF4plQzMTUrfukLUXCQAVaW3
         +UI5xHMjJwpwcsEbdvG831tfa6hPW/5XgsGCGvVAiIcn063brdJ6DUWRyE1FzgYw+6Nj
         bVyg5V4QVbezILeMg82MEAbx50GharZLrX9Niy+DAXHAeHyFMBXw4nEb15GLV0OHvrSW
         zMeArZ7EOobAkaodwf5l6vErXsGSGRicRoN9JCFBbSbvVxAcGrvHqPzlKLpPCAUJzfK0
         WP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770881042; x=1771485842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOpneSJBbwAN6aS6wQfFmE03qDcmY636ojL93q89KbM=;
        b=SHfNwrFDJHSvBwiYMH0iIJ3Gz7mEkoq5ieqVTc3X8fMjodg3CzgT2+ED1HbVT+xeTW
         0twju0lGqI+vy4pqaydF9W7YSEmSnuXYXkdGUr1xvHa0GK8DO9Sh/lCfNiiCULFcj4BD
         VL1d3ACErHPk1CQRZB4k2fNWZzSjgl9qz9XKPdD6i0J/1DUKHfLaw0oaMRCkGqHncpB0
         LVnVtXhJdr3rUeMczA60yM+k8TN8vrCfRZAv7ySt2LkVtYrSt3uTK9LkGlLr/HV0FyGc
         BZNpAFJmkXGvKd3fttRkih3lOKMgWei9w4yCHqlsnpsOFX7VuD/eey1dl2svmlhnP/KJ
         dZWw==
X-Forwarded-Encrypted: i=1; AJvYcCWh0dxtgHkkdKS7BHxQNryyAXJTyzSrgYwJzP6Mm/Y1G8FFg26in28qgEnfnX8xyYh4GEMCKnCyF5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDaVWfwwvk/lUENVtMgwH08tunOwnLoq0c2vf7skeuOllQUHj/
	LmCAEUKbRG4b8fLdForJapxev7OgTxapaRaBPytYvjhb7J1f1jR572k22oXFAo+zQA==
X-Gm-Gg: AZuq6aKI31Jgpt7NwH956EdpZKS79g27tRxKII2uZxgkR7nATSPSsx8AHUbqwQCQ/sA
	5omOFhDOMkb60Ad2JHK+JJJ/ZlSvGMR6aXNuvGi1UhByQACxAT40CY/fMpXGCsqlFgW0cGKSSMa
	FjDN6f+Cx98ERbW+EAuYhOzd5sTtuS2PCU7/o2yMsQ0nMtpllkqZNDnDHo9hWeba7V44l61xfnK
	nHggIHbO5C1OqCnIt7Pc/0mlAqqQfVHnqmk3J04pgK5YDNoRfN6bxoFddhvnHghoMl2N1I/zu4p
	7bzaRPogPEj6sa9cVgEC1/I3aCPPrspvyIWGAIGxjQkeLilXckUzd7DHKEF+IP7KmtnMojDMdnV
	GwKE0mxEkxM+Nuv9/NmjAFICi0iRVA0cnEiaOvZrzsAnVybPo2DaG8vMOWMWpMV58NAZVlFWAQv
	YKPMEJ6gU2q6p6rqLau+LvtYzUGO0Y6lAyZquatYclJdN+ttR/rZ3Xt0nX4NC+h5scY2CeLNcn+
	3GDZx1BH8pq3XA=
X-Received: by 2002:a05:600c:a4a:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4836600801dmr21828595e9.8.1770881042509;
        Wed, 11 Feb 2026 23:24:02 -0800 (PST)
Message-ID: <08f676da-69c7-41a0-8f73-0dfad1054c4f@suse.com>
Date: Thu, 12 Feb 2026 08:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86: Add more granularity to the vendors in Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
 <b284e16c-cd99-4595-8fcf-264c378fc57d@suse.com>
 <DGCBNTE7OB2D.3M7278B98EYPZ@amd.com>
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
In-Reply-To: <DGCBNTE7OB2D.3M7278B98EYPZ@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 8C74112AEDD
X-Rspamd-Action: no action

On 11.02.2026 18:51, Alejandro Vallejo wrote:
> On Wed Feb 11, 2026 at 5:06 PM CET, Jan Beulich wrote:
>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/Kconfig.cpu
>>> +++ b/xen/arch/x86/Kconfig.cpu
>>> @@ -19,4 +19,47 @@ config INTEL
>>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>>  	  must be enabled for Xen to work suitably on Intel platforms.
>>>  
>>> +config HYGON
>>> +	bool "Support Hygon CPUs"
>>> +	select AMD
>>> +	default y
>>> +	help
>>> +	  Detection, tunings and quirks for Hygon platforms.
>>> +
>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>>> +
>>> +
>>> +config CENTAUR
>>> +	bool "Support Centaur CPUs"
>>> +	select INTEL
>>> +	default y
>>> +	help
>>> +	  Detection, tunings and quirks for Centaur platforms.
>>> +
>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>>> +
>>> +config SHANGHAI
>>> +	bool "Support Shanghai CPUs"
>>> +	select INTEL
>>> +	default y
>>> +	help
>>> +	  Detection, tunings and quirks for Shanghai platforms.
>>> +
>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>>> +
>>> +config UNKNOWN_CPU_VENDOR
>>> +	bool "Support unknown CPU vendors"
>>> +	default y
>>> +	help
>>> +	  This option prevents a panic on boot when the host CPU vendor isn't
>>> +	  supported by going into a legacy compatibility mode and not applying
>>> +	  any relevant tunings or quirks.
>>> +
>>> +	  Not selecting this options while selecting multiple vendors doesn't have
>>> +	  any major effect on code size, but selecting a single vendor with this
>>> +	  option cleared produces a much smaller build.
>>
>> Shouldn't this option's prompt be suppressed when all other vendors were
>> selected off? Else the degenerate case can result that I mentioned in
>> reply to patch 03.
> 
> You mean having the option disappear when any explicit vendor is enabled?

No, I mean the prompt (not the option) to disappear when _no_ explicit
vendor is enabled. Because of the select-s above, that could effectively
be as simple as

config UNKNOWN_CPU_VENDOR
	bool "Support unknown CPU vendors" if INTEL || AMD
	default y

Otherwise, as indicated, the conditional around the panic() in patch 03
degenerates: The panic() would be skipped despite UNKNOWN_CPU_VENDOR=n,
as with X86_ENABLED_VENDORS being 0, cpu_vendor() can't tell
UNKNOWN_CPU_VENDOR=n from UNKNOWN_CPU_VENDOR=y.

Jan

