Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B5140DF5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 16:33:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isTad-0000PW-HJ; Fri, 17 Jan 2020 15:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isTac-0000PM-5U
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:31:14 +0000
X-Inumbo-ID: 5d330a66-393e-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d330a66-393e-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579275061;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=mCEpQ2c7kB6lkeoP2b87dbEBcSbYxcL2q6tldo9/TMs=;
 b=A21ohKhRNZyNiqAvGW3/wBcfPdatUSKnG8+dYxgj222ySgkXVB6HPQis
 uCUt/LNuGtl2FOjzHcfEDPbJ5sWPiuKF16Gb3Hhn4tH+kG///siDGV/SC
 oJju1KQ3HE5rqUNnrV7VS9EtmlTaiakE0eD0q7V9A7p50GIAssL1gLMvP o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: eS7d370qBNcRHlirDjCWMg7SYY4D6+pT11zKNqmIba3aafcI0+OjKUFCnKYGAkG1gD2Vhxqn/j
 zkZxuPFJJC9FpelVsFcHk0XICBhyleanbYvreLXn65mTWRIfZ296tZqpQoGu0puQptWfciqUBv
 TMs2dYwy+CLXJuqRhAxodp1reyY0ejkf34XbmWhBFbK/kV6NRFaxCHg7XoWJiTWDVolQf73jR4
 EXamDGRRf22SAq7jducYFxfnvc5WpyVFRSeh9AP/wZeYt6QaCNEJGOk1WH+Ndw3N0AOY24aOgp
 /0E=
X-SBRS: 2.7
X-MesageID: 11248221
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11248221"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.54065.383121.600036@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 15:30:57 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <d5ca972f0e7a429d847a522e9f21c54b@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <24096.44311.441643.264877@mariner.uk.xensource.com>
 <402866798e2a40e192fd8052548374c5@EX13D32EUC003.ant.amazon.com>
 <24097.39947.159860.741920@mariner.uk.xensource.com>
 <d5ca972f0e7a429d847a522e9f21c54b@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHYzIDQvNl0gbGlieGw6IGFsbG93IGNy
ZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQiKToKPiBP
aywgdG8gY292ZXIgYWxsIGJhc2VzIHRoZW4gaXQgc2VlbXMgbGlrZSBjaGVja2luZyB0aGUgZG9t
aWQgYWZ0ZXIgY3JlYXRpb24gYW5kIHRoZW4gZGVzdHJveWluZyBpZiBpdCBpcyB0b28gcmVjZW50
IGlzIHRoZSBiZXR0ZXIgb3B0aW9uLgoKSSB0aGluayBzbywgeWVzLiAgSSB0aGluayB0aGUgcmVj
ZW50IHRpbWVzdGFtcCBzaG91bGQgYmUgdXBkYXRlZCBpbgp0aGlzIGNhc2UuICAoRmFmZiEpCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
