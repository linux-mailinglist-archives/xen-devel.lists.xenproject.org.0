Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6603668F4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114290.217773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9rX-0006Pf-Er; Wed, 21 Apr 2021 10:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114290.217773; Wed, 21 Apr 2021 10:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9rX-0006PG-BQ; Wed, 21 Apr 2021 10:13:39 +0000
Received: by outflank-mailman (input) for mailman id 114290;
 Wed, 21 Apr 2021 10:13:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZ9rW-0006PB-5Y
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:13:38 +0000
Received: from mail-wr1-f50.google.com (unknown [209.85.221.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5694e302-98ac-4ea0-9f1e-78345f1fe6f4;
 Wed, 21 Apr 2021 10:13:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x7so40718094wrw.10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:13:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 3sm2205235wma.45.2021.04.21.03.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:13:36 -0700 (PDT)
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
X-Inumbo-ID: 5694e302-98ac-4ea0-9f1e-78345f1fe6f4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s7AvYi5xEulWa5uhkFuSBwuj7ON+As+oKLMmroLuxEs=;
        b=YUxzZWT4RZ/wzoYfViOPNqHGi76AF094MSgyf6/If9McA19v4t/NGaqZBPS3kBgtvF
         jUenUVMKS0xoGE8G8DW3LQ2f93+8jOW89SkFZxapD/0denSU//mqTbsJ8g9aOMOrlJfa
         OMdoExx2OmRQR4umA6rb0JKltk+LCYSoK/uMMU6tg6h+gvInopUwNmG6ZYU+84ql7KUA
         Kuxi4LSYsvXoNF3VYl+Fuj7c+tCXHrrjzr5ewlJLfhVvpkv7ltUbjLpYEWRKiYKBfRgu
         J0eLN856uimEK1dLcnuAL46ayDWL1GVifzBY7uD3E9MuuPpnm8oddAt6CmgeznXCmNjs
         wDqQ==
X-Gm-Message-State: AOAM530RuWZkm7BDHX9Pkq2/Kf3SvgDtUUXsV7s3U8ZA4ZEEKeXzYB5y
	pvkt2fGAP2HqmP+FXrSWnfw=
X-Google-Smtp-Source: ABdhPJzMjQkncaClgVudeHilogpQ9wGlha5BBf+/l8QL7HAKfsWymLpCPR61k2wNT9b/Kjek3kZ2hA==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr26236657wrb.123.1619000016363;
        Wed, 21 Apr 2021 03:13:36 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:13:34 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/6] tools/libs/ctrl: fix xc_core_arch_map_p2m() to
 support linear p2m table
Message-ID: <20210421101334.4wuzqjkwiq7ixsbh@liuwe-devbox-debian-v2>
References: <20210412152236.1975-1-jgross@suse.com>
 <20210412152236.1975-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152236.1975-3-jgross@suse.com>

On Mon, Apr 12, 2021 at 05:22:32PM +0200, Juergen Gross wrote:
> The core of a pv linux guest produced via "xl dump-core" is not usable
> as since kernel 4.14 only the linear p2m table is kept if Xen indicates
> it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
> supporting the 3-level p2m tree only.
> 
> Fix that by copying the functionality of map_p2m() from libxenguest to
> libxenctrl.
> 

So there are now two copies of the same logic? Is it possible to reduce
it to only one?

Wei.

