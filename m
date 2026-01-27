Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPhNGBzTeGmNtQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:00:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD609634F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214906.1525154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkYK-0000vR-J0; Tue, 27 Jan 2026 15:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214906.1525154; Tue, 27 Jan 2026 15:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkkYK-0000ta-F0; Tue, 27 Jan 2026 15:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1214906;
 Tue, 27 Jan 2026 15:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkkYI-0000tU-Ql
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:00:22 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ac0dd5-fb90-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 16:00:21 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-435a517be33so3590304f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 07:00:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c246ecsm39616864f8f.10.2026.01.27.07.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 07:00:20 -0800 (PST)
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
X-Inumbo-ID: e6ac0dd5-fb90-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769526021; x=1770130821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tYVukq8gl1dL85MtXVVzwL12ylP53RilHPsP5KRj7vE=;
        b=MBfm4oCNvl3jDS7G0lvcTWHjfBYqAQ1V72NC7AId0KkDVcdbIHFqj98FiBy1ruVS3i
         NX8StK8KABwExH7e6ydlUbUE6Msb/RiXsT5Tl+fSjr/72NlzNKGhNz3XDLD3iVWQr59Y
         FtoXx3Yh0aBZRM7IE+bL56HLnB4AXXE1yWU6AI6QVPySLLop40LrE0OgTV8EnKtQCljw
         BT4+7474gXv39Aqye+weStKr+YvJZulkmlu6Awy5QOcXxr0PnN6y4kK1pdKmKvi5P63+
         OZISJE2m3HGiHVIwisZ4ECGCR5Um9sefBiGwOrgNhWzWZkKMIQCoJGQcviLgWUcpU/n5
         U4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526021; x=1770130821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYVukq8gl1dL85MtXVVzwL12ylP53RilHPsP5KRj7vE=;
        b=RqaLAr8JG+pJDGZ0e+qMS9Hg4ZwDzUKjSDDH4BxpHdpzLE6gV0jSprOz0Yl28NG+HO
         ROWR4yfGhZ6BtvURrmuDOykxNbPOVYaXC2+rKWZPS3zPlB/bd12Z1DqzHJOHk85WDdcq
         R5zqy9FKwLMnT3sZQY3JJxGJ13ixiK/FYP8CaTjb4hdMMHCZb3CrvLsDmaiakuvkqxSp
         LoMdJeLol7954lzrrnAXJ8ScvbGQ+/43u1IjYz0+Nq99k9igpfZlZNQ/4RAYHJ4nliue
         BtX1sI5gJdGXIwUAUKX4TPSlx7rSiGvVOMw/K2gb2wWhxjd6JJQzkxEllmRbfYtV6jPR
         Hccw==
X-Forwarded-Encrypted: i=1; AJvYcCW55IDjyQUdGTr4fkNdt9bnbRR2ZGHYSXZTaOuSrdZLusNNjjVemXBRCRsATjedT9g9jiSbo/DuYdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCjPYD8kdu4wMt4dOfb12Ho+YXZ/MKO4eQC40Zhz1SOboom2Wr
	oyk/Aa4dWsCawgTL4VgFOGhhCbSXxanjnayHkz0+4uGrJ5ZDspWPRwAyeb2070QOrZRI9YSsQdI
	ycLM=
X-Gm-Gg: AZuq6aKewxwpHDMoffu/ap4E2r0jXFQz7RTaGkOV8gZZQBb5E5DnGR4FalKulCkMFkH
	Qyw6AWFyrqgwrO0HRf2iYAU0A/N8QUt4IV1MbNZXMwZwpLgJQoooR83RPcpY9g7BE1b4EOqjMvp
	6OFFZHSxcuzgWI3Lw3KtAl0az89TsJ7kMqtkJ1tllU8VQjEXDmxUC01FytybahzUZ5q7O7Jv1lp
	gcoDhD8kPGlVftGaQZSrqKHVKsLkH8P82CJXR/s/q1uy55Kg3AiQTjorWKeOe+xreLQoZv9Rbb1
	QfvchNq2xE6Wy0FsUsSLYeF7dvoF1eb82eU2IbPDgaxXERmG9mqCTL2a9vvpDOylx6VsyfVlzaV
	Z0d4TSlAXmxu/tYK+flHyaPfHxL1gSFU7KWMrbJoGVJtiH2cYxkXp8Gxy833jCFQ8lYlVoEsPdl
	tzdU8MxTC19n50xBB00QFZcKNF6+9MiCax+2T8cg8fasygJ0TgqUUNmMd+tm28nkoQLyqkTVVJ7
	FA=
X-Received: by 2002:a05:6000:2483:b0:435:a0f5:c276 with SMTP id ffacd0b85a97d-435dd1d8617mr2777558f8f.61.1769526020659;
        Tue, 27 Jan 2026 07:00:20 -0800 (PST)
Message-ID: <81ac55fb-6405-4b11-999d-fbdc4fd61759@suse.com>
Date: Tue, 27 Jan 2026 16:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] x86/cpu: Clean up use of LCAP_* constants
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-16-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-16-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
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
X-Rspamd-Queue-Id: CCD609634F
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> Now that the LCAP_* constants are single bits, we can simplify the expressions
> using them.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I was meaning to ask in reply to patch 08, but luckily this time I remembered
to peek ahead in the series.

Jan

