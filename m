Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AB2CED0B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44517.79776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9H8-00029c-74; Fri, 04 Dec 2020 11:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44517.79776; Fri, 04 Dec 2020 11:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9H8-00029D-3x; Fri, 04 Dec 2020 11:29:22 +0000
Received: by outflank-mailman (input) for mailman id 44517;
 Fri, 04 Dec 2020 11:29:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9H5-00028g-Ug
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:29:19 +0000
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b06e870e-fbd4-49f8-b830-32da89671e08;
 Fri, 04 Dec 2020 11:29:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s8so4971866wrw.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:29:18 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 64sm2820559wmd.12.2020.12.04.03.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:29:16 -0800 (PST)
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
X-Inumbo-ID: b06e870e-fbd4-49f8-b830-32da89671e08
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8JcoC/cE2Sni0QVP8Rh/OxtpAcstxTODBod/LqoYel4=;
        b=HNdy3HU9kIKPLh7fwYQTh5I+Fw/HZTNtLUjGWL/bR2vma03MHoeVA+9uhj9i2rUKy8
         8DykdWZbf6NjpbMb7AtCzlxh0kRQ44XphvW0WXjKmYTb0KbkjC5zdvG1gU410pPHC2eL
         BpKlJTkbXjNkWjoEYft5aQiK4YLdrnFIsaLfrsfWTr+mgRURIF5JuJ2uQQuojYIIAfc4
         a4RDMo4CIfPG47wpxB5Ry0MCnsMCx3qy6e50GuEO//cLeyS5Xv+lsK9qVYBTAcj1Mfzn
         uhhPuiZhf5BMNt1u+RdmofRQv0Wxu0c5Ux6AQrRZ7yiypNENTCzoUhsPoNXJ8LXWAfx1
         ObLA==
X-Gm-Message-State: AOAM531yP0C4bs8Vw7zWAw3JgaaRPD13bQF0/aeAEoLwO/xW4vEgVFdF
	VeREufUPtfhmN2QRuvrpkXE=
X-Google-Smtp-Source: ABdhPJw8S0m2dIYTW0qSdEaBxQ2CYzaOJa+zaWCuc278qRh5ciSy03YAzBxbFOgfqegP9Gwq/c3mHw==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr4547721wrp.51.1607081357296;
        Fri, 04 Dec 2020 03:29:17 -0800 (PST)
Date: Fri, 4 Dec 2020 11:29:15 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 12/23] libxl: add
 libxl_device_pci_assignable_list_free()...
Message-ID: <20201204112915.p3i4necmgvtpmtkp@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-13-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-13-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:23PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to be used by callers of libxl_device_pci_assignable_list().
> 
> Currently there is no API for callers of libxl_device_pci_assignable_list()
> to free the list. The xl function pciassignable_list() calls
> libxl_device_pci_dispose() on each element of the returned list, but
> libxl_pci_assignable() in libxl_pci.c does not. Neither does the implementation
> of libxl_device_pci_assignable_list() call libxl_device_pci_init().
> 
> This patch adds the new API function, makes sure it is used everywhere and
> also modifies libxl_device_pci_assignable_list() to initialize list
> entries rather than just zeroing them.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

