Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4581E8D33
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 17:47:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPUbf-0004TV-Ht; Tue, 29 Oct 2019 16:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPUbd-0004TQ-Rc
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 16:44:30 +0000
X-Inumbo-ID: 5ea84711-fa6b-11e9-9516-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ea84711-fa6b-11e9-9516-12813bfff9fa;
 Tue, 29 Oct 2019 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572367467;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ilil3dNEI7aYCXLzJ1BBtfUaYfvFmZDRutMGeBZVglM=;
 b=I/L8LxA11+MyFxosGXrkR1A/VJMxpHHQ7IygrkuaMR8zpyBIwMT0eMEe
 6hxn/2nHgQmFgnidzrBSVY2UmSIC+ihjtznvIqeVpokEBS9eK4M5Pm+8z
 j5/bVPkecH0nUHhoJbnEOQgWpj7WTlloVLptVbUTD4UTa/iL1uO1v70NS 8=;
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
IronPort-SDR: nSVJ5rjgqKdoHzFxEIsUaLv1nrb8m1FwHz1INVIR+h3/ayEAKxEA0F+TDy/lohIq6ZTbraVKjS
 M4BvfD9rAATeOVkElCSPYDdznKhtsvmTpdAWsZYF0lBtcpLXw58wXcHzFRZaKSNAdXjq4tZOs3
 uLDGQaAlcdwhwKGd6MlSBQLNKd5/x41uAG4h8p03znBWF+boZPxsnLuGE1Hib+LQSrpR+olGZN
 E4+yD43kfyZY7ZVUhEOMMiCw+YfVXQGAsdRMcMMR/N9kH89GuBynXzv0UpqnSAbeVySMXGcFjU
 tC4=
X-SBRS: 2.7
X-MesageID: 8039279
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="8039279"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.27752.434203.611483@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 16:44:24 +0000
To: Wei Liu <wl@xen.org>
In-Reply-To: <CAK9nU=oQaDdacWgxCBXG=PdJy9F7Vehrn9uGrDgpGyVYHHZJ0w@mail.gmail.com>
References: <20191024130154.19145-1-wl@xen.org>
 <CAK9nU=oQaDdacWgxCBXG=PdJy9F7Vehrn9uGrDgpGyVYHHZJ0w@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 for-4.13] CONTRIBUTING: drop blktap2 and
 add tools/libs
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
Cc: Juergen Gross <jgross@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYyIGZvci00LjEzXSBDT05UUklCVVRJTkc6IGRy
b3AgYmxrdGFwMiBhbmQgYWRkIHRvb2xzL2xpYnMiKToKPiBPbiBUaHUsIDI0IE9jdCAyMDE5IGF0
IDE0OjAxLCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3cm90ZToKPiA+IEJsa3RhcDIgaXMgZ29uZSBh
bmQgdG9vbHMvbGlicyBpcyBtaXNzaW5nIGluIHRoZSBkb2N1bWVudC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbQo+IAo+IEFueSBjb21tZW50IG9uIHRoaXM/IElmIG5vdCBJIHRha2Ug
aXQgYXMgIm5vIG9iamVjdGlvbiIuLi4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
