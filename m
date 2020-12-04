Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B952CECF0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44456.79655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97p-0008O6-KK; Fri, 04 Dec 2020 11:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44456.79655; Fri, 04 Dec 2020 11:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl97p-0008Nm-Gh; Fri, 04 Dec 2020 11:19:45 +0000
Received: by outflank-mailman (input) for mailman id 44456;
 Fri, 04 Dec 2020 11:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl97o-0008NK-0n
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:19:44 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b219a16a-513e-4cff-8b60-20e17671e652;
 Fri, 04 Dec 2020 11:19:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h21so6708603wmb.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:19:43 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w3sm2798123wma.3.2020.12.04.03.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:19:42 -0800 (PST)
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
X-Inumbo-ID: b219a16a-513e-4cff-8b60-20e17671e652
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a4wnqHHZ6Nn/GohLuU45bYqVvn4Z6f2TRt09X4KhAiY=;
        b=mZEnONDKNSs3xrhPUy3oxBL2e19ldzBo7m16FBQKu7jUWinDjA9Ufp9aK0/gEchdK4
         mxA0A9s5miF+SRAfOjWwvws08Bf0PL/FHzEGGoVjSRmLwJAq9JrNJ2B1yJBz6qZqNsFp
         xRvJMcO5ZDk4k3mqEthCh3YZBAXX+P4G+gpJ5cX8uA4P3XQgUzL0JNCof7LjNXSkXg8S
         l+Dm6V7RWUPu15jh4repaVkxs+LfgJAitycrfwYNhROD7reuCUZzqAs26HKlbrODAbox
         W/IOjazH4EKX3K6mpuKGovPo3L5tPB7yuaUnpeL6gqZzM/nwRLP4Z8KTHGFX0sdlM1f7
         HAqQ==
X-Gm-Message-State: AOAM533YJXO8ewaE/FvOX5/0pej2DwHWzt2teeogMoYqsJ5JihGY781/
	JGrrOTHKDsSrskzsnywhbOg=
X-Google-Smtp-Source: ABdhPJzZsfkzgkmpXAa9zLsUjnxQi/AfHj/TOwj4g/8Kd9YyrTfo0uvwfAuOzcDA2s74OxXs52co2w==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr3640214wmb.136.1607080782666;
        Fri, 04 Dec 2020 03:19:42 -0800 (PST)
Date: Fri, 4 Dec 2020 11:19:40 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 06/23] libxl: remove extraneous arguments to
 do_pci_remove() in libxl_pci.c
Message-ID: <20201204111940.ocex7wl346wusvbk@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-7-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-7-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:17PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Both 'domid' and 'pci' are available in 'pci_remove_state' so there is no
> need to also pass them as separate arguments.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

