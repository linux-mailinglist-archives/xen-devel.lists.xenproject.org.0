Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FE51867B6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 10:19:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDlsB-00062p-Gz; Mon, 16 Mar 2020 09:17:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JvoA=5B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jDls9-00062k-Vz
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 09:17:22 +0000
X-Inumbo-ID: f038eed8-6766-11ea-a6c1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f038eed8-6766-11ea-a6c1-bc764e2007e4;
 Mon, 16 Mar 2020 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584350241;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=3y8gWWRnhtnhTjElBHam9/tnMysA7pJIPf/Iy6boFkA=;
 b=DzuA1oXnKJtRiRt2Hg5AVsRilODkw0IF+V6+OCXsSnr5xJP3n6SBtti8
 /c5mJmrcu1Ei6APJHCPHahqtPjTr2dAWXAHk9POZljjNxSW/RvO+Xgb4p
 v3g2n9NOcOclkDAnQRNFXeLOsgtzgZUgyEzgJ+fVwmdWHKqBGHOk9PtFs E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zdZWUDITxbXFDXM/x30HRXlQ4u9fysT5q4YuZL8X+vcsnHhveWpJ3SyqYzH/ofMiuQYisCHehN
 0bLvjHOSYouecQwosFud4p9sALIdOD5jaieKKklHUufRefHaRZkg8gywmnYXLRSvdlMdcUfA4B
 9RBnFC586wgr12aDlHjH6XNYIFZU6giU484SFcObAy7LqpKbL9EsRBAnbWbCqYkPVj8INhDhVK
 SVHgD15To8rQUISSSIvrh0JCOBTlJEbY6FEEydecVcQOjwLi4Z2GmXHomgTytyQ+XSfd2E8I6x
 /+Y=
X-SBRS: 2.7
X-MesageID: 13996520
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,559,1574139600"; d="scan'208";a="13996520"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Pawe=c5=82_Marczewski?= <pawel@invisiblethingslab.com>
References: <8cddf6ca-277f-6317-9bf6-1c2202c6a651@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7be49e30-b705-6b34-5def-d4e8f79cf598@citrix.com>
Date: Mon, 16 Mar 2020 09:17:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8cddf6ca-277f-6317-9bf6-1c2202c6a651@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Commit 0d99c909d7e1 introduced bug
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

T24gMTYvMDMvMjAyMCAwODo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBDb21taXQgMGQ5OWM5
MDlkN2UxICgibGlieGw6IHdhaXQgZm9yIGNvbnNvbGUgcGF0aCBiZWZvcmUgZmlyaW5nCj4gY29u
c29sZV9hdmFpbGFibGUiKSBpbnRyb2R1Y2VkIGEgYnVnOiB3aGVuIHRyeWluZyB0byBzdGFydCBh
IGd1ZXN0Cj4gZnJvbSBhIGNvbmZpZyBmaWxlIHdoZW4gaXQgaXMgYWxyZWFkeSBydW5uaW5nLCBJ
IGdldDoKPgo+IHhsIGNyZWF0ZSAtYyBtaW5pb3MucHYKPiBQYXJzaW5nIGNvbmZpZyBmcm9tIG1p
bmlvcy5wdgo+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6ODE6bGlieGxfX2RvbWFpbl9y
ZW5hbWU6IERvbWFpbiA4OkRvbWFpbgo+IHdpdGggbmFtZSAibWluaW9zIiBhbHJlYWR5IGV4aXN0
cy4KPiBsaWJ4bDogZXJyb3I6IGxpYnhsX2NyZWF0ZS5jOjExODA6aW5pdGlhdGVfZG9tYWluX2Ny
ZWF0ZTogRG9tYWluCj4gODpjYW5ub3QgbWFrZSBkb21haW46IC02Cj4gU2VnbWVudGF0aW9uIGZh
dWx0IChjb3JlIGR1bXBlZCkKPgo+IFRoZSBzZWdmYXVsdCBpcyBkdWUgdG86Cj4KPiAjMMKgIDB4
MDAwMDdmZmZmNzAxMjdkMSBpbiBfX3N0cmxlbl9hdngyICgpIGZyb20gL2xpYjY0L2xpYmMuc28u
Ngo+ICMxwqAgMHgwMDAwN2ZmZmY2NjM4NWY4IGluIHhzX3Vud2F0Y2ggKGg9MHg2NDQxNDAsIHBh
dGg9MHgwLAo+IHRva2VuPTB4NjQ3Y2MwICIwLzAiKSBhdCB4cy5jOjk5Mwo+ICMywqAgMHgwMDAw
N2ZmZmY3OTA3YWFkIGluIGxpYnhsX19ldl94c3dhdGNoX2RlcmVnaXN0ZXIgKGdjPTB4NjQ1M2Qw
LAo+IHc9MHg2NDc5ZTApIGF0IGxpYnhsX2V2ZW50LmM6ODUzCj4gIzPCoCAweDAwMDA3ZmZmZjc4
ZjdiMjIgaW4gbGlieGxfX3hzd2FpdF9zdG9wIChnYz0weDY0NTNkMCwKPiB4c3dhPTB4NjQ3OTU4
KSBhdCBsaWJ4bF9hb3V0aWxzLmM6MzQKPiAjNMKgIDB4MDAwMDdmZmZmNzhjZGUwOSBpbiBkb21j
cmVhdGVfY29tcGxldGUgKGVnYz0weDdmZmZmZmZmZDkyMCwKPiBkY3M9MHg2NDU0OTAsIHJjPS0z
KSBhdCBsaWJ4bF9jcmVhdGUuYzoxODYwCj4KPiAjIyMjIyMjIF4gdGhpcyBjYWxsIHRvIGxpYnhs
X194c3dhaXRfc3RvcCgpIHdhcyBhZGRlZCB3aXRoIHNhaWQgY29tbWl0Cj4KPiAjNcKgIDB4MDAw
MDdmZmZmNzhjYmZhZSBpbiBpbml0aWF0ZV9kb21haW5fY3JlYXRlIChlZ2M9MHg3ZmZmZmZmZmQ5
MjAsCj4gZGNzPTB4NjQ1NDkwKSBhdCBsaWJ4bF9jcmVhdGUuYzoxMjQ0Cj4gIzbCoCAweDAwMDA3
ZmZmZjc4Y2UzNjggaW4gZG9fZG9tYWluX2NyZWF0ZSAoY3R4PTB4NjQzODYwLAo+IGRfY29uZmln
PTB4N2ZmZmZmZmZkYWQwLCBkb21pZD0weDdmZmZmZmZmZGZhYywgcmVzdG9yZV9mZD0tMSwKPiBz
ZW5kX2JhY2tfZmQ9LTEsIHBhcmFtcz0weDAsCj4gwqDCoMKgIGFvX2hvdz0weDAsIGFvcF9jb25z
b2xlX2hvdz0weDdmZmZmZmZmZGE2MCkgYXQgbGlieGxfY3JlYXRlLmM6MTk3Nwo+ICM3wqAgMHgw
MDAwN2ZmZmY3OGNlZmRmIGluIGxpYnhsX2RvbWFpbl9jcmVhdGVfbmV3IChjdHg9MHg2NDM4NjAs
Cj4gZF9jb25maWc9MHg3ZmZmZmZmZmRhZDAsIGRvbWlkPTB4N2ZmZmZmZmZkZmFjLCBhb19ob3c9
MHgwLAo+IGFvcF9jb25zb2xlX2hvdz0weDdmZmZmZmZmZGE2MCkKPiDCoMKgwqAgYXQgbGlieGxf
Y3JlYXRlLmM6MjE5Mgo+ICM4wqAgMHgwMDAwMDAwMDAwNDI4ZmM4IGluIGNyZWF0ZV9kb21haW4g
KGRvbV9pbmZvPTB4N2ZmZmZmZmZlMGIwKSBhdAo+IHhsX3ZtY29udHJvbC5jOjkzNgo+ICM5wqAg
MHgwMDAwMDAwMDAwNDI5YzRkIGluIG1haW5fY3JlYXRlIChhcmdjPTMsIGFyZ3Y9MHg3ZmZmZmZm
ZmUyOTApIGF0Cj4geGxfdm1jb250cm9sLmM6MTI0Ngo+ICMxMCAweDAwMDAwMDAwMDA0MGFkMGIg
aW4gbWFpbiAoYXJnYz0zLCBhcmd2PTB4N2ZmZmZmZmZlMjkwKSBhdCB4bC5jOjQyNQoKV2hhdCBh
Ym91dCB0aGUgdG9wIGNvbW1pdCwgZDA5NGU5NWZiN2M2MWMgd2hpY2ggc2VlbXMgdG8gYmUgYSBi
dWdmaXggZm9yCnRoaXM/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
