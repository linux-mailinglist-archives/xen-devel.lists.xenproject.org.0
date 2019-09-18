Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADFB6152
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAX20-000743-DJ; Wed, 18 Sep 2019 10:17:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAX1z-00073S-5E
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:17:51 +0000
X-Inumbo-ID: 9115d19c-d9fd-11e9-962b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9115d19c-d9fd-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568801870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tYZ2/QuQ5suJ8ghjokTOxq/dWt3aKbyed8X4thYu/z4=;
 b=hbR6HFZCEoT47ztBRRkOsktAPsMN4KGkVQtMQElXiLF7PpBOLdsRzmWg
 NabMdu6E9Ze2YfyDOIlNZSKQN379ntTQN9oe0GwPf62jQKbJ75xp2pE09
 HY3j/9j0Hj1DKZphQMVFuJ3JsV3kO/CDtqRgTFEntt06kpEXlnPBdM+Cq M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zHr3kaOaPmSuOEDdb26BcRpWlYNDaSINAwSNAH0IT6dnbW+TZpxrUJ+r0IhRdYTJX02ayKomyg
 HF69HvonUv/VPIrtp5waLRojRxHFvFVAacGvOFB4r91tIVsMytemVRoSxuWyKp/sEVjhWgIRdp
 QVVNFtgPVCWYfk6xxGuj/yRtC+oDUqVW3vvOvfQgJjIsNS0aO9unKerB53Rq1dCaH8aExRbwRA
 J0SobsoqU23WpL8/ZbDmYxZoMkhy8bMYwSLEZ/NjeDjaBPrrs18HoBG2BjCZ8xSKXs/iMJlbFi
 aiI=
X-SBRS: 2.7
X-MesageID: 5716619
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5716619"
Date: Wed, 18 Sep 2019 11:17:36 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918101736.GK1308@perard.uk.xensource.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-12-anthony.perard@citrix.com>
 <23937.3411.877144.354998@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.3411.877144.354998@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 11/15] libxl_usb: Fix wrong usage of asserts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDU6NDQ6MDNQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDExLzE1XSBsaWJ4bF91c2I6IEZp
eCB3cm9uZyB1c2FnZSBvZiBhc3NlcnRzIik6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBJJ20gbm90IHN1cmUgd2h5IHlv
dSB3b3VsZG4ndCBqdXN0IGRlbGV0ZSB0aGUgYnJlYWtzLCByYXRoZXIgdGhhbgo+IHJlcGxhY2lu
ZyB0aGVtICJyZXR1cm4iID8KCkJlY2F1c2UgYXNzZXJ0cyBhcmVuJ3Qgc3VwcG9zZWQgdG8gYmUg
Y29tcGlsZWQgaW4gYSByZWxlYXNlIGJ1aWxkLiBJCmtub3cgdGhhdCdzIG5vdCB0aGUgY2FzZSBp
biBsaWJ4bC4uLgoKSSBjb3VsZCByZXBsYWNlIHRoZSBhc3NlcnQoMCkgYnkgYWJvcnQoKSBpbnN0
ZWFkLCB0aGV5IHdvbid0IGJlIG5lZWQgZm9yCmEgYnJlYWsgb3IgcmV0dXJuIGFmdGVyIGl0LgoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
