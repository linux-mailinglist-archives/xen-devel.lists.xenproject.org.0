Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD027F4DA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 12:17:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htUZB-0002r7-8k; Fri, 02 Aug 2019 10:13:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A8xe=V6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1htUZ9-0002r2-Kr
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 10:13:39 +0000
X-Inumbo-ID: 3130a4dd-b50e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3130a4dd-b50e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 10:13:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jO0c2So1/D3ZxCBvoain+F309ocxTAtLacCy9roqze3okbefKK3s0FC4VR6UQNAq2MkqSikyhZ
 UBkoKYCJLWV5eZrfN5BHFlO1rKuHq+J8eNgPF3IwimePq0r+KOxOEKPPwcnDUgj9hHAhws1Dyw
 yLfcmhD1kha3ekfo83kGEkDNGRExNKRJPHHAlY28O+FRaGBTORjYWEN2/+V0TpYririrZjYEkv
 DI9N6IxSse1zwT4K4iHUqqCyZ+sRunKPxVsR6Tzbf6vXuuZjeP+NSF8bjYPkCERJhW3DMaDL7p
 nso=
X-SBRS: 2.7
X-MesageID: 3768289
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,337,1559534400"; 
   d="scan'208";a="3768289"
To: Juergen Gross <jgross@suse.com>, Andy Smith <andy@strugglers.net>
References: <20190721200623.GJ11726@bitfolk.com>
 <7d518504-b12b-a6b9-dc37-7fdb00f8d632@suse.com>
 <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
 <20190802021529.GR12975@bitfolk.com>
 <649f7339-a51c-985f-1395-1835f4c04b99@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <17be5d15-3abe-e078-1248-35091865cdec@citrix.com>
Date: Fri, 2 Aug 2019 11:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <649f7339-a51c-985f-1395-1835f4c04b99@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDgvMjAxOSAwNTo1MSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMi4wOC4xOSAw
NDoxNSwgQW5keSBTbWl0aCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIE1vbiwgSnVsIDIyLCAyMDE5
IGF0IDAxOjA2OjAzUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAyMi8wNy8y
MDE5IDEwOjE2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMS4wNy4yMDE5IDIyOjA2LCBB
bmR5IFNtaXRoIHdyb3RlOgo+Pj4+PiAoWEVOKSBBZGRpbmcgY3B1IDEgdG8gcnVucXVldWUgMAo+
Pj4+PiAoWEVOKSBDUFUgMSBzdGlsbCBub3QgZGVhZC4uLgo+Pj4+PiAoWEVOKSBDUFUgMSBzdGls
bCBub3QgZGVhZC4uLgo+Pj4+PiAoWEVOKSBDUFUgMSBzdGlsbCBub3QgZGVhZC4uLgo+Pj4+PiAo
WEVOKSBDUFUgMSBzdGlsbCBub3QgZGVhZC4uLgo+Pgo+PiBb4oCmXQo+Pgo+Pj4gRG9lcyByZXZl
cnRpbmcgYmFjayB0byBjcmVkaXQxIG1ha2UgdGhlIGlzc3VlIGdvIGF3YXk/Cj4+Cj4+IFllcywg
SSBkb24ndCBzZWUgdGhpcyB3aXRoIHNjaGVkPWNyZWRpdCwgc210PTAgYW5kIFNNVCBlbmFibGVk
IGluCj4+IHRoZSBCSU9TOgo+Pgo+PiAoWEVOKSBtaWNyb2NvZGU6IENQVTIgdXBkYXRlZCBmcm9t
IHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsCj4+IGRhdGUgPSAyMDE5LTA0LTAyCj4+
IChYRU4pIG1pY3JvY29kZTogQ1BVNCB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgyMDAwMDU3IHRv
IDB4MjAwMDA1ZSwKPj4gZGF0ZSA9IDIwMTktMDQtMDIKPj4gKFhFTikgbWljcm9jb2RlOiBDUFU2
IHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLAo+PiBkYXRlID0g
MjAxOS0wNC0wMgo+PiAoWEVOKSBtaWNyb2NvZGU6IENQVTggdXBkYXRlZCBmcm9tIHJldmlzaW9u
IDB4MjAwMDA1NyB0byAweDIwMDAwNWUsCj4+IGRhdGUgPSAyMDE5LTA0LTAyCj4+IChYRU4pIG1p
Y3JvY29kZTogQ1BVMTAgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAw
NWUsCj4+IGRhdGUgPSAyMDE5LTA0LTAyCj4+IChYRU4pIG1pY3JvY29kZTogQ1BVMTIgdXBkYXRl
ZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsCj4+IGRhdGUgPSAyMDE5LTA0
LTAyCj4+IChYRU4pIG1pY3JvY29kZTogQ1BVMTQgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAw
MDA1NyB0byAweDIwMDAwNWUsCj4+IGRhdGUgPSAyMDE5LTA0LTAyCj4+IChYRU4pIEJyb3VnaHQg
dXAgOCBDUFVzCj4+IChYRU4pIFBhcmtlZCA4IENQVXMKPgo+IFRoaXMgd2lsbCBiZSBjdXJlZCBi
eSBteSBjb3JlIHNjaGVkdWxpbmcgc2VyaWVzLiBBcyBJIGRvbid0IHRoaW5rIHdlCj4gd2FudCB0
byB3YWl0IGZvciB0aGF0IHRvIGdvIGluIEkgY2FuIGlzb2xhdGUgdGhlIHJlbGF0ZWQgcGF0Y2hl
cyBhbmQKPiBwb3N0IHRoZW0uCgpQbGVhc2UgZG8uwqAgVGhlIGZpeCBmb3IgdGhpcyByZWFsbHkg
d2FudHMgdG8gZ28gYmFjayB0byBhbGwgc3RhZ2luZyB0cmVlcy4KCn5BbmRyZXcKClAuUy4gaXNu
J3QgaXQgbG92ZWx5IHdoZW4gcmVwb3J0ZWQgYnVncyBhcmUgYWxyZWFkeSBmaXhlZC7CoCBJIGNv
dWxkIGdldAp1c2VkIHRvIHRoaXMuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
