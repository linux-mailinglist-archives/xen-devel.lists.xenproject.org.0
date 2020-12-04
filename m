Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB512CED09
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44511.79753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9G8-0001xY-Ft; Fri, 04 Dec 2020 11:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44511.79753; Fri, 04 Dec 2020 11:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9G8-0001x9-CM; Fri, 04 Dec 2020 11:28:20 +0000
Received: by outflank-mailman (input) for mailman id 44511;
 Fri, 04 Dec 2020 11:28:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9G7-0001x4-H2
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:28:19 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2deff73-ca01-4a94-8db8-fe2eed1459a7;
 Fri, 04 Dec 2020 11:28:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t4so4949165wrr.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:28:18 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y7sm2803038wmb.37.2020.12.04.03.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:28:17 -0800 (PST)
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
X-Inumbo-ID: a2deff73-ca01-4a94-8db8-fe2eed1459a7
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+hjSwgSDIvBj3Sb379n+N796YCNP7m2cy9yPk0T11TA=;
        b=LgryIRHLfKD0wwrx+HQqNVOg+cqLw9q2XDVx/MIiajkjWfV3aj8GxTv34rb3l+V3fY
         /gEzuc5V3WQTgvo3KJqRnYB4RBbhL4q4IVkVCTM6LrNI7sbMM8uif5DpyAXocYfmgmSb
         vsKnNPpHRmFaqA4Q9bTzrJMMwTBRaWjl1ms984KP1pyiXu97Rz0n+iYeSYKx42AayPMK
         hx1tddpnyE3ecWGtB0ULHTA2pnGRGyZGfufAHgnTNDfDH7Y0HffD+YTDTtAdt99RiS2T
         kJba8KlB37HH36r74DGr2zh+W+TtACg2s6aiRxsFUkor9GhtAYvTxXFohs6m/uV55OBt
         2P3Q==
X-Gm-Message-State: AOAM532QVy3buqY8FXJqhaWvv3qsnib4o283cPBw3zv5NolSv301fs0q
	cDCcZNMsif/yQcSvKdV7dXk=
X-Google-Smtp-Source: ABdhPJw8TFaiQ7bKQG5+6IXVdT4S/Fcge6kqNTTir/GW1WFyk/kJmHu7Lg/O6Hf38wP7Pl1jC5lD/w==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr4406556wrp.71.1607081297899;
        Fri, 04 Dec 2020 03:28:17 -0800 (PST)
Date: Fri, 4 Dec 2020 11:28:16 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 11/23] libxl: make sure callers of
 libxl_device_pci_list() free the list after use
Message-ID: <20201204112816.cl6fr6pgzxaopmds@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-12-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-12-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:22PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> A previous patch introduced libxl_device_pci_list_free() which should be used
> by callers of libxl_device_pci_list() to properly dispose of the exported
> 'libxl_device_pci' types and the free the memory holding them. Whilst all
> current callers do ensure the memory is freed, only the code in xl's
> pcilist() function actually calls libxl_device_pci_dispose(). As it stands
> this laxity does not lead to any memory leaks, but the simple addition of
> .e.g. a 'string' into the idl definition of 'libxl_device_pci' would lead
> to leaks.
> 
> This patch makes sure all callers of libxl_device_pci_list() can call
> libxl_device_pci_list_free() by keeping copies of 'libxl_device_pci'
> structures inline in 'pci_add_state' and 'pci_remove_state' (and also making
> sure these are properly disposed at the end of the operations) rather
> than keeping pointers to the structures returned by libxl_device_pci_list().
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

