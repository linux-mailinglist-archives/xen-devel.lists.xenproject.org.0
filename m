Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PJnGhx6nGlfIAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:02:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD1179464
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239167.1540606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYO3-0008LD-4C; Mon, 23 Feb 2026 16:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239167.1540606; Mon, 23 Feb 2026 16:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYO3-0008JL-0p; Mon, 23 Feb 2026 16:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1239167;
 Mon, 23 Feb 2026 16:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYO1-0008JF-K4
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:02:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05fbfaec-10d1-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 17:02:16 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4834826e555so43762525e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:02:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b3d88sm296260235e9.3.2026.02.23.08.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:02:15 -0800 (PST)
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
X-Inumbo-ID: 05fbfaec-10d1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771862535; x=1772467335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0h9ayHreNAAoqsa2WPENgR/1b+P1J/Ynq3ni503hRk=;
        b=GvhrQ56NEaEfmriJwJKPn+BXDEaGAMBmODVaVe+Pi6GeYLcyj/LE01SRbqiuOvwbAq
         upH1xgxy/FljHjUbcfUdFc+bwkUUjA1FaY5ssJL21g3rCPyfe7JcNlGuRLBz4rdpTD3H
         crSUwXzijIXvl3AwYIyxb9/ZNPCx75gJdHZzFnPvz9a2wKCfmmPKPtn+MtiI2oXJX+dI
         ExSn7GK5Q7vwAw2kLMB9yR3TSEm9DGnMfS0ejzQTawP2QtSvlP9UmHzK0Hx4NnOoW1ZP
         zQqb/YOXfv1iRYNUKxW1Aa682y3lG/N8mXsTLDCS/0otcDKiqz4lVG0eH1vYaGKcjQRA
         7YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771862535; x=1772467335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0h9ayHreNAAoqsa2WPENgR/1b+P1J/Ynq3ni503hRk=;
        b=v2iQvebpsJ1X+wgOT9OhYiG50p939T7VKzoFYx5NGXmvAHaFCnRLwmnHzPB+D+Cvj8
         8QaMkkxslk3DDhV2vJDDBDvVxf5rcnTLXM9H2+EWwQtxHje8U8t9qur81otCutEZSVtR
         Hf/2dWcYlal5hOPp5yeXQ5gxdZG00wsYLtYCefojx6BVnytdkPwyJa8RdG6HzVrlpdpI
         fRsJUafViR1+3zYEG5aswIaLwQtzxFThppzzQo8Vw/NwfQFr15j5LcQ4VmVyJ9jlM9U9
         te94NVS6MBsl+YEZGS2SNt6hOyAkHUnQUuEf3pYQQCqBLAuzLLK+Ugc7HpI7M2E8MDpl
         GvKA==
X-Forwarded-Encrypted: i=1; AJvYcCXoWiHigpb8jadA/TPMbagyyp8/ETpKKK5NoxyJzPFVsUFxz/2pBvOJgFZPFEChvWiAKThzPyqfKM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBveOtDQuDGvzEZqwJ2qQ3rKCbiFftJMfPlZbj05a5Ua62SWsK
	sDevT/AGjt04br8zC58YtZVuNC1VyxmBT/RdsacU+S4+3z6j/RYC/2SUwfsj8KOB1w==
X-Gm-Gg: AZuq6aIiJGNGDQ3lUim8i1c3fjTWo0qYxsjV6nzLEqRdepvIttTrYhf7RFRr0MmfguJ
	zbMSCW/8DJC7w1hNglMbs3S2Cpq9o/0SQSS0qa0mIn85lC64RLTYiURHC0uaQJ8RYYf2e8w5k0S
	TFh0GK0uW4UTiA+kV59yGfjpoxKV0FNX335tuj6tfEn3oWubEOsNzUiBb1zAeK9KAscBKeZYWmP
	BMonEfreY0yAaHNfm7MJn36SSIeGKTTImObx2g+zS2tPCGmFCHK0ElHNhvyRa6icLpcA91Xplxz
	bFPICGpqnRT7IwSH5xLyzHrcuA8C7Fv3mXsVBg+mA2RsUM0wtNP0KMZaxc/uIhk/mP7yY5szz+t
	MiBaz84bp/Fyk0yFaIvpPDsWMuqITDWfpZY4wC8imfHVwGP2GX6CGFcHXN2vFZhI1c6MM8Fr+6R
	XzEDe0FvTVwH6SFtQVJddeO80Tra9HYhu8ZUmnM22ogXrq1BuZcuwuEpIJumm63bH0WCqCjtLf+
	LF2zd0cAJbvoec=
X-Received: by 2002:a05:600c:3516:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-483a963df3cmr189603125e9.35.1771862535496;
        Mon, 23 Feb 2026 08:02:15 -0800 (PST)
Message-ID: <6d564a09-b1bb-414f-ba8a-61bf9d9c7e5e@suse.com>
Date: Mon, 23 Feb 2026 17:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/tests/x86_emulator: fix build on clang-21
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
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
In-Reply-To: <7147fc3ef5d5bdf5a811e896925d9aa641ed0753.1771840208.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 15BD1179464
X-Rspamd-Action: no action

On 23.02.2026 11:04, Edwin Török wrote:
> clang-21's built-in assembler is enabled by default, but it doesn't
> support some mnemonics:
> ```
> test_x86_emulator.c:2636:36: error: invalid instruction mnemonic 'fsaves'
>  2636 |                        "fidivs %1\n\t"
> test_x86_emulator.c:2640:24: error: invalid instruction mnemonic 'frstors'
>  2640 |         asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
>       |                        ^
> test_x86_emulator.c:4251:24: error: invalid instruction mnemonic 'vpcmpestriq'
>  4251 |                        put_insn(vpcmpestri,
>       |                        ^
> ```

Was this reported to them as a bug (or perhaps even two)? That would be nice
to add ...

> --- a/tools/tests/x86_emulator/Makefile
> +++ b/tools/tests/x86_emulator/Makefile
> @@ -297,6 +297,7 @@ x86_emulate:
>  
>  HOSTCFLAGS-x86_64 := -fno-PIE
>  $(call cc-option-add,HOSTCFLAGS-x86_64,HOSTCC,-no-pie)
> +$(call cc-option-add,HOSTCFLAGS-x86_64,HOSTCC,-no-integrated-as)
... as reference in a comment here.

Jan

