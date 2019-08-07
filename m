Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03628501A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:40:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvO0d-0007Fm-T7; Wed, 07 Aug 2019 15:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AVeY=WD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hvO0c-0007Fh-Fj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:37:50 +0000
X-Inumbo-ID: 4e2b3880-b929-11e9-aafd-af0fa7877b97
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e2b3880-b929-11e9-aafd-af0fa7877b97;
 Wed, 07 Aug 2019 15:37:47 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GKrhj3TlY8ehHpSf4UzpB9CYFytSiWYRpaKG6MtQLTEO+DOWd2XnaI4G46ollU3pXvl9mw8JWR
 7NFyEd+eC0LyXhPzf+7gsLmigt9DPKS8SBqZnr0fns0aoObwsuUyLoqcYAMQI48T4GWjfTOeoP
 umKrCIWRrVF5KfAGrxd8TMhV/fzNfBYY78FbqtGxtqFH7h9vhfL0XGCX+bSJoGKiEESxmVKh2P
 t1x0qEPCbFtEZmw0HDxWIxdMA0dYBNh2gCML1ceqMYlXAXxkC6E2DzdJM5+2Iyun/R2PRhYgIM
 gcs=
X-SBRS: 2.7
X-MesageID: 3995589
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="3995589"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23882.61481.990906.474113@mariner.uk.xensource.com>
Date: Wed, 7 Aug 2019 16:37:13 +0100
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5aa0116479240e5c2751fbaa745a6071a98f9480.camel@infradead.org>
References: <936c39728ca0c96d0666551046cf08ebc8774dd8.camel@infradead.org>
 <5aa0116479240e5c2751fbaa745a6071a98f9480.camel@infradead.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH v2] tools/xenstore: Do not abort xenstore-ls if
 a node disappears while iterating
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KEFkZGluZyBKdWVyZ2VuLikKCkhpLCB0aGFua3MgZm9yIHRoZSByZXNlbmQuCgpEYXZpZCBXb29k
aG91c2Ugd3JpdGVzICgiW1BBVENIIHYyXSB0b29scy94ZW5zdG9yZTogRG8gbm90IGFib3J0IHhl
bnN0b3JlLWxzIGlmIGEgbm9kZSBkaXNhcHBlYXJzIHdoaWxlIGl0ZXJhdGluZyIpOgo+IEZyb206
IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gV2hlbiByZWN1cnNpbmcs
IGEgbm9kZSBzb21ldGltZXMgZGlzYXBwZWFycy4gRGVhbCB3aXRoIGl0IGFuZCBtb3ZlIG9uCj4g
aW5zdGVhZCBvZiBhYm9ydGluZyBhbmQgZmFpbGluZyB0byBwcmludCB0aGUgcmVzdCBvZiB3aGF0
IHdhcwo+IHJlcXVlc3RlZC4KPiAKPiBFaXRoZXIgRUFDQ0VTIG9yIEVOT0VOVCBtYXkgb2NjdXIg
YXMgdGhlIHJlc3VsdCBvZiByYWNlIGNvbmRpdGlvbnMgd2l0aAo+IHVwZGF0ZXM7IGFueSBvdGhl
ciBlcnJvciBzaG91bGQgYWJvcnQgYXMgYmVmb3JlLgoKSSB0aGluayBpdCBpcyBub3Qgc2FmZSB0
byBjb250aW51ZSBpZiB3ZSBnZXQgYSBwZXJtaXNzaW9ucyBlcnJvci4gIEkKdGhpbmsgdGhhdCB3
b3VsZCBtZWFuICJ3ZSB3ZXJlIG5vdCBhYmxlIHRvIGRldGVybWluZSB3aGV0aGVyIHRoaXMgbm9k
ZQpleGlzdHMiLCBub3QgInRoaXMgbm9kZSBkb2VzIG5vdCBleGlzdCIuCgpTbyB3aXRoIGEgcGVy
bWlzc2lvbnMgZXJyb3Igc2lsZW50bHkgaWdub3JlZCwgeGVuc3RvcmUtbHMgbWlnaHQKc2lsZW50
bHkgcHJvZHVjZSBwYXJ0aWFsIG91dHB1dC4KCkkgcmVyZWFkIHRoZSBkaXNjdXNzaW9uIGFuZCBJ
J20gYWZyYWlkIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkKcGVvcGxlIHRob3VnaHQgdGhh
dCBpZ25vcmluZyBzdWNoIGVycm9ycyB3b3VsZCBiZSBPSy4gIFRoZSBmYWN0IChpZgp0cnVlKSB0
aGF0IGEgc3B1cmlvdXMgcGVybWlzc2lvbnMgZXJyb3IgbWlnaHQgcmVzdWx0IGZyb20gYSByYWNl
IGlzCm5vdCBzdWZmaWNpZW50IHRvIGp1c3RpZnkgaWdub3JpbmcgcGVybWlzc2lvbnMgZXJyb3Jz
LgoKV2hhdCBpcyBuZWVkZWQgaXMgdG8gc2hvdyB0aGF0IGFsbCBwZXJtaXNzaW9ucyBlcnJvcnMg
YXJlIGZpbmUgdG8KaWdub3JlLiAgQW5kIGl0IGlzIG9idmlvdXMgdGhhdCB0aGVyZSBhcmUgcGVy
bWlzc2lvbnMgZXJyb3JzIHRoYXQgYXJlCipub3QqIGZpbmUgdG8gaWdub3JlLCBzbyB0aGUgcHJv
cG9zaXRpb24gaXMgZmFsc2U7IGFuZCBwZXJtaXNzaW9ucwplcnJvcnMgbXVzdCBjYXVzZSBjb21w
bGFpbnQgYW5kIGEgbm9uemVybyBleGl0IHN0YXR1cy4KCkdpdmVuIHRoYXQgdGhlIGNvZGUgZG9l
c24ndCBoYXZlIGEgd2F5IHRvIHByaW50IGFuIGVycm9yIG1lc3NhZ2UgYW5kCnJlY29yZCB0aGUg
ZXJyb3IgY29kZSBvciBleGl0IHN0YXR1cyBmb3IgbGF0ZXIsIEkgdGhpbmsgdGhlIGJlc3QKYXBw
cm9hY2ggaXMgcHJvYmFibHkgZXhhY3RseSBEYXZpZCdzIHBhdGNoIG9ubHkgd2l0aG91dCB0aGUg
bWVudGlvbiBvZgpFQUNDRVMuCgpTb3JyeSB0byBjb21lIHRvIHRoaXMgc28gbGF0ZS4KCgpPbiBJ
UkMsIERhdmlkIHN1Z2dlc3RlZCB0aGlzIHBhdGNoIGZvciBiYWNrcG9ydGluZy4gIFN1YmplY3Qg
dG8KcmVzb2x1dGlvbiBvZiBteSBjb21tZW50cyBhYm92ZSwgdGhhdCBzZWVtcyBsaWtlIGEgZ29v
ZCBpZGVhIHRvIG1lLgooSG93ZXZlciwgdGhpcyBjb21lcyByYXRoZXIgdG9vIGxhdGUgZm9yIDQu
MTIuMS4pCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
