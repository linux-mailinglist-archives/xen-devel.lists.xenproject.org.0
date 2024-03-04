Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB48709CF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 19:48:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688500.1072700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhDLi-0007Ow-5Y; Mon, 04 Mar 2024 18:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688500.1072700; Mon, 04 Mar 2024 18:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhDLi-0007Nb-18; Mon, 04 Mar 2024 18:47:42 +0000
Received: by outflank-mailman (input) for mailman id 688500;
 Mon, 04 Mar 2024 18:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LMI=KK=amazon.com=prvs=7868452b1=apanyaki@srs-se1.protection.inumbo.net>)
 id 1rhDLg-0007NT-M6
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 18:47:40 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf442e5-da57-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 19:47:38 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 18:47:35 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:47643]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.42.5:2525] with
 esmtp (Farcaster)
 id abeaadb9-70cd-4744-b817-67fa8b437c78; Mon, 4 Mar 2024 18:47:33 +0000 (UTC)
Received: from EX19D026EUB004.ant.amazon.com (10.252.61.64) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 4 Mar 2024 18:47:33 +0000
Received: from uc3ecf78c6baf56.ant.amazon.com (10.187.170.53) by
 EX19D026EUB004.ant.amazon.com (10.252.61.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 4 Mar 2024 18:47:30 +0000
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
X-Inumbo-ID: abf442e5-da57-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1709578058; x=1741114058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9wd9WUH4whGwXp0eHXVUdDwqcrqNWWjri6sAP3vphCI=;
  b=NOA8+81x7UlfsFakR5IQbhS9SIv1BV3DF9n9KdxaBU5FAJbEDtY1IDX6
   raXjT/iehSw87DSk4ijD0o1xPqxd86k0XEhuRUWQQEAs2hlg9NXfyApE7
   v4n1u4q6M3M8QYTqFaLUS2K2M3lPDYlXyTT94QdamYf1ia6gZy2DoFtbO
   g=;
X-IronPort-AV: E=Sophos;i="6.06,204,1705363200"; 
   d="scan'208";a="385374124"
X-Farcaster-Flow-ID: abeaadb9-70cd-4744-b817-67fa8b437c78
Date: Mon, 4 Mar 2024 10:47:26 -0800
From: Andrew Panyakin <apanyaki@amazon.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <apanyaki@amazon.com>, <benh@amazon.com>, <boris.ostrovsky@oracle.com>,
	<jeremy.fitzhardinge@citrix.com>, <jgrall@amazon.com>, <jgross@suse.com>,
	<konrad.wilk@oracle.com>, <linux-kernel@vger.kernel.org>, <mheyne@amazon.de>,
	<oleksandr_tyshchenko@epam.com>, <sashal@kernel.org>,
	<sstabellini@kernel.org>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5.10] xen/events: close evtchn after mapping cleanup
Message-ID: <20240304184726.GA3441283@uc3ecf78c6baf56.ant.amazon.com>
References: <20240302160357.GA2232656@uc3ecf78c6baf56.ant.amazon.com>
 <2024030433-legacy-unrivaled-f5fc@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2024030433-legacy-unrivaled-f5fc@gregkh>
X-Originating-IP: [10.187.170.53]
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D026EUB004.ant.amazon.com (10.252.61.64)

On 04/03/2024, Greg KH wrote:
> On Sat, Mar 02, 2024 at 08:03:57AM -0800, Andrew Panyakin wrote:
> > From: Maximilian Heyne <mheyne@amazon.de>
> >
> > Commit fa765c4b4aed2d64266b694520ecb025c862c5a9 upstream
[...] 
> Where is the 5.15.y version of this commit?  We have to have that before
> we can take a 5.10.y version, right?

Remaining patches for 5.15 and 6.1 ready, will send once analyze test
results.

