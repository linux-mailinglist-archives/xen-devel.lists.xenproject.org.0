Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6811B5FF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 16:58:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if4KF-0004cA-Nq; Wed, 11 Dec 2019 15:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1if4KD-0004c4-Gz
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 15:54:53 +0000
X-Inumbo-ID: 8bfdafea-1c2e-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bfdafea-1c2e-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576079684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uFD/sJLzfDOqafCHdcPWeeQrbytg8OjhfDZsJxYuNmI=;
 b=gvNtMA5Tl3AY3iDCRBixx7hZS3o4D0A8pFI9XkkIQqzIZrmkdpGz26k2
 B1EA3EijTkWJW+Yr1IZqhfQdtQ4iwvsvQvUvbbsesUV+4xuRpAnDm5Y/v
 aW9Sp4WXjNDkPYe9ZObUUga5ZC7pzrVR3QfAQJw2yRZVmBjSTHiCKyT69 U=;
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
IronPort-SDR: IumYhEVKNCo7TU/lhVCsZ+J40Nwbd44gQZpbChVX0uazhGteAg41Up7cTWx3RwB2TVlhNGilAS
 RsA0B6LlJRMHpzzm9AN8odhviwoNOeYN1qzgcbARaC5SaAo7WLERpuPJgsD1nhKcfy1YigAMau
 EbQhlRZUgx78WDXpjo+UiHuvhO8jIVZ3ghPYy7JUly97Smd3KjK6+9LpP7D2Nr2pilM3aNXoZk
 CRtsVjVt4eABMbPe28LSkTejzgQXg6T0zFocVamU6I00poQQWjqQ9exetwWXTxtHlkxtJLDC5y
 yqM=
X-SBRS: 2.7
X-MesageID: 9662397
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9662397"
Date: Wed, 11 Dec 2019 16:54:36 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191211155436.GQ980@Air-de-Roger>
References: <e43e17ea-6ad0-d125-216f-4798853e3116@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e43e17ea-6ad0-d125-216f-4798853e3116@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] IOMMU: make DMA containment of quarantined
 devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDE6NTM6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ29udGFpbmluZyBzdGlsbCBpbiBmbGlnaHQgRE1BIHdhcyBpbnRyb2R1Y2VkIHRvIHdv
cmsgYXJvdW5kIGNlcnRhaW4KPiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBo
aXR0aW5nIGFuIElPTU1VIGZhdWx0LiBQYXNzaW5nCj4gdGhyb3VnaCAoc3VjaCkgZGV2aWNlcyAo
b24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGluc2VjdXJlIChhcwo+IGd1ZXN0cyBjb3Vs
ZCBlYXNpbHkgYXJyYW5nZSBmb3IgSU9NTVUgZmF1bHRzIHRvIG9jY3VyKS4gRGVmYXVsdGluZyB0
bwo+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZiBpc3N1
ZXMgd2l0aCBkZXZpY2VzIGNhbgo+IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFibGUuIFRoZXJlZm9y
ZSBjb252ZXJ0IHRoaXMgbW9kZSBvZiBvcGVyYXRpb24gdG8KPiBhbiBvcHRpb25hbCBvbmUsIG5v
dCBvbmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+IAo+IFRoaXMgaW52b2x2ZXMgcmVzdXJyZWN0aW5n
IGNvZGUgY29tbWl0IGVhMzg4Njc4MzFkYSAoIng4NiAvIGlvbW11OiBzZXQKPiB1cCBhIHNjcmF0
Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBkb21haW4iKSBkaWQgcmVtb3ZlLCBpbiBhIHNsaWdo
dGx5Cj4gZXh0ZW5kZWQgZmFzaGlvbi4gSGVyZSwgaW5zdGVhZCBvZiByZWludHJvZHVjaW5nIGEg
cHJldHR5IHBvaW50bGVzcyB1c2UKPiBvZiAiZ290byIgaW4gZG9tYWluX2NvbnRleHRfdW5tYXAo
KSwgYW5kIGluc3RlYWQgb2YgbWFraW5nIHRoZSBmdW5jdGlvbgo+IChhdCBsZWFzdCB0ZW1wb3Jh
cmlseSkgaW5jb25zaXN0ZW50LCB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgcmVwbGFjZQo+IHRo
ZSBvdGhlciBzaW1pbGFybHkgcG9pbnRsZXNzICJnb3RvIiBhcyB3ZWxsLgo+IAo+IEluIG9yZGVy
IHRvIGtleSB0aGUgcmUtaW5zdGF0ZWQgYnlwYXNzZXMgb2ZmIG9mIHRoZXJlIChub3QpIGJlaW5n
IGEgcm9vdAo+IHBhZ2UgdGFibGUgdGhpcyBmdXJ0aGVyIHJlcXVpcmVzIG1vdmluZyB0aGUgYWxs
b2NhdGVfZG9tYWluX3Jlc291cmNlcygpCj4gaW52b2NhdGlvbiBmcm9tIHJlYXNzaWduX2Rldmlj
ZSgpIHRvIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWNlKCkgKG9yCj4gZWxzZSByZWFzc2ln
bl9kZXZpY2UoKSB3b3VsZCBhbGxvY2F0ZSBhIHJvb3QgcGFnZSB0YWJsZSBhbnl3YXkpOyB0aGlz
IGlzCj4gYmVuaWduIHRvIHRoZSBzZWNvbmQgY2FsbGVyIG9mIHRoZSBsYXR0ZXIgZnVuY3Rpb24u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0t
LQo+IEknbSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdnZXN0aW9ucyB0byByZXBsYWNlICJmdWxs
Ii4KPiAKPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiArKysgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiBAQCAtMTIzMiw3ICsxMjMyLDcgQEAg
ZGV0ZWN0aW9uIG9mIHN5c3RlbXMga25vd24gdG8gbWlzYmVoYXZlCj4gID4gRGVmYXVsdDogYG5l
d2AgdW5sZXNzIGRpcmVjdGVkLUVPSSBpcyBzdXBwb3J0ZWQKPiAgCj4gICMjIyBpb21tdQo+IC0g
ICAgPSBMaXN0IG9mIFsgPGJvb2w+LCB2ZXJib3NlLCBkZWJ1ZywgZm9yY2UsIHJlcXVpcmVkLCBx
dWFyYW50aW5lLAo+ICsgICAgPSBMaXN0IG9mIFsgPGJvb2w+LCB2ZXJib3NlLCBkZWJ1ZywgZm9y
Y2UsIHJlcXVpcmVkLCBxdWFyYW50aW5lWz1mdWxsXSwKPiAgICAgICAgICAgICAgICAgIHNoYXJl
cHQsIGludHJlbWFwLCBpbnRwb3N0LCBjcmFzaC1kaXNhYmxlLAo+ICAgICAgICAgICAgICAgICAg
c25vb3AsIHFpbnZhbCwgaWdmeCwgYW1kLWlvbW11LXBlcmRldi1pbnRyZW1hcCwKPiAgICAgICAg
ICAgICAgICAgIGRvbTAte3Bhc3N0aHJvdWdoLHN0cmljdH0gXQo+IEBAIC0xMjcwLDExICsxMjcw
LDEzIEBAIGJvb2xlYW4gKGUuZy4gYGlvbW11PW5vYCkgY2FuIG92ZXJyaWRlIHQKPiAgICAgIHdp
bGwgcHJldmVudCBYZW4gZnJvbSBib290aW5nIGlmIElPTU1VcyBhcmVuJ3QgZGlzY292ZXJlZCBh
bmQgZW5hYmxlZAo+ICAgICAgc3VjY2Vzc2Z1bGx5Lgo+ICAKPiAtKiAgIFRoZSBgcXVhcmFudGlu
ZWAgYm9vbGVhbiBjYW4gYmUgdXNlZCB0byBjb250cm9sIFhlbidzIGJlaGF2aW9yIHdoZW4KPiAt
ICAgIGRlLWFzc2lnbmluZyBkZXZpY2VzIGZyb20gZ3Vlc3RzLiAgSWYgZW5hYmxlZCAodGhlIGRl
ZmF1bHQpLCBYZW4gYWx3YXlzCj4gLSAgICBxdWFyYW50aW5lcyBzdWNoIGRldmljZXM7IHRoZXkg
bXVzdCBiZSBleHBsaWNpdGx5IGFzc2lnbmVkIGJhY2sgdG8gRG9tMAo+IC0gICAgYmVmb3JlIHRo
ZXkgY2FuIGJlIHVzZWQgdGhlcmUgYWdhaW4uICBJZiBkaXNhYmxlZCwgWGVuIHdpbGwgb25seQo+
IC0gICAgcXVhcmFudGluZSBkZXZpY2VzIHRoZSB0b29sc3RhY2sgaGFzcyBhcnJhbmdlZCBmb3Ig
Z2V0dGluZyBxdWFyYW50aW5lZC4KPiArKiAgIFRoZSBgcXVhcmFudGluZWAgb3B0aW9uIGNhbiBi
ZSB1c2VkIHRvIGNvbnRyb2wgWGVuJ3MgYmVoYXZpb3Igd2hlbgo+ICsgICAgZGUtYXNzaWduaW5n
IGRldmljZXMgZnJvbSBndWVzdHMuICBJZiBzZXQgdG8gdHJ1ZSAodGhlIGRlZmF1bHQpLCBYZW4K
PiArICAgIGFsd2F5cyBxdWFyYW50aW5lcyBzdWNoIGRldmljZXM7IHRoZXkgbXVzdCBiZSBleHBs
aWNpdGx5IGFzc2lnbmVkIGJhY2sKPiArICAgIHRvIERvbTAgYmVmb3JlIHRoZXkgY2FuIGJlIHVz
ZWQgdGhlcmUgYWdhaW4uICBJZiBzZXQgdG8gImZ1bGwiLCBzdGlsbAo+ICsgICAgYWN0aXZlIERN
QSB3aWxsIGFkZGl0aW9uYWxseSBiZSBkaXJlY3RlZCB0byBhICJzaW5rIiBwYWdlLiAgSWYgc2V0
IHRvCj4gKyAgICBmYWxzZSwgWGVuIHdpbGwgb25seSBxdWFyYW50aW5lIGRldmljZXMgdGhlIHRv
b2xzdGFjayBoYXMgYXJyYW5nZWQgZm9yCj4gKyAgICBnZXR0aW5nIHF1YXJhbnRpbmVkLgo+ICAK
PiAgKiAgIFRoZSBgc2hhcmVwdGAgYm9vbGVhbiBjb250cm9scyB3aGV0aGVyIHRoZSBJT01NVSBw
YWdldGFibGVzIGFyZSBzaGFyZWQKPiAgICAgIHdpdGggdGhlIENQVS1zaWRlIEhBUCBwYWdldGFi
bGVzLCBvciBhbGxvY2F0ZWQgc2VwYXJhdGVseS4gIFNoYXJpbmcKPiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+IEBAIC04NSwxOCArODUsMzYgQEAgaW50IGdl
dF9kbWFfcmVxdWVzdG9yX2lkKHVpbnQxNl90IHNlZywgdQo+ICAgICAgcmV0dXJuIHJlcV9pZDsK
PiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UoCj4g
K3N0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGFsbG9jYXRlX2RvbWFpbl9yZXNvdXJjZXMoc3RydWN0
IGRvbWFpbl9pb21tdSAqaGQpCj4gK3sKPiArICAgIGludCByYzsKPiArCj4gKyAgICBzcGluX2xv
Y2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7Cj4gKyAgICByYyA9IGFtZF9pb21tdV9hbGxvY19y
b290KGhkKTsKPiArICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5nX2xvY2spOwo+ICsK
PiArICAgIHJldHVybiByYzsKPiArfQo+ICsKPiArc3RhdGljIGludCBfX211c3RfY2hlY2sgYW1k
X2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UoCj4gICAgICBzdHJ1Y3QgZG9tYWluICpkb21haW4s
IHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LAo+ICAgICAgdWludDhfdCBkZXZmbiwgc3RydWN0IHBj
aV9kZXYgKnBkZXYpCj4gIHsKPiAgICAgIHN0cnVjdCBhbWRfaW9tbXVfZHRlICp0YWJsZSwgKmR0
ZTsKPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gLSAgICBpbnQgcmVxX2lkLCB2YWxpZCA9
IDE7Cj4gKyAgICBpbnQgcmVxX2lkLCB2YWxpZCA9IDEsIHJjOwo+ICAgICAgdTggYnVzID0gcGRl
di0+YnVzOwo+IC0gICAgY29uc3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUo
ZG9tYWluKTsKPiArICAgIHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGRvbWFp
bik7Cj4gKwo+ICsgICAgLyogZG9tX2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3IgcXVhcmFu
dGluZWQgZGV2aWNlcyAqLwo+ICsgICAgaWYgKCBkb21haW4gPT0gZG9tX2lvICYmICFoZC0+YXJj
aC5yb290X3RhYmxlICkKClRoaXMgY29uZGl0aW9uIChhbmQgaXQncyBJbnRlbCBjb3VudGVycGFy
dCkgd291bGQgYmUgYmV0dGVyIGluIGEgbWFjcm8KSU1PLCBzbyB0aGF0IHZlbmRvciBjb2RlIHJl
Z2FyZGxlc3Mgb2YgdGhlIGltcGxlbWVudGF0aW9uIGNhbiB1c2UgdGhlCnNhbWUgbWFjcm8gKGFu
ZCB0byBhdm9pZCBoYXZpbmcgdG8gYWRkIHRoZSBzYW1lIGNvbW1lbnQgaW4gYWxsCmluc3RhbmNl
cyksIGllOiBJU19ERVZJQ0VfUVVBUkFOVElORUQgb3Igc29tZSBzdWNoIHdvdWxkIGJlIGZpbmUg
SU1PLgoKPiArICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICBCVUdfT04oIWhkLT5hcmNoLnBh
Z2luZ19tb2RlIHx8ICFpb21tdS0+ZGV2X3RhYmxlLmJ1ZmZlcik7Cj4gIAo+IC0gICAgQlVHX09O
KCAhaGQtPmFyY2gucm9vdF90YWJsZSB8fCAhaGQtPmFyY2gucGFnaW5nX21vZGUgfHwKPiAtICAg
ICAgICAgICAgIWlvbW11LT5kZXZfdGFibGUuYnVmZmVyICk7Cj4gKyAgICByYyA9IGFsbG9jYXRl
X2RvbWFpbl9yZXNvdXJjZXMoaGQpOwo+ICsgICAgaWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJu
IHJjOwo+ICAKPiAgICAgIGlmICggaW9tbXVfaHdkb21fcGFzc3Rocm91Z2ggJiYgaXNfaGFyZHdh
cmVfZG9tYWluKGRvbWFpbikgKQo+ICAgICAgICAgIHZhbGlkID0gMDsKPiBAQCAtMTUxLDYgKzE2
OSw4IEBAIHN0YXRpYyB2b2lkIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWMKPiAgCj4gICAg
ICAgICAgYW1kX2lvbW11X2ZsdXNoX2lvdGxiKGRldmZuLCBwZGV2LCBJTlZfSU9NTVVfQUxMX1BB
R0VTX0FERFJFU1MsIDApOwo+ICAgICAgfQo+ICsKPiArICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+
ICBpbnQgX19pbml0IGFjcGlfaXZyc19pbml0KHZvaWQpCj4gQEAgLTIyMCwxNyArMjQwLDYgQEAg
aW50IGFtZF9pb21tdV9hbGxvY19yb290KHN0cnVjdCBkb21haW5faQo+ICAgICAgcmV0dXJuIDA7
Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGFsbG9jYXRlX2RvbWFpbl9yZXNv
dXJjZXMoc3RydWN0IGRvbWFpbl9pb21tdSAqaGQpCj4gLXsKPiAtICAgIGludCByYzsKPiAtCj4g
LSAgICBzcGluX2xvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7Cj4gLSAgICByYyA9IGFtZF9p
b21tdV9hbGxvY19yb290KGhkKTsKPiAtICAgIHNwaW5fdW5sb2NrKCZoZC0+YXJjaC5tYXBwaW5n
X2xvY2spOwo+IC0KPiAtICAgIHJldHVybiByYzsKPiAtfQo+IC0KPiAgaW50IGFtZF9pb21tdV9n
ZXRfcGFnaW5nX21vZGUodW5zaWduZWQgbG9uZyBlbnRyaWVzKQo+ICB7Cj4gICAgICBpbnQgbGV2
ZWwgPSAxOwo+IEBAIC0yODcsNiArMjk2LDEwIEBAIHN0YXRpYyB2b2lkIGFtZF9pb21tdV9kaXNh
YmxlX2RvbWFpbl9kZXYKPiAgICAgIGludCByZXFfaWQ7Cj4gICAgICB1OCBidXMgPSBwZGV2LT5i
dXM7Cj4gIAo+ICsgICAgLyogZG9tX2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3IgcXVhcmFu
dGluZWQgZGV2aWNlcyAqLwo+ICsgICAgaWYgKCBkb21haW4gPT0gZG9tX2lvICYmICFkb21faW9t
bXUoZG9tYWluKS0+YXJjaC5yb290X3RhYmxlICkKPiArICAgICAgICByZXR1cm47Cj4gKwo+ICAg
ICAgQlVHX09OICggaW9tbXUtPmRldl90YWJsZS5idWZmZXIgPT0gTlVMTCApOwo+ICAgICAgcmVx
X2lkID0gZ2V0X2RtYV9yZXF1ZXN0b3JfaWQoaW9tbXUtPnNlZywgUENJX0JERjIoYnVzLCBkZXZm
bikpOwo+ICAgICAgdGFibGUgPSBpb21tdS0+ZGV2X3RhYmxlLmJ1ZmZlcjsKPiBAQCAtMzMzLDcg
KzM0Niw2IEBAIHN0YXRpYyBpbnQgcmVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4KPiAgewo+
ICAgICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXU7Cj4gICAgICBpbnQgYmRmLCByYzsKPiAtICAg
IHN0cnVjdCBkb21haW5faW9tbXUgKnQgPSBkb21faW9tbXUodGFyZ2V0KTsKPiAgCj4gICAgICBi
ZGYgPSBQQ0lfQkRGMihwZGV2LT5idXMsIHBkZXYtPmRldmZuKTsKPiAgICAgIGlvbW11ID0gZmlu
ZF9pb21tdV9mb3JfZGV2aWNlKHBkZXYtPnNlZywgYmRmKTsKPiBAQCAtMzU0LDExICszNjYsMTAg
QEAgc3RhdGljIGludCByZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbgo+ICAgICAgICAgIHBk
ZXYtPmRvbWFpbiA9IHRhcmdldDsKPiAgICAgIH0KPiAgCj4gLSAgICByYyA9IGFsbG9jYXRlX2Rv
bWFpbl9yZXNvdXJjZXModCk7Cj4gKyAgICByYyA9IGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2
aWNlKHRhcmdldCwgaW9tbXUsIGRldmZuLCBwZGV2KTsKPiAgICAgIGlmICggcmMgKQo+ICAgICAg
ICAgIHJldHVybiByYzsKPiAgCj4gLSAgICBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSh0
YXJnZXQsIGlvbW11LCBkZXZmbiwgcGRldik7Cj4gICAgICBBTURfSU9NTVVfREVCVUcoIlJlLWFz
c2lnbiAlMDR4OiUwMng6JTAyeC4ldSBmcm9tIGRvbSVkIHRvIGRvbSVkXG4iLAo+ICAgICAgICAg
ICAgICAgICAgICAgIHBkZXYtPnNlZywgcGRldi0+YnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9G
VU5DKGRldmZuKSwKPiAgICAgICAgICAgICAgICAgICAgICBzb3VyY2UtPmRvbWFpbl9pZCwgdGFy
Z2V0LT5kb21haW5faWQpOwo+IEBAIC01MTUsOCArNTI2LDcgQEAgc3RhdGljIGludCBhbWRfaW9t
bXVfYWRkX2RldmljZSh1OCBkZXZmbgo+ICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmlvbW11LT5sb2NrLCBmbGFncyk7Cj4gICAgICB9Cj4gIAo+IC0gICAgYW1kX2lvbW11X3NldHVw
X2RvbWFpbl9kZXZpY2UocGRldi0+ZG9tYWluLCBpb21tdSwgZGV2Zm4sIHBkZXYpOwo+IC0gICAg
cmV0dXJuIDA7Cj4gKyAgICByZXR1cm4gYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpY2UocGRl
di0+ZG9tYWluLCBpb21tdSwgZGV2Zm4sIHBkZXYpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGFt
ZF9pb21tdV9yZW1vdmVfZGV2aWNlKHU4IGRldmZuLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0zMCwxMyArMzAsMTcgQEAgYm9vbF90IF9faW5pdGRh
dGEgaW9tbXVfZW5hYmxlID0gMTsKPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfZW5hYmxl
ZDsKPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgZm9yY2VfaW9tbXU7Cj4gIGJvb2xfdCBfX3JlYWRf
bW9zdGx5IGlvbW11X3ZlcmJvc2U7Cj4gLWJvb2wgX19yZWFkX21vc3RseSBpb21tdV9xdWFyYW50
aW5lID0gdHJ1ZTsKPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaWdmeCA9IDE7Cj4gIGJv
b2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3Nub29wID0gMTsKPiAgYm9vbF90IF9fcmVhZF9tb3N0
bHkgaW9tbXVfcWludmFsID0gMTsKPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cmVt
YXAgPSAxOwo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9jcmFzaF9kaXNhYmxlOwo+ICAK
PiArI2RlZmluZSBJT01NVV9xdWFyYW50aW5lX25vbmUgIGZhbHNlCj4gKyNkZWZpbmUgSU9NTVVf
cXVhcmFudGluZV9iYXNpYyB0cnVlCj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9mdWxsICAy
Cj4gK3VpbnQ4X3QgX19yZWFkX21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gSU9NTVVfcXVhcmFu
dGluZV9iYXNpYzsKCkkgZG9uJ3QgcmVhbGx5IGxpa2UgdG8gdXNlIGJvb2xlYW5zIHdpdGggbm9u
LWJvb2xlYW4gdmFyaWFibGVzLgpXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8ganVzdCB1c2UgcGxh
aW4gbnVtYmVycywgb3IgZXZlbiBiZXR0ZXIgYW4KZW51bT8KCj4gKwo+ICBzdGF0aWMgYm9vbCBf
X2h3ZG9tX2luaXRkYXRhIGlvbW11X2h3ZG9tX25vbmU7Cj4gIGJvb2wgX19od2RvbV9pbml0ZGF0
YSBpb21tdV9od2RvbV9zdHJpY3Q7Cj4gIGJvb2wgX19yZWFkX21vc3RseSBpb21tdV9od2RvbV9w
YXNzdGhyb3VnaDsKPiBAQCAtODEsNiArODUsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9p
b21tdV9wYXJhbShjb25zCj4gICAgICAgICAgICAgIGZvcmNlX2lvbW11ID0gdmFsOwo+ICAgICAg
ICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigicXVhcmFudGluZSIsIHMsIHNzKSkg
Pj0gMCApCj4gICAgICAgICAgICAgIGlvbW11X3F1YXJhbnRpbmUgPSB2YWw7Cj4gKyAgICAgICAg
ZWxzZSBpZiAoIHNzID09IHMgKyAxNSAmJiAhc3RybmNtcChzLCAicXVhcmFudGluZT1mdWxsIiwg
MTUpICkKPiArICAgICAgICAgICAgaW9tbXVfcXVhcmFudGluZSA9IElPTU1VX3F1YXJhbnRpbmVf
ZnVsbDsKPiAgICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImlnZngiLCBz
LCBzcykpID49IDAgKQo+ICAgICAgICAgICAgICBpb21tdV9pZ2Z4ID0gdmFsOwo+ICAgICAgICAg
IGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigidmVyYm9zZSIsIHMsIHNzKSkgPj0gMCAp
Cj4gQEAgLTQ1MSw3ICs0NTcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpb21tdV9xdWFyYW50aW5l
X2luaXQoCj4gICAgICBkb21faW8tPm9wdGlvbnMgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7Cj4g
IAo+ICAgICAgcmMgPSBpb21tdV9kb21haW5faW5pdChkb21faW8sIDApOwo+IC0gICAgaWYgKCBy
YyApCj4gKyAgICBpZiAoIHJjIHx8IGlvbW11X3F1YXJhbnRpbmUgPCBJT01NVV9xdWFyYW50aW5l
X2Z1bGwgKQo+ICAgICAgICAgIHJldHVybiByYzsKPiAgCj4gICAgICBpZiAoICFoZC0+cGxhdGZv
cm1fb3BzLT5xdWFyYW50aW5lX2luaXQgKQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMK
PiBAQCAtMTI5MSw2ICsxMjkxLDEwIEBAIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZSgK
PiAgICAgIGludCBhZ2F3LCByYywgcmV0Owo+ICAgICAgYm9vbF90IGZsdXNoX2Rldl9pb3RsYjsK
PiAgCj4gKyAgICAvKiBkb21faW8gaXMgdXNlZCBhcyBhIHNlbnRpbmVsIGZvciBxdWFyYW50aW5l
ZCBkZXZpY2VzICovCj4gKyAgICBpZiAoIGRvbWFpbiA9PSBkb21faW8gJiYgIWhkLT5hcmNoLnBn
ZF9tYWRkciApCj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICAgICAgQVNTRVJUKHBjaWRldnNf
bG9ja2VkKCkpOwo+ICAgICAgc3Bpbl9sb2NrKCZpb21tdS0+bG9jayk7Cj4gICAgICBtYWRkciA9
IGJ1c190b19jb250ZXh0X21hZGRyKGlvbW11LCBidXMpOwo+IEBAIC0xNTM3LDYgKzE1NDEsMTAg
QEAgaW50IGRvbWFpbl9jb250ZXh0X3VubWFwX29uZSgKPiAgICAgIGludCBpb21tdV9kb21pZCwg
cmMsIHJldDsKPiAgICAgIGJvb2xfdCBmbHVzaF9kZXZfaW90bGI7Cj4gIAo+ICsgICAgLyogZG9t
X2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3IgcXVhcmFudGluZWQgZGV2aWNlcyAqLwo+ICsg
ICAgaWYgKCBkb21haW4gPT0gZG9tX2lvICYmICFkb21faW9tbXUoZG9tYWluKS0+YXJjaC5wZ2Rf
bWFkZHIgKQo+ICsgICAgICAgIHJldHVybiAwOwo+ICsKPiAgICAgIEFTU0VSVChwY2lkZXZzX2xv
Y2tlZCgpKTsKPiAgICAgIHNwaW5fbG9jaygmaW9tbXUtPmxvY2spOwo+ICAKPiBAQCAtMTU5OCw3
ICsxNjA2LDcgQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChzdHJ1Y3QgZAo+ICB7
Cj4gICAgICBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQgKmRyaGQ7Cj4gICAgICBzdHJ1Y3QgdnRkX2lv
bW11ICppb21tdTsKPiAtICAgIGludCByZXQgPSAwOwo+ICsgICAgaW50IHJldDsKPiAgICAgIHU4
IHNlZyA9IHBkZXYtPnNlZywgYnVzID0gcGRldi0+YnVzLCB0bXBfYnVzLCB0bXBfZGV2Zm4sIHNl
Y2J1czsKPiAgICAgIGludCBmb3VuZCA9IDA7Cj4gIAo+IEBAIC0xNjE0LDE0ICsxNjIyLDEyIEBA
IHN0YXRpYyBpbnQgZG9tYWluX2NvbnRleHRfdW5tYXAoc3RydWN0IGQKPiAgICAgICAgICAgICAg
cHJpbnRrKFZURFBSRUZJWCAiZCVkOkhvc3RicmlkZ2U6IHNraXAgJTA0eDolMDJ4OiUwMnguJXUg
dW5tYXBcbiIsCj4gICAgICAgICAgICAgICAgICAgICBkb21haW4tPmRvbWFpbl9pZCwgc2VnLCBi
dXMsCj4gICAgICAgICAgICAgICAgICAgICBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZu
KSk7Cj4gLSAgICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGRvbWFpbikgKQo+IC0gICAg
ICAgICAgICByZXR1cm4gLUVQRVJNOwo+IC0gICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAgIHJl
dHVybiBpc19oYXJkd2FyZV9kb21haW4oZG9tYWluKSA/IDAgOiAtRVBFUk07Cj4gIAo+ICAgICAg
Y2FzZSBERVZfVFlQRV9QQ0llX0JSSURHRToKPiAgICAgIGNhc2UgREVWX1RZUEVfUENJZTJQQ0lf
QlJJREdFOgo+ICAgICAgY2FzZSBERVZfVFlQRV9MRUdBQ1lfUENJX0JSSURHRToKPiAtICAgICAg
ICBnb3RvIG91dDsKPiArICAgICAgICByZXR1cm4gMDsKPiAgCj4gICAgICBjYXNlIERFVl9UWVBF
X1BDSWVfRU5EUE9JTlQ6Cj4gICAgICAgICAgaWYgKCBpb21tdV9kZWJ1ZyApCj4gQEAgLTE2NjUs
MTAgKzE2NzEsMTMgQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChzdHJ1Y3QgZAo+
ICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiBWVERQUkVGSVgsICJkJWQ6dW5rbm93bigldSk6
ICUwNHg6JTAyeDolMDJ4LiV1XG4iLAo+ICAgICAgICAgICAgICAgICAgZG9tYWluLT5kb21haW5f
aWQsIHBkZXYtPnR5cGUsCj4gICAgICAgICAgICAgICAgICBzZWcsIGJ1cywgUENJX1NMT1QoZGV2
Zm4pLCBQQ0lfRlVOQyhkZXZmbikpOwo+IC0gICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gLSAgICAg
ICAgZ290byBvdXQ7Cj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICB9Cj4gIAo+ICsg
ICAgLyogZG9tX2lvIGlzIHVzZWQgYXMgYSBzZW50aW5lbCBmb3IgcXVhcmFudGluZWQgZGV2aWNl
cyAqLwo+ICsgICAgaWYgKCBkb21haW4gPT0gZG9tX2lvICYmICFkb21faW9tbXUoZG9tYWluKS0+
YXJjaC5wZ2RfbWFkZHIgKQo+ICsgICAgICAgIHJldHVybiByZXQ7Cj4gKwo+ICAgICAgLyoKPiAg
ICAgICAqIGlmIG5vIG90aGVyIGRldmljZXMgdW5kZXIgdGhlIHNhbWUgaW9tbXUgb3duZWQgYnkg
dGhpcyBkb21haW4sCj4gICAgICAgKiBjbGVhciBpb21tdSBpbiBpb21tdV9iaXRtYXAgYW5kIGNs
ZWFyIGRvbWFpbl9pZCBpbiBkb21pZF9iaXRtcAo+IEBAIC0xNjk0LDE2ICsxNzAzLDEyIEBAIHN0
YXRpYyBpbnQgZG9tYWluX2NvbnRleHRfdW5tYXAoc3RydWN0IGQKPiAgCj4gICAgICAgICAgaW9t
bXVfZG9taWQgPSBkb21haW5faW9tbXVfZG9taWQoZG9tYWluLCBpb21tdSk7Cj4gICAgICAgICAg
aWYgKCBpb21tdV9kb21pZCA9PSAtMSApCj4gLSAgICAgICAgewo+IC0gICAgICAgICAgICByZXQg
PSAtRUlOVkFMOwo+IC0gICAgICAgICAgICBnb3RvIG91dDsKPiAtICAgICAgICB9Cj4gKyAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAKPiAgICAgICAgICBjbGVhcl9iaXQoaW9tbXVfZG9t
aWQsIGlvbW11LT5kb21pZF9iaXRtYXApOwo+ICAgICAgICAgIGlvbW11LT5kb21pZF9tYXBbaW9t
bXVfZG9taWRdID0gMDsKPiAgICAgIH0KPiAgCj4gLW91dDoKPiAgICAgIHJldHVybiByZXQ7Cj4g
IH0KPiAgCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vaW9tbXUuaAo+IEBAIC01Myw4ICs1Myw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbF90IGRm
bl9lcShkZm5fdCB4LCBkZm4KPiAgfQo+ICAKPiAgZXh0ZXJuIGJvb2xfdCBpb21tdV9lbmFibGUs
IGlvbW11X2VuYWJsZWQ7Cj4gLWV4dGVybiBib29sIGZvcmNlX2lvbW11LCBpb21tdV9xdWFyYW50
aW5lLCBpb21tdV92ZXJib3NlLCBpb21tdV9pZ2Z4Owo+ICtleHRlcm4gYm9vbCBmb3JjZV9pb21t
dSwgaW9tbXVfdmVyYm9zZSwgaW9tbXVfaWdmeDsKPiAgZXh0ZXJuIGJvb2xfdCBpb21tdV9zbm9v
cCwgaW9tbXVfcWludmFsLCBpb21tdV9pbnRyZW1hcCwgaW9tbXVfaW50cG9zdDsKPiArZXh0ZXJu
IHVpbnQ4X3QgaW9tbXVfcXVhcmFudGluZTsKCkV4cG9ydGluZyB0aGlzIHZhcmlhYmxlIHdpdGhv
dXQgdGhlIHBhaXJlZCBkZWZpbmVzIHNlZW1zIHBvaW50bGVzcywKaG93IGFyZSBleHRlcm5hbCBj
YWxsZXJzIHN1cHBvc2VkIHRvIGZpZ3VyZSBvdXQgdGhlIHF1YXJhbnRpbmUgbW9kZQp3aXRob3V0
IHRoZSBJT01NVV9xdWFyYW50aW5lXyogZGVmaW5lcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
