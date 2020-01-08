Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBFB134559
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 15:50:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipCca-000895-0p; Wed, 08 Jan 2020 14:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yXRY=25=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ipCcY-000890-Bl
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 14:47:42 +0000
X-Inumbo-ID: cd5e7e3a-3225-11ea-8599-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5e7e3a-3225-11ea-8599-bc764e2007e4;
 Wed, 08 Jan 2020 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578494854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=knNB7wRo9XfHNK+gKZIFPx/F0gkVI2aDALiBWRH3PME=;
 b=cc2zU4zSI2Z7a3D/2jcS3+CLmE3wLpbKV45tu9WNYhHzzpOkqAflvRw8
 5/PjPfiOsTFNtBEdw3i0y8L3oer4U6DsI6tqV1qn+LtTetGsji8IFOaOB
 zlOoZhcRvkzZrNxSfd4GsdyLW1TTE1Te1UVvaI4BTiX4mG9mCoeddCXfO 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PFeIkeo7OyFvAmDb1LZyur0TbnSSCONn1p22JDpNWmBevSPCk4soiluF2DA0aTinS7w6bkbS38
 NqP8xTQH/eCjBhVk5VLp6bowL4/oLpsZCNYgBm2aZrKh+hfO69FqcfkfdwgTiij+pFAD+zg8qB
 lCVawI/6dn3Ulc8r+zGXyyNZKOyATTuwnkiXZ4xbvJbdcwZGzgSl9TPxZABxt6rDkNCta38lZO
 dkDSbPkkcxQqAtLBOiHmrrhBEHMH2uV86eW4BKTdLL2WozKNfW+v7k43nHCEimEXtBYv/iSsUs
 DAw=
X-SBRS: 2.7
X-MesageID: 10614063
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10614063"
Date: Wed, 8 Jan 2020 14:47:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200108144729.GK1267@perard.uk.xensource.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <20191217105901.68158-3-anthony.perard@citrix.com>
 <c2285ab6-8627-545b-eedc-61e3c9e46769@suse.com>
 <20200106140147.GI1267@perard.uk.xensource.com>
 <0a9b734c-b6fd-046f-83c9-68fe486d46d6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a9b734c-b6fd-046f-83c9-68fe486d46d6@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMDYsIDIwMjAgYXQgMDM6MzQ6NDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDYuMDEuMjAyMCAxNTowMSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBPbiBG
cmksIEphbiAwMywgMjAyMCBhdCAwNTo0MjoxOFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+PiBPbiAxNy4xMi4yMDE5IDExOjU4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+Pj4gLS0t
IGEveGVuL0tjb25maWcKPiA+Pj4gKysrIGIveGVuL0tjb25maWcKPiA+Pj4gQEAgLTQsOSArNCwy
NiBAQAo+ID4+PiAgIwo+ID4+PiAgbWFpbm1lbnUgIlhlbi8kKFNSQ0FSQ0gpICQoWEVOX0ZVTExW
RVJTSU9OKSBDb25maWd1cmF0aW9uIgo+ID4+PiAgCj4gPj4+ICtzb3VyY2UgInNjcmlwdHMvS2Nv
bmZpZy5pbmNsdWRlIgo+ID4+PiArCj4gPj4+ICBjb25maWcgQlJPS0VOCj4gPj4+ICAJYm9vbAo+
ID4+PiAgCj4gPj4+ICtjb25maWcgQ0NfSVNfR0NDCj4gPj4+ICsJZGVmX2Jvb2wgJChzdWNjZXNz
LCQoQ0MpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAgLXEgZ2NjKQo+ID4+PiArCj4gPj4+
ICtjb25maWcgR0NDX1ZFUlNJT04KPiA+Pj4gKwlpbnQKPiA+Pj4gKwlkZWZhdWx0ICQoc2hlbGws
JChCQVNFRElSKS9zY3JpcHRzL2djYy12ZXJzaW9uLnNoICQoQ0MpKSBpZiBDQ19JU19HQ0MKPiA+
Pj4gKwlkZWZhdWx0IDAKPiA+Pgo+ID4+IFdoeSAiaWYiIGFuZCBhIDJuZCAiZGVmYXVsdCIgbGlu
ZSBoZXJlIGJ1dCAuLi4KPiA+Pgo+ID4+PiArY29uZmlnIENDX0lTX0NMQU5HCj4gPj4+ICsJZGVm
X2Jvb2wgJChzdWNjZXNzLCQoQ0MpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAgLXEgY2xh
bmcpCj4gPj4+ICsKPiA+Pj4gK2NvbmZpZyBDTEFOR19WRVJTSU9OCj4gPj4+ICsJaW50Cj4gPj4+
ICsJZGVmYXVsdCAkKHNoZWxsLCQoQkFTRURJUikvc2NyaXB0cy9jbGFuZy12ZXJzaW9uLnNoICQo
Q0MpKQo+ID4+Cj4gPj4gLi4uIGp1c3QgYSBzaW5nbGUsIHVuY29uZGl0aW9uYWwgb25lIGhlcmU/
Cj4gPiAKPiA+IGNsYW5nLXZlcnNpb24uc2ggcmV0dXJucyAwIHdoZW4gQ0MgaXNuJ3QgY2xhbmcs
IGJ1dCBnY2MtdmVyc2lvbi5zaAo+ID4gZG9lc24ndCBjaGVjayBpZiBDQyBpcyBnY2MsIGFuZCBy
ZXR1cm5zIGEgYm9ndXMgdmFsdWVzIGluc3RlYWQuCj4gPiAKPiA+IGUuZy46Cj4gPiAKPiA+ICQg
Li9jbGFuZy12ZXJzaW9uLnNoIGNsYW5nCj4gPiA5MDAwMAo+ID4gJCAuL2djYy12ZXJzaW9uLnNo
IGNsYW5nCj4gPiA0MDIwMQo+IAo+IEltbyBib3RoIHNjcmlwdHMgc2hvdWxkIGJlaGF2ZSBpZGVu
dGljYWxseSBpbiB0aGlzIHJlZ2FyZCAoYW5kIGluIGZhY3QKPiBpbiBhbGwgdXNhZ2UgcmVsYXRl
ZCBvbmVzKS4gSWYgYWRqdXN0aW5nIHRoZSBzY3JpcHRzIGlzIGVudGlyZWx5Cj4gdW5hY2NlcHRh
YmxlIGZvciBzb21lIHJlYXNvbiwgdGhlbiB0aGUgZGVzY3JpcHRpb24gc2hvdWxkIGhpZ2hsaWdo
dAo+IHRoZSBuZWVkIGZvciB0aGUgZGlmZmVyZW5jZXMuCgpJIHRoaW5rIGluIGdjYy12ZXJzaW9u
LnNoIGNhc2UgaXQgd291bGQgYmUgZmluZSB0byBoYXZlIGEgZGlmZmVyZW50CnZlcnNpb24gdGhh
biB0aGUgb25lIGluIExpbnV4LiBJIGRpZG4ndCBmaW5kIHRoZSBzY3JpcHQgdG8gYmUgdXNlZCB3
aXRoCmEgY29tcGlsZXIgb3RoZXIgdGhhdCBHQ0MuICBJJ2xsIGFkanVzdCB0aGUgc2NyaXB0IHRv
IHJldHVybiAwIHdoZW4gQ0MKaXNuJ3QgYSBnY2MsIGxpa2UgY2xhbmctdmVyc2lvbiBkb2VzLgoK
PiA+PiBXb3VsZG4ndCBib3RoIGJldHRlcgo+ID4+IGhhdmUgYSAiZGVwZW5kcyBvbiBDQ19JU18q
IiBsaW5lIGluc3RlYWQ/IFRoaXMgd291bGQgdGhlbiBhbHNvCj4gPj4gcmVzdWx0IChhZmFpY3Qp
IGluIG5vIENPTkZJR19DTEFOR19WRVJTSU9OIGluIC5jb25maWcgaWYgYnVpbGRpbmcKPiA+PiB3
aXRoIGdjYyAoYW5kIHZpY2UgdmVyc2EpLCBpbnN0ZWFkIG9mIGEgYm9ndXMgQ09ORklHX0NMQU5H
X1ZFUlNJT049MC4KPiA+IAo+ID4gSXQgc291bmRzIGF0dHJhY3RpbmcgdG8gcmVtb3ZlIHZhcmlh
YmxlcyBmcm9tIC5jb25maWcsIGJ1dCBpdCBpcyBlcXVhbGx5Cj4gPiBhdHRyYWN0aW5nIHRvIGFs
d2F5cyBoYXZlIGEgdmFyaWFibGUgc2V0LiBJdCBjYW4gYmUgdXNlZAo+ID4gdW5jb25kaXRpb25h
bGx5IHdoZW4gYWx3YXlzIHNldCAod2l0aG91dCByaXNraW5nIGludmFsaWQgc3ludGF4IGZvcgo+
ID4gZXhhbXBsZSkuCj4gCj4gSG1tLCB5ZXMsIGFzIGxvbmcgYXMgd2UgZG9uJ3QgaGF2ZSAoYnkg
bWVjaGFuaWNhbCBjb252ZXJzaW9uKSBvciBnYWluCj4gY29uc3RydWN0cyBsaWtlCj4gCj4gI2lm
IENPTkZJR19HQ0NfVkVSU0lPTiA8IDUwMDAwIC8qIG11c3QgYmUgZ2NjIDQueCAqLwo+IAo+IFBs
dXMgLSB3aGF0J3MgQ09ORklHX0NDX0lTX3tHQ0MsQ0xBTkd9IGdvb2QgZm9yIHRoZW4/IFRoZSBz
YW1lIGNhbgo+IHRoZW4gYmUgYWNoaWV2ZWQgYnkgY29tcGFyaW5nIENPTkZJR197R0NDLENMQU5H
fV9WRVJTSU9OIGFnYWluc3QgemVyby4KClN1cmUsIGJ1dCBpdCBpcyBtdWNoIGVhc2llciB0byB1
bmRlcnN0YW5kIHdoYXQgImlmZGVmIENPTkZJR19DQ19JU19HQ0MiCmlzIGFjdHVhbGx5IGNoZWNr
aW5nIHRoYW4gaXQgaXMgdG8gdW5kZXJzdGFuZCB3aGF0CiJbICRDT05GSUdfR0NDX1ZFUlNJT04g
LW5lIDAgXSIgaXMgZm9yLiBJbiB0aGUgc2Vjb25kIGZvcm0sIGl0IGlzbid0CmltbWVkaWF0bHkg
b2J2aW91cyBmb3IgaHVtYW5zIHRoYXQgd2UgYXJlIHNpbXBseSBjaGVja2luZyB3aGljaCBjb21w
aWxlcgppcyBpbiB1c2UuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
