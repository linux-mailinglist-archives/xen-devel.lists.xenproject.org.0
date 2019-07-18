Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA696D0E4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:17:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho874-0002Md-DY; Thu, 18 Jul 2019 15:14:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N3CN=VP=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ho871-0002MK-Vi
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:14:28 +0000
X-Inumbo-ID: ba7d560a-a96e-11e9-8c12-ffaa3c050f4f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba7d560a-a96e-11e9-8c12-ffaa3c050f4f;
 Thu, 18 Jul 2019 15:14:25 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tsnaz/K1BE4OR+cjLtn+e6gTAokVsvWI/JFiAdFZyEmdjeXZ6/fs64DmxAHDofduTFDlUtfgqk
 TOoMCYzfBCB/jq8ypKlpuPX0ClzFUIGwJTi92csG9PjN+YCAcQNRqkX0JRu9kLCPHFhvz3rsiS
 HqlVLSz7fjQnEnB2Wi6ODAaDLXYOYTZIhqRT+sZiHifNtzGNyWzm9mWDaxhTFOh4LBW3aCa+16
 ctemLKvoHE2yoq9bl9bCP6045DWiK5P9Hlbm6c8ZMdXedxMpXMFbjHPnHj4Kl0NNKrkiBuv8Hq
 aRo=
X-SBRS: 2.7
X-MesageID: 3206344
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3206344"
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
 <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
Date: Thu, 18 Jul 2019 16:14:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxNTo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNS4wNy4xOSAx
NjowOCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMDUvMDcvMjAxOSAxNDo1NiwgRGFyaW8g
RmFnZ2lvbGkgd3JvdGU6Cj4+PiBPbiBGcmksIDIwMTktMDctMDUgYXQgMTQ6MTcgKzAxMDAsIFNl
cmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4gMSkgVGhpcyBjcmFzaCBpcyBxdWl0ZSBsaWtlbHkgdG8g
aGFwcGVuOgo+Pj4+Cj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDYgVVRDXSAoWEVOKSBbIDM0MjUu
MjIwNjYwXSBXYXRjaGRvZyB0aW1lciBkZXRlY3RzCj4+Pj4gdGhhdCBDUFUyIGlzIHN0dWNrIQo+
Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ2IFVUQ10gKFhFTikgWyAzNDI1LjIyNjI5M10gLS0tLVsg
WGVuLTQuMTMuMC0KPj4+PiA4LjAuNi1kwqAgeDg2XzY0wqAgZGVidWc9ecKgwqAgTm90IHRhaW50
ZWQgXS0tLS0KPj4+PiBbLi4uXQo+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10gKFhFTikg
WyAzNDI1LjUwMTk4OV0gWGVuIGNhbGwgdHJhY2U6Cj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcg
VVRDXSAoWEVOKSBbCj4+Pj4gMzQyNS41MDUyNzhdwqDCoMKgIFs8ZmZmZjgyZDA4MDIzZDU3OD5d
IHZjcHVfc2xlZXBfc3luYysweDUwLzB4NzEKPj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENd
IChYRU4pIFsKPj4+PiAzNDI1LjUxMTUxOF3CoMKgwqAgWzxmZmZmODJkMDgwMjA4MzcwPl0gdmNw
dV9wYXVzZSsweDIxLzB4MjMKPj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENdIChYRU4pIFsK
Pj4+PiAzNDI1LjUxNzMyNl3CoMKgwqAgWzxmZmZmODJkMDgwMjNlMjVkPl0KPj4+PiB2Y3B1X3Nl
dF9wZXJpb2RpY190aW1lcisweDI3LzB4NzMKPj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENd
IChYRU4pIFsKPj4+PiAzNDI1LjUyNDI1OF3CoMKgwqAgWzxmZmZmODJkMDgwMjA5NjgyPl0gZG9f
dmNwdV9vcCsweDJjOS8weDY2OAo+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10gKFhFTikg
Wwo+Pj4+IDM0MjUuNTMwMjM4XcKgwqDCoCBbPGZmZmY4MmQwODAyNGY5NzA+XSBjb21wYXRfdmNw
dV9vcCsweDI1MC8weDM5MAo+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10gKFhFTikgWwo+
Pj4+IDM0MjUuNTM2NTY2XcKgwqDCoCBbPGZmZmY4MmQwODAzODM5NjQ+XSBwdl9oeXBlcmNhbGwr
MHgzNjQvMHg1NjQKPj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENdIChYRU4pIFsKPj4+PiAz
NDI1LjU0MjcxOV3CoMKgwqAgWzxmZmZmODJkMDgwMzg1NjQ0Pl0gZG9fZW50cnlfaW50ODIrMHgy
Ni8weDJkCj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbCj4+Pj4gMzQyNS41
NDg4NzZdwqDCoMKgIFs8ZmZmZjgyZDA4MDM4ODM5Yj5dIGVudHJ5X2ludDgyKzB4YmIvMHhjMAo+
Pj4+Cj4+PiBNbW0uLi4gdmNwdV9zZXRfcGVyaW9kaWNfdGltZXI/Cj4+Pgo+Pj4gV2hhdCBrZXJu
ZWwgaXMgdGhpcyBhbmQgd2hlbiBkb2VzIHRoaXMgY3Jhc2ggaGFwcGVuPwo+Pgo+PiBIaSBEYXJp
bywKPj4KPj4gSSBjYW4gZWFzaWx5IHJlcHJvZHVjZSB0aGlzIGNyYXNoIHVzaW5nIGEgRGViaWFu
IDcgUFYgVk0gKDIgdkNQVXMsIDJHQiBSQU0pCj4+IHdoaWNoIGhhcyB0aGUgZm9sbG93aW5nIGtl
cm5lbDoKPj4KPj4gIyB1bmFtZSAtYQo+Pgo+PiBMaW51eCBsb2NhbGhvc3QgMy4yLjAtNC1hbWQ2
NCAjMSBTTVAgRGViaWFuIDMuMi43OC0xIHg4Nl82NCBHTlUvTGludXgKPj4KPj4gQWxsIEkgbmVl
ZCB0byBkbyBpcyBzdXNwZW5kIGFuZCByZXN1bWUgdGhlIFZNLgo+IAo+IEhhcHBlbnMgd2l0aCBh
IG1vcmUgcmVjZW50IGtlcm5lbCwgdG9vLgo+IAo+IEkgY2FuIGVhc2lseSByZXByb2R1Y2UgdGhl
IGlzc3VlIHdpdGggYW55IFBWIGd1ZXN0IHdpdGggbW9yZSB0aGFuIDEgdmNwdQo+IGJ5IGRvaW5n
ICJ4bCBzYXZlIiBhbmQgdGhlbiAieGwgcmVzdG9yZSIgYWdhaW4uCj4gCj4gV2l0aCB0aGUgcmVw
cm9kdWNlciBiZWluZyBhdmFpbGFibGUgSSdtIG5vdyBkaXZpbmcgaW50byB0aGUgaXNzdWUuLi4K
Ck9uZSBmdXJ0aGVyIHRoaW5nIHRvIGFkZCBpcyB0aGF0IEkgd2FzIGFibGUgdG8gYXZvaWQgdGhl
IGNyYXNoIGJ5IHJldmVydGluZwoKCXhlbi9zY2hlZDogcmV3b3JrIGFuZCByZW5hbWUgdmNwdV9m
b3JjZV9yZXNjaGVkdWxlKCkKCndoaWNoIGlzIGEgcGFydCBvZiB0aGUgc2VyaWVzLiBUaGlzIG1h
ZGUgYWxsIHRlc3RzIHdpdGggUFYgZ3Vlc3RzIHBhc3MuCgpBbm90aGVyIHF1ZXN0aW9uIEkgaGF2
ZSBpcyBkbyB5b3UgaGF2ZSBhIGdpdCBicmFuY2ggd2l0aCBjb3JlLXNjaGVkdWxpbmcKcGF0Y2hl
cyByZWJhc2VkIG9uIHRvcCBvZiBjdXJyZW50IHN0YWdpbmcgYXZhaWxhYmxlIHNvbWV3aGVyZT8K
ClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
