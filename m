Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F837B0DD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWER-0001Fp-Of; Tue, 30 Jul 2019 17:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsWEP-0001Fk-TR
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:48:13 +0000
X-Inumbo-ID: 31688c9e-b2f2-11e9-b48d-df16f476691b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31688c9e-b2f2-11e9-b48d-df16f476691b;
 Tue, 30 Jul 2019 17:48:09 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9K8T06w8Hd3s6k5s60DggYdh6xRIk9HLW7M+WN4fvINPd5AO2ZmFp2i36f0R9iU9vs0lHn/IkL
 9XJ/a7K/OpbWAhZHCdK0/Uk+hqzD4Jv2SxIE4rfhh9oaRFe/oGjD48AacMFqrZPcMuVt2WkK3B
 2Iwd3YPbJUR/jEvQd/Ah/ZgyDmZOMi7JJVcOGrCBRKGHoJjGnRsVswNU/AX91Q/aFHRp5JpjkO
 CWhnFCpIXqeLJFKeGZK1A9swRqDvQdQA6kQPfyz1OG4/04+GdFS8MA6DPMw0QHf2+NgE0HFzw6
 vFk=
X-SBRS: 2.7
X-MesageID: 3741112
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3741112"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-9-andrew.cooper3@citrix.com>
 <7528b666-d5d8-9457-9be2-59ccc13797ab@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9ebd7f61-5360-6c6d-23a3-208f5faa76cf@citrix.com>
Date: Tue, 30 Jul 2019 18:48:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7528b666-d5d8-9457-9be2-59ccc13797ab@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 08/10] xen/nodemask: Introduce unlocked
 __nodemask_{set, clear}() helpers
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDcvMjAxOSAxMjoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDcuMjAxOSAx
NDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL25vZGVt
YXNrLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmgKPj4gQEAgLTExLDcgKzEx
LDkgQEAKPj4gICAqIFRoZSBhdmFpbGFibGUgbm9kZW1hc2sgb3BlcmF0aW9ucyBhcmU6Cj4+ICAg
Kgo+PiAgICogdm9pZCBub2RlX3NldChub2RlLCBtYXNrKQkJdHVybiBvbiBiaXQgJ25vZGUnIGlu
IG1hc2sKPj4gKyAqIHZvaWQgX19ub2RlbWFza19zZXQobm9kZSwgbWFzaykJdHVybiBvbiBiaXQg
J25vZGUnIGluIG1hc2sgKHVubG9ja2VkKQo+PiAgICogdm9pZCBub2RlX2NsZWFyKG5vZGUsIG1h
c2spCQl0dXJuIG9mZiBiaXQgJ25vZGUnIGluIG1hc2sKPj4gKyAqIHZvaWQgX19ub2RlbWFza19j
bGVhcihub2RlLCBtYXNrKQl0dXJuIG9mZiBiaXQgJ25vZGUnIGluIG1hc2sgKHVubG9ja2VkKQo+
IFRvIGJlIGhvbmVzdCBJJ20gdW5oYXBweSB0byBzZWUgeW91IGludHJvZHVjZSBuZXcgbmFtZSBz
cGFjZQo+IHZpb2xhdGlvbnMuIEkgcmVhbGl6ZSB5b3Ugd2FudCB0byBoYXZlIHRoZSBub2RlIG1h
c2sgaW50ZXJmYWNlcwo+IG1hdGNoIHRoZSBDUFUgbWFzayBvbmUgYXMgY2xvc2VseSBhcyBwb3Nz
aWJsZSwgYnV0IEkgdGhpbmsgd2UKPiBzaG91bGQgZGl2ZXJnZSBoZXJlIChhbmQgZXZlbnR1YWxs
eSBtYWtlIHRoZSBDUFUgbWFzayBvbmVzCj4gZm9sbG93IHdoYXRldmVyIHJvdXRlIHdlIGdvIGhl
cmUpLiBBcyB0byBuYW1pbmcsIHNpbmNlIHRoZXNlCj4gYXJlIHN0YXRpYyBpbmxpbmVzLCBhIHNp
bmdsZSBsZWFkaW5nIHVuZGVyc2NvcmUgbWF5IGJlIGFuCj4gb3B0aW9uIChhbGJlaXQgSSdkIHBy
ZWZlciB0byBhdm9pZCB0aGlzKS4gQW5vdGhlciBvcHRpb24gd291bGQKPiBiZSB0byBoYXZlIGRv
dWJsZSBpbmZpeCB1bmRlcnNjb3JlcyAobm9kZW1hc2tfX3NldCgpKS4gWWV0Cj4gYW5vdGhlciBv
cHRpb24gd291bGQgYmUgdG8gZXhwcmVzcyB0aGUgbm9uLWF0b21pY2l0eSBpbiBhCj4gdmVyYmFs
IHdheSByYXRoZXIgdGhhbiBieSB0aGUgbnVtYmVyIG9mIHVuZGVyc2NvcmVzIHVzZWQuIEknbQo+
IGFmcmFpZCBJIGRvbid0IGhhdmUgYSBnb29kIG5hbWluZyBzdWdnZXN0aW9uIGluIHRoYXQgY2Fz
ZSwKPiB0aG91Z2guCgpJJ20gcmVhbGx5IG5vdCBhcyBjb25jZXJuZWQgd2l0aCBuYW1lc3BhY2Ug
dmlvbGF0aW9ucyBhcyB5b3Ugc2VlbSB0bwpiZS7CoCBXZSBhcmUgbm90IGEgbGlicmFyeSBoYXZp
bmcgdG8gY29vcGVyYXRlIHdpdGggYXJiaXRyYXJ5IG90aGVycyAtIHdlCmFyZSBhIGZyZWVzdGFu
ZGluZyBidWlsZCB3aXRoIHRoZSBjb21waWxlciBiZWluZyB0aGUgb25seSBvdGhlciBzb3VyY2UK
b2Ygc3ltYm9scyBpbiB0aGUgbmFtZXNwYWNlLsKgIE91ciBjaGFuY2VzIG9mIGNvbGxpZGluZyBh
cmUgdmVyeSBsb3cgdG8KYmVnaW4gd2l0aCwgYW5kIGZpeGluZyBjb25mbGljdHMgaWYgdGhleSBh
cmlzZSBpcyB0cml2aWFsLgoKQXMgeW91IG5vdGUsIHRoZXJlIGlzIG5vdGhpbmcgb2J2aW91cyBh
cyBhbiBhbHRlcm5hdGl2ZS7CoCBUaGUgZG91YmxlCmluZml4IGlzIGEgbm8tZ28gYXMgZmFyIGFz
IEknbSBjb25jZXJuZWQgLSBpdCdzIGZhciB0b28gc3VidGxlIGluIHRoZSBjb2RlLgoKRXJnbywg
Y29uc2lzdGVuY3kgd2l0aCBjcHVtYXNrIGFuZCB0aGUgYml0b3BzIGlzIHRoZSB3aW5uaW5nIGZh
Y3RvciBoZXJlLgoKQXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlIGlmIGFuIGFsdGVybmF0aXZl
IGlzIGNob3NlbiwgaXQgd2lsbCB3YW50CmNoYW5naW5nIGNvbnNpc3RlbnRseSB0aHJvdWdob3V0
IHRoZSB0cmVlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
