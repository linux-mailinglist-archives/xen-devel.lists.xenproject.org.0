Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AC27C6B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 14:05:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmQh-0004On-6P; Thu, 23 May 2019 12:02:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTmQg-0004Oi-4z
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 12:02:38 +0000
X-Inumbo-ID: a6c625e4-7d52-11e9-9cc1-4fbc2aa748e8
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6c625e4-7d52-11e9-9cc1-4fbc2aa748e8;
 Thu, 23 May 2019 12:02:35 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: w/1UtcKfWBcnoOQMJfONfuUJ+tDixUDEwV2MEerp55ZSL7+ceYQXwe1CqRhb2GcfTqR/GsvipY
 I56TUmd47dfLlVRVBKvnJC+fu4JIDDuO2p1CHW3FZJkA89WHKh69oejUeoxiurr36wjvEXEPfQ
 KnUqxj1h0vEJ7hECb1+zHLwJ+tIyUO4GDDoPeRQGbmEYWpaVc2zLPR0qeBWPaekkdMQTY1Thfy
 AnlOtAbpnJ2UWMaZXKqANzsh3RKI6m7Qj3yV6LP5svhqjhq4MHbtCiZjCM82qNAi1SJFLcQJoO
 Roc=
X-SBRS: 2.7
X-MesageID: 824287
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="824287"
To: Jan Beulich <JBeulich@suse.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-3-git-send-email-andrew.cooper3@citrix.com>
 <5CE67C5B0200007800231A83@prv1-mh.provo.novell.com>
 <701d553c-20a8-7b1a-6023-35ed1008ce65@citrix.com>
 <5CE686ED0200007800231AC4@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e6814c96-cf1c-d28e-4a37-4a0072baa7e7@citrix.com>
Date: Thu, 23 May 2019 13:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE686ED0200007800231AC4@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] docs: Introduce some hypercall page
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDUvMjAxOSAxMjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDUuMTkg
YXQgMTM6MDEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjMvMDUv
MjAxOSAxMTo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyMy4wNS4xOSBhdCAxMjoy
MCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IFRoaXMgYWxzbyBpbnRy
b2R1Y2VkIHRoZSB0b3AtbGV2ZWwgR3Vlc3QgRG9jdW1lbnRhdGlvbiBzZWN0aW9uLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPj4+IExhcmdlIHBhcnRzIG9mIHRoaXMgYXJlIGVudGlyZWx5IHg4Ni1jZW50cmljLCB5ZXQg
aHlwZXJjYWxscyBleGlzdAo+Pj4gZm9yIEFybSBhcyB3ZWxsLiBJZiB0aGlzIGlzIGludGVudGlv
bmFsLCB0aGVuIEkgdGhpbmsgeW91IHNob3VsZCBzYXkKPj4+IHNvIGFib3ZlLgo+PiBJdCBpcyBh
bGwgeDg2IHNwZWNpZmljLCB3aGljaCBpcyB3aHkgaXQgaXMgZ3JvdXBlZCB1bmRlciAieDg2IGd1
ZXN0Cj4+IGRvY3VtZW50YXRpb24iLgo+IE5laXRoZXIgdGhlIHBhdGggbm9yIGFueXRoaW5nIG5l
YXIgdGhlIHRvcCBvZiB0aGUgYWRkZWQgZmlsZSBzdWdnZXN0Cj4gdGhpcyBpcyAieDg2IGd1ZXN0
IGRvY3VtZW50YXRpb24iLiBIb3cgaXMgb25lIHRvIG1ha2UgdGhpcwo+IGNvbm5lY3Rpb24/IE9y
IGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBzb2xlIGVudHJ5IHRoYXQgZW5kcyB1cCBpbgo+IGRv
Y3MvZ3Vlc3QtZ3VpZGUvaW5kZXgucnN0PwoKWWVzLCBhbmQgYnkgdGhlIHdheSB5b3UgYXNrIHRo
aXMgcXVlc3Rpb24sIEkgcHJlc3VtZSB5b3UgaGF2ZW4ndCBzZWVuCmhvdyBzcGhpbnggcmVuZGVy
cyBpdC4KCk5ldmVydGhlbGVzcywgdGhlIG9ic2VydmF0aW9uIGJlbG93IGRvZXMgd2FycmFudCBz
b21lIGNoYW5nZXMgaGVyZS4KCj4KPiBPbmUgb3RoZXIgcmVtYXJrOiBXaG8ncyB0aGUgaW50ZW5k
ZWQgYXVkaWVuY2U/CgpDaXRpbmcgdGhlIHBhdGNoOgoKPiBUaGlzIGRvY3VtZW50YXRpb24gY29u
Y2VybnMgdGhlIEFQSXMgYW5kIEFCSXMgYXZhaWxhYmxlIHRvIGd1ZXN0cy7CoCBJdCBpcwo+IGlu
dGVuZGVkIGZvciBPUyBkZXZlbG9wZXJzIHRyeWluZyB0byB1c2UgYSBYZW4gZmVhdHVyZSwgYW5k
IGZvciBYZW4KPiBkZXZlbG9wZXJzCj4gdG8gYXZvaWQgYnJlYWtpbmcgdGhpbmdzLgoKCj4gUGVv
cGxlCj4gd3JpdGluZyBjb2RlIHRhcmdldGluZyB0aGUgaHlwZXJjYWxsIGludGVyZmFjZSwgSSBh
c3N1bWUuIFRoaXMKPiBpbmNsdWRlcyBwZW9wbGUgd2hvIG1heSBub3QgYXQgYWxsIGJlIGZhbWls
aWFyIHdpdGggdGhlIEFUJlQKPiBwZWN1bGlhcml0aWVzIG9mIHRoZSBhc3NlbWJseSBsYW5ndWFn
ZSB1c2VkIChtYWlubHkgZm9yCj4gbmFtaW5nIHJlZ2lzdGVycykuIEl0J3MgZWFzeSBmb3IgdGhl
IHRvIHVuZGVyc3RhbmQgd2hhdCBpcwo+IG1lYW50IG5ldmVydGhlbGVzcywgYnV0IHRvIGJlIGhv
bmVzdCBJJ2QgcHJlZmVyIGlmIHRoZSBTRE0gLwo+IFBNIHJlZ2lzdGVyIG5hbWVzIHdlcmUgdXNl
ZCBpbnN0ZWFkLCBpLmUuIGluIHBhcnRpY3VsYXIKPiB3aXRob3V0IHRoZSAlIHByZWZpeGVzIChi
dXQgYWxzbyBvbWl0dGluZyB0aGUgJCBvbiB0aGUgSU5UCj4gb3BlcmFuZCkuCgpXaGlsZSB0aGlz
IGNhc2UgaXMsIGRyb3BwaW5nIHRoZSBBVCZULWlzbXMgaXMgZWFzeSwgSSdtIG5vdCBjb252aW5j
ZWQKdGhhdCB3aWxsIGJlIHRoZSBjYXNlIGVsc2V3aGVyZS4KCkFsc28sIEkgZG9uJ3Qgd2FudCB1
cyB0byBiZSBpbiBhIGNhc2Ugd2hlcmUgd2UgZGV2ZWxvcCBleGNsdXNpdmVseSB3aXRoCkFUJlQs
IGJ1dCBoYXZlIG91ciBkb2N1bWVudGF0aW9uIHdyaXR0ZW4gaW4gSW50ZWwgc3ludGF4LgoKPgo+
PiBBcyBmb3IgZnV0dXJlIHBsYW5zLCB0aGUgYWN0dWFsIGh5cGVyY2FsbHMgd2lsbCBsaXZlIGlu
IHRoZSBhcmNoaXRlY3R1cmUKPj4gbmV1dHJhbCBndWVzdCBkb2N1bWVudGF0aW9uIHNlY3Rpb24u
Cj4+Cj4+IEFSTSBkb2Vzbid0IGFjdHVhbGx5IHVzZSBhbnl0aGluZyBoZXJlLCBiZWNhdXNlIHRo
ZXkgaGF2ZSBhIHNpbmdsZQo+PiBzcGVjLWRlZmluZWQgaW5zdHJ1Y3Rpb24gZm9yIG1ha2luZyBo
eXBlcmNhbGxzIHdoaWNoIGV4aXN0cyBpbiBhbGwKPj4gdmlydC1jYXBhYmxlIGhhcmR3YXJlLgo+
IEJ1dCByZWdpc3RlciB1c2FnZSB3b3VsZCBzdGlsbCBiZSByZWxldmFudCB0byBkZXNjcmliZSwg
ZXZlbiBpZgo+IGl0IG1heSBqdXN0IGJlIGJ5IHN0YXRpbmcgdGhhdCBpdCBtYXRjaGVzIGEgY2Vy
dGFpbiBBQkkgZGVmaW5lZAo+IGVsc2V3aGVyZS4KClRoYXQgYmVsb25ncyBpbiBBUk0ncyBoeXBl
cmNhbGwtYWJpLnJzdCwgbm90IHg4NidzLCBhbmQgaXQgaXMgdGhpcwpvYnNlcnZhdGlvbiB3aGlj
aCBkZW1vbnN0cmF0ZXMgdGhhdCBhIHBhdGggZGlzdGluY3Rpb24gaXMgbmVjZXNzYXJ5LgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
