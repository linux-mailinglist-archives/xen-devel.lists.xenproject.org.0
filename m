Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2F1D3693
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGpw-0006MD-0I; Thu, 14 May 2020 16:35:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGpu-0006M1-JX
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:35:54 +0000
X-Inumbo-ID: fa70211e-9600-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa70211e-9600-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474154;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qwtVVp+ccBGno3qwbkxZ3SGpiyVoSG6FcIf+fQ/YyHk=;
 b=TJ1w2WXWZKRFGyy5S7Ks5PZpxh4eCVUK/ifC2A0SRbQVcjMUgQtGXSG1
 2gaxYb0pBVEmH3n9iDz6uxZzah0V4n+Qe6j7sgI0NDo/n2K8FTar4J4g6
 QuyB/fVTGi8GVnKfObzKrYmVxEmUF0LJW9nnl1Bm6t1sdJeorr+ohHs3p Q=;
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
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: zR9S7KlqnsrROAKQGc3slbURnWZASnugNjse+qecOgBEeTlVZwStzRSMNFps9hNoGQoaSjFbl6
 gM+KWR0mDq70ZlzrDdSdRysjyjeNru3E98d0AElo7txde/VJNIu7VDPjYzfJhqWyTV2If/lMUc
 M3OxzrILj2geDS8K4xXTRxkPJ5J2ZNXtj0kZazR6J8u/bGQr1qeiA4JuRFx4q5Jy5uo4j5Z+G2
 WH3PFasXwWJQq6lC9FzUyw0eYH/rzrSIg1etm60soexK2ln+dNQo9ly7dH53+HPw4EdaP60JZO
 N4o=
X-SBRS: 2.7
X-MesageID: 17817132
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17817132"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29542.373728.684202@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:35:50 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 10/21] tools: add missing libxenvchan cflags
In-Reply-To: <20200428040433.23504-11-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-11-jandryuk@gmail.com>
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
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 10/21] tools: add missing libxenvchan cflags"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> libxenvchan.h include xenevtchn.h and xengnttab.h, so applications built
> with it needs applicable -I in CFLAGS too.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

