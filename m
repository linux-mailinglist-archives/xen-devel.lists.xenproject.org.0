Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E2144273
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 17:50:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwgc-0006qf-OH; Tue, 21 Jan 2020 16:47:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jgZb=3K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itwgb-0006qY-H6
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:47:29 +0000
X-Inumbo-ID: b32ffaf0-3c6d-11ea-baef-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b32ffaf0-3c6d-11ea-baef-12813bfff9fa;
 Tue, 21 Jan 2020 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579625245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U1Ie32g4z+liroZ8kVDsLS1GkA1CCClXiw3XyO/Dl9Y=;
 b=KyiEJ0dK51OPFy5CbnFZzVNVt+GiRqg8YTljWPhymsrvRKbcZYBGjJyE
 hi6jlY6fygN4agOrYurA5ZLe657lfG+WBhPDyGK9I6KxX6rUyeifBtD8L
 3rdEbAponLkK54a/jiIOvA40yFcu7rqqiOQdB7TL3upIKlsfvGdu7OWl0 s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BMXMYaW81Zuz1ybvKzWrj8XB57qKP2XkXDlZRKfmYx1cE1IGBHTBTlSh5hIqLmE3JTk3gJRP6N
 UleKiL8FEhw4YdpePm5OkDtodlg2kG9bnw4Y10tjHR08VUHNJNHNtrHTZ3A6+055Mo/+Mawg5S
 T2tXc6BC93nwIrp7B8JfnqPFlfWRf0YtGxTFZg+v917pwiidcqKveW1mDPR+40a4syTddRPbTO
 0oAXmyvgH/V0+xX2TKduJilC/r1je1MCJEh8F1iYjmFIOgWzohHJ5LelaOzjq4QrNZgM/36nSi
 YCw=
X-SBRS: 2.7
X-MesageID: 11389857
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11389857"
Date: Tue, 21 Jan 2020 16:47:17 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200121164717.GJ11756@Air-de-Roger>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDM6MzQ6MTNBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAyMCwgMjAyMCA2OjE5IFBNCj4gPiAKPiA+IE9uIFN1biwg
SmFuIDE5LCAyMDIwIGF0IDA0OjE1OjA0QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOgo+ID4g
PiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4g
U2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDgsIDIwMjAgNjozOSBQTQo+ID4gPiA+Cj4gPiA+ID4g
V2hlbiBkb2luZyBhIHZpcnR1YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUg
TDEgVk1NKQo+ID4gPiA+IGludGVycnVwdHMgc2hvdWxkbid0IGJlIGluamVjdGVkIHVzaW5nIHRo
ZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeQo+ID4gPiA+IG1lY2hhbmlzbSwgYW5kIGluc3Rl
YWQgc2hvdWxkIGJlIHNpZ25hbGVkIGluIHRoZSB2bWNzIHVzaW5nIHRoZSBleGl0Cj4gPiA+ID4g
cmVhc29uIGFuZCB0aGUgaW50ZXJydXB0aW9uLWluZm9ybWF0aW9uIGZpZWxkIGlmIHRoZSAiQWNr
bm93bGVkZ2UKPiA+ID4gPiBpbnRlcnJ1cHQgb24gZXhpdCIgdm1leGl0IGNvbnRyb2wgaXMgc2V0
Lgo+ID4gPiA+Cj4gPiA+ID4gUmVtb3ZlIHRoZSBudm14X3VwZGF0ZV9hcGljdiBoZWxwZXI6IGl0
J3MgYm9ndXMgdG8gYXR0ZW1wdCB0byBpbmplY3QKPiA+ID4gPiBpbnRlcnJ1cHRzIG9uIHZpcnR1
YWwgdm1leGl0IHVzaW5nIHRoZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeQo+ID4gPiA+IGFz
c2lzdGFuY2UsIGFuZCBpdCdzIGFsc28gYm9ndXMgdG8gYWNrIGludGVycnVwdHMgd2l0aG91dCBj
aGVja2luZyBpZgo+ID4gPiA+IHRoZSB2bWV4aXQgIkFja25vd2xlZGdlIGludGVycnVwdCBvbiBl
eGl0IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuCj4gPiA+ID4gbnZteF9pbnRyX2ludGVyY2VwdCBh
bHJlYWR5IGhhbmRsZXMgaW50ZXJydXB0cyBjb3JyZWN0bHkgb24gdmlydHVhbAo+ID4gPiA+IHZt
ZXhpdC4KPiA+ID4gPgo+ID4gPiA+IE5vdGUgdGhhdCB0aGlzIGZpeGVzIHRoZSB1c2FnZSBvZiB4
MkFQSUMgYnkgdGhlIEwxIFZNTSwgYXQgbGVhc3Qgd2hlbgo+ID4gPiA+IHRoZSBMMSBWTU0gaXMg
WGVuLgo+ID4gPgo+ID4gPiB3aGlsZSB0aGlzIGZpeCBtYWtlcyBzZW5zZSB0byBtZSwgY2FuIHlv
dSBhbHNvIHRlc3Qgb3RoZXIgTDEgVk1NcywKPiA+ID4gc28gd2UgZG9uJ3Qgb3Zlcmxvb2sgc29t
ZSBvdGhlciBpbnRlbnRpb25zIGNvdmVyZWQgb3IgaGlkZGVuIGJ5Cj4gPiA+IHJlbW92ZWQgbG9n
aWM/Cj4gPiAKPiA+IEkgY291bGQgdGVzdCBvdGhlciBoeXBlcnZpc29ycywgYnV0IGRvIHdlIHJl
YWxseSBleHBlY3QgYW55dGhpbmcKPiA+IHRoYXQncyBub3QgWGVuIG9uIFhlbiB0byB3b3JrPwo+
ID4gCj4gPiBJJ20gYXNraW5nIGJlY2F1c2UgdGhhdCdzIHRoZSBvbmx5IGNvbWJpbmF0aW9uIHRo
YXQncyBhY3R1YWxseSB0ZXN0ZWQKPiA+IGJ5IG9zc3Rlc3QuCj4gPiAKPiA+IFRoYW5rcywgUm9n
ZXIuCj4gCj4gSWYgb3RoZXJzIGFyZSBPSyB3aXRoIHlvdXIgYXNzdW1wdGlvbiwgdGhlbiBpdCdz
IGZpbmUuIEkgZGlkbid0IHRpZ2h0bHkgCj4gZm9sbG93IHRoZSBuZXN0ZWQgdmlydHVhbGl6YXRp
b24gcmVxdWlyZW1lbnRzIGluIFhlbi4KCkkgY2FuIHRyeSBLVk0gb3IgYmh5dmUgb24gdG9wIG9m
IFhlbiwgYnV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIGFueW9uZQpoYXMgYWN0dWFsbHkgdGVzdGVk
IHRoaXMsIHNvIEkgY291bGQgYmUgdHJpZ2dlcmluZyBvdGhlciBidWdzIGluIHRoZQpuZXN0ZWQg
Y29kZS4KCj4gT24gdGhlIG90aGVyIGhhbmQsIEkgdGhpbmsgdGhpcyBwYXRjaCBuZWVkcyBhIHJl
dmlzaW9uLiBJdCBpcyBub3QgYm9ndXMKPiB0byB1c2UgdmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZl
cnkgb24gdmlydHVhbCBWTWV4aXQsIGlmICJBY2sgaW50ZXJydXB0Cj4gb24gZXhpdCIgaXMgb2Zm
LiBJbiBzdWNoIGNhc2UsIHRoZSBkZWxpdmVyeSBkb2Vzbid0IGhhcHBlbiB1bnRpbCBMMSAKPiBo
eXBlcnZpc29yIGVuYWJsZXMgaW50ZXJydXB0IHRvIGNsZWFyIGludGVycnVwdCB3aW5kb3cuIFRo
ZW4gaXQgZG9lcwo+IHNhdmUgb25lIGV4aXQuIFRoZSBvbmx5IGJvZ3VzIHBvaW50IGlzIHRoYXQg
bnZteF91ZHBhdGVfYXBpY3YgZG9lc24ndAo+IGNoZWNrICJBY2sgaW50ZXJydXB0IG9uIGV4aXQi
LiBTbyBJIHByZWZlciB0byBhZGQgc3VjaCBjaGVjayB0aGVyZSAKPiBpbnN0ZWFkIG9mIGNvbXBs
ZXRlbHkgcmVtb3ZpbmcgdGhpcyBvcHRpbWl6YXRpb24uCgpSaWdodCwgaWYgIkFjayBpbnRlcnJ1
cHQgb24gZXhpdCIgaXMgb2ZmIHRoZSBpbnRlcnJ1cHQgd2lsbCB0cmlnZ2VyIGEKdm1leGl0LCBi
dXQgaXQgd29uJ3QgYmUgYWNrZWQgYW5kIHRoZSB2bWV4aXQgaW50ZXJydXB0IGluZm9ybWF0aW9u
CnNob3VsZCBoYXZlIGJpdCAzMSBzZXQgdG8gMCwgd2hpY2ggSSB0aGluayB3ZSBkb24ndCBzZXQg
Y29ycmVjdGx5LgoKVGhlIEludGVsIFNETSBzdGF0ZXM6CgoiRm9yIG90aGVyIFZNIGV4aXRzIChp
bmNsdWRpbmcgdGhvc2UgZHVlIHRvIGV4dGVybmFsIGludGVycnVwdHMgd2hlbgp0aGUg4oCcYWNr
bm93bGVkZ2UgaW50ZXJydXB0IG9uIGV4aXTigJ0gVk0tZXhpdCBjb250cm9sIGlzIDApLCB0aGUg
ZmllbGQKaXMgbWFya2VkIGludmFsaWQgKGJ5IGNsZWFyaW5nIGJpdCAzMSkgYW5kIHRoZSByZW1h
aW5kZXIgb2YgdGhlIGZpZWxkCmlzIHVuZGVmaW5lZC4iCgpBRkFJQ1Qgc3luY19leGNlcHRpb25f
c3RhdGUgYWxzbyBuZWVkcyB0byBjaGVjayBpZiBWTV9FWElUX0NPTlRST0xTCmhhcyBWTV9FWElU
X0FDS19JTlRSX09OX0VYSVQgc2V0LCBhbmQgb25seSBzZXQgVk1fRVhJVF9JTlRSX0lORk8gaW4K
dGhhdCBjYXNlLCBkbyB5b3UgYWdyZWU/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
