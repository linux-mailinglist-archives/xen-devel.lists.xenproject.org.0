Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A579830F58
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:54:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWhtm-0002cA-3C; Fri, 31 May 2019 13:48:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q4nb=T7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hWhtk-0002c5-3H
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:48:44 +0000
X-Inumbo-ID: ca12816a-83aa-11e9-92ff-032bb86f5f96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca12816a-83aa-11e9-92ff-032bb86f5f96;
 Fri, 31 May 2019 13:48:37 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: lVg7Yqu+JyvDLZI5xwD+hyzngTta6CeTzVsuxTAvo4ojcZMiDXReIx71pKW3jgjf0e0ogfZHOh
 7Qj/XYqJbQmaae1gx5S44SmjIPTdX8pdxbzEkwVkFiI7FfSEHoLuTesZeYWAb0yUKGCKz4CHXe
 Arv4hvyq6bGITvuUsNZFB8QiwEEUfXT5mgRPJAeRRmyLbC/zBBDFF0UtJhp9/XjKqoe2Xh4lMs
 kHWDZEjabO+3hP7ZUIJB6Gm9F/oj95QhoBaN7FEeWXwz67uV+FSMazsNWxvI3qzVQ8BxeUCQVv
 wA8=
X-SBRS: 2.7
X-MesageID: 1136067
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,535,1549947600"; 
   d="scan'208";a="1136067"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
Thread-Index: AQHVBaFRy03LVQmKMkuPdTuUm46mjKZryBiAgBma3fA=
Date: Fri, 31 May 2019 13:48:30 +0000
Message-ID: <8e8e0a9fd1724a5498722475055bdb92@AMSPEX02CL03.citrite.net>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
 <20190515084443.f4v3otqjqu2ofnrk@Air-de-Roger>
In-Reply-To: <20190515084443.f4v3otqjqu2ofnrk@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDE1IE1heSAyMDE5IDA5OjQ1Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQo+IDx3ZWkubGl1MkBj
aXRyaXguY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgR2VvcmdlIER1bmxhcAo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29v
cGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24KPiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEphbgo+IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggNC81XSBpb21tdTogaW50cm9kdWNl
IGlvbW11X2dyb3Vwcwo+IAo+IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDAyOjI0OjAyUE0gKzAx
MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IFNvbWUgZGV2aWNlcyBtYXkgc2hhcmUgYSBzaW5n
bGUgUENJZSBpbml0aWF0b3IgaWQsIGUuZy4gaWYgdGhleSBhcmUgYWN0dWFsbHkKPiA+IGxlZ2Fj
eSBQQ0kgZGV2aWNlcyBiZWhpbmQgYSBicmlkZ2UsIGFuZCBoZW5jZSBETUEgZnJvbSBzdWNoIGRl
dmljZXMgd2lsbAo+ID4gYmUgc3ViamVjdCB0byB0aGUgc2FtZSBhZGRyZXNzIHRyYW5zbGF0aW9u
IGluIHRoZSBJT01NVS4gSGVuY2UgdGhlc2UgZGV2aWNlcwo+ID4gc2hvdWxkIGJlIHRyZWF0ZWQg
YXMgYSB1bml0IGZvciB0aGUgcHVycG9zZXMgb2YgYXNzaWdubWVudC4gVGhlcmUgYXJlIGFsc28K
PiA+IG90aGVyIHJlYXNvbnMgd2h5IG11bHRpcGxlIGRldmljZXMgc2hvdWxkIGJlIHRyZWF0ZWQg
YXMgYSB1bml0LCBlLmcuIHRob3NlCj4gPiBzdWJqZWN0IHRvIGEgc2hhcmVkIFJNUlIgb3IgdGhv
c2UgZG93bnN0cmVhbSBvZiBhIGJyaWRnZSB0aGF0IGRvZXMgbm90Cj4gPiBzdXBwb3J0IEFDUy4K
PiA+Cj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgc3RydWN0IGlvbW11X2dyb3VwIHRv
IGFjdCBhcyBhIGNvbnRhaW5lciBmb3IKPiA+IGRldmljZXMgdGhhdCBzaG91bGQgYmUgdHJlYXRl
ZCBhcyBhIHVuaXQsIGFuZCBidWlsZHMgYSBsaXN0IG9mIHRoZW0gYXMKPiA+IFBDSSBkZXZpY2Vz
IGFyZSBzY2FubmVkLiBUaGUgaW9tbXVfb3BzIGFscmVhZHkgaW1wbGVtZW50IGEgbWV0aG9kLAo+
ID4gZ2V0X2RldmljZV9ncm91cF9pZCgpLCB0aGF0IGlzIHNlZW1pbmdseSBpbnRlbmRlZCB0byBy
ZXR1cm4gdGhlIGluaXRpYXRvcgo+ID4gaWQgZm9yIGEgZ2l2ZW4gU0JERiBzbyB1c2UgdGhpcyBh
cyB0aGUgbWVjaGFuaXNtIGZvciBncm91cCBhc3NpZ25tZW50IGluCj4gPiB0aGUgZmlyc3QgaW5z
dGFuY2UuIEFzc2lnbm1lbnQgYmFzZWQgb24gc2hhcmVkIFJNUlIgb3IgbGFjayBvZiBBQ1Mgd2ls
bCBiZQo+ID4gZGVhbHQgd2l0aCBpbiBzdWJzZXF1ZW50IHBhdGNoZXMsIGFzIHdpbGwgbW9kaWZp
Y2F0aW9ucyB0byB0aGUgZGV2aWNlCj4gPiBhc3NpZ25tZW50IGNvZGUuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiA+IC0tLQo+
ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KPiA+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+ID4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KPiA+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4g
PiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gPiBDYzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMg
fCA3NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jICAgfCAgMyArKwo+ID4gIHhlbi9pbmNsdWRlL3hlbi9p
b21tdS5oICAgICAgICAgfCAgNyArKysrCj4gPiAgeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAg
ICAgICB8ICAzICsrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPiBpbmRleCBkM2E2MTk5Yjc3Li4xMTMxOWZiYWFl
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gQEAgLTY1NSw2ICs2NTUsODIg
QEAgc3RhdGljIHZvaWQgaW9tbXVfZHVtcF9wMm1fdGFibGUodW5zaWduZWQgY2hhciBrZXkpCj4g
PiAgICAgIH0KPiA+ICB9Cj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfSEFTX1BDSQo+ID4gKwo+ID4g
K3N0cnVjdCBpb21tdV9ncm91cCB7Cj4gPiArICAgIHVuc2lnbmVkIGludCBpZDsKPiA+ICsgICAg
dW5zaWduZWQgaW50IGluZGV4Owo+IAo+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2Yg
dGhlIGluZGV4IGZpZWxkLCBpc24ndCBpdCBlbm91Z2ggdG8KPiBqdXN0IHVzZSB0aGUgSUQgZmll
bGQ/CgpUaGUgaW5kZXggaXMganVzdCBzdXBwb3NlZCB0byBqdXN0IGJlIGFuIGluZGV4IHRvIHJl
ZmVyIHRvIHRoZSBncm91cC4gTGludXggaGFzIHNpbWlsYXIsIGFuZCB0aGlzIGlzIHdoYXQgZW5k
cyB1cCBpbiBzeXNmcywgYnV0IEkgZ3Vlc3MgdGhlcmUncyBub3QgbXVjaCBwb2ludCBoYXZpbmcg
dGhpcyBpbiBYZW4gYXMgeWV0Li4uIEl0IGNhbiBhbHdheXMgYmUgYWRkZWQgbGF0ZXIgaWYgaXQg
cHJvdmVzIGRlc2lyYWJsZS4KCj4gCj4gVGhlIElEIGlzIGFscmVhZHkgdXNlZCBhcyBhIHVuaXF1
ZSBrZXkgaW4gdGhlIGNvZGUgYmVsb3cgZm9yIHRoZSByYWRpeAo+IHRyZWUgb3BlcmF0aW9ucy4K
PiAKClllcywgdGhhdCdzIHRoZSBtZWFuaW5nZnVsIG51bWJlci4KCj4gPiArICAgIHN0cnVjdCBs
aXN0X2hlYWQgZGV2c19saXN0Owo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCByYWRp
eF90cmVlX3Jvb3QgaW9tbXVfZ3JvdXBzOwo+ID4gKwo+ID4gK3ZvaWQgX19pbml0IGlvbW11X2dy
b3Vwc19pbml0KHZvaWQpCj4gPiArewo+ID4gKyAgICByYWRpeF90cmVlX2luaXQoJmlvbW11X2dy
b3Vwcyk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmFsbG9j
X2lvbW11X2dyb3VwKHVuc2lnbmVkIGludCBpZCkKPiA+ICt7Cj4gPiArICAgIHN0cnVjdCBpb21t
dV9ncm91cCAqZ3JwOwo+ID4gKyAgICBzdGF0aWMgdW5zaWduZWQgaW50IGluZGV4Owo+ID4gKwo+
ID4gKyAgICBncnAgPSB4emFsbG9jKHN0cnVjdCBpb21tdV9ncm91cCk7Cj4gCj4gQ2FuIGJlIG1v
dmVkIHdpdGggdGhlIGRlY2xhcmF0aW9uIGFib3ZlLgo+IAoKU3VyZS4KCj4gPiArICAgIGlmICgg
IWdycCApCj4gPiArICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgZ3JwLT5pZCA9
IGlkOwo+ID4gKyAgICBncnAtPmluZGV4ID0gaW5kZXgrKzsKPiAKPiBBRkFJQ1Qgbm9uZSBvZiB0
aGlzIGlzIHN1YmplY3QgdG8gcmFjZXMgYmVjYXVzZSBpdCdzIGFsd2F5cyBwcm90ZWN0ZWQKPiBi
eSB0aGUgcGNpZGV2cyBsb2NrPwo+IAoKWWVzLCBpdCdzIHVuZGVyIGxvY2suCgo+ID4gKyAgICBJ
TklUX0xJU1RfSEVBRCgmZ3JwLT5kZXZzX2xpc3QpOwo+ID4gKwo+ID4gKyAgICBpZiAoIHJhZGl4
X3RyZWVfaW5zZXJ0KCZpb21tdV9ncm91cHMsIGlkLCBncnApICkKPiA+ICsgICAgewo+ID4gKyAg
ICAgICAgeGZyZWUoZ3JwKTsKPiA+ICsgICAgICAgIGdycCA9IE5VTEw7Cj4gCj4gRG8geW91IG5l
ZWQgdG8gZGVjcmVhc2UgaW5kZXggaGVyZSwgb3IgaXMgaXQgZmluZSB0byBidXJuIG51bWJlcnMg
b24KPiBmYWlsdXJlPwo+IAoKSSdsbCBnZXQgcmlkIG9mIHRoZSBpbmRleC4KCj4gPiArICAgIH0K
PiA+ICsKPiA+ICsgICAgcmV0dXJuIGdycDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHN0cnVj
dCBpb21tdV9ncm91cCAqZ2V0X2lvbW11X2dyb3VwKHVuc2lnbmVkIGludCBpZCkKPiA+ICt7Cj4g
PiArICAgIHN0cnVjdCBpb21tdV9ncm91cCAqZ3JwID0gcmFkaXhfdHJlZV9sb29rdXAoJmlvbW11
X2dyb3VwcywgaWQpOwo+ID4gKwo+ID4gKyAgICBpZiAoICFncnAgKQo+ID4gKyAgICAgICAgZ3Jw
ID0gYWxsb2NfaW9tbXVfZ3JvdXAoaWQpOwo+ID4gKwo+ID4gKyAgICByZXR1cm4gZ3JwOwo+ID4g
K30KPiA+ICsKPiA+ICtpbnQgaW9tbXVfZ3JvdXBfYXNzaWduKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQo+ID4gK3sKPiA+ICsgICAgY29uc3Qgc3RydWN0IGlvbW11X29wcyAqb3BzOwo+ID4gKyAgICB1
bnNpZ25lZCBpbnQgaWQ7Cj4gPiArICAgIHN0cnVjdCBpb21tdV9ncm91cCAqZ3JwOwo+ID4gKwo+
ID4gKyAgICBvcHMgPSBpb21tdV9nZXRfb3BzKCk7Cj4gCj4gVGhpcyBpbml0aWFsaXphdGlvbiBj
YW4gYmUgZG9uZSBhdCBkZWNsYXJhdGlvbiB0aW1lLgo+IAoKU3VyZS4KCj4gPiArICAgIGlmICgg
IW9wcyB8fCAhb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkICkKPiA+ICsgICAgICAgIHJldHVybiAw
Owo+ID4gKwo+ID4gKyAgICBpZCA9IG9wcy0+Z2V0X2RldmljZV9ncm91cF9pZChwZGV2LT5zZWcs
IHBkZXYtPmJ1cywgcGRldi0+ZGV2Zm4pOwo+ID4gKyAgICBncnAgPSBnZXRfaW9tbXVfZ3JvdXAo
aWQpOwo+ID4gKwo+ID4gKyAgICBpZiAoICEgZ3JwICkKPiAgICAgICAgICAgICAgXiBleHRyYSBz
cGFjZQo+ID4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgIGlmICggaW9t
bXVfdmVyYm9zZSApCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIkFzc2lnbiAlMDR4
OiUwMng6JTAyeC4ldSAtPiBJT01NVSBncm91cCAldVxuIiwKPiA+ICsgICAgICAgICAgICAgICBw
ZGV2LT5zZWcsIHBkZXYtPmJ1cywgUENJX1NMT1QocGRldi0+ZGV2Zm4pLAo+ID4gKyAgICAgICAg
ICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgZ3JwLT5pbmRleCk7Cj4gCj4gV291bGRuJ3Qg
aXQgYmUgbW9yZSBoZWxwZnVsIHRvIHByaW50IHRoZSBncm91cCBJRCByYXRoZXIgdGhhbiB0aGUg
WGVuCj4gaW50ZXJuYWwgaW5kZXg/CgpZZXMsIG9uY2UgdGhlIGluZGV4IGlzIGdvbmUgSSdsbCBk
byB0aGF0IGluc3RlYWQuCgogIFBhdWwKCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
