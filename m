Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D41055FD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:47:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXodr-00063T-7B; Thu, 21 Nov 2019 15:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXodq-00063O-3n
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:45:10 +0000
X-Inumbo-ID: e5457ca4-0c75-11ea-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5457ca4-0c75-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574351110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0Q2h5Iqv/6T+9tpa/Qtx/FrN5MVwiSrp0ndnjLYzQcI=;
 b=DsUdPu9KVSa8pitMNmDT/PK3vXCuAuSzRt06yhKFUG8Ch0e7QuKfxDXV
 rW+MVo+0/oOLCMFZzY3OkL5Ln0WavykpWyOgzzy/QT/tdz8YxUZY+IrOu
 bP/BGWZiM6jT5UG+NRRhAf/WEEFLqEJ1myjLOAGjRaIjBT5rSBDl8pWB9 I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hPKFM0P8C6MP+yYqWM2D8ZkxRJXvxd10Ss3L26n8Pgw4QMZnJOPOFXVVWhPFAQ6kQjVSIO0LWc
 vTQDXqUPhXe0VzLzMhxRnxsFrYRL48eDeGSHbr1sMn3mPrUJuAC/P9BP9zrUnabL+y8CIak6qB
 HE/inn51Y8/uT2r648p7YB2Vt8Kwg6cSaZsul8exdlGwd60hCwMEOIieLj15+732elf2Rge9uZ
 fY9niNr93qLOaLOqwLw4IvJpE7x3TeFjaDWLJWrDUwk8MtQ5gS9jCBSRFuig5eb3JlJAxkb9nz
 ETA=
X-SBRS: 2.7
X-MesageID: 8667775
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="8667775"
Date: Thu, 21 Nov 2019 16:45:00 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Rishi <2rushikeshj@gmail.com>
Message-ID: <20191121154500.GV72134@Air-de-Roger>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <20191121135635.GU72134@Air-de-Roger>
 <CAO9XypU3JM685vnCsbrfweunnMr+eMCDECwYh_WhVFUUZc4XeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO9XypU3JM685vnCsbrfweunnMr+eMCDECwYh_WhVFUUZc4XeA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDg6NTY6NDFQTSArMDUzMCwgUmlzaGkgd3JvdGU6Cj4g
T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgNzoyNiBQTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDc6
MDk6MzFQTSArMDUzMCwgUmlzaGkgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTm92IDE5LCAyMDE5IGF0
IDI6NDcgUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IE9uIDE5LjExLjIwMTkgMDY6MjMsIFJpc2hpIHdyb3RlOgo+ID4gPiA+ID4gb2ssIHRo
YW5rcyBmb3IgY2xlYXJpbmcgaXQgdXAuIFdvdWxkIGEgcGF0Y2ggYmUgYWNjZXB0ZWQgaWYgdGhp
cwo+ID4gPiA+ID4gb3B0aW9uIG9mIHNob3dpbmcgRUFYIGxlYWYgaXMgc2VsZWN0aXZlbHkgZG9u
ZSB0aHJvdWdoIGNvbW1hbmQgbGluZQo+ID4gPiA+ID4gKGRlZmF1bHQgZGlzYWJsZWQpPwo+ID4g
PiA+Cj4gPiA+ID4gSW4gZ2VuZXJhbCBJJ2QgZXhwZWN0IHRoaXMgdG8gYmUgcmF0aGVyIHVubGlr
ZWx5LCBidXQgSSBndWVzcyBtdWNoCj4gPiA+ID4gd291bGQgZGVwZW5kIG9uIHRoZSBhY3R1YWwg
cmVhc29uaW5nIGRvbmUgaW4gdGhlIGRlc2NyaXB0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gPiBPbiBs
b25nZXIgcnVuLCB3aGF0IGlzIGFuIGV4cGVjdGVkIHNhbmUgbW9kZWwgb2YgdmlydHVhbGl6aW5n
IHRoaXM/Cj4gPiA+ID4gPiBXaXRoIHNvbWUgZ3VpZGFuY2UsIG1heSBiZSBJIG9yIHNvbWVvbmUg
ZWxzZSBjYW4gY29kZSB0byBicmluZyB0aGUKPiA+ID4gPiA+IGZ1bmN0aW9uYWxpdHkgYmFjay4K
PiA+ID4gPgo+ID4gPiA+IFdoaWNoIGZ1bmN0aW9uYWxpdHk/IFNvIGZhciB5b3UndmUgdGFsa2Vk
IG9mIG9ubHkgQ1BVSUQgYml0cyBJCj4gPiA+ID4gdGhpbmssIHdpdGhvdXQgZXhwbGFpbmluZyBh
dCBhbGwgd2hhdCBmdW5jdGlvbmFsaXR5IHlvdSB3YW50IHRvCj4gPiA+ID4gaGF2ZSB0aGF0IGRl
cGVuZHMgb24gdGhlc2UuIEluIGdlbmVyYWwsIGFzIHNhaWQgZWFybGllciwgQ1BVCj4gPiA+ID4g
bWFuYWdlbWVudCBpcyB0aGUgaHlwZXJ2aXNvcidzIHJlc3BvbnNpYmlsaXR5LCBzbyBJJ2QgcmF0
aGVyCj4gPiA+ID4gbm90IHNlZSB0aGlzIHZpcnR1YWxpemVkLCBidXQgdGhlIGh5cGVydmlzb3Ig
YmUgcHV0IGludG8gYQo+ID4gPiA+IHBvc2l0aW9uIG9mIGRvaW5nIHdoYXRldmVyIGlzIG5lZWRl
ZC4KPiA+ID4gPgo+ID4gPiA+IEphbgo+ID4gPgo+ID4gPiBUaGUgcmVhc29uaW5nIHRvIGhhdmUg
RUFYKDB4MDZoKSBleHBvc2VkIHRvIERvbTAgaXMgZm9yIFRoZXJtYWwgYW5kCj4gPiA+IFBvd2Vy
IG1hbmFnZW1lbnQuCj4gPiA+IFdpdGhvdXQgRUFYKDB4MDZoKSBEb20wIGlzIHVuYWJsZSB0byBz
ZW5zZSBwcmVzZW5jZSBvZiBDUFUgY29yZQo+ID4gPiB0ZW1wZXJhdHVyZSBvciBkbyBUaGVybWFs
IG1hbmFnZW1lbnQgLSBpbmNsdWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvCj4gPiA+IG9wZXJhdGlu
ZyBGYW4gc3BlZWQuCj4gPiA+IERvbTAgaGFzIHRvIHJlbHkgb24gb3RoZXIgcG9zc2libGUgd2F5
cyBzdWNoIGFzIGlwbWkgb3IgQklPUyB3aGljaCBhcmUKPiA+ID4gb3B0aW9uYWxseSBhdmFpbGFi
bGUuCj4gPiA+Cj4gPiA+IEZyb20gdGhlIHBhdGNoIGRlc2NyaXB0aW9uCj4gPiA+IGh0dHBzOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTcyZTAzODQ1
MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjliM2Q0M2M2YzYKPiA+ID4gaXQgc2VlbXMgdGhhdCB0aGUg
Y2hhbmdlIHdhcyBpbnRyb2R1Y2VkIHRvIG5vdCBleHBvc2UgRUFYKDB4MDZoKSB0bwo+ID4gPiB1
bnByaXZpbGVnZWQgUFYgZ3Vlc3RzIGJ1dCBub3RoaW5nIGlzIHNhaWQgZm9yIERvbTAgaXRzZWxm
LiBJIHRoaW5rCj4gPiA+IHlvdSBhbHJlYWR5IG1lbnRpb25lZCB0aGF0IHRoZSBmbGFnIGlzIGhp
ZCBmcm9tIERvbTAgYXMgd2VsbAo+ID4gPiBpbnRlbnRpb25hbGx5Lgo+ID4gPgo+ID4gPiBTbyB1
bmxlc3MgaHlwZXJ2aXNvciB3YW50cyB0byBkbyB0aGVybWFsIG1hbmFnZW1lbnQgb2YgdGhlIENQ
VSBib2FyZCwKPiA+ID4gaXQgd291bGQgaW5oaWJpdCBEb20wJ3MgYWJpbGl0eSB0byBkbyB0aGlz
IGZ1bmN0aW9uLgo+ID4KPiA+IFRoYXQncyBsaWtlbHkgd2hhdCB5b3Ugd2FudCwgb24gYSBYZW4g
c3lzdGVtIGRvbTAgaXMgYSBzcGVjaWFsIGd1ZXN0LAo+ID4gYnV0IHN0aWxsIGEgZ3Vlc3QsIHNv
IGl0J3Mgbm90IGZlYXNpYmxlIGZvciBhIG5hdGl2ZSBkb20wIGRyaXZlciB0byBkbwo+ID4gcG93
ZXIgb3IgdGVtcGVyYXR1cmUgbWFuYWdlbWVudCB3aXRob3V0IGhhdmluZyBYZW4gc3BlY2lmaWMK
PiA+IGtub3dsZWRnZS4gRm9yIGluc3RhbmNlIHRoZSBsb2FkIG9uIGRvbTAgZG9lc24ndCBtYXRj
aCB0aGUgYWN0dWFsCj4gPiBsb2FkIG9uIHRoZSBoYXJkd2FyZS4KPiA+Cj4gPiBJIHRoaW5rIHdl
IGhhZCBhIHZlcnkgc2ltaWxhciBkaXNjdXNzaW9uIGF0Ogo+ID4KPiA+IGh0dHBzOi8vbWFyYy5p
bmZvLz9sPXhlbi1kZXZlbCZtPTE1NjM5NzY5NjQxMzIzMCZ3PTIKPiA+Cj4gPiBJIHdvdWxkIHJl
Y29tbWVuZCByZWFkaW5nIHRoZSBmdWxsIHRocmVhZCBhbmQgdGhlCj4gPiBjb25jbHVzaW9ucy9w
cm9wb3NhbHMuCj4gPgo+ID4gUm9nZXIuCj4gCj4gVGhhbmsgUm9nZXIgZm9yIHRoZSByZWZlcmVu
Y2UgYW5kIGNvbmNsdXNpb24uIFJlcGVhdGluZyBoZXJlIGZvcgo+IGhhdmluZyBkaXJlY3RlZCBk
aXNjdXNzaW9uLgo+IAo+ID4gSXQgd2lsbCBpbnZvbHZlIGxvb2tpbmcgaW50byB0aGUgTGludXgg
ZHJpdmVyIGluIG9yZGVyIHRvIG1ha2UgdXNlIG9mCj4gPiBhbiBoeXBlcmNhbGwgaW5zdGVhZCBv
ZiBhIHJkbXNyLiBJIHRoaW5rIGl0IHNob3VsZCBiZSBmaW5lIHRvIGV4cG9zZQo+ID4gdGhlIENQ
VUlEIGxlYWYgdG8gZG9tMCBhcyBsb25nIGFzIHJlYWRzIGFyZSBwZXJmb3JtZWQgZnJvbSB0aGUK
PiA+IGh5cGVyY2FsbCwgaW4gb3JkZXIgdG8gYXNzdXJlIHRoYXQgTGludXggZ2V0cyBjb25zaXN0
ZW50IHZhbHVlcy4KPiAKPiBUaGUgYWZmZWN0ZWQgTGludXggZHJpdmVyIGluIG15IGNhc2UgaXMg
Y29yZXRlbXAua28gKGRyaXZlcnMvaHdtb24vY29yZXRlbXAuYykKPiAKPiBJdCdzIGluaXQgZGVw
ZW5kcyBvbiBjaGVja2luZyBwcmVzZW5jZSBvZiBYODZfRkVBVFVSRV9EVEhFUk0KPiAKPiAgICAg
ICAgIC8qCj4gICAgICAgICAgKiBDUFVJRC4wNkguRUFYWzBdIGluZGljYXRlcyB3aGV0aGVyIHRo
ZSBDUFUgaGFzIHRoZXJtYWwKPiAgICAgICAgICAqIHNlbnNvcnMuIFdlIGNoZWNrIHRoaXMgYml0
IG9ubHksIGFsbCB0aGUgZWFybHkgQ1BVcwo+ICAgICAgICAgICogd2l0aG91dCB0aGVybWFsIHNl
bnNvcnMgd2lsbCBiZSBmaWx0ZXJlZCBvdXQuCj4gICAgICAgICAgKi8KPiAKPiBJdCBzZWVtcyB0
byB1c2UgYmVsb3cgTVNSCj4gTVNSX0lBMzJfUEFDS0FHRV9USEVSTV9TVEFUVVMKPiBNU1JfSUEz
Ml9USEVSTV9TVEFUVVMKPiBNU1JfSUEzMl9URU1QRVJBVFVSRV9UQVJHRVQKPiAKPiBJJ20gbm90
IHN1cmUgaG93IGNhbiBDUFVJRC4wNkguRUFYWzBdIGJlIHJlYWQsIHNob3VsZCBYZW4gcHJvdmlk
ZSBhCj4gaHlwZXJjYWxsIGludGVyZmFjZSB0byByZWFkIHRoaXM/CgpJIHRoaW5rIHRoZXJlJ3Mg
YWxyZWFkeSBzb21lIGludGVyZmFjZSB0byByZWFkIHRoZSByYXcgY3B1aWQgcG9saWN5LApidXQg
bWF5YmUgdGhhdCdzIGEgZG9tY3RsLiBOb3RlIHRoYXQgb24gUFYgZXhlY3V0aW5nIGEgcGxhaW4g
Y3B1aWQKaW5zdHJ1Y3Rpb24gd2l0aG91dCB0aGUgWGVuIHByZWZpeCB3aWxsIGdldCB5b3UgdGhl
IG5hdGl2ZSBwb2xpY3ksCmFsYmVpdCBJIHdvbid0IHJlbHkgb24gdGhhdCBzaW5jZSBpdCB3aWxs
IGdvIGF3YXkgd2l0aCBQVkguCgpZb3Ugd2lsbCBhbHNvIG5lZWQgYW4gaW50ZXJmYWNlIHRvIHJl
cXVlc3QgWGVuIHRvIGV4ZWN1dGUgcmRtc3Ivd3Jtc3IKb24gc3BlY2lmaWMgcENQVXMgaW4gb3Jk
ZXIgdG8gZ2V0IGFuZCBzZXQgdGhlIHRoZXJtYWwgZGF0YS4KCj4gRXZlbiBpZiBhIGh5cGVyY2Fs
bCBpcyBnaXZlbiwgY29yZXRlbXAgd2lsbCBoYXZlIHRvIGJlIG1vZGlmaWVkIHRvCj4gc2VwYXJh
dGUgTVNSIGNhbGxzLgoKTm90IG9ubHkgdGhpcywga2VlcCBpbiBtaW5kIHRoYXQgZG9tMCB2Q1BV
cyAhPSBwQ1BVcywgc28geW91IHdpbGwKbGlrZWx5IG5lZWQgYSB3YXkgdG8gdGVsbCBjb3JldGVt
cCBhYm91dCB0aGUgcmVhbCBudW1iZXIgb2YgQ1BVcyBpbgp0aGUgc3lzdGVtLCB3aGljaCBtaWdo
dCBub3QgbWF0Y2ggdGhlIG51bWJlciBvZiB2Q1BVcyBkb20wIGhhcwphc3NpZ25lZC4KCj4gRG9l
cyBoYXZpbmcgYSBwdiB0ZW1wZXJhdHVyZSByZWFkZXIgKHB2Y29yZXRlbXApIGFsdG9nZXRoZXIg
bWFrZQo+IHNlbnNlPyBUaGlzIHdvdWxkIGhhdmUgaHlwZXJjYWxsIGZvciBEVFMgZGV0ZWN0aW9u
IGFuZCBYRU4gTVNSIHJlYWRzCj4gZm9yIHZhbHVlcy4KPiBGb3IgY29tcGF0aWJpbGl0eSwgY2Fu
IGl0IHVzZSB0aGUgc2FtZSBzeXMgcGF0aCBhcyB0aGF0IG9mIGNvcmV0ZW1wLmtvCj4gdG8gd3Jp
dGUgdGhlcm1hbCBpbmZvPwo+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9wdmNvcmV0ZW1wLjAvaHdt
b24vaHdtb24yL3RlbXAxX2lucHV0CgpUaGF0J3MgYSBMaW51eCBrZXJuZWwgcXVlc3Rpb24gSU1P
LCBhcyBhIFhlbiBkZXZlbG9wZXIgSSBjYW5ub3QgdGVsbAp3aGV0aGVyIHRoYXQncyBzdWl0YWJs
ZSBvciBub3Qgc2luY2UgaXQncyBhIGRldGFpbCBvZiB0aGUgTGludXgKaW1wbGVtZW50YXRpb24u
Cgo+IAo+IFRoaXMgd2lsbCBsZXQgbG1fc2Vuc29ycyBsaWIgKFNOTVAvQ0xJKSBpbnRlcnByZXQg
dGVtcHMgcmVndWxhcmx5LgoKU2VlbXMgZmVhc2libGUsIGJ1dCB5b3Ugd2lsbCBhbHNvIGhhdmUg
dG8gY2hlY2sgdGhhdCBsbV9zZW5zb3JzCmRvZXNuJ3QgbWFrZSBhbnkgYXNzdW1wdGlvbnMgYWJv
dXQgdGhlIG51bWJlciBvZiBDUFVzIGJ5IHJlYWRpbmcKL3Byb2MvY3B1aW5mbyBmb3IgZXhhbXBs
ZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
