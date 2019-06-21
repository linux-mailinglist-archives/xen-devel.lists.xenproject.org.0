Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E14E85A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 14:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heJ21-00082E-E1; Fri, 21 Jun 2019 12:52:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mzu6=UU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1heJ1z-000829-Ow
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 12:52:39 +0000
X-Inumbo-ID: 71bdee3f-9423-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 71bdee3f-9423-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 12:52:36 +0000 (UTC)
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
IronPort-SDR: 2m8czPnL9t4sUx6RPVsA2y6WF998Kk+VWLL6nmX7DYSDoDt38+6NdT2NKtOkKnO+ynOtNnK8v0
 Cv4hLNNM/KiiT4pO5VZEENf1dEcGvP/7SCfz27NDYmEMHcvjHHC94E3UkphRXCV+0Ynyz3Uk27
 n00LwdfxOmZzd5c4e2e9muD4DbNY3ZcLw1e/ufpmPO+L4wMHkdj7e2JeSIziPEWBIww9y0XybW
 5KRhdqipzXFlB2SAi4RK0sNxVwDfb4osOVnkkRQv3/XqC3slnEthy6MSubTt0HqnEu9LI64KI8
 bs4=
X-SBRS: 2.7
X-MesageID: 2056119
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2056119"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B86FB020000780021F31D@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9436d6db-f87e-a97b-f1da-0b00af99d422@citrix.com>
Date: Fri, 21 Jun 2019 13:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5C8B86FB020000780021F31D@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 44/50] x86emul: support VPCLMULQDQ insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDMvMjAxOSAxMTowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQXMgdG8gdGhlIGZlYXR1
cmUgZGVwZW5kZW5jeSBhZGp1c3RtZW50LCB3aGlsZSBzdHJpY3RseSBzcGVha2luZyBBVlggaXMK
PiBhIHN1ZmZpY2llbnQgcHJlcmVxICh0byBoYXZlIFlNTSByZWdpc3RlcnMpLCAyNTYtYml0IHZl
Y3RvcnMgb2YgaW50ZWdlcnMKPiBoYXZlIGdvdCBmdWxseSBpbnRyb2R1Y2VkIHdpdGggQVZYMiBv
bmx5LiBTYWRseSBnY2MgY2FuJ3QgYmUgdXNlZCBhcyBhCj4gcmVmZXJlbmNlIGhlcmU6IFRoZXkg
ZG9uJ3QgcHJvdmlkZSBhbnkgQVZYNTEyLWluZGVwZW5kZW50IGJ1aWx0LWluIGF0Cj4gYWxsLgo+
Cj4gQWxvbmcgdGhlIGxpbmVzIG9mIFBDTE1VTFFEUSwgc2luY2UgdGhlIGluc25zIGhlcmUgYW5k
IGluIHBhcnRpY3VsYXIKPiB0aGVpciBtZW1vcnkgYWNjZXNzIHBhdHRlcm5zIGZvbGxvdyB0aGUg
dXN1YWwgc2NoZW1lLCBJIGRpZG4ndCB0aGluayBpdAo+IHdhcyBuZWNlc3NhcnkgdG8gYWRkIGEg
Y29udHJpdmVkIHRlc3Qgc3BlY2lmaWNhbGx5IGZvciB0aGVtLCBiZXlvbmQgdGhlCj4gRGlzcDgg
c2NhbGluZyBvbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gLS0tCj4gVEJEOiBTaG91bGQgVlBDTE1VTFFEUSBhbHNvIGRlcGVuZCBvbiBQQ0xN
VUxRRFE/CgpJIHRoaW5rIHNvLCB5ZXMuwqAgVGhlc2UgYXJlIGFsbCA2NCBieSA2NCBtdWx0aXBs
aWVzIHdpdGggYSAxMjggYml0CnJlc3VsdCwgYW5kIGFuIGltbTggdG8gY2hvb3NlIHdoaWNoIHF1
YWR3b3JkcyBnZXQgdXNlZCwgc28gYm90aCB0aGVzZQpmZWF0dXJlcyB3aWxsIGJlIHVzaW5nIHRo
ZSBzaWxpY29uIGJsb2NrIGluIHRoZSB2ZWN0b3IgcGlwZWxpbmUuwqAgVGhlCm9ubHkgZGlmZmVy
ZW5jZSBpcyB3aGV0aGVyIGl0cyB3aXJlZCB0aHJvdWdoIGZyb20gdGhlIGxlZ2FjeSBTU0UKaW5z
dHJ1Y3Rpb25zLCBvciB0aGUgW0VdVkVYIGluc3RydWN0aW9ucy4KCkkgY2VydGFpbmx5IGRvbid0
IGV4cGVjdCB0byBldmVyIHNlZSBoYXJkd2FyZSB3aXRoIFZQQ0xNVUxRRFEgYnV0CmxhY2tpbmcg
UENMTVVMUURRLgoKPiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4gKysrIGIveGVuL3Rv
b2xzL2dlbi1jcHVpZC5weQo+IEBAIC0yNTUsOCArMjU1LDkgQEAgZGVmIGNydW5jaF9udW1iZXJz
KHN0YXRlKToKPiAgCj4gICAgICAgICAgIyBUaGlzIGlzIGp1c3QgdGhlIGRlcGVuZGVuY3kgYmV0
d2VlbiBBVlg1MTIgYW5kIEFWWDIgb2YgWFNUQVRFCj4gICAgICAgICAgIyBmZWF0dXJlIGZsYWdz
LiAgSWYgd2FudCB0byB1c2UgQVZYNTEyLCBBVlgyIG11c3QgYmUgc3VwcG9ydGVkIGFuZAo+IC0g
ICAgICAgICMgZW5hYmxlZC4KPiAtICAgICAgICBBVlgyOiBbQVZYNTEyRl0sCj4gKyAgICAgICAg
IyBlbmFibGVkLiAgQ2VydGFpbiBsYXRlciBleHRlbnNpb25zLCBhY3Rpbmcgb24gMjU2LWJpdCB2
ZWN0b3JzIG9mCj4gKyAgICAgICAgIyBpbnRlZ2VycywgYmV0dGVyIGRlcGVuZCBvbiBBVlgyIHRo
YW4gQVZYLgo+ICsgICAgICAgIEFWWDI6IFtBVlg1MTJGLCBWUENMTVVMUURRXSwKCkhtbSAtIHRo
aXMgaXMgYXdrd2FyZCwgYmVjYXVzZSBpbiBwcmFjdGljZSwgdGhlcmUgd29uJ3QgYmUgYW55IGhh
cmR3YXJlCmluIGV4aXN0ZW5jZSB3aXRoIFZQQ0xNVUxRRFEgYW5kIEFWWDIgYnV0IGxhY2tpbmcg
QVZYNTEyLgoKSG93ZXZlciwgdGhlIFZFWCBlbmNvZGluZyBpcyBsZWdpdGltYXRlIGluIHRoZSBh
YnNlbmNlIG9mIHRoZSBFVkVYCmVuY29kaW5nLCBhbmQgZG9lc24ndCBkZXBlbmQgb24gdGhlIEFW
WDUxMiBYQ1IwIHN0YXRlLgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
