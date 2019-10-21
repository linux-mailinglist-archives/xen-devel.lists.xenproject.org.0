Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAE4DF118
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:18:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZQA-0003wn-1h; Mon, 21 Oct 2019 15:16:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=25w6=YO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iMZQ8-0003wP-Aa
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:16:32 +0000
X-Inumbo-ID: bd7371ea-f415-11e9-8aca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd7371ea-f415-11e9-8aca-bc764e2007e4;
 Mon, 21 Oct 2019 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571670982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UrrolaSHHt1KywdjDCS6pbQdWiowZgcACrdggbFVb/4=;
 b=ES6JLHvvVsn0gYYS09AHsDYBqgN8ej73a7tHVgZbfZFgUZGmXVL5riPs
 8DBSP5tEAUMOUXuTaRdeSAEPq1jObI1/qG/VaNfs01gvXvv6agd+h8SJW
 dFfaVcLLTSiobMNJVNf0REXXMqeXbAUVpXPsTGaJUOK3whlIRDmqnQbX0 Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sRKpOH7lfhIx3oWwvwTpl7V12+E5JRp8VmRiA0g3ssZ8DPrLJGgZ6rq7/xOjV5BKtP8X2FDzlH
 N9oqj7E5pY7Tum5QqvjYHouVf4+7Jaf3RTjW++Kj2SA28fF1pgihxMuUjXFtnbi+WIjTuqR0do
 lUcsskI6wuvlC+UXNz4luSU+K/I1Vcnv0w1P7+nSe6W87Zz7tlSxzjbDk1HpowB9Fqh4WD5HE0
 DYZPBmHgQ6SlwotsB6bSawNq7GolXGajez0juY+etiFsDooxsnoTpm0Qa6fD4Uht8QRe9zpyLs
 HZk=
X-SBRS: 2.7
X-MesageID: 7207331
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,324,1566878400"; 
   d="scan'208";a="7207331"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:16:14 +0100
Message-ID: <20191021151615.30367-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021151615.30367-1-ian.jackson@eu.citrix.com>
References: <20191021151615.30367-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/3] guest_prepare_disk: Only do the
 umount if we set an env var
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

VGhpcyBjYWxsIHRvIGd1ZXN0X3Vtb3VudF9sdiBpcyBoZXJlIGZvciB0aGUgYmVuZWZpdCBvZiBh
ZC1ob2MgcmVydW5zCm9mIChlZykgdHMtZ3Vlc3Qtc3RhcnQgdGlkeSB1cCBhbnkgYWQtaG9jIG1l
c3NpbmcgYWJvdXQgKGVnIGZyb20KZWFybGllciBydW5zIG9mIHRzLWRlYmlhbi1maXh1cCBvciBz
b21ldGhpbmcpLiAgSXQgaXMgbm90IG5lZWRlZCBpbgpwcm9kdWN0aW9uIHJ1bnMuCgpTZXJlbmRp
cGl0b3VzbHksIHRoaXMgb3NzdGVzdCBjb2RlIGRpc2NvdmVyZWQgYSBidWcgaW4gdGhlIExpbnV4
CmJsa2JhY2s6IHdoZW4gdGVhcmluZyBkb3duLCBpdCBzZXRzIHRoZSBiYWNrZW5kIHN0YXRlIHRv
IDYgYmVmb3JlIGl0CmhhcyBjbG9zZWQgdGhlIHVuZGVybHlpbmcgYmxvY2sgZGV2aWNlcy4gIFRo
aXMgdWx0aW1hdGVseSBtZWFucyB0aGF0CmFmdGVyICJ4bCBkZXN0cm95IiBvciAieGwgc2h1dGRv
d24gLXciIHRoZXJlIGlzIGEgcGVyaW9kIHdoZW4gdGhlCmd1ZXN0J3Mgb3BlbiBoYW5kbGUgb250
byBpdHMgc3RvcmFnZSBpcyBzdGlsbCBvcGVuLiAgVGhpcyBpcyB3cm9uZy4KClRoaXMgZGV0ZWN0
aW9uIGRlcGVuZHMgb24gdXMgd2lubmluZyBhIHRyaWNreSByYWNlLiAgU28gaXQgc2hvd3MgdXAg
aW4Kb3NzdGVzdCBhcyBhIHZlcnkgbG93IHByb2JhYmlsaXR5IGhlaXNlbmJ1Zy4gIFRoZSBidWcg
aXMgY3VycmVudGx5IGluCmFsbCB2ZXJzaW9ucyBvZiBMaW51eCBhbmQgY2F1c2luZyBhIGJpdCBv
ZiBhIG51aXNhbmNlLgoKSXQgd291bGQgYmUgYmVzdCB0byBhZGQgYSBwcm9wZXIgY2hlY2sgZm9y
IHRoaXMgYnVnLiAgSG93ZXZlciwgdGhpcyBpcwpxdWl0ZSBmaWRkbHk6IHJlYWxseSwgaXQgb3Vn
aHQgdG8gYmUgZG9uZSBhcyBjbG9zZSB0byB0aGUgeGwgY29tbWFuZApjb21wbGV0aW9uIGFzIHBv
c3NpYmxlLCBpbiB0aGUgc2FtZSBzc2ggaW52b2NhdGlvbi4gIFRoYXQgd291bGQKaW52b2x2ZSBh
IGZhaXIgYml0IG9mIHBsdW1iaW5nIGFuZCBhZC1ob2NlcnkuICBJIGRvbid0IHRoaW5rIHRoYXQK
d291bGQgYmUgcHJvcG9ydGlvbmF0ZSBmb3Igc3VjaCBhIGxvdy1pbXBhY3QgYnVnLgoKU28gaW5z
dGVhZCBpbiB0aGlzIHBhdGNoIEkganVzdCBkaXNhYmxlIHRoaXMgY2xlYW51cCBjb2RlIGluIHRo
ZQp0cm91Ymxlc29tZSBjYXNlLCB1bmxlc3MgaXQgaXMgZXhwbGljaXRseSByZXF1ZXN0ZWQgYnkg
dGhlIHVzZXIKc2V0dGluZyBPU1NURVNUX0dVRVNUX0RJU0tfTU9VTlRfQ0xFQU5VUCB0byBhIHRy
dWVpc2ggdmFsdWUuICAoVGhpcwp3b3VsZCBiZSByZWFzb25hYmx5IGNvbnZlbmllbnQgZm9yIHRo
ZSBhZC1ob2MgdGVzdGluZyB0aGF0IHRoaXMgY2FsbApzZXJ2ZXMuKQoKVGhhbmtzIHRvIFJvZ2Vy
IGZvciBkaWFnbm9zaW5nIHRoZSBMaW51eCBrZXJuZWwgYnVnLgoKQ0M6IErDvHJnZW4gR3Jvw58g
PGpncm9zc0BzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAzICsrLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IDc4ZjQ3NDgw
Li42YjBlZTdhMiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0
ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0xOTM4LDcgKzE5MzgsOCBAQCBzdWIgZ3Vlc3RfY3JlYXRl
X3BhdXNlZCAoJCkgewogc3ViIGd1ZXN0X3ByZXBhcmVfZGlzayAoJCkgewogICAgIG15ICgkZ2hv
KSA9IEBfOwogCi0gICAgZ3Vlc3RfdW1vdW50X2x2KCRnaG8tPntIb3N0fSwgJGdobyk7CisgICAg
Z3Vlc3RfdW1vdW50X2x2KCRnaG8tPntIb3N0fSwgJGdobykKKwlpZiAkRU5WeydPU1NURVNUX0dV
RVNUX0RJU0tfTU9VTlRfQ0xFQU5VUCd9OwogCiAgICAgcmV0dXJuIGlmICgkZ2hvLT57RGlza2Zt
dH0gLy8gJ25vbmUnKSBlcSAibm9uZSI7CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
