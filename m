Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3230C56C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80640.147617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yRr-0000Zt-RN; Tue, 02 Feb 2021 16:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80640.147617; Tue, 02 Feb 2021 16:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yRr-0000ZU-O4; Tue, 02 Feb 2021 16:22:39 +0000
Received: by outflank-mailman (input) for mailman id 80640;
 Tue, 02 Feb 2021 16:22:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJ8X=HE=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1l6yRq-0000ZP-5z
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:22:38 +0000
Received: from mail-wr1-f48.google.com (unknown [209.85.221.48])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b0bc5fb-ee8b-4d05-ba2f-1fc7e7fc013b;
 Tue, 02 Feb 2021 16:22:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p15so21052182wrq.8
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 08:22:36 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e11sm32813367wrt.35.2021.02.02.08.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 08:22:35 -0800 (PST)
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
X-Inumbo-ID: 4b0bc5fb-ee8b-4d05-ba2f-1fc7e7fc013b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Tl/pMxs9MIy87xsuWIVEOhHXa7tZ9dZIJ0KCeGa4jI=;
        b=PtlYwQaAuINVwj23D2FdunHBRsPE1FxkYD8nrSOVu7hIqpxqNyDIDJXAnfqUMXkLCi
         xK5XIfX1dVfbSueVOPqUcz/DD/+3YF28eC29jemIvmxZjut25I0ku1mO6sXD9oEYqWQh
         TYgkhfTuf6qag2QomSzRBSuyP9ShufnVV3Tqcgz5qQllayp8u+USSLVORcIDX+QGK4vr
         8QDLw7rdWqIyP6XOKKlMzC8eC7dDgRlqG6NabewWJxCXdDFOYgHhFv9yduX68YJFZpME
         aThET7H8obuLn8UXySCFecZt7xuITfsrIb5RUCL7nayGz4EyHP67Uj4MWtBsGLKAyh1h
         1hHA==
X-Gm-Message-State: AOAM532N9sBm+aC5N36U3pZxRVfJvmX9GOcwprwqvM4N/iv++/JrOzvG
	HnOb5blKaXFJcmE6v3vhsh8=
X-Google-Smtp-Source: ABdhPJx6LQHNUFui3giapOyyc5YGOC6dtOEQkMgOyDblBANYn5obn77kkqsoELxUiLKfWRiM9E+4kA==
X-Received: by 2002:adf:dd43:: with SMTP id u3mr25063060wrm.396.1612282956206;
        Tue, 02 Feb 2021 08:22:36 -0800 (PST)
Date: Tue, 2 Feb 2021 16:22:34 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Igor Druzhinin <igor.druzhinin@citrix.com>, stable@vger.kernel.org
Subject: Re: [PATCH] xen/netback: avoid race in
 xenvif_rx_ring_slots_available()
Message-ID: <20210202162234.sf575hwoj4bngvpt@liuwe-devbox-debian-v2>
References: <20210202070938.7863-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202070938.7863-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Tue, Feb 02, 2021 at 08:09:38AM +0100, Juergen Gross wrote:
> Since commit 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> xenvif_rx_ring_slots_available() is no longer called only from the rx
> queue kernel thread, so it needs to access the rx queue with the
> associated queue held.
> 
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Fixes: 23025393dbeb3b8b3 ("xen/netback: use lateeoi irq binding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

