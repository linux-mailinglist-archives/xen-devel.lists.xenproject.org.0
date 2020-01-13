Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81218139739
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 18:12:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir3DA-0008Lm-Fx; Mon, 13 Jan 2020 17:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aHII=3C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ir3D8-0008KF-Fy
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 17:09:06 +0000
X-Inumbo-ID: 5e394bf6-3627-11ea-b89f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e394bf6-3627-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578935330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=aG8+e2m6AN5IfUjMx9VppTrvS/t/KQQmarqMBDQ8J/I=;
 b=WPxjf8ces8Lfll/puWv15JQXCth2OSog53gdwPYwr7mrn5W6G/XZHtzB
 N89UGI5KxzYW74M5LPvoFFrmCoUCLGFT+akqCEckCa0HNQWrrLqSCaQ72
 iuEdg9Em+ukQm+eHEB/0f5JoOB9IGMWuaRpzk4FwoSYkBU2J4e/d5NdZn c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NAXvxowJCLE4BgHLZfFansqy/MKxKqgjMZQPOmPUAHzEtf6PWaLQcMELnZL7w4RqaLeFrZNE5U
 0rA2KGgPbXYAQy/r1g6jTI7FAMA7D3S58Tq8XexOjZmQhG+yOumdl8xpYBF4XPaRYU3KB6zFwk
 zWTionT8vccyGbFB4fCwiaJeg7NxVe8DWf+Zlp5fGx0IDPmGXAUe5NZY91m5PxnuBDsFnrSHFJ
 atwGftcRzREa/8OLoYzmi0J13VYNFZ2t8+m5+llbT17vrlyeunEyX1tNZpPcFTitFMj3qTyKwJ
 RW8=
X-SBRS: 2.7
X-MesageID: 10859014
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,429,1571716800"; d="scan'208";a="10859014"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 13 Jan 2020 17:08:36 +0000
Message-ID: <20200113170843.21332-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 03/10] libxl: event: Introduce
 CTX_UNLOCK_EGC_FREE
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHZlcnkgY29tbW9uIGV4aXQgcGF0dGVybi4gIFdlIGFyZSBnb2luZyB0byB3YW50
IHRvIGNoYW5nZQp0aGlzIHBhdHRlcm4uICBTbyB3ZSBzaG91bGQgbWFrZSBpdCBpbnRvIGEgbWFj
cm8gb2YgaXRzIG93bi4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGli
eGxfZXZlbnQuYyAgICB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxf
Zm9yay5jICAgICB8ICA2ICsrLS0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAy
ICsrCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMgYi90b29scy9saWJ4bC9saWJ4
bF9ldmVudC5jCmluZGV4IDViMTJhNDVlNzAuLmJlMzdlMTJiYjAgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2V2ZW50LmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuYwpAQCAt
MTE1Miw4ICsxMTUyLDcgQEAgaW50IGxpYnhsX29zZXZlbnRfYmVmb3JlcG9sbChsaWJ4bF9jdHgg
KmN0eCwgaW50ICpuZmRzX2lvLAogICAgIENUWF9MT0NLOwogICAgIGludCByYyA9IGJlZm9yZXBv
bGxfaW50ZXJuYWwoZ2MsIGN0eC0+cG9sbGVyX2FwcCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG5mZHNfaW8sIGZkcywgdGltZW91dF91cGQsIG5vdyk7Ci0gICAgQ1RYX1VOTE9D
SzsKLSAgICBFR0NfRlJFRTsKKyAgICBDVFhfVU5MT0NLX0VHQ19GUkVFOwogICAgIHJldHVybiBy
YzsKIH0KIApAQCAtMTMwNSw4ICsxMzA0LDcgQEAgdm9pZCBsaWJ4bF9vc2V2ZW50X2FmdGVycG9s
bChsaWJ4bF9jdHggKmN0eCwgaW50IG5mZHMsIGNvbnN0IHN0cnVjdCBwb2xsZmQgKmZkcywKICAg
ICBFR0NfSU5JVChjdHgpOwogICAgIENUWF9MT0NLOwogICAgIGFmdGVycG9sbF9pbnRlcm5hbChl
Z2MsIGN0eC0+cG9sbGVyX2FwcCwgbmZkcywgZmRzLCBub3cpOwotICAgIENUWF9VTkxPQ0s7Ci0g
ICAgRUdDX0ZSRUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKIH0KIAogLyoKQEAgLTEzNDIs
OCArMTM0MCw3IEBAIHZvaWQgbGlieGxfb3NldmVudF9vY2N1cnJlZF9mZChsaWJ4bF9jdHggKmN0
eCwgdm9pZCAqZm9yX2xpYnhsLAogICAgIGZkX29jY3VycyhlZ2MsIGV2LCByZXZlbnRzX2lnbik7
CiAKICBvdXQ6Ci0gICAgQ1RYX1VOTE9DSzsKLSAgICBFR0NfRlJFRTsKKyAgICBDVFhfVU5MT0NL
X0VHQ19GUkVFOwogfQogCiB2b2lkIGxpYnhsX29zZXZlbnRfb2NjdXJyZWRfdGltZW91dChsaWJ4
bF9jdHggKmN0eCwgdm9pZCAqZm9yX2xpYnhsKQpAQCAtMTM2NSw4ICsxMzYyLDcgQEAgdm9pZCBs
aWJ4bF9vc2V2ZW50X29jY3VycmVkX3RpbWVvdXQobGlieGxfY3R4ICpjdHgsIHZvaWQgKmZvcl9s
aWJ4bCkKICAgICB0aW1lX29jY3VycyhlZ2MsIGV2LCBFUlJPUl9USU1FRE9VVCk7CiAKICBvdXQ6
Ci0gICAgQ1RYX1VOTE9DSzsKLSAgICBFR0NfRlJFRTsKKyAgICBDVFhfVU5MT0NLX0VHQ19GUkVF
OwogfQogCiB2b2lkIGxpYnhsX19ldmVudF9kaXNhc3RlcihsaWJ4bF9fZWdjICplZ2MsIGNvbnN0
IGNoYXIgKm1zZywgaW50IGVycm5vdmFsLApAQCAtMTU0Niw4ICsxNTQyLDcgQEAgaW50IGxpYnhs
X2V2ZW50X2NoZWNrKGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9ldmVudCAqKmV2ZW50X3IsCiAgICAg
RUdDX0lOSVQoY3R4KTsKICAgICBDVFhfTE9DSzsKICAgICBpbnQgcmMgPSBldmVudF9jaGVja19p
bnRlcm5hbChlZ2MsIGV2ZW50X3IsIHR5cGVtYXNrLCBwcmVkLCBwcmVkX3VzZXIpOwotICAgIENU
WF9VTkxPQ0s7Ci0gICAgRUdDX0ZSRUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKICAgICBy
ZXR1cm4gcmM7CiB9CiAKQEAgLTE3NzIsOCArMTc2Nyw3IEBAIGludCBsaWJ4bF9ldmVudF93YWl0
KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF9ldmVudCAqKmV2ZW50X3IsCiAgb3V0OgogICAgIGxpYnhs
X19wb2xsZXJfcHV0KGN0eCwgcG9sbGVyKTsKIAotICAgIENUWF9VTkxPQ0s7Ci0gICAgRUdDX0ZS
RUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKICAgICByZXR1cm4gcmM7CiB9CiAKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2Zvcmsu
YwppbmRleCAwZjFiNmI1MThjLi5jZjE3MGI5MDg1IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9mb3JrLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZm9yay5jCkBAIC00ODMsOCArNDgz
LDcgQEAgaW50IGxpYnhsX2NoaWxkcHJvY19yZWFwZWQobGlieGxfY3R4ICpjdHgsIHBpZF90IHBp
ZCwgaW50IHN0YXR1cykKICAgICBhc3NlcnQoQ1RYLT5jaGlsZHByb2NfaG9va3MtPmNobGRvd25l
cgogICAgICAgICAgICA9PSBsaWJ4bF9zaWdjaGxkX293bmVyX21haW5sb29wKTsKICAgICBpbnQg
cmMgPSBjaGlsZHByb2NfcmVhcGVkKGVnYywgcGlkLCBzdGF0dXMpOwotICAgIENUWF9VTkxPQ0s7
Ci0gICAgRUdDX0ZSRUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKICAgICByZXR1cm4gcmM7
CiB9CiAKQEAgLTUyOSw4ICs1MjgsNyBAQCB2b2lkIGxpYnhsX2NoaWxkcHJvY19zaWdjaGxkX29j
Y3VycmVkKGxpYnhsX2N0eCAqY3R4KQogICAgIGFzc2VydChDVFgtPmNoaWxkcHJvY19ob29rcy0+
Y2hsZG93bmVyCiAgICAgICAgICAgID09IGxpYnhsX3NpZ2NobGRfb3duZXJfbWFpbmxvb3ApOwog
ICAgIGNoaWxkcHJvY19jaGVja2FsbChlZ2MpOwotICAgIENUWF9VTkxPQ0s7Ci0gICAgRUdDX0ZS
RUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKIH0KIAogc3RhdGljIHZvaWQgc2lnY2hsZF9z
ZWxmcGlwZV9oYW5kbGVyKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2ZkICpldiwKZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9p
bnRlcm5hbC5oCmluZGV4IDU4MWQ2NGI5OWMuLjk4M2ZmZmFjN2EgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aApAQCAtMjM2Myw2ICsyMzYzLDggQEAgX2hpZGRlbiB2b2lkIGxpYnhsX19lZ2NfY2xlYW51cChs
aWJ4bF9fZWdjICplZ2MpOwogCiAjZGVmaW5lIEVHQ19GUkVFICAgICAgICAgICBsaWJ4bF9fZWdj
X2NsZWFudXAoZWdjKQogCisjZGVmaW5lIENUWF9VTkxPQ0tfRUdDX0ZSRUUgIGRveyBDVFhfVU5M
T0NLOyBFR0NfRlJFRTsgfXdoaWxlKDApCisKIAogLyoKICAqIE1hY2hpbmVyeSBmb3IgYXN5bmNo
cm9ub3VzIG9wZXJhdGlvbnMgKCJhbyIpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
