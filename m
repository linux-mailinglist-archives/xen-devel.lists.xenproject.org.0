Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ABC4A6D4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 18:27:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdGuA-0005n9-Bw; Tue, 18 Jun 2019 16:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Le+r=UR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdGu8-0005n2-Nd
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 16:24:16 +0000
X-Inumbo-ID: 82c18d44-91e5-11e9-b40b-0bfbe23825bf
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82c18d44-91e5-11e9-b40b-0bfbe23825bf;
 Tue, 18 Jun 2019 16:24:14 +0000 (UTC)
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
IronPort-SDR: IzsYEc/hhx7KyHb/Eg4pfzShocZNSrS5Sq0PEEMf/UGjkcrBBsCXoJj5hlqbz2Jjwc2hjaZ65J
 9rV1EJI40er8GD2ukKkz+1lgphJVyxnnsH45G3q2vovRHuOkfrPlYg0TbZh7gPgQZ/+2cg2Djp
 ArhAP2OdeiamP6SaPYHVnG/5fgGP2j7qugudqbUIOE2kjq4bOO/YlvOtWiYbi7g8RMLHofv9Td
 vi2DXa7VlCBqGU57xFfbd3TgAOQwIyOtkJK2UHZj0KMnzw+6JrhaF2nGfqOi+eKQygV+Xu2VEa
 sI8=
X-SBRS: 2.7
X-MesageID: 1913369
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1913369"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84F8020000780021F248@prv1-mh.provo.novell.com>
 <3ac4dbdd-24fb-a5e8-5848-93cfe4374a49@citrix.com>
 <5CFF80500200007800236EFA@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b76883f0-871c-9387-3eee-649aa084d3c6@citrix.com>
Date: Tue, 18 Jun 2019 17:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5CFF80500200007800236EFA@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 30/50] x86emul: support AVX512{F,
 _VBMI2} compress/expand insns
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

T24gMTEvMDYvMjAxOSAxMToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDYuMTkg
YXQgMTY6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiArI2lmIF9fR05VQ19fID4gNyAvKiBj
YW4ndCBjaGVjayBmb3IgX19BVlg1MTJWQk1JMl9fIGhlcmUgKi8KPj4gV2h5IG5vdD8KPiBCZWNh
dXNlIHRoYXQgd291bGQgcmVxdWlyZSBwYXNzaW5nIC1tYXZ4NTEydmJtaTIgKG9yIGVuYWJsaW5n
IHRoZQo+IGZlYXR1cmUgdmlhICNwcmFnbWEpIHdoaWNoIGluIHR1cm4gd291bGQgbmVlZCBnYXRp
bmcgb24gY29tcGlsZXIKPiB2ZXJzaW9uLCBvciBlbHNlIHRoZSBoYXJuZXNzIGNvdWxkbid0IGJl
IGJ1aWx0IHdpdGggZ2NjNyBhdCBhbGwgYW55bW9yZS4KCklzIHRoYXQgcmVhbGx5IGEgcHJvYmxl
bT/CoCBXZSBhbHJlYWR5IHJlcXVpcmUgYQpwcmFjdGljYWxseS1ibGVlZGluZy1lZGdlIGJpbnV0
aWxzLgoKSXJyZXNwZWN0aXZlLCBhcmUgeW91IHNheWluZyB0aGF0IF9fQVZYNTEyVkJNSTJfXyBy
ZWFsbHkgaXMgY29uZGl0aW9uYWwKb24gLW1hdng1MTJ2Ym1pMiBiZWluZyBwYXNzZWQ/wqAgSWYg
c28sIHdoYXQncyB3cm9uZyB3aXRoIHVzaW5nIGNjLW9wdGlvbgp0byBnYWluIGl0IGNvbmRpdGlv
bmFsbHk/Cgo+Cj4+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4+PiArKysgYi94ZW4v
dG9vbHMvZ2VuLWNwdWlkLnB5Cj4+PiBAQCAtMjY2LDEwICsyNjYsMTAgQEAgZGVmIGNydW5jaF9u
dW1iZXJzKHN0YXRlKToKPj4+ICAgICAgICAgICAgICAgICAgICBBVlg1MTJCVywgQVZYNTEyVkws
IEFWWDUxMl80Vk5OSVcsIEFWWDUxMl80Rk1BUFMsCj4+PiAgICAgICAgICAgICAgICAgICAgQVZY
NTEyX1ZQT1BDTlREUV0sCj4+PiAgCj4+PiAtICAgICAgICAjIEFWWDUxMiBleHRlbnNpb25zIGFj
dGluZyBzb2xlbHkgb24gdmVjdG9ycyBvZiBieXRlcy93b3JkcyBhcmUgbWFkZQo+Pj4gKyAgICAg
ICAgIyBBVlg1MTIgZXh0ZW5zaW9ucyBhY3RpbmcgKHNvbGVseSkgb24gdmVjdG9ycyBvZiBieXRl
cy93b3JkcyBhcmUgbWFkZQo+IEJlY2F1c2UgVkJNSTIgZG9lc24ndCBhY3QgX3NvbGVseV8gb24g
dmVjdG9ycyBvZiBieXRlcy93b3Jkcy4KPiBUaGVyZSBhcmUgYWxzbyBzaGlmdCBpbnNucyBhY3Rp
bmcgb24gdmVjdG9ycyBvZiBkd29yZHMvcXdvcmRzLgoKSW4gd2hpY2ggY2FzZSBJJ2QgZXhwZWN0
IHMvc29sZWx5Ly8gaGVyZS7CoCBQdXR0aW5nIHNvbGVseSBpbiBicmFja2V0cwpkb2Vzbid0IGNv
bnZleSBhbnkgaW5mb3JtYXRpb24gcmVsZXZhbnQgdG8gIm5vdCByZWFsbHkgc29sZWx5IGFueSBt
b3JlIi4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
