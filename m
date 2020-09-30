Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74227EBDA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802.2693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdj9-0005ny-Jf; Wed, 30 Sep 2020 15:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802.2693; Wed, 30 Sep 2020 15:09:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdj9-0005nZ-G8; Wed, 30 Sep 2020 15:09:07 +0000
Received: by outflank-mailman (input) for mailman id 802;
 Wed, 30 Sep 2020 15:09:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdj8-0005nS-0P
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:09:06 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f235f51b-bd22-4728-a914-2b27e038796e;
 Wed, 30 Sep 2020 15:09:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v12so2164381wmh.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:09:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z67sm3700188wme.41.2020.09.30.08.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:09:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdj8-0005nS-0P
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:09:06 +0000
X-Inumbo-ID: f235f51b-bd22-4728-a914-2b27e038796e
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f235f51b-bd22-4728-a914-2b27e038796e;
	Wed, 30 Sep 2020 15:09:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v12so2164381wmh.3
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yNZ5iR1STieBaOgupH/JoXCWtKP/iwQy3Ir9g3UJwEQ=;
        b=GJ4rWoh3QBMbVj27GZaZYT/tCbXpmxUWhArJUH68WkP6I7ASHNJf5U0QUJmLdjdUd/
         KC7yi12lkSdeLRzhuW+C7Cw1eGRBnIb+wouOkCVC50X1gsIybnGA+uy3Lc7e4V5Aq9Rm
         CP7ikGEapueE8wt1cNgxTqX+K1+PwUpPCx60mtridh1B7RYDfQafiVC5IG4U2KfOm0I3
         +Vqf+R3+yuWCP/7l9bEmfu3qQRN1x071WRXaWoUTU3tLojGjnvl3F254INnOu/9zRFz4
         LCUZA2VnnWhnSPX5+OLB/CXzCNyL5QJ9bZriCWpY1bbkR2ogNtenwR3RrK67lyHuOjjM
         kJ9Q==
X-Gm-Message-State: AOAM532ZlUqF37//4KvjGZz1ZaM+vK7bbUDu3i7zl8WclqMfB6V9buc5
	2Dl46u/r+OM6fZn+2Aqcaog=
X-Google-Smtp-Source: ABdhPJxennDtIK4gZWl/xC0SpjR2twUsMC1PjTMI7gjrv6qsekVunDAicZVwxum9kGEwLVrMqrD17A==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr3726593wmi.21.1601478544367;
        Wed, 30 Sep 2020 08:09:04 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id z67sm3700188wme.41.2020.09.30.08.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:09:03 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:09:02 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] tools: Fix configure of upstream QEMU
Message-ID: <20200930150902.lrk47grcbnspvlof@liuwe-devbox-debian-v2>
References: <20200923110323.1980725-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923110323.1980725-1-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 23, 2020 at 12:03:23PM +0100, Anthony PERARD wrote:
> QEMU as recently switch its build system to use meson and the
> ./configure step with meson is more restrictive that the step used to
> be, most installation path wants to be within prefix, otherwise we
> have this error message:
> 
>     ERROR: The value of the 'datadir' option is '/usr/share/qemu-xen' which must be a subdir of the prefix '/usr/lib/xen'.
> 
> In order to workaround the limitation, we will set prefix to the same
> one as for the rest of Xen installation, and set all the other paths.
> 
> For reference, a thread in qemu-devel:
>     "configure with datadir outside of --prefix fails with meson"
>     https://lore.kernel.org/qemu-devel/20200918133012.GH2024@perard.uk.xensource.com/t/
> 
> And an issue in meson:
>     "artificial limitation of directories (forced to be in prefix)"
>     https://github.com/mesonbuild/meson/issues/2561
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> I've tested the change with an oldish QEMU, qemu-xen-4.12, and the
> layout of the tarball generated by osstest doesn't change.

Acked-by: Wei Liu <wl@xen.org>

