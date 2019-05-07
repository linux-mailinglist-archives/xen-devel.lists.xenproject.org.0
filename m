Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EE15F86
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 10:38:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNvZy-0001bR-3T; Tue, 07 May 2019 08:36:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFk4=TH=amazon.com=prvs=023fb95da=elnikety@srs-us1.protection.inumbo.net>)
 id 1hNvZw-0001bM-J5
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 08:36:00 +0000
X-Inumbo-ID: 23614ea7-70a3-11e9-843c-bc764e045a96
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23614ea7-70a3-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557218158; x=1588754158;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=V4oQO1rYLCzopBg8PkoCWbGNGruFZvNsh+x3FmCOxic=;
 b=LfW0iHoUB+piFYjOKSsKHN/a+NCZ4zG2Zch/KSMRseWBxt6KwXCHomb5
 gWSg4+2FlnygW40SOQzCYdIyXcQdZDKS+CHGv9Eftp65044G2FYnubxIn
 H1Eb1FP2ZmZLVn6zuTNuWzlnVfF+wB+HSfYurwH/57EdflLdqp7A9zmtX 8=;
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="732063832"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 08:35:57 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x478ZqD1033885
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 May 2019 08:35:56 GMT
Received: from EX13D03EUA004.ant.amazon.com (10.43.165.93) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 08:35:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D03EUA004.ant.amazon.com (10.43.165.93) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 08:35:55 +0000
Received: from dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (10.15.5.186)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 May 2019 08:35:54 +0000
Received: by dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 15B79463C8; Tue,  7 May 2019 08:35:54 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 May 2019 08:35:48 +0000
Message-ID: <20190507083548.27883-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] libxl: make vkbd tunable for HVM guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2JhY2tlbmQgcGFp
ciAoYy9zIGViYmQyNTYxYjRjKS4KVGhpcyBjb25zdW1lcyBob3N0IHJlc291cmNlcyB1bm5lY2Vz
c2FyaWx5IGZvciBndWVzdHMgdGhhdCBoYXZlIG5vIHVzZSBmb3IKdmtiZC4gTWFrZSB0aGlzIGJl
aGF2aW91ciB0dW5hYmxlIHRvIGFsbG93IGFuIGFkbWluaXN0cmF0b3IgdG8gY2hvb3NlLiBUaGUK
Y29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhWTSBndWVzdHMgc3RpbGwg
Z2V0IHZrZGIgdW5sZXNzCnNwZWNpZmllZCBvdGhlcndpc2UuCgpTaWduZWQtb2ZmLWJ5OiBFc2xh
bSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYyAgfCA5ICsrKysrKy0tLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgMSAr
CiB0b29scy94bC94bF9zeHAuYyAgICAgICAgICAgfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDg5ZmU4MGZj
OWMuLmIwOTI0NDA1OGYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0zMTAsNiArMzEwLDcgQEAgaW50IGxp
YnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAg
IGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS52cHRfYWxpZ24sICAgICAg
ICAgIHRydWUpOwogICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5o
dm0uYWx0cDJtLCAgICAgICAgICAgICBmYWxzZSk7CiAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0
ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS51c2IsICAgICAgICAgICAgICAgIGZhbHNlKTsKKyAgICAg
ICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnZrYl9kZXZpY2UsICAg
ICAgICAgdHJ1ZSk7CiAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51
Lmh2bS54ZW5fcGxhdGZvcm1fcGNpLCAgIHRydWUpOwogCiAgICAgICAgIGxpYnhsX2RlZmJvb2xf
c2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS5zcGljZS5lbmFibGUsIGZhbHNlKTsKQEAgLTE0MTYs
OSArMTQxNywxMSBAQCBzdGF0aWMgdm9pZCBkb21jcmVhdGVfbGF1bmNoX2RtKGxpYnhsX19lZ2Mg
KmVnYywgbGlieGxfX211bHRpZGV2ICptdWx0aWRldiwKICAgICAgICAgbGlieGxfX2RldmljZV9j
b25zb2xlX2FkZChnYywgZG9taWQsICZjb25zb2xlLCBzdGF0ZSwgJmRldmljZSk7CiAgICAgICAg
IGxpYnhsX19kZXZpY2VfY29uc29sZV9kaXNwb3NlKCZjb25zb2xlKTsKIAotICAgICAgICBsaWJ4
bF9kZXZpY2VfdmtiX2luaXQoJnZrYik7Ci0gICAgICAgIGxpYnhsX19kZXZpY2VfYWRkKGdjLCBk
b21pZCwgJmxpYnhsX192a2JfZGV2dHlwZSwgJnZrYik7Ci0gICAgICAgIGxpYnhsX2RldmljZV92
a2JfZGlzcG9zZSgmdmtiKTsKKyAgICAgICAgaWYgKCBsaWJ4bF9kZWZib29sX3ZhbChkX2NvbmZp
Zy0+Yl9pbmZvLnUuaHZtLnZrYl9kZXZpY2UpICkgeworICAgICAgICAgICAgbGlieGxfZGV2aWNl
X3ZrYl9pbml0KCZ2a2IpOworICAgICAgICAgICAgbGlieGxfX2RldmljZV9hZGQoZ2MsIGRvbWlk
LCAmbGlieGxfX3ZrYl9kZXZ0eXBlLCAmdmtiKTsKKyAgICAgICAgICAgIGxpYnhsX2RldmljZV92
a2JfZGlzcG9zZSgmdmtiKTsKKyAgICAgICAgfQogCiAgICAgICAgIGRjcy0+c2Rzcy5kbS5ndWVz
dF9kb21pZCA9IGRvbWlkOwogICAgICAgICBpZiAobGlieGxfZGVmYm9vbF92YWwoZF9jb25maWct
PmJfaW5mby5kZXZpY2VfbW9kZWxfc3R1YmRvbWFpbikpCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF90eXBlcy5pZGwgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKaW5kZXggYjY4
NWFjNDdhYy4uOWEwYjkyZjFkNCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMu
aWRsCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbApAQCAtNTgzLDYgKzU4Myw3IEBA
IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvID0gU3RydWN0KCJkb21haW5fYnVpbGRfaW5mbyIsWwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyAtICJ0YWJsZXQiIGZvciBh
YnNvbHV0ZSBtb3VzZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMg
LSAibW91c2UiIGZvciBQUy8yIHByb3RvY29sIHJlbGF0aXZlIG1vdXNlCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAoInVzYmRldmljZSIsICAgICAgICBzdHJpbmcpLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCJ2a2JfZGV2aWNlIiwgICAg
ICAgbGlieGxfZGVmYm9vbCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoInNvdW5kaHciLCAgICAgICAgICBzdHJpbmcpLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKCJ4ZW5fcGxhdGZvcm1fcGNpIiwgbGlieGxfZGVmYm9vbCksCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoInVzYmRldmljZV9saXN0IiwgICBs
aWJ4bF9zdHJpbmdfbGlzdCksCmRpZmYgLS1naXQgYS90b29scy94bC94bF9zeHAuYyBiL3Rvb2xz
L3hsL3hsX3N4cC5jCmluZGV4IDNlNjExN2QwY2QuLjM1OWEwMDE1NzAgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3hsL3hsX3N4cC5jCisrKyBiL3Rvb2xzL3hsL3hsX3N4cC5jCkBAIC0xMzgsNiArMTM4LDgg
QEAgdm9pZCBwcmludGZfaW5mb19zZXhwKGludCBkb21pZCwgbGlieGxfZG9tYWluX2NvbmZpZyAq
ZF9jb25maWcsIEZJTEUgKmZoKQogICAgICAgICBmcHJpbnRmKGZoLCAiXHRcdFx0KGJvb3QgJXMp
XG4iLCBiX2luZm8tPnUuaHZtLmJvb3QpOwogICAgICAgICBmcHJpbnRmKGZoLCAiXHRcdFx0KHVz
YiAlcylcbiIsIGxpYnhsX2RlZmJvb2xfdG9fc3RyaW5nKGJfaW5mby0+dS5odm0udXNiKSk7CiAg
ICAgICAgIGZwcmludGYoZmgsICJcdFx0XHQodXNiZGV2aWNlICVzKVxuIiwgYl9pbmZvLT51Lmh2
bS51c2JkZXZpY2UpOworICAgICAgICBmcHJpbnRmKGZoLCAiXHRcdFx0KHZrYl9kZXZpY2UgJXMp
XG4iLAorICAgICAgICAgICAgICAgbGlieGxfZGVmYm9vbF90b19zdHJpbmcoYl9pbmZvLT51Lmh2
bS52a2JfZGV2aWNlKSk7CiAgICAgICAgIGZwcmludGYoZmgsICJcdFx0KVxuIik7CiAgICAgICAg
IGJyZWFrOwogICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFY6Ci0tIAoyLjE1LjMuQU1aTgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
