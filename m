Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XFieItClEmqV2AYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 09:16:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D75C194C
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 09:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318530.1586723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR33S-0005kn-Q9; Sun, 24 May 2026 07:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318530.1586723; Sun, 24 May 2026 07:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR33S-0005hx-Ml; Sun, 24 May 2026 07:15:22 +0000
Received: by outflank-mailman (input) for mailman id 1318530;
 Sun, 24 May 2026 07:15:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1wR33R-0005hr-Dw
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 07:15:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wR33Q-001RCl-QD
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 09:15:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a12a54e-bab6-0a2a0a5309dd-0a2a450bc578-28
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 09:15:20 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mst@redhat.com>)
 id 6a12a587-212f-0a2a450b0019-aa0a857c7a63-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 09:15:20 +0200
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-N_EH1F6GMv6YyivgHUd6Ag-1; Sun, 24 May 2026 03:15:17 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49051422d55so5886235e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 00:15:16 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490456274ebsm153744685e9.15.2026.05.24.00.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 00:15:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779606919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MeMcg9poW2sZLHBkaJ9tRSZykW1udUhXLX9HUewfT1M=;
	b=TnC9RrnM4pMKbd4tC/9RoKFVNMaDkSp378ZUHQTWgBJRRnCUYse9Pt/UbDpp7OeqF2FWuf
	oxJyZ56EnYA8PZ7CV5a6OsWxPAvq115MxcDM2KzmaPxoTN6XDM5GMEdovNhJ77RtEYeJyH
	MShJkArWGx0VQhujZKnqFyLnMQXIkFs=
X-MC-Unique: N_EH1F6GMv6YyivgHUd6Ag-1
X-Mimecast-MFC-AGG-ID: N_EH1F6GMv6YyivgHUd6Ag_1779606916
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779606916; x=1780211716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeMcg9poW2sZLHBkaJ9tRSZykW1udUhXLX9HUewfT1M=;
        b=X9BjV3MDgV2oSY266W/gPR0VdEcSAHtNvFYqzC3TUDY3zTAw7bfGza+JZvLIGqPwMT
         Sy7mJI+TEulCIYIahsL8WNtJdyuB71lxkdASPiKE/nb8B9KbD5ITg6Ezpk3l0yXJb1Px
         E6IAkIgXB2tVa2hXH4D9AxTtXpRvJKlG/Po0znFd0Xd8OF9QqaVogdDqvO+WnqbcJjy0
         LFq+b1S77xfKxWgy16LO3SrQQn1TNFueRX2JkEtVB+svVtRaHr0BxgyrX1WG2rd37WjV
         YaW9SfI0+ddMaiweQzkaPMAFDd3H8Jb8ibw2yUxzksZZy0jS6lIiLKofcwKe3XqniLLv
         rYaA==
X-Forwarded-Encrypted: i=1; AFNElJ9JZKNcUNYaUH2LeFsozyxKFRwYYZ4xr5xOqTJdi3vwo/cf6MHArgzkpmXi6c8XSyu2kRTDF4yLpPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyiqv7Oh/zd7187ElgCzgSX99m+uXrJzlx/zgbLZrfZtihNF4yM
	9/62iD6f5JUHlQF65b1hkKfQhFm84aPiQf69mZmNA6jOgMbSwZK6JQPtSh8n6g39L9N7TPZdmoa
	/INBArm3DF+CqDX6gO01tSe9walqStpIuU1GSI60gA2L1bG0vAJMeJLTCUTkRnToArnBX
X-Gm-Gg: Acq92OHo2JAAEf6tECqD6sx4Kkp8++JJY1d7MtKs5e2Z2bg/iOVzS8KxfC8EgC6Sb24
	088QYa2mjR1A3rbrY70ejAA3vIBGIe81JW+Axdu/HutoizQDaWE9oQ5QXvwJW+HisJyBhbYK0sd
	2HYIG0whpyWGjrUT7hWDlzqTBjdTzzZ1MH7zO3ojW1P2RlO04jlaQgnQpWJcNiefA/4kv5w8VFM
	C2N/FXzLNblRX5R1Ag150+9UuAg96jOjX88yStJLRhDAH99jX8O6mRBqQS/xEKHtAx9nOBtXulx
	jRv2PEs0gW4j72pxNwS7eMceF1KFy2+t3lmbjCBiFwkQjVKHaXcsdcc6byKMZg5Dds0O1mziN8P
	KXMbXOwrmYjNKBz2RaYbIu7IeSRxeG4Gap6laHcUirxs=
X-Received: by 2002:a05:600c:4f0b:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-490426a4753mr152248405e9.14.1779606915892;
        Sun, 24 May 2026 00:15:15 -0700 (PDT)
X-Received: by 2002:a05:600c:4f0b:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-490426a4753mr152247945e9.14.1779606915505;
        Sun, 24 May 2026 00:15:15 -0700 (PDT)
Date: Sun, 24 May 2026 03:15:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] Xen: Add Q35 initial support for HVM guests
Message-ID: <20260524031423-mutt-send-email-mst@kernel.org>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
MIME-Version: 1.0
In-Reply-To: <20260313164649.794591-1-thierry.escande@vates.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UMLJ2wn_Ads9pNsy3JZ6VGbbhgRre4jvXHr2MJ1VWpc_1779606916
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-ID: tlsNG-42698a/1779606920-18563F3B-3B1B950C/0/0
X-purgate-type: clean
X-purgate-size: 2062
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CC6D75C194C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:46:56PM +0000, Thierry Escande wrote:
> This patch series introduces Q35 chipset support for Xen HVM guests. This is
> based on the work from Alexey Gerasimenko (See patchset [1] for reference).
> 
> This series does not implement device passthrough as this will need more work
> on the Xen side to support multiple PCI buses. Since Q35 chipset does not
> support device hotplugging and with current Xen mechanism for device
> passthrough, they have to be plugged to a new PCIe root port, i.e. not the PCI
> bus 0.
> 
> As a first step for Q35 guests support, this series implements:
> - Legacy interrupt routing for the ICH9 LPC bridge (i.e. not IOAPIC)
> - Xen HVM machine initialization in pc_q35_init()
> - Access to PCIe Extended Config Space
> - Fix for incorrect values and usage for PCIEXBAR masks

Xen maintainers, who's merging this?

> The corresponding patchset for the Xen Project has been posted at [2].
> 
> [1] https://lore.kernel.org/xen-devel/cover.1520867740.git.x1917x@gmail.com/
> [2] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.escande@vates.tech/
> 
> Alexey Gerasimenko (2):
>   pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
>   q35: Fix incorrect values for PCIEXBAR masks
> 
> Thierry Escande (2):
>   q35/xen: Add Xen support for Q35
>   xen: Handle PCIe config space size in cpu_ioreq_config()
> 
>  hw/i386/pc_piix.c         |  2 --
>  hw/i386/pc_q35.c          | 12 +++++++++++-
>  hw/i386/xen/xen-hvm.c     | 38 ++++++++++++++++++++++++++++++++++++++
>  hw/isa/lpc_ich9.c         | 16 +++++++++++++---
>  hw/pci-host/q35.c         |  6 +++---
>  hw/xen/xen-hvm-common.c   | 11 +++++++----
>  include/hw/pci-host/q35.h |  4 ++--
>  include/hw/xen/xen.h      |  5 +++++
>  stubs/xen-hw-stub.c       |  4 ++++
>  9 files changed, 83 insertions(+), 15 deletions(-)
> 
> -- 
> 2.51.0
> 
> 
> 
> --
> Thierry Escande | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech


