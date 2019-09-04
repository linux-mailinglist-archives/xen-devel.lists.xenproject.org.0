Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F8A7F2E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:21:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ROU-0002C0-PV; Wed, 04 Sep 2019 09:16:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWnQ=W7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5ROS-0002Bn-VI
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:16:00 +0000
X-Inumbo-ID: 9b9352a2-cef4-11e9-abad-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b9352a2-cef4-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567588559;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NlRVRO59DWMWeQ7qqS9918mYSw5Lur+NH02k4B5/NbA=;
 b=B1jEuXHDU5uk/tDlvPPQwkRkR5LN73p/xfw8pV+T1iWHNmplB5Vj+9nj
 B9yQ326z65Lus+FexclyZkyTpTrKPkKwtz9Lbo2wB6Gn8QILgIHyXZQo8
 MCofDeUjASRozFxlp1NqDSHGxZtANB1v6yHoggZEr8NvwiNeOTi3+U18P E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1hRLNLCXa7ZzTpswsRQHBxqmWzMN/yMYFkTuPbaH5jy7gg8rLHFIsyajIxsev2jxPtiee9AL2l
 xG1jrGUP3iwcEU6g4HYu5bOuyo86wV48n6RneznZET2Gpm4zOPFl7/KZKnbAUt0iiXoIoDsZpz
 QJANNQqkXhz0xufLcD6sEP0I3E500TFnCI1p+y5pFOD8w7LM1DmmSU9u/mtZNVYJlQfoZP2jpC
 jCUgLr/pF6X9YpcbL7CkQSbIIevyuvkHFQ2RnOlry7h0MZM1whYmwT7R2ochhWk2dVrRjJQluI
 vkY=
X-SBRS: 2.7
X-MesageID: 5377411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5377411"
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
 <eea8cf6b-ff96-765f-d9a4-2064a75979a3@citrix.com>
 <4c3acd1d-6b63-eaec-63ec-854f00541653@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6e775577-d254-cd20-0540-1e7aba9d6874@citrix.com>
Date: Wed, 4 Sep 2019 10:15:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4c3acd1d-6b63-eaec-63ec-854f00541653@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 TimDeegan <tim@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDkvMjAxOSAxMDoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNC4wOS4xOSAx
MDo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDQvMDkvMjAxOSAwOTo0MCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNC4wOS4yMDE5IDEwOjI1LCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+IE9uIDAzLjA5LjE5IDE3OjA5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDMu
MDkuMjAxOSAxNzowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+IE9uIDAzLjA5LjE5IDE2
OjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyOS4wOC4yMDE5IDEyOjE4LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+PiBJbiBvcmRlciB0byBoYXZlIHVuaXF1ZSBuYW1lcyB3
aGVuIGRvaW5nIGxvY2sgcHJvZmlsaW5nIHNldmVyYWwKPj4+Pj4+Pj4gbG9jYWwKPj4+Pj4+Pj4g
bG9ja3MgImxvY2siIG5lZWQgdG8gYmUgcmVuYW1lZC4KPj4+Pj4+PiBCdXQgdGhlc2UgYXJlIGFs
bCBuYW1lZCBzaW1wbHkgImxvY2siIGZvciBhIGdvb2QgcmVhc29uLCBpbmNsdWRpbmcKPj4+Pj4+
PiBiZWNhdXNlIHRoZXkncmUgYWxsIGZ1bmN0aW9uIHNjb3BlIHN5bWJvbHMgKGFuZCB0eXBpY2Fs
bHkgdGhlCj4+Pj4+Pj4gZnVuY3Rpb25zIGFyZSBhbGwgc3VmZmljaWVudGx5IHNob3J0KS4gVGhl
IGlzc3VlIHN0ZW1zIGZyb20gdGhlCj4+Pj4+Pj4gZHVhbCB1c2Ugb2YgIm5hbWUiIGluCj4+Pj4+
Pj4KPj4+Pj4+PiAjZGVmaW5lIF9MT0NLX1BST0ZJTEUobmFtZSkgeyAwLCAjbmFtZSwgJm5hbWUs
IDAsIDAsIDAsIDAsIDAgfQo+Pj4+Pj4+Cj4+Pj4+Pj4gc28gSSdkIHJhdGhlciBzdWdnZXN0IG1h
a2luZyB0aGlzIGEgZGVyaXZhdGlvbiBvZiBhIG5ldwo+Pj4+Pj4+Cj4+Pj4+Pj4gI2RlZmluZSBf
TE9DS19QUk9GSUxFX05BTUUobG9jaywgbmFtZSkgeyAwLCAjbmFtZSwgJmxvY2ssIDAsIDAsCj4+
Pj4+Pj4gMCwgMCwgMCB9Cj4+Pj4+Pj4KPj4+Pj4+PiBpZiB0aGVyZSdzIG5vIG90aGVyICh0cmFu
c3BhcmVudCkgd2F5IG9mIGRpc2FtYmlndWF0aW5nIHRoZSBuYW1lcy4KPj4+Pj4+IFRoaXMgd2ls
bCByZXF1aXJlIHRvIHVzZSBhIGRpZmZlcmVudCBERUZJTkVfU1BJTkxPQ0soKSB2YXJpYW50LAo+
Pj4+Pj4gc28gZS5nLgo+Pj4+Pj4gREVGSU5FX1NQSU5MT0NLX0xPQ0FMKCksIHdoaWNoIHdpbGwg
dGhlbiBpbmNsdWRlIHRoZSBuZWVkZWQKPj4+Pj4+ICJzdGF0aWMiIGFuZAo+Pj4+Pj4gYWRkICJA
PGZ1bmM+IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMgdGhpcyBva2F5Pwo+Pj4+PiBU
byBiZSBmcmFuayAtIG5vdCByZWFsbHkuIEkgZGlzbGlrZSBib3RoLCBhbmQgd291bGQgaGVuY2Ug
cHJlZmVyIHRvCj4+Pj4+IHN0aWNrIHRvIHdoYXQgdGhlcmUgaXMgY3VycmVudGx5LCB1bnRpbCBz
b21lb25lIGludmVudHMgYSB0cmFuc3BhcmVudAo+Pj4+PiB3YXkgdG8gZGlzYW1iaWd1YXRlIHRo
ZXNlLiBJJ20gc29ycnkgZm9yIGJlaW5nIHVuaGVscGZ1bCBoZXJlLgo+Pj4+IEkgdGhpbmsgSSBo
YXZlIGZvdW5kIGEgd2F5OiBJIGNvdWxkIGFkZCBfX0ZJTEVfXyBhbmQgX19MSU5FX18gZGF0YSB0
bwo+Pj4+IHN0cnVjdCBsb2NrX3Byb2ZpbGUuIEluIGxvY2tfcHJvZl9pbml0KCkgSSBjb3VsZCBs
b29rIGZvciBub24tdW5pcXVlCj4+Pj4gbG9jayBuYW1lcyBhbmQgbWFyayB0aG9zZSB0byBiZSBw
cmludGVkIHdpdGggdGhlIF9fRklMRV9fIGFuZCBfX0xJTkVfXwo+Pj4+IGRhdGEgYWRkZWQgdG8g
dGhlIG5hbWVzLgo+Pj4+Cj4+Pj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNo
Pwo+Pj4gSSB3b3VsZCBiZSwgYnV0IEknbSBhZnJhaWQgQW5kcmV3IHdvbid0IChhcyB3aXRoIGFu
eSBuZXcgdXNlcyBvZgo+Pj4gX19MSU5FX18pLgo+Pgo+PiBUaGUgb2stbmVzcyBvZiB1c2luZyBf
X0xJTkVfXyBpcyBpbnZlcnNlbHkgcHJvcG9ydGlvbmFsIHRvIHRoZQo+PiBsaWtlbGlob29kIG9m
IGRldmVsb3BpbmcgYSBsaXZlcGF0Y2ggZm9yIHRoaXMgcGFydGljdWxhciBidWlsZCBvZiBYZW4s
Cj4+IGFuZCB3aGF0IGFkZGl0aW9uYWwgcGF0Y2hpbmcgZGVsdGEgaXQgd291bGQgY2F1c2UgdGhy
b3VnaCB1bnJlbGF0ZWQKPj4gY2hhbmdlcy4KPgo+IE5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2gs
IGJ1dCB0byBfX0xJTkVfXyBhbmQgbGl2ZXBhdGNoaW5nOiBoYXZlIHlvdQo+IGNvbnNpZGVyZWQg
dG8gdXNlIHRoZSAiI2xpbmUiIGRpcmVjdGl2ZSB0byBhdm9pZCB1bnJlbGF0ZWQgZGlmZnM/CgpU
aGVyZSBhcmUgd2F5cyB0byBwbGF5IHdpdGggX19MSU5FX18sIHllcy7CoCAjbGluZSB3YXMgYnJv
dWdodCB1cCBpbiB0aGUKb3JpZ2luYWwgZGlzY3Vzc2lvbi4KCkFzIGEgdGhvdWdodCBleHBlcmlt
ZW50LCBob3cgd291bGQgeW91IGV4cGVjdCB0aGlzIHRvIGJlIHVzZWQgdG8Kc2ltcGxpZnkgYSBs
aXZlcGF0Y2g/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
