Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA266B7EF4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 18:20:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAz7r-00042g-4h; Thu, 19 Sep 2019 16:17:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAz7p-00042Z-T5
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 16:17:45 +0000
X-Inumbo-ID: 0308865f-daf9-11e9-9662-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0308865f-daf9-11e9-9662-12813bfff9fa;
 Thu, 19 Sep 2019 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568909866;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=82Dlp50Xojbupj+FPx9DuZ0S46hRgqtckJCVlInWStg=;
 b=dGFWpFJ5u76XAuEd+f3ULUPeFcoNtfpHvVBKiLPD0OAVX5/JQorRbO0l
 xwZqyiFRmDgF+LUytOZ+FbrZYkJzDWenKIrq+0IEyYawATppjJF2OHkzR
 yJX3tkNd/2Sun2fLSrJ42naA83Yl04HyhCRJuLyBmdlVfjJu5p08VIPT5 E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jYtOP5nesJ4rl3wn2OK1eeW7afx4AE/baN0JXXHD2uqljQhCDykWJldL/Qq7DSurLIy0k30UEt
 KYfIWLzXpbcPJBlq6YwKD/1cTHzy4x3VwXOo6k62BGQ4VUikRAYL6S6fkJ5CIAmu4fY0yLaVYg
 wWda1PVtxaiGo5giHmcynQT2kYQpT5X2F49Uty18gu5BzTGzlB3i9LkpuDdH9uB4Jew53UmKBz
 nJDNw8JdVIGUc/gbTFhTtA3D26bY+XpbLlCNqAzmkag9icaPzXosl9gXpj9e9PeRLQib8Bz04q
 2ak=
X-SBRS: 2.7
X-MesageID: 5860009
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5860009"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.43540.229719.913463@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 17:17:24 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919144602.GT1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-34-anthony.perard@citrix.com>
 <23937.6898.699406.584772@mariner.uk.xensource.com>
 <20190919144602.GT1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 33/35] libxl: Extract qmp_parse_query_cpus
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAzMy8zNV0gbGlieGw6IEV4dHJhY3Qg
cW1wX3BhcnNlX3F1ZXJ5X2NwdXMiKToKPiBPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAwNjo0Mjox
MFBNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEFudGhvbnkgUEVSQVJEIHdyaXRlcyAo
IltQQVRDSCAzMy8zNV0gbGlieGw6IEV4dHJhY3QgcW1wX3BhcnNlX3F1ZXJ5X2NwdXMiKToKPiA+
ID4gVGhlIFFNUCBjb21tYW5kICJxdWVyeS1jcHVzIiBpcyBjYWxsZWQgZnJvbSBkaWZmZXJlbnQg
cGxhY2VzLCBleHRyYWN0Cj4gPiA+IHRoZSBhbGdvcml0aG0gdGhhdCBwYXJzZSB0aGUgYW5zd2Vy
IGludG8gYSBzZXBhcmF0ZSBmdW5jdGlvbi4KPiA+IAo+ID4gSSBob3BlIHlvdSBtZWFudCB0byB3
cml0ZSAiTm8gZnVuY3Rpb25hbCBjaGFuZ2UuIgo+IAo+IEl0IHdhcyBzdXBwb3NlZCB0byBiZSB0
aGF0IHdheSwgYnV0IHBhcnQgb2YgdGhlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaAo+IHNob3VsZCBi
ZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2guIEl0IGFsc28gZml4IHRoZSBwcmV2aW91cyBwYXRjaCB3
aGljaAo+IHdvbid0IHdvcmsgb24gaXQncyBvd24uCj4gCj4gSSB0aGluayBJJ20gZ29pbmcgdG8g
c3F1YXNoIGJvdGggcGF0Y2ggdG9nZXRoZXIgYW5kIGxlYXZlIGEgbm90ZSBpbiB0aGUKPiBjb21t
aXQgZGVzY3JpcHRpb24gYXMgdG8gd2h5IHRoZSBmdW5jdGlvbiBxbXBfcGFyc2VfcXVlcnlfY3B1
cyBleGlzdCwKPiB0aGF0IGlzOgo+ICAgICBsaWJ4bDogVXNlIGV2X3FtcCBpbiBsaWJ4bF9zZXRf
dmNwdW9ubGluZQo+ICAgICBsaWJ4bDogRXh0cmFjdCBxbXBfcGFyc2VfcXVlcnlfY3B1cwoKT0sK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
