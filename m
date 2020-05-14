Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B61D36B4
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:41:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGv7-0007XM-Db; Thu, 14 May 2020 16:41:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGv6-0007XG-H1
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:41:16 +0000
X-Inumbo-ID: b6e62187-9601-11ea-a4b1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6e62187-9601-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474472;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=cyiVLU6EQWf62E9vmHbjg+E3NRWfTbuH4+5ne1kWS3k=;
 b=cYSzzyFMOe57SvrYvc3gcpZdih5kbT/PmxEj1M6xqoc5X1TaQS99cJqj
 l1Cw9gD67uOn2q2ecZUkX7vu0cg5/dSWF9jjcNspLcgr9S+dt45OeRSmC
 qkPaL++ss7I7rKbsLHRvOyYB1vd4IEfBcJRnZbcoRAmbJmCP/f5vIofgn 8=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: rxKE1WN8e0GswRpCSgyg6qN/MHgR3WbCM7xZDBlqgF6yEYWm4/U8ejsEgPDpxd/miISz85OD8/
 xj5370nJIoHeeFMdfacVqqUvB04WZCIG5MG0TBFTE/JDbxwvIptG5IrArpLQV/8KXTEmkXwTjn
 kZ3pwxQAW4rMB/R3hME3Hy86mRjYNS4YTw/8hIhKYStcOlp+rPpaXrYf2gIrmFdcaBBRJkPDld
 Fj7V/NMcIGItgFcMVT2q4pK+FiZjeesiy1WF9yyjAXfEL7NmJ9jVlojb1eZ1B1j+pZ0XPnf8gL
 QJw=
X-SBRS: 2.7
X-MesageID: 17571637
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17571637"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29859.291364.371640@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:41:07 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 13/21] Regenerate autotools files
In-Reply-To: <20200428040433.23504-14-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-14-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 13/21] Regenerate autotools files"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Since we have those generated files committed to the repo (why?!),
> update them after changing configure.ac.

This should be folded into the patch that changes the input.  Can you
please add a note to the commit message instructing the committer to
rerun autotools.

We have these files in-tree because not everyone has a recent
autotools.

Ian.

