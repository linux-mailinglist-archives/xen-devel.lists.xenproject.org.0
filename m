Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7618337D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:43:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCP1p-0000Bu-JT; Thu, 12 Mar 2020 14:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCP1n-0000Bp-WC
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:41:40 +0000
X-Inumbo-ID: 921d6abc-646f-11ea-92cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 921d6abc-646f-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584024095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=klfl3cokGS3pagRDw3G2B5RSYxAQycY3/PX0sjJVv8Y=;
 b=ZLKzWMKGG08iIvmNPWOUX0wGFJ4TTUMtxw7e/lQMgtddMyKCtsQ98XAC
 76+l9PsDx7OCWOtqRUSEnDgILrNlYvF6EBbFR7+npN3imJMshMGOul0ue
 pji4bRsXNycwgxyaWpQLYDxM1W5pWswjqY8PvQ4UF1FJK2r+yP516oiIp k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VKV4agR6MQohz/yTYfKmBNVpgeAOuiUU6eEKUdHXrIsYsihfXplTtKInI1fZHfQhLIRFvNJYsE
 xzw6ycdwUI6UnD5M1npnHmJZ9JoWnAzefJwwVHsnp8/SQBliVOY4FQzdWeTchtMlrjQMi9DIM5
 pF6lzvM4JmCfrrrIrrn2UsS9x01h1E+eY5lQX5haY9Nhr+7mg4FnbU2kmDEjG5xspp/jtCp+3M
 mQOTYV8LuNnJ5UHRvjreXe1DUW7QtZnbr1xChrzgaA8ngAaQM2Ce83c8HYvDfNsw2DkSFFb0Rg
 JKI=
X-SBRS: 2.7
X-MesageID: 14031874
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14031874"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Mar 2020 15:40:56 +0100
Message-ID: <20200312144056.10902-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311172010.7777-4-roger.pau@citrix.com>
References: <20200311172010.7777-4-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v6 4/5] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEgbmV3IHRlc3QgdG8gY2hlY2sgZm9yIGlvbW11IGF2YWlsYWJpbGl0eSBhbmQg
YWRkIGl0IGFzIGEKaG9zdGZsYWcgaWYgZm91bmQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjU6CiAtIFVz
ZSBhIG1vcmUgcmVzdHJpY3RpdmUgcmVnZXguCiAtIFBsYWNlIGlvbW11IHRlc3QgYmVmb3JlIGxv
ZyBjb2xsZWN0aW9uLgoKQ2hhbmdlcyBzaW5jZSB2NDoKIC0gU3BsaXQgb3V0IGNvZGUgaW50byBz
ZXBhcmF0ZSBwYXRjaGVzLgoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gRmFpbCBpZiBgeGwgaW5mb2Ag
Y29tbWFuZCBmYWlscy4KCkNoYW5nZXMgc2luY2UgdjI6CiAtIEFsbG93IGZsYWdzIHRvIGJlIHJl
bW92ZWQuCiAtIEZpeCBzZXRfZmxhZyBhZGRpdGlvbiB0byBIb3N0QkQvU3RhdGljLnBtLgotLS0K
IHNnLXJ1bi1qb2IgICAgICAgfCAgMSArCiB0cy1leGFtaW5lLWlvbW11IHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNzU1IHRzLWV4YW1pbmUtaW9tbXUKCmRpZmYgLS1naXQgYS9zZy1y
dW4tam9iIGIvc2ctcnVuLWpvYgppbmRleCA3YzU4ZDRiYS4uOTcwMTE4NDMgMTAwNzU1Ci0tLSBh
L3NnLXJ1bi1qb2IKKysrIGIvc2ctcnVuLWpvYgpAQCAtNjc4LDYgKzY3OCw3IEBAIHByb2MgZXhh
bWluZS1ob3N0LWV4YW1pbmUge2luc3RhbGx9IHsKICAgICBydW4tdHMgIWJyb2tlbiBjYXB0dXJl
LWxvZ3MgdHMtbG9ncy1jYXB0dXJlICAgICAgICsgaG9zdAogICAgIGlmIHskb2t9IHsKIAlydW4t
dHMgLS4gID0gICAgICAgICAgIHRzLWV4YW1pbmUtc2VyaWFsLXBvc3QgKyBob3N0CisJcnVuLXRz
IC4gICA9ICAgICAgICAgICB0cy1leGFtaW5lLWlvbW11ICAgICAgICsgaG9zdAogCXJ1bi10cyAu
ICAgPSAgICAgICAgICAgdHMtZXhhbWluZS1sb2dzLXNhdmUgICArIGhvc3QKIAlydW4tdHMgLiAg
ID0gICAgICAgICAgIHRzLWV4YW1pbmUtaG9zdHByb3BzLXNhdmUKICAgICB9CmRpZmYgLS1naXQg
YS90cy1leGFtaW5lLWlvbW11IGIvdHMtZXhhbWluZS1pb21tdQpuZXcgZmlsZSBtb2RlIDEwMDc1
NQppbmRleCAwMDAwMDAwMC4uM2MyOGQ0NmEKLS0tIC9kZXYvbnVsbAorKysgYi90cy1leGFtaW5l
LWlvbW11CkBAIC0wLDAgKzEsMzIgQEAKKyMhL3Vzci9iaW4vcGVybCAtdworIyBUaGlzIGlzIHBh
cnQgb2YgIm9zc3Rlc3QiLCBhbiBhdXRvbWF0ZWQgdGVzdGluZyBmcmFtZXdvcmsgZm9yIFhlbi4K
KyMgQ29weXJpZ2h0IChDKSAyMDA5LTIwMjAgQ2l0cml4IEluYy4KKyMKKyMgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU6IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
KyMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgQWZmZXJvIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisjIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIGVp
dGhlciB2ZXJzaW9uIDMgb2YgdGhlIExpY2Vuc2UsIG9yCisjIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCisjCisjIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUg
aG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7
IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorIyBNRVJDSEFOVEFCSUxJVFkg
b3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisjIEdOVSBBZmZl
cm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIworIyBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgQWZmZXJvIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UKKyMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDov
L3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisKK3VzZSBzdHJpY3QgcXcodmFycyk7CitCRUdJTiB7
IHVuc2hpZnQgQElOQywgcXcoLik7IH0KK3VzZSBPc3N0ZXN0OwordXNlIE9zc3Rlc3Q6OlRlc3RT
dXBwb3J0OworCit0c3JlYWRjb25maWcoKTsKKworb3VyICgkd2hob3N0KSA9IEBBUkdWOworJHdo
aG9zdCB8fD0gJ2hvc3QnOworb3VyICRobz0gc2VsZWN0aG9zdCgkd2hob3N0KTsKK291ciAkaW5m
byA9IHRhcmdldF9jbWRfb3V0cHV0X3Jvb3QoJGhvLCAneGwgaW5mbycsIDEwKTsKK291ciAkaGFz
X2lvbW11ID0gJGluZm8gPX4gL152aXJ0X2NhcHNccyo6Lipccyhodm18cHYpX2RpcmVjdGlvXHMu
Ki9tOworCitsb2dtKCIkaG8tPntJZGVudH0gaW9tbXU6ICRoYXNfaW9tbXUiKTsKK2hvc3RmbGFn
X3B1dGF0aXZlX3JlY29yZCgkaG8sICJpb21tdSIsICRoYXNfaW9tbXUpOwotLSAKMi4yNS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
