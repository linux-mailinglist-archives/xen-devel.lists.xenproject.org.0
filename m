Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8291D366F
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGga-00057F-7Y; Thu, 14 May 2020 16:26:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGgY-00056x-JC
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:26:14 +0000
X-Inumbo-ID: a0c68582-95ff-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0c68582-95ff-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589473574;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=vf0BnNSZVE/00QmV1a5fPfWjL0yQ4186LfICng2mcg8=;
 b=YnE6MWeHsLj7LdaA/7J3zRvMG94EOGEvZa53d6krf7IrqZjQHvbxSBn3
 F4ZSfvEn5xoVRWBAhqB2nlpkl+kbUMaNZPtB6Wg18D05vchVrnb+BlAWQ
 tKAYPqJ6Lx/XBazJDXyLTGMSSxEG8wMpkNSSXLX44AUNozVepxnhvMP6S k=;
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
IronPort-SDR: Z1+LnZYGMoURu8/FKSDWHbmqE8uFaa9i75EtrMfG1pqjoyRqP9kHIyoi8DFrJFRlXcML2aecar
 wZ06iWm2V+g2OZA8Ch/zdy7TzcOAcRHoPgXifoBqRirmoQ8HAwIGkANLEbNZamWzZh/cJ94VGE
 eesFQfl5QW0n0qgysmizdqk+lHd4TOZ5acVXSEB8k6FPtyHflqtnOwEsMKA5WI0PIwu1oK4XpR
 hIkhVovIdO3uz/G+fDmaC5h+ckwog/7iLrP8K/zE/Qf9fkCTJCnePGhTWeTuR0AlM4/tw3qScg
 pCo=
X-SBRS: 2.7
X-MesageID: 17815947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17815947"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.28960.758984.914907@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:26:08 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 07/21] xl: add stubdomain related options to xl config
 parser
In-Reply-To: <20200428040433.23504-8-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-8-jandryuk@gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 07/21] xl: add stubdomain related options to xl config parser"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

