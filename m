Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883820AD7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:13:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRI2P-0001RC-Vd; Thu, 16 May 2019 15:11:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRI2O-0001Qz-7S
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:11:16 +0000
X-Inumbo-ID: d7d91724-77ec-11e9-937c-b33c38d33e84
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7d91724-77ec-11e9-937c-b33c38d33e84;
 Thu, 16 May 2019 15:11:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: sKXX2zKXrVV/oOVjLdP5jFmcea2He4YCKUV1blKU1m5KSbEtWYA4ng7UHRzpQhJrlR4Yfur10Y
 iIFSFtTX2lnv0oyFvARjD8Haojznk9sLiyf8J0x5771WoXSELSxDJh5LCv++2nczGM8hE8EA62
 cfpqk1zxzw2sNisgOl3PFY5RFRCqZNToQX3NN8remG/msmUhisTo21AGz4AfLDaLW3eIHbcTmH
 /cLAa32JFT1vSVRAbjV946IAuw9fqBRnKoPPgDPKT/VpVLhVAVf+iqxGkdIE9I06aOyJn47BLJ
 nfw=
X-SBRS: 2.7
X-MesageID: 519319
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="519319"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
Date: Thu, 16 May 2019 16:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] preparations for 4.11.2
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

T24gMjYvMDQvMjAxOSAxMzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8wNC8yMDE5
IDEyOjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxOC8wMy8yMDE5IDE2OjEzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IEFsbCwKPj4+Cj4+PiB0aGUgcmVsZWFzZSBpcyBkdWUgYnkgdGhl
IGVuZCBvZiB0aGUgbW9udGgsIGJ1dCB3aWxsIGxpa2VseSBkb24ndCBtYWtlCj4+PiBpdCBiZWZv
cmUgZWFybHkgQXByaWwuIFBsZWFzZSBwb2ludCBvdXQgYmFja3BvcnRzIHlvdSBmaW5kIG1pc3Np
bmcgZnJvbQo+Pj4gdGhlIHJlc3BlY3RpdmUgc3RhZ2luZyBicmFuY2gsIGJ1dCB3aGljaCB5b3Ug
Y29uc2lkZXIgcmVsZXZhbnQuIFRoZQo+Pj4gb25lIGNvbW1pdCBJJ3ZlIHF1ZXVlZCBhbHJlYWR5
IG9uIHRvcCBvZiB3aGF0IHdhcyBqdXN0IHB1c2hlZCBpcwo+Pj4KPj4+IDIyZTJmOGRkZGYJeDg2
L2U4MjA6IGZpeCBidWlsZCB3aXRoIGdjYzkKPj4gZmZiNjBhNThkZjQ4NDE5YzFmMjYwN2NkM2Nj
OTE5ZmEyYmZjOWMyZCAidG9vbHMvbWlzYy94ZW5wbTogZml4IGdldHRpbmcKPj4gaW5mbyB3aGVu
IHNvbWUgQ1BVcyBhcmUgb2ZmbGluZSIgZm9yIDQuMTEgYW5kIGVhcmxpZXIuCj4gT2gsIGFuZCA2
NzdlNjRkYmUzMTUzNDM2MjBjM2IyNjZlOWViMTY2MjNiMTE4MDM4ICJ0b29scy9vY2FtbDogRHVw
Mgo+IC9kZXYvbnVsbCB0byBzdGRpbiBpbiBkYWVtb25pemUoKSIgYWdhaW4gZm9yIDQuMTIgYW5k
IGVhcmxpZXIuCgpJbiBhZGRpdGlvbiwKCjJlYzUzMzllYzkyMSAidG9vbHMvbGlieGw6IGNvcnJl
Y3QgdmNwdSBhZmZpbml0eSBvdXRwdXQgd2l0aCBzcGFyc2UKcGh5c2ljYWwgY3B1IG1hcCIKMTI5
MDI1ZmUzMDkzICJveGVuc3RvcmVkOiBEb24ndCByZS1vcGVuIGEgeGVuY3RybCBoYW5kbGUgZm9y
IGV2ZXJ5CmRvbWFpbiBpbnRyb2R1Y3Rpb24iCjdiMjBhODY1YmMxMCAidG9vbHMvb2NhbWw6IFJl
bGVhc2UgdGhlIGdsb2JhbCBsb2NrIGJlZm9yZSBpbnZva2luZyBibG9jawpzeXNjYWxscyIKYzM5
M2I2NGRjZWU2ICJ0b29scy9saWJ4YzogRml4IGlzc3VlcyB3aXRoIGxpYnhjIGFuZCBYZW4gaGF2
aW5nCmRpZmZlcmVudCBmZWF0dXJlc2V0IGxlbmd0aHMiCjgyODU1YWJhNWJmOSAidG9vbHMvbGli
eGM6IEZpeCBlcnJvciBoYW5kbGluZyBpbiBnZXRfY3B1aWRfZG9tYWluX2luZm8oKSIKNDhkYWI5
NzY3ZDJlICJ0b29scy94bDogdXNlIGxpYnhsX2RvbWFpbl9pbmZvIHRvIGdldCBkb21haW4gdHlw
ZSBmb3IKdmNwdS1waW4iCgozNjVhYWJiNmU1MDIgInRvb2xzL2xpYnhlbmRldmljZW1vZGVsOiBh
ZGQKeGVuZGV2aWNlbW9kZWxfbW9kaWZpZWRfbWVtb3J5X2J1bGsgdG8gbWFwIiBpcyBwb3NzaWJs
eSBhIGNhbmRpZGF0ZSwgYnV0CmlzIGFsc28gY29tcGxpY2F0ZWQgYnkgdGhlIHN0YWJsZSBTT05B
TUUuwqAgSXQgaXMgcGVyaGFwcyBlYXNpZXN0IHRvCmlnbm9yZSwgc2VlaW5nIGFzIHRoZSBpc3N1
ZSBoYXMgYWxyZWFkeSBnb25lIHVubm90aWNlZCBmb3IgMiB5ZWFycy4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
