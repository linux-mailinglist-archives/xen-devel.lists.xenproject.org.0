Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F7FB1D7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:55:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUt5c-0003JD-59; Wed, 13 Nov 2019 13:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3r5a=ZF=amazon.com=prvs=213cc4842=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iUt5Z-0003J4-Vf
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:53:42 +0000
X-Inumbo-ID: ffd2ad3a-061c-11ea-9631-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffd2ad3a-061c-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573653221; x=1605189221;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=x0qPvmJJKKo+lzfFRKT3yAkLsUMr2Z/MZkklkH7oilY=;
 b=m/zioUjvHJCeyr4M8jHeSV8woKgMT53d9e7kueaw2M1cGB+tWumT0V6p
 b2MQAclTI4zxQ5JgBbzcp1SDiQZm/LG7avFhldGtAuqunkwQxupHVUEpX
 l+Pu0iz0Bt2I+V2uvcI6Dgfoiir4ZpTLsgbGs5FsREcYQ9v8HMd1+rowP E=;
IronPort-SDR: Gkrc2Lu72X1ILHEEWuSgHwOwqrlCEc6+w/bZxcgRCCQ3QMNG9WL4yvwh+6KEB+mbnZdlepJsvz
 XA9AycOK99cA==
X-IronPort-AV: E=Sophos;i="5.68,300,1569283200"; 
   d="scan'208";a="6894412"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Nov 2019 13:53:38 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id E4569A1D3D; Wed, 13 Nov 2019 13:53:37 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 13:53:37 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 13:53:36 +0000
Received: from CBG-5CG9341D0C.cbg10.amazon.com (10.55.227.12) by
 mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 13 Nov 2019 13:53:34 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 13:53:30 +0000
Message-ID: <20191113135330.1209-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4ud2hlbiB0aGVpciB2YWx1ZXMgYXJlIGxhcmdlciB0aGFuIHRoZSBwZXItZG9tYWluIGNvbmZp
Z3VyZWQgbGltaXRzLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgoKQWZ0ZXIgbWluaW5nIHRocm91Z2ggY29tbWl0cyBpdCBpcyBzdGlsbCB1bmNsZWFyIHRvIG1l
IGV4YWN0bHkgd2hlbiBYZW4Kc3RvcHBlZCBob25vdXJpbmcgdGhlIGdsb2JhbCB2YWx1ZXMsIGJ1
dCBJIHJlYWxseSB0aGluayB0aGlzIGNvbW1pdCBzaG91bGQKYmUgYmFjay1wb3J0ZWQgdG8gc3Rh
YmxlIHRyZWVzIGFzIGl0IHdhcyBhIGJlaGF2aW91cmFsIGNoYW5nZSB0aGF0IGNhbgpjYXVzZSBk
b21VcyB0byBmYWlsIGluIG5vbi1vYnZpb3VzIHdheXMuCi0tLQogeGVuL2NvbW1vbi9kb21haW4u
YyB8IDE0ICsrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2Nv
bW1vbi9kb21haW4uYwppbmRleCA2MTExMTZjN2ZjLi5hYWQ2ZDU1YjgyIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTMzNSw2ICsz
MzUsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsCiAgICAg
ZW51bSB7IElOSVRfd2F0Y2hkb2cgPSAxdTw8MSwKICAgICAgICAgICAgSU5JVF9ldnRjaG4gPSAx
dTw8MywgSU5JVF9nbnR0YWIgPSAxdTw8NCwgSU5JVF9hcmNoID0gMXU8PDUgfTsKICAgICBpbnQg
ZXJyLCBpbml0X3N0YXR1cyA9IDA7CisgICAgdW5zaWduZWQgaW50IG1heF9ncmFudF9mcmFtZXMs
IG1heF9tYXB0cmFja19mcmFtZXM7CiAKICAgICBpZiAoIGNvbmZpZyAmJiAoZXJyID0gc2FuaXRp
c2VfZG9tYWluX2NvbmZpZyhjb25maWcpKSApCiAgICAgICAgIHJldHVybiBFUlJfUFRSKGVycik7
CkBAIC00NTYsOCArNDU3LDE3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9taWRf
dCBkb21pZCwKICAgICAgICAgICAgIGdvdG8gZmFpbDsKICAgICAgICAgaW5pdF9zdGF0dXMgfD0g
SU5JVF9ldnRjaG47CiAKLSAgICAgICAgaWYgKCAoZXJyID0gZ3JhbnRfdGFibGVfaW5pdChkLCBj
b25maWctPm1heF9ncmFudF9mcmFtZXMsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uZmlnLT5tYXhfbWFwdHJhY2tfZnJhbWVzKSkgIT0gMCApCisgICAgICAgIC8qCisg
ICAgICAgICAqIE1ha2Ugc3VyZSB0aGF0IHRoZSBjb25maWd1cmVkIHZhbHVlcyBkb24ndCByZWR1
Y2UgYW55CisgICAgICAgICAqIGdsb2JhbCBjb21tYW5kIGxpbmUgb3ZlcnJpZGUuCisgICAgICAg
ICAqLworICAgICAgICBtYXhfZ3JhbnRfZnJhbWVzID0gbWF4KGNvbmZpZy0+bWF4X2dyYW50X2Zy
YW1lcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRfbWF4X2dyYW50X2ZyYW1l
cyk7CisgICAgICAgIG1heF9tYXB0cmFja19mcmFtZXMgPSBtYXgoY29uZmlnLT5tYXhfbWFwdHJh
Y2tfZnJhbWVzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdF9tYXhfbWFw
dHJhY2tfZnJhbWVzKTsKKworICAgICAgICBpZiAoIChlcnIgPSBncmFudF90YWJsZV9pbml0KGQs
IG1heF9ncmFudF9mcmFtZXMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWF4X21hcHRyYWNrX2ZyYW1lcykpICE9IDAgKQogICAgICAgICAgICAgZ290byBmYWlsOwogICAg
ICAgICBpbml0X3N0YXR1cyB8PSBJTklUX2dudHRhYjsKIAotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
