Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648F979C02
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799240.1209148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq66M-0000s4-Rw; Mon, 16 Sep 2024 07:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799240.1209148; Mon, 16 Sep 2024 07:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq66M-0000ox-PQ; Mon, 16 Sep 2024 07:24:50 +0000
Received: by outflank-mailman (input) for mailman id 799240;
 Mon, 16 Sep 2024 07:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ug6v=QO=bombadil.srs.infradead.org=BATV+500305f64adcbfb43b9e+7694+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sq66J-0000or-88
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:24:49 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd3bbf1d-73fc-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 09:24:42 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1sq66E-00000003Iyc-1rAO; Mon, 16 Sep 2024 07:24:42 +0000
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
X-Inumbo-ID: bd3bbf1d-73fc-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=htINtMKW1HHHTz6jXf4cYaZiT3xsT/nN0J8Q13owBXQ=; b=Pn9FC1x6nnL0y9Cn7Z9N7H7ytU
	cnlXuztesp1Ehje2r9n2mP9UmGrD44lQT6tOQ5ADkWRaKwb8R6I7Tpqg887T3I6M3vWHX2gjKeLVr
	McgOkSWOVNM5zTI6182gNcaJM+eN5U60ysxN4vYhN5f3PPW8dnRw5KHtlOPllrR5ATMEtcKXXsiPw
	rmvmNKdTTSWRBPx/3MJtoWxl9S6n8T32ttqeufOQlPfRXQu85xrXE/oT5jQU4tj3N79sBYNkOEtZo
	FO/40oEM+s/FyGzhKQOq4mHmISg54wN862PYFIhB9dC6ZkjnvzA22QGKPt1pnf4CNL02uqk5DNzB0
	mK4aPqfg==;
Date: Mon, 16 Sep 2024 00:24:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZufdOjFCdqQQX7tz@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
 <ZuK6xcmAE4sngFqk@infradead.org>
 <874j6g9ifp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j6g9ifp.wl-tiwai@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Sep 16, 2024 at 09:16:58AM +0200, Takashi Iwai wrote:
> Yes, all those are really ugly hacks and have been already removed for
> 6.12.  Let's hope everything works as expected with it.

The code currently in linux-next will not work as explained in my
previous mail, because it tries to side step the DMA API and abuses
get_dma_ops in an unsupported way.


