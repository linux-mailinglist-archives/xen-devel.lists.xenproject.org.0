Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36942FED5F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72135.129601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bHz-0001r3-AW; Thu, 21 Jan 2021 14:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72135.129601; Thu, 21 Jan 2021 14:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bHz-0001qf-6s; Thu, 21 Jan 2021 14:50:23 +0000
Received: by outflank-mailman (input) for mailman id 72135;
 Thu, 21 Jan 2021 14:50:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bHx-0001qZ-IW
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:50:21 +0000
Received: from mail-wm1-f41.google.com (unknown [209.85.128.41])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09935d8a-6745-47ee-8ab1-b9b66fde0b1c;
 Thu, 21 Jan 2021 14:50:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o10so5086673wmc.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 06:50:20 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id d16sm6627775wrr.59.2021.01.21.06.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:50:19 -0800 (PST)
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
X-Inumbo-ID: 09935d8a-6745-47ee-8ab1-b9b66fde0b1c
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i38afndSqUivkL6wanQYGBx7huXzY0Fy9sf6Hy2cXGw=;
        b=C5KZitiyN/j25r/EVcVMzEtRXE+YG+TyxG34BLnkSnraSxPjj7QE3z3zMG89DLMTUS
         y3LK/Jfnrs6IWJLpl+CZQCjUKfMr2+txVh1N0LkPf0lasKZQpX09u2vyHmOd61JIRrGc
         oPPovBJ+5DmNqUw62kBIYaSAmUEdpe8FbEKBysSya6ijQNzAoKS3U5bZfdazYkjj7JsD
         wHcbQpYLFSAxh642EwluTNd1+YEaEWTWqWRy20z8HQF72GdHGmC0p3cqTIJbl1NR6zM8
         qW0JaPWs1zzqwB/ZlM5Dbqyl5I+TPb54Is6xPb8yNHzGHmsONsS55eVts4PA+BzLaFRE
         6TXw==
X-Gm-Message-State: AOAM5307FI1kCekPhZ3fIdrIRicYIdUb2qdHuiZ+UX5CM+DPwInS027+
	Su5iy+d8EkcttvXldIhD+JM=
X-Google-Smtp-Source: ABdhPJxn6RGR0qd6+Tm75I+tGa/rOjE6OcorOL9lnP/Bw1NbqtFm9Os/7bsyEk2n0u7xUwX4mq2/IQ==
X-Received: by 2002:a05:600c:268b:: with SMTP id 11mr9457591wmt.132.1611240620288;
        Thu, 21 Jan 2021 06:50:20 -0800 (PST)
Date: Thu, 21 Jan 2021 14:50:17 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v7 7/7] libxl / libxlu: support 'xl pci-attach/detach' by
 name
Message-ID: <20210121145017.nholtkheqdkg2czn@liuwe-devbox-debian-v2>
References: <20210105174642.2754-1-paul@xen.org>
 <20210105174642.2754-8-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105174642.2754-8-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Jan 05, 2021 at 05:46:42PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch modifies libxlu_pci_parse_spec_string() to parse the new 'name'
> parameter of PCI_SPEC_STRING detailed in the updated documention in
> xl-pci-configuration(5) and populate the 'name' field of 'libxl_device_pci'.
> 
> If the 'name' field is non-NULL then both libxl_device_pci_add() and
> libxl_device_pci_remove() will use it to look up the device BDF in
> the list of assignable devices.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

