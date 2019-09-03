Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28887A6DD4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 18:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5BS8-0001rO-SJ; Tue, 03 Sep 2019 16:14:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5BS7-0001rH-Tj
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 16:14:43 +0000
X-Inumbo-ID: f00e0e6a-ce65-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f00e0e6a-ce65-11e9-b299-bc764e2007e4;
 Tue, 03 Sep 2019 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567527283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YS8KlF9FkGms/zL4mp6PZyXe0FqkybE8K+gxPiQIHFc=;
 b=Hny8PXAiMau7j2aZ7KQ35R2dB7OePy7OEaynMU9LYUFBM4s2QEt8Xt8m
 vGiGV8E2XvbJHbTGx8HgGUuVo8v6Dk+UTAs86w1DhR68kJsUhMf/sriUT
 SC9OsomMpp4l1kUjfsDzuZMdD3OOZyJEx4RHImyGHt0F3SYoZ0MQfMko7 M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZUc2B59rq7c5UPaD1jyYG+gW313oRZd88vPEYL7vNs8SqziiUxFRkgL5iXBOXDYONeaXt5fOjU
 DqqZOQ/Pgjz9ChSO2Qb81cusP9yTW03+5g6lqbb9Kyd9oTKiJd7DvfO93+wWPORRQ7GPNVqFDV
 wo82s7D71nOmYmZBHudtCSGHhKpqgDN5WkQALIa6sc2tORMju5DpiGPMeIM3DWpAxaOvLh2Rpd
 HZ+va6IfidzBdKG8RCEloJ9YVfjccXSHxSObJd9gY690YmsPfiSqd3ymZ3VcHEaCkIisODZpVH
 zbs=
X-SBRS: 2.7
X-MesageID: 5339034
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5339034"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 18:14:19 +0200
Message-ID: <20190903161428.7159-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903161428.7159-1-roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 02/11] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG8gbm90IGZvcndhcmQgYWNjZXNzZXMgdG8gY2Y4IHRvIGV4dGVybmFsIGVtdWxhdG9ycywgZGVj
b2Rpbmcgb2YgUENJCmFjY2Vzc2VzIGlzIGhhbmRsZWQgYnkgWGVuLCBhbmQgZW11bGF0b3JzIGNh
biByZXF1ZXN0IGhhbmRsaW5nIG9mCmNvbmZpZyBzcGFjZSBhY2Nlc3NlcyBvZiBkZXZpY2VzIHVz
aW5nIHRoZSBwcm92aWRlZCBpb3JlcSBpbnRlcmZhY2UuCgpGdWxseSB0ZXJtaW5hdGUgY2Y4IGFj
Y2Vzc2VzIGF0IHRoZSBoeXBlcnZpc29yIGxldmVsLCBieSBpbXByb3ZpbmcgdGhlCmV4aXN0aW5n
IGh2bV9hY2Nlc3NfY2Y4IGhlbHBlciB0byBhbHNvIGhhbmRsZSByZWdpc3RlciByZWFkcywgYW5k
CmFsd2F5cyByZXR1cm4gWDg2RU1VTF9PS0FZIGluIG9yZGVyIHRvIHRlcm1pbmF0ZSB0aGUgZW11
bGF0aW9uLgoKQWxzbyByZXR1cm4gYW4gZXJyb3IgdG8gaW9yZXEgc2VydmVycyBhdHRlbXB0aW5n
IHRvIG1hcCBQQ0kgSU8gcG9ydHMKKDB4Y2Y4LWNmYyksIGFzIHRob3NlIGFyZSBoYW5kbGVkIGJ5
IFhlbi4KCk5vdGUgdGhhdCB3aXRob3V0IHRoaXMgY2hhbmdlIGluIHRoZSBhYnNlbmNlIG9mIHNv
bWUgZXh0ZXJuYWwgZW11bGF0b3IKdGhhdCBjYXRjaGVzIGFjY2Vzc2VzIHRvIGNmOCByZWFkIHJl
cXVlc3RzIHRvIHRoZSByZWdpc3RlciB3b3VsZAptaXNiZWhhdmUsIGFzIHRoZSBpb3JlcSBpbnRl
cm5hbCBoYW5kbGVyIGRpZCBub3QgaGFuZGxlIHRob3NlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYxOgog
LSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyB8IDE2
ICsrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyBiL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwppbmRleCA2OTJiNzEwYjAyLi42OTY1MmUxMDgwIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9pb3Jl
cS5jCkBAIC0xMDE1LDYgKzEwMTUsMTIgQEAgaW50IGh2bV9tYXBfaW9fcmFuZ2VfdG9faW9yZXFf
c2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsCiAgICAgc3dpdGNoICggdHlw
ZSApCiAgICAgewogICAgIGNhc2UgWEVOX0RNT1BfSU9fUkFOR0VfUE9SVDoKKyAgICAgICAgcmMg
PSAtRUlOVkFMOworICAgICAgICAvKiBQQ0kgY29uZmlnIHNwYWNlIGFjY2Vzc2VzIGFyZSBoYW5k
bGVkIGludGVybmFsbHkuICovCisgICAgICAgIGlmICggc3RhcnQgPD0gMHhjZjggKyA4ICYmIDB4
Y2Y4IDw9IGVuZCApCisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgZWxzZQorICAgICAg
ICAgICAgLyogZmFsbHRocm91Z2guICovCiAgICAgY2FzZSBYRU5fRE1PUF9JT19SQU5HRV9NRU1P
Ulk6CiAgICAgY2FzZSBYRU5fRE1PUF9JT19SQU5HRV9QQ0k6CiAgICAgICAgIHIgPSBzLT5yYW5n
ZVt0eXBlXTsKQEAgLTE1MTgsMTEgKzE1MjQsMTUgQEAgc3RhdGljIGludCBodm1fYWNjZXNzX2Nm
OCgKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWluOwogCi0gICAgaWYg
KCBkaXIgPT0gSU9SRVFfV1JJVEUgJiYgYnl0ZXMgPT0gNCApCisgICAgaWYgKCBieXRlcyAhPSA0
ICkKKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKKworICAgIGlmICggZGlyID09IElPUkVR
X1dSSVRFICkKICAgICAgICAgZC0+YXJjaC5odm0ucGNpX2NmOCA9ICp2YWw7CisgICAgZWxzZQor
ICAgICAgICAqdmFsID0gZC0+YXJjaC5odm0ucGNpX2NmODsKIAotICAgIC8qIFdlIGFsd2F5cyBu
ZWVkIHRvIGZhbGwgdGhyb3VnaCB0byB0aGUgY2F0Y2ggYWxsIGVtdWxhdG9yICovCi0gICAgcmV0
dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOworICAgIHJldHVybiBYODZFTVVMX09LQVk7CiB9CiAK
IHZvaWQgaHZtX2lvcmVxX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKLS0gCjIuMjIuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
