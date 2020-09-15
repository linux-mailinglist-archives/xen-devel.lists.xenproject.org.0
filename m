Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A326A99A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 18:21:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIDhn-0002yo-67; Tue, 15 Sep 2020 16:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+xL=CY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kIDhl-0002yc-RH
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 16:21:17 +0000
X-Inumbo-ID: 692ef10e-c7f5-4c3c-a749-5f6102f03511
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 692ef10e-c7f5-4c3c-a749-5f6102f03511;
 Tue, 15 Sep 2020 16:21:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x14so3942936wrl.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2020 09:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fDPIJuk2Das/qwWw1BWSsMKNqGHaDGuoVcWN+Ipz0ZI=;
 b=EbhzW5kBK5c9fi1Y6wO40jTMJhJ6f9pshX+o9+dYFgSRd0umufQMP9BQ6vDYDlBr78
 u8p139U3oq/M8xJt2pw7qG0w+EF6dBmk4gXakpg4W3V9q7TQqTyggw5jfOTjgfMvSzWy
 VMBxeO5Bv2oxMBcnoBMuQNx8wcbfw4cZUkOKZq9LkO7EH0mpiWe7RobF95i07dp3+BEN
 wWgKUW7qSTVK706VKWKvsR0SVSndH37O4cdVM+W/rjyNvRSSHGQ8Ezezu0pCiuLuev1a
 7B8tsv4RY0Wg5U5uLgxcwXV01ILzjXWqazZ7n81kI6g0wRJg5NP4MfaAWA+Nmkj1WFjW
 r4nA==
X-Gm-Message-State: AOAM531IKF8lS7mozaOrQd3JzqWoToLxl7Bu0V+gZB/pAWaFtKRiaeUL
 TwQaTV7H3gvKR3XoAAyVAH0=
X-Google-Smtp-Source: ABdhPJy9cwXcLnhphhirK8hnCpPmw5WXRyANS8JTjjZggKiYiRyDBzUfZ/jQjobjez4QxAlU8mNLyA==
X-Received: by 2002:a5d:68d1:: with SMTP id p17mr21430949wrw.378.1600186876244; 
 Tue, 15 Sep 2020 09:21:16 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z9sm89342wmg.46.2020.09.15.09.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 09:21:15 -0700 (PDT)
Date: Tue, 15 Sep 2020 16:21:14 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/2] libxl: provide a mechanism to define a device
 'safe remove' function...
Message-ID: <20200915162114.rkbsxnjup6xicg2z@liuwe-devbox-debian-v2>
References: <20200915141007.25965-1-paul@xen.org>
 <20200915141007.25965-2-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915141007.25965-2-paul@xen.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 15, 2020 at 03:10:06PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and use it to define libxl_device_disk_safe_remove().
> 
> This patch builds on the existent macro magic by using a new value of the
> 'force' field in in libxl__ao_device.
> It is currently defined as an int but is used in a boolean manner where
> 1 means the operation is forced and 0 means it is not (but is actually forced
> after a 10s time-out). In adding a third value, this patch re-defines 'force'
> as a struct type (libxl__force) with a single 'flag' field taking an
> enumerated value:
> 
> LIBXL__FORCE_AUTO - corresponding to the old 0 value
> LIBXL__FORCE_ON   - corresponding to the old 1 value
> LIBXL__FORCE_OFF  - the new value
> 
> The LIBXL_DEFINE_DEVICE_REMOVE() macro is then modified to define the
> libxl_device_<type>_remove() and libxl_device_<type>_destroy() functions,
> setting LIBXL__FORCE_AUTO and LIBXL__FORCE_ON (respectively) in the
> libxl__ao_device passed to libxl__initiate_device_generic_remove() and a
> new macro, LIBXL_DEFINE_DEVICE_SAFE_REMOVE(), is defined that sets
> LIBXL__FORCE_OFF instead. This macro is used to define the new
> libxl_device_disk_safe_remove() function.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Wei Liu <wl@xen.org>

