Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5FB26889E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:38:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkvd-0008UE-1o; Mon, 14 Sep 2020 09:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHkvb-0008U9-HU
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:37:39 +0000
X-Inumbo-ID: 6e9ccb90-0139-43e3-b018-299fa3bb3c52
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e9ccb90-0139-43e3-b018-299fa3bb3c52;
 Mon, 14 Sep 2020 09:37:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so9942551wmj.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 02:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JR8e6nISQ1fmuQ/3tC8YV0SvGz9vtNPPdmCysgF3yi0=;
 b=b9besK2ed8IRKIdVsTCGDTs659SNV9Hnrn/ceHRnEjirrrFza9dTH6qsSdM9P7DIdn
 t/rtxXGuyPQ9As3d03mqFUZDDlS/hRHWAatzmykmVoA/+7NzAjaLu+FtANofLYOqch9g
 EJufktam7y0qu/iSdoGq3hu2kwvE/whOzqgwgfQZaYK/kSsosik9NOz2DmPUDRCzxAfl
 TkNU+NMrfVVtt1rcfNYUm55TpKhhDJLO4UdURcheo3seJ0a0XzxZGYUC37Z1M4fdx/zg
 1c2aO8nnYAqTszZlDe2ewWHQwhO0mewCvytsyBBZTh/hHJgMAGFFRzHODIs1/BXE8xZi
 +18g==
X-Gm-Message-State: AOAM532+5IVKX+NcsU138AhOMutXcl5YH8VGd2msu2xx4ioXEkYoQ3yD
 njLjWf3CExTF/6D47CFdBndTMVViYgE=
X-Google-Smtp-Source: ABdhPJz+jNvhGX7J0+tqe3Jept0EHo2l9VCpcd3j2964ouAKXDAvLMNF2v5aoIF65hsXeQ0F+HbtSA==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr9878455wml.131.1600076248153; 
 Mon, 14 Sep 2020 02:37:28 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v17sm19748977wrr.60.2020.09.14.02.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 02:37:27 -0700 (PDT)
Date: Mon, 14 Sep 2020 09:37:26 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/build: avoid $(file ...) directive in Makefile
Message-ID: <20200914093726.t3otf756thmnmwzl@liuwe-devbox-debian-v2>
References: <20200912084913.5318-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912084913.5318-1-jgross@suse.com>
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

On Sat, Sep 12, 2020 at 10:49:13AM +0200, Juergen Gross wrote:
> Using $(file ...) breaks the build with make older than version 4.0.
> Replace it with echo.
> 
> Fixes: 52dbd6f07cea7a ("tools: generate pkg-config files from make variables")
> Signed-off-by: Juergen Gross <jgross@suse.com>

This patch is superseded by Andrew's patch.

Wei.

