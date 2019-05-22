Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059FB26658
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 16:54:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTSbI-0006tv-3R; Wed, 22 May 2019 14:52:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mUbO=TW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hTSbG-0006tq-3z
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 14:52:14 +0000
X-Inumbo-ID: 2d8e82f4-7ca1-11e9-bc90-f35a84c7d611
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d8e82f4-7ca1-11e9-bc90-f35a84c7d611;
 Wed, 22 May 2019 14:52:11 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 8KztN3V2gd9am0NFC/sQeoBbMmR5PGYKQE9WfY1uevOmaVqXgOQ+9mPg60yQhgnCdPXkPtMmRp
 N6Eq6CGKlUfoBjBwt1+xptHw+iI0F0GXFSEpMKbRH77j1kqOAv10Ui4DDhD0yHAejmZbPxF/DL
 V6mGVINyuw/tsGzkT5z0X7dq7xNcQkSfJKRAa6iPIJXR1WzDXL0/R0ypqV2uRtI9HvvnDzEEZ6
 z+aRVPuKin/GfWESO6cglWgB6yFBEPEYGEz0ecgjCCGXU/aedFGI6dCKgTIo1bIwlcmfOEhD/5
 NoE=
X-SBRS: 2.7
X-MesageID: 783595
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,499,1549947600"; 
   d="scan'208";a="783595"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 May 2019 15:51:40 +0100
Message-ID: <20190522145140.12943-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgUUVNVSAyLjEwIChvciBxZW11LXhlbi00LjEwKSwgcWVtdSBsb2NrcyBkaXNrIGltYWdl
cyB0byBhdm9pZAp0aGVtIGJlZW4gcmUtb3BlbmVkIGluIGEgZGlmZmVyZW50IHFlbXUgcHJvY2Vz
cy4KCldpdGggWGVuLCB0aGVyZSBhcmUgdHdvIGlzc3VlczoKLSBGb3IgSFZNIGd1ZXN0cywgYSBk
aXNrIGltYWdlIGNhbiBiZSBvcGVuIHR3aWNlISBPbmUgYnkgdGhlCiAgZW11bGF0aW9uIGRyaXZl
ciwgYW5kIG9uZSBieSB0aGUgUFYgYmFja2VuZC4KLSBEdXJpbmcgbWlncmF0aW9uLCB0aGUgcWVt
dSBwcm9jZXNzIG9mIHRoZSBuZXdseSBzcGF3bmVkIGRvbWFpbiBtYXkKICBhdHRlbXB0IHRvIGFj
Y2VzcyB0aGUgZGlzayBpbWFnZSBiZWZvcmUgdGhlIGRvbWFpbiBiZWVuIG1pZ3JhdGVkCiAgYW5k
IHRoZSBxZW11IHByb2Nlc3MgYXJlIGJlZW4gY29tcGxldGVseSBkZXN0cm95ZWQuCgpNaWdyYXRp
b24gb2YgSFZNIGd1ZXN0IGFzIGJlZW4gdGFrZW4gY2FyZSBvZiBpbiBsaWJ4bCwgYnV0IG1pZ3Jh
dGlvbgpvZiBQViBndWVzdCB3aXRoIHFkaXNrIGFuZCBIVk0gZ3Vlc3QgYXR0ZW1wdGluZyB0byBh
Y2Nlc3MgdGhlIFBWIGRpc2sKYmVmb3JlIHVucGx1Z2dpbmcgdGhlIGVtdWxhdGVkIGRpc2sgYXJl
IHN0aWxsIGFuIGlzc3VlLgoKRm9yIHRoZXNlIHJlYXNvbnMsIHdlIGRvbid0IHdhbnQgdG8gaGF2
ZSBRRU1VIHVzZSBhIGxvY2tpbmcgbWVjaGFuaXNtCndpdGggdGhlIFBWIGJhY2tlbmQuCgpUaGlz
IGlzIGFscmVhZHkgZG9uZSBieSBkYjlmZjQ2ZWViIGluIFFFTVUgdXBzdHJlYW0sIG9yIFFFTVUg
NC4wLgoKQWZmZWN0ZWQgdmVyc2lvbiBvZiBRRU1VIGFyZToKLSBxZW11LXhlbiBvZiBYZW4gNC4x
MCBhbmQgNC4xMQotIFFFTVUgMi4xMCwgMi4xMSwgMi4xMiwgMy4wIGFuZCAzLjEKClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0tCgpI
aSBPbGFmLCBSb2dlciwgV2VpLAoKSW5zdGVhZCBvZiBhIGZpeCBpbiBsaWJ4bCAod2l0aCB0aGUg
cmV2ZXJ0ZWQgcGF0Y2ggImxpYnhsOiBmaXgKbWlncmF0aW9uIG9mIFBWIGFuZCBQVkggZG9tVXMg
d2l0aCBhbmQgd2l0aG91dCBxZW11IiksIHdoYXQgZG8geW91CnRoaW5rIG9mIHRoaXMgUUVNVSBw
YXRjaD8gIEl0IGlzIG11Y2ggc2ltcGxlciB0aGF0IHRyeWluZyB0byB3b3JrCmFyb3VuZCB0aGUg
aXNzdWUgaW4gbGlieGwsIGFuZCBpdCBmaXggb25lIG1vcmUgcHJvYmxlbSB0aGF0IHN0aWxsCmV4
aXN0LgoKVGhpcyBwYXRjaCBpcyBvbmx5IGZvciBzdGFibGUgYnJhbmNoZXMgYXMgWGVuIHVuc3Rh
YmxlIGFscmVhZHkgaGF2ZSBhCnFlbXUgd2l0aCBhIHNpbWlsYXIgcGF0Y2guCgpDYW4geW91IGdp
dmUgaXQgYSB0cnkgd2l0aCBvbmUgb2YgdGhlIGFmZmVjdGVkIHFlbXU/IChxZW11LXhlbi00LjEw
IG9yCnFlbXUteGVuLTQuMTEpCgpUaGFua3MsCi0tLQogaHcvYmxvY2sveGVuX2Rpc2suYyB8IDkg
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuX2Rpc2suYyBiL2h3L2Jsb2NrL3hlbl9kaXNrLmMK
aW5kZXggZTQzMWJkODllOC4uY2JmZjE3NGE5OCAxMDA2NDQKLS0tIGEvaHcvYmxvY2sveGVuX2Rp
c2suYworKysgYi9ody9ibG9jay94ZW5fZGlzay5jCkBAIC0xMDg0LDExICsxMDg0LDE4IEBAIHN0
YXRpYyBpbnQgYmxrX2Nvbm5lY3Qoc3RydWN0IFhlbkRldmljZSAqeGVuZGV2KQogICAgICAgICBF
cnJvciAqbG9jYWxfZXJyID0gTlVMTDsKICAgICAgICAgUURpY3QgKm9wdGlvbnMgPSBOVUxMOwog
CisgICAgICAgIG9wdGlvbnMgPSBxZGljdF9uZXcoKTsKKwogICAgICAgICBpZiAoc3RyY21wKGJs
a2Rldi0+ZmlsZXByb3RvLCAiPHVuc2V0PiIpKSB7Ci0gICAgICAgICAgICBvcHRpb25zID0gcWRp
Y3RfbmV3KCk7CiAgICAgICAgICAgICBxZGljdF9wdXRfc3RyKG9wdGlvbnMsICJkcml2ZXIiLCBi
bGtkZXYtPmZpbGVwcm90byk7CiAgICAgICAgIH0KIAorICAgICAgICAvKgorICAgICAgICAgKiBJ
dCBpcyBuZWNlc3NhcnkgdG8gdHVybiBmaWxlIGxvY2tpbmcgb2ZmIGFzIGFuIGVtdWxhdGVkIGRl
dmljZQorICAgICAgICAgKiBtYXkgaGF2ZSBhbHJlYWR5IG9wZW5lZCB0aGUgc2FtZSBpbWFnZSBm
aWxlLgorICAgICAgICAgKi8KKyAgICAgICAgcWRpY3RfcHV0X3N0cihvcHRpb25zLCAiZmlsZS5s
b2NraW5nIiwgIm9mZiIpOworCiAgICAgICAgIC8qIHNldHVwIHZpYSB4ZW5idXMgLT4gY3JlYXRl
IG5ldyBibG9jayBkcml2ZXIgaW5zdGFuY2UgKi8KICAgICAgICAgeGVuX3B2X3ByaW50ZigmYmxr
ZGV2LT54ZW5kZXYsIDIsICJjcmVhdGUgbmV3IGJkcnYgKHhlbmJ1cyBzZXR1cClcbiIpOwogICAg
ICAgICBibGtkZXYtPmJsayA9IGJsa19uZXdfb3BlbihibGtkZXYtPmZpbGVuYW1lLCBOVUxMLCBv
cHRpb25zLAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
