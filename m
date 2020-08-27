Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C89C254486
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:50:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGPi-0006Jy-0h; Thu, 27 Aug 2020 11:49:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGPf-0006Jp-Ul
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:49:51 +0000
X-Inumbo-ID: d877aa38-9f14-465e-a4a3-9cd0cd3d561d
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d877aa38-9f14-465e-a4a3-9cd0cd3d561d;
 Thu, 27 Aug 2020 11:49:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b79so4245721wmb.4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ve5Yd+guhXmP2XvmJ6gR2suJtOhbxbnZttWm0tFlXXw=;
 b=A7VGaYqvhP+PQgd5bc4YPwnR09tmmzNpgWIgjrfN/zYlhVVgDz7jq1UpFAglDL4pRg
 47Qb/+hSJbzBojl4syqqWNFxs+cKOMFXRymCftY/+aQMHJJdy3CxtbJ4KehKTmPjX/Yd
 Xv9WYko9pNipCftftc9mQplJcp2PzXYOI2ahy0ihcNAheGw7zGRdIaD2SairfoMvXvTx
 ut9uAKYuq0+OaR8tcL57x/YAuPbjD55kR59bD20l7fBKTNVmFQoOhsoBooxa3qffHCVF
 iEJgsIBSOJr7iMxyslnB2Rx2h7DrFW9nq/GV8T+QGMfnM8HRW8MU9uvQkHeMjszfLrol
 gD/w==
X-Gm-Message-State: AOAM531F3O1LVy2Vu7XUaEGH2WkuJ0HJ9ZxqeBH1V7fTaOAW0tZR5R3y
 ZA3wdfJCtwNDFu5O7fAtF6o=
X-Google-Smtp-Source: ABdhPJxS04oZT5rzJ4ylO6NbtwvvPajo0mfmTHuENcMYoFXGnEzYkOHzZqgC4Rkg2jvE6WIc3wCYJg==
X-Received: by 2002:a1c:e18a:: with SMTP id
 y132mr12346791wmg.185.1598528990563; 
 Thu, 27 Aug 2020 04:49:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i4sm5537098wrw.26.2020.08.27.04.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:49:50 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:49:48 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 35/38] tools/xl: don't assume libxl and libxlutil are
 in one directory
Message-ID: <20200827114948.rre3lhimjqs3f2i4@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-36-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-36-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:16AM +0200, Juergen Gross wrote:
> Add the correct flags for both, libxenlight and libxlutil, when
> building xl.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

