Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A2C35028
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 21:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYEmi-0002Ig-EW; Tue, 04 Jun 2019 19:07:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYEmg-0002Ib-OX
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 19:07:46 +0000
X-Inumbo-ID: 08420424-86fc-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 08420424-86fc-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 19:07:44 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3UZrOa8B8A/4NuBk2FIHv4wwDopEsEMCPnKcDIwdyritTih1x6e3AcKj6aiovGnDgSbN4YKBG3
 1BTa574oIXtPWDpULduIsMGuvN3oY4JDHblCSvNb6MSQsxikzAOr9pEjLDjoKIK66E+rEPZMMG
 Gbgvr21atBedUkxk2XFUxF0zkHt6ls2S6XZulvaALtu29asgSz+eU5swg2ISBZ9f2SXSUHgwJi
 /pf54DnNVC+Fuwy9l3g7cvE0BinrSAu4zpXdr6uUwtBAU2LaRQXa2cSWSrNFpADKhuTV9c4u9L
 Is8=
X-SBRS: 2.7
X-MesageID: 1311475
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1311475"
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9DC0200007800233E0A@prv1-mh.provo.novell.com>
 <7e04a515-719f-1788-2638-2f8313509f0e@citrix.com>
 <5CF4D6C402000078002346B3@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <4cc0124e-7ac3-5a4b-9423-8691aae20e6f@citrix.com>
Date: Tue, 4 Jun 2019 20:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CF4D6C402000078002346B3@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] x86: use POPCNT for hweight<N>() when
 available
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDYvMjAxOSAwOToxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDUuMTkg
YXQgMjI6NDMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMzEvMDUv
MjAxOSAwMjo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBUaGlzIGlzIGZhc3RlciB0aGFuIHVz
aW5nIHRoZSBzb2Z0d2FyZSBpbXBsZW1lbnRhdGlvbiwgYW5kIHRoZSBpbnNuIGlzCj4+PiBhdmFp
bGFibGUgb24gYWxsIGhhbGYtd2F5IHJlY2VudCBoYXJkd2FyZS4gVGhlcmVmb3JlIGNvbnZlcnQK
Pj4+IGdlbmVyaWNfaHdlaWdodDxOPigpIHRvIG91dC1vZi1saW5lIGZ1bmN0aW9ucyAod2l0aG91
dCBhZmZlY3RpbmcgQXJtKQo+Pj4gYW5kIHVzZSBhbHRlcm5hdGl2ZXMgcGF0Y2hpbmcgdG8gcmVw
bGFjZSB0aGUgZnVuY3Rpb24gY2FsbHMuCj4+Pgo+Pj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTbywgSSB0cnVzdCB5b3Ugd2VyZW4ndCBleHBl
Y3RpbmcgdG8ganVzdCBhY2sgdGhpcyBhbmQgbGV0IGl0IGdvIGluPwo+Pgo+PiBUaGUgcHJpbmNp
cGxlIG9mIHRoZSBwYXRjaCAodXNlIHBvcGNudCB3aGVuIGF2YWlsYWJsZSkgaXMgYW4gaW1wcm92
ZW1lbnQKPj4gd2hpY2ggSSdtIGVudGlyZWx5IGluIGFncmVlbWVudCB3aXRoLCBidXQgZXZlcnl0
aGluZyBlbHNlIGlzIGEgcHJvYmxlbS4KPj4KPj4gVGhlIGxvbmcgYW5kIHRoZSBzaG9ydCBvZiBp
dCBpcyB0aGF0IEknbSBub3QgZ29pbmcgdG8gYWNjZXB0IGFueSB2ZXJzaW9uCj4+IG9mIHRoaXMg
d2hpY2ggaXNuJ3QgdGhlIExpbnV4IHZlcnNpb24uCj4gWW91J3JlIGtpZGRpbmcuIFdlIHdhbnQg
dG8gbW92ZSBhd2F5IGZyb20gYXNzZW1ibHkgd2hlcmV2ZXIgd2UKPiBjYW4sIGFuZCB5b3UgZGVt
YW5kIG5ldyBhc3NlbWJseSBjb2RlPwo+Cj4+ID5Gcm9tIGEgbWljcm9hcmNoaXRlY3R1cmFsIHN0
YW5kcG9pbnQsIHRoZSB0cmFkZW9mZiBiZXR3ZWVuIGZyYWN0aW9uYWwKPj4gcmVnaXN0ZXIgc2No
ZWR1bGluZyBmbGV4aWJpbGl0eSAod2hpY2ggaW4gcHJhY3RpY2UgaXMgbGFyZ2VseSBib3VuZAo+
PiBhbnl3YXkgYnkgcmVhbCBmdW5jdGlvbiBjYWxscyBpbiBzdXJyb3VuZGluZyBjb2RlKSBhbmQg
aW5jcmVhc2VkIGljYWNoZQo+PiBwcmVzc3VyZS9jb2xkbmVzcyAoZnJvbSB0aGUgcmVkdW5kYW50
IGZ1bmN0aW9uIGNvcGllcykgZmFsbHMgbGFyZ2VseSBpbgo+PiBmYXZvdXIgb2YgdGhlIExpbnV4
IHdheSBvZiBkb2luZyBpdCwgYSBjb2xkIGljYWNoZSBsaW5lIGlzCj4+IGRpc3Byb3BvcnRpb25h
bGx5IG1vcmUgZXhwZW5zaXZlIHRoYW4gcmVxdWlyaW5nIHRoZSBjb21waWxlciB0byBvcmRlcgo+
PiBpdHMgcmVnaXN0ZXJzIGRpZmZlcmVudGx5IChlc3BlY2lhbGx5IGFzIGFsbCBub24tb2Jzb2xl
dGUgcHJvY2Vzc29ycwo+PiB0aGVzZSBkYXlzIGhhdmUgemVyby1jb3N0IHJlZ2lzdGVyIHJlbmFt
aW5nIGludGVybmFsbHksIGZvciB0aGUgcHVycG9zZQo+PiBvZiBzdXBlcnNjYWxhciBleGVjdXRp
b24pLgo+IEknbSBhZnJhaWQgSSdtIHN0cnVnZ2xpbmcgaGVhdmlseSBhcyB0byB3aGF0IHlvdSdy
ZSB3YW50aW5nIHRvIHRlbGwKPiBtZSBoZXJlOiBXaGVyZSdzIHRoZSBkaWZmZXJlbmNlIChpbiB0
aGlzIHJlZ2FyZCkgYmV0d2VlbiB0aGUKPiBjaGFuZ2UgaGVyZSBhbmQgdGhlIHdheSBob3cgTGlu
dXggZG9lcyBpdD8gQm90aCBlbWl0IGEgQ0FMTAo+IGluc24gd2l0aCByZWdpc3RlcnMgc2V0IHVw
IHN1aXRhYmx5IGZvciBpdCwgYW5kIGJvdGggcGF0Y2ggaXQgd2l0aCBhCj4gUE9QQ05UIGluc24g
dXNpbmcgdGhlIHJlZ2lzdGVycyBhcyBkZW1hbmRlZCBieSB0aGUgQ0FMTC4KPgo+IFRoZSBkaWZm
ZXJlbmNlIHRvIExpbnV4IGlzIHdoYXQgZ2V0cyBjYWxsZWQsIG5vdCBob3cgdGhlIHBhdGNoaW5n
Cj4gd29ya3MgKGFmYWljdCkuIEknbSBzaW1wbHkgbm90IGJ1eWluZyB0aGUgY29tYmluYXRpb24g
b2YgYXJndW1lbnRzCj4gYW5kIGVmZmVjdHMgb2YgdGhlIHJlbW92YWwgb2YgdGhlIHVzZSBvZiAt
ZmZpeGVkLSouCgpUaGUgcGF0Y2ggZGVzY3JpcHRpb24gbWFkZSBpdCBsb29rIGFzIGlmIGl0IHdh
cyBzdGlsbCB2YXJpYWRpYyBvbiB0aGUKaW5wdXQgcmVnaXN0ZXJzLCBhbmQgdGhyb3VnaG91dCB0
aGUgZW50aXJlIHBhdGNoLCBJIGZhaWxlZCB0byB3b3JrIG91dAp3aGF0IHRoZSAtZmZpeGVkLXIq
IHdhcyBhY3R1YWxseSB0cnlpbmcgdG8gYWNoaWV2ZS4KCkFmdGVyIGFjdHVhbGx5IHRyeWluZyB0
aGUgY29kZSBsb2NhbGx5LCBJIHNlZSB0aGF0IGlzbid0IHRoZSBjYXNlLsKgIEkKYXBvbG9naXNl
IGZvciBteSBvcmlnaW5hbCByZWFjdGlvbi4KCj4KPj4+IEBAIC0yNDUsNiArMjQ2LDkgQEAgYm9v
dC9ta2VsZjMyOiBib290L21rZWxmMzIuYwo+Pj4gIGVmaS9ta3JlbG9jOiBlZmkvbWtyZWxvYy5j
Cj4+PiAgCSQoSE9TVENDKSAkKEhPU1RDRkxBR1MpIC1nIC1vICRAICQ8Cj4+PiAgCj4+PiArbm9j
b3YteSArPSBod2VpZ2h0Lm8KPj4gSXJyZXNwZWN0aXZlIG9mIHRoZSBleGFjdCBzcGVjaWZpY3Mg
b2YgaG93IHRoZSBwYXRjaCBlbmRzIHVwLCBJIGRvbid0Cj4+IHRoaW5rIHRoZSBub2NvdiByZXN0
cmljdGlvbiBpcyBhIGRpcmVjdGlvbiB3ZSB3YW50IHRvIHRha2UuCj4+Cj4+IENvdmVyYWdlIG1h
eSBub3QgYmUgYSB0aGluZyB1c2VkIGluIHByb2R1Y3Rpb24sIGJ1dCB3aGVuIGl0IGlzIHVzZWQg
Zm9yCj4+IGRldmVsb3BtZW50LCBpdCBuZWVkcyB0byBub3QgaGF2ZSByYW5kb20gaG9sZXMgbWlz
c2luZyBpbiB0aGUgcmVzdWx0cyBkYXRhLgo+IFN1cmUsIGJ1dCB0aGVuIHdlIGNhbid0IGF2b2lk
IHNhdmluZy9yZXN0b3JpbmcgdGhlIGNhbGxlZSBjbG9iYmVyZWQKPiByZWdpc3RlcnMgaW4gdGhl
IHRvIGJlIGNhbGxlZCBmdW5jdGlvbnMuCgpXaHkgaXMgdGhpcyBvZiBjb25jZXJuPwoKYSkgaXQg
dGhlIGNvbXBpbGVycyBqb2IgdG8gRFRSVCwgYW5kIHRoZSBzdW0gdG90YWwgb2YgR0NDJ3MgY292
ZXJhZ2UKZGF0YSBhcHBlYXJzIHRvIGJlICJhZGRxICQxLCBtdW1ibGUoJXJpcCkiCgpiKSBjb3Zl
cmFnZSBpcyBqdXN0IG9uZSBvZiBzZXZlcmFsIHRoaW5ncyB3aGljaCBtaWdodCBhZGQKaW5zdHJ1
bWVudGF0aW9uLCB1YnNhbiBiZWluZyB0aGUgb3RoZXIgZXhhbXBsZSB3aGljaCBYZW4gYWxyZWFk
eSBzdXBwb3J0cy4KCj4gIFdoaWNoIGluIHR1cm4gbWVhbnMgSSBzZWUgbm8KPiB3YXkgb2YgYXZv
aWRpbmcgY29kZSBkdXBsaWNhdGlvbnMgKGJlIGl0IGluIEMgb3IgYXNzZW1ibHkpIG9mIHRoZQo+
IGdlbmVyaWNfaHdlaWdodDxOPigpIGltcGxlbWVudGF0aW9ucy4KPgo+Pj4gK2h3ZWlnaHQubzog
Q0ZMQUdTICs9ICQoZm9yZWFjaCByZWcsY3ggZHggc2kgOCA5IDEwIDExLC1mZml4ZWQtciQocmVn
KSkKPj4+ICsKPj4gRG9lcyB0aGlzIHdvcmsgd2l0aCBDbGFuZz8KPiBJIGhhdmUgbm8gaWRlYS4K
CkkgZG8gLSBldmVyeSB0aW1lIEkgaGF2ZSBhIHN1c3BpY2lvbiwgdGhlIGFuc3dlciBpcyBpbnZh
cmlhYmx5IG5vLgoKY2xhbmc6IGVycm9yOiB1bmtub3duIGFyZ3VtZW50OiAnLWZmaXhlZC1yY3gn
CmNsYW5nOiBlcnJvcjogdW5rbm93biBhcmd1bWVudDogJy1mZml4ZWQtcmR4JwpjbGFuZzogZXJy
b3I6IHVua25vd24gYXJndW1lbnQ6ICctZmZpeGVkLXJzaScKY2xhbmc6IGVycm9yOiB1bmtub3du
IGFyZ3VtZW50ICctZmZpeGVkLXI4JywgZGlkIHlvdSBtZWFuICctZmZpeGVkLXI5Jz8KY2xhbmc6
IGVycm9yOiB1bmtub3duIGFyZ3VtZW50ICctZmZpeGVkLXIxMCcsIGRpZCB5b3UgbWVhbiAnLWZm
aXhlZC1yMTknPwpjbGFuZzogZXJyb3I6IHVua25vd24gYXJndW1lbnQgJy1mZml4ZWQtcjExJywg
ZGlkIHlvdSBtZWFuICctZmZpeGVkLXIxOSc/CgpBcyBpdCB0dXJucyBvdXQsIHRoZSBtaXNzaW5n
IC1mZml4ZWQtcjkgaXMgYSBIZXhhZ29uIG9wdGlvbiBvbmx5LCBhbmQKaXNuJ3QgYXBwbGljYWJs
ZSBmb3IgeDg2LgoKPgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h3
ZWlnaHQuYwo+Pj4gQEAgLTAsMCArMSwyOCBAQAo+Pj4gKyNkZWZpbmUgZ2VuZXJpY19od2VpZ2h0
NjQgX2h3ZWlnaHQ2NAo+Pj4gKyNkZWZpbmUgZ2VuZXJpY19od2VpZ2h0MzIgX2h3ZWlnaHQzMgo+
Pj4gKyNkZWZpbmUgZ2VuZXJpY19od2VpZ2h0MTYgX2h3ZWlnaHQxNgo+Pj4gKyNkZWZpbmUgZ2Vu
ZXJpY19od2VpZ2h0OCAgX2h3ZWlnaHQ4Cj4+PiArCj4+PiArI2luY2x1ZGUgPHhlbi9jb21waWxl
ci5oPgo+Pj4gKwo+Pj4gKyN1bmRlZiBpbmxpbmUKPj4+ICsjZGVmaW5lIGlubGluZSBhbHdheXNf
aW5saW5lCj4+PiArCj4+PiArI2luY2x1ZGUgPHhlbi9iaXRvcHMuaD4KPj4+ICsKPj4+ICsjdW5k
ZWYgZ2VuZXJpY19od2VpZ2h0OAo+Pj4gKyN1bmRlZiBnZW5lcmljX2h3ZWlnaHQxNgo+Pj4gKyN1
bmRlZiBnZW5lcmljX2h3ZWlnaHQzMgo+Pj4gKyN1bmRlZiBnZW5lcmljX2h3ZWlnaHQ2NAo+Pj4g
Kwo+Pj4gKyNkZWZpbmUgSFdFSUdIVChuKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4+ICt0eXBlb2YoX2h3ZWlnaHQjI24pIGdlbmVyaWNfaHdlaWdodCMj
bjsgICAgICAgICAgICAgICAgICAgICAgICBcCj4+PiArdW5zaWduZWQgaW50IGdlbmVyaWNfaHdl
aWdodCMjbih0eXBlb2YoKHVpbnQjI24jI190KTAgKyAwVSkgeCkgXAo+PiBBIHF1ZXN0aW9uIHRv
IHRoZSByZXN0IG9mIHhlbi1kZXZlbC4gIElzIHRoZXJlIGFueW9uZSBlbHNlIHdobyBjYW4KPj4g
YWN0dWFsbHkgd29yayBvdXQgd2hhdCB0aGlzIGNvbnN0cnVjdCBpcyBkb2luZz8KPj4KPj4gSSdk
IGxpa2UgdG8gZ2V0IGEgZmVlbCBmb3IgaG93IG1hbnkgcGVvcGxlIGNhbiBldmVuIGZvbGxvdyBz
b21lIG9mIG91ciBDLgo+IEkga25vdyB5b3UgZG9uJ3QgbGlrZSBzdWNoIGNvbnN0cnVjdHMsIGJ1
dCB5b3UgbGlrZWx5IGFsc28ga25vdwo+IHRoYXQgSSBkb24ndCBsaWtlIHRoZSByZWR1bmRhbmN5
IHJlc3VsdGluZyB3aGVuIG5vdCB1c2luZyB0aGVtLgo+IFlvdSd2ZSB2ZXRvZWQgYSBjaGFuZ2Ug
YnkgUm9nZXIgaW4gdGhpcyBkaXJlY3Rpb24gcmVjZW50bHkuCj4gV2hpbGUgSSBkaWQgYWNjZXB0
IHRoaXMgKGFzIHRoZSBjb2RlIHdlIGhhdmUgaXMgZmluZSBhcyBpcyBhcwo+IHdlbGwpLCBJIGRv
bid0IHRoaW5rIHlvdXIgcGVyc29uYWwgdGFzdGUgc2hvdWxkIHJ1bGUgb3V0IHN1Y2gKPiB1c2Vz
LiBJZiBhbnl0aGluZywgbWF5IEkgYXNrIGZvciBjbGVhciBndWlkZWxpbmVzICh0byBiZSBwdXQg
aW50bwo+IC4vQ09ESU5HX1NUWUxFIGFmdGVyIGhhdmluZyByZWFjaGVkIGNvbnNlbnN1cykgd2hp
Y2ggcGFydHMKPiBvZiB0aGUgQyBsYW5ndWFnZSBhcmUgZmluZSB0byB1c2UsIGFuZCB3aGljaCBv
bmVzIGFyZW4ndD8KCklmIGl0IHdlcmUgdXAgdG8gbWUsIEknZCByZWplY3QgYW55IHVzZSBvZiBj
b25zdHJ1Y3RzIGxpa2UgdGhpcy7CoCBUaGV5CmFyZSBmdW5kYW1lbnRhbGx5IGluY29tcGF0aWJs
ZSB3aXRoIGVhc3ktdG8tZm9sbG93IGNvZGUsIGFuZCBJIHZhbHVlCnRoYXQgYXMgYSBmYXIgbW9y
ZSBpbXBvcnRhbnQgcHJvcGVydHkgdGhhbiB0aGUgc291cmNlIGZpbGUgYmVpbmcgYSBmZXcKbGlu
ZXMgc2hvcnRlci4KClBhcnRpY3VsYXJseSBpbiB0aGlzIGNhc2UsIGl0IHJlYWxseSBpcyBqdXN0
IG9iZnVzY2F0aW9uLCBiZWNhdXNlIHRoZQpsb25naGFuZCB2ZXJzaW9uIGNhbiBiZSB3cml0dGVu
IHNob3J0ZXIgdGhhbiB0aGUgSFdFSUdIVCBtYWNybyBhbG9uZSwKbGV0IGFsb25lIGl0cyBpbnZv
Y2F0aW9uczoKCnVuc2lnbmVkIGludCBnZW5lcmljX2h3ZWlnaHQ4ICh1bnNpZ25lZCBpbnQgeCkg
eyByZXR1cm4gX2h3ZWlnaHQ4KHgpO8KgIH0KdW5zaWduZWQgaW50IGdlbmVyaWNfaHdlaWdodDE2
KHVuc2lnbmVkIGludCB4KSB7IHJldHVybiBfaHdlaWdodDE2KHgpOyB9CnVuc2lnbmVkIGludCBn
ZW5lcmljX2h3ZWlnaHQzMih1bnNpZ25lZCBpbnQgeCkgeyByZXR1cm4gX2h3ZWlnaHQzMih4KTsg
fQp1bnNpZ25lZCBpbnQgZ2VuZXJpY19od2VpZ2h0NjQodWludDY0X3QgeCnCoMKgwqDCoCB7IHJl
dHVybiBfaHdlaWdodDY0KHgpOyB9CgppcyBhIGZhciBlYXNpZXIgdG8gcmVhZCByZXN1bHQuwqAg
VGhhdCBzYWlkLCB0aGUgcG9pbnQgaXMgbW9vdCBiZWNhdXNlCnRoaXMgZmlsZSBzdGlsbCBkb2Vz
bid0IGNvbXBpbGUuCgo+Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2JpdG9wcy5oCj4+
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2JpdG9wcy5oCj4+PiBAQCAtNDY5LDE1ICs0Njks
MzUgQEAgc3RhdGljIGlubGluZSBpbnQgZmxzKHVuc2lnbmVkIGludCB4KQo+Pj4gICAgICByZXR1
cm4gciArIDE7Cj4+PiAgfQo+Pj4gIAo+Pj4gKy8qIFBPUENOVCBlbmNvZGluZ3Mgd2l0aCAle3Is
ZX1kaSBpbnB1dCBhbmQgJXtyLGV9YXggb3V0cHV0OiAqLwo+Pj4gKyNkZWZpbmUgUE9QQ05UXzY0
ICIuYnl0ZSAweEYzLCAweDQ4LCAweDBGLCAweEI4LCAweEM3Igo+Pj4gKyNkZWZpbmUgUE9QQ05U
XzMyICIuYnl0ZSAweEYzLCAweDBGLCAweEI4LCAweEM3Igo+PiBTbyAodGhlIGRhbmdlcnMgb2Yg
ZmFsc2UgbWljcm8tb3B0aW1zaWF0aW9uIGFzaWRlKSwgUE9QQ05UXzMyIHdpbGwKPj4gcHJvYmFi
bHkgYmUgYmV0dGVyIHVzaW5nIGEgcmVkdW5kYW50ICVkcyBwcmVmaXguCj4gRm9yIHRoZSB1c2Ug
aW4gaHdlaWdodDMyKCkgLSBwZXJoYXBzLiBCdXQgbm90IGZvciB0aGUgdXNlcyBpbgo+IGh3ZWln
aHR7MTYsOH0oKSwgYXMgdGhlcmUgb3JpZ2luYWwgY29kZSBhbmQgcmVwbGFjZW1lbnQgZnVsbHkK
PiBtYXRjaCB1cCBpbiBsZW5ndGhzLgoKTG9va2luZyBhdCB0aGUgY29tcGlsZXIgZ2VuZXJhdGVk
IGNvZGUsIHRoZSAzMiBhbmQgMTYgYml0IGFyZSBpZGVudGljYWwKb3RoZXIgdGhhbiB0aGUgZmlu
YWwgaW11bC7CoCBUaGUgOCBiaXQgY2FzZSBpcyB2ZXJ5IHNpbWlsYXIsIGJ1dCBjYW4KYWN0dWFs
bHkgZ2V0IGF3YXkgd2l0aCBpbW04IHJhdGhlciB0aGFuIGltbTMyLgoKVGhlcmUgaXMgb25lIGNh
bGxlciBlYWNoIGZvciB0aGUgOCBhbmQgMTYgYml0IHZlcnNpb24sIGJvdGggb2Ygd2hpY2ggYXJl
CmluIGlzX211bHRpY2FzdF9kZXN0KCkgaW4gdGhlIHZsYXBpYyBlbXVsYXRpb24gY29kZS7CoCBU
aGlzIHBhcnRpY3VsYXIKZXhhbXBsZSB3b3VsZCBhY3R1YWxseSBiZW5lZml0IGZyb20gTGludXgn
cyBleGFtcGxlIG9mIGFsaWFzaW5nIG9mIHRoZSA4CmFuZCAxNmJpdCB2ZXJzaW9ucyB0byB0aGUg
MzJiaXQgdmVyc2lvbi4KClRoZSBvbmx5IHVzZXIgd2hpY2ggaXMgaW4gYW55IHdheSBhIGZhc3Rw
YXRoIGlzIGluIF9fYml0bWFwX3dlaWdodCgpLAphbmQgSSd2ZSBnb3QgYW5vdGhlciBjbGVhbnVw
IHBhdGNoIGZvciB0aGF0LsKgIChJIGFsc28gYmV0IHRoYXQgZG9pbmcgYW4KeDg2IHNwZWNpZmlj
IHZlY3RvcmlzZWQgdmVyc2lvbiBvZiBfX2JpdG1hcF93ZWlnaHQoKSB1c2luZyBQT1BDTlQncwpt
ZW1vcnkgb3BlcmFuZCB3b3VsZCBiZSBhIHBlcmYgd2luLCBidXQgdGhhdCBjYW4gd2FpdCB1bnRp
bCBzb21lIGZyZWUKYW5kIHNvbWUgcHJvcGVyIHByb2ZpbGluZyBzdXBwb3J0IGFwcGVhcnMuKQoK
R2l2ZW4gdGhhdCB0aGlzIGlzIGEgaGVscGVyIHdoaWNoIGlzIHVubGlrZWx5IHRvIGV2ZXIgYmUg
cmV3cml0dGVuLCBhbmQKdGhlcmUgZG9lc24ndCBhcHBlYXIgdG8gYmUgYW4gb2J2aW91cyB3YXkg
dG8gZ2V0IENsYW5nIHRvIGF2b2lkIHVzaW5nCnNwZWNpZmljIHJlZ2lzdGVycywgSSdkIHN0aWxs
IHJlY29tbWVuZCB0aGUgTGludXggd2F5LCB3aXRoIHRoZSAzMiBhbmQKNjRiaXQgdmVyc2lvbnMg
Y3VzdG9tIHdyaXR0ZW4gaW4gYXNzZW1ibHksIGFuZCBub3Qgd29ycnkgYWJvdXQgdGhlCmR1cGxp
Y2F0aW9uLgoKPgo+PiBUaGUgcmVhc29uIGlzIHRoYXQgdGhlIHJlc3VsdCBuZWVkcyBwYWRkaW5n
IHRvIDUgYnl0ZXMsIGFzIHRoZSBvcmlnaW5hbAo+PiBpbnN0cnVjdGlvbiBpcyBgY2FsbCBkaXNw
MzJgLCBtZWFuaW5nIHRoYXQgYSBzaW5nbGUgYnl0ZSBub3AgbmVlZHMKPj4gaW5zZXJ0aW5nLiAg
VGhlIHZlcnNpb24gd2l0aCBhIHNpbmdsZSBub3AgdGFrZXMgdHdvIGRlY29kZSBwb3J0cyBhcwo+
PiBvcHBvc2VkIHRvIG9uZSwgYW5kIHNpbmdsZSBieXRlIG5vcHMgYXJlIGZvcmNlZCB0byB0YWtl
IGFuIGV4ZWN1dGlvbgo+PiBkZWxheSBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aCBE
b1MuCj4+Cj4+IE9UT0gsIEkgYWxzbyBiZXQgdGhhdCBub29uZSBjb3VsZCBvYnNlcnZlIGEgZGlm
ZmVyZW5jZSB3aXRob3V0IHVzaW5nCj4+IHBlcmYgY291bnRlcnMgYW5kIGZldGNoL2RlY29kZSB1
YXJjaCBldmVudHMuCj4gUGx1cyB0aGlzIGlzIHRoZW4gYSBtb3JlIGdlbmVyYWwgcHJvYmxlbSB0
byBhZGRyZXNzLCBub3Qgc29tZXRoaW5nCj4gdG8gc3BlY2lmaWNhbGx5IHdvcnJ5IGFib3V0IGhl
cmUuIFdvdWxkIHlvdSBoYXZlIGFza2VkIGZvciBhbgo+IGV4cGxpY2l0IG92ZXJyaWRlIGlmIHRo
ZSBpbnNuIHdhcyB3cml0dGVuIHVzaW5nIGEgcHJvcGVyIG1uZW1vbmljCj4gKGkuZS4gaWYgd2Ug
ZGlkbid0IG5lZWQgdG8gY29wZSB3aXRoIGluY2FwYWJsZSBiaW51dGlscyk/CgpJIHByb2JhYmx5
IHdvdWxkbid0IGhhdmUgbm90aWNlZCwgYnV0IGFzIGVsdWRlZCB0byBlYXJsaWVyLCBJIHJlYWxs
eQpkb24ndCBleHBlY3QgaXQgbWF0dGVycy4KClRhbGtpbmcgb2YgYmludXRpbHMsIHdoZW4gYXJl
IHdlIGdvaW5nIHRvIGdldCBhcm91bmQgdG8gdXBwaW5nIG91cgptaW5pbXVtIHZlcnNpb24/Cgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
