Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOooKCjzjWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:35:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1B12F012
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229326.1535293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYiS-0000ms-GU; Thu, 12 Feb 2026 15:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229326.1535293; Thu, 12 Feb 2026 15:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYiS-0000kN-D9; Thu, 12 Feb 2026 15:34:52 +0000
Received: by outflank-mailman (input) for mailman id 1229326;
 Thu, 12 Feb 2026 15:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqYiR-0000kF-Ou
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:34:51 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0f75a9-0828-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 16:34:49 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-4362197d174so2237410f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 07:34:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c93asm11647843f8f.39.2026.02.12.07.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 07:34:48 -0800 (PST)
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
X-Inumbo-ID: 5e0f75a9-0828-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770910489; x=1771515289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AHHi+BFTnw/nY32XVCZXrg3zNla4VkYQkAeyFL00fwg=;
        b=KelP33lbvs6fd7bgTLW9q/r1OK/D2mPqi8EBt4NvHM3nV16or6YiY8d258zqidvqJN
         H4jpPOnmLqBf9xvTvOvdDdM8jte5S1KV9QVH++1eUcsC7ciXL2eM3L5wPNdpZfKnMTqq
         Kl6GyT3K2UazD0fTE7zRHLO+7avrYs3NVzta2jFFeo0ckNmzyH8gRUhTRMdvwgXeBK7Z
         PDLQFkKpcVjmFjEaI8Tl2n+IsIclZoDb0tZNzvfTApTzKjyf+l7UlFZvTov7A0iM3NAK
         I8jNt0+IzWlHEgi/hncD8OkVWDSBzbxaFTqaqfaEKD7ggKAmBabBc8xMS7evDfJBJxDR
         0jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910489; x=1771515289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHHi+BFTnw/nY32XVCZXrg3zNla4VkYQkAeyFL00fwg=;
        b=hvM15rTDBq1eN4Kzo2tpOg4tVdNp5mrmPdv8rYKWqYQEXS8NlgSzP8FbX1WS2/i21G
         LVqw/bhMONz720ZV3alNUvAI/BXyps85X4kArOhz/zuPlHd/y9Yjtm91g4FLxA/3x3z2
         uTg8GZKJ2GC62QJJ9lLmZkGgH/URAOWo2GJlNk0gI5ynH7avE2vSoZjIsE/TIhcUUikD
         XVnBwL4sYvOz2a4Znq6zv9wKPzfpIUz868wHW2W1tFZA+Pd2kqJ68kWJYZoJ6pgQCxTR
         vtk5hLgLZeX19GhhlqbDZ7sCbUmiYuj5JLD4ECnOSrMtoRBpJ5bWKOqoqoXPmD2epUNh
         iVbw==
X-Forwarded-Encrypted: i=1; AJvYcCWCtUoWV+OGx/eOOQZ/8zYfsaArzHpL2U461feXzKePNc6UwNpMzrE5RK74aGwMv09QfmYqNB5M8Fc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPP311ipFeURfNN1cRuGj4YY0+wwVUNsqJVcJV0wXIJgU6ybPV
	2XJga0TZ9vmLDzjrNmlS4YhQhUWvYaB9iXei9x3EEvd06S2+LyBpcN4LsMa7zt/syQ==
X-Gm-Gg: AZuq6aIxZ6uwwB+P/qN7bJAtAD7BqQSrs43BwsRY1695T+5o5ZbfL6pmxA/v+cs0EfY
	XrKazqPXBfA2VqXTwDhqYtVS0JP6QziftDDDJhF+G4qV1isELOnV34EWAiFa7Fjhb3WzqgvYuFz
	I+sct3toswqP/1Z7aeK/d34TU2S00JsQOg4KogJstNbz2lEEROmZwqXi/0kW4FUWRxn41FRBZQS
	rBFlIskR04/73SRQvTJorrkVV9WO0ruQNJqRobuFEEk+y2plzf7x0/73OBHvvSNkoBikWqO2gPT
	/wsK1jbozPDjc0tpeOUkmXxTYp6S87ON5HxDUEfQf0cSpfLLNovBIBg+00DXXoYzEzhZwPonxyX
	jDgkZxNGK1BQPoXMxSaq3HUtb8qyqfdOteGcaU8XLxEcJwzp3Zte/eSWDapa3yO90awX3UiF+xz
	cS8rBGFI1gz+YSxR6WDtR6MeQBnRjLisr5AS7NUp+o5eRbJ4r5UT4To9VqPnExVE5Hz0eE2Y3Y2
	o6u2QJshOzGoVI=
X-Received: by 2002:a05:6000:2586:b0:436:1a4b:de36 with SMTP id ffacd0b85a97d-4378f11f142mr4946185f8f.22.1770910488940;
        Thu, 12 Feb 2026 07:34:48 -0800 (PST)
Message-ID: <2e0d0b4f-cc5d-4ab1-9132-04ab84a222f5@suse.com>
Date: Thu, 12 Feb 2026 16:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen/x86: always consider '/' as a division in
 assembly
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260212144618.43200-1-roger.pau@citrix.com>
 <20260212144618.43200-2-roger.pau@citrix.com>
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
In-Reply-To: <20260212144618.43200-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 55B1B12F012
X-Rspamd-Action: no action

On 12.02.2026 15:46, Roger Pau Monne wrote:
> On x86 GNU assembler will consider '/' as the start of comment marker for
> some ELF targets.  This is incorrect with Xen's usage, which does use '/'
> in assembly files as a mathematical operator.
> 
> The behavior of the assembler can be altered by passing the --divide
> option; unconditionally pass this option when available to force the
> expected behavior.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


