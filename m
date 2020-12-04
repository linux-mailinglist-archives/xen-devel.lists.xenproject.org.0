Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2710E2CED29
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:38:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44593.79921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Py-0004WC-3K; Fri, 04 Dec 2020 11:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44593.79921; Fri, 04 Dec 2020 11:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9Px-0004Vo-Uu; Fri, 04 Dec 2020 11:38:29 +0000
Received: by outflank-mailman (input) for mailman id 44593;
 Fri, 04 Dec 2020 11:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9Pw-0004VX-LM
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:38:28 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89266af4-bb93-4676-a4cf-9a2a4e0a3d65;
 Fri, 04 Dec 2020 11:38:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g25so4532932wmh.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:38:27 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p3sm3172013wrs.50.2020.12.04.03.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:38:26 -0800 (PST)
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
X-Inumbo-ID: 89266af4-bb93-4676-a4cf-9a2a4e0a3d65
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d2Hs/IyxORafj1wNe3j9Btm1enpTpYSVPM2koPpNpn4=;
        b=mLWCPTXqa9bcUSOXw1gqsAGS+zCjOInpxeLRKFQNunO1T//5q6u97Gx545mwrJboPz
         yyiiFabupQn6k4jGUJR2jm8nJBG0zupNrXn2EX5I2R5pSjQTVGP3kQyT7lF4k+PG7moc
         ZGrzV/o5tO4jIsJMksbV5y/V+WYVi1rJTrsJE/fIC/MZJAkAuzxI1NG8drHw4i/BjgHx
         CJI5BKAXLxu8CkyXjgjhdGsxOZ6ohFEM3Qg55XQgRE2jZ3aNm/dz7Sw8dm8uxEK7vFvd
         efaaD9qpOZXfXuRbdhkBEBjEK9JMQ8qMZ79gRSnQg4CR+uSiD9FiyF88VChJkjxJ4RKb
         MD3g==
X-Gm-Message-State: AOAM533wCxVsJgag7EN1OkvLbLCDAVgWinQLb19VdqitrzDYRXXFGvxM
	K1/922EWKzsNrXk1ICdPu6s=
X-Google-Smtp-Source: ABdhPJysJ4asnN+EzJIw2QbY3D9tzR3VxVZskACpBfEg+wqHueFQa1VeNlQRGo9t+uBEhvQWYwwjpg==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr3810600wmb.122.1607081907283;
        Fri, 04 Dec 2020 03:38:27 -0800 (PST)
Date: Fri, 4 Dec 2020 11:38:25 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 23/23] xl / libxl: support 'xl pci-attach/detach' by
 name
Message-ID: <20201204113825.32mzkysfp7d6frmz@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-24-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-24-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:34PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch adds a 'name' field into the idl for 'libxl_device_pci' and
> libxlu_pci_parse_spec_string() is modified to parse the new 'name'
> parameter of PCI_SPEC_STRING detailed in the updated documention in
> xl-pci-configuration(5).
> 
> If the 'name' field is non-NULL then both libxl_device_pci_add() and
> libxl_device_pci_remove() will use it to look up the device BDF in
> the list of assignable devices.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

