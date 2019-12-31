Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CD12D9DD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 16:33:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imJTU-0006zS-CS; Tue, 31 Dec 2019 15:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gg/0=2V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1imJTS-0006zN-Aw
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 15:30:22 +0000
X-Inumbo-ID: 74bdb12c-2be2-11ea-a13c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74bdb12c-2be2-11ea-a13c-12813bfff9fa;
 Tue, 31 Dec 2019 15:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577806221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vqE+Pv/l4qxki7aAD/QmpOMktlJ/isEJYbb+8Sud4Kc=;
 b=NU4nOPeQCdP04PXNYmc/E0d81kkQQrlKGK/PzFwLJzc/HebPTTrOkusD
 PTJxG6OnD4D4hJUT2tWJ8p5ajOAusGhnOUXFcSEMI/fHyMrDM2SzDn9sl
 OdnO5C3dCn1QaY8wq6r6OLW6jUuTAMy3j/JvXCJ3PISxxDnzGgvBh07Uh c=;
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
IronPort-SDR: uwKOhXtC7dSEUys3Z85XLcAbzE3Dz3cExfFDJw5vD3KrTBT6u7cr8h9upXc1NcNFSVitobaHYP
 H2nN5i3CkDa8WsdnbtLfhd24onVRsqJv30TkCwuWFoGcAUgt367bOoud7v3La7zHtqqnG0NW+F
 9zbHozIWHSbMxEEyecF4qrX1C4iI1pqW3r5fxl7WWpeIyY7OE1vLWj2CU8lKVgNS9o14ePD92A
 UJ2DDUB4PD7nMVAAHgIQCj240TzLNIm89MVkE7/Pyp/YhKL2utGW/ViPx0XVxx39Uy121nxrAD
 yr8=
X-SBRS: 2.7
X-MesageID: 10688399
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,379,1571716800"; d="scan'208";a="10688399"
Date: Tue, 31 Dec 2019 16:30:13 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Message-ID: <20191231152925.GK11756@Air-de-Roger>
References: <osstest-145393-mainreport@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <osstest-145393-mainreport@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [xen-unstable test] 145393: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMDg6MTk6MjNQTSArMDAwMCwgb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyb3RlOgo+IGZsaWdodCAxNDUzOTMgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4g
aHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NTM5My8K
PiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5k
IGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoK
PiAgdGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0ZWQtaW50ZWwgMTcgZGViaWFuLWh2bS1pbnN0
YWxsL2wxL2wyIGZhaWwgUkVHUi4gdnMuIDE0NTAyNQoKV2hpbGUgZGE5MjkwNjM5ZWI1ZDZhYyBk
aWQgZml4IHRoZSB2bWxhdW5jaCBlcnJvciwgbm93IHRoZSBMMSBndWVzdApzZWVtcyB0byBsb29z
ZSBpbnRlcnJ1cHRzOgoKWyAgNDEyLjEyNzA3OF0gTkVUREVWIFdBVENIRE9HOiBldGgwIChlMTAw
MCk6IHRyYW5zbWl0IHF1ZXVlIDAgdGltZWQgb3V0ClsgIDQxMi4xNTE4MzddIC0tLS0tLS0tLS0t
LVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQpbICA0MTIuMTY0MjgxXSBXQVJOSU5HOiBDUFU6IDAg
UElEOiAwIGF0IG5ldC9zY2hlZC9zY2hfZ2VuZXJpYy5jOjMyMCBkZXZfd2F0Y2hkb2crMHgyNTIv
MHgyNjAKWyAgNDEyLjE4NTgyMV0gTW9kdWxlcyBsaW5rZWQgaW46IHhlbl9nbnRhbGxvYyBleHQ0
IG1iY2FjaGUgamJkMiBlMTAwMCBzeW01M2M4eHgKWyAgNDEyLjIwNDM5OV0gQ1BVOiAwIFBJRDog
MCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNC4xNC4xNTArICMxClsgIDQxMi4yMjM5ODhd
IEhhcmR3YXJlIG5hbWU6IFhlbiBIVk0gZG9tVSwgQklPUyA0LjE0LXVuc3RhYmxlIDEyLzMwLzIw
MTkKWyAgNDEyLjI0MTY1N10gdGFzazogZmZmZmZmZmY4MjIxMzQ4MCB0YXNrLnN0YWNrOiBmZmZm
ZmZmZjgyMjAwMDAwClsgIDQxMi4yNTY5NzldIFJJUDogZTAzMDpkZXZfd2F0Y2hkb2crMHgyNTIv
MHgyNjAKWyAgNDEyLjI2ODQ0NF0gUlNQOiBlMDJiOmZmZmY4ODgwMWZjMDNlOTAgRUZMQUdTOiAw
MDAxMDI4NgpbICA0MTIuMjgxNzI3XSBSQVg6IDAwMDAwMDAwMDAwMDAwMzkgUkJYOiAwMDAwMDAw
MDAwMDAwMDAwIFJDWDogMDAwMDAwMDAwMDAwMDAwMApbICA0MTIuMzAwMDk3XSBSRFg6IGZmZmY4
ODgwMWZjMWRlNzAgUlNJOiBmZmZmODg4MDFmYzE2Mjk4IFJESTogZmZmZjg4ODAxZmMxNjI5OApb
ICA0MTIuMzE4MjgzXSBSQlA6IGZmZmY4ODgwMDZjNmU0MWMgUjA4OiAwMDAwMDAwMDAwMDFmMDY2
IFIwOTogMDAwMDAwMDAwMDAwMDIzYgpbICA0MTIuMzM2NTQwXSBSMTA6IGZmZmY4ODgwMWZjMWEz
ZjAgUjExOiBmZmZmZmZmZjgyODdkOTZkIFIxMjogZmZmZjg4ODAwNmM2ZTAwMApbICA0MTIuMzU0
NjQzXSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmODg4MDA2ZTNhYzgwIFIxNTogMDAw
MDAwMDAwMDAwMDAwMQpbICA0MTIuMzczMDM0XSBGUzogIDAwMDA3ZmEwNTI5M2VjYzAoMDAwMCkg
R1M6ZmZmZjg4ODAxZmMwMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgIDQxMi4z
OTMzNjddIENTOiAgZTAzMyBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMK
WyAgNDEyLjQwODExMl0gQ1IyOiAwMDAwN2ZkODBmZjE2MDAwIENSMzogMDAwMDAwMDAwY2U3ODAw
MCBDUjQ6IDAwMDAwMDAwMDAwNDA2NjAKWyAgNDEyLjQyNjMzOF0gQ2FsbCBUcmFjZToKWyAgNDEy
LjQzMjc0N10gIDxJUlE+ClsgIDQxMi40MzgxMDJdICA/IGRldl9kZWFjdGl2YXRlX3F1ZXVlLmNv
bnN0cHJvcC4zMysweDUwLzB4NTAKWyAgNDEyLjQ1MTg5Nl0gIGNhbGxfdGltZXJfZm4rMHgyYi8w
eDEzMApbICA0MTIuNDY0MjA4XSAgcnVuX3RpbWVyX3NvZnRpcnErMHgzZDgvMHg0YjAKWyAgNDEy
LjQ3NDU5OF0gID8gaGFuZGxlX2lycV9ldmVudF9wZXJjcHUrMHgzYy8weDUwClsgIDQxMi40ODY0
MjZdICBfX2RvX3NvZnRpcnErMHgxMTYvMHgyY2UKWyAgNDEyLjQ5NTg4M10gIGlycV9leGl0KzB4
Y2QvMHhlMApbICA0MTIuNTAzOTk5XSAgeGVuX2V2dGNobl9kb191cGNhbGwrMHgyNy8weDQwClsg
IDQxMi41MTQ2MjZdICB4ZW5fZG9faHlwZXJ2aXNvcl9jYWxsYmFjaysweDI5LzB4NDAKWyAgNDEy
LjUyNjY4NF0gIDwvSVJRPgpbICA0MTIuNTMyMjUyXSBSSVA6IGUwMzA6eGVuX2h5cGVyY2FsbF9z
Y2hlZF9vcCsweGEvMHgyMApbICA0MTIuNTQ1MDM0XSBSU1A6IGUwMmI6ZmZmZmZmZmY4MjIwM2Vh
MCBFRkxBR1M6IDAwMDAwMjQ2ClsgIDQxMi41NTgzNDddIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBS
Qlg6IGZmZmZmZmZmODIyMTM0ODAgUkNYOiBmZmZmZmZmZjgxMDAxM2FhClsgIDQxMi41NzYzOTBd
IFJEWDogZmZmZmZmZmY4MjI0ODNlOCBSU0k6IGRlYWRiZWVmZGVhZGYwMGQgUkRJOiBkZWFkYmVl
ZmRlYWRmMDBkClsgIDQxMi41OTQ1ODBdIFJCUDogMDAwMDAwMDAwMDAwMDAwMCBSMDg6IGZmZmZm
ZmZmZmZmZmZmZmYgUjA5OiAwMDAwMDAwMDAwMDAwMDAwClsgIDQxMi42MTI4MzFdIFIxMDogZmZm
ZmZmZmY4MjIwM2UzMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiBmZmZmZmZmZjgyMjEzNDgw
ClsgIDQxMi42MzA5ODBdIFIxMzogMDAwMDAwMDAwMDAwMDAwMCBSMTQ6IGZmZmZmZmZmODIyMTM0
ODAgUjE1OiBmZmZmZmZmZjgyMjM4ZTgwClsgIDQxMi42NDkxMzhdICA/IHhlbl9oeXBlcmNhbGxf
c2NoZWRfb3ArMHhhLzB4MjAKWyAgNDEyLjY2MDY3MV0gID8geGVuX3NhZmVfaGFsdCsweGMvMHgy
MApbICA0MTIuNjcwMTc3XSAgPyBkZWZhdWx0X2lkbGUrMHgyMy8weDExMApbICA0MTIuNjc5ODYy
XSAgPyBkb19pZGxlKzB4MTY4LzB4MWYwClsgIDQxMi42ODg2NjZdICA/IGNwdV9zdGFydHVwX2Vu
dHJ5KzB4MTQvMHgyMApbICA0MTIuNjk5MDU5XSAgPyBzdGFydF9rZXJuZWwrMHg0YzMvMHg0Y2IK
WyAgNDEyLjcwODgwN10gID8geGVuX3N0YXJ0X2tlcm5lbCsweDUyNy8weDUzMApbICA0MTIuNzIw
Nzc2XSBDb2RlOiBjYiBlOSBhMCBmZSBmZiBmZiAwZiAwYiA0YyA4OSBlNyBjNiAwNSAwMCBkNiBj
NiAwMCAwMSBlOCA4MiA4OSBmZCBmZiA4OSBkOSA0OCA4OSBjMiA0YyA4OSBlNiA0OCBjNyBjNyAz
MCBmYiAwMSA4MiBlOCA0NCBlOSBhNiBmZiA8MGY+IDBiIGU5IDU4IGZlIGZmIGZmIDBmIDFmIDgw
IDAwIDAwIDAwIDAwIDQxIDU3IDQxIDU2IDQxIDU1IDQxIApbICA0MTIuNzY3OTAwXSAtLS1bIGVu
ZCB0cmFjZSBkOWUzNWMzZjcyNWY0YjU3IF0tLS0KWyAgNDEyLjc4MDE5M10gZTEwMDAgMDAwMDow
MDowNS4wIGV0aDA6IFJlc2V0IGFkYXB0ZXIKClRoaXMgb25seSBoYXBwZW5zIHdoZW4gTDEgaXMg
dXNpbmcgeDJBUElDIGFuZCBhIGd1ZXN0IGhhcyBiZWVuCmxhdW5jaGVkIChieSBMMSkuIFByaW9y
IHRvIGxhdW5jaGluZyBhbnkgZ3Vlc3QgTDEgc2VlbXMgdG8gYmUgZnVsbHkKZnVuY3Rpb25hbC4g
SSdtIGN1cnJlbnRseSB0cnlpbmcgdG8gZmlndXJlIG91dCBob3cvd2hlbiB0aGF0IGludGVycnVw
dAppcyBsb3N0LCB3aGljaCBJIGJldCBpdCdzIHJlbGF0ZWQgdG8gdGhlIG1lcmdpbmcgb2Ygdm1j
cyBiZXR3ZWVuIEwxCmFuZCBMMiBkb25lIGluIEwwLgoKQXMgYSB3b3JrYXJvdW5kIEkgY291bGQg
ZGlzYWJsZSBleHBvc2luZyB4MkFQSUMgaW4gQ1BVSUQgd2hlbiBuZXN0ZWQKdmlydHVhbGl6YXRp
b24gaXMgZW5hYmxlZCBvbiBJbnRlbC4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
