Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FB181F43
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 18:23:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC52W-00034K-6W; Wed, 11 Mar 2020 17:21:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC52V-000347-5J
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:21:03 +0000
X-Inumbo-ID: ae9228f8-63bc-11ea-b027-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae9228f8-63bc-11ea-b027-12813bfff9fa;
 Wed, 11 Mar 2020 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583947262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sLtREZEZlLC3yG0EYRrHTKiKUb68+Sp17JtPH4fHjhs=;
 b=efZDZSGdfQwcY3Ew3k8JyDqb2+7g8hUjQ5kKTZetap/qEpWQJFAU342l
 BCe/VfddpdYKya5m3CSRChKhaEu9kFng8a3pVUwKgcjjE1TsllKwBWm0k
 KPoqoCinMVyFYEcxv6n/lHhIs8imwj9zH3EK1Rb1F3eMeTiIcDatlIdgL o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I92wLXCwNnoqMOytSPOjtlw119r2p1RCy2ebfdZZguufx49Td7XxkzaCRVy+M3D9KZPBOT5G0E
 7p0NmWTs5Th+0HEv3XbXwrRkjK1rAVOm2+cPVg4//Tc36PUqSUGX1a0nQkMbOaJ4DqR+i0WgAW
 hxqGwuw6LVA4jEUI9YCE4loXoHU3HzajkQo3chTsaTZyvDf8l51nY6OdOe1kMi7ssf/NYK2IBC
 EIebBMtwqxYjcQdYtoiTBj4Tg5khOEFcejNhYfvCzA82EldJViIiUCXIJCXZACm5/IPPshWIQv
 sa0=
X-SBRS: 2.7
X-MesageID: 14418296
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14418296"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 18:20:08 +0100
Message-ID: <20200311172010.7777-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200311172010.7777-1-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH OSSTEST v5 4/5] examine: detect IOMMU
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
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjQ6CiAtIFNw
bGl0IG91dCBjb2RlIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4KCkNoYW5nZXMgc2luY2UgdjM6CiAt
IEZhaWwgaWYgYHhsIGluZm9gIGNvbW1hbmQgZmFpbHMuCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBB
bGxvdyBmbGFncyB0byBiZSByZW1vdmVkLgogLSBGaXggc2V0X2ZsYWcgYWRkaXRpb24gdG8gSG9z
dEJEL1N0YXRpYy5wbS4KLS0tCiBzZy1ydW4tam9iICAgICAgIHwgIDEgKwogdHMtZXhhbWluZS1p
b21tdSB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSB0cy1leGFtaW5lLWlvbW11
CgpkaWZmIC0tZ2l0IGEvc2ctcnVuLWpvYiBiL3NnLXJ1bi1qb2IKaW5kZXggN2M1OGQ0YmEuLmY2
YmZkZmQ1IDEwMDc1NQotLS0gYS9zZy1ydW4tam9iCisrKyBiL3NnLXJ1bi1qb2IKQEAgLTY3OSw2
ICs2NzksNyBAQCBwcm9jIGV4YW1pbmUtaG9zdC1leGFtaW5lIHtpbnN0YWxsfSB7CiAgICAgaWYg
eyRva30gewogCXJ1bi10cyAtLiAgPSAgICAgICAgICAgdHMtZXhhbWluZS1zZXJpYWwtcG9zdCAr
IGhvc3QKIAlydW4tdHMgLiAgID0gICAgICAgICAgIHRzLWV4YW1pbmUtbG9ncy1zYXZlICAgKyBo
b3N0CisJcnVuLXRzIC4gICA9ICAgICAgICAgICB0cy1leGFtaW5lLWlvbW11ICAgICAgICsgaG9z
dAogCXJ1bi10cyAuICAgPSAgICAgICAgICAgdHMtZXhhbWluZS1ob3N0cHJvcHMtc2F2ZQogICAg
IH0KIH0KZGlmZiAtLWdpdCBhL3RzLWV4YW1pbmUtaW9tbXUgYi90cy1leGFtaW5lLWlvbW11Cm5l
dyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwLi4wOTlkNGJlNQotLS0gL2Rldi9udWxs
CisrKyBiL3RzLWV4YW1pbmUtaW9tbXUKQEAgLTAsMCArMSwzMiBAQAorIyEvdXNyL2Jpbi9wZXJs
IC13CisjIFRoaXMgaXMgcGFydCBvZiAib3NzdGVzdCIsIGFuIGF1dG9tYXRlZCB0ZXN0aW5nIGZy
YW1ld29yayBmb3IgWGVuLgorIyBDb3B5cmlnaHQgKEMpIDIwMDktMjAyMCBDaXRyaXggSW5jLgor
IworIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQorIyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBBZmZlcm8g
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyMgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbiwgZWl0aGVyIHZlcnNpb24gMyBvZiB0aGUgTGljZW5zZSwgb3IKKyMgKGF0
IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyMKKyMgVGhpcyBwcm9ncmFtIGlzIGRp
c3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisjIGJ1dCBXSVRI
T1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisj
IE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNl
ZSB0aGUKKyMgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCisjCisjIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBBZmZl
cm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElm
IG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKwordXNlIHN0cmljdCBx
dyh2YXJzKTsKK0JFR0lOIHsgdW5zaGlmdCBASU5DLCBxdyguKTsgfQordXNlIE9zc3Rlc3Q7Cit1
c2UgT3NzdGVzdDo6VGVzdFN1cHBvcnQ7CisKK3RzcmVhZGNvbmZpZygpOworCitvdXIgKCR3aGhv
c3QpID0gQEFSR1Y7Ciskd2hob3N0IHx8PSAnaG9zdCc7CitvdXIgJGhvPSBzZWxlY3Rob3N0KCR3
aGhvc3QpOworb3VyICRpbmZvID0gdGFyZ2V0X2NtZF9vdXRwdXRfcm9vdCgkaG8sICd4bCBpbmZv
JywgMTApOworb3VyICRoYXNfaW9tbXUgPSAkaW5mbyA9fiAvZGlyZWN0aW8vOworCitsb2dtKCIk
aG8tPntJZGVudH0gaW9tbXU6ICRoYXNfaW9tbXUiKTsKK2hvc3RmbGFnX3B1dGF0aXZlX3JlY29y
ZCgkaG8sICJpb21tdSIsICRoYXNfaW9tbXUpOwotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
