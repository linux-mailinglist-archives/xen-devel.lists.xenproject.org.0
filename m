Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144C117021
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 16:16:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieKjM-0004ex-Tm; Mon, 09 Dec 2019 15:13:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieKjL-0004es-A2
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 15:13:47 +0000
X-Inumbo-ID: 7e8db43e-1a96-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e8db43e-1a96-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575904426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=h5zgliSru0idHO50SIIs4Q0IqVaNzvYxE3bmRce49zk=;
 b=ADWE0PAC15Fj9sBxH99ZbEKljmB/NNm28fUS82SPVtS1XCD4Y3sg/pLe
 ijpFklJFugR1fuKQ8TP5MA23gdtocBWJOYzE00LbR45E2zDmDWJWxHxSu
 AaJVJAsYIQCPl8DWUao4hOl1H6ysqQpgGQ84CUmNapKI19bv1ZDeDuuQx M=;
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
IronPort-SDR: QQ5BlvlKLebwgbeywEffOMBwx2KsmQhqmW7pDXTUDyhXxCwz5nlQ9Dx0Nt5napQu9jdXdECELm
 +1Oa5tLymCCgqqXta+0wTOBupDnV8E2i2MehBlMHSrPb+2viP0w2nThtx2MSJB5zJbqr4+A0y6
 l1PDuQqu+n4DlUsg5z+blkB5gARs+5KFiGCzpwBPO2ZrCj9wDCMkPhzxdP1jDvP74QHJNyE+Bd
 ypv+fmYehErebXklo6Yx4p2ZKiKDEIzGIj5qw2bqROot8Ju/8+8tGLEU7Xxk9gDdE045a/IJAy
 wwE=
X-SBRS: 2.7
X-MesageID: 9812590
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9812590"
Date: Mon, 9 Dec 2019 16:13:39 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191209151339.GZ980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
 <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
 <20191209142852.GW980@Air-de-Roger>
 <e026926b9aea4ffe868d41828c1f4721@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e026926b9aea4ffe868d41828c1f4721@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDI6NDE6NDBQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkg
MTQ6MjkKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgSnVlcmdlbgo+ID4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gPiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCAyLzRdIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8KPiA+IGNsb3NlZAo+
ID4gCj4gPiBPbiBNb24sIERlYyAwOSwgMjAxOSBhdCAxMjo0MDo0N1BNICswMDAwLCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4g
RnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gU2Vu
dDogMDkgRGVjZW1iZXIgMjAxOSAxMjoyNgo+ID4gPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY29tPgo+ID4gPiA+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7Cj4gPiBKdWVyZ2VuCj4gPiA+ID4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47Cj4gPiA+ID4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVz
OiBsaW1pdCB3aGVuIHN0YXRlIGlzCj4gPiBmb3JjZWQgdG8KPiA+ID4gPiBjbG9zZWQKPiA+ID4g
Pgo+ID4gPiA+IE9uIE1vbiwgRGVjIDA5LCAyMDE5IGF0IDEyOjAxOjM4UE0gKzAwMDAsIER1cnJh
bnQsIFBhdWwgd3JvdGU6Cj4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4g
PiA+ID4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
ID4gPiA+ID4gPiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjM5Cj4gPiA+ID4gPiA+IFRvOiBE
dXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gPiA+ID4gPiBDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOwo+
ID4gPiA+IEp1ZXJnZW4KPiA+ID4gPiA+ID4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZh
bm8gU3RhYmVsbGluaQo+ID4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Owo+ID4gPiA+ID4gPiBC
b3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gPiA+ID4gPiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVzOiBsaW1pdCB3aGVuIHN0
YXRlIGlzCj4gPiA+ID4gZm9yY2VkIHRvCj4gPiA+ID4gPiA+IGNsb3NlZAo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBPbiBUaHUsIERlYyAwNSwgMjAxOSBhdCAwMjowMToyMVBNICswMDAwLCBQYXVs
IER1cnJhbnQgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT25seSBmb3JjZSBzdGF0ZSB0byBjbG9zZWQg
aW4gdGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0YWNrIG1heQo+ID4gbmVlZAo+ID4gPiA+IHRvCj4g
PiA+ID4gPiA+ID4gY2xlYW4gdXAuIFRoaXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNoZWNraW5nIHdo
ZXRoZXIgdGhlIHN0YXRlIGluCj4gPiA+ID4geGVuc3RvcmUKPiA+ID4gPiA+ID4gPiBoYXMgYmVl
biBzZXQgdG8gY2xvc2luZyBwcmlvciB0byBkZXZpY2UgcmVtb3ZhbC4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gSSdtIG5vdCBzdXJlIEkgc2VlIHRoZSBwb2ludCBvZiB0aGlzLCBJIHdvdWxkIGV4
cGVjdCB0aGF0IGEKPiA+IGZhaWx1cmUgdG8KPiA+ID4gPiA+ID4gcHJvYmUgb3IgdGhlIHJlbW92
YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVuYnVzIHN0YXRlIGFzCj4gPiA+ID4g
PiA+IGNsb3NlZCwgd2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIHRoZSBhY3R1YWwgZHJpdmVyIHN0
YXRlLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBDYW4geW91IGV4cGxhaW4gd2hhdCdzIHRoZSBi
ZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ugd2l0aG91dCBhCj4gPiA+ID4gPiA+IGRyaXZlciBp
biBzdWNoIHVua25vd24gc3RhdGU/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSWYg
cHJvYmUgZmFpbHMgdGhlbiBJIHRoaW5rIGl0IHNob3VsZCBsZWF2ZSB0aGUgc3RhdGUgYWxvbmUu
IElmIHRoZQo+ID4gPiA+ID4gc3RhdGUgaXMgbW92ZWQgdG8gY2xvc2VkIHRoZW4gYmFzaWNhbGx5
IHlvdSBqdXN0IGtpbGxlZCB0aGF0Cj4gPiA+ID4gPiBjb25uZWN0aW9uIHRvIHRoZSBndWVzdCAo
YXMgdGhlIGZyb250ZW5kIHdpbGwgbm9ybWFsbHkgY2xvc2UgZG93bgo+ID4gPiA+ID4gd2hlbiBp
dCBzZWVzIHRoaXMgY2hhbmdlKSBzbywgaWYgdGhlIHByb2JlIGZhaWx1cmUgd2FzIGR1ZSB0byBh
IGJ1Zwo+ID4gPiA+ID4gaW4gYmxrYmFjayBvciwgZS5nLiwgYSB0cmFuc2llbnQgcmVzb3VyY2Ug
aXNzdWUgdGhlbiBpdCdzIGdhbWUgb3Zlcgo+ID4gPiA+ID4gYXMgZmFyIGFzIHRoYXQgZ3Vlc3Qg
Z29lcy4KPiA+ID4gPgo+ID4gPiA+IEJ1dCB0aGUgY29ubmVjdGlvbiBjYW4gYmUgcmVzdGFydGVk
IGJ5IHN3aXRjaGluZyB0aGUgYmFja2VuZCB0byB0aGUKPiA+ID4gPiBpbml0IHN0YXRlIGFnYWlu
Lgo+ID4gPgo+ID4gPiBUb28gbGF0ZS4gVGhlIGZyb250ZW5kIHNhdyBjbG9zZWQgYW5kIHlvdSBh
bHJlYWR5IGxvc3QuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+IFRoZSB1bHRpbWF0ZSBnb2FsIGhl
cmUgaXMgUFYgYmFja2VuZCByZS1sb2FkIHRoYXQgaXMgY29tcGxldGVseQo+ID4gPiA+IHRyYW5z
cGFyZW50IHRvIHRoZSBndWVzdC4gTW9kaWZ5aW5nIGFueXRoaW5nIGluIHhlbnN0b3JlIGNvbXBy
b21pc2VzCj4gPiB0aGF0Cj4gPiA+ID4gc28gd2UgbmVlZCB0byBiZSBjYXJlZnVsLgo+ID4gPiA+
Cj4gPiA+ID4gVGhhdCdzIGEgZmluZSBnb2FsLCBidXQgbm90IHN3aXRjaGluZyB0byBjbG9zZWQg
c3RhdGUgaW4KPiA+ID4gPiB4ZW5idXNfZGV2X3JlbW92ZSBzZWVtcyB3cm9uZywgYXMgeW91IGhh
dmUgYWN0dWFsbHkgbGVmdCB0aGUgZnJvbnRlbmQKPiA+ID4gPiB3aXRob3V0IGEgbWF0Y2hpbmcg
YmFja2VuZCBhbmQgd2l0aCB0aGUgc3RhdGUgbm90IHNldCB0byBjbG9zZWQuCj4gPiA+ID4KPiA+
ID4KPiA+ID4gV2h5IGlzIHRoaXMgYSBwcm9ibGVtPyBXaXRoIHRoaXMgc2VyaWVzIGZ1bGx5IGFw
cGxpZWQgYSAoYmxvY2spIGJhY2tlbmQKPiA+IGNhbiBjb21lIGFuZCBnbyB3aXRob3V0IG5lZWRp
bmcgdG8gY2hhbmdlIHRoZSBzdGF0ZS4gUmVseWluZyBvbiBndWVzdHMgdG8KPiA+IERUUlQgaXMg
bm90IGEgc3VzdGFpbmFibGUgb3B0aW9uIGZvciBhIGNsb3VkIGRlcGxveW1lbnQuCj4gPiA+Cj4g
PiA+ID4gSWU6IHRoYXQgd291bGQgYmUgZmluZSBpZiB5b3UgZXhwbGljaXRseSBzdGF0ZSB0aGlz
IGlzIHNvbWUga2luZCBvZgo+ID4gPiA+IGludGVybmFsIGJsa2JhY2sgcmVsb2FkLCBidXQgbm90
IGZvciB0aGUgZ2VuZXJhbCBjYXNlIHdoZXJlIGJsa2JhY2sKPiA+ID4gPiBoYXMgYmVlbiB1bmJv
dW5kLiBJIHRoaW5rIHdlIG5lZWQgc29tZXdheSB0byBkaWZmZXJlbmNlIGEgYmxrYmFjawo+ID4g
PiA+IHJlbG9hZCB2cyBhIHVuYm91bmQuCj4gPiA+ID4KPiA+ID4KPiA+ID4gV2h5IGRvIHdlIG5l
ZWQgdGhhdCB0aG91Z2g/IFdoeSBpcyBpdCBhZHZhbnRhZ2VvdXMgZm9yIGEgYmFja2VuZCB0byBn
bwo+ID4gdG8gY2xvc2VkLiBObyBQViBiYWNrZW5kcyBjb3BlIHdpdGggYW4gdW5iaW5kIGFzLWlz
LCBhbmQgYSB0b29sc3RhY2sKPiA+IGluaXRpYXRlZCB1bnBsdWcgd2lsbCBhbHdheXMgc2V0IHN0
YXRlIHRvIDUgYW55d2F5LiBTbyBUQkggYW55IHN0YXRlCj4gPiB0cmFuc2l0aW9uIGRvbmUgZGly
ZWN0bHkgaW4gdGhlIHhlbmJ1cyBjb2RlIGxvb2tzIHdyb25nIHRvIG1lIGFueXdheSAoYnV0Cj4g
PiBhcHBlYXJzIHRvIGJlIGEgbmVjZXNzYXJ5IGV2aWwgdG8ga2VlcCB0aGUgdG9vbHN0YWNrIHdv
cmtpbmcgaW4gdGhlIGV2ZW50Cj4gPiBpdCBzcGF3bnMgYSBiYWNrZW5kIHdoZXJlIHRoZXJlIGlz
IGFjdHVhbGx5IHRvIGRyaXZlciBwcmVzZW50LCBvciBpdAo+ID4gZG9lc24ndCBjb21lIG9ubGlu
ZSkuCj4gPiAKPiA+IElNTyB0aGUgbm9ybWFsIGZsb3cgZm9yIHVuYmluZCB3b3VsZCBiZSB0byBh
dHRlbXB0IHRvIGNsb3NlIG9wZW4KPiA+IGNvbm5lY3Rpb25zIGFuZCB0aGVuIHJlbW92ZSB0aGUg
ZHJpdmVyOiBsZWF2aW5nIGZyb250ZW5kcyBjb25uZWN0ZWQKPiA+IHdpdGhvdXQgYW55IGF0dGFj
aGVkIGJhY2tlbmRzIGlzIG5vdCBjb3JyZWN0LCBhbmQgd2lsbCBqdXN0IGJsb2NrIHRoZQo+ID4g
Z3Vlc3QgZnJvbnRlbmQgdW50aWwgcmVxdWVzdHMgc3RhcnQgdGltaW5nIG91dC4KPiA+IAo+ID4g
SSBjYW4gc2VlIHRoZSByZWFzb25pbmcgZm9yIGRvaW5nIHRoYXQgZm9yIHRoZSBwdXJwb3NlIG9m
IHVwZGF0aW5nIGEKPiA+IGJsa2JhY2sgbW9kdWxlIHdpdGhvdXQgZ3Vlc3RzIG5vdGljaW5nLCBi
dXQgSSB3b3VsZCBwcmVmZXIgdGhhdAo+ID4gbGVhdmluZyBjb25uZWN0aW9ucyBvcGVuIHdhcyBh
biBvcHRpb24gdGhhdCBjb3VsZCBiZSBnaXZlbiB3aGVuCj4gPiB1bmJpbmRpbmcgKG9yIG1heWJl
IGEgZHJpdmVyIG9wdGlvbiBpbiBzeXNmcz8pLCBzbyB0aGF0IHRoZSBkZWZhdWx0Cj4gPiBiZWhh
dmlvdXIgd291bGQgYmUgdG8gdHJ5IHRvIGNsb3NlIGV2ZXJ5dGhpbmcgd2hlbiB1bmJpbmRpbmcg
aWYKPiA+IHBvc3NpYmxlLgo+IAo+IFdlbGwgdW5iaW5kIGlzIHByZXR0eSB1c2VsZXNzIG5vdyBJ
TU8gc2luY2UgYmluZCBkb2Vzbid0IHdvcmssIGFuZCBhIHRyYW5zaXRpb24gc3RyYWlnaHQgdG8g
Y2xvc2VkIGlzIGp1c3QgcGxhaW4gd3JvbmcgYW55d2F5LgoKV2h5IGRvIHlvdSBjbGFpbSB0aGF0
IGEgc3RyYWlnaHQgdHJhbnNpdGlvbiBpbnRvIHRoZSBjbG9zZWQgc3RhdGUgaXMKd3Jvbmc/CgpJ
IGRvbid0IHNlZSBhbnkgc3VjaCBtZW50aW9uIGluIGJsa2lmLmgsIHdoaWNoIGFsc28gZG9lc24n
dCBjb250YWluCmFueSBndWlkZWxpbmVzIHJlZ2FyZGluZyBjbG9zaW5nIHN0YXRlIHRyYW5zaXRp
b25zLCBzbyB1bmxlc3MKb3RoZXJ3aXNlIHN0YXRlZCBzb21ld2hlcmUgZWxzZSB0cmFuc2l0aW9u
cyBpbnRvIGNsb3NlZCBjYW4gaGFwcGVuCmZyb20gYW55IHN0YXRlIElNTy4KCj4gQnV0LCB3ZSBj
b3VsZCBoYXZlIGEgZmxhZyB0aGF0IHRoZSBiYWNrZW5kIGRyaXZlciBzZXRzIHRvIHNheSB0aGF0
IGl0IHN1cHBvcnRzIHRyYW5zcGFyZW50IHJlLWJpbmQgdGhhdCBnYXRlcyB0aGlzIGNvZGUuIFdv
dWxkIHRoYXQgbWFrZSB5b3UgZmVlbCBtb3JlIGNvbWZvcnRhYmxlPwoKSGF2aW5nIGFuIG9wdGlv
biB0byBsZWF2ZSBzdGF0ZSB1bnRvdWNoZWQgd2hlbiB1bmJpbmRpbmcgd291bGQgYmUgZmluZQpm
b3IgbWUsIG90aGVyd2lzZSBzdGF0ZSBzaG91bGQgYmUgc2V0IHRvIGNsb3NlZCB3aGVuIHVuYmlu
ZGluZy4gSQpkb24ndCB0aGluayB0aGVyZSdzIGFueXRoaW5nIGVsc2UgdGhhdCBuZWVkcyB0byBi
ZSBkb25lIGluIHRoaXMKcmVnYXJkLCB0aGUgY2xlYW51cCBzaG91bGQgYmUgZXhhY3RseSB0aGUg
c2FtZSB0aGUgb25seSBkaWZmZXJlbmNlCmJlaW5nIHRoZSBzZXR0aW5nIG9mIGFsbCB0aGUgYWN0
aXZlIGJhY2tlbmRzIHRvIGNsb3NlZCBzdGF0ZS4KCj4gSWYgeW91IHdhbnQgdW5iaW5kIHRvIGFj
dHVhbGx5IGRvIGEgcHJvcGVyIHVucGx1ZyB0aGVuIHRoYXQncyBleHRyYSB3b3JrIGFuZCBub3Qg
cmVhbGx5IHNvbWV0aGluZyBJIHdhbnQgdG8gdGFja2xlIChhbmQgcmUtYmluZCB3b3VsZCBzdGls
bCBuZWVkIHRvIGJlIHRvb2xzdGFjayBpbml0aWF0ZWQgYXMgc29tZXRoaW5nIHdvdWxkIGhhdmUg
dG8gcmUtY3JlYXRlIHRoZSB4ZW5zdG9yZSBhcmVhKS4KCldoeSBkbyB5b3Ugc2F5IHRoZSB4ZW5z
dG9yZSBhcmVhIHdvdWxkIG5lZWQgdG8gYmUgcmVjcmVhdGVkPwoKU2V0dGluZyBzdGF0ZSB0byBj
bG9zZWQgc2hvdWxkbid0IGNhdXNlIGFueSBjbGVhbnVwIG9mIHRoZSB4ZW5zdG9yZQphcmVhLCBh
cyB0aGF0IHNob3VsZCBhbHJlYWR5IGhhcHBlbiBmb3IgZXhhbXBsZSB3aGVuIHVzaW5nIHB2Z3J1
YgpzaW5jZSBpbiB0aGF0IGNhc2UgZ3J1YiBpdHNlbGYgZGlzY29ubmVjdHMgYW5kIGFscmVhZHkg
Y2F1c2VzIGEKdHJhbnNpdGlvbiB0byBjbG9zZWQgYW5kIGEgcmUtYXR0YWNobWVudCBhZnRlcndh
cmRzIGJ5IHRoZSBndWVzdAprZXJuZWwuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
