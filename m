Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC72DB0D2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54363.94410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCnQ-0008IQ-5c; Tue, 15 Dec 2020 16:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54363.94410; Tue, 15 Dec 2020 16:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCnP-0008Hu-VU; Tue, 15 Dec 2020 16:03:27 +0000
Received: by outflank-mailman (input) for mailman id 54363;
 Tue, 15 Dec 2020 16:03:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCnP-0008Hn-0H
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:03:27 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 019b11cd-ac16-4ceb-941d-b4b1f04dc4a9;
 Tue, 15 Dec 2020 16:03:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q75so19005979wme.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:03:25 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o17sm40913983wrg.32.2020.12.15.08.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:03:24 -0800 (PST)
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
X-Inumbo-ID: 019b11cd-ac16-4ceb-941d-b4b1f04dc4a9
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AxpDV0Qn7Vpcq2ewD71QdjCevENkjLkMwzAak0AJxfo=;
        b=qG4K81Gs2Qh3hTyiXKoRuEMuSBspfc7dKfiO6gxwwiiQNVtdHNH2NyPo4ea+8Jhc8j
         bmAIGwNikZClKFd1L/2xxPOW6EXWuAjxj45jan4isBODOb0k8lIRcW0n3SnffaCX2UWG
         Gx1kwUXxKT2bLUCa6ELQTj/0R2hNWCzifpMIPV9Kfo5CvXEbWLLZhCUQi3i6FEf68Q9L
         9zrwSI2jP9VV/460HRKTEEH9pHHFkBpNbv5e3amMaTIlVJXgQcTjwVBzu2uO13MN/zQD
         66iggDZpZfqM7YD3x+rrjaufhZKIfSXkxsyudGfrT5LDHX+bsZbMO6PAe+U9J2LR2b5O
         16qg==
X-Gm-Message-State: AOAM532FY8OWk9rGQxwPb7b6jsQmniwg0YBrEfH94CXKiH4BOCgI79fO
	X/t3W1YTiuJ/ZyJEkGniHbc=
X-Google-Smtp-Source: ABdhPJyj3BHvzVaNjiv28FE2WOrVaHRUJ+bdGiNQtIpzCX4LrJxfo+EIOXXoR/eLb89bvoR2+SSeLA==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr3817895wmh.141.1608048205151;
        Tue, 15 Dec 2020 08:03:25 -0800 (PST)
Date: Tue, 15 Dec 2020 16:03:23 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 22/25] libxl: introduce
 libxl_pci_bdf_assignable_add/remove/list/list_free(), ...
Message-ID: <20201215160323.sb42miugvdchacj2@liuwe-devbox-debian-v2>
References: <20201208193033.11306-1-paul@xen.org>
 <20201208193033.11306-23-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208193033.11306-23-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 07:30:30PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> which support naming and use 'libxl_pci_bdf' rather than 'libxl_device_pci',
> as replacements for libxl_device_pci_assignable_add/remove/list/list_free().
> 
> libxl_pci_bdf_assignable_add() takes a 'name' parameter which is stored in
> xenstore and facilitates two addtional functions added by this patch:
> libxl_pci_bdf_assignable_name2bdf() and libxl_pci_bdf_assignable_bdf2name().
> Currently there are no callers of these two functions. They will be added in
> a subsequent patch.
> 
> libxl_device_pci_assignable_add/remove/list/list_free() are left in place
> for compatibility but are re-implemented in terms of the newly introduced
> functions.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

