Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DD9D8482
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 01:32:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKWG8-0006ke-Ln; Tue, 15 Oct 2019 23:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+BOK=YI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iKWG7-0006kZ-7m
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 23:29:43 +0000
X-Inumbo-ID: a9c3b5ea-efa3-11e9-8aca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9c3b5ea-efa3-11e9-8aca-bc764e2007e4;
 Tue, 15 Oct 2019 23:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571182182;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=in8D4WCrNlkj5YM9Sjo/urHgASDRxlja5oGKjr8GoSA=;
 b=IoF3f841fSCDx7o0Z0QQ/DgZzhrwxROGu4ZekjExGmcaEyCBeXelvgg+
 bLP0ktVEqUcWJtyTMFaeUdcM/793o6JZo3RnSGgHiLRlx9e5qig8Egbev
 XH+e27HKOhvlG4RnW4YfYuUwpGk5zMB2f1y7ZmTlp5aXdFpXaAzV4vfdl w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Gkn5O12NPgJ/kO443tc9SM61t0WWvmo3YhPc4gVfFJT8XoMnFr6qkLu88S6GkDbt89Z6iPC5XN
 u4fhkCTReslDnjErsk1SUf4a/ihBwHB1H8uiXAlEgfyCjUlsgFImhPDl+wb7cuF+GQfQ53ziM3
 87alT1hYYWYgFPVRoU5WD7oYlq+HojGk8zgn+m8ydag6NwC2Xxa7I3K218p50bLs0tVLBZq7is
 dUatLS9WRwGkdkAvHAQDvCNLrn0laHAepLlPcNtqyfGUdi+YqXubRRT5Y4YvRyDYlhY8jZ71oH
 DoY=
X-SBRS: 2.7
X-MesageID: 7255016
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,301,1566878400"; 
   d="scan'208";a="7255016"
To: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
 <xen-devel@lists.xenproject.org>
References: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bc0b45b1-be20-e1f2-81dc-cbfec71a6599@citrix.com>
Date: Wed, 16 Oct 2019 00:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] Invalid guest state in Xen master,
 dom0 linux-5.3.6, domU windows 10
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTAvMjAxOSAyMjozNSwgSMOla29uIEFsc3RhZGhlaW0gd3JvdGU6Cj4gR290IHRoaXMg
anVzdCBub3csIGFzIG15IHdpbmRvd3MgZG9tVSBkaWVkOgo+Cj4gKFhFTikgWzIwMTktMTAtMTUg
MjE6MjM6NDRdIGQ3djAgdm1lbnRyeSBmYWlsdXJlIChyZWFzb24gMHg4MDAwMDAyMSk6Cj4gSW52
YWxpZCBndWVzdCBzdGF0ZSAoMCkKPiAoWEVOKSBbMjAxOS0xMC0xNSAyMToyMzo0NF0gKioqKioq
KioqKioqKiBWTUNTIEFyZWEgKioqKioqKioqKioqKioKPiAoWEVOKSBbMjAxOS0xMC0xNSAyMToy
Mzo0NF0gKioqIEd1ZXN0IFN0YXRlICoqKgo+IChYRU4pIFsyMDE5LTEwLTE1IDIxOjIzOjQ0XSBD
UjA6IGFjdHVhbD0weDAwMDAwMDAwODAwNTAwMzEsCj4gc2hhZG93PTB4MDAwMDAwMDA4MDA1MDAz
MSwgZ2hfbWFzaz1mZmZmZmZmZmZmZmZmZmZmCj4gKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRd
IENSNDogYWN0dWFsPTB4MDAwMDAwMDAwMDE3MjY3OCwKPiBzaGFkb3c9MHgwMDAwMDAwMDAwMTcw
Njc4LCBnaF9tYXNrPWZmZmZmZmZmZmZlOGY4NjAKPiAoWEVOKSBbMjAxOS0xMC0xNSAyMToyMzo0
NF0gQ1IzID0gMHgwMDAwMDAwMDAwMWFhMDAyCj4gKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRd
IFJTUCA9IDB4ZmZmZjkwOGU0NDBmYWU2OAo+ICgweGZmZmY5MDhlNDQwZmFlNjgpwqAgUklQID0g
MHhmZmZmOTU4MWUxNWQ1NjBiICgweGZmZmY5NTgxZTE1ZDU2MGIpCj4gKFhFTikgWzIwMTktMTAt
MTUgMjE6MjM6NDRdIFJGTEFHUz0weDAwMDAwMTk3ICgweDAwMDAwMTk3KcKgIERSNyA9Cj4gMHgw
MDAwMDAwMDAwMDAwNDAwCj4gKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NDRdIFN5c2VudGVyIFJT
UD0wMDAwMDAwMDAwMDAwMDAwCj4gQ1M6UklQPTAwMDA6MDAwMDAwMDAwMDAwMDAwMAo+IChYRU4p
IFsyMDE5LTEwLTE1IDIxOjIzOjQ0XcKgwqDCoMKgwqDCoMKgIHNlbMKgIGF0dHLCoCBsaW1pdMKg
wqAgYmFzZQo+IChYRU4pIFsyMDE5LTEwLTE1IDIxOjIzOjU2XSBwcmludGs6IDUyIG1lc3NhZ2Vz
IHN1cHByZXNzZWQuCj4gKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NTZdIFtWVC1EXWQ3OlBDSWU6
IHVubWFwIDAwMDA6ODE6MDAuMAo+IChYRU4pIFsyMDE5LTEwLTE1IDIxOjIzOjU2XSBbVlQtRF1k
MDpQQ0llOiBtYXAgMDAwMDo4MTowMC4wCj4gKFhFTikgWzIwMTktMTAtMTUgMjE6MjM6NTldIHBy
aW50azogMiBtZXNzYWdlcyBzdXBwcmVzc2VkLgo+IChYRU4pIFsyMDE5LTEwLTE1IDIxOjIzOjU5
XSBbVlQtRF1kNzpQQ0llOiB1bm1hcCAwMDAwOjAyOjAwLjAKClNhZGx5IHRoZXJlIGlzIGEgbGFy
Z2UgcXVhbnRpdHkgb2YgaW5mb3JtYXRpb24gbWlzc2luZyBoZXJlLgoKPgo+IHhlbl9jb21tYW5k
bGluZcKgwqDCoMKgwqDCoMKgIDogeGVuLmNmZyB4ZW4tbWFya2VyLTIxNQo+IGNvbnNvbGVfdGlt
ZXN0YW1wcz1kYXRlIGlvbW11PTEsaW50cG9zdCx2ZXJib3NlLGRlYnVnCj4gaW9tbXVfaW5jbHVz
aXZlX21hcHBpbmc9MSBjb20xPTU3NjAwLDhuMSBjb20yPTU3NjAwLDhuMQo+IGNvbnNvbGU9dmdh
LGNvbTIgZG9tMF9tYXhfdmNwdXM9OCBkb20wX21lbT04RyxtYXg6OEcKPiBjcHVmcmVxPXhlbjpw
ZXJmb3JtYW5jZSx2ZXJib3NlIHNtdD0wIG1heGNwdXM9MTIKPiBjb3JlX3Bhcmtpbmc9cGVyZm9y
bWFuY2Ugbm1pPWRvbTAgZ250dGFiX21heF9mcmFtZXM9MjU2Cj4gZ250dGFiX21heF9tYXB0cmFj
a19mcmFtZXM9MTAyNCB2Y3B1X21pZ3JhdGlvbl9kZWxheT0yMDAwCj4gdGlja2xlX29uZV9pZGxl
X2NwdT0xIHNwZWMtY3RybD1uby14ZW4gc2NoZWQ9Y3JlZGl0MiBtYXhfY3N0YXRlPTIKPiBjbG9j
a3NvdXJjZT10c2MgdHNjPXN0YWJsZTpzb2NrZXQgdGltZXJfc2xvcD01MDAwIGxvZ2x2bD1ub25l
L3dhcm5pbmcKPiBndWVzdF9sb2dsdmw9bm9uZS93YXJuaW5nCgoKLi4uIGFuZCB0aGlzIHdvdWxk
IGJlIHdoeS7CoCBDYW4geW91IGRyb3AgdGhlICJ2ZXJib3NlLGRlYnVnIiBmcm9tCmlvbW11PSwg
YW5kIHRoZSBsb2dsdmw9L2d1ZXN0X2xvZ2x2bD0gb24gdGhlIGVuZCwgYW5kIHJlcHJvZHVjZSB0
aGUKcHJvYmxlbSBhZ2Fpbj/CoCBUaGF0IHdheSwgd2Ugc2hvdWxkIGdldCB0aGUgZnVsbCBWTUNT
IEFyZWEgZHVtcCwgYW5kIEkKbWlnaHQgYmUgYWJsZSB0byBpZGVudGlmeSB3aGF0IHN0YXRlIHdh
cyBiZWluZyBjb21wbGFpbmVkIGFib3V0LgoKV2hhdCBoYXJkd2FyZSBpcyB0aGlzLCBhbmQgYXJl
IHdoYXQgaXMgdGhlIGdlbmVyYWwKY29uZmlndXJhdGlvbi93b3JrbG9hZCBvZiB0aGUgV2luMTAg
Z3Vlc3Q/CgpUaGFua3MsCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
