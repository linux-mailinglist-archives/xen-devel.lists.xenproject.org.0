Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE235736DF5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551881.861636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbnr-0002HT-Uu; Tue, 20 Jun 2023 13:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551881.861636; Tue, 20 Jun 2023 13:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbnr-0002EO-RT; Tue, 20 Jun 2023 13:53:51 +0000
Received: by outflank-mailman (input) for mailman id 551881;
 Tue, 20 Jun 2023 13:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VB58=CI=citrix.com=prvs=528480557=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qBbnp-0002EI-Pj
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:53:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00cadc9-0f71-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 15:53:47 +0200 (CEST)
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
X-Inumbo-ID: e00cadc9-0f71-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687269227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17DohqCUDqppr2qzJkIr/KGBwBfuJDSqEBfdZj8maWA=;
  b=S3n0WgiZZTEyH5FinGj4wr0BUPrA1tqmt9IAxPILP3CAGkW4OhGiT2je
   ghIXUVU7tsWeAY25W2fnzIwSVHqTG/4NxOjdgzfRzwKuHH+b3rE4ukpGA
   jr+ZwGvQHIJZ+YG0qotSW+ulYXWV/lJ5kUPQ+0GipWdNGZ1JTViSz60NZ
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112213780
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:G4dwQqj47gk5mp+FDfN/K8YzX161chAKZh0ujC45NGQN5FlHY01je
 htvXDjXOv6JZGDzfo90a4Tk8UtQuMDVx9RgQQI6qi82FHsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gWGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQaLh8gPz3EjNmc+42XStlTuoMlMsTkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 zicpj+mUkly2Nq3xRWP1lyTjM30lGChYZ9LHrT/xKZ4jwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+oh8x2A0baR6gqcB24sXjNHcMYhtsI9WXotz
 FDht9rxCCZmqrG9VXOX/bDSpjS3URX5NkdbO3VCF1FcpYC+/sdq1Emnostf/LCdjNvaNGDdh
 DuxhhMBq7UjsvJM0bu28gWS696znaQlXjLZ9y2OADL6tF8nNdD+D2C7wQOFtKgdde51WnHE5
 SFZwJbGsYjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 2eJ42u9HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrH43NB/NjzCwzBZEfUQD1
 XGzK5vE4ZEyU/4P8dZLb71Fje9DKt4WmAs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6OJm+x6Jdw0w/09eyWh1
 ijVZ3K0AWHX3RXvQThmoFgyAF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:x1vf3Kg1GEJthZZpwI8WOg+cbXBQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3AVTDwYWt/d/aTeMwzpOX5d3it6IsndFLwnVqXKHS?=
 =?us-ascii?q?SMllFSI2qdRiW5q5rxp8=3D?=
X-Talos-MUID: 9a23:wgRHLgWHz2b3wX/q/DPDjhVMC81K2K3tUnkQyJ8P/PvcJyMlbg==
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="112213780"
Date: Tue, 20 Jun 2023 14:53:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: osstest service owner <osstest-admin@xenproject.org>
Subject: Re: [xen-unstable-smoke test] 181514: trouble: blocked/broken/pass
Message-ID: <e1f04b86-e2c0-47f5-9fa2-3d36ab9e4af2@perard>
References: <osstest-181514-mainreport@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <osstest-181514-mainreport@xen.org>

On Tue, Jun 20, 2023 at 12:02:46PM +0000, osstest service owner wrote:
> flight 181514 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/181514/
> 
> Failures and problems with tests :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-armhf                     <job status>                 broken
>  build-armhf                   4 host-install(4)        broken REGR. vs. 181476

We've been using a snapshot of the debian mirrors from 2021-01-24 to
install these boxes, and now the installation fails with "Invalid
Release signature" when the debian install script check the signature of
the "Release" file from the repo.

I'm looking at it.

Cheers,

-- 
Anthony PERARD

