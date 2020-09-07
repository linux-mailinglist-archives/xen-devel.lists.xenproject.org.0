Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06E25FC2A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:37:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFIGQ-0001Nc-F8; Mon, 07 Sep 2020 14:36:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eb3x=CQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFIGO-0001N1-QZ
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:36:56 +0000
X-Inumbo-ID: 42ca54f9-6630-4a15-86fb-8f15a682d377
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42ca54f9-6630-4a15-86fb-8f15a682d377;
 Mon, 07 Sep 2020 14:36:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x23so4654649wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2020 07:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MU1xYJ9jHlvY4SCMEtpLrZ0DXdeh+kn9EHlvcizEIgA=;
 b=bTdlAP/JO71kC70wahIninj3hRIi2qPNlLr8UarTmQxpLq3EDSNSEeIZ0Aix5wp55M
 q4Fcuvqm9HOEiTw+sIrtM54mXs/VWqWk9Zphmr4d1QXpegbmCreyIBLVlzTFr6KMPSk5
 NAPjB4b+GEEZdmsZ1envds2MUjAizj2orp4MMTO3168g2gba4ZVyS1XHuuj36ibc7qyS
 +j1HkQ5cUnPDBDNUaECDu90skC9IAaYq6sBnPgmeRzOpF9jL3gxbMWgm/RFqWzrsEK4O
 ojOrgaukOPov3gvT7jaGWTusX97Q8YlTYea9Ej51puVMe+/r6dXc9wT0BMAZQMAJESPN
 6yPw==
X-Gm-Message-State: AOAM530NbsivT0SaJ19BCQMDl+7phcKfZrMwcnSix877xYqPCWCe0X7r
 lFzQfJxCZlgCNEUIfIslTYg=
X-Google-Smtp-Source: ABdhPJy7UtWE/7XEx33t8zYskwNvrEcr4aizVv7x85QaDM5mjF/CwQ5Gn1gbrs5bZzZZZ8TWxMwQWg==
X-Received: by 2002:a1c:3bd7:: with SMTP id
 i206mr21221098wma.162.1599489415332; 
 Mon, 07 Sep 2020 07:36:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u66sm2436510wme.12.2020.09.07.07.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 07:36:54 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:36:53 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/hotplug: Fix hostname setting in vif-nat
Message-ID: <20200907143653.kwqjpyw67sscut6a@liuwe-devbox-debian-v2>
References: <cover.1597920095.git.diego.sueiro@arm.com>
 <689b543715a858ad0fb0c1d849dd8ec70b3d20be.1597920095.git.diego.sueiro@arm.com>
 <8C6DB9DF-3DDA-45B7-A137-701E26C718E1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8C6DB9DF-3DDA-45B7-A137-701E26C718E1@arm.com>
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

On Thu, Aug 27, 2020 at 02:14:03PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 20 Aug 2020, at 11:58, Diego Sueiro <Diego.Sueiro@arm.com> wrote:
> > 
> > Setting the hostname is failing because the "$XENBUS_PATH/domain"
> > doesn't exist anymore. To fix this we set it to dom$domid
> > 
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 

Acked-by: Wei Liu <wl@xen.org>

