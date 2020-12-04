Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF12CECE2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44439.79609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl95X-0007wg-DT; Fri, 04 Dec 2020 11:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44439.79609; Fri, 04 Dec 2020 11:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl95X-0007wH-AO; Fri, 04 Dec 2020 11:17:23 +0000
Received: by outflank-mailman (input) for mailman id 44439;
 Fri, 04 Dec 2020 11:17:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl95W-0007wC-H6
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:17:22 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7866aea6-3b3e-4b16-b38a-aa8639c0b333;
 Fri, 04 Dec 2020 11:17:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g25so4496577wmh.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:17:21 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k1sm3179051wrp.23.2020.12.04.03.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:17:20 -0800 (PST)
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
X-Inumbo-ID: 7866aea6-3b3e-4b16-b38a-aa8639c0b333
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YrkIW5eZe1PTKwVNEi3pHF2+fCyhthMg1SVSgIuHqdQ=;
        b=uAumc/t9Txj4dXj/Py6ThvXdnXcLSgh1PcIpFLhS5jCIIRGdDqRmIWx21B4uLj/5SO
         ZAhJRSjaFhNWbxa8jyJGo4aTcvk5mhFeLNA9NapZglGWVzhHCzm9HXp7+zJsTjR4oaM7
         kLl9jjqIOWadxy+dQrEItUCYG8rYGXbmUO4aDxIkqokBmmPBisybk00wJORAaUZjo1P4
         YkFgKHKuhJRDbspKDlKMYgqwsriSWUBabuy3ZRd7YQ8x2VRroolEDPpWwECkrzubg8Rl
         6ZBYdWVd3TNgygR9uMkrBq/WMF9EXdFbGMbri+Xg3uUMmy2hJVUlLKtlcUBaBaPlQFbZ
         Zc4w==
X-Gm-Message-State: AOAM533VFSWs1ESYZssDhXQj0ZhGaAEkZbvprb9KlvoBn19aR5E3EM0/
	2kYm99p+MO0tPoRVDgXkv90=
X-Google-Smtp-Source: ABdhPJwp7Dwc62vxAd3scwCvSIKjwSMrwsxsp74qhykFOwImb9lLoBkIhoQ0g6O28D5tdjd0O4j9MA==
X-Received: by 2002:a1c:bdc1:: with SMTP id n184mr3665157wmf.125.1607080641086;
        Fri, 04 Dec 2020 03:17:21 -0800 (PST)
Date: Fri, 4 Dec 2020 11:17:19 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 02/23] libxl: make libxl__device_list() work correctly
 for LIBXL__DEVICE_KIND_PCI...
Message-ID: <20201204111719.cfclb6wgdcroncfp@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-3-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-3-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:13PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... devices.
> 
> Currently there is an assumption built into libxl__device_list() that device
> backends are fully enumarated under the '/libxl' path in xenstore. This is
> not the case for PCI backend devices, which are only properly enumerated
> under '/local/domain/0/backend'.
> 
> This patch adds a new get_path() method to libxl__device_type to allow a
> backend implementation (such as PCI) to specify the xenstore path where
> devices are enumerated and modifies libxl__device_list() to use this method
> if it is available. Also, if the get_num() method is defined then the
> from_xenstore() method expects to be passed the backend path without the device
> number concatenated, so this issue is also rectified.
> 
> Having made libxl__device_list() work correctly, this patch removes the
> open-coded libxl_pci_device_pci_list() in favour of an evaluation of the
> LIBXL_DEFINE_DEVICE_LIST() macro. This has the side-effect of also defining
> libxl_pci_device_pci_list_free() which will be used in subsequent patches.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

