Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EEC25FC00
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:26:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFI5m-0000Dl-Se; Mon, 07 Sep 2020 14:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFI5l-0000Cz-D2
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:25:57 +0000
X-Inumbo-ID: 26de9fb9-4839-49ec-8785-c9b804ccafe2
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26de9fb9-4839-49ec-8785-c9b804ccafe2;
 Mon, 07 Sep 2020 14:25:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a65so14530190wme.5
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7tE8axnokvJVqpkz7ZrpRBo/yF6ZnJFcivyI3UGRTqY=;
 b=t+UXvo5MIxuWWN+6CvwUGZhS4vYTHwkUf41lz2MG5ahngBqcgRcNrCVDyW3zIgY3EF
 qMN2jbQVjmrkoBBVH1jxkX/RpTNFERStjB7E9+7/VrxQIe0tsxlvud1dVKELW+4Dz19b
 sjbGkA5EdQA3jUCX09RtVBVCA8Hb+WvE+p6UEgif233XvKtLVwmoMM5tw/MJL4YgsyjV
 0hR7+QgXjxgT1p5avY6z7iUT1qFLaBErbf+seUOCYpQ8ReyDU9TPV0uU8Jh3L7PnjQu1
 vANNzfKI6VHBMC5o1eb89PK+E86XV0zEXg/6D2V7EQzxo+70fpgJYQa5Meghn7ojjiRv
 L11w==
X-Gm-Message-State: AOAM532TT56vblw3c+UkQXSPqlam6BBNYz60S0yUUCIN2wjCXKeazltn
 RjELt1nGPRJkyuSkwtXFJdY=
X-Google-Smtp-Source: ABdhPJzfiiY9NNDVoW2DdBR6AdE28xobxrRJhSpD4ME4GsV5vot8ane5J00VcmzC0bW5CqOyjZlNTw==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr21297399wmd.69.1599488755025; 
 Mon, 07 Sep 2020 07:25:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k22sm29245175wrd.29.2020.09.07.07.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:25:54 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:25:53 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 02/31] tools: drop explicit path specifications for
 qemu build
Message-ID: <20200907142553.dvpuo2mrgbeewgi3@liuwe-devbox-debian-v2>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828150747.25305-3-jgross@suse.com>
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

On Fri, Aug 28, 2020 at 05:07:18PM +0200, Juergen Gross wrote:
> Since more than three years now qemu is capable to set the needed
> include and library paths for the Xen libraries via pkg-config.
> 
> So drop the specification of those paths in tools/Makefile. This will
> enable to move libxenctrl away from tools/libxc, as qemu's configure
> script has special treatment of this path.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

