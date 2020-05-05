Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2441C5843
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:12:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyI3-0001qq-IZ; Tue, 05 May 2020 14:11:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOzX=6T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jVyI2-0001ql-Gc
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:11:18 +0000
X-Inumbo-ID: 48f6212d-8eda-11ea-9dc0-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48f6212d-8eda-11ea-9dc0-12813bfff9fa;
 Tue, 05 May 2020 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588687877;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Lv42nvGup2zH6vXJrBtIDvIjrn5fvVYc9R2+p+zlZFk=;
 b=Ny/ikc2Y7B0UXvAyZg4N/VjauO8FDJvnhWlBpAMfJFhjSOkLivmUJQ4C
 1aWSo0zQ8lLNwL/lS3ymrcv1TAVvY7dr4lub4bxgYC9Ji8cD9cEnpCwEb
 P1UDAzLQqE2KXEYcy063sntPG6GZtYsaJ0Br9vUAr94W+Q7fEm9riGQc8 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gH/OnwiMyaJMR33rEHZ5urwEnIXr+DV43xXRkVu6uLZ22cAlAm8KXX+Uht3/xjkmB77MO727kc
 JqWREo7LB9cKqX3rb3YJr+LNQJ0YrNfSd+HwAnpMDb9gp6T3r7D+hZWfnN3Fm0LJkwne/7JzWe
 gz7BaVuFD9ezTKBGJbVCvjswCRfFU6fbxqdN0XYpCHls42hdmVZKsGkKvi1HI4nI9w0+GjqAD9
 Evq/8vYx3WKWQPlm800lY3ukCK1m+8y0O4a8ZsYL1p+p/LE5XfClyXWn8iN4acCJCZqfZAPWna
 WNI=
X-SBRS: 2.7
X-MesageID: 17470581
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17470581"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24241.29697.707595.28182@mariner.uk.xensource.com>
Date: Tue, 5 May 2020 15:11:13 +0100
To: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: xen-4.13 tools/xentop.c backport request
In-Reply-To: <a8a6764c-fa1d-5a8d-5470-adf149e4dfda@eikelenboom.it>
References: <a8a6764c-fa1d-5a8d-5470-adf149e4dfda@eikelenboom.it>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Sander Eikelenboom writes ("xen-4.13 tools/xentop.c backport request"):
> If I'm not mistaken you do the tools backports.
> 
> I just noticed that the problem that is fixed by commit: 
> 4b5b431edd984b26f43b3efc7de465f3560a949e tools/xentop: Fix calculation of used memory
> 
> is already present in the xen-4.13 branch (older releases are uneffected).
> Unfortunately I didn't check before, so I didn't include a "backport tag".
> 
> If it wasn't already on you backport list, please consider to backport / apply this one.

It wasn't.  I have done this.

Ian.

