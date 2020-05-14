Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0831D2DCB
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 13:03:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZBdP-0006Kd-Fc; Thu, 14 May 2020 11:02:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZBdO-0006KY-8s
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 11:02:38 +0000
X-Inumbo-ID: 6b8f88aa-95d2-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b8f88aa-95d2-11ea-b9cf-bc764e2007e4;
 Thu, 14 May 2020 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589454157;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2lJRdDZAL09uSXwNG4aY919xa6S1TgFHXfBN9OF5Fes=;
 b=iWNpWPjdYOsrjpOE9GLVyPnfxopzYpzPB0ZX1a5VN1ae9wQ1b4y0T7LD
 AVjLrZMeZ83yncKF+ngPety2A3fKUG7jdvN3ALwgsl1qmHqdAIAr8r2X8
 YBuFCH4WNU2IOjV1eM4mTDPnRBzrK4lyOOi1g33cPZ3wtmKixTNYrXk0y s=;
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
IronPort-SDR: ycrrxEam5/OvF+NUPGbXxJXAErZ/L/1PX0JzEgACgk87l092NO3DIfuvmW9B6v54Uih8O7WUu2
 eBeK5v1aQEE3RMyA3RUPEckdk5aQ4EnzqBtvckGGRiA52+xx0p/fqfVWkDLs7hkyxxi2sNv+2a
 UqnZ45fUUBFk5OsEmN0eWzsw8ghJkAnGPzJnk4FePve/srXdAmFWw47ZX/zIqg237ProuKzVLD
 QCwhr45zCTXoDfAyE88RZXTw2HhWNalafthnj+pE9k1D3X29LwQf+HuKHT8ZnzR6a/qPe/4WAK
 C/s=
X-SBRS: 2.7
X-MesageID: 17777103
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17777103"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.9543.974853.499775@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 12:02:31 +0100
To: Elliott Mitchell <ehem+xen@m5p.com>
Subject: Re: use of "stat -"
In-Reply-To: <20200512225458.GA1530@mattapan.m5p.com>
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
 <20200512225458.GA1530@mattapan.m5p.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I've read this thread.  Jan, I'm sorry that this causes you
inconvenience.  I'm hoping it won't come down to a choice between
supporting people who want to ship a dom0 without perl, and people who
want a dom0 using more-than-a-decade-old coreutils.

Jan, can you tell me what the output is of this on your ancient
system:

  $ rm -f t
  $ >t
  $ exec 3<t
  $ stat -L -c '%F %i' /dev/stdin <&3
  regular empty file 393549
  $ rm t
  $ stat -L -c '%F %i' /dev/stdin <&3
  regular empty file 393549
  $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
  $

Also, the contents of the file "u" afterwards, please.

Thanks,
Ian.

