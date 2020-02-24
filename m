Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D166B16AE42
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:59:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6HyG-0004qH-PX; Mon, 24 Feb 2020 17:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6HyF-0004qC-HF
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:56:43 +0000
X-Inumbo-ID: 03991a5e-572f-11ea-a490-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03991a5e-572f-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582567003;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=6Dn0z9DBNfxtBQUL81zNWUTOdeE9Igv1pFxjQPVydj0=;
 b=FfrBGeAkjhB+jzvuRUt3HYaktS/COZI3lLnPWGgl+Pk0v7zxGoXnqaAM
 EnAEl61PbVVxeTrMzt/uny3L2rvakHDmzCvIb92m7Vkq4hFLEHORn5tO6
 r/XneQotpcZ3XWAXR2GOV80ynsF+OGnbonWm2syE8uyM8nttXvLrxavQF I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U5zuNv9fsYelJN8Z7u/FHMJbQwY0wue5YCNYO0R4pz4Fhk8i5e2p1T4VlZuI099C6Lf2ks/IfO
 k1lESJ0kKlC7QXbsKLq3hUm/mu3pYCk/s8I6Pfqw7igX2PkA6RYBH3HTiEc8rCdar5oloYVvLf
 ZuKvXmaYjo06jJLCEaMSKhlqpllKm9HE2LbUs8VE7eqyOFkFMrhm/rUDFBUEvxa6uOo4hJ/oIu
 cWHMOQLjPUTMf4ugdslGq/WjY5TYCUwIv8aNgVwn73lgr21hveonCV13havCNspMO3V0626dBL
 OEs=
X-SBRS: 2.7
X-MesageID: 12904694
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12904694"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.3670.685800.220403@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:56:38 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <3acd774a777948c6965f9ef94505aadc@EX13D32EUC003.ant.amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <24147.61855.619335.745427@mariner.uk.xensource.com>
 <dd6cfb5f1770450abf7362ff1872f2b8@EX13D32EUC003.ant.amazon.com>
 <3acd774a777948c6965f9ef94505aadc@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v7 0/6] xl/libxl: domid
 allocation/preservation changes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHY3IDAvNl0geGwvbGlieGw6IGRvbWlk
IGFsbG9jYXRpb24vcHJlc2VydmF0aW9uIGNoYW5nZXMiKToKPiBTZWUgaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9wYXVsZHUveGVuLmdpdDthPXNob3J0bG9nO2g9cmVm
cy9oZWFkcy9kb21pZDEyCgpUaGFua3MuICBMR1RNLCBwdXNoZWQuCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
