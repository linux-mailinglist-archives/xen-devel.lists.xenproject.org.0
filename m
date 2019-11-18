Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6B100A43
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:30:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkpF-0007pR-85; Mon, 18 Nov 2019 17:28:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWEU=ZK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iWkpD-0007pF-JP
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:28:31 +0000
X-Inumbo-ID: d09aa576-0a28-11ea-a2dc-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d09aa576-0a28-11ea-a2dc-12813bfff9fa;
 Mon, 18 Nov 2019 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574098100;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=vburwinr8//8oiIK0H9+ydgHRsWQQeFs+6z8134fC1w=;
 b=U7eEtc/jHFeMCn67heyU9DBdWqDAQnSy+WMxy6Zzk0aXnsTHoccFSXKO
 FF9iAo62tpa1pnDzgQJsB3f/JmYmV3xxcCVCHfXazJcWRzoMBkZg81YFQ
 QOvmXBd0kEJgCx2fIrAyRh61nn64lPTvYUhNhd071eLb9FNvlyQErIYkf c=;
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
IronPort-SDR: IAkYL+Grcvmyi3G4fWpBva3oeiTjkV3i75lPQa+9W/e8LiTTFJBmpwsppn4yzHt3IZtPdXXasg
 ol/35MLXNGfia5uGX2YNO4Kf3WeXBWt++MO6Byoxy/Zw+Jsvgp4P4xWNoQ2lHHcZX3icDQqDp0
 5+gSrbx1HVkt+9cYNk625T6HWQrEiYU4WI6qCcCDNnRYJoSrRoZbSaIAL9X26oNpfPZLJQ0Uzy
 OlRHo1VH6kemjB16+pObaernuDNAJ2PaLEsLv7hTbBybolsGBxaq37mZE/nfiCgeN4Z2JuEyT3
 YO8=
X-SBRS: 2.7
X-MesageID: 9014772
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="9014772"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24018.54449.703124.372517@mariner.uk.xensource.com>
Date: Mon, 18 Nov 2019 17:28:17 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191118171309.1459302-7-anthony.perard@citrix.com>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
 <20191118171309.1459302-7-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 6/7] libxl: Introduce
 libxl__ev_immediate
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MyA2LzddIGxpYnhs
OiBJbnRyb2R1Y2UgbGlieGxfX2V2X2ltbWVkaWF0ZSIpOgo+IFRoaXMgbmV3IGV2IGFsbG93cyB0
byBhcnJhbmdlIGEgbm9uLXJlZW50cmFudCBjYWxsYmFjayB0byBiZSBjYWxsZWQuCj4gVGhpcyBo
YXBwZW4gaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGN1cnJlbnQgZXZlbnQgaXMgcHJvY2Vzc2VkIGFu
ZCBhZnRlcgo+IG90aGVyIGV2X2ltbWVkaWF0ZXMgdGhhdCB3b3VsZCBoYXZlIGFscmVhZHkgYmVl
biByZWdpc3RlcmVkLgoKVGhhbmtzIGZvciBkb2luZyB0aGlzIHdvcmsuCgo+ICsgICAgTElCWExf
VEFJTFFfRk9SRUFDSF9TQUZFKGVpLCAmZWdjLT5ldl9pbW1lZGlhdGVzLCBlbnRyeSwgZWlfdG1w
KSB7Cj4gKyAgICAgICAgTElCWExfVEFJTFFfUkVNT1ZFKCZlZ2MtPmV2X2ltbWVkaWF0ZXMsIGVp
LCBlbnRyeSk7CgpJIHRoaW5rIExJQlhMX1RBSUxRX0ZPUkVBQ0hfU0FGRSBpcyBub3Qgc2FmZSBl
bm91Z2ggaGVyZS4KZWktPmNhbGxiYWNrIG1pZ2h0ICphZGQqIHRoaW5ncyB0byBlZ2MtPmV2X2lt
bWVkaWF0ZXMuICBUaGUgbWFucGFnZQpqdXN0IHNheXMKCiAgICAgSG93ZXZlciwgdW5saWtlIHRo
ZWlyIHVuc2FmZSBjb3VudGVycGFydHMsIFRBSUxRX0ZPUkVBQ0ggYW5kCiAgICAgVEFJTFFfRk9S
RUFDSF9SRVZFUlNFIHBlcm1pdCB0byBib3RoIHJlbW92ZSB2YXIgYXMgd2VsbCBhcyBmcmVlCiAg
ICAgaXQgZnJvbSB3aXRoaW4gdGhlIGxvb3Agc2FmZWx5IHdpdGhvdXQgaW50ZXJmZXJpbmcgd2l0
aCB0aGUKICAgICB0cmF2ZXJzYWwuCgpJIGNhbid0IGZpbmQgYW4gZXhwbGljaXQgc3RhdGVtZW50
IGFib3V0IHRoZSBhbGxvd2FibGUgY2hhbmdlcyB3aXRoCkxJQlhMX1RBSUxRX0ZPUkVBQ0ggYnV0
IEkgZXhwZWN0IHRoZXkgYXJlICJub25lIi4gIFNlZSB0aGUgbG9vcCBpbgphb19fYWJvcnQgZm9y
IHdoYXQgSSB0aGluayBpcyB0aGUgY29ycmVjdCBwYXR0ZXJuIChhbGJlaXQgZW1iZWRkZWQgaW4K
c29tZXRoaW5nIG1vcmUgY29tcGxleCkuCgpUaGUgcmVzdCBvZiB0aGlzIExHVE0uCgpUaGFua3Ms
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
