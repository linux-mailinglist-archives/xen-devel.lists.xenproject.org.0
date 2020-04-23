Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366871B5911
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:22:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZ04-00013n-49; Thu, 23 Apr 2020 10:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRZ02-00013S-Jv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:22:30 +0000
X-Inumbo-ID: 560a80fc-854c-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560a80fc-854c-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587637349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Pv0utfcQrOBeVP82M/X9IHBRVbbaHAf0sAhccm4E9vY=;
 b=Dk0L7FSQoxeIPKdPycnIri/aGyJk6Gzpg1BtfnRXd4dEB+GuO7f2jFi4
 Nq/Z9ImNKzxJojgvCi/nfqw2eGOLcFw2biMZV0aIKgk+1OvEQYo8IfUax
 LZzXrvn7hQziBIVB3TArkpMtKV5EP8sKM7CfxG9yKR3mHgk1xknhKialt k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DocxLy6GnvEJgw8lKJEyaYM1kvQZjH2tLKyVc1vx7p86OIEFyGwbxL0UwTyJ+CB04IUiDublRr
 k4jqWT+rxT0FEDFw/0NPUaLTSwSyQxBJCKsq2++aETHaSU00t4X452vj3GsSFK4NccYnoOD60G
 cJuzgaJjqzi4CecDD9UkmRdTUy4pRmEmAKQ9XYuT+Q9Rbv2NAABbBG2IMuCAZg25TG1CWs63BL
 piqpklToTNEACUPTmJ8oTQmH6dAhOeYjGIq2Ndex71nVEW48hP3UzUC+Jdj5VcgQo53kd181Wr
 nY8=
X-SBRS: 2.7
X-MesageID: 16434562
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,306,1583211600"; d="scan'208";a="16434562"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 3/4] golang/xenlight: add DevicePciAdd/Remove wrappers
Thread-Topic: [PATCH 3/4] golang/xenlight: add DevicePciAdd/Remove wrappers
Thread-Index: AQHWERYncygAsLTYgUqugWPv615hCqiGbncA
Date: Thu, 23 Apr 2020 10:22:26 +0000
Message-ID: <7B3A2F0A-84C8-48C8-B9B2-C27ABE5F22D1@citrix.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <7f03220c9db0a377cd26c0c96d8a10981ec47282.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <7f03220c9db0a377cd26c0c96d8a10981ec47282.1586727061.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F697854FF425642AF3BBDD36E0477F8@citrix.com>
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



> On Apr 12, 2020, at 11:02 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Add DevicePciAdd and DevicePciRemove as wrappers for
> libxl_device_pci_add and libxl_device_pci remove.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

For 4.14, we should really look at adding functions to the IDL so that all =
this can be auto-generated.

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


