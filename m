Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B810E2DE38
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 15:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVyct-0003Vn-BU; Wed, 29 May 2019 13:28:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSLV=T5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hVycr-0003VY-Et
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 13:28:17 +0000
X-Inumbo-ID: 9bf26f52-8215-11e9-8231-5f2c921ddbfd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bf26f52-8215-11e9-8231-5f2c921ddbfd;
 Wed, 29 May 2019 13:28:14 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: m0gPzjEozlfonxNoS4B83qsD+86xkmc9HKnPgZnZmHf2ZwJiWLPM+UOt7ip06GhIuiQVJ8ScFS
 K1SdO87gyIx8CBtM27snfVkq2q57ppvqPzeh8wkncQffF02nCBkDPOnhp3SLn98U0JMcU22Bpo
 nGem2tiQMGjcxzNGQqaieORudYmmlMUMNsuCIGBrpXZpJmnY0WHQKPt56xv3kkDsLixp25Ytlw
 xzbjrBPf5yM4WXCwg6GBZ8HN7aOJEW7XsH4BUwr5pCss5ALDGxTss2tYQKg3Tsk9FrobKKwg2Q
 W0w=
X-SBRS: 2.7
X-MesageID: 1042745
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1042745"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 May 2019 14:28:08 +0100
Message-ID: <20190529132808.5419-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/hvm/hpet: avoid 'small' time diff test
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
eSBhZGRzIGEgYm9vbGVhbiBhcmd1bWVudCB0byBocGV0X3NldF90aW1lcigpIHNvIHRoYXQgdGhl
CidzbWFsbCcgdGltZSB0ZXN0IGlzIG9taXR0ZWQgd2hlbiB0aGUgZnVuY3Rpb24gaXMgY2FsbGVk
IHRvIHJlc3RhcnQgdGltZXJzCm9uIHJlc3VtZSwgYW5kIHRodXMgYW55IG5lZ2F0aXZlIGRlbHRh
IGNhdXNlcyBhIHRpbWVyIHRvIGZpcmUgaW1tZWRpYXRlbHkuCgpbMV0gVGhlIG51bWJlciBvZiB0
aWNrcyB0aGF0IGVxdWF0ZSB0byAwLjk3NjU2MjUgbWlsbGlzZWNvbmRzCgpTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25u
w6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkkgbm90aWNlIHRoYXQgd2Ugc2VlbWluZ2x5IGRv
bid0IGhhbmRsZSBtYWluIGNvdW50ZXIgd3JhcCBpbiB0aGUgSFBFVCBjb2RlLgpUaGUgc3BlYy4g
c2F5cyB0aGF0IHRpbWVycyBzaG91bGQgZmlyZSBhdCB0aGUgcG9pbnQgdGhlIGNvdW50ZXIgd3Jh
cHMgYXQgdGhlCnRpbWVyJ3Mgd2lkdGguIEkgdGhpbmsgdGhlIG5lZWQgZm9yIHRoZSAnc21hbGwn
IHRpbWUgdGVzdCB3b3VsZCBnbyBhd2F5IGlmCnRoaXMgd2FzIGltcGxlbWVudGVkLCBidXQgdGhh
dCdzIGZvciBhbm90aGVyIGRheS4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2hwZXQuYyB8IDEzICsr
KysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9ocGV0LmMgYi94ZW4vYXJjaC94ODYv
aHZtL2hwZXQuYwppbmRleCBhOTE2NzU4MTA2Li40OTI1Nzk4NmI1IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2hwZXQuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2hwZXQuYwpAQCAtMjMz
LDcgKzIzMyw3IEBAIHN0YXRpYyB2b2lkIGhwZXRfdGltZXJfZmlyZWQoc3RydWN0IHZjcHUgKnYs
IHZvaWQgKmRhdGEpCiAjZGVmaW5lICBIUEVUX1RJTllfVElNRV9TUEFOICAoKGgtPnN0aW1lX2Zy
ZXEgPj4gMTApIC8gU1RJTUVfUEVSX0hQRVRfVElDSykKIAogc3RhdGljIHZvaWQgaHBldF9zZXRf
dGltZXIoSFBFVFN0YXRlICpoLCB1bnNpZ25lZCBpbnQgdG4sCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50NjRfdCBndWVzdF90aW1lKQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDY0X3QgZ3Vlc3RfdGltZSwgYm9vbCByZXN1bWUpCiB7CiAgICAgdWludDY0X3QgdG5fY21w
LCBjdXJfdGljaywgZGlmZjsKICAgICB1bnNpZ25lZCBpbnQgaXJxOwpAQCAtMjczLDEwICsyNzMs
MTMgQEAgc3RhdGljIHZvaWQgaHBldF9zZXRfdGltZXIoSFBFVFN0YXRlICpoLCB1bnNpZ25lZCBp
bnQgdG4sCiAgICAgICogRGV0ZWN0IHRpbWUgdmFsdWVzIHNldCBpbiB0aGUgcGFzdC4gVGhpcyBp
cyBoYXJkIHRvIGRvIGZvciAzMi1iaXQKICAgICAgKiBjb21wYXJhdG9ycyBhcyB0aGUgdGltZXIg
ZG9lcyBub3QgaGF2ZSB0byBiZSBzZXQgdGhhdCBmYXIgaW4gdGhlIGZ1dHVyZQogICAgICAqIGZv
ciB0aGUgY291bnRlciBkaWZmZXJlbmNlIHRvIHdyYXAgYSAzMi1iaXQgc2lnbmVkIGludGVnZXIu
IFdlIGZ1ZGdlCi0gICAgICogYnkgbG9va2luZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4g
dGhlIHBhc3QuCisgICAgICogYnkgbG9va2luZyBmb3IgYSAnc21hbGwnIHRpbWUgdmFsdWUgaW4g
dGhlIHBhc3QuIEhvd2V2ZXIsIGlmIHdlCisgICAgICogYXJlIHJlc3VtaW5nIGZyb20gc3VzcGVu
ZCwgdHJlYXQgYW55IHdyYXAgYXMgcGFzdCBzaW5jZSB0aGUgdmFsdWUKKyAgICAgKiBpcyB1bmxp
a2VseSB0byBiZSAnc21hbGwnLgogICAgICAqLwogICAgIGlmICggKGludDY0X3QpZGlmZiA8IDAg
KQotICAgICAgICBkaWZmID0gKHRpbWVyX2lzXzMyYml0KGgsIHRuKSAmJiAoLWRpZmYgPiBIUEVU
X1RJTllfVElNRV9TUEFOKSkKKyAgICAgICAgZGlmZiA9ICh0aW1lcl9pc18zMmJpdChoLCB0bikg
JiYgKC1kaWZmID4gSFBFVF9USU5ZX1RJTUVfU1BBTikgJiYKKyAgICAgICAgICAgICAgICAhcmVz
dW1lKQogICAgICAgICAgICAgPyAodWludDMyX3QpZGlmZiA6IDA7CiAKICAgICBkZXN0cm95X3Bl
cmlvZGljX3RpbWUoJmgtPnB0W3RuXSk7CkBAIC01NDcsNyArNTUwLDcgQEAgc3RhdGljIGludCBo
cGV0X3dyaXRlKAogICAgIHsKICAgICAgICAgaSA9IGZpbmRfZmlyc3Rfc2V0X2JpdChzdGFydF90
aW1lcnMpOwogICAgICAgICBfX2NsZWFyX2JpdChpLCAmc3RhcnRfdGltZXJzKTsKLSAgICAgICAg
aHBldF9zZXRfdGltZXIoaCwgaSwgZ3Vlc3RfdGltZSk7CisgICAgICAgIGhwZXRfc2V0X3RpbWVy
KGgsIGksIGd1ZXN0X3RpbWUsIGZhbHNlKTsKICAgICB9CiAKICN1bmRlZiBzZXRfc3RvcF90aW1l
cgpAQCAtNjkyLDcgKzY5NSw3IEBAIHN0YXRpYyBpbnQgaHBldF9sb2FkKHN0cnVjdCBkb21haW4g
KmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQogICAgIGlmICggaHBldF9lbmFibGVkKGhwKSAp
CiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgSFBFVF9USU1FUl9OVU07IGkrKyApCiAgICAgICAg
ICAgICBpZiAoIHRpbWVyX2VuYWJsZWQoaHAsIGkpICkKLSAgICAgICAgICAgICAgICBocGV0X3Nl
dF90aW1lcihocCwgaSwgZ3Vlc3RfdGltZSk7CisgICAgICAgICAgICAgICAgaHBldF9zZXRfdGlt
ZXIoaHAsIGksIGd1ZXN0X3RpbWUsIHRydWUpOwogCiAgICAgd3JpdGVfdW5sb2NrKCZocC0+bG9j
ayk7CiAKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
