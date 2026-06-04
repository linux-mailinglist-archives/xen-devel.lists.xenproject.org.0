Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OqSxJLeCIWrPHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:50:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD4464085A
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:50:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ptkHdYvt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327887.1592600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8Sv-0003yC-D5; Thu, 04 Jun 2026 13:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327887.1592600; Thu, 04 Jun 2026 13:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8Sv-0003vk-AH; Thu, 04 Jun 2026 13:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1327887;
 Thu, 04 Jun 2026 13:50:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV8St-0003ve-Ku
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:50:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV8St-001fjt-1b
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:50:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a21828f-2eae-0a2a0a5409dd-0a2a4503ac36-48
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:50:31 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2182a6-672d-0a2a45030019-d155802eb407-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:50:30 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso9108865e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 06:50:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fcf5bsm80627255e9.9.2026.06.04.06.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 06:50:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780581030; x=1781185830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpbXt0xmlzmISHwgO9YMjCOHtj/ZaG29S1Be+UMwgiE=;
        b=ptkHdYvtKZyb20YhiLu/u7ijwXHXkaZD0TuBW24vr0UFCdESpMFP/EW57Ii67E507K
         hJ7OBg9iBl0FPhH26Loh/LeYrzkjnD50IY+MU1vs+4XdLzQIHtS9+Us9EWej/7pC10Bt
         bOBKmasjOqwiyVaQEi00aQymcR04iNijlelinam5nRwI9lla742ceL9LY0fd1GZeqYXA
         cHmj0pQ3OTwnsn16248J//X+ygei24Wbt20pNg71+MZL63Ms8nSWz2zzyKpNJ/zZ6AQI
         9vsXIcyJb/QQX0QILXO/18CX5IyvIAwFfs9umhIf1YNgMdo2/FWikbK2Lv+Iv6fK8nX4
         vTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581030; x=1781185830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpbXt0xmlzmISHwgO9YMjCOHtj/ZaG29S1Be+UMwgiE=;
        b=YJNsH7kjhoRWci6FUJgsB8w8kr7SK0J6kutUXbqZyg9VvxIl+KOOkpiCF74crSertz
         H8iXJUhWp2EXYV78ORhMZUiCySEC32hK577eDg47lHHWI9fNtl1KG/ARNpJhxKmVBaT2
         UR9l3AL+lg9a3ftPf26YgRII6xJx46ecoRzeJk3QkA3rOV1n6kpO/u61QPd4yaSdfL5q
         dETfob0pO5LL2A7Yp7hSipfH5d3yEvf0HIxNZEHRlSx4C1uNmcpntI38kH+W20Cob4mr
         cKWqbtE5JvLSSEzwkO/ljDKioLNHNUkVqWPwQ14qC7Rci92qkou+1g69MRzQNmLv5kl9
         VVOg==
X-Forwarded-Encrypted: i=1; AFNElJ89VzBs6dk+T0aGDAaz+/g1NqFjPiMA0+0NorvFiQhHCl3BkDqnzhmUpzzK2qoiDdBNcKUSj0pKY68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLEBrdhqS+PG+vEbK5FpXAxBjc7n2sUMh4/uCzCrU7vCBxefv3
	o7bErJCH+NRT0nBWZCbzu/tSzhNxUhmYQggDy57k5nCFIF6Jeb/wlczw
X-Gm-Gg: Acq92OEzX8+ALBrJu8i2zV6zWPeHtkfZWEbgq1+2R5dJpICBcKBT4RV697lBAvBSiNR
	7t7YTLDF48zpT6LZpymCMPbzpXM6Sow+29Mlb8wSjpVCaDWPTFQOwJWNbylmdcEyCDsEfUbALfi
	NzimvAA5ljp0ldyfd0vafcUWnm4RuXZywTHstWCQ+CN1oZL/CnwQl1sEGaVdoRQPtZZoJa+hex/
	UgzakswHEI0s1ioMiehDiuxBdNI2uYTyZxzdKz3mSHAUISlGXaYPzQSr6ZSKDhfUze6aZqWuBo2
	FepRCH+u9SFSN3itLhCEHWl/hKf9a2SZAiqaER+Q1tfuetcPNv6r1KJqRMFjuGvaxrp5dDZD2xs
	L5AXG9RdxdEoYVlG4DNRFiXE3B9eOVYADFwDKc1teWDO6iwFXGjvrCW/VHwnhqi6jdJJKOq6hBi
	BTm+BCojPpDGGgAwYN3BrKBmzZtnSsKmNdSffp0KfHvYjJq+7tGryVxCSuJfnwrYn/JVCnVSXvp
	rlTGUnxZzpSqgqW
X-Received: by 2002:a05:600c:8184:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490b5eb64c9mr116713735e9.7.1780581030120;
        Thu, 04 Jun 2026 06:50:30 -0700 (PDT)
Message-ID: <0bfa979f-f69c-44ce-8a29-4c92876c7fca@gmail.com>
Date: Thu, 4 Jun 2026 15:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/2] x86/mcfg: relax memory map checks on
 newer firmware
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260604132523.95125-1-roger.pau@citrix.com>
 <20260604132523.95125-3-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604132523.95125-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780581031-39B7C938-9885788A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1832
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD4464085A



On 6/4/26 3:25 PM, Roger Pau Monne wrote:
> Per PCI Firmware 3.3 specification, section 4.1.2, ECAM space must be
> reserved by declaring a motherboard resource, but there's no requirement to
> mention it in E820.  The specification additionally states that: the
> resources can optionally be returned in Int15 E820h or EFIGetMemoryMap as
> reserved memory.
> 
> This fixes an issue with detection of extended capabilities when running
> Xen on a Lenovo system that doesn't list the MCFG area as an
> EfiMemoryMappedIO region (or as any other type) in the EFI memory map.
> 
> The more strict logic was introduced in Linux in 2006 as 946f2ee5c731
> ("[PATCH] i386/x86-64: Check that MCFG points to an e820 reserved area").
> This was picked up by Xen when MCFG support was added in 3b35911d709e
> ("Enable pci mmcfg and ATS for x86_64").  Apply an approach similar to
> what Linux has done in 199f968f1484 ("x86/pci: Skip early E820 check for
> ECAM region") and relax the strict reserved region checking so it's only
> done for firmware manufactured prior to 2016.  For firmware from 2016 and
> newer allow MCFG region to reside in holes on the memory map.  Note Xen is
> still more strict than Linux however, as it will refuse to use MCFG regions
> that overlap with memory map regions different than reserved.
> 
> When dom0 boots it can prevent access to misconfigured MCFG regions by
> using the PHYSDEVOP_pci_mmcfg_reserved hypercall.  This brings Xen's early
> usage of MCFG (prior to ACPI AML parsing) more in line with the
> implementation in Linux.

Don't we want to add Fixes: or Ammends: here?

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Generally it looks low-risk patch so:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


