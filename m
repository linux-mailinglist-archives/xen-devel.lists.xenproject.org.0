Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4792EAA88
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61851.109017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlHt-0001iP-A8; Tue, 05 Jan 2021 12:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61851.109017; Tue, 05 Jan 2021 12:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlHt-0001hz-70; Tue, 05 Jan 2021 12:18:09 +0000
Received: by outflank-mailman (input) for mailman id 61851;
 Tue, 05 Jan 2021 12:18:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=apNQ=GI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kwlHr-0001hu-QK
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:18:07 +0000
Received: from mail-wr1-f42.google.com (unknown [209.85.221.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aea51ab-163d-40bd-8c2d-a460e1c9f32f;
 Tue, 05 Jan 2021 12:18:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id 91so35949829wrj.7
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 04:18:07 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r20sm106928463wrg.66.2021.01.05.04.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:18:05 -0800 (PST)
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
X-Inumbo-ID: 8aea51ab-163d-40bd-8c2d-a460e1c9f32f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cskje6h7lV46JU0ZKMKbeH/DqSKnxHiO6DslqFB21j8=;
        b=Ba5N3nu1YTsmig2O8ugVHZhCIubZRdeJ2hiq89fWpfA/1qSG2M0gOpIcKQrVbpwl1M
         tVSrKHrM6Npe54KciA4Q9brkoej/qXdN8OM0YEPkIF/yB/u8WgJuQYlqTTG4C2G6ALgh
         2juCUUVWm/y4VtqH+e6SL5Bv+UFXLgtWlQWQHUwQv+J1JBeWubHkF9PRenoto1Jw1GLO
         CKlj6B+yHi3F7xbNrBIMyhGY7kg6W27ATa7b441mK+rgYCe820FJdwnGWNqXI3Ey32lj
         j6j1EqRljFRhUxx2qMItYZB6z7fpR5j+oBwZzOhrHoNqouo8w2yCfolkKso7TM/4jbS4
         Tl/w==
X-Gm-Message-State: AOAM532xpExMkPFPI2CGuROGmnRBUiJTG7STjn9BWzkkT2edMGB4ENbV
	zaiRmDiq3g/QTuXYgXig7K4=
X-Google-Smtp-Source: ABdhPJzodcP0HUzUMI8pqYtCpuzB8rcegN35rZjt0TfplgsR+gJ2jc2QX6MfZ0Rl7APJds/EEECEGw==
X-Received: by 2002:a5d:51cc:: with SMTP id n12mr82669066wrv.375.1609849086365;
        Tue, 05 Jan 2021 04:18:06 -0800 (PST)
Date: Tue, 5 Jan 2021 12:18:04 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libxl: cleanup remaining backend xs dirs after driver
 domain
Message-ID: <20210105121804.ovuq6eiccdd3hmot@liuwe-devbox-debian-v2>
References: <20201108145942.3089012-1-marmarek@invisiblethingslab.com>
 <20201209150121.GM1244@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201209150121.GM1244@mail-itl>
User-Agent: NeoMutt/20180716

On Wed, Dec 09, 2020 at 04:01:21PM +0100, Marek Marczykowski-Górecki wrote:
> On Sun, Nov 08, 2020 at 03:59:42PM +0100, Marek Marczykowski-Górecki wrote:
> > When device is removed, backend domain (which may be a driver domain) is
> > responsible for removing backend entries from xenstore. But in case of
> > driver domain, it has no access to remove all of them - specifically the
> > directory named after frontend-id remains. This may accumulate enough to
> > exceed xenstore quote of the driver domain, breaking further devices.
> > 
> > Fix this by calling libxl__xs_path_cleanup() on the backend path from
> > libxl__device_destroy() in the toolstack domain too. Note
> > libxl__device_destroy() is called when the driver domain already removed
> > what it can (see device_destroy_be_watch_cb()->device_hotplug_done()).
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Ping?

Acked-by: Wei Liu <wl@xen.org>

