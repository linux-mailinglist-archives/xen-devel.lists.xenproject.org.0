Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DCD8444AB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 17:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674107.1048822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDZR-0004Zb-Hc; Wed, 31 Jan 2024 16:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674107.1048822; Wed, 31 Jan 2024 16:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVDZR-0004XP-Df; Wed, 31 Jan 2024 16:36:17 +0000
Received: by outflank-mailman (input) for mailman id 674107;
 Wed, 31 Jan 2024 16:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tWvt=JJ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rVDZQ-0004XJ-He
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 16:36:16 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da05eb39-c056-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 17:36:15 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so3955303f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 08:36:15 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ba15-20020a0560001c0f00b0033ae54cdd97sm11536140wrb.100.2024.01.31.08.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 08:36:14 -0800 (PST)
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
X-Inumbo-ID: da05eb39-c056-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706718975; x=1707323775; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ll4CZisg4FhwwEIyaAZ532RjUCd9UNnDz267Gs8xv0=;
        b=AvbHxJyEm00NcooiqhWUy3X3bMADOAJfgpfuJmf/gRCL1KrKQeRg2WACLeASvEzd8Q
         XScO1Gj8v3Kf0fRJ/YL0GExddm0/WbZZhJz0+hYAdL7chmbJUNArWtZqRRHZhtqSK4RJ
         xij6NdsZ1sfL1ylQ720cdWI0KRf68FKrer9HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706718975; x=1707323775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ll4CZisg4FhwwEIyaAZ532RjUCd9UNnDz267Gs8xv0=;
        b=OjpY6nFMEFidCupwR4eKTIX85WyrZPvCh/7r3XBvD/Re8gixPpckmBY31Ddof+S40P
         Eq0cZyRxYgXnHXJ5/GHhg64eYSNRN1BnS9Qq7tIhCjuIT1JKsnAFCzlWHVroz9xGeQZb
         Bh01+OKZar/Ph+BD60ymdWaAGPo5DlzH/dE/M3rTv6QRDnRJOiYZC0SJRiAGFqpbb5JH
         2Zk9ab+EbTraOo/9Eds+hxxNzxQSYqvgP6CpaRl+d5czYGFUttqj6GDIEUZuKLfO2m60
         QNpku8pZnZbA94zg71j9APQA1trmz0kxF7bElIy3pInHwXnvSaDi4MOOQTJ0lvrzlEIr
         hH/A==
X-Gm-Message-State: AOJu0YwrMEYERKrmMHK9YYkf8aZBLXdwpIecAik1ASoVtNg3IDyBxPwj
	HXasD2hPNjFKftfKArLPUhm1wFootemXc346oWixMTnKsafVx7vOrCYAEr0j1uI3p8BmfqQEtG9
	r
X-Google-Smtp-Source: AGHT+IEReKV+3M16m3BevrFtr1yT5ZuRKBgmlXvlFIVGQj6BodUyF3arJ+JeJn79de7dduQ0Mq1P/g==
X-Received: by 2002:a05:6000:2ac:b0:33a:e6f0:ee05 with SMTP id l12-20020a05600002ac00b0033ae6f0ee05mr1892693wry.45.1706718974798;
        Wed, 31 Jan 2024 08:36:14 -0800 (PST)
Date: Wed, 31 Jan 2024 16:36:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 2/2] tools/ocaml: bump minimum version to OCaml 4.05
Message-ID: <6cf32d7b-043e-458e-b73b-68899b6303a8@perard>
References: <cover.1706697216.git.edwin.torok@cloud.com>
 <11cc8480e6e52d5c2dccc7d8d65e1362c7fba685.1706697216.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11cc8480e6e52d5c2dccc7d8d65e1362c7fba685.1706697216.git.edwin.torok@cloud.com>

On Wed, Jan 31, 2024 at 10:42:49AM +0000, Edwin Török wrote:
> We tried bumping to 4.06.1 [1] previously, but OSSTest was holding us
> back.
> So bump to OCaml 4.05 instead, which should match the version on
> OSSTest?

Yes, it's looks that's the version osstest can currently use.
I've started an osstest flight with this patch series and your other
ocaml patch series, and so far osstest seems happy with it. The flight
isn't finished but all build jobs succeed, and a lot of the tests jobs
as well.

So:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

