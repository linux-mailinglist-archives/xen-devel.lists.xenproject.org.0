Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3133D2B19
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 15:19:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIYFV-0002nM-G1; Thu, 10 Oct 2019 13:12:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIYFU-0002jv-3Y
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 13:12:56 +0000
X-Inumbo-ID: ab31629e-eb5f-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab31629e-eb5f-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570713174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZlIXedQHozoFQJlhlJf9Y+kqp9Z8Dan+LmCU5MKVqlA=;
 b=QVAlBKqxICrFQaSG+shMTPyKVfgxO40migFKknwqEF1wcFtj4pncHQ2W
 SN/LVdCgdDVV9CbxU1Na4U+lLg0LttMsnwyPwaZhpU25YmQukV/3e3gSu
 yJPrP+0602duivxsRW0CQHvHHbxsZh4DC9MYhH0iJfzyLFRYKsPcUpPQ+ w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r/Mpcnw4ukBT1a3Xe0FfKRKLnT+OztoJtlAO2vWWqbSzkTcrE5hILJH1qMT7faq6Z0th15kO7v
 1BQYhCdigtjGFHpFTJOraXrYCi6jvxGlKBAIegvX5kjwJBs3bCk6fCXtPNaCf2rbVeGyTkreoy
 QWug6shJYt/uVXYSU01vDQgfIownrbWHR6tthkzjxsFCW+b7Sn3DpYxHHWoOMMYG5E1fjEPto6
 EecJHSsOlr9Esz5JzDBLdJiEze9kat3eIDw0qjTxjXg3MP5upKutOEMYQLgNyMKdnbASmDKxC0
 JXQ=
X-SBRS: 2.7
X-MesageID: 7023707
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="7023707"
Date: Thu, 10 Oct 2019 15:12:45 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191010131245.GG1389@Air-de-Roger.citrite.net>
References: <20191010113345.6867-1-roger.pau@citrix.com>
 <20191010113345.6867-2-roger.pau@citrix.com>
 <b1e9fac5-a476-638c-e550-c179146ecf7f@suse.com>
 <20191010121302.GF1389@Air-de-Roger.citrite.net>
 <39f2d60b-e371-1646-dc79-cf1355a81afa@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39f2d60b-e371-1646-dc79-cf1355a81afa@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] x2APIC: translate IO-APIC entries
 when enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDI6NTU6MDJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMTAuMjAxOSAxNDoxMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMTo1NDowNlBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxMC4xMC4yMDE5IDEzOjMzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IFdoZW4gaW50ZXJydXB0IHJlbWFwcGluZyBpcyBlbmFibGVkIGFzIHBhcnQgb2YgZW5hYmxpbmcg
eDJBUElDIHRoZQo+ID4+Cj4gPj4gUGVyaGFwcyAidW5tYXNrZWQiIGluc3RlYWQgb2YgInRoZSI/
Cj4gPj4KPiA+Pj4gSU8tQVBJQyBlbnRyaWVzIGFsc28gbmVlZCB0byBiZSB0cmFuc2xhdGVkIHRv
IHRoZSBuZXcgZm9ybWF0IGFuZCBhZGRlZAo+ID4+PiB0byB0aGUgaW50ZXJydXB0IHJlbWFwcGlu
ZyB0YWJsZS4KPiA+Pj4KPiA+Pj4gVGhpcyBwcmV2ZW50cyBJT01NVSBpbnRlcnJ1cHQgcmVtYXBw
aW5nIGZhdWx0cyB3aGVuIGJvb3Rpbmcgb24KPiA+Pj4gaGFyZHdhcmUgdGhhdCBoYXMgdW5tYXNr
ZWQgSU8tQVBJQyBwaW5zLgo+ID4+Cj4gPj4gQnV0IGluIHRoZSBlbmQgaXQgb25seSBwYXBlcnMg
b3ZlciB3aGF0ZXZlciB0aGUgc3B1cmlvdXMgaW50ZXJydXB0cwo+ID4+IHJlc3VsdCBmb3JtLCBk
b2Vzbid0IGl0PyBXaGljaCBpc24ndCB0byBzYXkgdGhpcyBpc24ndCBhbgo+ID4+IGltcHJvdmVt
ZW50LiBDYWxsaW5nIG91dCB0aGUgRXh0SW50IGNhc2UgaGVyZSBtYXkgYmUgd29ydGh3aGlsZSBh
cwo+ID4+IHdlbGwsIGFzIHdvdWxkIGJlIHBvaW50aW5nIG91dCB0aGF0IHRoaXMgY2FzZSBzdGls
bCB3b24ndCB3b3JrIG9uCj4gPj4gQU1EIElPTU1Vcy4KPiA+IAo+ID4gQnV0IHRoZSBmaXggZm9y
IHRoZSBFeHRJTlQgQU1EIGlzc3VlIHNob3VsZCBiZSBkb25lIGluCj4gPiBhbWRfaW9tbXVfaW9h
cGljX3VwZGF0ZV9pcmUgdGhlbiwgc28gdGhhdCBpdCBjYW4gcHJvcGVybHkgaGFuZGxlCj4gPiBF
eHRJTlQgZGVsaXZlcnkgbW9kZSwgbm90IHRvIHRoaXMgcGFydCBvZiB0aGUgY29kZS4gSSB3aWxs
IGxvb2sKPiA+IGludG8gaXQsIGJ1dCBJIHRoaW5rIGl0J3Mga2luZCBvZiB0YW5nZW50aWFsIHRv
IHRoZSBpc3N1ZSBoZXJlLgo+IAo+IEknbSBub3QgdGFsa2luZyBvZiB5b3Ugd29ya2luZyBvbiBm
aXhpbmcgdGhpcyByaWdodCBhd2F5LiBJJ20gbWVyZWx5Cj4gYXNraW5nIHRoYXQgeW91IG1lbnRp
b24gaGVyZSAoYSkgdGhlIEV4dEludCBzcGVjaWFsIGNhc2UgYW5kIChiKQo+IHRoYXQgdGhpcyBz
cGVjaWFsIGNhc2Ugd2lsbCAoY29udGludWUgdG8pIG5vdCB3b3JrIGluIHRoZSBBTUQgY2FzZS4K
PiAKPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYwo+ID4+PiArKysgYi94ZW4vYXJjaC94
ODYvYXBpYy5jCj4gPj4+IEBAIC01MTUsNyArNTE1LDcgQEAgc3RhdGljIHZvaWQgcmVzdW1lX3gy
YXBpYyh2b2lkKQo+ID4+PiAgICAgIGlvbW11X2VuYWJsZV94MmFwaWMoKTsKPiA+Pj4gICAgICBf
X2VuYWJsZV94MmFwaWMoKTsKPiA+Pj4gIAo+ID4+PiAtICAgIHJlc3RvcmVfSU9fQVBJQ19zZXR1
cChpb2FwaWNfZW50cmllcyk7Cj4gPj4+ICsgICAgcmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBp
Y19lbnRyaWVzLCB0cnVlKTsKPiA+Pj4gICAgICB1bm1hc2tfODI1OUEoKTsKPiA+Pj4gIAo+ID4+
PiAgb3V0Ogo+ID4+PiBAQCAtOTYxLDcgKzk2MSwxMiBAQCB2b2lkIF9faW5pdCB4MmFwaWNfYnNw
X3NldHVwKHZvaWQpCj4gPj4+ICAgICAgICAgIHByaW50aygiU3dpdGNoZWQgdG8gQVBJQyBkcml2
ZXIgJXNcbiIsIGdlbmFwaWMubmFtZSk7Cj4gPj4+ICAKPiA+Pj4gIHJlc3RvcmVfb3V0Ogo+ID4+
PiAtICAgIHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNfZW50cmllcyk7Cj4gPj4+ICsgICAg
LyoKPiA+Pj4gKyAgICAgKiBOQjogZG8gbm90IHVzZSByYXcgbW9kZSB3aGVuIHJlc3RvcmluZyBl
bnRyaWVzIGlmIHRoZSBpb21tdSBoYXMgYmVlbgo+ID4+PiArICAgICAqIGVuYWJsZWQgZHVyaW5n
IHRoZSBwcm9jZXNzLCBiZWNhdXNlIHRoZSBlbnRyaWVzIG5lZWQgdG8gYmUgdHJhbnNsYXRlZAo+
ID4+PiArICAgICAqIGFuZCBhZGRlZCB0byB0aGUgcmVtYXBwaW5nIHRhYmxlIGluIHRoYXQgY2Fz
ZS4KPiA+Pj4gKyAgICAgKi8KPiA+Pj4gKyAgICByZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGlj
X2VudHJpZXMsICF4MmFwaWNfZW5hYmxlZCk7Cj4gPj4KPiA+PiBIb3cgaXMgdGhpcyBkaWZmZXJl
bnQgaW4gdGhlIHJlc3VtZV94MmFwaWMoKSBjYXNlPyBUaGUgSU9NTVUgZ2V0cwo+ID4+IGVuYWJs
ZWQgaW4gdGhlIGNvdXJzZSBvZiB0aGF0IGFzIHdlbGwuIEkuZS4gSSdkIGV4cGVjdCB5b3Ugd2Fu
dAo+ID4+IHRvIHBhc3MgImZhbHNlIiB0aGVyZSwgbm90ICJ0cnVlIi4KPiA+IAo+ID4gSW4gdGhl
IHJlc3VtZV94MmFwaWMgY2FzZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHNob3VsZCBhbHJlYWR5IGJl
Cj4gPiBlbmFibGVkIG9yIG5vdCwgYnV0IHRoYXQgZnVuY3Rpb24gaXMgbm90IGdvaW5nIHRvIGVu
YWJsZSBpbnRlcnJ1cHQKPiA+IHJlbWFwcGluZyBpZiBpdCB3YXNuJ3QgZW5hYmxlZCBiZWZvcmUs
IGhlbmNlIHRoZSBJTy1BUElDIGVudHJpZXMKPiA+IHNob3VsZCBhbHJlYWR5IGJlIHVzaW5nIHRo
ZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlIGFuZCBubwo+ID4gdHJhbnNsYXRpb24gaXMgbmVl
ZGVkLgo+IAo+IFdobyAvIHdoYXQgd291bGQgaGF2ZSBlbmFibGVkIHRoZSBJT01NVSBpbiB0aGUg
cmVzdW1lIGNhc2U/CgpJIGRvbid0IHRoaW5rIHRoZSBxdWVzdGlvbiBpcyB3aG8gZW5hYmxlcyBp
bnRlcnJ1cHQgcmVtYXBwaW5nIGluIHRoZQpyZXN1bWUgY2FzZSAod2hpY2ggaXMgcmVzdW1lX3gy
YXBpYyB3aGVuIGNhbGxpbmcgaW9tbXVfZW5hYmxlX3gyYXBpYwpBRkFJQ1QpLCB0aGUgcG9pbnQg
aGVyZSBpcyB0aGF0IG9uIHJlc3VtZSB0aGUgZW50cmllcyBpbiB0aGUgSU8tQVBJQwp3aWxsIGFs
cmVhZHkgbWF0Y2ggdGhlIHN0YXRlIG9mIGludGVycnVwdCByZW1hcHBpbmcsIHNvIHRoZXkgc2hv
dWxkbid0CmJlIHRyYW5zbGF0ZWQuIElmIGludGVycnVwdCByZW1hcHBpbmcgd2FzIG9mZiBiZWZv
cmUgc3VzcGVuZCBpdCB3aWxsCnN0aWxsIGJlIG9mZiBhZnRlciByZXN1bWUsIGFuZCB0aGVyZSB3
b24ndCBiZSBhbnkgdHJhbnNsYXRpb24gbmVlZGVkLgpUaGUgc2FtZSBpcyB0cnVlIGlmIGludGVy
cnVwdCByZW1hcHBpbmcgaXMgb24gYmVmb3JlIHN1c3BlbmQuCgo+ID4+IEFsc28gaG93IHdvdWxk
ICJ4MmFwaWNfZW5hYmxlZCIgcmVmbGVjdCB0aGUgdHJhbnNpdGlvbj8gSXQgbWF5Cj4gPj4gaGF2
ZSBiZWVuICJ0cnVlIiBhbHJlYWR5IGJlZm9yZSBlbnRlcmluZyB0aGUgZnVuY3Rpb24gaGVyZS4K
PiA+IAo+ID4gSWYgeDJhcGljX2VuYWJsZWQgPT0gdHJ1ZSBhdCB0aGUgcG9pbnQgd2hlcmUgcmVz
dG9yZV9JT19BUElDX3NldHVwCj4gPiBpcyBjYWxsZWQgaW50ZXJydXB0IHJlbWFwcGluZyBtdXN0
IGJlIGVuYWJsZWQsIGJlY2F1c2UgQUZBSUNUIGF0IHRoaXMKPiA+IHBvaW50IGl0J3Mgbm90IHBv
c3NpYmxlIHRvIGhhdmUgeDJhcGljX2VuYWJsZWQgPT0gdHJ1ZSBhbmQgaW50ZXJydXB0Cj4gPiBy
ZW1hcHBpbmcgZGlzYWJsZWQuCj4gPiAKPiA+IFRoZSBpc3N1ZSBJIGNhbiBzZWUgaGVyZSBpcyB3
aGF0IGhhcHBlbnMgaWYgaW50ZXJydXB0IHJlbWFwcGluZyB3YXMKPiA+IGFscmVhZHkgZW5hYmxl
ZCBieSB0aGUgaGFyZHdhcmUsIGFuZCBlbnRyaWVzIGluIHRoZSBJTy1BUElDIGFyZQo+ID4gYWxy
ZWFkeSB1c2luZyB0aGUgcmVtYXBwaW5nIHRhYmxlLiBJIHdvdWxkIGhhdmUgdG8gbG9vayBpbnRv
IGhvdyB0bwo+ID4gZGV0ZWN0IHRoYXQgY2FzZSBwcm9wZXJseSwgYnV0IEkgdGhpbmsgdGhlIHBy
b3Bvc2VkIGNoYW5nZSBpcyBhbgo+ID4gaW1wcm92ZW1lbnQgb3ZlcmFsbC4KPiAKPiBGaXJtd2Fy
ZSBoYW5kaW5nIG9mZiB3aXRoIHRoZSBJT01NVSAoYW5kIGhlbmNlIGludGVycnVwdCByZW1hcHBp
bmcpCj4gYWxyZWFkeSBlbmFibGVkIGlzIGEgY2FzZSB3aGljaCAtIGFmYWljdCAtIHdlIGNhbid0
IGN1cnJlbnRseSBjb3BlCj4gd2l0aC4gRmlybXdhcmUgaGFuZGluZyBvZmYgaW4geDJBUElDIGVu
YWJsZWQgc3RhdGUgaXMgdHlwaWNhbGx5Cj4gd2l0aCB0aGUgSU9NTVUgKGFuZCBoZW5jZSBpbnRl
cnJ1cHQgcmVtYXBwaW5nKSBzdGlsbCBkaXNhYmxlZC4gVGhpcwo+IGlzIG5vdCBhIGZvcmJpZGRl
biBtb2RlLCBpdCdzIGp1c3QgdGhhdCBpbiBzdWNoIGEgY29uZmlndXJhdGlvbgo+IGludGVycnVw
dHMgY2FuJ3QgYmUgZGVsaXZlcmVkIHRvIGNlcnRhaW4gQ1BVcy4KPiAKPiBJbiBhbnkgZXZlbnQg
eW91IG5lZWQgdG8gcHJvcGVybHkgZGlzdGluZ3Vpc2ggeDJBUElDIGVuYWJsZWQgc3RhdGUKPiAo
b3IgdGhlIHRyYW5zaXRpb24gdGhlcmVvZikgZnJvbSBJT01NVSAvIGludGVycnVwdCByZW1hcHBp
bmcKPiBlbmFibGVkIHN0YXRlIChvciB0aGUgdHJhbnNpdGlvbiB0aGVyZW9mKS4gSS5lLiB5b3Ug
d2FudCB0byBhdm9pZAo+IHJhdyBtb2RlIHJlc3RvcmUgaWYgaW50ZXJydXB0IHJlbWFwcGluZyBz
dGF0ZSB0cmFuc2l0aW9uZWQgZnJvbQo+IG9mZiB0byBvbiBpbiB0aGUgcHJvY2Vzcy4KClJpZ2h0
LCBhbmQgdGhhdCdzIHdoeSB0aGUgY2FsbCB0byByZXN0b3JlX0lPX0FQSUNfc2V0dXAgaW4KeDJh
cGljX2JzcF9zZXR1cCB1c2VzICF4MmFwaWNfZW5hYmxlZCBhcyBpdCdzIHNlY29uZCBwYXJhbWV0
ZXIuIElmCmludGVycnVwdCByZW1hcHBpbmcgaGFzIGJlZW4gZW5hYmxlZCBieSB0aGUgY2FsbCB0
bwppb21tdV9lbmFibGVfeDJhcGljIHgyYXBpY19lbmFibGVkIG11c3QgYmUgdHJ1ZSwgYW5kIGhl
bmNlIHRoZSBlbnRyaWVzCmluIHRoZSBJTy1BUElDIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB1
c2UgdGhlIGludGVycnVwdCByZW1hcHBpbmcKdGFibGUuIFRoZXJlJ3Mgbm8gcGF0aCB0aGF0IGNh
biBsZWFkIHRvIHJlc3RvcmVfSU9fQVBJQ19zZXR1cCB3aXRoCmludGVycnVwdCByZW1hcHBpbmcg
ZW5hYmxlZCBhbmQgeDJBUElDIG1vZGUgZGlzYWJsZWQgKG9yIHdpdGggeDJBUElDCmVuYWJsZWQg
YW5kIGludGVycnVwdCByZW1hcHBpbmcgZGlzYWJsZWQpLgoKSGVuY2UgaWYgaW50ZXJydXB0IHJl
bWFwcGluZyBpcyBvZmYgYmVmb3JlIGNhbGxpbmcgeDJhcGljX2JzcF9zZXR1cAood2hpY2ggaXMg
d2hhdCBYZW4gZXhwZWN0cyB0byBmdW5jdGlvbiBwcm9wZXJseSkgYW5kIHgyYXBpY19lbmFibGVk
ID09CnRydWUgd2hlbiBjYWxsaW5nIHJlc3RvcmVfSU9fQVBJQ19zZXR1cCBpdCBtZWFucyBpbnRl
cnJ1cHQgcmVtYXBwaW5nCmdvdCBlbmFibGVkLCBhbmQgdGhlIElPLUFQSUMgZW50cmllcyBuZWVk
IHRyYW5zbGF0aW9uLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
