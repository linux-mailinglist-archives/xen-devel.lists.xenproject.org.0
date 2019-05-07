Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159BE16538
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO0XT-000874-AS; Tue, 07 May 2019 13:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFk4=TH=amazon.com=prvs=023fb95da=elnikety@srs-us1.protection.inumbo.net>)
 id 1hO0XR-00086y-Uh
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:53:45 +0000
X-Inumbo-ID: 8354c690-70cf-11e9-80c6-ab741627a37c
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8354c690-70cf-11e9-80c6-ab741627a37c;
 Tue, 07 May 2019 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557237218; x=1588773218;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=9XzVmwmU4ascT+jYvF6xzK897xYq8gwXyd8KcynMD5I=;
 b=CgSTqHftCShXnL6PspU3IbGYPc7pn9xlfeMy/gloQfrpdvjSl/TEIuLV
 5Pv4GfFwAQjvE75ILCY9awKdka0fVOv3n4wS6WaeJwguof3GRDNMHIlkq
 gWe+kObf4F0Nt4gkGkPjqxmBbn+QO0qM30MG/f9NDGOz+tQJtvxkaZteb k=;
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="673056707"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 13:53:34 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x47DrTup027908
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 May 2019 13:53:33 GMT
Received: from EX13D18EUC002.ant.amazon.com (10.43.164.50) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 13:53:32 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D18EUC002.ant.amazon.com (10.43.164.50) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 13:53:30 +0000
Received: from dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (10.15.5.186)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Tue, 7 May 2019 13:53:29 +0000
Received: by dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id CAC22463E2; Tue,  7 May 2019 13:53:28 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 May 2019 13:53:20 +0000
Message-ID: <20190507135320.103953-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] libxl: make vkbd tunable for HVM guests
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
bSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoK
ICAgICAgICAtIEFkZGVkIGEgbWlzc2luZyBodW5rIC8gc2V0dGluZyB2a2JfZGV2aWNlIHBlciBj
b25maWcKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgfCA5ICsrKysrKy0tLQogdG9v
bHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgMSArCiB0b29scy94bC94bF9wYXJzZS5jICAgICAg
ICAgfCAxICsKIHRvb2xzL3hsL3hsX3N4cC5jICAgICAgICAgICB8IDIgKysKIDQgZmlsZXMgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4
IDg5ZmU4MGZjOWMuLjAzY2UxNjZmNGYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Ny
ZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0zMTAsNiArMzEwLDcg
QEAgaW50IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2Ms
CiAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS52cHRfYWxp
Z24sICAgICAgICAgIHRydWUpOwogICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJf
aW5mby0+dS5odm0uYWx0cDJtLCAgICAgICAgICAgICBmYWxzZSk7CiAgICAgICAgIGxpYnhsX2Rl
ZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS51c2IsICAgICAgICAgICAgICAgIGZhbHNl
KTsKKyAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnZrYl9k
ZXZpY2UsICAgICAgICAgdHJ1ZSk7CiAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgm
Yl9pbmZvLT51Lmh2bS54ZW5fcGxhdGZvcm1fcGNpLCAgIHRydWUpOwogCiAgICAgICAgIGxpYnhs
X2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS5zcGljZS5lbmFibGUsIGZhbHNlKTsK
QEAgLTE0MTYsOSArMTQxNywxMSBAQCBzdGF0aWMgdm9pZCBkb21jcmVhdGVfbGF1bmNoX2RtKGxp
YnhsX19lZ2MgKmVnYywgbGlieGxfX211bHRpZGV2ICptdWx0aWRldiwKICAgICAgICAgbGlieGxf
X2RldmljZV9jb25zb2xlX2FkZChnYywgZG9taWQsICZjb25zb2xlLCBzdGF0ZSwgJmRldmljZSk7
CiAgICAgICAgIGxpYnhsX19kZXZpY2VfY29uc29sZV9kaXNwb3NlKCZjb25zb2xlKTsKIAotICAg
ICAgICBsaWJ4bF9kZXZpY2VfdmtiX2luaXQoJnZrYik7Ci0gICAgICAgIGxpYnhsX19kZXZpY2Vf
YWRkKGdjLCBkb21pZCwgJmxpYnhsX192a2JfZGV2dHlwZSwgJnZrYik7Ci0gICAgICAgIGxpYnhs
X2RldmljZV92a2JfZGlzcG9zZSgmdmtiKTsKKyAgICAgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFs
KGRfY29uZmlnLT5iX2luZm8udS5odm0udmtiX2RldmljZSkpIHsKKyAgICAgICAgICAgIGxpYnhs
X2RldmljZV92a2JfaW5pdCgmdmtiKTsKKyAgICAgICAgICAgIGxpYnhsX19kZXZpY2VfYWRkKGdj
LCBkb21pZCwgJmxpYnhsX192a2JfZGV2dHlwZSwgJnZrYik7CisgICAgICAgICAgICBsaWJ4bF9k
ZXZpY2VfdmtiX2Rpc3Bvc2UoJnZrYik7CisgICAgICAgIH0KIAogICAgICAgICBkY3MtPnNkc3Mu
ZG0uZ3Vlc3RfZG9taWQgPSBkb21pZDsKICAgICAgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGRf
Y29uZmlnLT5iX2luZm8uZGV2aWNlX21vZGVsX3N0dWJkb21haW4pKQpkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCmlu
ZGV4IGI2ODVhYzQ3YWMuLjlhMGI5MmYxZDQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X3R5cGVzLmlkbAorKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKQEAgLTU4Myw2ICs1
ODMsNyBAQCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyA9IFN0cnVjdCgiZG9tYWluX2J1aWxkX2lu
Zm8iLFsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgLSAidGFibGV0
IiBmb3IgYWJzb2x1dGUgbW91c2UsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAjIC0gIm1vdXNlIiBmb3IgUFMvMiBwcm90b2NvbCByZWxhdGl2ZSBtb3VzZQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCJ1c2JkZXZpY2UiLCAgICAgICAgc3Ry
aW5nKSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgidmtiX2Rldmlj
ZSIsICAgICAgIGxpYnhsX2RlZmJvb2wpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKCJzb3VuZGh3IiwgICAgICAgICAgc3RyaW5nKSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICgieGVuX3BsYXRmb3JtX3BjaSIsIGxpYnhsX2RlZmJvb2wp
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCJ1c2JkZXZpY2VfbGlz
dCIsICAgbGlieGxfc3RyaW5nX2xpc3QpLApkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2Uu
YyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKaW5kZXggMzUyY2QyMTRkZC4uZTEwNWJkYTJiYiAxMDA2
NDQKLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYworKysgYi90b29scy94bC94bF9wYXJzZS5jCkBA
IC0yNjUyLDYgKzI2NTIsNyBAQCBza2lwX3VzYmRldjoKICAgICAgICAgICAgIGZwcmludGYoc3Rk
ZXJyLCJ4bDogVW5hYmxlIHRvIHBhcnNlIHVzYmRldmljZS5cbiIpOwogICAgICAgICAgICAgZXhp
dCgtRVJST1JfRkFJTCk7CiAgICAgICAgIH0KKyAgICAgICAgeGx1X2NmZ19nZXRfZGVmYm9vbChj
b25maWcsICJ2a2JfZGV2aWNlIiwgJmJfaW5mby0+dS5odm0udmtiX2RldmljZSwgMCk7CiAgICAg
ICAgIHhsdV9jZmdfcmVwbGFjZV9zdHJpbmcgKGNvbmZpZywgInNvdW5kaHciLCAmYl9pbmZvLT51
Lmh2bS5zb3VuZGh3LCAwKTsKICAgICAgICAgeGx1X2NmZ19nZXRfZGVmYm9vbChjb25maWcsICJ4
ZW5fcGxhdGZvcm1fcGNpIiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYl9pbmZvLT51
Lmh2bS54ZW5fcGxhdGZvcm1fcGNpLCAwKTsKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3N4cC5j
IGIvdG9vbHMveGwveGxfc3hwLmMKaW5kZXggM2U2MTE3ZDBjZC4uMzU5YTAwMTU3MCAxMDA2NDQK
LS0tIGEvdG9vbHMveGwveGxfc3hwLmMKKysrIGIvdG9vbHMveGwveGxfc3hwLmMKQEAgLTEzOCw2
ICsxMzgsOCBAQCB2b2lkIHByaW50Zl9pbmZvX3NleHAoaW50IGRvbWlkLCBsaWJ4bF9kb21haW5f
Y29uZmlnICpkX2NvbmZpZywgRklMRSAqZmgpCiAgICAgICAgIGZwcmludGYoZmgsICJcdFx0XHQo
Ym9vdCAlcylcbiIsIGJfaW5mby0+dS5odm0uYm9vdCk7CiAgICAgICAgIGZwcmludGYoZmgsICJc
dFx0XHQodXNiICVzKVxuIiwgbGlieGxfZGVmYm9vbF90b19zdHJpbmcoYl9pbmZvLT51Lmh2bS51
c2IpKTsKICAgICAgICAgZnByaW50ZihmaCwgIlx0XHRcdCh1c2JkZXZpY2UgJXMpXG4iLCBiX2lu
Zm8tPnUuaHZtLnVzYmRldmljZSk7CisgICAgICAgIGZwcmludGYoZmgsICJcdFx0XHQodmtiX2Rl
dmljZSAlcylcbiIsCisgICAgICAgICAgICAgICBsaWJ4bF9kZWZib29sX3RvX3N0cmluZyhiX2lu
Zm8tPnUuaHZtLnZrYl9kZXZpY2UpKTsKICAgICAgICAgZnByaW50ZihmaCwgIlx0XHQpXG4iKTsK
ICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBMSUJYTF9ET01BSU5fVFlQRV9QVjoKLS0gCjIuMTUu
My5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
