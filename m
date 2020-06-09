Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C641F3734
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 11:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiao0-00030Y-Ml; Tue, 09 Jun 2020 09:44:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JTP1=7W=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jianz-00030N-8K
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:44:27 +0000
X-Inumbo-ID: ce26b49e-aa35-11ea-b7bb-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce26b49e-aa35-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 09:44:26 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 612CD122804;
 Tue,  9 Jun 2020 11:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1591695865;
 bh=6ZX7wnOiDM+mgpph4PTSgUowQ6Md6Yyyyb6vfm3/KaE=;
 h=Date:From:To:Subject:From;
 b=C0BeHPU9VVelKUtTN/95M9TAXB8lvMn7eL26Q9sKmjXigiQSnff7PY9PTyUJdYD+9
 MEBL8YK+RbyOwA7nwDokKZk2k014DgAO/jiRjInu+4gxcM+R9xaqU+D3HwOXI5I+Gw
 XDRz64Fbc6cLTJTxRTdYNAHTIXq4uaL22hnnU9YYrmR5bEnqtMw1xCD43ONBq9HNa+
 Lw3iPYl9ynHK0JDgHJ/fUWk4Tz2Y8PjS+kKl6kNg6W0fKzfdLWFfkiyO7a2xC5CeI0
 lLtAaW+r5lPipTgnRiHy2DUz1d0D9A+ckTtTfSjzxWmsQxUTfYKioBcUyq/3kZ7gzi
 oThtxeePYKVqw==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 4EB52265E722; Tue,  9 Jun 2020 11:44:25 +0200 (CEST)
Date: Tue, 9 Jun 2020 11:44:25 +0200
From: Martin Lucina <martin@lucina.net>
To: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Subject: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
Message-ID: <20200609094425.GB9734@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi,

I've been making progress on bootstrapping a new, PVHv2 only, Xen platform
stack for MirageOS [1]. The basics are now functional and I have started to
re-implement the grant table code.

After studying both the Mini-OS and Linux implementations some, I don't
understand the difference between using XENMAPSPACE_grant_table vs.
GNTTABOP_setup_table to set up the initial grant table mapping for the
guest.

Are these calls just newer and older ways of accomplishing the same thing?
The Linux driver seems to use both in various conditions, whereas Mini-OS
uses the former on ARM and the latter on x86.

If these are functionally equivalent, then for my purposes I'd rather use
XENMAPSPACE_setup_table, since IIUC this lets me map the grant table at an
address of my choosing rather than GNTTABOP_setup_table which at least on
x86_64 appears to be returning PFNs at the top of the address space.

Any advice much appreciated,

-mato

[1] https://github.com/mirage/mirage/issues/1159

