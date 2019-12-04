Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A69112AC7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 12:55:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icTDP-0008Fj-Jc; Wed, 04 Dec 2019 11:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icTDO-0008Fd-CH
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 11:53:06 +0000
X-Inumbo-ID: a1747ffe-168c-11ea-8202-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1747ffe-168c-11ea-8202-12813bfff9fa;
 Wed, 04 Dec 2019 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575460385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v43T6GQhJRDELGjzcs+gsybpT9I35XPtifwWGnpLrcs=;
 b=c9a9zKTdygRymXxTwq0wwzuFQE97paHeT0pff7h7jovMvVVFirh5Uk7W
 rbIAKMRjNhWd3LM3I1DqBFujwuteIjf6Qz79t8UjY6RNNyGmpXXqX2ees
 Q4B6vCcgtm30fcGBrurfcUrK9sVbv+QInpsyYhd6poHb+MXrFGiCUs9pN 8=;
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
IronPort-SDR: w/Uu6CYCtr11Sv+HePrsLfEr2RYetD37/U79YJLQwPjyqGqARVVBsL4DYHGxShCyjKoTs/54ch
 vg39yPnZVBfs97GQWkPqOBZcb49yOy4tc7q52SiZqJZrSrSqvE7jguquWERvoZHwSvzR+A872H
 q51jnEF7bdhmxPB439jM1NZv6iTVyxWrDey/p6YhiBvzokjvMm/MMyvMky/2bnhV37kwUF9wiv
 jJw0WzhvIco0oumjYhqJDOST2Kzgi3czQRf1exsY5+pZAan34zFoqOeVaQf5XImPJdtZgUgN35
 5WE=
X-SBRS: 2.7
X-MesageID: 9306427
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9306427"
Date: Wed, 4 Dec 2019 12:52:43 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204115243.GJ980@Air-de-Roger>
References: <20191204104420.34418-1-roger.pau@citrix.com>
 <a8827921-2d27-de07-8019-e99252dec703@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8827921-2d27-de07-8019-e99252dec703@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86: do not enable global pages when
 virtualized on AMD hardware
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

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMTI6MDU6MzVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxMTo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gV2hl
biB1c2luZyBnbG9iYWwgcGFnZXMgYSBmdWxsIHRsYiBmbHVzaCBjYW4gb25seSBiZSBwZXJmb3Jt
ZWQgYnkKPiA+IHRvZ2dsaW5nIHRoZSBQR0UgYml0IGluIENSNCwgd2hpY2ggaXMgdXN1YWxseSBx
dWl0ZSBleHBlbnNpdmUgaW4gdGVybXMKPiA+IG9mIHBlcmZvcm1hbmNlIHdoZW4gcnVubmluZyB2
aXJ0dWFsaXplZC4gVGhpcyBpcyBzcGVjaWFsbHkgcmVsZXZhbnQgb24KPiA+IEFNRCBoYXJkd2Fy
ZSwgd2hpY2ggZG9lc24ndCBoYXZlIHRoZSBhYmlsaXR5IHRvIGRvIHNlbGVjdGl2ZSBDUjQKPiA+
IHRyYXBwaW5nLCBidXQgY2FuIGFsc28gYmUgcmVsZXZhbnQgb24gSW50ZWwgaWYgdGhlIHVuZGVy
bHlpbmcKPiA+IGh5cGVydmlzb3IgYWxzbyB0cmFwcyBhY2Nlc3NlcyB0byB0aGUgUEdFIENSNCBi
aXQuCj4gPiAKPiA+IEluIG9yZGVyIHRvIGF2b2lkIHRoaXMgcGVyZm9ybWFuY2UgcGVuYWx0eSwg
ZG8gbm90IHVzZSBnbG9iYWwgcGFnZXMKPiA+IHdoZW4gcnVubmluZyB2aXJ0dWFsaXplZCBvbiBB
TUQgaGFyZHdhcmUuIEEgY29tbWFuZCBsaW5lIG9wdGlvbgo+ID4gJ2dsb2JhbC1wYWdlcycgaXMg
cHJvdmlkZWQgaW4gb3JkZXIgdG8gYWxsb3cgdGhlIHVzZXIgdG8gc2VsZWN0Cj4gPiB3aGV0aGVy
IGdsb2JhbCBwYWdlcyB3aWxsIGJlIGVuYWJsZWQgZm9yIFBWIGd1ZXN0cy4KPiA+IAo+ID4gVGhl
IGFib3ZlIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBzaGltIHJ1bm5pbmcgb24gQU1EIGhhcmR3YXJl
IHdpdGgKPiA+IDMyIHZDUFVzOgo+ID4gCj4gPiBQR0UgZW5hYmxlZCwgeDJBUElDIG1vZGU6Cj4g
PiAKPiA+IChYRU4pIEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRiMDFj
MCwgbG9ja3ZhbD0xYWRiMWFkYiwgbm90IGxvY2tlZAo+ID4gKFhFTikgICBsb2NrOjE4NDE4ODMo
MTM3NTEyODk5ODU0MyksIGJsb2NrOjE2NTg3MTYoMTAxOTMwNTQ4OTA3ODEpCj4gPiAKPiA+IEF2
ZXJhZ2UgbG9jayB0aW1lOiAgIDc0NjU4OG5zCj4gPiBBdmVyYWdlIGJsb2NrIHRpbWU6IDYxNDUx
NDducwo+ID4gCj4gPiBQR0UgZGlzYWJsZWQsIHgyQVBJQyBtb2RlOgo+ID4gCj4gPiAoWEVOKSBH
bG9iYWwgbG9jayBmbHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YWYxYzAsIGxvY2t2YWw9YThi
ZmE4YmYsIG5vdCBsb2NrZWQKPiA+IChYRU4pICAgbG9jazoyNzMwMTc1KDY1NzUwNTM4OTg4Niks
IGJsb2NrOjIwMzk3MTYoMjk2Mzc2ODI0NzczOCkKPiA+IAo+ID4gQXZlcmFnZSBsb2NrIHRpbWU6
ICAgMjQwODI5bnMKPiA+IEF2ZXJhZ2UgYmxvY2sgdGltZTogMTQ1MzAyOW5zCj4gPiAKPiA+IEFz
IHNlZW4gZnJvbSB0aGUgYWJvdmUgZmlndXJlcyB0aGUgbG9jayBhbmQgYmxvY2sgdGltZSBvZiB0
aGUgZmx1c2gKPiA+IGxvY2sgaXMgcmVkdWNlZCB0byBhcHByb3hpbWF0ZWx5IDEvMyBvZiB0aGUg
b3JpZ2luYWwgdmFsdWUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4g
IC0gUHJvdmlkZSBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIFBHRS4KPiA+
ICAtIE9ubHkgZGlzYWJsZSBQR0Ugb24gQU1EIGhhcmR3YXJlIHdoZW4gdmlydHVhbGl6ZWQuCj4g
PiAgLSBEb2N1bWVudCB0aGUgZ2xvYmFsLXBhZ2VzIG9wdGlvbi4KPiA+IC0tLQo+ID4gIGRvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDEzICsrKysrKysrKysrKysKPiA+ICB4ZW4v
YXJjaC94ODYvcHYvZG9tYWluLmMgICAgICAgICAgfCAgOSArKysrKysrKy0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYwo+ID4gaW5kZXggZDk0OTVlZjZiOS4uN2JlMzBmMjc2NiAxMDA2
NDQKPiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ID4gKysrIGIv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gPiBAQCAtMTA4Nyw2ICsxMDg3LDE5
IEBAIHZhbHVlIHNldHRhYmxlIHZpYSBYZW4gdG9vbHMuCj4gPiAgCj4gPiAgRG9tMCBpcyB1c2lu
ZyB0aGlzIHZhbHVlIGZvciBzaXppbmcgaXRzIG1hcHRyYWNrIHRhYmxlLgo+ID4gIAo+ID4gKyMj
IyBnbG9iYWwtcGFnZXMgKHg4NikKPiA+ICs+IGA9IDxib29sZWFuPmAKPiA+ICsKPiA+ICs+IERl
ZmF1bHQ6IGB0cnVlYCB1bmxlc3MgcnVubmluZyB2aXJ0dWFsaXplZCBvbiBBTUQgaGFyZHdhcmUK
PiA+ICsKPiA+ICtTZXQgd2hldGhlciB0aGUgUEdFIGJpdCBpbiBDUjQgd2lsbCBiZSBlbmFibGVk
IGZvciBQViBndWVzdHMuIFRoaXMgY29udHJvbHMgdGhlCj4gPiArdXNhZ2Ugb2YgZ2xvYmFsIHBh
Z2VzLCBhbmQgdGh1cyB0aGUgbmVlZCB0byBwZXJmb3JtIHRsYiBmbHVzaGVzIGJ5IHdyaXRpbmcg
dG8KPiA+ICtDUjQuCj4gPiArCj4gPiArTm90ZSBpdCdzIGRpc2FibGVkIGJ5IGRlZmF1bHQgd2hl
biBydW5uaW5nIHZpcnR1YWxpemVkIG9uIEFNRCBoYXJkd2FyZSBzaW5jZQo+ID4gK0FNRCBTVk0g
ZG9lc24ndCBzdXBwb3J0IHNlbGVjdGl2ZSB0cmFwcGluZyBvZiBDUjQsIHNvIGdsb2JhbCBwYWdl
cyBhcmUgbm90Cj4gPiArZW5hYmxlZCBpbiBvcmRlciB0byByZWR1Y2UgdGhlIG92ZXJoZWFkIG9m
IHRsYiBmbHVzaGVzLgo+ID4gKwo+ID4gICMjIyBndWVzdF9sb2dsdmwKPiA+ICA+IGA9IDxsZXZl
bD5bLzxyYXRlLWxpbWl0ZWQgbGV2ZWw+XWAgd2hlcmUgbGV2ZWwgaXMgYG5vbmUgfCBlcnJvciB8
IHdhcm5pbmcgfCBpbmZvIHwgZGVidWcgfCBhbGxgCj4gPiAgCj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L3B2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCj4gPiBpbmRl
eCA0YjZmNDhkZWEyLi45M2ZiODIzZDYzIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3B2
L2RvbWFpbi5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKPiA+IEBAIC0xMTgs
MTEgKzExOCwxOCBAQCB1bnNpZ25lZCBsb25nIHB2X2ZpeHVwX2d1ZXN0X2NyNChjb25zdCBzdHJ1
Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBjcjQpCj4gPiAgICAgICAgICAgICAgKG1tdV9jcjRf
ZmVhdHVyZXMgJiBQVl9DUjRfR1VFU1RfVklTSUJMRV9NQVNLKSk7Cj4gPiAgfQo+ID4gIAo+ID4g
K3N0YXRpYyBpbnQgb3B0X2dsb2JhbF9wYWdlcyA9IC0xOwo+IAo+IGludDhfdCBfX3JlYWRfbW9z
dGx5Cj4gCj4gPiArYm9vbGVhbl9ydW50aW1lX3BhcmFtKCJnbG9iYWwtcGFnZXMiLCBvcHRfZ2xv
YmFsX3BhZ2VzKTsKPiA+ICsKPiA+ICB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0
cnVjdCB2Y3B1ICp2KQo+ID4gIHsKPiA+ICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYt
PmRvbWFpbjsKPiA+ICAgICAgdW5zaWduZWQgbG9uZyBjcjQgPSBtbXVfY3I0X2ZlYXR1cmVzICYK
PiA+ICAgICAgICAgIH4oWDg2X0NSNF9QQ0lERSB8IFg4Nl9DUjRfUEdFIHwgWDg2X0NSNF9UU0Qp
Owo+ID4gKyAgICBib29sIHBnZSA9IG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgPyAoIWNwdV9oYXNf
aHlwZXJ2aXNvciB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICE9Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBYODZfVkVORE9SX0FNRCkKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDogISFvcHRfZ2xvYmFsX3BhZ2VzOwo+IAo+IExldCdzIGF2
b2lkIHJlLWRvaW5nIHRoaXMgZXZhbHVhdGlvbiBlYWNoIHRpbWUgd2UgY29tZSBoZXJlLgo+IFBv
c3QgYm9vdCB0aGUgdmFsdWUgY2FuIG9ubHkgY2hhbmdlIHRvIDAgb3IgMS4gSGVuY2UgaW4gc29t
ZQo+IF9faW5pdCBmdW5jdGlvbiB5b3UgY2FuIGFwcGx5IHRoZSBkZWZhdWx0IGNhbGN1bGF0aW9u
IGRvbmUKPiBoZXJlLgoKSSd2ZSBhc3N1bWVkIHRoYXQgYm9vbGVhbl9ydW50aW1lX3BhcmFtIGNh
biBiZSBjaGFuZ2VkIGR1cmluZyBydW50aW1lCmJ5IHRoZSB1c2VyLCBhbmQgaGVuY2UgdGhlIHZh
bHVlIGNhbGN1bGF0ZWQgYXQgYm9vdCB0aW1lIHdvdWxkIGJlY29tZQpzdGFsZSBpZiB0aGUgdXNl
ciBjaGFuZ2VzIGl0IGFmdGVyIGJvb3QsIHdoaWNoIHNob3VsZCBiZSBmaW5lIGZvciB0aGlzCm9w
dGlvbi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
