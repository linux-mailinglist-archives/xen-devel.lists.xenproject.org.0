Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26564510AF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 17:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfQy0-00024d-JU; Mon, 24 Jun 2019 15:33:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EXrY=UX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hfQxz-00024J-AN
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 15:33:11 +0000
X-Inumbo-ID: 5f306c70-9695-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f306c70-9695-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 15:33:10 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kQPaiIH49oII/yU/o4NKBjCSgEIJPIXZ8PW24fJT53I5h9Lwd8rU6U2sT/Cz1SJyOnE+Nr5Iwz
 ayRZdM6prlyheBn06gLPP860/3E9AzgYpjE50T9aWSY9bfoL5Ht6HVqNvrM+Bdue/aH2vXuqJM
 9qZSztspZhASrz2372T5ndQUfWzmVk0bRZQ/346Q2pl36QcLH7G+uglzWnkhEMYldjTYS9cdeg
 hiEpu2WTJSYG4ZTPJ+nEXaviFTcim9c9mAGIhvL34IQ7o4F0LGwl8IHEQiDRnJrSiMPFV5ATXo
 NwM=
X-SBRS: 2.7
X-MesageID: 2148097
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,412,1557201600"; 
   d="scan'208";a="2148097"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 24 Jun 2019 16:32:52 +0100
Message-ID: <20190624153257.20163-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624153257.20163-1-anthony.perard@citrix.com>
References: <20190624153257.20163-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 3/8] xen-bus: allow AioContext to be specified
 for each event channel
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClRoaXMgcGF0Y2gg
YWRkcyBhbiBBaW9Db250ZXh0IHBhcmFtZXRlciB0byB4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hh
bm5lbCgpCmFuZCB0aGVuIHVzZXMgYWlvX3NldF9mZF9oYW5kbGVyKCkgdG8gc2V0IHRoZSBjYWxs
YmFjayByYXRoZXIgdGhhbgpxZW11X3NldF9mZF9oYW5kbGVyKCkuCgpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDE5MDQw
ODE1MTYxNy4xMzAyNS0zLXBhdWwuZHVycmFudEBjaXRyaXguY29tPgpbQ2FsbCBhaW9fc2V0X2Zk
X2hhbmRsZXIoKSB3aXRoIGlzX2V4dGVybmFsPXRydWVdClNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIGh3L2Jsb2NrL2RhdGFwbGFu
ZS94ZW4tYmxvY2suYyB8ICAyICstCiBody94ZW4veGVuLWJ1cy5jICAgICAgICAgICAgICAgfCAx
MCArKysrKysrLS0tCiBpbmNsdWRlL2h3L3hlbi94ZW4tYnVzLmggICAgICAgfCAgMSArCiAzIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9ody9ibG9jay9kYXRhcGxhbmUveGVuLWJsb2NrLmMgYi9ody9ibG9jay9kYXRhcGxhbmUveGVu
LWJsb2NrLmMKaW5kZXggNmRhNWM3N2ZiYi4uYWFkY2E3NTY0NCAxMDA2NDQKLS0tIGEvaHcvYmxv
Y2svZGF0YXBsYW5lL3hlbi1ibG9jay5jCisrKyBiL2h3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxv
Y2suYwpAQCAtODA2LDcgKzgwNiw3IEBAIHZvaWQgeGVuX2Jsb2NrX2RhdGFwbGFuZV9zdGFydChY
ZW5CbG9ja0RhdGFQbGFuZSAqZGF0YXBsYW5lLAogICAgIH0KIAogICAgIGRhdGFwbGFuZS0+ZXZl
bnRfY2hhbm5lbCA9Ci0gICAgICAgIHhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVsKHhlbmRl
diwgZXZlbnRfY2hhbm5lbCwKKyAgICAgICAgeGVuX2RldmljZV9iaW5kX2V2ZW50X2NoYW5uZWwo
eGVuZGV2LCBkYXRhcGxhbmUtPmN0eCwgZXZlbnRfY2hhbm5lbCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgeGVuX2Jsb2NrX2RhdGFwbGFuZV9ldmVudCwgZGF0YXBsYW5l
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbG9jYWxfZXJyKTsKICAg
ICBpZiAobG9jYWxfZXJyKSB7CmRpZmYgLS1naXQgYS9ody94ZW4veGVuLWJ1cy5jIGIvaHcveGVu
L3hlbi1idXMuYwppbmRleCA0M2E5MGNhZTQyLi4yMjEwNTI2NDkwIDEwMDY0NAotLS0gYS9ody94
ZW4veGVuLWJ1cy5jCisrKyBiL2h3L3hlbi94ZW4tYnVzLmMKQEAgLTkyNSw2ICs5MjUsNyBAQCB2
b2lkIHhlbl9kZXZpY2VfY29weV9ncmFudF9yZWZzKFhlbkRldmljZSAqeGVuZGV2LCBib29sIHRv
X2RvbWFpbiwKIAogc3RydWN0IFhlbkV2ZW50Q2hhbm5lbCB7CiAgICAgUUxJU1RfRU5UUlkoWGVu
RXZlbnRDaGFubmVsKSBsaXN0OworICAgIEFpb0NvbnRleHQgKmN0eDsKICAgICB4ZW5ldnRjaG5f
aGFuZGxlICp4ZWg7CiAgICAgZXZ0Y2huX3BvcnRfdCBsb2NhbF9wb3J0OwogICAgIFhlbkV2ZW50
SGFuZGxlciBoYW5kbGVyOwpAQCAtOTQ0LDYgKzk0NSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZp
Y2VfZXZlbnQodm9pZCAqb3BhcXVlKQogfQogCiBYZW5FdmVudENoYW5uZWwgKnhlbl9kZXZpY2Vf
YmluZF9ldmVudF9jaGFubmVsKFhlbkRldmljZSAqeGVuZGV2LAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBaW9Db250ZXh0ICpjdHgsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwb3J0LAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYZW5FdmVudEhh
bmRsZXIgaGFuZGxlciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApCkBAIC05NjksOCArOTcxLDkgQEAgWGVu
RXZlbnRDaGFubmVsICp4ZW5fZGV2aWNlX2JpbmRfZXZlbnRfY2hhbm5lbChYZW5EZXZpY2UgKnhl
bmRldiwKICAgICBjaGFubmVsLT5oYW5kbGVyID0gaGFuZGxlcjsKICAgICBjaGFubmVsLT5vcGFx
dWUgPSBvcGFxdWU7CiAKLSAgICBxZW11X3NldF9mZF9oYW5kbGVyKHhlbmV2dGNobl9mZChjaGFu
bmVsLT54ZWgpLCB4ZW5fZGV2aWNlX2V2ZW50LCBOVUxMLAotICAgICAgICAgICAgICAgICAgICAg
ICAgY2hhbm5lbCk7CisgICAgY2hhbm5lbC0+Y3R4ID0gY3R4OworICAgIGFpb19zZXRfZmRfaGFu
ZGxlcihjaGFubmVsLT5jdHgsIHhlbmV2dGNobl9mZChjaGFubmVsLT54ZWgpLCB0cnVlLAorICAg
ICAgICAgICAgICAgICAgICAgICB4ZW5fZGV2aWNlX2V2ZW50LCBOVUxMLCBOVUxMLCBjaGFubmVs
KTsKIAogICAgIFFMSVNUX0lOU0VSVF9IRUFEKCZ4ZW5kZXYtPmV2ZW50X2NoYW5uZWxzLCBjaGFu
bmVsLCBsaXN0KTsKIApAQCAtMTAxMSw3ICsxMDE0LDggQEAgdm9pZCB4ZW5fZGV2aWNlX3VuYmlu
ZF9ldmVudF9jaGFubmVsKFhlbkRldmljZSAqeGVuZGV2LAogCiAgICAgUUxJU1RfUkVNT1ZFKGNo
YW5uZWwsIGxpc3QpOwogCi0gICAgcWVtdV9zZXRfZmRfaGFuZGxlcih4ZW5ldnRjaG5fZmQoY2hh
bm5lbC0+eGVoKSwgTlVMTCwgTlVMTCwgTlVMTCk7CisgICAgYWlvX3NldF9mZF9oYW5kbGVyKGNo
YW5uZWwtPmN0eCwgeGVuZXZ0Y2huX2ZkKGNoYW5uZWwtPnhlaCksIHRydWUsCisgICAgICAgICAg
ICAgICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwpOwogCiAgICAgaWYgKHhlbmV2dGNo
bl91bmJpbmQoY2hhbm5lbC0+eGVoLCBjaGFubmVsLT5sb2NhbF9wb3J0KSA8IDApIHsKICAgICAg
ICAgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJubywgInhlbmV2dGNobl91bmJpbmQgZmFpbGVk
Iik7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3hlbi94ZW4tYnVzLmggYi9pbmNsdWRlL2h3L3hl
bi94ZW4tYnVzLmgKaW5kZXggMzMxNWYwZGUyMC4uODE4M2I5OGM3ZCAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9ody94ZW4veGVuLWJ1cy5oCisrKyBiL2luY2x1ZGUvaHcveGVuL3hlbi1idXMuaApAQCAt
MTIyLDYgKzEyMiw3IEBAIHZvaWQgeGVuX2RldmljZV9jb3B5X2dyYW50X3JlZnMoWGVuRGV2aWNl
ICp4ZW5kZXYsIGJvb2wgdG9fZG9tYWluLAogdHlwZWRlZiB2b2lkICgqWGVuRXZlbnRIYW5kbGVy
KSh2b2lkICpvcGFxdWUpOwogCiBYZW5FdmVudENoYW5uZWwgKnhlbl9kZXZpY2VfYmluZF9ldmVu
dF9jaGFubmVsKFhlbkRldmljZSAqeGVuZGV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBBaW9Db250ZXh0ICpjdHgsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwb3J0LAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYZW5FdmVudEhhbmRsZXIgaGFu
ZGxlciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9p
ZCAqb3BhcXVlLCBFcnJvciAqKmVycnApOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
