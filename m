Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90681836A1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 17:54:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCR3o-0006Df-D2; Thu, 12 Mar 2020 16:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCR3n-0006DY-AH
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:51:51 +0000
X-Inumbo-ID: c3add989-6481-11ea-b1d9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3add989-6481-11ea-b1d9-12813bfff9fa;
 Thu, 12 Mar 2020 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584031910;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=YfmL5nPjUmoCiD2WVblnV9l77t5UejeBHH6FMl/pfjo=;
 b=Y4gaVKObbHeI22EsG5dqNtHkBgk+SLjIlog9ReJdxa5KR+XOW48po06g
 fdc5Oo2XZTYaGaPbwsWjm8+JpqrkE81aHCZ/j2/uw+HKUKyOQ4dYQ0zdj
 mZ6k+CA+tw4836cZtn0xEVjWZ89Zv7gDFeFHpEYxfvMTeOfTYt3L9vB7u Y=;
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
IronPort-SDR: fJ0G/tY0E6/rBbxq+B9/x59xtB/v0T0eZ2wZeWRIuy9R26zVf6sG5lTFOxjpbiFCxVfJ7cZ8pI
 WNK0d+oeSFEDk5iTNRrlifLT3qJma5TiViVs3ZQWiRqMtV81+P0a2jVC7wM8JFpI0xQ+S+q4wO
 arS+EqN7i78EPdjvVP2q8YhzNSWxYHj2A15s7xsZTAsm+0ZQSnHty+b38TWhDz2npnN+BSWSqc
 derRgZ8Dwl+t11yHIpeA7sTlh6c2m0D36bV3A4VzdlkFVg5wpVnqsav41elLmWUla92BiKAQjo
 amk=
X-SBRS: 2.7
X-MesageID: 14489621
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14489621"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.26778.141534.970225@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 16:51:38 +0000
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Juergen Gross" <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>, <xen-devel@lists.xenproject.org>
In-Reply-To: <24170.26671.783256.460525@mariner.uk.xensource.com>
References: <24170.26671.783256.460525@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Stopping much Linux testing in Xen Project CI
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkaXRpb25hbGx5LAoKICBsaW51eC1uZXh0ICAgMjE2MiBkYXlzCgpUaGlzIGlzIG9idmlvdXNs
eSB1c2VsZXNzLiAgSSBhbSBzdG9wcGluZyBpdC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
