Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9A12452B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:57:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWxs-0006Hz-IB; Wed, 18 Dec 2019 10:54:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6xej=2I=amazon.de=prvs=24874a09b=vrd@srs-us1.protection.inumbo.net>)
 id 1ihWxq-0006Hu-EC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:53:58 +0000
X-Inumbo-ID: b13321d6-2184-11ea-9058-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b13321d6-2184-11ea-9058-12813bfff9fa;
 Wed, 18 Dec 2019 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576666438; x=1608202438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6zc8O12Jp7l0QY1iZGfmSgSmleNUDq9WTG4Oaq5lriY=;
 b=CI69wnW7ie/5GzMHuxElHQNjs+3AcmRYPDByUD7l4IluBxn/vVKdVJF3
 QEs3+jZMUjRL8KELhVw2iVEC3dcT3+vyLbabq020eqZ3+6Wivzy9HgpBE
 tccCjWphPpsgvJ3yVh2z8N7ciQOtzvphFJwuH/zKwMlV14XjpOCmr8hia 4=;
IronPort-SDR: bqPLBvWVVOJxsCjIM1XBgahAgfYxhp+WQoJM0Xsj+5FWCKBMFAzphTCtUTwebq2rpARQtrOLMN
 7zCVvWgblO5g==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="9017212"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 18 Dec 2019 10:53:56 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2E1BAA210A; Wed, 18 Dec 2019 10:53:56 +0000 (UTC)
Received: from EX13D22EUA003.ant.amazon.com (10.43.165.210) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 10:53:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D22EUA003.ant.amazon.com (10.43.165.210) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 10:53:54 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.33) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 18 Dec 2019 10:53:52 +0000
From: Varad Gautam <vrd@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 11:53:37 +0100
Message-ID: <1576666417-20989-1-git-send-email-vrd@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562165173-31383-1-git-send-email-vrd@amazon.de>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WEVOX0RPTUNUTF9kZXN0cm95ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWlu
X2tpbGwgLUVSRVNUQVJUUy4KSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVj
ZWl2ZSBtdWx0aXBsZSBfcGlycV9ndWVzdF91bmJpbmQKY2FsbHMgZm9yIHRoZSBzYW1lIHBpcnEg
ZnJvbSBkb21haW5fa2lsbCwgaWYgdGhlIHBpcnEgaGFzIG5vdCB5ZXQgYmVlbgpyZW1vdmVkIGZy
b20gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgYXM6CiAgZG9tYWluX2tpbGwoKQogICAgLT4gZG9t
YWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkKICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNlcygp
CiAgICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKICAgICAgICAgIC0+IHBpcnFfZ3Vlc3Rf
dW5iaW5kKCkKICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpCgpGb3IgYSBzaGFy
ZWQgcGlycSAobnJfZ3Vlc3RzID4gMSksIHRoZSBmaXJzdCBjYWxsIHdvdWxkIHphcCB0aGUgY3Vy
cmVudApkb21haW4gZnJvbSB0aGUgcGlycSdzIGd1ZXN0c1tdIGxpc3QsIGJ1dCB0aGUgYWN0aW9u
IGhhbmRsZXIgaXMgbmV2ZXIgZnJlZWQKYXMgdGhlcmUgYXJlIG90aGVyIGd1ZXN0cyB1c2luZyB0
aGlzIHBpcnEuIEFzIGEgcmVzdWx0LCBvbiB0aGUgc2Vjb25kIGNhbGwsCl9fcGlycV9ndWVzdF91
bmJpbmQgc2VhcmNoZXMgZm9yIHRoZSBjdXJyZW50IGRvbWFpbiB3aGljaCBoYXMgYmVlbiByZW1v
dmVkCmZyb20gdGhlIGd1ZXN0c1tdIGxpc3QsIGFuZCBoaXRzIGEgQlVHX09OLgoKTWFrZSBfX3Bp
cnFfZ3Vlc3RfdW5iaW5kIHNhZmUgdG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRp
bmcgeGVuCmNvbnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJvdW5k
IGZyb20gdGhpcyBndWVzdC4gVGhlClBJUlEgd2lsbCBiZSBjbGVhbmVkIHVwIGZyb20gdGhlIGRv
bWFpbidzIHBpcnFfdHJlZSBkdXJpbmcgdGhlIGRlc3RydWN0aW9uCmluIGNvbXBsZXRlX2RvbWFp
bl9kZXN0cm95IGFueXdheXMuCgpTaWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6
b24uZGU+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cgp2MjogU3BsaXQgdGhlIGNoZWNrIG9uIGFjdGlvbi0+bnJfZ3Vl
c3RzID4gMCBhbmQgbWFrZSBpdCBhbiBBU1NFUlQsIHJld29yZC4KLS0tCiB4ZW4vYXJjaC94ODYv
aXJxLmMgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94ZW4vYXJj
aC94ODYvaXJxLmMKaW5kZXggNWQwZDk0Yy4uM2ViN2IyMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAtMTg2Myw3ICsxODYzLDE2IEBA
IHN0YXRpYyBpcnFfZ3Vlc3RfYWN0aW9uX3QgKl9fcGlycV9ndWVzdF91bmJpbmQoCiAKICAgICBm
b3IgKCBpID0gMDsgKGkgPCBhY3Rpb24tPm5yX2d1ZXN0cykgJiYgKGFjdGlvbi0+Z3Vlc3RbaV0g
IT0gZCk7IGkrKyApCiAgICAgICAgIGNvbnRpbnVlOwotICAgIEJVR19PTihpID09IGFjdGlvbi0+
bnJfZ3Vlc3RzKTsKKyAgICBpZiAoIGkgPT0gYWN0aW9uLT5ucl9ndWVzdHMgKSB7CisgICAgICAg
IEFTU0VSVChhY3Rpb24tPm5yX2d1ZXN0cyA+IDApIDsKKyAgICAgICAgLyogSW4gY2FzZSB0aGUg
cGlycSB3YXMgc2hhcmVkLCB1bmJvdW5kIGZvciB0aGlzIGRvbWFpbiBpbiBhbiBlYXJsaWVyIGNh
bGwsIGJ1dCBzdGlsbAorICAgICAgICAgKiBleGlzdGVkIG9uIHRoZSBkb21haW4ncyBwaXJxX3Ry
ZWUsIHdlIHN0aWxsIHJlYWNoIGhlcmUgaWYgdGhlcmUgYXJlIGFueSBsYXRlcgorICAgICAgICAg
KiB1bmJpbmQgY2FsbHMgb24gdGhlIHNhbWUgcGlycS4gUmV0dXJuIGlmIHN1Y2ggYW4gdW5iaW5k
IGhhcHBlbnMuICovCisgICAgICAgIGlmICggYWN0aW9uLT5zaGFyZWFibGUgKQorICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7CisgICAgICAgIEJVRygpOworICAgIH0KKwogICAgIG1lbW1vdmUoJmFj
dGlvbi0+Z3Vlc3RbaV0sICZhY3Rpb24tPmd1ZXN0W2krMV0sCiAgICAgICAgICAgICAoYWN0aW9u
LT5ucl9ndWVzdHMtaS0xKSAqIHNpemVvZihhY3Rpb24tPmd1ZXN0WzBdKSk7CiAgICAgYWN0aW9u
LT5ucl9ndWVzdHMtLTsKLS0gCjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdl
cm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5n
OiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVz
dC1JRDogREUgMjg5IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
