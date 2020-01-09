Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CACD135923
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 13:24:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipWo9-0004a1-Dv; Thu, 09 Jan 2020 12:21:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNyl=26=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipWo7-0004Zw-W8
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 12:21:00 +0000
X-Inumbo-ID: 791e96ce-32da-11ea-b89f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 791e96ce-32da-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578572451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gWYLOL5s7pZ6gbu47vdHwATTEkXF0DbG2UqlYHJI1k8=;
 b=VeWyAwoJWvou90P3KBjJBYz0qn6Uxz43SJCeTa2nZU9zcpffbOLfyLFS
 g5+GIhEzX93R9eVWYaM5TCfHvcX9KOQ8iAgL/Tshbq6TDWWvwuCZ7Hxaa
 Mv2dGUmVuWd5r5EsHHHLeXJkGTzbCNAkENcy5NOIXFfvCw1LFijncReUX 0=;
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
IronPort-SDR: qtuSyNNSb32h2mEl6YpjwEqBulDP+JQDwH69MQdxmIEOa+Uto7KCzzTq//VKUntGpBBZDEsWoi
 a6U41wp0NhqVqQvfOC31VFch/0P1orMhhqUZ8iV4cydmwaYMdx9o4R4XloGQwlOapS17pprEIz
 HV729nVUWdeiFzNxkTYOzX4ZHcYDE+FP8Jkc1oyi6L9omW5w8/9qjSAMjzcvfd7oWsrFBRdw+T
 6K3qyiagSeDrGMhMxOxS3x9WaYfQRbOYEcf7351ExUe/cIEe8hWzm/Hv1bCPnvlBZHVJAMngJW
 7oQ=
X-SBRS: 2.7
X-MesageID: 10663900
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,413,1571716800"; d="scan'208";a="10663900"
Date: Thu, 9 Jan 2020 13:20:31 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200109122009.GB11756@Air-de-Roger>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <2215c6fe-4492-4494-af26-6754372d4c95@suse.com>
 <20200103123409.GM11756@Air-de-Roger>
 <57fe475e-c102-19a0-c2dd-8382046f1907@suse.com>
 <20200108132819.GO11756@Air-de-Roger>
 <fc2390d0-b475-84c6-d76a-881f73cd288e@suse.com>
 <20200108181445.GV11756@Air-de-Roger>
 <eab75a49-da7b-c611-2eca-ea4a322dc1e1@suse.com>
 <20200109112405.GA11756@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109112405.GA11756@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMTI6MjQ6MDVQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAwOSwgMjAyMCBhdCAxMDo0MzowMUFNICswMTAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IE9uIDA4LjAxLjIwMjAgMTk6MTQsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4gPiA+IE9uIFdlZCwgSmFuIDA4LCAyMDIwIGF0IDAyOjU0OjU3UE0gKzAxMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+ID4gPj4gT24gMDguMDEuMjAyMCAxNDozMCwgUm9nZXIgUGF1IE1v
bm7DqSAgd3JvdGU6Cj4gPiA+Pj4gT24gRnJpLCBKYW4gMDMsIDIwMjAgYXQgMDE6NTU6NTFQTSAr
MDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+Pj4+IE9uIDAzLjAxLjIwMjAgMTM6MzQsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+Pj4+PiBPbiBGcmksIEphbiAwMywgMjAyMCBhdCAw
MTowODoyMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+Pj4+PiBPbiAyNC4xMi4y
MDE5IDEzOjQ0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiA+Pj4+Pj4gRnVydGhlciBhIHF1
ZXN0aW9uIG9uIGxvY2sgbmVzdGluZzogU2luY2UgdGhlIGNvbW1pdCBtZXNzYWdlCj4gPiA+Pj4+
Pj4gZG9lc24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQsIGRpZCB5b3UgY2hlY2sgdGhl
cmUgYXJlIG5vCj4gPiA+Pj4+Pj4gVExCIGZsdXNoIGludm9jYXRpb25zIHdpdGggdGhlIGdldF9j
cHVfbWFwcygpIGxvY2sgaGVsZD8KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBUaGUgQ1BVIG1hcHMgbG9j
ayBpcyBhIHJlY3Vyc2l2ZSBvbmUsIHNvIGl0IHNob3VsZCBiZSBmaW5lIHRvIGF0dGVtcHQKPiA+
ID4+Pj4+IGEgVExCIGZsdXNoIHdpdGggdGhlIGxvY2sgYWxyZWFkeSBoZWxkLgo+ID4gPj4+Pgo+
ID4gPj4+PiBXaGVuIGFscmVhZHkgaGVsZCBieSB0aGUgc2FtZSBDUFUgLSBzdXJlLiBJdCBiZWlu
ZyBhIHJlY3Vyc2l2ZQo+ID4gPj4+PiBvbmUgKHdoaWNoIEkgcGFpZCBhdHRlbnRpb24gdG8gd2hl
biB3cml0aW5nIG15IGVhcmxpZXIgcmVwbHkpCj4gPiA+Pj4+IGRvZXNuJ3QgbWFrZSBpdCAodG9n
ZXRoZXIgd2l0aCBhbnkgb3RoZXIgb25lKSBpbW11bmUgYWdhaW5zdAo+ID4gPj4+PiBBQkJBIGRl
YWRsb2NrcywgdGhvdWdoLgo+ID4gPj4+Cj4gPiA+Pj4gVGhlcmUncyBubyBwb3NzaWJpbGl0eSBv
ZiBhIGRlYWRsb2NrIGhlcmUgYmVjYXVzZSBnZXRfY3B1X21hcHMgZG9lcyBhCj4gPiA+Pj4gdHJ5
bG9jaywgc28gaWYgYW5vdGhlciBjcHUgaXMgaG9sZGluZyB0aGUgbG9jayB0aGUgZmx1c2ggd2ls
bCBqdXN0Cj4gPiA+Pj4gZmFsbGJhY2sgdG8gbm90IHVzaW5nIHRoZSBzaG9ydGhhbmQuCj4gPiA+
Pgo+ID4gPj4gV2VsbCwgd2l0aCB0aGUgX2V4YWN0XyBhcnJhbmdlbWVudHMgKGZsdXNoX2xvY2sg
dXNlZCBvbmx5IGluIG9uZQo+ID4gPj4gcGxhY2UsIGFuZCBjcHVfYWRkX3JlbW92ZV9sb2NrIG9u
bHkgdXNlZCBpbiB3YXlzIHNpbWlsYXIgdG8gaG93IGl0Cj4gPiA+PiBpcyB1c2VkIG5vdyksIHRo
ZXJlJ3Mgbm8gc3VjaCByaXNrLCBJIGFncmVlLiBCdXQgdGhlcmUncyBub3RoaW5nCj4gPiA+PiBh
dCBhbGwgbWFraW5nIHN1cmUgdGhpcyBkb2Vzbid0IGNoYW5nZS4gSGVuY2UsIGFzIHNhaWQsIGF0
IHRoZSB2ZXJ5Cj4gPiA+PiBsZWFzdCB0aGlzIG5lZWRzIHJlYXNvbmluZyBhYm91dCBpbiB0aGUg
ZGVzY3JpcHRpb24gKG9yIGEgY29kZQo+ID4gPj4gY29tbWVudCkuCj4gPiA+IAo+ID4gPiBJJ20g
YWZyYWlkIHlvdSB3aWxsIGhhdmUgdG8gYmVhciB3aXRoIG1lLCBidXQgSSdtIHN0aWxsIG5vdCBz
dXJlIGhvdwo+ID4gPiB0aGUgYWRkaXRpb24gb2YgZ2V0X2NwdV9tYXBzIGluIGZsdXNoX2FyZWFf
bWFzayBjYW4gbGVhZCB0byBkZWFkbG9ja3MuCj4gPiA+IEFzIHNhaWQgYWJvdmUgZ2V0X2NwdV9t
YXBzIGRvZXMgYSB0cnlsb2NrLCB3aGljaCBtZWFucyB0aGF0IGl0IHdpbGwKPiA+ID4gbmV2ZXIg
ZGVhZGxvY2ssIGFuZCB0aGF0J3MgdGhlIG9ubHkgd2F5IHRvIGxvY2sgY3B1X2FkZF9yZW1vdmVf
bG9jay4KPiA+IAo+ID4gVGhhdCdzIHdoeSBJIHNhaWQgImNwdV9hZGRfcmVtb3ZlX2xvY2sgb25s
eSB1c2VkIGluIHdheXMgc2ltaWxhciB0bwo+ID4gaG93IGl0IGlzIHVzZWQgbm93IiAtIGFueSBu
b24tdHJ5bG9jayBhZGRpdGlvbiB3b3VsZCBicmVhayB0aGUKPiA+IGFzc3VtcHRpb25zIHlvdSBt
YWtlIGFmYWljdC4gQW5kIHlvdSBjYW4ndCByZWFsbHkgZXhwZWN0IHBlb3BsZQo+ID4gYWRkaW5n
IGFub3RoZXIgKHNsaWdodGx5IGRpZmZlcmVudCkgdXNlIG9mIGFuIGV4aXN0aW5nIGxvY2sgdG8g
YmUKPiA+IGF3YXJlIHRoZXkgbm93IG5lZWQgdG8gY2hlY2sgd2hldGhlciB0aGlzIGludHJvZHVj
ZXMgZGVhZGxvY2sKPiA+IHNjZW5hcmlvcyBvbiB1bnJlbGF0ZWQgcHJlLWV4aXN0aW5nIGNvZGUg
cGF0aHMuIEhlbmNlIG15IHJlcXVlc3QgdG8KPiA+IGF0IGxlYXN0IGRpc2N1c3MgdGhpcyBpbiB0
aGUgZGVzY3JpcHRpb24gKHJhaXNpbmcgYXdhcmVuZXNzLCBhbmQKPiA+IGhlbmNlIGFsbG93aW5n
IHJldmlld2VycyB0byBqdWRnZSB3aGV0aGVyIGZ1cnRoZXIgcHJlY2F1dGlvbmFyeQo+ID4gbWVh
c3VyZXMgc2hvdWxkIGJlIHRha2VuKS4KPiAKPiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9u
LCBJIGRpZCBpbmRlZWQgbWlzdW5kZXJzdG9vZCB5b3VyCj4gY29tcGxhaW4uCj4gCj4gUmVnYXJk
aW5nIHRoZSBnZW5lcmFsaXphdGlvbiBvZiB0aGUgc2hvcnRoYW5kIGFuZCBpbnRlZ3JhdGlvbiBp
bnRvCj4gc2VuZF9JUElfbWFzaywgSSd2ZSBmb3VuZCBhbiBpc3N1ZSByZWxhdGVkIHRvIGxvY2tp
bmcuIHNlbmRfSVBJX21hc2sKPiBpcyBjYWxsZWQgd2l0aCBib3RoIGludGVycnVwdHMgZW5hYmxl
ZCBhbmQgZGlzYWJsZWQsIGFuZCBzbwo+IGdldF9jcHVfbWFwcyBwYW5pY3MgYmVjYXVzZSBvZiB0
aGUgbG9jayBjaGVja2luZy4KPiAKPiBJIGhvd2V2ZXIgZG9uJ3QgdGhpbmsgdGhhdCBzdWNoIHBh
bmljIGlzIGFjY3VyYXRlOiB0aGUgbG9naWMgaW4KPiBjaGVja19sb2NrIHNwZWNpZmljYWxseSBy
ZWxhdGVzIHRvIHRoZSBzcGlubmluZyBkb25lIHdoZW4gcGlja2luZyBhCj4gbG9jaywgYnV0IEkg
d291bGQgc2F5IHRoZSBjYWxsIHRvIGNoZWNrX2xvY2sgaW4KPiBfc3Bpbl90cnlsb2Nre19yZWN1
cnNpdmV9IGlzIG5vdCBzdHJpY3RseSBuZWVkZWQsIHRoZSBzY2VuYXJpbwo+IGRlc2NyaWJlZCBp
biBjaGVja19sb2NrIGRvZXNuJ3QgYXBwbHkgd2hlbiB1c2luZyB0cnlsb2NrLgoKTmV2ZXIgbWlu
ZCwgdGhpcyBpcyBub3QgYWN0dWFsbHkgdHJ1ZS4gWW91IGNhbiBzdGlsbCB0cmlnZ2VyIHRoZQpk
ZWFkbG9jayBpZiB5b3UgbWl4IHRyeWxvY2sgd2l0aCByZWd1bGFyIGxvY2tpbmcsIHNvIEkgZ3Vl
c3MgSSB3aWxsCmxlYXZlIHRoZSBzaG9ydGhhbmQgdXNhZ2UgdG8gZmx1c2hfYXJlYV9tYXNrIHVu
bGVzcyBJIGNhbiBtYWtlIGFsbCB0aGUKY2FsbGVycyBvZiBzZW5kX0lQSV9tYXNrIHVzZSB0aGUg
c2FtZSBpcnEgc3RhdHVzLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
