Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBED18381C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 18:58:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCS35-0003aq-Pj; Thu, 12 Mar 2020 17:55:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCS34-0003al-CV
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 17:55:10 +0000
X-Inumbo-ID: 9cd557ba-648a-11ea-b1f5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cd557ba-648a-11ea-b1f5-12813bfff9fa;
 Thu, 12 Mar 2020 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584035709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wmXM7g3/YVAlP6YrlOUv9cqHHtjL+lnoTDDjJFacAOM=;
 b=FX3yIsi6ATO8yitoba7sgY7TRgts/77xcrq4zWCYvuvSFPpUrtf67dQo
 ngMIkhAAh2Bi+wIu3WwBaaE34S7TXnhDqJxiF4HYV6GDIAvGtT8idCn+S
 AS+yKpsNqbbuzMt0GxeUOM3HyB6wj5x0ahynWv9z2QibETpzWxoNoJglC A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qr0QHXaZEO6n5BOHjInr/irFqIYg9b9v6cneANenFSO/icT+L8K3jFILKFEo8tZVdKO03VkxLL
 4fdba7k7Zq6XDmwsEbD9lgnRHNCWiITmqNf5RyxU1cFdekvBXlVTqRIuQcXG2miQjdZy7iKYnh
 0jfof6luU2OC41X7n34dvusvPKHndZHFGIwLFntb2LWfFX4thZi4HZJ+3LavRpc/Pf3bKuF7y/
 aGRidZBWqoSNgb17H7TAdy+OAhQyQe8Y68IgmrUbWxDc2+4LVcQBk+6wDkQ3aGHpJBXF/2RSol
 pz0=
X-SBRS: 2.7
X-MesageID: 14282002
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14282002"
Date: Thu, 12 Mar 2020 18:55:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200312175500.GL24458@Air-de-Roger.citrite.net>
References: <24170.26671.783256.460525@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24170.26671.783256.460525@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Stopping much Linux testing in Xen Project CI
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDQ6NDk6NTFQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTGludXggc3RhYmxlIGJyYW5jaGVzLCBhbmQgTGludXggdXBzdHJlYW0gdGlwLCBhcmUg
YmFkbHkgYnJva2VuIGFuZAo+IGhhdmUgYmVlbiBmb3IgbW9udGhzLiAgQXBwYXJlbnRseSBuby1v
bmUgaXMgYWJsZSB0byAob3IgaGFzIHRpbWUgdG8pCj4gdG8gaW52ZXN0aWdhdGUgYW5kIGZpeC4K
PiAKPiAgIGxpbnV4LTQuNCAgICAgICAgICAyMTggZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRl
ZAo+ICAgbGludXgtNC45ICAgICAgICAgIDEzNCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVk
Cj4gICBsaW51eC00LjE0ICAgICAgICAgMTM0IGRheXMgICAgICAgICB0byBiZSBzdXNwZW5kZWQK
PiAgIGxpbnV4LTQuMTkgICAgICAgICAxMzQgZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+
ICAgbGludXgtNS40ICAgICAgICAgICA1NSBkYXlzCj4gICBsaW51eC1hcm0teGVuICAgICB1cCB0
byBkYXRlCj4gICBsaW51eC1saW51cyAgICAgICAgMzcyIGRheXMgICAgICAgICB0byBiZSBzdXNw
ZW5kZWQKPiAKPiBUaGVzZSBhcmUgdGltZXMgc2luY2UgdGhlIGxhc3QgcHVzaCAtIGllLCBob3cg
bG9uZyBpdCBoYXMgYmVlbiBicm9rZW4uCj4gRXZpZGVudGx5IG5vLW9uZSBpcyBwYXlpbmcgYW55
IGF0dGVudGlvbiB0byB0aGlzLlsxXSAgSSBsb29rZWQgYXQgdGhlCj4gcmVwb3J0cyBteXNlbGYg
YW5kOgo+IAo+IE5lc3RlZCBIVk0gaXMgYnJva2VuIG9uIEludGVsIGluIGFsbCBvZiB0aGUgNC54
IGJyYW5jaGVzLgoKRldJVywgaXQncyB0aGUgRGViaWFuIGluc3RhbGxlciBrZXJuZWwgdGhlIG9u
ZSB0aGF0IGNyYXNoZXMgQUZBSUNULAphbGwgdGhlIGZhaWx1cmVzIGFyZToKClsgICAgMC4wMDAw
MDBdIExpbnV4IHZlcnNpb24gNC45LjAtNi1hbWQ2NCAoZGViaWFuLWtlcm5lbEBsaXN0cy5kZWJp
YW4ub3JnKSAoZ2NjIHZlcnNpb24gNi4zLjAgMjAxNzA1MTYgKERlYmlhbiA2LjMuMC0xOCtkZWI5
dTEpICkgIzEgU01QIERlYmlhbiA0LjkuODItMStkZWI5dTMgKDIwMTgtMDMtMDIpClsuLi5dClsg
ICAgMC4wMDAwMDBdIGNsb2Nrc291cmNlOiBocGV0OiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNs
ZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiAzMDU4MDE2NzE0NCBucwpbICAgIDAuMDAwMDAw
XSB0c2M6IEZhc3QgVFNDIGNhbGlicmF0aW9uIGZhaWxlZApbICAgIDAuMDAwMDAwXSB0c2M6IFVu
YWJsZSB0byBjYWxpYnJhdGUgYWdhaW5zdCBQSVQKWyAgICAwLjAwMDAwMF0gdHNjOiBIUEVUL1BN
VElNRVIgY2FsaWJyYXRpb24gZmFpbGVkClsgICAgMC4wMDAwMDBdIGRpdmlkZSBlcnJvcjogMDAw
MCBbIzFdIFNNUApbICAgIDAuMDAwMDAwXSBNb2R1bGVzIGxpbmtlZCBpbjoKWyAgICAwLjAwMDAw
MF0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNC45LjAtNi1hbWQ2
NCAjMSBEZWJpYW4gNC45LjgyLTErZGViOXUzClsgICAgMC4wMDAwMDBdIEhhcmR3YXJlIG5hbWU6
IFhlbiBIVk0gZG9tVSwgQklPUyA0LjE0LXVuc3RhYmxlIDAzLzExLzIwMjAKWyAgICAwLjAwMDAw
MF0gdGFzazogZmZmZmZmZmZhYjYxMTUwMCB0YXNrLnN0YWNrOiBmZmZmZmZmZmFiNjAwMDAwClsg
ICAgMC4wMDAwMDBdIFJJUDogMDAxMDpbPGZmZmZmZmZmYWFhNTllMWY+XSAgWzxmZmZmZmZmZmFh
YTU5ZTFmPl0gcHZjbG9ja190c2Nfa2h6KzB4Zi8weDMwClsgICAgMC4wMDAwMDBdIFJTUDogMDAw
MDpmZmZmZmZmZmFiNjAzZjM4ICBFRkxBR1M6IDAwMDEwMjQ2ClsgICAgMC4wMDAwMDBdIFJBWDog
MDAwZjQyNDAwMDAwMDAwMCBSQlg6IGZmZmZmZmZmZmZmZmZmZmYgUkNYOiAwMDAwMDAwMDAwMDAw
MDAwClsgICAgMC4wMDAwMDBdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAw
MDAyNDYgUkRJOiBmZmZmZmZmZmFiOTM5MDIwClsgICAgMC4wMDAwMDBdIFJCUDogZmZmZjkzODA2
ZThmMTU0MCBSMDg6IDAwMDAwMDAwM2E2MzczNzQgUjA5OiA2ZjY5NzQ2MTcyNjI2OTZjClsgICAg
MC4wMDAwMDBdIFIxMDogMDAwMDAwMzJmM2FmNmRjZCBSMTE6IDRkNTAyZjU0NDU1MDQ4MjAgUjEy
OiBmZmZmZmZmZmFiN2RjOTIwClsgICAgMC4wMDAwMDBdIFIxMzogZmZmZmZmZmZhYjdlODJlMCBS
MTQ6IDAwMDAwMDAwMDAwMTQ2ZjAgUjE1OiAwMDAwMDAwMDAwMDAwMDhlClsgICAgMC4wMDAwMDBd
IEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOTM4MDZlNjAwMDAwKDAwMDApIGtu
bEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgICAwLjAwMDAwMF0gQ1M6ICAwMDEwIERTOiAwMDAwIEVT
OiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbICAgIDAuMDAwMDAwXSBDUjI6IGZmZmY5Mzgw
NjVmM2EwMDAgQ1IzOiAwMDAwMDAwMDI1YzA4MDAwIENSNDogMDAwMDAwMDAwMDA0MDZiMApbICAg
IDAuMDAwMDAwXSBTdGFjazoKWyAgICAwLjAwMDAwMF0gIGZmZmZmZmZmYWI3NGIxYjYgZmZmZjkz
ODA2ZThmMTU0MCBmZmZmZmZmZmFiN2RjOTIwIGJhODFlNTM3YmE4MWU1MTIKWyAgICAwLjAwMDAw
MF0gIGZmZmZmZmZmZmZmZmZmZmYgZmZmZjkzODA2ZThmMTU0MCBmZmZmZmZmZmFiNzNkZWI2IGZm
ZmZmZmZmYWI3ZTgyZTAKWyAgICAwLjAwMDAwMF0gIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAyMCAwMDAwZmZmZmZmZmZhYjczIDAwMDAwMDAwZmZmZmZmZmYKWyAgICAwLjAwMDAwMF0g
Q2FsbCBUcmFjZToKWyAgICAwLjAwMDAwMF0gIFs8ZmZmZmZmZmZhYjc0YjFiNj5dID8gdHNjX2lu
aXQrMHgzOS8weDI1YgpbICAgIDAuMDAwMDAwXSAgWzxmZmZmZmZmZmFiNzNkZWI2Pl0gPyBzdGFy
dF9rZXJuZWwrMHgzOWYvMHg0NmIKWyAgICAwLjAwMDAwMF0gIFs8ZmZmZmZmZmZhYjczZDEyMD5d
ID8gZWFybHlfaWR0X2hhbmRsZXJfYXJyYXkrMHgxMjAvMHgxMjAKWyAgICAwLjAwMDAwMF0gIFs8
ZmZmZmZmZmZhYjczZDQwOD5dID8geDg2XzY0X3N0YXJ0X2tlcm5lbCsweDE0Yy8weDE3MApbICAg
IDAuMDAwMDAwXSBDb2RlOiBhNiBiYyAwMCBjMCA5ZCBhNSBhYSAwZiA5NCBjMCBjMyA5MCA0MCA4
OCAzZCBjZCBlYSBjYiAwMCBjMyAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCA4YiA0ZiAxOCAzMSBk
MiA0OCBiOCAwMCAwMCAwMCAwMCA0MCA0MiAwZiAwMCA8NDg+IGY3IGYxIDBmIGI2IDU3IDFjIDg5
IGQxIGY3IGQ5IDQ4IDg5IGM2IDQ4IGQzIGU2IDg5IGQxIDQ4IGQzIApbICAgIDAuMDAwMDAwXSBS
SVAgIFs8ZmZmZmZmZmZhYWE1OWUxZj5dIHB2Y2xvY2tfdHNjX2toeisweGYvMHgzMApbICAgIDAu
MDAwMDAwXSAgUlNQIDxmZmZmZmZmZmFiNjAzZjM4PgpbICAgIDAuMDAwMDAwXSByYW5kb206IGZh
c3QgaW5pdCBkb25lClsgICAgMC4wMDAwMDBdIC0tLVsgZW5kIHRyYWNlIDIxYzNiZDVlYzE3NGUz
ODggXS0tLQpbICAgIDAuMDAwMDAwXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1w
dGVkIHRvIGtpbGwgdGhlIGlkbGUgdGFzayEKCk9uIGFsbCBicmFuY2hlcyBpdCdzIGJsb2NrZWQg
YnkgNC45LjAtNi1hbWQ2NCBmcm9tIERlYmlhbiBmYWlsaW5nLCBub3QKdGhlIGtlcm5lbCB1bmRl
ciB0ZXN0ICh3aGljaCBjb3VsZCBhbHNvIGZhaWwsIGJ1dCB3ZSBkb24ndCBldmVuIGdldAp0aGVy
ZSkuCgpJIGhhdmUgc3RhcnRlZCBhIHJlcHJvIGFuZCB3aWxsIGxvb2sgaW50byB0b21vcnJvdy4K
ClJlZ2FyZHMsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
