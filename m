Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6DF53D4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:53:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9Kx-0007ol-2G; Fri, 08 Nov 2019 18:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9Kv-0007oH-73
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:21 +0000
X-Inumbo-ID: 96d13940-0258-11ea-a1d6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96d13940-0258-11ea-a1d6-12813bfff9fa;
 Fri, 08 Nov 2019 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239010;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lhcJETRdi1rM8smi7Nw2iUUCUb3Lrn0Zcbvro9ujIvU=;
 b=I8uRLEyS8vsVPGL+9lq7MCEwIy7uFzYvLBP4CK7LqZyetEalsowPpDkr
 q2tfBwoh9v0mWMPsud7j+jluT/ZiNqAbiekr7cjQfMjbOsi8WwEznxvgN
 dKt/loQd36cF6ScQpWnYWoUJrJrwH8hFFrlPg6TDcQuGUioX99hyjD4vJ o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6BNduIG8m3fAOIYSTiA7OZMuaOukECMg6CckMlPQVHxGYGGikiheMltuEVDc8lq65cNmcWbmb8
 1/NPMRTBbb10/xVwtgGt+bj3UWmmWpwZ+S1/pxYRcbamKxDv04olscuygncIQxnuNa5oCKAXmp
 qRj1U3SKYuOPajNxdyEtfKtBFZm1A0cFi345F4yZhJbmB6NnJ1t8dB5X1Whtvs1FTzCJm/RWY0
 Xu/BZ1gr3f4BunNMJupOwHNU3Hu5rZ86VNuXOEh4kZJJam65uUVI8evcB/XW+RRXngiSuQaORc
 xhs=
X-SBRS: 2.7
X-MesageID: 8429291
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,283,1569297600"; 
   d="scan'208";a="8429291"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:48 +0000
Message-ID: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host history
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFybGllciB0aGlzIHdlZWsgd2UgZGlzY292ZXJlZCB0aGF0IHNnLXJlcG9ydC1ob3N0LWhpc3Rv
cnkgd2FzIHJ1bm5pbmcKZXh0cmVtZWx5IHNsb3dseS4gIFdlIGFwcGxpZWQgYW4gZW1lcmdlbmN5
IGZpeCAwZmE3MmIxM2Y1YWYKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBSZWR1Y2UgbGltaXQg
ZnJvbSAyMDAwIHRvIDIwMAoKVGhlIG1haW4gcHJvYmxlbSBpcyB0aGF0IHNnLXJlcG9ydC1ob3N0
LWhpc3RvcnkgcnVucyBvbmNlIGZvciBlYWNoCmZsaWdodCwgYW5kIG11c3QgZ2VuZXJhdGUgYSBy
ZWxldmFudCBoaXN0b3J5IHZpZXcgb2YgdGhlIHJlY2VudApoaXN0b3J5IGZvciBlYWNoIGhvc3Qg
LSBpbmNsdWRpbmcgbXVjaCBoaXN0b3J5IHRoYXQgaXMgYWxyZWFkeSBpbiB0aGUKb2xkIHZlcnNp
b24gb2YgdGhlIGh0bWwgZmlsZS4KClRoZSBzbG93IHBhcnQgaXMgYXNraW5nIHRoZSBkYXRhYmFz
ZSBhYm91dCBpbmZvcm1hdGlvbiBhYm91dCBlYWNoIGpvYiwKaW5jbHVkaW5nIGl0cyBmaW5hbCBz
dGVwLCBhbGxvY2F0aW9uIHN0ZXAsIGV0Yy4gIChUaGUgbWFpbiBxdWVyeSB3aGljaApkaWdzIG91
dCByZWxldmFudCBqb2JzIGlzIGFsc28gcmF0aGVyIHRpbWUgY29uc3VtaW5nIGl0IHJ1bnMgYWxs
IGluCm9uZSBnbyBhbmQgdGFrZXMgb25seSBhIG1pbnV0ZSBvciB0d28uKQoKSW4gdGhpcyBzZXJp
ZXMgd2UgaW50cm9kdWNlIGEgbWVjaGFuaXNtIHdoaWNoIGNhY2hlcyBtdWNoIG9mIHRoZQpoaXN0
b3JpY2FsIGFuYWx5c2lzLgoKSXQgaXMgbm90IHN0cmFpZ2h0Zm9yd2FyZCB0byByZXVzZSBvbGQg
aHRtbCBkYXRhIGFzLWlzIGJlY2F1c2Ugd2UKd291bGQgaGF2ZSB0byBkbyBhIG1lcmdlIHNvcnQg
d2l0aCB0aGUgbmV3IGRhdGEgYW5kIHRoYXQgd291bGQgaW52b2x2ZQpyZXdyaXRpbmcgdGhlIGFs
dGVybmF0aW5nIGJhY2tncm91bmQgY29sb3VyICghKQoKU28gaW5zdGVhZCwgd2Ugc3R1ZmYgdGhl
IGluZm9ybWF0aW9uIHdlIGdvdCBmcm9tIHRoZSBkYXRhYmFzZSBpbnRvCmNvbW1lbnRzIGluIHRo
ZSBIVE1MLCB3aGljaCB3ZSBjYW4gdGhlbiBzY2FuIG9uIGZ1dHVyZSBydW5zLgoKVGhlIG92ZXJh
bGwgcmVzdWx0IGlzIGEgZmFjdG9yIG9mIDEwIHNwZWVkdXAgaW4gbXkgdGVzdHMsIGZvciB0aGUK
b3JpZ2luYWwgaGlzdG9yeSBsaW1pdCBvZiAyMDAwLiAgVGhhdCBpcyBub3cgZmFzdCBlbm91Z2gg
d2UgY2FuIHB1dAppdCBiYWNrLgoKKEkgd2FzIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgZXhj
ZXB0aW9uYWwgY2FzZSBJIHNhdyBlYXJsaWVyIGluIHRoZQp3ZWVrLCB3aGVyZSBpdCB3YXMgYXBw
YXJlbnRseSB0YWtpbmcgaG91cnMuICBJIHN1c3BlY3QgdGhhdCB0aGVyZQpjb21lcyBhIHRpcHBp
bmcgcG9pbnQgd2hlcmUgZGIgdHJhbnNhY3Rpb25zIGVuZCB1cCBiZWluZyByZXN0YXJ0ZWQuKQoK
VGhlIHBhdGNoZXMgYXJlIGJyb2tlbiBkb3duIGludG8gc21hbGwgcGllY2VzIHNvIHRoYXQgSSBj
b3VsZCB0aGluawphYm91dCB0aGVtIGNsZWFybHkgYW5kIGRvIHNlbGYtcmV2aWV3LgoKSWFuIEph
Y2tzb24gKDEzKToKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBJbXByb3ZlIGRlYnVnZ2luZyBv
dXRwdXQKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBOZXcgLS1uby1pbnN0YWxsIG9wdGlvbiBm
b3IgdGVzdGluZwogIHNnLXJlcG9ydC1ob3N0LWhpc3Rvcnk6IE1vdmUgYGNvbXB1dGVmbGlnaHRz
cmFuZ2UnIGFmdGVyIGhvc3RzCiAgc2ctcmVwb3J0LWhvc3QtaGlzdG9yeTogQWN0dWFsbHkgaG9u
b3VyICRtaW5mbGlnaHQKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBHZXQgam9iIHN0YXR1cyBm
cm9tIG1haW5xdWVyeQogIHNnLXJlcG9ydC1ob3N0LWhpc3Rvcnk6IEFkZCAkY2FjaGVrZXkgYXJn
dW1lbnQgdG8gam9icXVlcnkKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBTdG9yZSBwZXItam9i
IHF1ZXJ5IHJlc3VsdHMgaW4gJSRqcgogIHNnLXJlcG9ydC1ob3N0LWhpc3Rvcnk6IFdyaXRlIGNh
Y2hlIGVudHJpZXMKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBXcml0ZSBjYWNoZSBlbnRyaWVz
IGZvciB0YWlsLCB0b28KICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBSZWFkIGNhY2hlIGVudHJp
ZXMKICBzZy1yZXBvcnQtaG9zdC1oaXN0b3J5OiBNb3ZlIGpvYiBydW52YXJzIHF1ZXJ5IGxhdGVy
CiAgc2ctcmVwb3J0LWhvc3QtaGlzdG9yeTogQ2FjaGUgcnVudmFyIHF1ZXJpZXMgKHBvd2VyIGlu
Zm9ybWF0aW9uKQogIFJldmVydCAic2ctcmVwb3J0LWhvc3QtaGlzdG9yeTogUmVkdWNlIGxpbWl0
IGZyb20gMjAwMCB0byAyMDAiCgogc2ctcmVwb3J0LWhvc3QtaGlzdG9yeSB8IDE4OSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTYwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
