Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7E537CB0
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 15:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338583.563374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfau-0004C6-F5; Mon, 30 May 2022 13:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338583.563374; Mon, 30 May 2022 13:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfau-00049u-B2; Mon, 30 May 2022 13:38:04 +0000
Received: by outflank-mailman (input) for mailman id 338583;
 Mon, 30 May 2022 13:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23U3=WG=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1nvfat-00049o-Cw
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 13:38:03 +0000
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9fcd834-e01d-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 15:38:02 +0200 (CEST)
Received: by mail-wm1-f45.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso6461600wmp.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 06:38:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d58cf000000b0020d02ddf4d0sm8911403wrf.69.2022.05.30.06.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 06:38:01 -0700 (PDT)
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
X-Inumbo-ID: b9fcd834-e01d-11ec-837f-e5687231ffcc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ytl48+gf/9+wU974bliYN68rRr9GC5CbXhv9Mqbfs9Y=;
        b=YdZaz5w33RPx039qBKJ7d5prxhkCMteIiE0jQXjnrlOPJ3xfWqisgmfOU2qpMv0Vo5
         qd8CwG0jRlWHAiRVaKPA2UMVRutRiBIia5QX/o1lvcSkA0lju1D2aIvKQU9RjBR3D4s5
         XQe+jedl0E1C8gPF6KYO02eqiljWjyzxo9HHK0YoR7LVcLT8LYO+26JTyknkgks4OWb2
         G2PlB1QQmblWoWLEWuF595q4LDQtxoSj+2LiTxh6nrV6EN504w/PHHHVP6SVz3GiBSzd
         EBeKNkADPkSDCM1essizvRCzCU4KpLHOBLIjZ/x+zBaZqd58rl44p0mwGIbgu7gd46Pj
         whOQ==
X-Gm-Message-State: AOAM532shIGhVpbH9KU+iW0EpdKjDR4HUqkahVlyijhAd2bA6WuZgVBg
	vepIIA6AHXLpBbTuaF6paWg=
X-Google-Smtp-Source: ABdhPJyoFBGlSKlV74jeFHZeQEIiKD71BnJBLmLRXZanLlnEJT/DxNOlAxTa51VmVdIsBUKX2lv0Kg==
X-Received: by 2002:a1c:4e19:0:b0:397:7b13:1bc7 with SMTP id g25-20020a1c4e19000000b003977b131bc7mr18980855wmh.114.1653917881735;
        Mon, 30 May 2022 06:38:01 -0700 (PDT)
Date: Mon, 30 May 2022 13:37:59 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] xen/netback: do some code cleanup
Message-ID: <20220530133759.mpwhh744l7miszbp@liuwe-devbox-debian-v2>
References: <20220530114103.20657-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530114103.20657-1-jgross@suse.com>

On Mon, May 30, 2022 at 01:41:03PM +0200, Juergen Gross wrote:
> Remove some unused macros and functions, make local functions static.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

