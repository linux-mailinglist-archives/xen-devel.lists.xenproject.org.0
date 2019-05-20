Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A002309E
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:45:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSepL-0004iD-T5; Mon, 20 May 2019 09:43:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSepJ-0004i8-S7
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:43:25 +0000
X-Inumbo-ID: b60b05a3-7ae3-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b60b05a3-7ae3-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:43:24 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: yipHM2GUYGByei3uQhQuWRyDH0l2bKG+ENHpIxNue5aUgM/3a/j7a1qLEkf0dqGJXGGDHCjt5A
 PRqAUhDiyPXb+Y08prwn/PhlgU9tPfA1bO/K1/bfwnEBptyh7aN/uJa8nUwdXHPPjF/kj7GA4m
 4kny+Pn5vAT3Zb9M7drZVRWgE0PRaI4G5vXvNNa4zTgyEVh4xo/G1Nl2bThvo0t2obDcusFYgW
 3VOXD0uVwTh3ZxSs+83P5iRsN7SYI8KWOldnVwHu/JSb2EqGbYr2a7l9lg83UXsl+CWhK6Wl4n
 PPM=
X-SBRS: 2.7
X-MesageID: 644670
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="644670"
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
 <5CDECD540200007800230246@prv1-mh.provo.novell.com>
 <CAOcoXZYeoUt9bf2Uv7-pbhFV+bnaz0hvxPKc9A9CnjcUc1bDuA@mail.gmail.com>
 <e42cffb5-4cbd-ddb5-ffdb-e76399aa09e4@citrix.com>
 <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4a0bb401-4c22-61ff-2ccd-69c5881e73a6@citrix.com>
Date: Mon, 20 May 2019 10:43:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZb6V2TzQuKsZV7s3DoviYij7KCUE8TpNtvVEOoJx=gJDw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDUvMjAxOSAxMDozNywgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDIw
LCAyMDE5IGF0IDEyOjIyIFBNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+IE9uIDIwLzA1LzIwMTkgMTA6MTcsIFZpa3RvciBNaXRpbiB3cm90ZToK
Pj4+Pj4gTWVhbiB0aGF0IHJlc3VsdCBvZiAiKGludDY0X3QpdmFkZHIgPj4gNjMiIGNhbiBiZSAw
IG9yIDEuCj4+Pj4+IFNvIHRoZSBuZXh0IGNvZGUgbWF5IG5vdCB3b3JrIHByb3Blcmx5IGluIGNh
c2Ugb2YgYW5vdGhlciAnaW1wbGVtZW50YXRpb25zJy4KPj4+Pj4gV2l0aCBhbm90aGVyIGNvbXBp
bGVyIChpLmUuIGNsYW5nLCBldGMpIHRoaXMgY29kZSBtYXkgaW50cm9kdWNlIGJ1Z3MKPj4+Pj4g
d2hpY2ggYXJlIGhhcmQgdG8gZmluZC4KPj4+Pj4KPj4+Pj4gKChpbnQ2NF90KXZhZGRyID4+IDQ3
KSA9PSAoKGludDY0X3QpdmFkZHIgPj4gNjMpCj4+Pj4+Cj4+Pj4+IEZvciB0aGlzIHJlYXNvbiBp
dCBpcyBiZXR0ZXIgdG8gYXZvaWQgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBjb2RlLgo+Pj4+IFdl
bGwsIGlkZWFsbHkgd2UnZCBsaWtlIHRvIGdldCBhd2F5IHdpdGhvdXQgdXNpbmcgaW1wbGVtZW50
YXRpb24KPj4+PiBkZWZpbmVkIGJlaGF2aW9yLiBCdXQgSSdtIGFmcmFpZCB3ZSdyZSBxdWl0ZSBm
YXIgZnJvbSB0aGF0LCBhbmQKPj4+PiB3ZSdkIG5vdCBhbHdheXMgYmUgd2lsbGluZyB0byBhY2Nl
cHQgdGhlIHdvcnNlIHNvdXJjZSBhbmQvb3IKPj4+PiBiaW5hcnkgY29kZSB0aGF0IHdvdWxkIGJl
IG5lZWRlZCB0byBhdm9pZCBpdC4KPj4+IEhvdyBhYm91dCB1c2luZyB0aGUgbmV4dCBvbmUtbGlu
ZXIgdG8gYXZvaWQgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBjb2RlIDoKPj4+Cj4+PiAvL1JldHVy
bnMgdHJ1ZSBpbiBjYXNlIHdoZW4gdGhlIHRvcCBsZWZ0IDE3IGJpdHMgYXJlIGFsbCB6ZXJvIG9y
IGFyZSBhbGwgb25lCj4+PiByZXR1cm4gKCghKHZhZGRyID4+IDQ3KSkgfHwgKCgodmFkZHIgPj4g
NDcpJjB4MUZGRkYpID09IDB4MUZGRkYpKQo+PiBIYXZlIHlvdSB0cmllZCBjb21waWxpbmcgdGhl
c2UgdHdvIGV4YW1wbGVzIGFuZCBzZWVpbmcgaG93IHRoZXkgZGlmZmVyPwo+Pgo+IFllcywgSSd2
ZSB0cmllZCBpdCB3aXRoIHRoZSBuZXh0IGRyYWZ0IHRlc3QgY29kZS4KPiBUaGUgcmVzdWx0IGxv
b2tzIG9rLCBob3dldmVyIGl0IHRha2VzIHRpbWUgdG8gY2hlY2sgYWxsIDY0Yml0cyB2YWx1ZXMK
PiBvbmUgYnkgb25lLi4uCj4gRG8geW91IHNlZSBhbnkgaXNzdWVzIHdpdGggbmV3IG9uZS1saW5l
cj8KCkphbiBhbHJlYWR5IGlkZW50aWZpZWQgdGhlIGlzc3VlIGluIHRoZSBvdGhlciB0aHJlYWQs
IGFuZCBteSBzdWdnZXN0aW9uCmhlcmUgd2FzIHRvIGluc3BlY3QgdGhlIGdlbmVyYXRlZCBhc3Nl
bWJseSwgd2hpY2ggeW91J2xsIG9ic2VydmUgaXMKc3Vic3RhbnRpYWxseSBtb3JlIGNvbXBsaWNh
dGVkLgoKSG93ZXZlciwgdGhpcyB0aHJlYWQgaXNuJ3QgYmVpbmcgcHJvZHVjdGl2ZS7CoCBZb3Un
cmUgY2xlYXJseSB3YW50aW5nIHRvCmNoYW5nZSB0aGlzIGV4cHJlc3Npb24sIGFuZCB0aGUgbWFp
bnRhaW5lcnMgc2VlIG5vIHJlYXNvbiB0by4KClNvLCB3aGF0IHByb2JsZW0gYXJlIHlvdSBhY3R1
YWxseSB0cnlpbmcgdG8gc29sdmU/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
