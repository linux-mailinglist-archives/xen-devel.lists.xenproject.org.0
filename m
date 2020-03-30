Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AE197CEE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 15:30:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIuT5-0008MM-UW; Mon, 30 Mar 2020 13:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IY4r=5P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jIuT4-0008ME-Iz
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 13:28:42 +0000
X-Inumbo-ID: 5eab8f8c-728a-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eab8f8c-728a-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585574922;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=h2/1FOGtq7kMP5ZPrl/rGGLymC+got6ZsYFKUMfeX5U=;
 b=VNyYyny7QGRLF9oEMaiw+hRejErvQzRA8go/FbtiKS2iQnEFoT8hTCN1
 ywCrmaPVoFRqfhj0EUf6mqj6ilIu3s5ZkgiZJWWUkloDHBJb98bpa8e+2
 vcFrepA5SlmwAae4f5QhownjHPYKm2kY32drj2i3fiYkhzggi/gKxxjJk 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5Ne/Os3wn5hoA4Gh3uj7HO42C0lJmKC+CtqL7jeao1Gaei6E0X6EKLlEIV3z0NDkxeHi0Ci/In
 Nn/WW3sMbYuFkxztUJagsS7NREDEiJrw6pRRWnbjVlLKy7SEmu9Qcfqvk/l238moC3eIvqKoy+
 a+U4A1jr8Tc5lGaBFLJ6sJLfli0tiEbOcCnRoNleUS5sQUPc5gr1OsBI5gt2OIhrzqAcLSTC4U
 seCZu0UYkfZ52NXiz6yMyaIxz/fq2lKhg4jA+7FLUkHs1cTdrJIAvP+jH52OhIqbKJgN++xfti
 AbQ=
X-SBRS: 2.7
X-MesageID: 15077975
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="15077975"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24193.62462.682761.732817@mariner.uk.xensource.com>
Date: Mon, 30 Mar 2020 14:28:30 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <20200330132556.fjskeqkqlpd6g2er@debian>
References: <20200312145417.106812-1-jandryuk@gmail.com>
 <20200312145417.106812-3-jandryuk@gmail.com>
 <20200330132556.fjskeqkqlpd6g2er@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/2] scripts: Use stat to check lock claim
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wei Liu writes ("Re: [PATCH 2/2] scripts: Use stat to check lock claim"):
> On Thu, Mar 12, 2020 at 10:54:17AM -0400, Jason Andryuk wrote:
> > Replace the perl locking check with stat(1).  Stat is able to fstat
> > stdin (file descriptor 0) when passed '-' as an argument.  This is now
> > used to check $_lockfd.  stat(1) support for '-' was introduced to
> > coreutils in 2009.
> > 
> > After A releases its lock, script B will return from flock and execute
> > stat.  Since the lockfile has been removed by A, stat prints an error to
> > stderr and exits non-zero.  Redirect stderr to /dev/null to avoid
> > filling /var/log/xen/xen-hotplug.log with "No such file or directory"
> > messages.
> > 
> > Placing the stat call inside the "if" condition ensures we only check
> > the stat output when the command completed successfully.
> > 
> > This change removes the only runtime dependency of the xen toolstack on
> > perl.
> > 
> > Suggested-by: Ian Jackson <ian.jackson@citrix.com>
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Ian, ping?
> 
> I already applied patch 1. This patch looks to be good as well.

Sorry.  Yes.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

