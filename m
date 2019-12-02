Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B77F10EC29
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 16:17:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibnPU-0004K4-VJ; Mon, 02 Dec 2019 15:14:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PMC0=ZY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ibnPT-0004Jz-CC
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 15:14:47 +0000
X-Inumbo-ID: 7941d97c-1516-11ea-a40a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7941d97c-1516-11ea-a40a-12813bfff9fa;
 Mon, 02 Dec 2019 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575299685;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=09xHbG7Mp2L85s8oY94Lnw3F34vHzW4F1jYlz0rr4JA=;
 b=UtSPNhCDVAjm8lGMfXwQICFjR7eELwTZaSsKkLHwtmCPjdlU6sPnRyTC
 uh+dFzSuYnP1ZBWihFOxasrkDfkZ8ApHd8baCH4sTx5DtXELTnRKUyryH
 /dqExTImdLj4mBuUfBl8R4MLepj/B3fFbqv9bhocRBvhNOg4hKBFQVM4h 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BgbAmNeaoCMdkLSNa+Zdh748r/+LXYiJ9Yd1T5WlQavJ4YS2X0h4XFf5oXAQVGeL35RBQxO3/U
 Z/YTAG2n/uHFCwp8pAGWjhgdehXlrDXZl3odYk4Ug/3xq9MMzpvJKim4pfXD96VoZSbUNXzXqm
 lgJxV2SkyMPu4ZOJOhSxhNcaiSgGiUl35Q/lihJC3YAq27/jM5ZTLV92P5ms7UdqO27NupyYym
 wM498+sCLXBaxv1yOJnbd6t1uoOEDQlHXLFvFLlB2Ztxl0mb0Dq4Yk+DUIe9hLgMJf1227w31K
 174=
X-SBRS: 2.7
X-MesageID: 9610387
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,268,1571716800"; 
   d="scan'208";a="9610387"
To: Yi Sun <yi.y.sun@linux.intel.com>, <xen-devel@lists.xenproject.org>
References: <1575271488-12126-1-git-send-email-yi.y.sun@linux.intel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <00e4579f-87ff-9502-4cc7-2c4add3102d3@citrix.com>
Date: Mon, 2 Dec 2019 15:14:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1575271488-12126-1-git-send-email-yi.y.sun@linux.intel.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4] psr: fix bug which may cause crash
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
Cc: jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMTIvMjAxOSAwNzoyNCwgWWkgU3VuIHdyb3RlOgo+IER1cmluZyB0ZXN0LCB3ZSBmb3Vu
ZCBhIGNyYXNoIG9uIFhlbiB3aXRoIGJlbG93IHRyYWNlLgo+IChYRU4pIFhlbiBjYWxsIHRyYWNl
Ogo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDJhMDY1YT5dIFIgcHNyLmMjbDNfY2RwX3dyaXRlX21z
cisweDFlLzB4MjIKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyYTA4NTg+XSBGIHBzci5jI2RvX3dy
aXRlX3Bzcl9tc3JzKzB4NmQvMHgxMDkKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyM2UwMDA+XSBG
IHNtcF9jYWxsX2Z1bmN0aW9uX2ludGVycnVwdCsweDVhLzB4YWMKPiAoWEVOKSAgICBbPGZmZmY4
MmQwODAyYTJiODk+XSBGIGNhbGxfZnVuY3Rpb25faW50ZXJydXB0KzB4MjAvMHgzNAo+IChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDI4MmM2ND5dIEYgZG9fSVJRKzB4MTc1LzB4NmFlCj4gKFhFTikgICAg
WzxmZmZmODJkMDgwMzhiOGJhPl0gRiBjb21tb25faW50ZXJydXB0KzB4MTBhLzB4MTIwCj4gKFhF
TikgICAgWzxmZmZmODJkMDgwMmVjNjE2Pl0gRiBjcHVfaWRsZS5jI2FjcGlfaWRsZV9kb19lbnRy
eSsweDlkLzB4YjEKPiAoWEVOKSAgICBbPGZmZmY4MmQwODAyZWNjMDE+XSBGIGNwdV9pZGxlLmMj
YWNwaV9wcm9jZXNzb3JfaWRsZSsweDQxZC8weDYyNgo+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDI3
MzUzYj5dIEYgZG9tYWluLmMjaWRsZV9sb29wKzB4YTUvMHhhNwo+IChYRU4pCj4gKFhFTikKPiAo
WEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gKFhFTikgUGFu
aWMgb24gQ1BVIDIwOgo+IChYRU4pIEdFTkVSQUwgUFJPVEVDVElPTiBGQVVMVAo+IChYRU4pIFtl
cnJvcl9jb2RlPTAwMDBdCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgo+Cj4gVGhlIGJ1ZyBoYXBwZW5zIHdoZW4gQ0RQIGFuZCBNQkEgY28tZXhpc3QgYW5k
IE1CQSBDT1NfTUFYIGlzIGJpZ2dlcgo+IHRoYW4gQ0RQIENPU19NQVguIEUuZy4gTUJBIGhhcyA4
IENPUyByZWdpc3RlcnMgYnV0IENEUCBvbmx5IGhhdmUgNi4KPiBXaGVuIHNldHRpbmcgTUJBIHRo
cm90dGxpbmcgdmFsdWUgZm9yIHRoZSA3dGggZ3Vlc3QsIHRoZSB2YWx1ZSBhcnJheQo+IHdvdWxk
IGJlOgo+ICAgICArLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLSsKPiAgICAgfCBEYXRhIGRlZmF1bHQgdmFsIHwgQ29kZSBkZWZhdWx0IHZhbCB8IE1C
QSB0aHJvdHRsZSB8Cj4gICAgICstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tKwo+Cj4gVGhlbiwgQ09TIGlkIDcgd2lsbCBiZSBzZWxlY3RlZCBmb3Ig
d3JpdHRpbmcgdGhlIHZhbHVlcy4gV2Ugc2hvdWxkCj4gYXZvaWQgd3JpdHRpbmcgQ0RQIGRhdGEv
Y29kZSB2YWx1bGVzIHRvIENPUyBpZCA3IE1TUiBiZWNhdXNlIGl0Cj4gZXhjZWVkcyB0aGUgQ0RQ
IENPU19NQVguCj4KPiBTaWduZWQtb2ZmLWJ5OiBZaSBTdW4gPHlpLnkuc3VuQGxpbnV4LmludGVs
LmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
