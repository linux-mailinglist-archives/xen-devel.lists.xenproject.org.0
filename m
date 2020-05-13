Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E071D0F7E
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 12:15:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYoQK-0004lj-Fe; Wed, 13 May 2020 10:15:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhv+=63=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYoQJ-0004le-IR
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 10:15:35 +0000
X-Inumbo-ID: ae4024fa-9502-11ea-a34b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae4024fa-9502-11ea-a34b-12813bfff9fa;
 Wed, 13 May 2020 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589364935;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=K1DDlQ+oTKpl/SufIVCEeC9exhF5mUl7ZcBdW6Fjs78=;
 b=erQbfCSKswPWDUr5e/i5c2Hn+n80zXSl1WEfve2uM9WjdjK+8S2O1YJJ
 dhMp6YRyBg3Yje0UkUwqnVColrznXDUshSfKwwHRxmgSdAJpECnmZqaTW
 Wkbj26dEI8hgpL4s/HnJBWLmEqreqCOF6i/7pogU6qLbhjaq1vrK829bF M=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: UlVtyVxFqucz2Ilf4xfP3dTj0dxIY93ZPPrPZ1dM3Re46079vOuj0+g+TTnTcGwVEsxGdJprpI
 ld6mvtfuIbkMg5lSHhPMvkDMQlh1nGqrctuOWHuKK7iStzCE1qciwGoL71StxVTZgfw9+nESiT
 gf/IhWt9oimsdDkjbfcY8EgPlydZlHhuQr8hIfB+HM7Q3e+++nOawvb+eC7ez+zuqy5ylK0G5B
 okOGXvJSx4hPeFPxXTbWLmbLOOuA7bii+wMe6LOMTUms8bSDZQkhUeJ7Lp86aWCOFAJrqhIsb+
 UiI=
X-SBRS: 2.7
X-MesageID: 17395518
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17395518"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v3 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Topic: [PATCH v3 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Index: AQHWKMFEbi6kgYqzdUWf66u+AEotDKilq9GA
Date: Wed, 13 May 2020 10:15:29 +0000
Message-ID: <77D6F591-FF91-43A8-8278-1F7EF3D8B9D9@citrix.com>
References: <cover.1589321804.git.rosbrookn@ainfosec.com>
 <a543eec1da35b619a06816f8aed29774daa38cb7.1589321804.git.rosbrookn@ainfosec.com>
In-Reply-To: <a543eec1da35b619a06816f8aed29774daa38cb7.1589321804.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD73ACB3B0C3894EB2FFF89A63E40602@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On May 13, 2020, at 1:55 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Many exported functions in xenlight require a domid as an argument. Make
> it easier for package users to use these functions by adding wrappers
> for the libxl utility functions libxl_name_to_domid and
> libxl_domid_to_name.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Looks good, thanks!

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


