Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022A1D3711
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:56:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZH9J-0000yL-9X; Thu, 14 May 2020 16:55:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZH9H-0000yG-NA
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:55:55 +0000
X-Inumbo-ID: c61d9c55-9603-11ea-a4b5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c61d9c55-9603-11ea-a4b5-12813bfff9fa;
 Thu, 14 May 2020 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589475354;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=D5qXEfAW5rG98iWDbNNeq73weeSNhCXVmeNdOZN5+qE=;
 b=bmTJCn2Fkoc3VHKb2yxB1ssl1GAUQ0d31X7v5EL63COdSEX8YfIW4SSF
 POZt7p0qMiWkaHXZvoaTiUfjVnMFODFQz1Z6e6fgq7vjIK9dAKdWBmHgB
 JK74bmuAS9Pt2xcN8hDQN/z6dZoP7uKtYC5t6OggJY7miswmIqu0Exnse c=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: M+cvbzxc6j3YYi2jQEl7IzuB0ywxBnWxuKMIvZsU+5xEn2NOANz4J3qiq4WJ9L39M8hAW7ju07
 yW+IpIsiRdsM3jat/wYoWOcbK3nK4B7WgUtN+51f/8rI+92EdNv2jo8YL6JMn56OmzT6nF2FYD
 ArZYLTaMiDboeYJv9UA40aRN4J4HClt6BzGhCGZkUzDBMwY3A21fR9wGV9MTKo3HIHwdFKt+4L
 pWD4eURhQerGApx0IKEq/QTbr0bDrSG+v7J5/oyqgq74bJoG7QLYWwPLyh034JVt19mE2c/EgS
 P/E=
X-SBRS: 2.7
X-MesageID: 17817623
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17817623"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.30741.77867.105081@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:55:49 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 00/21] Add support for qemu-xen runnning in a
 Linux-based stubdomain
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 00/21] Add support for qemu-xen runnning in a Linux-based stubdomain"):
> In coordination with Marek, I'm making a submission of his patches for Linux
> stubdomain device-model support.  I made a few of my own additions, but Marek
> did the heavy lifting.  Thank you, Marek.

Hi.  I finished reading these patches.  Thank you very much.  They
were nicely structured.  I found them clear and easy to read.  As
you'll have seen I have requested only a few changes.

I am very hopeful that this series will make 4.14.  Codefreeze is
Friday the 22nd of May.  Please let us know whether you think we'll
all be able to make that...

Regards,
Ian.

