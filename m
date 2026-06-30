Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xaGGK/dcQ2pTXQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 08:06:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB16E09A3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 08:06:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=S8pNxbsZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348326.1606118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weRbJ-0004py-RY; Tue, 30 Jun 2026 06:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348326.1606118; Tue, 30 Jun 2026 06:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weRbJ-0004nG-LR; Tue, 30 Jun 2026 06:05:41 +0000
Received: by outflank-mailman (input) for mailman id 1348326;
 Tue, 30 Jun 2026 06:05:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weRbI-0004nA-Rn
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 06:05:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weRbG-00HCAO-7W
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 08:05:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a435c9f-5cb7-0a2a0a5109dd-0a2a4507c434-30
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:05:34 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a435cae-9c8e-0a2a45070019-d1558036bd9b-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 08:05:34 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so1249135e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 23:05:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8c79baasm43714205e9.7.2026.06.29.23.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 23:05:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1782799534; x=1783404334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bxaQgD0vAwt64Up0sv8ZwsySz9w07nkz+lAwYuCowM4=;
        b=S8pNxbsZjybvxVmMPpCdPVnT/zhGY9ljOBA6Lf4v1ocojfIQHDATFkxBkjrYg1BL2w
         mv6eQb86/l0eq+B/wYGyfXkMy1kWTy/RjwcOR5XBNB1q3LIqkLXiK/v0NE+hh7T3dkYn
         cYeSqPCoqA84Dmr/Q8ypGW3jv0VgffBq/8TqPELGa2Rqor5D3QI2XAB5v5DYufDOC7//
         ZjFP7C/oBKwWidC2GuPXZmdbc2xlNemAT+WToG7ersb5axPsTDM9BVrCCz8xGOIXdQAf
         vJZ5LTHWpEE0BktksvOiTzE7GBRSMgt7KQjHn4QdEfFWaj1kNvOSjSFcB17RB1HlHUy0
         97aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799534; x=1783404334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxaQgD0vAwt64Up0sv8ZwsySz9w07nkz+lAwYuCowM4=;
        b=UB0iKDADcQgHYAXCTTehnvqCpcwJANaAaW/Lc7vdCe6drUS4GtXSDI8L+K7sdlK52b
         fr4iwDX9REr2AtMaNaT+a0S5oCXQtYDl++cAMNPG9U9u1kZ33W0dnfaIzmk6AOfu5fgL
         J2olqK/AFWPkmlt4QZMoCXhJZ7j1dw3xJnvSMLCSZTuzmZ4M0MxqLijLYeG5T126XLM5
         0XZstm6AU/KmwFQj1k0whAdFU5PPFS6pjfOFEXk3bRVNB3YI1FBPKtm6kF4Gjlt+TllY
         FLOPJH/J5Y4LrGx7HguWGuE6beGBQzxu7WA5hzsziTCMN6U0FJDopqbmeMxm493vsDww
         Dt3g==
X-Forwarded-Encrypted: i=1; AFNElJ+eORnhhW1ejofh0WfjkviP1XGCaI4slUn8eV8wuecDs+/zlsFCUPfTpdTxKf9KokJ6MNQSSHHQbhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0VaicecTAxLgC9XFC7EV3UP9MZGEE4pCLKhoBsKfpRmz4HpFY
	5UBYLwxlsSC6qRYKyvukvnBmnOftJ8ACaO4snaZslCrRh4EXvB0Bg7+6iNNYgAhq9A==
X-Gm-Gg: AfdE7clW+jFfSzlbDIGpniNto5LWyrql4x4jSSGZ+Nz3cK/j12IO2yh1E6yiBs1JsHW
	YyyJaRQyjCthCVCFlzi6XIntim+NBJt57k1QO7xst7wVDHpBsFkapiyok7otQjqfwSofmANAEo+
	vc/kmrV2f8h6JGFpo0SMQEvgRRzdwFB6ySSW/udhqb4dPyB7B8lIc2Kc3gMdw/o3X3oNroVCOd6
	UhZgBWho7TO46vj2/cUoqxQp5w9JdUIAS3fc0BxxkkcVPKJC/uhOKoh6JYQZykynbXOCX8nYbPq
	DqxpzSYOhNkJesZzh5x6UZRJbGEGFJ/DPFRKcGY6ll5FJ99vxKLIM+7IRGnT/z8WvPKBF7Namcu
	jcA4EM5zzqI0QfyXi6KJKk6L1Vt4oEqBua/Bb2ckIvXadQNrayScw+AXj9dLTZOptUGgta/U5s+
	9+i4NFROuReaN2ungffzjYYa+41pz9Uoe0Ztl3LLOaGd6/ksABzglVg6zIyXh0CB2WNdT9c8c1B
	yOEKUDD3YNispE=
X-Received: by 2002:a05:600d:4441:20b0:493:b915:4a6f with SMTP id 5b1f17b1804b1-493b9154ca1mr17043455e9.8.1782799534035;
        Mon, 29 Jun 2026 23:05:34 -0700 (PDT)
Message-ID: <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
Date: Tue, 30 Jun 2026 08:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/18] PCI SBDF Refactoring
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
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
In-Reply-To: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782799534-FF93225E-B12F6E94/0/0
X-purgate-type: clean
X-purgate-size: 1288
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.82 / 15.00];
	SEM_URIBL_FRESH15(3.00)[ioapic.info:url];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[suse.com:s=google];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06AB16E09A3

On 29.06.2026 19:21, Teddy Astie wrote:
> Teddy Astie (18):
>   pci: Use pci_sbdf_t in pci_device_detect()
>   pci: Use pci_sbdf_t in pci_add_device()
>   pci: Use pci_sbdf_t in pci_prepare_msix()
>   pci: Use pci_sbdf_t in pci_remove_device()
>   pci: Use pci_sbdf_t in pci_ro_device()
>   pci: Use pci_sbdf_t in pci_hide_device()
>   pci: Use pci_sbdf_t pci_check_disable_device()
>   pci: Introduce parse_pci_sbdf{_seg}()
>   amd/iommu: Parse into pci_sbdf_t directly
>   vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
>   drivers/char/xhci: Parse into pci_sbdf_t directly
>   ns16550: Parse into pci_sbdf_t directly
>   vtd: Rename acpi_ioapic_unit.ioapic.info to acpi_ioapic_unit.bdf
>   pci: Use pci_sbdf_t in _scan_pci_devices
>   pci: Allow ommiting func when parsing with parse_pci_sbdf()
>   ehci-dbgp: Use pci_sbdf_t instead of (bus, slot, func)
>   pci: Drop parse_pci_split{_seg}()
>   RFC: docs: Document support for PCI segment in dbgp and comN parameter

Just to mention that your patches still arrive in an odd way (same as v2). In
my inbox, the cover letter is isolated while the patches themselves show as a
thread. On https://lists.xen.org/archives/html/xen-devel/2026-06/threads.html
it's even worse - all patches show up individually.

Jan

