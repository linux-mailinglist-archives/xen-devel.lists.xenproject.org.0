Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627222DF57
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 16:11:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVzFB-00074N-3g; Wed, 29 May 2019 14:07:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSLV=T5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hVzFA-00074I-8X
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 14:07:52 +0000
X-Inumbo-ID: 237fc776-821b-11e9-a768-4b191682de30
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 237fc776-821b-11e9-a768-4b191682de30;
 Wed, 29 May 2019 14:07:48 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: oUyc9ri6LKHgqVj/NjSATff6i2wdiOzYID0Lre+Z5/64nAr3ANjCgG01b9Mrg5cSU19zJnV/FI
 BfFWHhgIkoBMj8Qp3zfHTXdepy/Cb/jE4ZbSbI5+41a2qUC7dC/Yhw+dRymHnEn/xeSViA5kvD
 sJ7GdPYNkag3L5RidKs3L5Aaav7WrNKQSI+VKo8NPegxKbaSept9Yn/3JIG4UrrbRHcIUHDlC7
 5V0nAJmzVaYc2nliO9sIA5fRHMUIQOb/E4sDSdYZv/Zcp+0M2mMO8DLpqm+7EZZgPN+2HhIw6a
 4WU=
X-SBRS: 2.7
X-MesageID: 1047240
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1047240"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 May 2019 15:07:44 +0100
Message-ID: <20190529140744.5565-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] x86/hvm/hpet: avoid 'small' time diff test
 on resume
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
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgYXBwZWFycyB0aGF0IGV2ZW4gNjQtYml0IHZlcnNpb25zIG9mIFdpbmRvd3MgMTAsIHdoZW4g
bm90IHVzaW5nIHN5dGgtCmV0aWMgdGltZXJzLCB3aWxsIHVzZSAzMi1iaXQgSFBFVCBub24tcGVy
aW9kaWMgdGltZXJzLiBUaGVyZSBpcyBhIHRlc3QKaW4gaHBldF9zZXRfdGltZXIoKSwgc3BlY2lm
aWMgdG8gMzItYml0IHRpbWVycywgdGhhdCB0cmllcyB0byBkaXNhbWJpZ3VhdGUKYmV0d2VlbiBh
IGNvbXBhcmF0b3IgdmFsdWUgdGhhdCBpcyBpbiB0aGUgcGFzdCBhbmQgb25lIHRoYXQgaXMgc3Vm
ZmljaWVudGx5CmZhciBpbiB0aGUgZnV0dXJlIHRoYXQgaXQgd3JhcHMuIFRoaXMgaXMgZG9uZSBi
eSBhc3N1bWluZyB0aGF0IHRoZSBkZWx0YQpiZXR3ZWVuIHRoZSBtYWluIGNvdW50ZXIgYW5kIGNv
bXBhcmF0b3Igd2lsbCBiZSAnc21hbGwnIFsxXSwgaWYgdGhlCmNvbXBhcmF0b3IgdmFsdWUgaXMg
aW4gdGhlIHBhc3QuIFVuZm9ydHVuYXRlbHksIG1vcmUgb2Z0ZW4gdGhhbiBub3QsIHRoaXMKaXMg
bm90IHRoZSBjYXNlIGlmIHRoZSB0aW1lciBpcyBiZWluZyByZS1zdGFydGVkIGFmdGVyIGEgbWln
cmF0ZSBhbmQgc28KdGhlIHRpbWVyIGlzIHNldCB0byBmaXJlIGZhciBpbiB0aGUgZnV0dXJlIChp
biBleGNlc3Mgb2YgYSBtaW51dGUgaW4Kc2V2ZXJhbCBvYnNlcnZlZCBjYXNlcykgcmF0aGVyIHRo
ZW4gc2V0IHRvIGZpcmUgaW1tZWRpYXRlbHkuIFRoaXMgaGFzIGEKcmF0aGVyIG9kZCBzeW1wdG9t
IHdoZXJlIHRoZSBndWVzdCBjb25zb2xlIGlzIGFsaXZlIGVub3VnaCB0byBiZSBhYmxlIHRvCmRl
YWwgd2l0aCBtb3VzZSBwb2ludGVyIHJlLXJlbmRlcmluZywgYnV0IGFueSBrZXlib2FyZCBhY3Rp
dml0eSBvciBtb3VzZQpjbGlja3MgeWllbGQgbm8gcmVzcG9uc2UuCgpUaGlzIHBhdGNoIHNpbXBs
eSBhZGRzIGFuIGV4dHJhIGNoZWNrIG9mICdjcmVhdGlvbl9maW5pc2hlZCcgaW50bwpocGV0X3Nl
dF90aW1lcigpIHNvIHRoYXQgdGhlICdzbWFsbCcgdGltZSB0ZXN0IGlzIG9taXR0ZWQgd2hlbiB0
aGUgZnVuY3Rpb24KaXMgY2FsbGVkIHRvIHJlc3RhcnQgdGltZXJzIGFmdGVyIG1pZ3JhdGlvbiwg
YW5kIHRodXMgYW55IG5lZ2F0aXZlIGRlbHRhCmNhdXNlcyBhIHRpbWVyIHRvIGZpcmUgaW1tZWRp
YXRlbHkuCgpbMV0gVGhlIG51bWJlciBvZiB0aWNrcyB0aGF0IGVxdWF0ZSB0byAwLjk3NjU2MjUg
bWlsbGlzZWNvbmRzCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkkg
bm90aWNlIHRoYXQgd2Ugc2VlbWluZ2x5IGRvbid0IGhhbmRsZSBtYWluIGNvdW50ZXIgd3JhcCBp
biB0aGUgSFBFVCBjb2RlLgpUaGUgc3BlYy4gc2F5cyB0aGF0IHRpbWVycyBzaG91bGQgZmlyZSBh
dCB0aGUgcG9pbnQgdGhlIGNvdW50ZXIgd3JhcHMgYXQgdGhlCnRpbWVyJ3Mgd2lkdGguIEkgdGhp
bmsgdGhlIG5lZWQgZm9yIHRoZSAnc21hbGwnIHRpbWUgdGVzdCB3b3VsZCBnbyBhd2F5IGlmCnRo
aXMgd2FzIGltcGxlbWVudGVkLCBidXQgdGhhdCdzIGZvciBhbm90aGVyIGRheS4KLS0tCiB4ZW4v
YXJjaC94ODYvaHZtL2hwZXQuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9o
cGV0LmMgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwppbmRleCBhOTE2NzU4MTA2Li4xMmYxM2Y4
YzNjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYworKysgYi94ZW4vYXJjaC94
ODYvaHZtL2hwZXQuYwpAQCAtMjczLDEwICsyNzMsMTQgQEAgc3RhdGljIHZvaWQgaHBldF9zZXRf
dGltZXIoSFBFVFN0YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4sCiAgICAgICogRGV0ZWN0IHRpbWUg
dmFsdWVzIHNldCBpbiB0aGUgcGFzdC4gVGhpcyBpcyBoYXJkIHRvIGRvIGZvciAzMi1iaXQKICAg
ICAgKiBjb21wYXJhdG9ycyBhcyB0aGUgdGltZXIgZG9lcyBub3QgaGF2ZSB0byBiZSBzZXQgdGhh
dCBmYXIgaW4gdGhlIGZ1dHVyZQogICAgICAqIGZvciB0aGUgY291bnRlciBkaWZmZXJlbmNlIHRv
IHdyYXAgYSAzMi1iaXQgc2lnbmVkIGludGVnZXIuIFdlIGZ1ZGdlCi0gICAgICogYnkgbG9va2lu
ZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4gdGhlIHBhc3QuCisgICAgICogYnkgbG9va2lu
ZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4gdGhlIHBhc3QuIEhvd2V2ZXIsIGlmIHdlCisg
ICAgICogYXJlIHJlc3RvcmluZyBhZnRlciBtaWdyYXRlLCB0cmVhdCBhbnkgd3JhcCBhcyBwYXN0
IHNpbmNlIHRoZSB2YWx1ZQorICAgICAqIGlzIHVubGlrZWx5IHRvIGJlICdzbWFsbCcuCiAgICAg
ICovCiAgICAgaWYgKCAoaW50NjRfdClkaWZmIDwgMCApCi0gICAgICAgIGRpZmYgPSAodGltZXJf
aXNfMzJiaXQoaCwgdG4pICYmICgtZGlmZiA+IEhQRVRfVElOWV9USU1FX1NQQU4pKQorICAgICAg
ICBkaWZmID0gKHRpbWVyX2lzXzMyYml0KGgsIHRuKSAmJgorICAgICAgICAgICAgICAgIHZocGV0
X2RvbWFpbihoKS0+Y3JlYXRpb25fZmluaXNoZWQgJiYKKyAgICAgICAgICAgICAgICAoLWRpZmYg
PiBIUEVUX1RJTllfVElNRV9TUEFOKSkKICAgICAgICAgICAgID8gKHVpbnQzMl90KWRpZmYgOiAw
OwogCiAgICAgZGVzdHJveV9wZXJpb2RpY190aW1lKCZoLT5wdFt0bl0pOwotLSAKMi4yMC4xLjIu
Z2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
