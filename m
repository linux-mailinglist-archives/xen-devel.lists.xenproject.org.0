Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD0F4E756
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 13:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heI0N-0002EY-HD; Fri, 21 Jun 2019 11:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heI0L-0002ET-JX
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 11:46:53 +0000
X-Inumbo-ID: 3f81b004-941a-11e9-87f8-53e8c97d47d5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f81b004-941a-11e9-87f8-53e8c97d47d5;
 Fri, 21 Jun 2019 11:46:47 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4GEhpBmYl/2qX6BNzlW4W/LhTnJnaBZyGGE74TeI/bGJdbWUOWgZj1V1EyIy30Va0UfWHfqw4T
 +11jyjA53lngfaDzx46+WkbwS+Ip0Xc0QowBsHc6fjzhppAxx7UAzMOTAFHduv10iJj9MUq86t
 RkUk79/xYCZu74L/7rCZLdD9v5iTLt8p0o5DHQKS5HgV3i1wuwWHZrSG7yqYEMgt+RsiHhTCFa
 vuno5sM1vmsVXqe9EpvI9Buj0pLmMX5nyMCc+XMXk/8SiBLyJrPCqRoPRouZWquIGiny0boJzB
 XnM=
X-SBRS: 2.7
X-MesageID: 2053988
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2053988"
Date: Fri, 21 Jun 2019 13:46:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190621114635.22ylw4zh6tsika6j@MacBook-Air-de-Roger.local>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MzQ6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDY6NTc6MDVBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gSWYgdGhlIGh5cGVydmlzb3IgaGFzIGJlZW4gYnVpbHQg
d2l0aCBFRkkgc3VwcG9ydCAoaWU6IG11bHRpYm9vdDIpLgo+ID4+ID4gVGhpcyBhbGxvd3MgdG8g
cG9zaXRpb24gdGhlIC5yZWxvYyBzZWN0aW9uIGNvcnJlY3RseSBpbiB0aGUgb3V0cHV0Cj4gPj4g
PiBiaW5hcnksIG9yIGVsc2UgdGhlIGxpbmtlciBtaWdodCBwbGFjZSAucmVsb2MgYmVmb3JlIHRo
ZSAudGV4dAo+ID4+ID4gc2VjdGlvbi4KPiA+PiA+IAo+ID4+ID4gTm90ZSB0aGF0IHRoZSAucmVs
b2Mgc2VjdGlvbiBpcyBtb3ZlZCBiZWZvcmUgLmJzcyBmb3IgdHdvIHJlYXNvbnM6IGluCj4gPj4g
PiBvcmRlciBmb3IgdGhlIHJlc3VsdGluZyBiaW5hcnkgdG8gbm90IGNvbnRhaW4gYW55IHNlY3Rp
b24gd2l0aCBkYXRhCj4gPj4gPiBhZnRlciAuYnNzLCBzbyB0aGF0IHRoZSBmaWxlIHNpemUgY2Fu
IGJlIHNtYWxsZXIgdGhhbiB0aGUgbG9hZGVkCj4gPj4gPiBtZW1vcnkgc2l6ZSwgYW5kIGJlY2F1
c2UgdGhlIGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBzbyBpdAo+ID4+ID4gYmVsb25n
cyB3aXRoIHRoZSBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQtb25seSBkYXRhLgo+ID4+
IAo+ID4+IFdoaWxlIHRoaXMgbWF5IGJlIGZpbmUgZm9yIEVMRiwgSSdtIGFmcmFpZCBpdCB3b3Vs
ZCBiZSBjYWxsaW5nIGZvcgo+ID4+IHN1YnRsZSBpc3N1ZXMgd2l0aCB4ZW4uZWZpIChpLmUuIHRo
ZSBQRSBiaW5hcnkpOiBUaGVyZSBhIC5yZWxvYwo+ID4+IHNlY3Rpb24gaXMgZ2VuZXJhbGx5IGV4
cGVjdGVkIHRvIGNvbWUgYWZ0ZXIgIm5vcm1hbCIgZGF0YQo+ID4+IHNlY3Rpb25zLgo+ID4gCj4g
PiBPSywgd291bGQgeW91IGxpa2UgbWUgdG8gbGVhdmUgdGhlIC5yZWxvYyBzZWN0aW9uIGF0IHRo
ZSBwcmV2aW91cwo+ID4gcG9zaXRpb24gZm9yIEVGSSBidWlsZHMgdGhlbj8KPiAKPiBXZWxsLCB0
aGlzIHBhcnQgaXMgYSByZXF1aXJlbWVudCwgbm90IGEgcXVlc3Rpb24gb2YgbWUgbGlraW5nIHlv
dQo+IHRvIGRvIHNvLgo+IAo+ID4gT3IgZG8gd2UgcHJlZmVyIHRvIGxlYXZlIC5yZWxvYyBvcnBo
YW5lZCBpbiB0aGUgRUxGIGJ1aWxkPwo+IAo+IERhbmllbCBtaWdodCBoYXZlIGFuIG9waW5pb24g
aGVyZSB3aXRoIGhpcyBwbGFucyB0byBhY3R1YWxseQo+IGFkZCByZWxvY2F0aW9ucyB0aGVyZSBp
biB0aGUgbm9uLWxpbmtlci1nZW5lcmF0ZWQtUEUgYnVpbGQuIEkKPiBkb24ndCBoYXZlIGEgc3Ry
b25nIG9waW5pb24gZWl0aGVyIHdheSwgYXMgbG9uZyBhcyB0aGUKPiBjdXJyZW50IG1ldGhvZCBv
ZiBidWlsZGluZyBnZXRzIGxlZnQgYXMgaXMgKG9yIGV2ZW4gc2ltcGxpZmllZCkuCj4gCj4gQWxz
byBhIHJlbWFyayByZWdhcmRpbmcgdGhlIHRpdGxlIC0gaW4gbXkgYnVpbGRzIHRoZXJlIGFscmVh
ZHkgaXMKPiBhIC5yZWxvYyBzZWN0aW9uIGluIHRoZSBFTEYgaW1hZ2VzLCBzbyAiYWRkIiBkb2Vz
bid0IHJlYWxseSBzZWVtCj4gY29ycmVjdCB0byBtZS4gSXQgc2l0cyByaWdodCBhZnRlciAucm9k
YXRhLCBhbmQgSSB3b3VsZCBpdCBkb2Vzbid0Cj4gZ2V0IGZvbGRlZCBpbnRvIHRoZXJlIGJlY2F1
c2UgLSBmb3Igc29tZSByZWFzb24gLSAucm9kYXRhIGlzCj4gYWN0dWFsbHkgbWFya2VkIHdyaXRh
YmxlLgoKQUZBSUNUIC5yb2RhdGEgaXMgbWFya2VkIHdyaXRhYmxlIGJlY2F1c2UgaXQgY29udGFp
bnMgLmRhdGEucGFyYW0gYW5kCi5kYXRhLnJlbC5yby4gSSdtIHVuc3VyZSB3aHkgd2UgbmVlZCAu
ZGF0YS5yZWwucm8sIEkgd291bGQgYXNzdW1lIHRoYXQKb25jZSB0aGUgZmluYWwgYmluYXJ5IGhh
cyBiZWVuIGxpbmtlZCAuZGF0YS5yZWwucm8gd291bGQgYmUgZW1wdHksCnNpbmNlIHRoZXJlJ3Mg
bm8gcnVuIHRpbWUgbGlua2luZyBvciByZWxvY2F0aW9uIGFzIFhlbiBpcyBhIHN0YW5kYWxvbmUK
YmluYXJ5LgoKUmVnYXJkaW5nIC5kYXRhLnBhcmFtIGl0IHNob3VsZCBiZSByZW5hbWVkIHRvIC5y
b2RhdGEucGFyYW0sIGFuZCBJCnNob3VsZCB0YWtlIGEgbG9vayBhdCB3aHkgaXQncyBtYXJrZWQg
YXMgJ1dBJyBpbnN0ZWFkIG9mICdBJy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
