Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM/zNmKTAWrsegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 10:29:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509FD50A1B7
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 10:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305856.1577986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMM0K-0004Jg-0y; Mon, 11 May 2026 08:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305856.1577986; Mon, 11 May 2026 08:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMM0J-0004Hz-UJ; Mon, 11 May 2026 08:28:43 +0000
Received: by outflank-mailman (input) for mailman id 1305856;
 Mon, 11 May 2026 08:28:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMM0I-0004Hn-JK
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 08:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMM0G-009vIl-Nz
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 10:28:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a019334-e002-0a2a0a5209dd-0a2a4507814c-20
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 10:28:40 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a019338-229c-0a2a45070019-d1558029d9e4-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 10:28:40 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so4886825e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 01:28:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6fff9c91sm179957505e9.1.2026.05.11.01.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 01:28:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1778488120; x=1779092920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NqWZ/tTu3mVHMTLVrNUdy2henhKD5qcqDf5QsKf7Yhc=;
        b=GQzQvmxGrwlynskIlFD110hH2vlUqa410Us7JaC/+yiL5OCwAQsPoXMRp+naUP8UKq
         pgfzUND2q/B1kDqqVSSX6EAxVfznj8lFY7OWIOWw/CsFnFvwp3upTY08yE29RDjjrxZm
         A/Jn8ZSRGO4uCVIIgjSqGtkvc3wJAC3QOLfjhf6PwN4eOI8VO5nOvE2e1ZE2BqaI/ehj
         ebPWBVglLhFV0q0TqDHmHCaKsPBiqgf71DbpE9WaxNKnQAfgWgej95beZAjdcr83km50
         gIiqudVSd5gUhMeVLhqK9xJOItgzDS4GZVMrLCkT8G6QMifGigh2fo9t3vgmNmQQWlRe
         B1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778488120; x=1779092920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqWZ/tTu3mVHMTLVrNUdy2henhKD5qcqDf5QsKf7Yhc=;
        b=VONX5rJJcz7rcxrbdn+hRzm7YWQ8E/vBBgzSDzFPFgIBYFlPiaj1YGH9SXnJS+RFeu
         yA/5VE04yDhyAFzVUZ1hxW1J3vSatJPDW4xa/gKgX9GQpSrZ+COhrtOtwFAEHwzhUsVM
         4QbGjMTKMIU5mmcMV6bsvhE4nLsWnbYhbcc4HIM6WYXiIYmGvZ93wZ1EgtFo88kqh5pP
         l4D0kihIR1YGsyI3urYfopSqThHVOFhkPinD6Zc2v428oCPKmtXej8zVc1Fff91vyH5R
         eqnYNTgoeaguscPgi4FZmhYyODhdlJ77JWM5amiTEFX7FZ8y6EhRV6wivdFDky0rUcjr
         PbAw==
X-Gm-Message-State: AOJu0Yx83Co+bv5dX6iXSbIIsy2VyH7pDOl0fJn8WwERVRiaLJ6jhxBf
	wgTWNhre4Gr+K761R4mYSKlM+jWF43+H5xxq4RW3cI1S9gZQcu88zntNh0/V2Aotfg==
X-Gm-Gg: Acq92OFLENnTU0ypqxX44Ty+RJKH2pDqRwHeBIcP05AAZq37ZijTpZvbjWU8uOjmddR
	T+4eV4FrkqNuSV5M+m7nQQ3a3bY7tmaU3vxVY+sUyYCxWkQtdWd/y5ZFOmZFxAJNhVOkaCUPU9o
	3z+MvEZz/SKUZ28PYOf8jvMrBd4xJLU3M2pWRZTmtHletAJrNj6Mdkh8nPTUNLQD1izEqcjGSA+
	aaZRfqop8EEfxHdQIX2WMa7Q3tzEYElHFgW3cOqs9858CfO15RyUS6OzKjZg4jF2RQ7ehQ2VPuI
	QicnzV+5J3jB1dFcIf39xNrlHohYQUccBSyUwsKcrNDv+69alkqhJv4Ty6D2INH7cmCwvXnPWWT
	jngzPm/oRD0WTfsmV0r9AkILWuNW8oKC6+opBca8jOfaMBpT08ttj8ZFNXgI7ou7JwZNI9ASUbc
	XusC+vksXIwhQdkNu6XCLWFAQLwgAOv89YWUBn0je0fpmYIqd95PCMuZeB4LyEeWrwYkCmJ4NzR
	iE/EPhg2wPK+r8=
X-Received: by 2002:a05:600c:c08b:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48e51e204b5mr261909705e9.12.1778488119918;
        Mon, 11 May 2026 01:28:39 -0700 (PDT)
Message-ID: <e238b131-0e66-4929-b09a-71afb8666883@suse.com>
Date: Mon, 11 May 2026 10:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] ns16550: add support for WCH CH382 and ASIX
 AX99100
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260511075415.36538-1-Zhao.Jiaqing@amd.com>
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
In-Reply-To: <20260511075415.36538-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778488120-22F76C48-E4B26C31/0/0
X-purgate-type: clean
X-purgate-size: 1230
X-Rspamd-Queue-Id: 509FD50A1B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 11.05.2026 09:54, Jiaqing Zhao wrote:
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
> v3:
>  - New patch 2/2: add support for ASIX AX99100.
>  - Add forgotten Reviewed-by from Denis in patch 1/2 (WCH CH382).
> 
> v2:
>  - Reorder entries in ns16550_config to keep them sorted by device ID.
>  - Rename PCI_VENDOR_ID_WCH to PCI_VENDOR_ID_WCHIC as WCH has multiple
>    vendor IDs.
> 
> Jiaqing Zhao (2):
>   ns16550: add support for WCH CH382 serial adapters
>   ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller
> 
>  xen/drivers/char/ns16550.c | 38 ++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/pci_ids.h  |  4 ++++
>  2 files changed, 42 insertions(+)

Please can you adhere to patch submission rules? They're sent To: the list,
with relevant maintainers Cc:-ed.

Jan

