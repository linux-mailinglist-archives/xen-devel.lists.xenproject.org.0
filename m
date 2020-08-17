Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC42463DA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7bsN-0006ca-A2; Mon, 17 Aug 2020 09:56:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5P54=B3=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k7bsL-0006ah-Rq
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:56:21 +0000
X-Inumbo-ID: 7f506d3d-9e1b-4c16-b60a-eb67c1f0f546
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f506d3d-9e1b-4c16-b60a-eb67c1f0f546;
 Mon, 17 Aug 2020 09:56:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a14so14333408wra.5;
 Mon, 17 Aug 2020 02:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Ym9L5vDhvXIq4XNHTX9cSFj82wOCFVMZB7UTRG4gtEY=;
 b=nc+NdOumc9b3nZW0NzIzlBwIBWwyyDntfj0mOIMYT03ibJul1OhUbcCM1Prr7cZZ+K
 npmcQ6LYnIIU0DgFlEG+HP1dAjy69RSnB7jAGArtDLDZmnUWHpzBmL8Rw7bgbriv+2x6
 WUzlC0ViP7FnZvqWZJ10zP7sQ4JJRx8fSrjeL+J7AJ1HlD1zhaEvC6n5dlkxiQg5nU/+
 mN81vVG6g9kAgTz+JbeAnrgfmoXw3T+s1cCZ5VaP4QEiK9DWDnlkf5ayAoUkGI4ACeKU
 +X7ubqtwQ9TDvXR3fONELAhPI1RIvli9/oM7sGLJWW9+jkyf75UEriO0XdbLMNAzuJ4H
 +5Ow==
X-Gm-Message-State: AOAM530dBmmMREF+Fc80UgFvhPEFeIQaJ/7PUgseWXQkyBo3riTpVCms
 UDNWthWA3BrggKriaX3GasI=
X-Google-Smtp-Source: ABdhPJyHMjwpOz/5Bc3MZHtvVk0yrhMX7uoghN7cCOHrP8Fsk2a0lNEWhBtR24fb+8lMDvj8Jeu3ig==
X-Received: by 2002:adf:e704:: with SMTP id c4mr15669239wrm.81.1597658174386; 
 Mon, 17 Aug 2020 02:56:14 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w10sm29330232wmk.0.2020.08.17.02.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:56:13 -0700 (PDT)
Date: Mon, 17 Aug 2020 09:56:12 +0000
From: Wei Liu <wl@xen.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH] mini-os: correct memory access rights for pvh mode
Message-ID: <20200817095612.4pczowfuk27lzubz@liuwe-devbox-debian-v2>
References: <20200815111557.29564-1-jgross@suse.com>
 <20200815214002.vow2zqlqhtxw6jmb@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200815214002.vow2zqlqhtxw6jmb@function>
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

On Sat, Aug 15, 2020 at 11:40:02PM +0200, Samuel Thibault wrote:
> Juergen Gross, le sam. 15 août 2020 13:15:57 +0200, a ecrit:
> > When running as a PVH guest the memory access rights are not set
> > correctly: _PAGE_USER should not be set and CR0.WP should be set.
> > Especially CR0.WP is important in order to let the allocate on
> > demand feature work, as it requires a page fault when writing to a
> > read-only page.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Applied.

