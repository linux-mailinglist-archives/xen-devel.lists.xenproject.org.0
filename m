Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMHPKLguC2plEQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:22:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463856FD3F
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 17:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312024.1582194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznT-00026r-Bc; Mon, 18 May 2026 15:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312024.1582194; Mon, 18 May 2026 15:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznT-00024q-92; Mon, 18 May 2026 15:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1312024;
 Mon, 18 May 2026 15:22:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wOznS-00024k-0t
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOznR-00EwqX-D6
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2ead-e002-0a2a0a5209dd-0a2a45019328-0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:21 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0b2ead-c1f2-0a2a45010019-d1558030b48e-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:21 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so27171865e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 08:22:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fead15bf3sm86721605e9.6.2026.05.18.08.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 08:22:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1779117741; x=1779722541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G+p8ZPPEj5GED5N9i/+MFj93qNDJn/UygesS3drYpCw=;
        b=cMewH+wUGttRa9Zvi2nx8tBfDBIgiTPp/9Ez4XV4/oynv2wWVPQLXYhRUMTurUevrx
         pQ6viIxv8t8JuzweB739yjuZ2UtKstCNnqRiUb6IF5l7XUgEDrb36HSBK1BZNu3TiiGc
         RydZXLtk/0hT1hiKZMo0TQWcY2TI0n4jWtzFYqX1ZJ04GzLn/N9zUWDuq7L3WdlCdncK
         Z4mbKgV4wwpcWeRFMDPdRBjlfVs9swkUxcRja/XzDcxzGOOWUeZIS7E1x/0e0DZRztes
         xumMnjjSaIgA4MUmo6kGHmLO0oGim9Y7kECttAA4X7vamAQzi5OsaPzSrKh033dCOLIh
         535A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117741; x=1779722541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+p8ZPPEj5GED5N9i/+MFj93qNDJn/UygesS3drYpCw=;
        b=lwMNUF7AQoUd7LPknEqQbBM/+En8M0X6E0MZgd2Hjjn8+yBloRdw+K27LF/xZJ96dL
         dWe22P6UuAmsjyifl2oytwnfTpqmE6Sv0mqaaSE/JNGcsI/Qi3ejCLa6EHRnHe6tWEi+
         AppgYukep2hYqRdisIPz6n9PaQw4S/ufBliAA5KbvEHyEhZw1IQJQU8kntxIKu3XImkP
         A/qpbAWiMA8lhjOaW0XVuSCumGpwADK2n4+jZA3oLbxjvv9b6c8IpzvqmVWqw981WDJc
         +/MzftIJxYAOyq0BuYrzPdDaBZGrwi8REcob9JTSJEabHB8vBXqyngTCSv5Efb6o9jsk
         Yo5A==
X-Forwarded-Encrypted: i=1; AFNElJ+wTsM2Kh7ovEBhNMxvoGF7TKggSkIrxqmCl2nFe54cksfUEg3xB+NeEBBfZkGm4Cd0graqWuqPnJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDGKFBl4+IeQQHKg9r17SsC8fFwvNkHC2i+W161zaRXcVS2sNm
	1BMbCk2ATD2PpmvSGIPDv+F4psxWywubOg8EOv0ZazY8jn4NyKxB/62wA7xKVUj77A==
X-Gm-Gg: Acq92OEHzx/BL0/LsVKOlf9aAqghxQUgKA6ujhTX2FfgKughsn2QGhfLw/mScV4Z0+W
	NG6c0PsuA2pSAu1hPUwLOVXER/zfkLEkZNuOz6rYwyeliItIHmzIGcx4peSV0Vf3zeLLkGcoFhT
	vlsl+IXrkrh+CvyRro4hKobT3eRjNJzquymlXITutFMaht2UCdATBG9k7sNg7GF4NEM3YJvkVAE
	YLajbGmGvLHDUw/vJpxWInsFpFYYuDERn7GseA+71kRCKjtt8AHZrI0fGTaQRPPvCft+w4KLcV8
	r/M/BlrBBtCKMKQMb0MIs2seBm2ezelr1DdHeBiuA1Z7IcPxx/cPasAJdVeqPE71nohN8VON/Gh
	9Wv65J3OXvuTinAPqKdq9wtky3NCbVEJcfshglj7bJbzM+yM077Dfnp9MKwgWp6Km4XVy8ZGl2R
	6R5L3txRmaopwHz/ahbO+y0Us9kPFUuKlGDKRsTx+N9Oilg9p3B4qblaS0d10RvglMyFS9zgWzN
	UpYxYB6MOvsv6I=
X-Received: by 2002:a05:600c:8b75:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48fe6321cdamr249658565e9.21.1779117740747;
        Mon, 18 May 2026 08:22:20 -0700 (PDT)
Message-ID: <6640f27f-7c32-4a68-982b-b282ad8f67f0@suse.com>
Date: Mon, 18 May 2026 17:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] xen/riscv: rework G-stage mode handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778140240.git.oleksii.kurochko@gmail.com>
 <5a48ba01dad3a54b404524956fb39e7e3e673a93.1778140240.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5a48ba01dad3a54b404524956fb39e7e3e673a93.1778140240.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779117741-ACC53FF4-66348244/10/73395122804
X-purgate-type: spam
X-purgate-size: 2661
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1463856FD3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.05.2026 10:58, Oleksii Kurochko wrote:
> Rework G-stage mode handling to make the selected mode descriptor
> reusable outside of p2m initialization, both for filling CPU nodes in
> the device tree passed to dom0less guests and for per-domain G-stage
> mode selection at domain creation time.
> 
> Promote gstage_modes[] from a local __initconst variable inside
> gstage_mode_detect() to a file-scope static const array, and convert
> max_gstage_mode from an embedded struct (assigned by value) to a global
> const pointer into gstage_modes[]. This allows referencing both the mode
> identifier and the mode name after init without copying the descriptor.
> Remove get_max_supported_mode(); its callers now dereference
> max_gstage_mode->mode directly.
> 
> Change struct p2m_domain::mode from an embedded gstage_mode_desc to a
> const pointer into gstage_modes[], so each domain shares the descriptor
> rather than carrying its own copy.
> 
> Adjust the gstage_modes[] entries in three ways:
>  - Use lowercase names without the "x4" suffix (e.g. "sv39" instead of
>    "Sv39x4"). The DT mmu-type binding [1] does not include the suffix,
>    so the name can now be passed directly to the guest without
>    transformation. The suffix is appended only in the diagnostic
>    printk, where it remains informative.
>  - Use "none" for Bare mode (HGATP_MODE_OFF) to match the DT binding.
>  - Change paging_levels to represent the root page-table level index
>    (i.e. total paging levels minus one) rather than the total count.
>    P2M_ROOT_LEVEL() now returns the correct VPN index directly, without
>    requiring callers to subtract one or use hardcoded offsets.
> 
> Add gstage_mode to xen_arch_domainconfig so the toolstack can
> request a specific G-stage mode at domain creation time. Introduce
> find_gstage_mode() to resolve a mode descriptor by HGATP_MODE_*,
> capping the result at max_gstage_mode to prevent requesting a mode
> the hardware does not support. Update p2m_init() to accept a
> xen_domctl_createdomain pointer and call find_gstage_mode()
> instead of hardcoding Sv39x4.
> 
> Add arch_parse_dom0less_node() in a new dom0less-build.c to read the
> "mmu-type" DT property from a guest domain node and store it in
> boot_domain::create_cfg.arch.gstage_mode, falling back to maximum
> supported mode when the property is absent.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v6.19-rc3#n82
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


