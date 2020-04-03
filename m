Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD219DC3E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 18:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKPeM-0003Ff-5u; Fri, 03 Apr 2020 16:58:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4QVj=5T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jKPeK-0003FY-OA
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 16:58:32 +0000
X-Inumbo-ID: 58f23ef3-75cc-11ea-bd4f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58f23ef3-75cc-11ea-bd4f-12813bfff9fa;
 Fri, 03 Apr 2020 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585933111;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=VPEZ2kkgQIuLwDdYTTfQYWPvizndUG1Yv6sNqpE7FLg=;
 b=ZvRVUTAJMFX9tU7JalHuJsx+Ty1jMNvXJrfed/0P3kX+LKOaxW1VXKn8
 ACW71dH2/lEK0eNXYhwKxrZG3SisSNOozfjyVDjeCXcikW/mpwnI9C1+J
 xlW+svMVC5xLe6QT4eSlVNBOMZMuABVFRyfAfLSMiPYGqFQk9TW+x7jzM Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +dnmyQUlbGgZw5TKistgX3MO2x8Oiw+qnKGUJF6/kf2C4PXqe6uFyV+EnxpD7YxWGCDaWc4t/M
 6DZadohFau86zlqXnXk+0j7Mwo69Yi8HYedV2pzF4E5shyD7UHju0MFRt3Ojsaqo+kSk2qfHxx
 hT/EZ+weVFQgYjmTNWsoQGXJlPt9rW41wsuBk9g2V7oKe9r0aU9eohtUioI/ufl1DtSJ5K1Xzg
 g1GmEFWtMmAnc3PpYQ07v5MS9CwbB6Hav+Mt91ycyTveBx3GVqv+kUfDaoHcpPE78q7W5xvAB/
 pBA=
X-SBRS: 2.7
X-MesageID: 15556000
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15556000"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24199.27444.602811.605308@mariner.uk.xensource.com>
Date: Fri, 3 Apr 2020 17:58:28 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] tools/xenstore: fix a use after free problem in
 xenstored
In-Reply-To: <4a934636-3441-42eb-744a-3421eebb6c86@xen.org>
References: <20200403120340.13406-1-jgross@suse.com>
 <4a934636-3441-42eb-744a-3421eebb6c86@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [PATCH v2] tools/xenstore: fix a use after free problem in xenstored"):
> On 03/04/2020 13:03, Juergen Gross wrote:
> > Commit 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object
> > twice") introduced a potential use after free problem in
> > domain_cleanup(): after calling talloc_unlink() for domain->conn
> > domain->conn is set to NULL. The problem is that domain is registered
> > as talloc child of domain->conn, so it might be freed by the
> > talloc_unlink() call.
> > 
> > With Xenstore being single threaded there are normally no concurrent
> > memory allocations running and freeing a virtual memory area normally
> > doesn't result in that area no longer being accessible. A problem
> > could occur only in case either a signal received results in some
> > memory allocation done in the signal handler (SIGHUP is a primary
> > candidate leading to reopening the log file), or in case the talloc
> > framework would do some internal memory allocation during freeing of
> > the memory (which would lead to clobbering of the freed domain
> > structure).
> 
> Thank you for writing more context!
> 
> > 
> > Fixes: 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object twice")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Pushed, thanks both.

Ian.

