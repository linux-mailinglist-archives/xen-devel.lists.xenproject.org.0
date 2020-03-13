Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65A18439C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:27:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgZm-0002W1-JU; Fri, 13 Mar 2020 09:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCgZl-0002Vm-E3
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:25:53 +0000
X-Inumbo-ID: a243c916-650c-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a243c916-650c-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 09:25:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34A50B0BA;
 Fri, 13 Mar 2020 09:25:52 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Message-ID: <9460a5f8-5b6e-bba9-79fc-dae54cc6b348@suse.com>
Date: Fri, 13 Mar 2020 10:25:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/4] x86/time: reduce rounding errors in
 calculations
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxhaW4gKHVuc2lnbmVkKSBpbnRlZ2VyIGRpdmlzaW9uIHNpbXBseSB0cnVuY2F0ZXMgdGhlIHJl
c3VsdHMuIFRoZQpvdmVyYWxsIGVycm9ycyBhcmUgc21hbGxlciB0aG91Z2ggaWYgd2UgdXNlIHBy
b3BlciByb3VuZGluZy4gKEV4dGVuZAp0aGlzIHRvIHRoZSBwdXJlbHkgY29zbWV0aWMgYXNwZWN0
IG9mIHRpbWUuYydzIGZyZXFfc3RyaW5nKCksIHdoaWNoCmJlZm9yZSB0aGlzIGNoYW5nZSBJJ3Zl
IGZyZXF1ZW50bHkgb2JzZXJ2ZWQgdG8gcmVwb3J0IGUuZy4gTk4uOTk5TUh6CkhQRVQgY2xvY2sg
c3BlZWRzLikKClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
LS0tCldlIGNvdWxkIHN3aXRjaCBhdCBsZWFzdCB0aGUgZmlyc3QgZGl2L3JlbSBwYWlyIGluIGNh
bGlicmF0ZV9BUElDX2Nsb2NrKCkKdG8gdXNlIGRvX2RpdigpLCBidXQgdGhpcyB3b3VsZCBpbXBs
eSBzd2l0Y2hpbmcgYnVzX2ZyZXEgKGFuZCB0aGVuIGFsc28KcmVzdWx0KSB0byB1bnNpZ25lZCBp
bnQgKGFzIHRoZSBkaXZpc29yIGhhcyB0byBiZSAzMi1iaXQpLiBXaGlsZSBJIHRoaW5rCnRoZXJl
J3MgcHJldHR5IGxpdHRsZSByaXNrIGZvciBidXMgZnJlcXVlbmNpZXMgdG8gZ28gYmV5b25kIDRH
SHogaW4gdGhlCm5leHQgc28gbWFueSB5ZWFycywgSSBzdGlsbCB3YXNuJ3QgY2VydGFpbiBlbm91
Z2ggdGhpcyB3b3VsZCBiZSBhIHdlbGNvbWUKY2hhbmdlLgoKLS0tIGEveGVuL2FyY2gveDg2L2Fw
aWMuYworKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCkBAIC0xMjYxLDcgKzEyNjEsOSBAQCBzdGF0
aWMgaW50IF9faW5pdCBjYWxpYnJhdGVfQVBJQ19jbG9jayh2CiAgICAgLyogc2V0IHVwIG11bHRp
cGxpZXJzIGZvciBhY2N1cmF0ZSB0aW1lciBjb2RlICovCiAgICAgYnVzX2ZyZXEgICA9IHJlc3Vs
dCpIWjsKICAgICBidXNfY3ljbGUgID0gKHUzMikgKDEwMDAwMDAwMDAwMDBMTC9idXNfZnJlcSk7
IC8qIGluIHBpY28gc2Vjb25kcyAqLworICAgIGJ1c19jeWNsZSArPSAoMTAwMDAwMDAwMDAwMFVM
ICUgYnVzX2ZyZXEpICogMiA+IGJ1c19mcmVxOwogICAgIGJ1c19zY2FsZSAgPSAoMTAwMCoyNjIx
NDQpL2J1c19jeWNsZTsKKyAgICBidXNfc2NhbGUgKz0gKCgxMDAwICogMjYyMTQ0KSAlIGJ1c19j
eWNsZSkgKiAyID4gYnVzX2N5Y2xlOwogCiAgICAgYXBpY19wcmludGsoQVBJQ19WRVJCT1NFLCAi
Li4uLi4gYnVzX3NjYWxlID0gJSN4XG4iLCBidXNfc2NhbGUpOwogICAgIC8qIHJlc2V0IEFQSUMg
dG8gemVybyB0aW1lb3V0IHZhbHVlICovCi0tLSBhL3hlbi9hcmNoL3g4Ni9ocGV0LmMKKysrIGIv
eGVuL2FyY2gveDg2L2hwZXQuYwpAQCAtNzk5LDkgKzc5OSw5IEBAIHU2NCBfX2luaXQgaHBldF9z
ZXR1cCh2b2lkKQogICAgIGhwZXRfcmVzdW1lKGhwZXRfYm9vdF9jZmcpOwogCiAgICAgaHBldF9y
YXRlID0gMTAwMDAwMDAwMDAwMDAwMFVMTDsgLyogMTBeMTUgKi8KLSAgICAodm9pZClkb19kaXYo
aHBldF9yYXRlLCBocGV0X3BlcmlvZCk7CisgICAgbGFzdCA9IGRvX2RpdihocGV0X3JhdGUsIGhw
ZXRfcGVyaW9kKTsKIAotICAgIHJldHVybiBocGV0X3JhdGU7CisgICAgcmV0dXJuIGhwZXRfcmF0
ZSArIChsYXN0ICogMiA+IGhwZXRfcGVyaW9kKTsKIH0KIAogdm9pZCBocGV0X3Jlc3VtZSh1MzIg
KmJvb3RfY2ZnKQotLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni90
aW1lLmMKQEAgLTI3NSw3ICsyNzUsMTAgQEAgc3RhdGljIGNoYXIgKmZyZXFfc3RyaW5nKHU2NCBm
cmVxKQogewogICAgIHN0YXRpYyBjaGFyIHNbMjBdOwogICAgIHVuc2lnbmVkIGludCB4LCB5Owot
ICAgIHkgPSAodW5zaWduZWQgaW50KWRvX2RpdihmcmVxLCAxMDAwMDAwKSAvIDEwMDA7CisKKyAg
ICBpZiAoIGRvX2RpdihmcmVxLCAxMDAwKSA+IDUwMCApCisgICAgICAgICsrZnJlcTsKKyAgICB5
ID0gKHVuc2lnbmVkIGludClkb19kaXYoZnJlcSwgMTAwMCk7CiAgICAgeCA9ICh1bnNpZ25lZCBp
bnQpZnJlcTsKICAgICBzbnByaW50ZihzLCBzaXplb2YocyksICIldS4lMDN1TUh6IiwgeCwgeSk7
CiAgICAgcmV0dXJuIHM7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
