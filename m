Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D25122B0A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 13:15:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBix-0007U1-TF; Tue, 17 Dec 2019 12:13:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihBiw-0007Tv-CR
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 12:13:10 +0000
X-Inumbo-ID: 96672a6e-20c6-11ea-8eb4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96672a6e-20c6-11ea-8eb4-12813bfff9fa;
 Tue, 17 Dec 2019 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576584789;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k2T/zMhYMjbhHnwpic639vfncPLOoG3/TDAXAvmMaP4=;
 b=bOVAbVK+lrGGNRuhU9zuuOXHU6kh18nkECUP+TFGAjn7a5+M745HZxKf
 ff+6CuHVf7WTGNNQAKoG2WsZ1KL5YbMPv++r+3cxlkPU2noOi768kULmc
 QGUo0M9IZzVIuYgoUNpQ+VppYHYJAjb7ZTiS0p6TzPsTEJgfE77EB2qVb g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EjYvHOMD9GcIYoig0HE71dvJKCdRK4psm9puWXntD92hbGu0/Pn930jHHOqtbg2ca8rXT5+Hya
 4SD/aj7ydvaouw/WrzOPasizd5JhPxBQIQwB/g5K8yO6RuCpSdOD0dzJcv+7ybzgg80YvTP+Tt
 LaE+wLLr2Qx1w300W+JOzb+tlKw0qWImrwqSGiSCDvPClxn6lIXZ/vXO8TEa6QiA4gL6ufJsHx
 ZjL1EXHPxgDYNPrk2aPGmKg3klWc6DmFMS+pPWQo1hMB/2l3GQsleC/AHWxwATCrONo0sKWvZu
 0Mc=
X-SBRS: 2.7
X-MesageID: 10160090
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10160090"
Date: Tue, 17 Dec 2019 13:13:02 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217121302.GW11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-4-andrew.cooper3@citrix.com>
 <20191217120440.GU11756@Air-de-Roger>
 <510551f6-0edd-2f34-9078-5a46d49b9f12@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <510551f6-0edd-2f34-9078-5a46d49b9f12@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 3/6] x86/suspend: Don't save unnecessary GPRs
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTI6MTA6NTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8xMi8yMDE5IDEyOjA0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TIGIveGVuL2FyY2gv
eDg2L2FjcGkvd2FrZXVwX3Byb3QuUwo+ID4+IGluZGV4IDM1ZmQ3YTVlOWYuLjJmNmM4ZTE4ZWYg
MTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUwo+ID4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKPiA+PiBAQCAtMTEsMjQgKzExLDE0
IEBACj4gPj4gICNkZWZpbmUgUkVGKHgpICAgICAgICAgIHgoJXJpcCkKPiA+PiAgCj4gPj4gIEVO
VFJZKGRvX3N1c3BlbmRfbG93bGV2ZWwpCj4gPj4gKyAgICAgICAgcHVzaCAgICAlcmJwCj4gPj4g
KyAgICAgICAgcHVzaCAgICAlcmJ4Cj4gPj4gKyAgICAgICAgcHVzaCAgICAlcjEyCj4gPj4gKyAg
ICAgICAgcHVzaCAgICAlcjEzCj4gPj4gKyAgICAgICAgcHVzaCAgICAlcjE0Cj4gPj4gKyAgICAg
ICAgcHVzaCAgICAlcjE1Cj4gPiBJIHdhcyBleHBlY3RpbmcgWGVuIGhhZCBhIG1hY3JvIGZvciB0
aGlzIChhbmQgdGhlIHJlc3RvcmUKPiA+IGNvdW50ZXJwYXJ0KSwgYnV0IEkgaGF2ZW4ndCBmb3Vu
ZCBhbnkgKG5laXRoZXIgYW55IG90aGVyIHBsYWNlcyB3aGVyZQo+ID4gaXQgd291bGQgYmUgdXNl
ZnVsKS4KPiAKPiBXZSBoYXZlIG1hY3JvcyBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcgYWxsIEdQ
UnMgYXMgcGFydCBvZiBhbgo+IGV4Y2VwdGlvbiwgYnV0IHRoaXMgaXMganVzdCByZWd1bGFyIGZ1
bmN0aW9uIHByb2xvZ3VlL2VwaWxvZ3VlIGxvZ2ljCj4gKHdoaWNoIGhhcHBlbnMgdG8gYmUgaGFu
ZCB3cml0dGVuIGFzbSBiZWNhdXNlIHRoaXMgZnVuY3Rpb24gaXNuJ3QgcXVpdGUKPiBhIHJlZ3Vs
YXIgZnVuY3Rpb24pLgoKWWVzLCBJJ3ZlIGZvdW5kIFNBVkVfQUxMLCBidXQgYXMgeW91IHNheSB0
aGF0J3Mgb3ZlcmtpbGwgKGFuZCBpdCdzCnBhcnRseSB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGF2
b2lkIGhlcmUpLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
