Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C945CDA5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 12:35:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiG5o-0003aN-Oa; Tue, 02 Jul 2019 10:32:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SKLB=U7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hiG5n-0003aC-3d
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:32:55 +0000
X-Inumbo-ID: bf55fa92-9cb4-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf55fa92-9cb4-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 10:32:53 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ajBn9kWwjQkL1KBpqBM/sqZVYToMTCOkf9OEACku8roNKLk3cmN3QEQwO/cEKZ+yGh6cnYO0UR
 DWUtZf8uHJeL3KIbGJVRuMx5hszmwH5ScMt4OVBjnPc40ZJ9x05i7/Lxsl+oQukD9oR2StP4sq
 HKScIMModQSMiujgjnWbAxagoXnQKdYRo3dflRQtbH2EzcakWrIQw7/6mKhPw8frhUaveLLdv8
 UQ6H3/9ycaW63ei1rmStqK2MMiHnBPIIDRQuHsmxmHqsBcHxmSWCf/QOVU/dbqAJKIDsg848pr
 Z1o=
X-SBRS: 2.7
X-MesageID: 2492966
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2492966"
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20190702093414.27798-1-paul.durrant@citrix.com>
 <dea713b0-41ca-ea87-9ebe-4586357dbba6@citrix.com>
 <2cbdcf94-f759-9c0a-6142-9ca01cb51314@citrix.com>
 <6c2fb9337c9f4fbbb68c31055337e81e@AMSPEX02CL03.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <924f9b86-5c94-d864-177a-00e443723756@citrix.com>
Date: Tue, 2 Jul 2019 11:32:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <6c2fb9337c9f4fbbb68c31055337e81e@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/msi: fix loop termination condition in
 pci_msi_conf_write_intercept()
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDcvMjAxOSAxMTozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPgo+PiBTZW50OiAwMiBKdWx5IDIwMTkgMTE6MjkKPj4gVG86IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
Pj4gQ2M6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47Cj4+IFJvZ2Vy
IFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRl
dmVsXSBbUEFUQ0hdIHg4Ni9tc2k6IGZpeCBsb29wIHRlcm1pbmF0aW9uIGNvbmRpdGlvbiBpbgo+
PiBwY2lfbXNpX2NvbmZfd3JpdGVfaW50ZXJjZXB0KCkKPj4KPj4gT24gMDIvMDcvMjAxOSAxMDo0
NywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDAyLzA3LzIwMTkgMTA6MzQsIFBhdWwgRHVy
cmFudCB3cm90ZToKPj4+PiBUaGUgZm9yIGxvb3AgdGhhdCBkZWFscyB3aXRoIE1TSSBtYXNraW5n
IGlzIGNvZGVkIGFzIGZvbGxvd3M6Cj4+Pj4KPj4+PiBmb3IgKCBwb3MgPSAwOyBwb3MgPCBlbnRy
eS0+bXNpLm52ZWM7ICsrcG9zLCArK2VudHJ5ICkKPj4+Pgo+Pj4+IFRodXMgdGhlIGxvb3AgdGVy
bWluYXRpb24gY29uZGl0aW9uIGlzIGRlcmVmZXJlbmNpbmcgYSBzdHJ1Y3QgcG9pbnRlciB0aGF0
Cj4+Pj4gaXMgYmVpbmcgaW5jcmVtZW50ZWQgYnkgdGhlIGxvb3AuIEhvd2V2ZXIsIGl0IGlzIGNs
ZWFyIGZyb20gZm9sbG93aW5nIGNvZGUKPj4+PiBwYXRocyBpbiBtc2lfY2FwYWJpbGl0eV9pbml0
KCkgdGhhdCB0aGlzIGlzIHVuc2FmZSBhcyBmb3IgaW5zdGFuY2UsIGluIHRoZQo+Pj4+IGNhc2Ug
b2YgbnZlYyA9PSAxLCBlbnRyeSB3aWxsIHBvaW50IGF0IGEgc2luZ2xlIHN0cnVjdCBtc2lfZGVz
YyBhbGxvY2F0aW9uCj4+Pj4gYW5kIHRodXMgdGhlIGxvb3Agd2lsbCB3YWxrIGJleW9uZCB0aGUg
Ym91bmRzIG9mIHRoZSBhbGxvY2F0aW9uIGJlZm9yZQo+Pj4+IGRlcmVmZXJlbmNpbmcgdGhlIG1l
bW9yeSB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgbG9vcCBzaG91bGQgdGVybWluYXRlLgo+Pj4g
TW9yZSBzcGVjaWZpY2FsbHksIG9ubHkgZW50cnlbMF0ubXNpLm52ZWMgaXMgY29ycmVjdC7CoCBB
bGwgc3Vic2VxdWVudAo+Pj4gbnZlYyBmaWVsZHMgYXJlIDAgaW4gYSBibG9jayBvZiBlbnRyaWVz
Lgo+Pj4KPj4+PiBBbHNvLCBiZWNhdXNlIHRoZSBib2R5IG9mIHRoZSBsb29wIHdyaXRlcyB2aWEg
dGhlIGVudHJ5IHBvaW50ZXIsIHRoaXMgY2FuCj4+Pj4gdGhlbiBsZWFkIHRvIGhlYXAgbWVtb3J5
IGNvcnJ1cHRpb24sIG9yIGluZGVlZCBjb3JydXB0aW9uIG9mIGFueXRoaW5nIGluCj4+Pj4gdGhl
IGRpcmVjdCBtYXAuCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIHNpbXBseSBpbml0aWFsaXplcyBhIHN0
YWNrIHZhcmlhYmxlIHRvIHRoZSB2YWx1ZSBvZgo+Pj4+IGVudHJ5LT5tc2kubnZlYyBiZWZvcmUg
c3RhcnRpbmcgdGhlIGxvb3AgYW5kIHRoZW4gdXNlcyB0aGF0IGluIHRoZQo+Pj4+IHRlcm1pbmF0
aW9uIGNvbmRpdGlvbiBpbnN0ZWFkLgo+PiBUaGVyZSBpcyBhY3R1YWxseSBhIHNlY29uZCBidWcg
aGVyZSB3aGljaCBpcyBiZWluZyBmaXhlZC7CoCBIb3cgYWJvdXQKPj4gdGhpcyBmb3IgdGhlIGNv
bW1pdCBtZXNzYWdlPwo+Pgo+IEFwYXJ0IGZyb20gZXhjaGFuZ2Uvb3V0bG9vayB0ZXJtaW5hbGx5
IG1hbmdsaW5nIGl0IChhcyB5b3UgY2FuIHByb2JhYmx5IHNlZSBiZWxvdy4uLiB1bmxlc3MgaXQg
bWlyYWN1bG91c2x5IHVubWFuZ2xlcyB0aGlzIHJlcGx5KSwgaXQgbG9va3Mgb2sgdG8gbWUuIEkg
YXNzdW1lIHlvdSBhcmUgaGFwcHkgdG8gZml4IG9uIGNvbW1pdD8KClllYWggLSB0aGF0IGlzIGhv
cnJpZmljYWxseSBtYW5nbGVkLsKgIFRoZSBhY3R1YWwgY29tbWl0IHJlYWRzIHNlbnNpYmx5LsKg
CkknbSBoYXBweSB0byBmaXggb24gY29tbWl0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
