Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PZtMGitHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:16:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1607562C5F6
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324723.1590221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUMA5-0006Ij-RL; Tue, 02 Jun 2026 10:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324723.1590221; Tue, 02 Jun 2026 10:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUMA5-0006H8-Oo; Tue, 02 Jun 2026 10:15:53 +0000
Received: by outflank-mailman (input) for mailman id 1324723;
 Tue, 02 Jun 2026 10:15:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUMA4-0006H2-0d
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:15:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUMA3-00Aco0-6N
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:15:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ead48-5cb7-0a2a0a5109dd-0a2a4506a356-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:15:51 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ead56-7371-0a2a45060019-d155802cadd5-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:15:51 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso4798725e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 03:15:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e37851sm59796055e9.13.2026.06.02.03.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 03:15:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1780395350; x=1781000150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=34yXeZh4TiSASn2B1/qogXIUGBHyiSPSWC0lTrxvPAw=;
        b=D+5LAxxpicDEmeYUhDW5fpGrdd4jSdJvDX7iEijCR7LL24aInwwij0lZHoZyeQeFR7
         x3+xxu1lmKOCvNbNucqxSxgjsya6FawufBflbo6fs/mAFCNVZHIovEwDDpK7tMIID/9O
         gV5Uk8WQ+OAcL8EUdOzZzi7I4abdHsOh1Elaut44mXuyAUqPrhWvJsJYjdkmXHmkJ85J
         BnX2ksEcroycg5Ls0TgBjyHpRqHSMW/MovxboLl7wAV5TKBus60JXaDMeZnmF1waVD6K
         w+052NttISmuQeBQ3hvfCdOmEb61hmJ37pghumoTBKv8WORFisxtfLMuJn/oEWhUE+pF
         Vc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395350; x=1781000150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34yXeZh4TiSASn2B1/qogXIUGBHyiSPSWC0lTrxvPAw=;
        b=iWKBofecilTe5MGh/uPoRrW7VusSHoDhS7esiIQoBif4kfXuQOaDwZSSlfJmlWHPND
         C4+WHF5KyL8N3oywVeI/Vpx7/I2/oZHHGt4QtizuSkV4KNiiFdsm0oHzbp6A4k/OxjQm
         Pu6jkAuJBJHC8Opsdwgc0P3QzYzPaF6KZtMLGmr7QaGY3mlCLG/uhSlZ/5QvhwunEAE+
         eahqBtoXlwc3gGSPsi5XYhhaANQ8yiXNKP9ulQArnXGqp1t/fpPmZ/l76ffks9MX7BM2
         izIto3zYoTihnu+KFEvPoE+SrY8cA8odTgIQhZ9gKt4AhcGc2lJiPHQXtTeBZuOEGaub
         a77Q==
X-Forwarded-Encrypted: i=1; AFNElJ/BCV1cSuhnb4PlYH/FuVxYpGs6YOUT1dL/RTodn9pT/syaXGV4CuaiEYvivguPUlwgpof4Bk4fnDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXmtcjtlIG/EAOp70LhIuSWGY88QKWNvq2U6KcA/J6D3SbKLwm
	L7In1ATGeOzQ72ROhSXhPSLp2FaoCd5zMcykC/fN5t3GeiAK3hFWC24GeoTGQilcMQ==
X-Gm-Gg: Acq92OGLIwyGFR4Rt1NzpGTYtwl823TGrjKJpTKTkLUqgIWQznmS5WKwSF6MWZIVon0
	+3KWZ+BJbUL9JeKtGHHny8FwhdcuF8nJufHrxupJFA1pr6x7Jozetnx6vN5WUuiSRm64HcwWsrb
	jHhPiswbn7Amg4bWTek08ZH5QCfcJIN0a1RbokwDaszhhCN0FyyZn4VwgFZO2F0pO6ges0I+xh2
	o+3CbywQYzo/OluH/UdYHAFdPW4I4x795UjCHxvCs25ju1nW+yvcn7vx5S3Qb0ihKRmqpd4FizB
	six15udZbJlc5QrTjZmLCPl5YAVMhHWKnL2hQ6QZeHQagulyBeCvi+jbE6qicsL4Km0AoaGU3mH
	6q+7cYT1zVD7xrdXMXRMFpkRmHcRotqYKO7p2hDs/LthxkY9ANG5P0NUUM9DB5hqzL6GyAmlhhr
	dSc6NZFN6mjLBV5CLtB0ELBIRtWY/1WcHJ1ozy9Sina1wqs5+dVkqBbFMUmsJranUGFjA6eZw9o
	XupKYZmwBmglKUQk0rjW5bkkw==
X-Received: by 2002:a05:600c:a315:b0:490:9bc2:bf8b with SMTP id 5b1f17b1804b1-490a2912132mr198738845e9.5.1780395350322;
        Tue, 02 Jun 2026 03:15:50 -0700 (PDT)
Message-ID: <ced10c25-2970-4ba3-96fd-3bc5df4c4797@suse.com>
Date: Tue, 2 Jun 2026 12:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] ns16550: add support for WCH CH382 and ASIX
 AX99100
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
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
In-Reply-To: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780395351-87F7BD75-0B826A61/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Rspamd-Queue-Id: 1607562C5F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 02.06.2026 07:34, Jiaqing Zhao wrote:
> This series adds ns16550 support for two PCIe serial adapters found on
> market:
> 
>  - WCH (Nanjing Qinheng Microelectronics) CH382, available as
>    CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
>  - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].
> 
> Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
> work with the existing ns16550 driver once a matching device table
> entry and parameter set are added.
> 
> v4:
>  - Add Reviewed-by from Stefano.

There's no need to re-submit just for this. Mail volume is already high
enough. The fact that this wasn't merged yet doesn't indicate any need
to re-submit: This series simply needs to wait until the tree re-opens
for the 4.23 dev cycle.

Jan

