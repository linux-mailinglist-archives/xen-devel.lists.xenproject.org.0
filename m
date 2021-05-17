Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFBA382C78
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 14:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128216.240735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1licbT-0005Rh-Jd; Mon, 17 May 2021 12:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128216.240735; Mon, 17 May 2021 12:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1licbT-0005PH-GZ; Mon, 17 May 2021 12:44:11 +0000
Received: by outflank-mailman (input) for mailman id 128216;
 Mon, 17 May 2021 12:44:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1CF0=KM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1licbS-0005PB-10
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 12:44:10 +0000
Received: from mail-wm1-f53.google.com (unknown [209.85.128.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c279eabf-8ec3-4e5f-90c2-b11bca4b6c97;
 Mon, 17 May 2021 12:44:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so3520303wmn.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 05:44:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e10sm17579130wrw.20.2021.05.17.05.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 05:44:07 -0700 (PDT)
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
X-Inumbo-ID: c279eabf-8ec3-4e5f-90c2-b11bca4b6c97
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NkH1hn/llmMAWjGH+T9LzgpgQvfVwkz1CmZvTr8+9h4=;
        b=oaknIcLPJnZCM399r8MY8UcdYPGUUyZIm2SgqpYWupFAUZFgwziXkhBvnh1mONj7qf
         P2sxVi0GRn37nYm0NdZ3VPlZCAu6r98PdhrlKWSh1P3DeTsIhGdBDdgDTdmur+wd53wN
         sjhlZYwtWJtjFyN5kuCNKzk0GSuwBjtg3/5d8YzdysHkqL/lhr2TJrMZggeOQlDNKrgt
         Br4q0PdOnDPHiDvV0vIfhDVbCujflkiYtOOAY6nC9D3a9ZdlQajZu6AuWywShgXSQ2Jb
         a3v36BW1mxT2I6QeXR3yO3iHyDlOnjMPzXq2k001zSPg7T92VuSUwFwhMPOYucOcFm0d
         I7vw==
X-Gm-Message-State: AOAM533EGiXNHewRSPolUGQjtJkVs9ilgLxXeClimG8CKhh+3jLulAb8
	o0Uhm7/yyAK4djy7Vmuc1sc=
X-Google-Smtp-Source: ABdhPJyDckIeMOlTfKLw41zCB81nfFbEhlIW1ItLKHFwGBOxhddC3x8BxnUAiH/iY8rtpM2EQVZBsw==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr64020614wml.67.1621255448538;
        Mon, 17 May 2021 05:44:08 -0700 (PDT)
Date: Mon, 17 May 2021 12:44:06 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 2/6] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
Message-ID: <20210517124406.khnpmw5l7mzru5zm@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-3-jgross@suse.com>
 <20210421101334.4wuzqjkwiq7ixsbh@liuwe-devbox-debian-v2>
 <6f3853d8-6900-cf27-bd2b-750b6ee2cfb1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f3853d8-6900-cf27-bd2b-750b6ee2cfb1@suse.com>

On Wed, Apr 21, 2021 at 12:17:49PM +0200, Juergen Gross wrote:
> On 21.04.21 12:13, Wei Liu wrote:
> > On Mon, Apr 12, 2021 at 05:22:32PM +0200, Juergen Gross wrote:
> > > The core of a pv linux guest produced via "xl dump-core" is not usable
> > > as since kernel 4.14 only the linear p2m table is kept if Xen indicates
> > > it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
> > > supporting the 3-level p2m tree only.
> > > 
> > > Fix that by copying the functionality of map_p2m() from libxenguest to
> > > libxenctrl.
> > > 
> > 
> > So there are now two copies of the same logic? Is it possible to reduce
> > it to only one?
> 
> Yes. See the intro mail of the series.
> 
> I wanted to fix the issue first, before doing the major cleanup work.

Acked-by: Wei Liu <wl@xen.org>

