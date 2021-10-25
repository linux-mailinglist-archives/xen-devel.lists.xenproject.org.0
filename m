Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407843944C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 12:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215735.375099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mexdx-0002FB-4D; Mon, 25 Oct 2021 10:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215735.375099; Mon, 25 Oct 2021 10:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mexdx-0002DN-1E; Mon, 25 Oct 2021 10:55:53 +0000
Received: by outflank-mailman (input) for mailman id 215735;
 Mon, 25 Oct 2021 10:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ol/l=PN=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1mexdu-0002DG-QL
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 10:55:50 +0000
Received: from mail-wr1-f51.google.com (unknown [209.85.221.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b020c5a-c6c8-4d66-99bb-25b767d978ef;
 Mon, 25 Oct 2021 10:55:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v17so10763708wrv.9
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 03:55:50 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i9sm11898253wmb.22.2021.10.25.03.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 03:55:48 -0700 (PDT)
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
X-Inumbo-ID: 4b020c5a-c6c8-4d66-99bb-25b767d978ef
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sXc88nZOdpcAQ5BmBbT1tLuOWdfYJcmABBeYACUNHPk=;
        b=KRVM/tLsWBxmqsxDiSeCs367cfEE9m7/HUcoMI9jEsQUSYkAH62kvQzbUXBrYHWCYN
         Lgs6obgqdM/OGpPmtqjlFrsmqr+eOr9zMRlM5AKgBuqyvTYdRLhdL0V+eI4bAe6v+Ier
         rX+zzalHqcnoDGRnpLUybx3n8ZwVRGr/0j9UyDl+o0FMLRKJUm8F+pLxShjySU+KOLmT
         /w5yPjBmOSUdHjM9dBsxrdMaE4I3xrCRDkxECNLqH4e/EGO6JiHscMrgnmPxBZ7aLN7i
         YnnKrukY80tx3ACg7ZAb52Ia+5pChXorY62B/F9afDyxH1QhLcya8POUMY+/02C0pHhb
         qrZw==
X-Gm-Message-State: AOAM532oZR0jkJfoJFr0TljynfvokponmCDxO5SkEFUXQbAPFWyBi6ay
	2hvYu1iD9QyDaw5S9A6SVF4=
X-Google-Smtp-Source: ABdhPJzEF0JvURt5NGWDas8A4vP05aaqlxtc0/bJyQQcRIs49zfFl+1/SUkK+VBL1tNg4p0jUqJRYg==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr18741951wrp.410.1635159349243;
        Mon, 25 Oct 2021 03:55:49 -0700 (PDT)
Date: Mon, 25 Oct 2021 10:55:47 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, wei.liu@kernel.org,
	paul@xen.org, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH net-next v2 01/12] net: xen: use eth_hw_addr_set()
Message-ID: <20211025105547.bmmowslozg2mdjdf@liuwe-devbox-debian-v2>
References: <20211021131214.2032925-1-kuba@kernel.org>
 <20211021131214.2032925-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021131214.2032925-2-kuba@kernel.org>

On Thu, Oct 21, 2021 at 06:12:03AM -0700, Jakub Kicinski wrote:
> Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
> of VLANs...") introduced a rbtree for faster Ethernet address look
> up. To maintain netdev->dev_addr in this tree we need to make all
> the writes to it got through appropriate helpers.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Wei Liu <wl@xen.org>

