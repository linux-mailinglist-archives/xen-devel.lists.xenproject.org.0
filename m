Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D788143EDA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:03:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itu4e-0000Ll-KV; Tue, 21 Jan 2020 14:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cram=3K=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itu4d-0000Jo-NM
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 14:00:07 +0000
X-Inumbo-ID: 51da8afc-3c56-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51da8afc-3c56-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579615202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtpMBqUjXBTNLQWEki1dXGxzADeRYoZdTCRuseAfv5M=;
 b=ZXqiqpu5SA3EVVdwZ0xndneVSReEYv6DUlPGOUAuQd7MkTmZuIIvoNro
 SEwqweFQHKLKMx7O2hejq65tJH4mX5T+8MyWKZzQshPIXI9eyqZUBof9N
 Dr/52esA0BmOBzgjXEdduPRK0GgVvZOb7hJIJ/PmQLi6Mu9VSace59fgD c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aVtWtStx+qP04iNIVTxFBVcA8lCw/u8yFObJMIqJCzsPzjDgy6udw3hn8IR9trw9magpuOTBhD
 umTU0DxigKFvnfxQP6qwVnagEVWDAzxDIxSwdQiuUA0KY/4WKg4MsZhWD0cm4FpuRjVTUPzAWf
 UmMWR+JOX3Zcc++U5nkgRE3xkisIzChdjfWDhjZB0ZrSP4/WrEitu8WnANRbppKZ5Q9/f5GffU
 4e4b6QF6D60ssdzvV9Kpoo40LYU6221aSMyW7xFJ3AI2RuoMOAdjuVyqZU9Qcos50Bftywlvkv
 ki0=
X-SBRS: 2.7
X-MesageID: 11799417
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11799417"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 13:59:15 +0000
Message-ID: <20200121135916.1140483-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2.1 14/12] squash! xen/build: introduce
 ccflags-y and CFLAGS_$@
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LURYRU5fQlVJTERfRUZJIGFuZCAtREJVSUxEX0lEX0VGSSBzZWVtcyB0byBvbmx5IGJlIHVzZWQg
aW4geGVuLmxkcy5TCndoaWNoIGlzIGJ1aWxkIHVzaW5nIHRoZSBBRkxBR1MsIHNvIGFkZCB0aG9z
ZSBmbGFncyBvbmx5IHRvIGFzZmxhZ3MteS4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KVGhhdCBmaXggYnVpbGQgb2YgeGVuLmVm
aS4KClNob3VsZCBhZGQgYXNmbGFncy15IGludG8gdGhlIHBhdGNoIHRpdGxlLgotLS0KIHhlbi9S
dWxlcy5tayAgICAgICAgICB8IDQgKysrLQogeGVuL2FyY2gveDg2L01ha2VmaWxlIHwgNCArKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggNDA1MWQ2MGFkZGI1Li5h
ZGQ3Y2FkOTNlNGUgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsK
QEAgLTM5LDYgKzM5LDcgQEAgQUxMX09CSlMtJChDT05GSUdfQ1JZUFRPKSAgICs9ICQoQkFTRURJ
UikvY3J5cHRvL2J1aWx0X2luLm8KIAogIyBJbml0aWFsaXNlIHNvbWUgdmFyaWFibGVzCiBjY2Zs
YWdzLXkgOj0KK2FzZmxhZ3MteSA6PQogIyBBbGxvdyBhcmNoIHNwZWNpZmljIGNmbGFncywgdG8g
YmUgY2FsY3VsYXRlZCBmb3IgZWFjaCBvYmplY3RzLgogYXJjaF9jY2ZsYWdzID0KIApAQCAtMTAx
LDcgKzEwMiw4IEBAIGNfZmxhZ3MgPSAtTU1EIC1NRiAkKEBEKS8uJChARikuZCBcCiAgICAgICAg
ICAgJChjY2ZsYWdzLXkpICQoQ0ZMQUdTXyQodGFyZ2V0LXN0ZW0pLm8pCiAKIGFfZmxhZ3MgPSAt
TU1EIC1NRiAkKEBEKS8uJChARikuZCBcCi0gICAgICAgICAgJChYRU5fQUZMQUdTKQorICAgICAg
ICAgICQoWEVOX0FGTEFHUykgXAorICAgICAgICAgICQoYXNmbGFncy15KQogCiBidWlsdF9pbi5v
OiAkKG9iai15KSAkKGV4dHJhLXkpCiBpZmVxICgkKG9iai15KSwpCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKaW5kZXggMTkxZTIxNzMz
MTVhLi4xZTAxM2VlMzExMzEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQorKysg
Yi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAgLTE3NCwxNCArMTc0LDE0IEBAIEVGSV9MREZMQUdT
ICs9IC0tbWFqb3Itc3Vic3lzdGVtLXZlcnNpb249MiAtLW1pbm9yLXN1YnN5c3RlbS12ZXJzaW9u
PTAKIGV4cG9ydCBYRU5fQlVJTERfRUZJIDo9ICQoc2hlbGwgJChDQykgJChmaWx0ZXItb3V0ICQo
Q0ZMQUdTLXkpIC4lLmQsJChDRkxBR1MpKSAtYyBlZmkvY2hlY2suYyAtbyBlZmkvY2hlY2subyAy
Pi9kZXYvbnVsbCAmJiBlY2hvIHkpCiAjIENoZWNrIGlmIHRoZSBsaW5rZXIgc3VwcG9ydHMgUEUu
CiBYRU5fQlVJTERfUEUgOj0gJChpZiAkKFhFTl9CVUlMRF9FRkkpLCQoc2hlbGwgJChMRCkgLW1p
Mzg2cGVwIC0tc3Vic3lzdGVtPTEwIC1vIGVmaS9jaGVjay5lZmkgZWZpL2NoZWNrLm8gMj4vZGV2
L251bGwgJiYgZWNobyB5KSkKLWNjZmxhZ3MtJChYRU5fQlVJTERfRUZJKSArPSAtRFhFTl9CVUlM
RF9FRkkKK2FzZmxhZ3MtJChYRU5fQlVJTERfRUZJKSArPSAtRFhFTl9CVUlMRF9FRkkKIAogJChU
QVJHRVQpLmVmaTogVklSVF9CQVNFID0gMHgkKHNoZWxsICQoTk0pIGVmaS9yZWxvY3MtZHVtbXku
byB8IHNlZCAtbiAncywgQSBWSVJUX1NUQVJUJCQsLHAnKQogJChUQVJHRVQpLmVmaTogQUxUX0JB
U0UgPSAweCQoc2hlbGwgJChOTSkgZWZpL3JlbG9jcy1kdW1teS5vIHwgc2VkIC1uICdzLCBBIEFM
VF9TVEFSVCQkLCxwJykKIAogaWZuZXEgKCQoYnVpbGRfaWRfbGlua2VyKSwpCiBpZmVxICgkKGNh
bGwgbGQtdmVyLWJ1aWxkLWlkLCQoTEQpICQoZmlsdGVyIC1tJSwkKEVGSV9MREZMQUdTKSkpLHkp
Ci1jY2ZsYWdzLXkgKz0gLURCVUlMRF9JRF9FRkkKK2FzZmxhZ3MteSArPSAtREJVSUxEX0lEX0VG
SQogRUZJX0xERkxBR1MgKz0gJChidWlsZF9pZF9saW5rZXIpCiBub3RlX2ZpbGUgOj0gZWZpL2J1
aWxkaWQubwogIyBOQjogdGhpcyBtdXN0IGJlIHRoZSBsYXN0IGlucHV0IGluIHRoZSBsaW5rZXIg
Y2FsbCwgYmVjYXVzZSBpbnB1dHMgZm9sbG93aW5nCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
