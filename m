Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALMIEmmsEmq42gYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 09:44:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9765C1A1A
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 09:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318554.1586740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR3VR-0002Nd-8D; Sun, 24 May 2026 07:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318554.1586740; Sun, 24 May 2026 07:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR3VR-0002Kn-5R; Sun, 24 May 2026 07:44:17 +0000
Received: by outflank-mailman (input) for mailman id 1318554;
 Sun, 24 May 2026 07:44:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1wR3VO-0002Kh-Ub
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 07:44:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wR3VO-00DB05-Ap
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 09:44:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a12ac36-5cb7-0a2a0a5109dd-0a2a4502eb7e-12
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 09:44:14 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mst@redhat.com>)
 id 6a12ac48-af86-0a2a45020019-aa0a857c7265-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 09:44:13 +0200
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-HPj7AkDRM9y3ZA0gp2j0Mw-1; Sun, 24 May 2026 03:43:55 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49041d39887so15178985e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 00:43:52 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ec7fcd7f9sm4733435f8f.37.2026.05.24.00.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 00:43:49 -0700 (PDT)
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
	s=mimecast20190719; t=1779608648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d31P/47NSDwQAWFSW6gul/ImIejpiWKEwkFsv0GPKu4=;
	b=Wn775bIpvOKhFBBj2pln9Z1xVaVmsirkCJzAeul3Jr46vftlEf9o7JzaI6SAxQ1z7RxOTT
	kmLvzbnXnwg1HHqlEngyyvrVQRl/v8hQYyFTUzY8C54D2mSbS+aD8IKXlQDmfsane1Hdls
	sAnwsGh+oLoj3EAN3/8CiwH+Xsy8UJI=
X-MC-Unique: HPj7AkDRM9y3ZA0gp2j0Mw-1
X-Mimecast-MFC-AGG-ID: HPj7AkDRM9y3ZA0gp2j0Mw_1779608631
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779608631; x=1780213431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d31P/47NSDwQAWFSW6gul/ImIejpiWKEwkFsv0GPKu4=;
        b=bBYdGIGTK3R1ElroSy2tEvcnzHOSDERgb1M37zLT7z4KboaWltO0EMILyw+JU8RISg
         +S5X9PO7Qc+XJeRcmpoOJK11OdAotJFBQ2HcfaAd4F3cAZx2u/A0VzaNxG5jPUS9teEO
         5Q3yTTpbK9yiaOe+Oo2FFSb5BLBosdeXzohPpjDMis2cBZHMlJZ+rb/YeyNC2zaZojY5
         vMRuD6J4/p8BVoG8JJEfhWeL1AdlaQeDdikbidMgxAOKA2rQjB8KJUIgJIxFPvDpmhss
         HkVLrltFuNPa8Ut9aUoPyy0OOVe9QfcL+f/2s8IYZn6YknxmpcuSem/1Ozm1naQCtMgj
         687g==
X-Forwarded-Encrypted: i=1; AFNElJ891/IpiKWAWexx1dMJ60Od/dpqy7VWc08/iruDmRVdHFQw08WlzoASCr8LqaQZbme2quklZy8Wdsc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3vYWGRbJ9j+cvFsv22ushzMR9GJXbKzm5xF6s8lDUY8s0ZNGW
	mmlmkZy0qEktdNPof2m0ecx2SYQ6HFyDFLCHeKLNSDYHhEvk2a07P37xbF+JpDToZkHL8KkZZfN
	fHlcSk4BNCe0tfCxltRycH24DBP78GE2nk86M23JMycqwFlw9ObFmlhsu5HMnmhl8pcdg
X-Gm-Gg: Acq92OEHaVF7IS+/wuv9/m/XQmvaPKALUe7iV5gwOAbYULR+bjD1LdDKahOmrddd2XW
	zfefWdYBUlFksiJrBw4fYr3OhELvVlroe35kVLEgMf4eDAbbTg4qG8hvWLVoDQgQ5Dzn/ZK4acz
	6F+QJIIcSor//e0O34IUzwUBlBznw3KE9pvS1j1gf0RzQjtOpTELFkplhdIBu4dfGZKdzY6jchS
	kYQAHMB7CXIQYUV4W0QOeV68uZoCBB/7qGasnTC9xCGXH/CQ9KwAZ+ppunk02XoNOYnjx/z+/7N
	Qnl8jJf2zMpqOKOUbtOxmOgRyMX0IZvmR4YdYGFHgOc5pULr5xAWpRYPvJSuQZszaA4mI3enwbp
	Ld+l45X4BvF0J6nA6nNy9X0JqMLlSbmqdP6IDV08hZRc=
X-Received: by 2002:a05:600c:1393:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-490428e15e9mr155921965e9.29.1779608630984;
        Sun, 24 May 2026 00:43:50 -0700 (PDT)
X-Received: by 2002:a05:600c:1393:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-490428e15e9mr155921545e9.29.1779608630486;
        Sun, 24 May 2026 00:43:50 -0700 (PDT)
Date: Sun, 24 May 2026 03:43:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: qemu-devel@nongnu.org, Alexey Gerasimenko <x1917x@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/4] q35: Fix incorrect values for PCIEXBAR masks
Message-ID: <20260524034330-mutt-send-email-mst@kernel.org>
References: <20260313164649.794591-1-thierry.escande@vates.tech>
 <20260313164649.794591-4-thierry.escande@vates.tech>
MIME-Version: 1.0
In-Reply-To: <20260313164649.794591-4-thierry.escande@vates.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GvbJn9nt70AJek-a76xWxoW6KvuYzTsD9sK-ymqt1cg_1779608631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-ID: tlsNG-720697/1779608654-82D6F161-58F8FA19/0/0
X-purgate-type: clean
X-purgate-size: 2927
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FREEMAIL_CC(0.00)[nongnu.org,gmail.com,redhat.com,linaro.org,habkost.net,xenproject.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:qemu-devel@nongnu.org,m:x1917x@gmail.com,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:eduardo@habkost.net,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[mst@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9D9765C1A1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:47:16PM +0000, Thierry Escande wrote:
> From: Alexey Gerasimenko <x1917x@gmail.com>
> 
> There are two small issues in PCIEXBAR address mask handling:
> - wrong bit positions for address mask bits (see PCIEXBAR description
>   in Q35 datasheet)
> - incorrect usage of 64ADR_MASK
> 
> Due to this, attempting to write a valid PCIEXBAR address may cause it
> to shift to another address, causing memory layout corruption where
> emulated MMIO regions may overlap real (passed through) MMIO ranges. Fix
> this by providing correct values.
> 
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/pci-host/q35.c         | 6 +++---
>  include/hw/pci-host/q35.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index e85e4227b3..7368e3c598 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -306,12 +306,12 @@ static void mch_update_pciexbar(MCHPCIState *mch)
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M:
>          length = 128 * 1024 * 1024;
> -        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK |
> -            MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
> +        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_64M:
>          length = 64 * 1024 * 1024;
> -        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
> +        addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK |
> +            MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK;
>          break;
>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
>          qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index ddafc3f2e3..f31a71010b 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -100,8 +100,8 @@ struct Q35PCIHost {
>  #define MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT       0xb0000000
>  #define MCH_HOST_BRIDGE_PCIEXBAR_MAX           (0x10000000) /* 256M */
>  #define MCH_HOST_BRIDGE_PCIEXBAR_ADMSK         Q35_MASK(64, 35, 28)
> -#define MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK      ((uint64_t)(1 << 26))
> -#define MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK       ((uint64_t)(1 << 25))
> +#define MCH_HOST_BRIDGE_PCIEXBAR_128ADMSK      ((uint64_t)(1 << 27))
> +#define MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK       ((uint64_t)(1 << 26))
>  #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_MASK   ((uint64_t)(0x3 << 1))
>  #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_256M   ((uint64_t)(0x0 << 1))
>  #define MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_128M   ((uint64_t)(0x1 << 1))
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


