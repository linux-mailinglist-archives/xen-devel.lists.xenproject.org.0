Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C3148173
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 14:02:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcqHc-00063I-9o; Mon, 17 Jun 2019 11:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ct8y=UQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hcqHa-00063D-Ul
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 11:58:42 +0000
X-Inumbo-ID: 3dd8efcc-90f7-11e9-ad42-57f4e60efce0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dd8efcc-90f7-11e9-ad42-57f4e60efce0;
 Mon, 17 Jun 2019 11:58:38 +0000 (UTC)
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
IronPort-SDR: RzO3K4FVZoQXC0NQJZlLwS1eK5GQjYxbH6ippV2EvSXVjBFnTHue0OVtrpQ1OPZdg8qD/Olxmz
 DdnZMN8aYYAERvAElaVDGK0UVPuOgFLlacuBf0svf1pCJfLGyzEY1FSrv6VEulYr+ka7+WVjWm
 KRgNkjmtPxEk6k4XRNdC3joEQO8cdIk7ws8OYFlGD/8oUdYFFUsQL1tCCWweO/3BGaVVUj7yom
 aCnZJ79HOtvvMMDRcXWpk9HVDeKOiq4AY/DG3WSrYEjVUS4FF42U46sxzotOKZGoyacCt33HSG
 m5s=
X-SBRS: 2.7
X-MesageID: 1823256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1823256"
To: George Dunlap <george.dunlap@citrix.com>, Alexandru Stefan ISAILA
 <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
 <d541ca85-a0b0-79e9-d8cc-4b414ceb87c0@bitdefender.com>
 <0d4a5347-b094-d5ad-2681-5d3b97eeca37@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a641028a-f057-2658-a05a-a53ef4f4de78@citrix.com>
Date: Mon, 17 Jun 2019 12:58:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0d4a5347-b094-d5ad-2681-5d3b97eeca37@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
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
Cc: Tamas K Lengyel <tamas.lengyel@zentific.com>,
 Paul Durrant <paul.durrant@citrix.com>, Tim Deegan <tim@xen.org>, Razvan
 Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDYvMjAxOSAxMTo0OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA2LzEzLzE5IDEx
OjU2IEFNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4KPj4gT24gMjYuMDkuMjAx
OCAxOTo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IEZyb206IElzYWlsYSBBbGV4YW5kcnUg
PGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWRkcyBhY2Nlc3Mg
Y29udHJvbCBmb3IgTlBUIG1vZGUuCj4+Pgo+Pj4gVGhlcmUgYXJlbuKAmXQgZW5vdWdoIGV4dHJh
IGJpdHMgdG8gc3RvcmUgdGhlIGFjY2VzcyByaWdodHMgaW4gdGhlIE5QVCBwMm0KPj4+IHRhYmxl
LCBzbyB3ZSBhZGQgYSByYWRpeCB0cmVlIHRvIHN0b3JlIGV4dHJhIGluZm9ybWF0aW9uLgo+Pj4K
Pj4+IEZvciBlZmZpY2llbmN5Ogo+Pj4gICAtIE9ubHkgYWxsb2NhdGUgdGhpcyByYWRpeCB0cmVl
IHdoZW4gd2UgZmlyc3Qgc3RvcmUgIm5vbi1kZWZhdWx0Igo+Pj4gICAgIGV4dHJhIGluZm9ybWF0
aW9uCj4+Pgo+Pj4gICAtIFJlbW92ZSBlbnRpcmVzIHdoaWNoIG1hdGNoIHRoZSBkZWZhdWx0IGV4
dHJhIGluZm9ybWF0aW9uIHJhdGhlcgo+Pj4gICAgIHRoYW4gY29udGludWluZyB0byBzdG9yZSB0
aGVtCj4+Pgo+Pj4gICAtIEZvciBzdXBlcnBhZ2VzLCBvbmx5IHN0b3JlIGFuIGVudHJ5IGZvciB0
aGUgZmlyc3QgZ2ZuIGluIHRoZQo+Pj4gICAgIHN1cGVycGFnZS4gIFVzZSB0aGUgb3JkZXIgb2Yg
dGhlIHAybSBlbnRyeSBiZWluZyByZWFkIHRvIGRldGVybWluZQo+Pj4gICAgIHRoZSBwcm9wZXIg
cGxhY2UgdG8gbG9vayBpbiB0aGUgcmFkaXggdGFibGUuCj4+Pgo+Pj4gTW9kaWZ5IHAybV90eXBl
X3RvX2ZsYWdzKCkgdG8gYWNjZXB0IGFuZCBpbnRlcnByZXQgYW4gYWNjZXNzIHZhbHVlLAo+Pj4g
cGFyYWxsZWwgdG8gdGhlIGVwdCBjb2RlLgo+Pj4KPj4+IEFkZCBhIHNldF9kZWZhdWx0X2FjY2Vz
cygpIG1ldGhvZCB0byB0aGUgcDJtLXB0IGFuZCBwMm0tZXB0IHZlcnNpb25zCj4+PiBvZiB0aGUg
cDJtIHJhdGhlciB0aGFuIHNldHRpbmcgaXQgZGlyZWN0bHksIHRvIGRlYWwgd2l0aCBkaWZmZXJl
bnQKPj4+IGRlZmF1bHQgcGVybWl0dGVkIGFjY2VzcyB2YWx1ZXMuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+PiAt
LS0KPj4+IE5CLCB0aGlzIGlzIGNvbXBpbGUtdGVzdGVkIG9ubHkuCj4+Pgo+Pj4gY2MnaW5nIFBh
dWwgYmVjYXVzZSB0aGlzIGlzIGZ1bmN0aW9uYWxpdHkgaGUgbWF5IHdhbnQgYXQgc29tZSBwb2lu
dCBpbgo+Pj4gdGhlIGZ1dHVyZS4KPj4+Cj4+PiBJJ20gbm90IHN1cmUgd2h5IHdlIG9ubHkgYWxs
b3cgJ2ludCcgdG8gYmUgc3RvcmVkIGluIHRoZSByYWRpeCB0cmVlLAo+Pj4gYnV0IHRoYXQgdGhy
b3dzIGF3YXkgMzAtc29tZSBiaXRzIHdlIGNvdWxkIG90aGVyd2lzZSB1c2UuICBXZSBtaWdodAo+
Pj4gY29uc2lkZXIgcmV2aXNpbmcgdGhpcyBpZiB3ZSBydW4gb3V0IG9mIGJpdHMgaGVyZS4KPj4+
Cj4+PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+IEND
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBDQzogVGltIERlZWdhbiA8dGlt
QHhlbi5vcmc+Cj4+PiBDQzogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQHplbnRpZmlj
LmNvbT4KPj4+IENDOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+Pj4g
Q0M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4gSGkgYWxs
LAo+Pgo+PiBJIGtub3cgaXQncyBiZWVuIHNvbWUgdGltZSBmcm9tIHRoZSBzdGFydCBvZiB0aGlz
IHBhdGNoIGJ1dCBjYW4gdGhpcyAKPj4gbW92ZSBmb3J3YXJkPyBBbnkgdGhvdWdodHMgb3IgYWNr
cyBhcmUgYXBwcmVjaWF0ZWQuCj4gUmlnaHQsIHdlbGwgd2hlcmUgd2UgbGVmdCB0aGlzLCB0aGUg
c2l0dWF0aW9uIHdhcyB0aGF0IG9uIEFNRCBoYXJkd2FyZQo+IHdpdGggSU9NTVUgLyBwMm0gc2hh
cmluZywgdGhlcmUgYXJlbid0IGVub3VnaCBiaXRzLgo+Cj4gVGhlIHR3byBnZW5lcmFsIGZpeGVz
IHdlIGhhdmUgc28gZmFyIGFyZToKPiAxLiBBZGQgYSBwYXJhbGxlbCB0cmVlIGZvciBleHRyYSBi
aXRzICh0aGlzIHBhdGNoKQo+IDIuIFJpcCBvdXQgSU9NTVUgLyBwMm0gc2hhcmluZyBmb3IgQU1E
Lgo+Cj4gIzIgaGFzIHRoZSBhZHZhbnRhZ2UgdGhhdCB3ZSBkb24ndCBuZWVkIGFuIGVudGlyZWx5
IHNlcGFyYXRlIHRyZWUsIGFzCj4gd2VsbCBhcyBnZXR0aW5nIHJpZCBvZiBjb2RlIHRoYXQgaGFz
IChhcHBhcmVudGx5KSBiZWVuIGNvbXBsZXRlbHkgZGVhZAo+IGZvciA1IHllYXJzLiAjMSBoYXMg
dGhlIGFkdmFudGFnZSB0aGF0IHdlJ3JlIHNldCB1cCBmb3IgaGF2aW5nIGEgbXVjaAo+IGxhcmdl
ciBudW1iZXIgb2YgSU9SRVEgc2VydmVycyBpbiB0aGUgZnV0dXJlLgo+Cj4gTm9ib2R5IG9iamVj
dGVkIHRvICMyLiAgV2l0aG91dCBsb29raW5nIGRlZXBseSBpbnRvIGl0LCBpdCBzZWVtcyBsaWtl
IGl0Cj4gbWlnaHQgYmUgYSBnb29kIGlkZWEsIGJ1dCBJIGNhbid0IGJlIHN1cmUgd2l0aG91dCBz
ZWVpbmcgd2hhdCBpdCB3b3VsZAo+IGFjdHVhbGx5IGxvb2sgbGlrZS4KPgo+IFRoZSBlYXNpZXN0
IHdheSB0byBwcmVzcyB0aGUgcG9pbnQgdGhlbiB3b3VsZCBiZSB0byBwb3N0IGEgcGF0Y2ggc2Vy
aWVzCj4gcmlwcGluZyBpdCBvdXQuCgpJT01NVSAvIHAybSBzaGFyaW5nIG9uIEFNRCBkb2Vzbid0
IHdvcmssIGFuZCBpc24ndCBhdmFpbGFibGUgYW55IG1vcmUKKGRlc3BpdGUgdGhlIGNvZGUgbG9v
a2luZyBzdXNwaWNpb3VzbHkgbGlrZSBpdCBpcyB1c2FibGUpLgoKVGhlcmUgd2FzIGEgYnVnZml4
IHRvIGFsbG93IERNQSBtYXBwaW5nIG9mIGdyYW50ZWQgcGFnZXMsIHdoaWNoIGlzIGEKcHJlcmVx
dWlzaXRlIGZvciBQVkggc3VwcG9ydCwgd2hpY2ggcmVxdWlyZXMgdXNpbmcgYSBub256ZXJvIHAy
bSB0eXBlLAphbmQgaXMgdGhlcmVmb3JlIGluY29tcGF0aWJsZSB3aXRoIElPTU1VL3AybSBzaGFy
aW5nLgoKSSBkb24ndCBzZWUgYW55IGZlYXNpYmxlIHdheSB0byBicmluZyBwMm0tc2hhcmluZyBi
YWNrIGludG8gYSB3b3JraW5nCnN0YXRlIG9uIEFNRC4KCkFzIGEgcmVzdWx0LCB3ZSdkIGJlIG11
Y2ggYmV0dGVyIHJpcHBpbmcgb3V0IHRoZSBkZWFkIGNvZGUgYW5kIG1vcmUKZm9ybWFsbHkgYWNr
bm93bGVkZ2luZyB0aGF0IGl0IGlzIGEgZGVhZCBmZWF0dXJlLCBhZnRlciB3aGljaCB0aGUKZXhp
c3RpbmcgcDJtIHR5cGUvYWNjZXNzIGluZnJhc3RydWN0dXJlIHNob3VsZCB3b3JrIGNvbXBhdGli
bHkgd2l0aCB0aGUKSW50ZWwgaW1wbGVtZW50YXRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
