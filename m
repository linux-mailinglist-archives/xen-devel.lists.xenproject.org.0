Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E13D1D9B05
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:21:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb43m-00007d-As; Tue, 19 May 2020 15:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mazm=7B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jb43l-00007R-4M
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:21:37 +0000
X-Inumbo-ID: 6d4aa331-99e4-11ea-a936-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d4aa331-99e4-11ea-a936-12813bfff9fa;
 Tue, 19 May 2020 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ssw3aErBh1F5cDhoZ4UrOm04Qc5bIPY02p4cVcWV6b4=; b=4nA8jeiwBuPaF52qs9KghxVkno
 9uFHnw3uSdyQd9TJLRjgnB2hhv188nOfMkmQULB9JBkUj0UlefaniwkkPBle+MpYk4UXLAbjmYBJG
 VUj97tFRWyptY+g5BqmqJjL4Y5PyYlyj9Xoa/H4qjNtbwXIWa2m56+duD5AUTxS7fILo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jb43j-0003c4-3l; Tue, 19 May 2020 15:21:35 +0000
Received: from 82.149.115.87.dyn.plus.net ([87.115.149.82] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jb43i-0003ix-QV; Tue, 19 May 2020 15:21:35 +0000
Date: Tue, 19 May 2020 16:21:32 +0100
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 07/19] libxl: write qemu arguments into separate
 xenstore keys
Message-ID: <20200519152132.3ivs6gpembnjai3o@debian>
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <20200519015503.115236-8-jandryuk@gmail.com>
 <24259.63185.474995.498745@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24259.63185.474995.498745@mariner.uk.xensource.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 04:10:09PM +0100, Ian Jackson wrote:
> Jason Andryuk writes ("[PATCH v7 07/19] libxl: write qemu arguments into separate xenstore keys"):
> > From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > 
> > This allows using arguments with spaces, like -append, without
> > nominating any special "separator" character.
> > 
> > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> > 
> > Write arguments in dm-argv directory instead of overloading mini-os's
> > dmargs string.
> > 
> > Make libxl__write_stub_dmargs vary behaviour based on the
> > is_linux_stubdom flag.
> 
> Thank you, I like this.
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Cool. Now this series is all acked. I will commit all the patches today.

Wei.

