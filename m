Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96EDEDAE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 15:35:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMXnP-0003cA-Cu; Mon, 21 Oct 2019 13:32:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=25w6=YO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iMXnO-0003c5-Ni
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 13:32:26 +0000
X-Inumbo-ID: 358f54e6-f407-11e9-9452-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 358f54e6-f407-11e9-9452-12813bfff9fa;
 Mon, 21 Oct 2019 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571664741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vvz+gMyWe9EIqHjEnqLGp304xsjSkwAR2HZxiTAJeXc=;
 b=EntdHUGvf4SSWlYzBERUa6zEoTw4U787SpBt0PeS1H6SooARo367S2oj
 P2NhXfxZ9gDx0ixgPQFTognSdeYdNjySik5rnTsYrm9tZRKFOx72DAG9a
 8AWQoKkOz1vUGlgwqKmH1J550ZO/6wlpj/NfdExsQYxE+6eJOLnjRzbxF A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Wj1j5+BIJVxqEkw3aWvN0zm5sTcZ1STcCMemoS5GxHGJk07C4jW+/SF2mrunMXsEZOmIps6C7R
 CQHr483hfxpvm4HI7PEBIN9mWbFxnpvDJ0SOsixojLv4VUyudAt5XrT73Y2ap2S73mMIfPy5tO
 UBrIS6RcTseYdYz3Fg/UbskSUz7FN2VW/0q+y8twrlE6YFPYf97PP6iy7G/fv/GwdqUrFwIgke
 4HUIKTnHN2XVXPeTU7SpGfYUGOrclflncpurgpbspygHs2EyFQXY+hus6wgOMP4nQ/ggOAgHqd
 dHU=
X-SBRS: 2.7
X-MesageID: 7496062
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7496062"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 14:32:15 +0100
Message-ID: <20191021133215.26518-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] guest_prepare_disk: Only do the umount
 if we set an env var
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
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
IGZvciBkaWFnbm9zaW5nIHRoZSBMaW51eCBrZXJuZWwgYnVnLgoKQ0M6IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5j
b20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1
cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IDc4ZjQ3NDgwLi42YjBlZTdh
MiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RT
dXBwb3J0LnBtCkBAIC0xOTM4LDcgKzE5MzgsOCBAQCBzdWIgZ3Vlc3RfY3JlYXRlX3BhdXNlZCAo
JCkgewogc3ViIGd1ZXN0X3ByZXBhcmVfZGlzayAoJCkgewogICAgIG15ICgkZ2hvKSA9IEBfOwog
Ci0gICAgZ3Vlc3RfdW1vdW50X2x2KCRnaG8tPntIb3N0fSwgJGdobyk7CisgICAgZ3Vlc3RfdW1v
dW50X2x2KCRnaG8tPntIb3N0fSwgJGdobykKKwlpZiAkRU5WeydPU1NURVNUX0dVRVNUX0RJU0tf
TU9VTlRfQ0xFQU5VUCd9OwogCiAgICAgcmV0dXJuIGlmICgkZ2hvLT57RGlza2ZtdH0gLy8gJ25v
bmUnKSBlcSAibm9uZSI7CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
