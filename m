Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDbwEPsXE2oi7gYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 17:23:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DA5C2D68
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 17:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318719.1586777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRAep-0005sk-MA; Sun, 24 May 2026 15:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318719.1586777; Sun, 24 May 2026 15:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRAep-0005qC-Il; Sun, 24 May 2026 15:22:27 +0000
Received: by outflank-mailman (input) for mailman id 1318719;
 Sun, 24 May 2026 15:22:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wRAen-0005q4-RC
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 15:22:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRAen-00BQUy-7G
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 17:22:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a13176d-bab6-0a2a0a5309dd-0a2a450bc806-26
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 17:22:25 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1317b0-212f-0a2a450b0019-d1558035b0d9-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 17:22:25 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso32451765e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 08:22:24 -0700 (PDT)
Received: from ?IPV6:2003:ca:b727:851f:6065:3b2:383f:b228?
 (p200300cab727851f606503b2383fb228.dip0.t-ipconnect.de.
 [2003:ca:b727:851f:6065:3b2:383f:b228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454cfcaesm178920795e9.4.2026.05.24.08.22.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2026 08:22:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1779636144; x=1780240944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HmEAwjes32EorWsWlnfEI2UTf+gI2ldQv49cV02s4QQ=;
        b=HSNohEXLTn+LYn6bqpz9S+MVEN2GmxNbEL8lZpionhfSheyNSxr92ovjV6hbuZFJTi
         SfbmVSb+ADMgfb4akT9SV8McrarKwXs8OUhNpXjJfuIfefRaecw711gbMJLvMtnnXCkB
         ad5vxdF/XXvcLfzSpdqSnoAf5EdEyyP3TTelrl03e6rUyDLBJoO+xRIgCc76moSOvI0o
         jYRTZPgYLJYhj58WQpRk9q2N8nAIzm4fyYvX9YWazi1O43HzSWG9hmAcCzWSa1ThPrT7
         ESoiZShMnNgwYOXNu5rXzRvKCrgCYWSj5uYSroF6RYcq/UMqI1kcUcxs7fUoZI2qjAmV
         r7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636144; x=1780240944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmEAwjes32EorWsWlnfEI2UTf+gI2ldQv49cV02s4QQ=;
        b=f4ohYJr9ETYGwPmopYIt/cZrRQn4WByFICk081Tu7mRGiBijjOW54n19mFFYGIF25H
         YcitNWQNKajXoJo52KcBJmSAyB5V2m2m7Aj6k2EEWSEIqZU6SzQ8Xmm2TNF5tPHXMtjV
         4fFqOhPqPliouAooogCWZDTiLbazwi3rgry6f7X5Kl4Byg3Q0JHUgKa6+q3c5bw9cRTL
         Fsmr2Hl1xcuk4mwlIHlegEPkzp88lQvgiJUd+AF5lQGQrwwBr8HAh2YAzZh4oFhgSwBa
         LzFfVkzNsUfMEsUMbSy2V7YSFqDK41ZdUHXg5qvYVV5QTKRel+T0bzhxNqr4RLBFJI8n
         nCaA==
X-Forwarded-Encrypted: i=1; AFNElJ9i9MXYGp9AUxub2Nc58L5WlpOEYTkXUSYd96P7ZCj/exNSmL7WAXq0xdIxnXPFAsCoy02bHh6ERcg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWm1oJ4DG8UNsu/1MTzA3xUCrE08A2EDXpnuOGJ+EP1bOIVAOI
	urMrYnEdrmAoHTDUifDakUcZ7Ir2k+ktA3ISC0p6kgtUiJMHL/9est9+orHRnUYqgw==
X-Gm-Gg: Acq92OGW1wvCgf33dRV5Afv3Czx2+pS9fq9VzYPpO6i5Q0mf46QUP9UOt0VLU5YKc1X
	aOeOHpm9G02NpvrTrhnAsXJwiY7XkufnFhpH03y6FzvLpHq1p4GkChwfNbLjY/aKv2fiXMQQckZ
	0aZFh0Jtquj3h8uCvvCrxGYU6kalIW3zOG4V99UGqdkqWu9oPFxOMM6BE2EGeLsEHfonEJ5r0Gv
	7AAqw327/hOueC6wTRyQ7LMhnRaomEy0v87xh5jKr9VVYqCIcLsz0FPRdcgryuiJ2fWQWtqZ6EX
	iwXUTKoXj43S8Mm5s3U/Mw2sJuQDZ5SRk5B9mXQGGwihQEDEZjfQYi+PhwBFeIDGQCgNsEtyjqe
	ArP1ZKKtbuEIYJVjt7OS7ZkqZvpNW1HHJxjxiPaBvQTg0St30pHrpi6fqLnP+hauW3b0g8T/INE
	uVtfQbs4F4pt+dZAjH0PGMxLKaORWSE9pK+VtiyN4QQ9bGV7VM/n4QQTfoEV952VHpqPDoEenpx
	gNmawKC5+fep0pZJTw28eZaeTW9Zep6DeMyeJwLulKGRRZtqzxLTbp41A==
X-Received: by 2002:a05:600c:6383:b0:490:4717:970f with SMTP id 5b1f17b1804b1-4904717984dmr168504635e9.14.1779636144459;
        Sun, 24 May 2026 08:22:24 -0700 (PDT)
Message-ID: <50a4d56e-6adb-442c-ae98-1922315706ba@suse.com>
Date: Sun, 24 May 2026 17:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 sstabellini@kernel.org, jgross@suse.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, dfaggioli@suse.com, gwd@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20260524000209.292370-1-taka@valinux.co.jp>
 <20260524000209.292370-8-taka@valinux.co.jp>
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
In-Reply-To: <20260524000209.292370-8-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779636145-20479F3B-75FB875E/0/0
X-purgate-type: clean
X-purgate-size: 1874
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9F9DA5C2D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.05.2026 02:01, Hirokazu Takahashi wrote:
> Parse the 'cpu-map' node in the Device Tree to extract CPU topology
> information. If the 'cpu-map' node is absent, fall back to
> generating the topology data from the NUMA information. This
> generation assumes exactly one socket per NUMA node and that SMT
> is unsupported.
> ---
>  xen/arch/arm/smpboot.c                |   6 +
>  xen/common/Kconfig                    |   7 +
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/cpu_topology.c | 307 ++++++++++++++++++++++++++
>  xen/include/xen/cpu_topology.h        |  42 ++++
>  5 files changed, 363 insertions(+)
>  create mode 100644 xen/common/device-tree/cpu_topology.c
>  create mode 100644 xen/include/xen/cpu_topology.h

Nit: New files' names want to use dashes in favor of underscores.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -188,6 +188,13 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config DT_CPU_TOPOLOGY
> +       bool "Device tree based CPU topology support (UNSUPPORTED)" if UNSUPPORTED && ARM

Instead of open-coding ARM here (and also in patch 03), please consider
using another ...

> +       depends on HAS_DEVICE_TREE_DISCOVERY

... HAS_*, just like you make use of an existing one here.

> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -11,4 +11,5 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> +obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu_topology.o
>  obj-$(CONFIG_DEVICE_TREE_NUMA) += numa.o

Again for here and (apparently) an earlier patch in the series: This
file looks to be sorted alphabetically. Please don't blindly add to
the end.

Jan

