Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B929B4CA
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2019 04:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKZoA-00043z-JB; Sun, 28 Apr 2019 02:44:50 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.45])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <netwiz@crc.id.au>) id 1hKZo9-00043u-3H
 for xen-devel@lists.xensource.com; Sun, 28 Apr 2019 02:44:49 +0000
Received: from [85.158.142.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 81/28-26874-F9315CC5;
 Sun, 28 Apr 2019 02:44:47 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-23.tower-225.messagelabs.com: domain of crc.id.au designates 
 203.56.246.92 as permitted sender) smtp.mailfrom=crc.id.au; dkim=pass 
 (good signature) header.i=@crc.id.au header.s=default; dmarc=none (no 
 record) header.from=crc.id.au
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsVy2uJbjO484aM
 xBof28ljcm/Ke3YHRY3vfLvYAxijWzLyk/IoE1oyHE9eyF7yTq7iyYStLA+M7iS5GLg4hgdtM
 EucmPGMGcVgEvjJJrFjUw9rFyAnkqEq0TZ7CCGKzAdmrl1xmA7GFBUwluu+0gNkiAkYSnXcus
 4A0MwssYpK4tXsLE0iCV0BLYuOUdrBBnAIWEvcOT2SCWNfFIjG/cTFYt4SAmMSCEy+gGgQlTs
 58AjSJA2iSpcSq55wTGHlnIcnMQsgsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6hraGSsl1i
 lm6iXWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAyxlELG6h2MD9vTDzFKcjApifJafz0S
 I8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC94LQ0RghwaLU9NSKtMwcYLDDpCU4eJREeF8LAqV5i
 wsSc4sz0yFSpxjtOQ4sejiXmeNL+yMgOaf1GZDs2wgkhVjy8vNSpcR5t4NMFQBpyyjNgxsKi8
 5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5X4NM4cnMK4Hb/QroLCags1JWHgI5qyQRISX
 VwFj7kGVLztRj0VzizuWPvq9ecjTLZmrk/jWR3tMv3fI7m1AeIqkSfGDO3yLN+XE6QqlXd+99
 cGbbWePPLysOa0j6nu/9LSBmfW/H9ANlZufO+OloTmgIaKoyvXcq72XflYu3fiTOY9b5/m/uF
 I9o7/zZ7DePPZWdEyq2mrtG7kxLt2dD2YaOUG4lluKMREMt5qLiRAAgM+YOyQIAAA==
X-Env-Sender: netwiz@crc.id.au
X-Msg-Ref: server-23.tower-225.messagelabs.com!1556419482!2619462!1
X-Originating-IP: [203.56.246.92]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: 
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29733 invoked from network); 28 Apr 2019 02:44:45 -0000
Received: from mail.crc.id.au (HELO mail.crc.id.au) (203.56.246.92)
 by server-23.tower-225.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2019 02:44:45 -0000
Received: from DELL15 (unknown [IPv6:2407:e400:b000:200:1c5b:2645:b8cd:c718])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 7583A2020E;
 Sun, 28 Apr 2019 12:44:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1556419478; bh=J+DGzOT5LUvXNltUiu9YHhujAI5efLUX0Us+H/5BseI=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=Cvyb2EFuncoNrsX0ozlJcmEQZHI9GxLW+600Fol8wpPS8dePPcNDzZO2vX57VLfBr
 VkSM/IB+3kalN03qVvHUASPOtY9cy+dxzPqUeIOvOjUmJie3SYylO2mrbjaTdASk+3
 0vn1Pr7ty8RTMeS8dM9YjYlw5xTtXaXfJ4X+302k=
Date: Sun, 28 Apr 2019 12:44:37 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-Id: <1556419477.10194.1@crc.id.au>
In-Reply-To: <20190426181856.GB19604@char.us.oracle.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <CACJDEmq4rp7C3EMD2j7+5yi5R_Na_6ejuZhH4aY2=d+g6dBNbQ@mail.gmail.com>
 <1499372357.22465.108.camel@fedoraproject.org>
 <60eb4374d39aa140f82d94dc4dbf40548be87be1.camel@fedoraproject.org>
 <CAO9z1z9S1FE49VJUbOVAy0XWOsfYrXVKgq541fd9eA4eYUsauA@mail.gmail.com>
 <CAP+TRyNpaQgrg6tFezDHjTHTji+0xN_WQ479-pRx4V6wrARLuw@mail.gmail.com>
 <20190426181856.GB19604@char.us.oracle.com>
X-Mailer: geary/3.32.0
MIME-Version: 1.0
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
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
Cc: Sumantro Mukherjee <sumukher@redhat.com>,
 For testing and quality assurance of Fedora releases
 <test@lists.fedoraproject.org>, daniel.kiper@oracle.com,
 Konrad Rzeszutek Wilk <konrad@kernel.org>,
 "Xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 peter.jones@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KGFuZCBzZW5kaW5nIHRvIHRoZSBsaXN0IHRoaXMgdGltZSBkdWUgdG8gR2VhcnkgYmVpbmcgcmF0
aGVyIApmZWF0dXJlbGVzcyBtYWlsIGNsaWVudCkKCkFzIG9uZSBvZiB0aG9zZSBiZWluZyBjYXVn
aHQgYnkgcmVncmVzc2lvbnMgdXBncmFkaW5nIEYyOSB0byBGMzAgdW5kZXIgClhlbiBEb21VJ3Ms
IEkgdGhpbmsgdGhpcyBpcyBhIGJhZCBpZGVhLgoKSXQgc2hvd3MgdGhhdCBpdCB3YXNuJ3QgdGVz
dGVkLCBiZWNhdXNlIGl0IGRvZXNuJ3Qgd29yay4gVG8gbWUsIHRoaXMgCmV4cG9zZXMgd2Vha25l
c3NlcyBpbiB0aGUgdGVzdGluZyBhbmQgdGhlIHNvbHV0aW9uIHNob3VsZG4ndCBiZSAiVGhlIApj
aGVjayBmYWlscywgcmVtb3ZlIHRoZSBjaGVjayIuCgpPbiBTYXQsIEFwciAyNywgMjAxOSBhdCA0
OjE4IEFNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgCjxrb25yYWQud2lsa0BvcmFjbGUuY29tPiB3
cm90ZToKPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAxMDoyMjoxM1BNICswNTMwLCBTdW1hbnRy
byBNdWtoZXJqZWUgd3JvdGU6Cj4+ICBZdXAgKzEgZnJvbSBteSBzaWRlIHRvby4gWGVuIGlzIGhh
cmRseSB0ZXN0ZWQgc2luY2UgYSBsb3Qgb2YgdGltZS4KPiAKPiBIaSEKPiAKPiBBbmQgdGhhdCBp
cyB0aGFua3MgdG8gb25lIG9mIHRoZSBHUlVCMiBidWdzIHRoYXQgbmVlZHMgc29tZSBsb3ZlCj4g
ZnJvbSBQZXRlciBKb25lcy4KPiAKPiBBcyB3aXRob3V0IHRoYXQgYnVnIGJlaW5nIGZpeGVkIC0g
aXQgaXMgdmVyeSBkaWZmaWN1bHQgdG8gdGVzdCBpdCAtIAo+IGFzIHlvdSBjYW4ndCBldmVuIGxv
YWQgWGVuIQo+IAo+IEkndmUgYXNrZWQgdGhlIHVwc3RyZWFtIEdSVUIgbWFpbnRhaW5lciB0byBz
aGVlZCBzb21lIGxpZ2h0IG9uIHRoZQo+IGNvbmZ1c2lvbiBhYm91dCBtdWx0aWJvb3QyICsgU2Vj
dXJlQm9vdCAtIGhvcGVmdWxseSB0aGF0IHdpbGwgcmVzb2x2ZQo+IHRoZSBxdWVzdGlvbi4KPiAK
PiBNeSB2b3RlIGlzIHRvIGhhdmUgaXQgcmVtYWluIGFzIGlzLgo+IAo+IFRoYW5rIHlvdS4KPj4g
Cj4+ICBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAxMDowNyBQTSBHZW9mZnJleSBNYXJyIDxnbWFy
ckByZWRoYXQuY29tPiAKPj4gd3JvdGU6Cj4+IAo+PiAgPiBTaW5jZSBGMjQsIEkgaGF2ZW4ndCBz
ZWVuIG9yIGhlYXJkIG9mIGFueW9uZSB3aG8gdXNlcyBYZW4gb3ZlciBLVk0KPj4gID4gYW55d2hl
cmUgb3RoZXIgdGhhbiB0aGlzIHRocmVhZC4uLiBJJ20gKzEgZm9yIG1ha2luZyB0aGlzIHRlc3Qg
YW4KPj4gID4gIk9wdGlvbmFsIiBvbmUuCj4+ICA+Cj4+ICA+IEdlb2ZmIE1hcnIKPj4gID4gSVJD
OiBjb3JlbW9kdWxlCj4+ICA+Cj4+ICA+Cj4+ICA+IE9uIEZyaSwgQXByIDI2LCAyMDE5IGF0IDEw
OjMzIEFNIEFkYW0gV2lsbGlhbXNvbiA8Cj4+ICA+IGFkYW13aWxsQGZlZG9yYXByb2plY3Qub3Jn
PiB3cm90ZToKPj4gID4KPj4gID4+IE9uIFRodSwgMjAxNy0wNy0wNiBhdCAxMzoxOSAtMDcwMCwg
QWRhbSBXaWxsaWFtc29uIHdyb3RlOgo+PiAgPj4gPiBPbiBUaHUsIDIwMTctMDctMDYgYXQgMTU6
NTkgLTA0MDAsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPj4gID4+ID4gPiA+ID4gSSB3
b3VsZCBwcmVmZXIgZm9yIGl0IHRvIHJlbWFpbiBhcyBpdCBpcy4KPj4gID4+ID4gPiA+Cj4+ICA+
PiA+ID4gPiBUaGlzIGlzIG9ubHkgcHJhY3RpY2FsIGlmIGl0J3MgZ29pbmcgdG8gYmUgdGVzdGVk
LCBhbmQgCj4+IHRlc3RlZAo+PiAgPj4gcmVndWxhcmx5Cj4+ICA+PiA+ID4gPiAtIG5vdCAqb25s
eSogb24gdGhlIGZpbmFsIHJlbGVhc2UgY2FuZGlkYXRlLCByaWdodCBiZWZvcmUgCj4+IHdlIHNp
Z24KPj4gID4+IG9mZgo+PiAgPj4gPiA+ID4gb24gdGhlIHJlbGVhc2UuIEl0IG5lZWRzIHRvIGJl
IHRlc3RlZCByZWd1bGFybHkgdGhyb3VnaG91dCAKPj4gdGhlCj4+ICA+PiByZWxlYXNlCj4+ICA+
PiA+ID4gPiBjeWNsZSwgb24gdGhlIGNvbXBvc2VzIHRoYXQgYXJlICJub21pbmF0ZWQgZm9yIHRl
c3RpbmciLgo+PiAgPj4gPiA+Cj4+ICA+PiA+ID4gUmlnaHQsIHdoaWNoIGlzIHdoeSBJIGFtIGhh
cHB5IHRoYXQgeW91IGhhdmUgcG9pbnRlZCBtZSB0byAKPj4gdGhlIHJpZ2h0Cj4+ICA+PiA+ID4g
cGxhY2Ugc28gSSBjYW4gYmUgdXAtdG8tZGF0ZS4KPj4gID4+ID4KPj4gID4+ID4gR3JlYXQsIHRo
YW5rcy4gU28gbGV0J3MgbGVhdmUgaXQgYXMgaXQgaXMgZm9yIG5vdywgYnV0IHdlJ2xsIAo+PiBr
ZWVwIGFuCj4+ICA+PiA+IGV5ZSBvbiB0aGlzIGR1cmluZyBGMjcgY3ljbGUuIElmIHdlIGdldCB0
bywgc2F5LCBCZXRhIGFuZCAKPj4gdGhlcmUgYXJlIG5vCj4+ICA+PiA+IHJlc3VsdHMgZm9yIHRo
ZSB0ZXN0LCB0aGF0J3MgZ29ubmEgYmUgYSBwcm9ibGVtLiBUaGFua3MhCj4+ICA+Pgo+PiAgPj4g
U28sIGZvciBGZWRvcmEgMzAsIHRoaXMgd2FzIG5vdCB0ZXN0ZWQgdGhyb3VnaG91dCB0aGUgd2hv
bGUgCj4+IGN5Y2xlLiBJCj4+ICA+PiB0aGluayB3ZSBjYW4gY29uc2lkZXIgdGhlIHByb3Bvc2Fs
IHRvIHJlbW92ZSB0aGUgY3JpdGVyaW9uIGFjdGl2ZQo+PiAgPj4gYWdhaW4uCj4+ICA+PiAtLQo+
PiAgPj4gQWRhbSBXaWxsaWFtc29uCj4+ICA+PiBGZWRvcmEgUUEgQ29tbXVuaXR5IE1vbmtleQo+
PiAgPj4gSVJDOiBhZGFtdyB8IFR3aXR0ZXI6IEFkYW1XX0ZlZG9yYSB8IFhNUFA6IGFkYW13IEFU
IAo+PiBoYXBweWFzc2Fzc2luIC4gbmV0Cj4+ICA+PiBodHRwOi8vd3d3LmhhcHB5YXNzYXNzaW4u
bmV0Cj4+ICA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiAgPj4gdGVzdCBtYWlsaW5nIGxpc3QgLS0gdGVzdEBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9y
Zwo+PiAgPj4gVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byAKPj4gdGVzdC1sZWF2ZUBs
aXN0cy5mZWRvcmFwcm9qZWN0Lm9yZwo+PiAgPj4gRmVkb3JhIENvZGUgb2YgQ29uZHVjdDogCj4+
IGh0dHBzOi8vZ2V0ZmVkb3JhLm9yZy9jb2RlLW9mLWNvbmR1Y3QuaHRtbAo+PiAgPj4gTGlzdCBH
dWlkZWxpbmVzOiAKPj4gaHR0cHM6Ly9mZWRvcmFwcm9qZWN0Lm9yZy93aWtpL01haWxpbmdfbGlz
dF9ndWlkZWxpbmVzCj4+ICA+PiBMaXN0IEFyY2hpdmVzOgo+PiAgPj4gCj4+IGh0dHBzOi8vbGlz
dHMuZmVkb3JhcHJvamVjdC5vcmcvYXJjaGl2ZXMvbGlzdC90ZXN0QGxpc3RzLmZlZG9yYXByb2pl
Y3Qub3JnCj4+ICA+Pgo+PiAgPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiAgPiB0ZXN0IG1haWxpbmcgbGlzdCAtLSB0ZXN0QGxpc3RzLmZlZG9yYXBy
b2plY3Qub3JnCj4+ICA+IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gdGVzdC1sZWF2
ZUBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9yZwo+PiAgPiBGZWRvcmEgQ29kZSBvZiBDb25kdWN0OiBo
dHRwczovL2dldGZlZG9yYS5vcmcvY29kZS1vZi1jb25kdWN0Lmh0bWwKPj4gID4gTGlzdCBHdWlk
ZWxpbmVzOiAKPj4gaHR0cHM6Ly9mZWRvcmFwcm9qZWN0Lm9yZy93aWtpL01haWxpbmdfbGlzdF9n
dWlkZWxpbmVzCj4+ICA+IExpc3QgQXJjaGl2ZXM6Cj4+ICA+IAo+PiBodHRwczovL2xpc3RzLmZl
ZG9yYXByb2plY3Qub3JnL2FyY2hpdmVzL2xpc3QvdGVzdEBsaXN0cy5mZWRvcmFwcm9qZWN0Lm9y
Zwo+PiAgPgo+PiAKPj4gCj4+ICAtLQo+PiAgLy9zdW1hbnRybwo+PiAgRmVkb3JhIFFFCj4+ICBU
UklFRCBBTkQgUEVSU09OQUxMWSBURVNURUQsIEVSR08gVFJVU1RFRCAKPj4gPGh0dHBzOi8vcmVk
aGF0LmNvbS90cnVzdGVkPgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
