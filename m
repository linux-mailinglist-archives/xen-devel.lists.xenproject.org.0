Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DA3B20A3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 20:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146285.269132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lw7ww-0001AK-KX; Wed, 23 Jun 2021 18:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146285.269132; Wed, 23 Jun 2021 18:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lw7ww-00018M-GO; Wed, 23 Jun 2021 18:50:10 +0000
Received: by outflank-mailman (input) for mailman id 146285;
 Wed, 23 Jun 2021 18:50:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/Od=LR=gmail.com=salvatore.bonaccorso@srs-us1.protection.inumbo.net>)
 id 1lw7wv-00018F-1W
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 18:50:09 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c72ab878-9c9d-428a-b6bb-a016de2846ff;
 Wed, 23 Jun 2021 18:50:07 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b3so3755512wrm.6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jun 2021 11:50:07 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id x10sm848038wru.58.2021.06.23.11.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:50:06 -0700 (PDT)
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
X-Inumbo-ID: c72ab878-9c9d-428a-b6bb-a016de2846ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t9g61bv+JZ07tY5UuVmyIiDTVqgatmyK1QRV0XqD+Hc=;
        b=KLXuHll2RXbwuztCykmE1EQTu6vmTzU1QQjpNTWzNCxaM1/Ps+7XEiFt8zUeOZ1baA
         xe7gg6HXyDZ4KaB5Rul1MiFZoKZ0NCIbHMmtoCQwOsmnIQiG+kgYk7+D1Nwn5IGm+2zB
         +ei/17jncOmir+dd9UyMDCtbBeqxpGTR5rZqJk0gYytyX0CnJeaGFqWYDEu6HFskFOOE
         nDzu6jGbO5UvY6TkF6GoI2grAJpQLbjUvI6cQO7vFjzZCaOOWSL1cuXCzLO2WUEC+XMu
         tRtnxpuK28KFSNdjX7/SGtxLwQUIkf75kqAgcewqO+eglB9DMfpSiAc0IPNPS5ithG0y
         BKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=t9g61bv+JZ07tY5UuVmyIiDTVqgatmyK1QRV0XqD+Hc=;
        b=tM2sPUmnd88O5Cnx8N+7I2kLV9hk9S05S+VAVb8zmP+EnRLH0BTV5djFCHojbJo8EH
         pZg2xp3JGQB13DO3qhrXLL6txdlPu+l4ggtGjC20wEr4QQThbZoXa9qCO/K23GXbi472
         etCULP0uGpS/QPpCK5kdOQ+9AOPiO8f8UcfndKzEp8EVPBwHy3hgCBaBiVhxI2BVGAie
         rPUVrFDJRGTZdBwFoSxzrUPkiXfSBHdLs/Qjb0Z+ZbeeXOB7ErIOvnbu5YNA02/PFM+n
         +ITOcYZFDlJJz+sIdpwLhcXox3K9dQ/CnoCmelflmC3I8hRp/XwXLzowqUBlekBOMN9p
         DChA==
X-Gm-Message-State: AOAM533BZtWrHbGB3oR++ZDCTL+S4z80rKZkAtK516b4NJZ/TtxcZdD9
	ppFzsliPowJmbItpgMq+ZZeZxjRCr7fv+Q==
X-Google-Smtp-Source: ABdhPJwow7ob1nYUTJTVlm2hcLViMuMJ7U2nNz+pDoNObCJVja/RfxSZArMIJ4rIufME1rWIeSAkvw==
X-Received: by 2002:a5d:6b91:: with SMTP id n17mr1793938wrx.166.1624474207108;
        Wed, 23 Jun 2021 11:50:07 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Wed, 23 Jun 2021 20:50:05 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Robin Murphy <robin.murphy@arm.com>, 989778-maintonly@bugs.debian.org
Cc: =?utf-8?B?5bCP5aSq?= <nospam@kota.moe>,
	Jianxiong Gao <jxgao@google.com>, Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	xen-devel@lists.xenproject.org
Subject: Re: Bug#989778: Regression in at least 5.10.y and mainline: Firewire
 audio interface fails to work properly (when booted under Xen)
Message-ID: <YNOCXe1cuNDNAB+Z@eldamar.lan>
References: <162352833546.2353.230557992597997974.reportbug@home.kota.moe>
 <YMWl4UnFBAVRDnys@eldamar.lan>
 <162352833546.2353.230557992597997974.reportbug@home.kota.moe>
 <2f7c7d36-b6f4-f8ab-756e-a563fa03b9e4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f7c7d36-b6f4-f8ab-756e-a563fa03b9e4@arm.com>

Hi Robin,

On Mon, Jun 14, 2021 at 02:29:08PM +0100, Robin Murphy wrote:
> On 2021-06-13 07:29, Salvatore Bonaccorso wrote:
> > A user in Debian reported the above issue, which was reproducible with
> > 5.13-rc5 and 5.10.y as packaged in Debian and found that 85a5a6875ca9
> > ("swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single") that
> > introduced the issue.
> 
> Sounds like it's probably the same thing as being discussed over here:
> 
> https://lore.kernel.org/linux-iommu/2e899de2-4b69-c4b6-33a6-09fb8949d2fd@nxp.com/

Thanks for the pointer, it seems that now it has been fixed upstream
with 5f89468e2f06 ("swiotlb: manipulate orig_addr when tlb_addr has
offset").

Regards,
Salvatore

