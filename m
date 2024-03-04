Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D55870F13
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 22:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688531.1072759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhGCN-000057-TP; Mon, 04 Mar 2024 21:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688531.1072759; Mon, 04 Mar 2024 21:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhGCN-0008VE-Qi; Mon, 04 Mar 2024 21:50:15 +0000
Received: by outflank-mailman (input) for mailman id 688531;
 Mon, 04 Mar 2024 21:50:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LMI=KK=amazon.com=prvs=7868452b1=apanyaki@srs-se1.protection.inumbo.net>)
 id 1rhGCM-0008V8-AQ
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 21:50:14 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5af81f-da71-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 22:50:12 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 21:50:01 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.17.79:26419]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.20.189:2525]
 with esmtp (Farcaster)
 id e2b6372a-4e89-463b-887c-9553dfcc05aa; Mon, 4 Mar 2024 21:49:59 +0000 (UTC)
Received: from EX19D026EUB004.ant.amazon.com (10.252.61.64) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 4 Mar 2024 21:49:59 +0000
Received: from uc3ecf78c6baf56.ant.amazon.com (10.187.170.53) by
 EX19D026EUB004.ant.amazon.com (10.252.61.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 4 Mar 2024 21:49:56 +0000
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
X-Inumbo-ID: 2b5af81f-da71-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1709589012; x=1741125012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IPLuyADOds20t9F10dBuRgOvEI8caqH4znwPq4fIKLQ=;
  b=uTgKEy9tTUGr+S2yDsPbQfQR1npZ0s7guKimSbwXkA+p7w2CY3DHR1Fr
   +G5Tagl8y8xbKXPYqTyQLGZ+io73UlFxbP+TgbZuu7jpjLp5mZKF24bto
   GeTglJx4UYtpl93zcigcbwKEJmV+pz3l123hZjV007VrCEc4CvsrVmI5N
   4=;
X-IronPort-AV: E=Sophos;i="6.06,204,1705363200"; 
   d="scan'208";a="278554992"
X-Farcaster-Flow-ID: e2b6372a-4e89-463b-887c-9553dfcc05aa
Date: Mon, 4 Mar 2024 13:49:51 -0800
From: Andrew Paniakin <apanyaki@amazon.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <apanyaki@amazon.com>, <benh@amazon.com>, <boris.ostrovsky@oracle.com>,
	<gregkh@linuxfoundation.org>, <jeremy.fitzhardinge@citrix.com>,
	<jgrall@amazon.com>, <jgross@suse.com>, <konrad.wilk@oracle.com>,
	<linux-kernel@vger.kernel.org>, <mheyne@amazon.de>,
	<oleksandr_tyshchenko@epam.com>, <sashal@kernel.org>,
	<sstabellini@kernel.org>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5.10] xen/events: close evtchn after mapping cleanup
Message-ID: <20240304214951.GA3603725@uc3ecf78c6baf56.ant.amazon.com>
References: <20240302160357.GA2232656@uc3ecf78c6baf56.ant.amazon.com>
 <2024030433-legacy-unrivaled-f5fc@gregkh>
 <20240304184726.GA3441283@uc3ecf78c6baf56.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240304184726.GA3441283@uc3ecf78c6baf56.ant.amazon.com>
X-Originating-IP: [10.187.170.53]
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D026EUB004.ant.amazon.com (10.252.61.64)

On 04/03/2024, Andrew Panyakin wrote:
> On 04/03/2024, Greg KH wrote:
> > On Sat, Mar 02, 2024 at 08:03:57AM -0800, Andrew Panyakin wrote:
> > > From: Maximilian Heyne <mheyne@amazon.de>
> > >
> > > Commit fa765c4b4aed2d64266b694520ecb025c862c5a9 upstream
> [...] 
> > Where is the 5.15.y version of this commit?  We have to have that before
> > we can take a 5.10.y version, right?
> 
> Remaining patches for 5.15 and 6.1 ready, will send once analyze test
> results.

Remaining patches posted:
5.15: https://lore.kernel.org/all/20240304212139.GA3585816@uc3ecf78c6baf56.ant.amazon.com/
6.1: https://lore.kernel.org/all/20240304192006.GA3517973@uc3ecf78c6baf56.ant.amazon.com/

