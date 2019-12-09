Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45C116EF4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieK22-0008O2-Mb; Mon, 09 Dec 2019 14:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieK21-0008Nx-DF
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:29:01 +0000
X-Inumbo-ID: 3d25f020-1a90-11ea-87e3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d25f020-1a90-11ea-87e3-12813bfff9fa;
 Mon, 09 Dec 2019 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575901740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X1P5ZS66O+SyV3Z0pG3ySBc5zDyuUajrOIBHrzr8Pms=;
 b=fl04eYPVKWuhVMu7CvBASyVQajek0n5BKT24upMvzoTpJY2h6MJluS73
 2/KjOk+/g+2kaUV02sjQWthCOy3pOUnCxkBAsys0c8+O+pZrflmjpjmh3
 WMkm+JG6nF7bbb1qUetNNkPPkL1AUwrlNhLK9Bx4VCRmf3mTE71V7SFXp c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a1ru/4XWSvrJrh5euaNnkOw8Vn3o3G46oijEi/FPyzJJ5TLvObjfsKXIaMgNz5CM0IqGTp3qc5
 NKJSNxeQQkbuDEB0EqCCu+3gryAHE1mLeXG3H7Dmucqllf79phmdJt0RvpKjbrz1TcKdPaV+Qa
 a/DvXG50rPXGHbnFS0pDCNSVnVX/hoAYQmmbAvyKX9TVwCttsWCQlnqmmrnFPoBKrSC0nQ50zH
 2CANj0bjodv3B6IMfPEnJIN8sKz9KkOB1CxplML9TB/kUiwIowKQRH/nwzVmjkWuM+spastILk
 S4g=
X-SBRS: 2.7
X-MesageID: 9395324
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9395324"
Date: Mon, 9 Dec 2019 15:28:52 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191209142852.GW980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <19b5c2fa36b842e58bbdddd602c4e672@EX13D32EUC003.ant.amazon.com>
 <20191209122537.GV980@Air-de-Roger>
 <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54e3cd3a42d8418d9a36388315deab13@EX13D32EUC003.ant.amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMTI6NDA6NDdQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkg
MTI6MjYKPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPgo+ID4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgSnVlcmdlbgo+ID4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47Cj4gPiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlz
Lm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCAyLzRdIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8KPiA+IGNsb3NlZAo+
ID4gCj4gPiBPbiBNb24sIERlYyAwOSwgMjAxOSBhdCAxMjowMTozOFBNICswMDAwLCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4g
RnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gU2Vu
dDogMDkgRGVjZW1iZXIgMjAxOSAxMTozOQo+ID4gPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY29tPgo+ID4gPiA+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7Cj4gPiBKdWVyZ2VuCj4gPiA+ID4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47Cj4gPiA+ID4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0geGVuYnVz
OiBsaW1pdCB3aGVuIHN0YXRlIGlzCj4gPiBmb3JjZWQgdG8KPiA+ID4gPiBjbG9zZWQKPiA+ID4g
Pgo+ID4gPiA+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDAyOjAxOjIxUE0gKzAwMDAsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+ID4gPiA+IE9ubHkgZm9yY2Ugc3RhdGUgdG8gY2xvc2VkIGluIHRo
ZSBjYXNlIHdoZW4gdGhlIHRvb2xzdGFjayBtYXkgbmVlZAo+ID4gdG8KPiA+ID4gPiA+IGNsZWFu
IHVwLiBUaGlzIGNhbiBiZSBkZXRlY3RlZCBieSBjaGVja2luZyB3aGV0aGVyIHRoZSBzdGF0ZSBp
bgo+ID4geGVuc3RvcmUKPiA+ID4gPiA+IGhhcyBiZWVuIHNldCB0byBjbG9zaW5nIHByaW9yIHRv
IGRldmljZSByZW1vdmFsLgo+ID4gPiA+Cj4gPiA+ID4gSSdtIG5vdCBzdXJlIEkgc2VlIHRoZSBw
b2ludCBvZiB0aGlzLCBJIHdvdWxkIGV4cGVjdCB0aGF0IGEgZmFpbHVyZSB0bwo+ID4gPiA+IHBy
b2JlIG9yIHRoZSByZW1vdmFsIG9mIHRoZSBkZXZpY2Ugd291bGQgbGVhdmUgdGhlIHhlbmJ1cyBz
dGF0ZSBhcwo+ID4gPiA+IGNsb3NlZCwgd2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIHRoZSBhY3R1
YWwgZHJpdmVyIHN0YXRlLgo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHlvdSBleHBsYWluIHdoYXQncyB0
aGUgYmVuZWZpdCBvZiBsZWF2aW5nIGEgZGV2aWNlIHdpdGhvdXQgYQo+ID4gPiA+IGRyaXZlciBp
biBzdWNoIHVua25vd24gc3RhdGU/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gSWYgcHJvYmUgZmFpbHMg
dGhlbiBJIHRoaW5rIGl0IHNob3VsZCBsZWF2ZSB0aGUgc3RhdGUgYWxvbmUuIElmIHRoZQo+ID4g
PiBzdGF0ZSBpcyBtb3ZlZCB0byBjbG9zZWQgdGhlbiBiYXNpY2FsbHkgeW91IGp1c3Qga2lsbGVk
IHRoYXQKPiA+ID4gY29ubmVjdGlvbiB0byB0aGUgZ3Vlc3QgKGFzIHRoZSBmcm9udGVuZCB3aWxs
IG5vcm1hbGx5IGNsb3NlIGRvd24KPiA+ID4gd2hlbiBpdCBzZWVzIHRoaXMgY2hhbmdlKSBzbywg
aWYgdGhlIHByb2JlIGZhaWx1cmUgd2FzIGR1ZSB0byBhIGJ1Zwo+ID4gPiBpbiBibGtiYWNrIG9y
LCBlLmcuLCBhIHRyYW5zaWVudCByZXNvdXJjZSBpc3N1ZSB0aGVuIGl0J3MgZ2FtZSBvdmVyCj4g
PiA+IGFzIGZhciBhcyB0aGF0IGd1ZXN0IGdvZXMuCj4gPiAKPiA+IEJ1dCB0aGUgY29ubmVjdGlv
biBjYW4gYmUgcmVzdGFydGVkIGJ5IHN3aXRjaGluZyB0aGUgYmFja2VuZCB0byB0aGUKPiA+IGlu
aXQgc3RhdGUgYWdhaW4uCj4gCj4gVG9vIGxhdGUuIFRoZSBmcm9udGVuZCBzYXcgY2xvc2VkIGFu
ZCB5b3UgYWxyZWFkeSBsb3N0Lgo+IAo+ID4gCj4gPiA+IFRoZSB1bHRpbWF0ZSBnb2FsIGhlcmUg
aXMgUFYgYmFja2VuZCByZS1sb2FkIHRoYXQgaXMgY29tcGxldGVseQo+ID4gdHJhbnNwYXJlbnQg
dG8gdGhlIGd1ZXN0LiBNb2RpZnlpbmcgYW55dGhpbmcgaW4geGVuc3RvcmUgY29tcHJvbWlzZXMg
dGhhdAo+ID4gc28gd2UgbmVlZCB0byBiZSBjYXJlZnVsLgo+ID4gCj4gPiBUaGF0J3MgYSBmaW5l
IGdvYWwsIGJ1dCBub3Qgc3dpdGNoaW5nIHRvIGNsb3NlZCBzdGF0ZSBpbgo+ID4geGVuYnVzX2Rl
dl9yZW1vdmUgc2VlbXMgd3JvbmcsIGFzIHlvdSBoYXZlIGFjdHVhbGx5IGxlZnQgdGhlIGZyb250
ZW5kCj4gPiB3aXRob3V0IGEgbWF0Y2hpbmcgYmFja2VuZCBhbmQgd2l0aCB0aGUgc3RhdGUgbm90
IHNldCB0byBjbG9zZWQuCj4gPiAKPiAKPiBXaHkgaXMgdGhpcyBhIHByb2JsZW0/IFdpdGggdGhp
cyBzZXJpZXMgZnVsbHkgYXBwbGllZCBhIChibG9jaykgYmFja2VuZCBjYW4gY29tZSBhbmQgZ28g
d2l0aG91dCBuZWVkaW5nIHRvIGNoYW5nZSB0aGUgc3RhdGUuIFJlbHlpbmcgb24gZ3Vlc3RzIHRv
IERUUlQgaXMgbm90IGEgc3VzdGFpbmFibGUgb3B0aW9uIGZvciBhIGNsb3VkIGRlcGxveW1lbnQu
Cj4gCj4gPiBJZTogdGhhdCB3b3VsZCBiZSBmaW5lIGlmIHlvdSBleHBsaWNpdGx5IHN0YXRlIHRo
aXMgaXMgc29tZSBraW5kIG9mCj4gPiBpbnRlcm5hbCBibGtiYWNrIHJlbG9hZCwgYnV0IG5vdCBm
b3IgdGhlIGdlbmVyYWwgY2FzZSB3aGVyZSBibGtiYWNrCj4gPiBoYXMgYmVlbiB1bmJvdW5kLiBJ
IHRoaW5rIHdlIG5lZWQgc29tZXdheSB0byBkaWZmZXJlbmNlIGEgYmxrYmFjawo+ID4gcmVsb2Fk
IHZzIGEgdW5ib3VuZC4KPiA+IAo+IAo+IFdoeSBkbyB3ZSBuZWVkIHRoYXQgdGhvdWdoPyBXaHkg
aXMgaXQgYWR2YW50YWdlb3VzIGZvciBhIGJhY2tlbmQgdG8gZ28gdG8gY2xvc2VkLiBObyBQViBi
YWNrZW5kcyBjb3BlIHdpdGggYW4gdW5iaW5kIGFzLWlzLCBhbmQgYSB0b29sc3RhY2sgaW5pdGlh
dGVkIHVucGx1ZyB3aWxsIGFsd2F5cyBzZXQgc3RhdGUgdG8gNSBhbnl3YXkuIFNvIFRCSCBhbnkg
c3RhdGUgdHJhbnNpdGlvbiBkb25lIGRpcmVjdGx5IGluIHRoZSB4ZW5idXMgY29kZSBsb29rcyB3
cm9uZyB0byBtZSBhbnl3YXkgKGJ1dCBhcHBlYXJzIHRvIGJlIGEgbmVjZXNzYXJ5IGV2aWwgdG8g
a2VlcCB0aGUgdG9vbHN0YWNrIHdvcmtpbmcgaW4gdGhlIGV2ZW50IGl0IHNwYXducyBhIGJhY2tl
bmQgd2hlcmUgdGhlcmUgaXMgYWN0dWFsbHkgdG8gZHJpdmVyIHByZXNlbnQsIG9yIGl0IGRvZXNu
J3QgY29tZSBvbmxpbmUpLgoKSU1PIHRoZSBub3JtYWwgZmxvdyBmb3IgdW5iaW5kIHdvdWxkIGJl
IHRvIGF0dGVtcHQgdG8gY2xvc2Ugb3Blbgpjb25uZWN0aW9ucyBhbmQgdGhlbiByZW1vdmUgdGhl
IGRyaXZlcjogbGVhdmluZyBmcm9udGVuZHMgY29ubmVjdGVkCndpdGhvdXQgYW55IGF0dGFjaGVk
IGJhY2tlbmRzIGlzIG5vdCBjb3JyZWN0LCBhbmQgd2lsbCBqdXN0IGJsb2NrIHRoZQpndWVzdCBm
cm9udGVuZCB1bnRpbCByZXF1ZXN0cyBzdGFydCB0aW1pbmcgb3V0LgoKSSBjYW4gc2VlIHRoZSBy
ZWFzb25pbmcgZm9yIGRvaW5nIHRoYXQgZm9yIHRoZSBwdXJwb3NlIG9mIHVwZGF0aW5nIGEKYmxr
YmFjayBtb2R1bGUgd2l0aG91dCBndWVzdHMgbm90aWNpbmcsIGJ1dCBJIHdvdWxkIHByZWZlciB0
aGF0CmxlYXZpbmcgY29ubmVjdGlvbnMgb3BlbiB3YXMgYW4gb3B0aW9uIHRoYXQgY291bGQgYmUg
Z2l2ZW4gd2hlbgp1bmJpbmRpbmcgKG9yIG1heWJlIGEgZHJpdmVyIG9wdGlvbiBpbiBzeXNmcz8p
LCBzbyB0aGF0IHRoZSBkZWZhdWx0CmJlaGF2aW91ciB3b3VsZCBiZSB0byB0cnkgdG8gY2xvc2Ug
ZXZlcnl0aGluZyB3aGVuIHVuYmluZGluZyBpZgpwb3NzaWJsZS4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
