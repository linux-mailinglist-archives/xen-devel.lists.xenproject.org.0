Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEbDLNevCmog5wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:21:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24598566999
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 08:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311482.1581598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrLM-00029P-5E; Mon, 18 May 2026 06:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311482.1581598; Mon, 18 May 2026 06:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOrLM-00026i-2R; Mon, 18 May 2026 06:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1311482;
 Mon, 18 May 2026 06:20:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOrLL-00026c-5Z
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:20:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOrLK-007hTj-Hg
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 08:20:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0aafb7-bab6-0a2a0a5309dd-0a2a450be5e2-14
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:20:46 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0aafbe-212f-0a2a450b0019-d155dd2ce4f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:20:46 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so937163f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 23:20:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45e7c22d8b7sm5512733f8f.6.2026.05.17.23.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 23:20:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1779085246; x=1779690046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LHeTU7Se1mOCJpeFiKjhdblIArugmlpLyD1aJB4dggw=;
        b=eNlAzemrl1lvdgw5xpXlnLpGuJ5vV9SFuOc7Qh8izgWsLcYFmv4NuGTfPm8zVy4JGG
         1tLXcDuCqrEqg1B0doP55lCZhk6MEJZF/hvEWVYCjSDhri13++v5ke6OLc1ZYD8U3EZ1
         j/mmWApH914HfBB2JpRNax10gUjbbZslF5QfvIQ+TrEXJYPqNN1srt3T4xwTZHuwvHHk
         Qmmyg3tEw25Znh6tFB/piPTIIJ0Xq64Z+PTzzYoePaGHpXiLl3YH8c2HRl+HOW3GxxAz
         wvX97HO/x8B07MItE4pQm815bOojdhuELgDSXGyBZ0Sl6ELAqxPLMlHOxvZjXetFyCwg
         SwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779085246; x=1779690046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHeTU7Se1mOCJpeFiKjhdblIArugmlpLyD1aJB4dggw=;
        b=H/D7/wQnIiWEdlLyW6V0VwFoP5Hak94w12Ac/QnU8qpJFM9z7/b72AHNZ3dql+GqFg
         jx9u5Ynll1RqsT8WDNkqizg+kY9n8YCNZ86D0EQaPCg8KE5u+2z/DXd+n+OYFIJ5sOar
         sVMOrcPUuqJsldZlzs7Ii4h3EQdXk459zmhjYxw1oVEaQ/dY0r7+NCLYKeJ5wzsxEeCF
         pgAJMynyb0fwXaglrqj07QVNKIPZpfy30+JPsw343bruyc5CtRCqBPkjUVtZBTzpJ6As
         kFN+VEtaiDrkNH9pBUB/bE8Y8LKlp+Z5B2c2YjWRzlGM1Nx/ly5Axy5uIsjXgAzYuZxA
         nuVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+egeGcDKC4F+Ecnk3Up07DjSphE/pqTuPKOHB4daCC3c2bG7+IW/tKohVFU1orMH1P00MiHWAlhNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzyyd+0Lyi6MnDRJcivWebPaWw72B12ZTxXjyt4C2tthGc53k5T
	OBoVxSF48OSfDbWVtTiiA76HRpzlzEP8lmn+ZWCOoILcHdxRzxe78hTpTkWnkvd5Gw==
X-Gm-Gg: Acq92OFXy8CP6lVCj1fOt7z6Ut+kYUfkCl6O4Pmn+smqKqlIOTsjnKU8BU9ESfEgsH2
	XRGOLgm1psz5tQFhJbz8hwbv+oh+xhzDuVuQM1YVIWuzKdCIQYYUnGi6UrNyzBH9UU5V6PgXb5P
	DMQ8QdAik1XlonldJV/LcF8dGIT9LhZ03JyMtPZMy/sZ+W7w761sSVqiqXjqzu08mDr3EFpTITc
	epp2sTQFCGByo+w1sofPRYP31d6aVqWIbnu5uMAhVL7mQXmI8w7xSCj96qqngZLFV23Du+8QG/y
	F1zSSVWtCK13KbvWWXim6G5JW9+knsgK9GK1O9f8xzbqDOqlBjbBysBh4NkZAL6E72vU8HxttrH
	K7+B7iOF7d6bMJjOdfY/jK57CYHV//+reRuJsROSPzjX4/cSoeALeZHL+fgT3qCbLWxjV4WcIJp
	/xh2LVSgZmPw8N/RLUyOJhHWITzdzpHN41tfEDz+mPH1vZhn7yIIcr8u8hGaEMJxoNnRDjxL5UJ
	mxBxAuZcgt3LXk=
X-Received: by 2002:a05:6000:2083:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-45e5c5dd921mr21859409f8f.34.1779085245609;
        Sun, 17 May 2026 23:20:45 -0700 (PDT)
Message-ID: <d9db51c5-97a1-4131-8575-dca1ae2cf52c@suse.com>
Date: Mon, 18 May 2026 08:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen/common: llc-coloring parser fixes
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <cover.1778925998.git.mykola_kvach@epam.com>
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
In-Reply-To: <cover.1778925998.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779085246-1AF76F3B-5F0008A6/0/0
X-purgate-type: clean
X-purgate-size: 1320
X-Rspamd-Queue-Id: 24598566999
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:carlo.nonato@minervasys.tech,m:marco.solieri@minervasys.tech,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 16.05.2026 17:03, Mykola Kvach wrote:
> This small series fixes two issues in parse_color_config().
> 
> The first patch makes parse failures leave the caller-visible color count
> at zero.  This prevents a rejected command-line value from leaving a
> partially parsed configuration behind for later init paths to consume.
> 
> The second patch rejects empty color tokens.  Previously, delimiters in
> places where a color value was expected could be interpreted as color 0,
> because simple_strtoul() returns zero without advancing the input pointer.
> The patch checks that each parsed color value consumed input.  It also
> adds the missing newline to the DT color parsing error message.
> 
> Mykola Kvach (2):
>   xen/common: llc-coloring: clear color count on parse failure
>   xen/common: llc-coloring: reject empty color tokens

For both of these, a question which isn't even considered in the reasoning
is whether the present behavior may be intentional. Especially for the 2nd
ISTR Stefano(?) not so long ago indicating that the behavior is indeed
intended to be this way. That may have been somewhere on Matrix rather than
on the list, though.

In any event, you didn't Cc the authors of the patch, without which it
seems unlikely that they might even notice the submission.

Jan

