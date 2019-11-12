Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93DF90DC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 14:43:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUWOH-0003FM-Hj; Tue, 12 Nov 2019 13:39:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aeAZ=ZE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUWOF-0003FF-Fy
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 13:39:27 +0000
X-Inumbo-ID: d7c5a5ca-0551-11ea-9631-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7c5a5ca-0551-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573565966;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mpIPMoZwJ06QOmuBZ/yvujf+G4jQRa5bai3E6PlWBUw=;
 b=f6RGGkdQdOk+/F8XiwKrWd8cDKaypj5WouoXQeuBBF6bx3nIdx1h/GM8
 5buC6R9Ez8tjep2yqdOaM9KswqPMuoJYHE8io6UQiu4+VfkAai40H16/3
 bBs8SGpgtJV+8OsYliU1f7eatdi87DXU2v1+6Dsy1hixqvKG3wy28Tnds 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aEe1nfPHpq/5O3my+LjH9LaPDVm49Ec+4I6/S85+bedMUEtvu19AAcx6hrhCfcA1mq06t3Abcy
 JH/+l5+cb4n247t77u/3PBmsJNQw8g+xbRi/xsLD1sWpFAsUpd+H/6D9FRo2hKLbPw8YgjAu5s
 FM8yaTGDe6Qqc9jJ+DDWQg0whlU/mC/Qy6BRCOrIZxlh5VrOO4YB+Q91piNOWd1nnAqbCoFyDC
 Ce1MKveB2M0e/dpfssMPoNwfV/Za0u4oryqNy0dCLwNwkgRHbhYRqlu6FhBsHqdMV56Wf+IzFq
 gFI=
X-SBRS: 2.7
X-MesageID: 8306945
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8306945"
To: Jan Beulich <jbeulich@suse.com>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
 <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6ca0c51b-eb61-338f-4592-e7dd6ea3dc61@citrix.com>
Date: Tue, 12 Nov 2019 13:39:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTEvMjAxOSAwODozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMTEuMjAxOSAy
MToyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9t
bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+PiBAQCAtMTA3Nyw3ICsxMDc3
LDcgQEAgbG9uZyBkb19zZXRfc2VnbWVudF9iYXNlKHVuc2lnbmVkIGludCB3aGljaCwgdW5zaWdu
ZWQgbG9uZyBiYXNlKQo+PiAgfQo+PiAgCj4+ICAKPj4gLS8qIFJldHVybnMgVFJVRSBpZiBnaXZl
biBkZXNjcmlwdG9yIGlzIHZhbGlkIGZvciBHRFQgb3IgTERULiAqLwo+PiArLyogUmV0dXJucyB0
cnVlIGlmIGdpdmVuIGRlc2NyaXB0b3IgaXMgdmFsaWQgZm9yIEdEVCBvciBMRFQuICovCj4+ICBp
bnQgY2hlY2tfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3QgZG9tYWluICpkb20sIHNlZ19kZXNjX3Qg
KmQpCj4gV291bGRuJ3QgY2hhbmdlcyBsaWtlIHRoaXMgb25lIGJldHRlciBiZSBhY2NvbXBhbmll
ZCBieSBhbHNvIGFkanVzdGluZwo+IHRoZSByZXR1cm4gdHlwZSBvZiB0aGUgZnVuY3Rpb24gKHRo
ZXJlIGFyZSBtb3JlIGV4YW1wbGVzIGZ1cnRoZXIgZG93bgo+IGluIGNvbW1vbi90aW1lci5jKT8K
Ck5vLsKgIFRoYXQgaXMgYW4gdW5yZWxhdGVkIGNoYW5nZS4KCklmIEkgd2VyZSBmbHVzaCB3aXRo
IGZyZWUgdGltZSB0aGVuIEkgbWlnaHQgY29uc2lkZXIgZG9pbmcgdGhpcyBhbmQKc3Vic3RhbnRp
YWxseSBpbmNyZWFzZSB0aGUgdGVzdCBidXJkZW4uCgpBcyBpdCBzdGFuZHMsIHRoaXMgcmVxdWVz
dCBpcyBzY29wZSBjcmVlcC4KCj4KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9l
ZmliaW5kLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9lZmliaW5kLmgKPj4g
QEAgLTEwNyw3ICsxMDcsNyBAQCB0eXBlZGVmIHVpbnQ2NF90ICAgVUlOVE47Cj4+ICAjZGVmaW5l
IFBPU1RfQ09ERShfRGF0YSkKPj4gIAo+PiAgCj4+IC0jZGVmaW5lIEJSRUFLUE9JTlQoKSAgICAg
ICAgd2hpbGUgKFRSVUUpOyAgICAvLyBNYWtlIGl0IGhhbmcgb24gQmlvc1tEYmddMzIKPj4gKyNk
ZWZpbmUgQlJFQUtQT0lOVCgpICAgICAgICB3aGlsZSAodHJ1ZSk7ICAgIC8vIE1ha2UgaXQgaGFu
ZyBvbiBCaW9zW0RiZ10zMgo+IFlvdSBkbyByZWFsaXplIHRoYXQgdGhpcyBhbmQgb3RoZXIgRUZJ
IGhlYWRlcnMgKGFuZCBwZXJoYXBzIGFsc28KPiBBQ1BJIG9uZXMpIGFyZSBsYXJnZWx5IHZlcmJh
dGltIGltcG9ydHMgZnJvbSBvdGhlciBwcm9qZWN0cywKPiB1cGRhdGluZyBvZiB3aGljaCB3aWxs
IGJlY29tZSBsZXNzIHN0cmFpZ2h0Zm9yd2FyZCBieSBzdWNoCj4gcmVwbGFjZW1lbnRzPyBXaGVu
IHB1bGxpbmcgaW4gdGhlIEVGSSBvbmVzIEkgaW50ZW50aW9uYWxseSBkaWQgbm90Cj4gZmlkZGxl
IHdpdGggdGhlbSBtb3JlIHRoYW4gYWJzb2x1dGVseSBuZWNlc3NhcnkuCgpZZXMsIGFuZD8KCkl0
IGlzIHVuYWNjZXB0YWJsZSBmb3IgdGhlIGFjcGkgaGVhZGVycyB0byBmb3JjaWJseSByZWRlZmlu
ZSBhbnl0aGluZyBpbgp0aGVpciBzY29wZSwgYW5kIGl0cyBkZWZpbml0aW9uIG9mIHZhX2FyZ3Mg
aXMgZG93bnJpZ2h0IGRhbmdlcm91cy4KCkFsbCBqdW5rIGxpa2UgdGhpcyBpbiBoZWFkZXIgZmls
ZXMgZG9lcyBub3RoaW5nIGJ1dCB3YXN0ZSBzcGFjZSBhbmQKY29tcGlsZXIgZWZmb3J0IGR1cmlu
ZyBjb21waWxhdGlvbiwgYW5kIGxlYXZlIHBlb3BsZSB3aXRoIGFuIHNsaW0gY2hhbmNlCm9mIHNo
b290aW5nIHRoZW1zZWx2ZXMgaW4gdGhlIGZvb3QuCgpIb3cgbWFueSB0aW1lcyBkbyB0aGVzZSBn
ZXQgdG91Y2hlZD/CoCAoUmhldG9yaWNhbCBxdWVzdGlvbi7CoCBUaGUgYW5zd2VyCmlzIG9uY2Ug
KG1lLCBjbGFuZyBidWlsZCBmaXgpIHNpbmNlIHRoZWlyIGludHJvZHVjdGlvbiwgOCwgOSBhbmQg
MTAKeWVhcnMgYWdvKS4KCkZvciB0aGUgMzBzIG9mIGVmZm9ydCByZXF1aXJlZCB0byB0d2VhayBv
bmNlLWluLWEtYmx1ZS1tb29uIHBhdGNoZXMKd2hpY2ggdG91Y2ggdGhlc2UgaGVhZGVycywgdHJp
bW1pbmcgdGhlIGp1bmsgaXMgYSBuby1icmFpbmVyLgoKPgo+IElmIGl0IHdhc24ndCBmb3IgdGhp
cywgSSdkIGhhdmUgYWNrLWVkIHRoZSBwYXRjaCBkZXNwaXRlIHRoZSBvdGhlcgo+IHJlbWFyayBh
Ym92ZS4KPgo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vbW0uaAo+PiBAQCAtNjA3LDcgKzYwNyw3IEBAIGludCBfX211c3RfY2hlY2sgZG9uYXRl
X3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwKPj4gICNkZWZp
bmUgUkFNX1RZUEVfVU5VU0FCTEUgICAgIDB4MDAwMDAwMDQKPj4gICNkZWZpbmUgUkFNX1RZUEVf
QUNQSSAgICAgICAgIDB4MDAwMDAwMDgKPj4gICNkZWZpbmUgUkFNX1RZUEVfVU5LTk9XTiAgICAg
IDB4MDAwMDAwMTAKPj4gLS8qIFRSVUUgaWYgdGhlIHdob2xlIHBhZ2UgYXQgQG1mbiBpcyBvZiB0
aGUgcmVxdWVzdGVkIFJBTSB0eXBlKHMpIGFib3ZlLiAqLwo+PiArLyogdHJ1ZSBpZiB0aGUgd2hv
bGUgcGFnZSBhdCBAbWZuIGlzIG9mIHRoZSByZXF1ZXN0ZWQgUkFNIHR5cGUocykgYWJvdmUuICov
Cj4+ICBpbnQgcGFnZV9pc19yYW1fdHlwZSh1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9u
ZyBtZW1fdHlwZSk7Cj4gSW4gb3RoZXIgY29tbWVudHMgSSBhbHJlYWR5IHdhc24ndCBzdXJlIGFi
b3V0IHN1Y2ggcmVwbGFjZW1lbnRzLCBidXQKPiBsZXQgdGhlbSBiZS4gSGVyZSwgaG93ZXZlciwg
eW91IHZpb2xhdGUgY29kaW5nIHN0eWxlIGJ5IHVzaW5nICJ0cnVlIgo+IGluc3RlYWQgb2YgIlRy
dWUiICh0aGUgZnVuY3Rpb24gcmV0dXJuaW5nICJpbnQiIGZvciBub3cgZG9lc24ndCBldmVuCj4g
YWxsb3cgdGhlIGV4Y3VzZSBvZiBtZWFuaW5nIHRoZSBpZGVudGlmaWVyIHJhdGhlciB0aGFuIHRo
ZSB3b3JkKS4KCkZpeGVkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
