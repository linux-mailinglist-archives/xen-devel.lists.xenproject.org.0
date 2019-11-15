Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31455FDCC3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 12:56:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVaA4-0003KM-Oq; Fri, 15 Nov 2019 11:53:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVaA3-0003KH-Nv
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:53:11 +0000
X-Inumbo-ID: 7e831c0a-079e-11ea-984a-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e831c0a-079e-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573818791;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2rHB36gQ2/6zFREplMz6rusqqlZGMgxFpj1Z27QOAVM=;
 b=gsatWax2MxXDW/w3bYeGDX7riETMM2+cKKnNODAuMBn3/zM/dAQwMpUd
 OXz2hgoXhwQlfmSNGhJY8IPgBvEYLpLfQb5X5XSmaA7HGchB6zv9RcFgQ
 Gfjy0qRz/NmfCSWQCMzKyyAGz32zY3hJRhw1gaODkaiEWiT5o4jmn/ZLG w=;
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
IronPort-SDR: fQNuUGNaWfwSDWurLzLFZeg5qWwPdObDJ2rdmMlyMIs7ASBeCAQmrvPZhk6KH5kcT6R01dvJ/q
 fN1IGCZKA70nLkgQd+oTiWgppV0Caju5c4V7lLVpJ86iV+aAn8auscuYmz7fO95PbCUX1nvpAv
 poRoTNrVhiof9E6yOA84d8zMj1FYappxPTMWDP+A3XYCHYLUhK2jI1GIruwE+9kTe86NfucDwa
 A+1oGYASm2jaozzCvL+qvOdgbLBpGGj7lczwoUzdRmETzPmrsJaBbD13sbz0kkBm2pKLCz6Q4T
 WDc=
X-SBRS: 2.7
X-MesageID: 8377710
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8377710"
To: "Durrant, Paul" <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
References: <8e8866de-33a8-68c0-3352-d6dfeec4a9b6@suse.com>
 <3f17589409b24992a3aac0f357b1cd56@EX13D32EUC003.ant.amazon.com>
 <32bd3ef3-8045-5fda-4a53-70adc20ad37e@suse.com>
 <503209fd122f46e6b137fe9eef691212@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b2095962-8482-6946-5fdc-e2ce244c13b3@citrix.com>
Date: Fri, 15 Nov 2019 11:53:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <503209fd122f46e6b137fe9eef691212@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 0/2] AMD/IOMMU: re-work mode updating
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sander
 Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTEvMjAxOSAxMTozMywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAxNSBOb3ZlbWJlciAyMDE5IDA5OjI5Cj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY29tPgo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBB
bmRyZXcgQ29vcGVyCj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgU2FuZGVyIEVpa2Vs
ZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD47Cj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwLzJdIEFNRC9J
T01NVTogcmUtd29yayBtb2RlIHVwZGF0aW5nCj4+Cj4+IE9uIDE0LjExLjIwMTkgMTg6MjksICBE
dXJyYW50LCBQYXVsICB3cm90ZToKPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+
IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+
IE9uIEJlaGFsZiBPZgo+PiBKYW4KPj4+PiBCZXVsaWNoCj4+Pj4gU2VudDogMTQgTm92ZW1iZXIg
MjAxOSAxNjo0Mgo+Pj4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4+PiBD
YzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsgU2FuZGVyIEVpa2VsZW5ib29tCj4+
Pj4gPGxpbnV4QGVpa2VsZW5ib29tLml0PjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPj4+PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgMC8yXSBBTUQv
SU9NTVU6IHJlLXdvcmsgbW9kZSB1cGRhdGluZwo+Pj4+Cj4+Pj4gdXBkYXRlX3BhZ2luZ19tb2Rl
KCkgaW4gdGhlIEFNRCBJT01NVSBjb2RlIGV4cGVjdHMgdG8gYmUgaW52b2tlZCB3aXRoCj4+Pj4g
dGhlIFBDSSBkZXZpY2VzIGxvY2sgaGVsZC4gVGhlIGNoZWNrIG9jY3VycmluZyBvbmx5IHdoZW4g
dGhlIG1vZGUKPj4+PiBhY3R1YWxseSBuZWVkcyB1cGRhdGluZywgdGhlIHZpb2xhdGlvbiBvZiB0
aGlzIHJ1bGUgYnkgdGhlIG1ham9yaXR5Cj4+Pj4gb2YgY2FsbGVycyBkaWQgZ28gdW5ub3RpY2Vk
IHVudGlsIHBlci1kb21haW4gSU9NTVUgc2V0dXAgd2FzIGNoYW5nZWQKPj4+PiB0byBkbyBhd2F5
IHdpdGggb24tZGVtYW5kIGNyZWF0aW9uIG9mIElPTU1VIHBhZ2UgdGFibGVzLgo+Pj4gV291bGRu
J3QgaXQgYmUgc2FmZXIgdG8ganVzdCBnZXQgcmlkIG9mIHVwZGF0ZV9wYWdpbmdfbW9kZSgpIGFu
ZCBzdGFydAo+Pj4gd2l0aCBhIHJlYXNvbmFibGUgbnVtYmVyIG9mIGxldmVscz8KPj4gQW5kcmV3
IGRpZCBiYXNpY2FsbHkgYXNrIHRoZSBzYW1lLCBidXQgSSBjb250aW51ZSB0byBiZSB1bmNvbnZp
bmNlZDoKPj4gV2UgY2FuJ3QgcGljayBhICJyZWFzb25hYmxlIiBsZXZlbCwgd2UgaGF2ZSB0byBw
aWNrIHRoZSBtYXhpbXVtIGEKPj4gZ3Vlc3QgbWF5IGVuZCB1cCB1c2luZy4KCjQsIGFuZCBpdCBp
cyBhIHJlYXNvbmFibGUgbnVtYmVyLgoKPj4gWWV0IHdoeSB3b3VsZCB3ZSB3YW50IHRvIGhhdmUg
YWxsIGd1ZXN0cyBwYXkKPj4gdGhlIHByaWNlIG9mIGF0IGxlYXN0IG9uZSB1bm5lY2Vzc2FyeSBw
YWdlIHdhbGsgbGV2ZWw/CgpUbyBhIGZpcnN0IGFwcHJveGltYXRpb24sIEkgZG9uJ3QgY2FyZS7C
oCBUaGUgUFRFIHdpbGwgYmUgY2FjaGVkIG9uIGZpcnN0CnJlYWQsIGFuZCBpbiB0aGUgY29tbW9u
IGNhc2Ugd2lsbCBoYXZlIG5vIG5lZWQgdG8gYmUgaW52YWxpZGF0ZWQuwqAgSQpkb3VidCB0aGVy
ZSB3b3VsZCBiZSBhbnkgdmlzaWJsZSBlZmZlY3QuCgo+PiAgSSBkb24ndCBtZWFuCj4+IHRvIHNh
eSBJJ20gZW50aXJlbHkgb3Bwb3NlZCwgYnV0IHRyYWRpbmcgY29kZSBzaW1wbGljaXR5IGZvcgo+
PiBwZXJmb3JtYW5jZSBpcyBhbG1vc3QgbmV2ZXIgYW4gZWFzeSBvciBvYnZpb3VzIGRlY2lzaW9u
Lgo+IEkgdGhpbmsgaW4gdGhpcyBjYXNlLCB2ZXJzdXMgdGhlIGhvb3BzIHlvdXIgcGF0Y2hlcyBo
YXZlIHRvIGp1bXAgdGhyb3VnaCBqdXN0IHRvIHNhdmUgKHBvc3NpYmx5KSBhIGxldmVsIG9mIElP
TU1VIHBhZ2Ugd2FsaywgdGhlIHNpbXBsaWNpdHkgYXJndW1lbnQgaXMgcXVpdGUgY29tcGVsbGlu
Zy4uLiBwYXJ0aWN1bGFybHkgYXQgdGhpcyBzdGFnZSBpbiB0aGUgcmVsZWFzZSBjeWNsZS4KCkkg
YWdyZWUuwqAgVGhlIHdhbGsgbGVuZ3RoIHNob3VsZCBub3QgZXZlciBoYXZlIGJlZW4gdmFyaWFi
bGUuCgpUaGUgY29zdCBvZiB0aGUgYWRkZWQgY29tcGxleGl0eSBpbiBYZW4gZmFyIG91dHdlaWdo
cyBhbnkgcGVyY2VpdmVkCmJlbmVmaXQuwqAgRnVydGhlcm1vcmUsIHlvdSdyZSBhZGRpbmcgYW4g
aW52YXNpdmUgYW5kIGNvbmZ1c2luZyBjb3JlIGFwaQpjaGFuZ2UgdG8gY29tbW9uIGNvZGUgdG8g
d29yayBhcm91bmQgYSBidWcgaW4gYSBwaWVjZSBvZiBmdW5jdGlvbmFsaXR5CndoaWNoIHNob3Vs
ZG4ndCBoYXZlIGV2ZXIgZXhpc3RlZC4KClRoZSBzYWZlIG9wdGlvbiBmb3IgNC4xMyBpcyBhIG9u
ZS1saW5lciBkZWZhdWx0aW5nIHRvIDQgbGV2ZWxzLgoKPiBUaGUgZmFjdCB0aGF0IHdlIGRvbid0
IGtub3csIGF0IHN0YXJ0IG9mIGRheSwgd2hhdCB0aGUgbWF4IGdmbiBvZiB0aGUgZ3Vlc3QgaXMg
Z29pbmcgdG8gYmUgaXMgYWxzbyBzb21ldGhpbmcgdGhhdCByZWFsbHkgb3VnaHQgdG8gYmUgZml4
ZWQgdG9vLi4uIGJ1dCB0aGF0IGlzIGFub3RoZXIgZGViYXRlLgoKV2UgbmVlZCBpdCBmb3IgbWln
cmF0aW9uIHNhZmV0eSBkZWNpc2lvbnMsIHNvIGlzIG9uIG15IGxpc3Qgb2YgdGhpbmdzCm5lZWRp
bmcgdG8gaW5jbHVkZSBpbnRvIGRvbWFpbmNyZWF0ZS4KCkF0IGEgZnV0dXJlIHBvaW50IHdoZXJl
IHRoaXMgaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlLCB3ZSBjb3VsZCBvcHRpbWlzZQo0IGRvd24g
dG8gMyBpbiBtb3N0IGNvbW1vbiBjYXNlcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
