Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40121613EC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 14:50:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3gkN-0005Gq-Fk; Mon, 17 Feb 2020 13:47:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3gkL-0005Gl-Ic
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 13:47:37 +0000
X-Inumbo-ID: 0e161548-518c-11ea-b0fd-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e161548-518c-11ea-b0fd-bc764e2007e4;
 Mon, 17 Feb 2020 13:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581947257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Vzu2/vJMMFHUKvLcfD197aUaDw0kGpkf3VRV51dZq6U=;
 b=DjFNaWM4J6FhbzpSDEAh306Al9uA3/gowqv8Oz+SLMS2iVScaqMt4wdf
 7w1c+rIHgJ56FCesxdyTqUVF200ger4ICI+ICmCJxPw6EyllTECU70Y2i
 lZskje63xrOy8h048mj9+FCS2iureuAvhXXX2Sae8p/lTi6wUoX3Wn8CI c=;
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
IronPort-SDR: qncYBnMs83uhvbys47LbZxyTcOKXmIQGccikqFcGQVuZwxEDHFjs0DF569CCIflryzOj9Dk72q
 cGsF8PQ++XniO4hMIUVJtdSv9WD1WrJBpryBf+cQXpZlHdSOzfYgE21JpdNWZS9w8XlNq3CYRf
 ThTdcjTcqHmfTn6/xVVh2XrDiAu5r57GP2H0PETo5KPZiiXhjJKwEbSaqB7vcw+iJKpbfGsKnN
 A8W69PnERAM0SJgh9fEuo+ufQhEk7iss8DUMaa4IQfRqnBHHt2x+TCJtiVxhe40wNZv0WkjmAL
 XGI=
X-SBRS: 2.7
X-MesageID: 12739824
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12739824"
Date: Mon, 17 Feb 2020 14:47:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200217134728.GL4679@Air-de-Roger>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
 <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
 <20200217121704.GJ4679@Air-de-Roger>
 <ac1cc737-3fd2-a184-1df1-ce7279b23067@suse.com>
 <20200217124937.GK4679@Air-de-Roger>
 <bd84bab5-ce9f-a624-b00e-b05a07206dfd@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd84bab5-ce9f-a624-b00e-b05a07206dfd@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDI6MTc6MjNQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAxNy4wMi4yMCAxMzo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgRmViIDE3LCAyMDIwIGF0IDAxOjMyOjU5UE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiA+IE9uIDE3LjAyLjIwIDEzOjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
PiA+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDAxOjExOjU5UE0gKzAxMDAsIErDvHJnZW4gR3Jv
w58gd3JvdGU6Cj4gPiA+ID4gPiBPbiAxNy4wMi4yMCAxMjo0OSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBIaSBKdWVyZ2VuLAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gT24gMTcv
MDIvMjAyMCAwNzoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+ID4gPiA+ID4gPiArdm9pZCBy
Y3VfYmFycmllcih2b2lkKQo+ID4gPiA+ID4gPiA+ICAgwqAgewo+ID4gPiA+ID4gPiA+IC3CoMKg
wqAgYXRvbWljX3QgY3B1X2NvdW50ID0gQVRPTUlDX0lOSVQoMCk7Cj4gPiA+ID4gPiA+ID4gLcKg
wqDCoCByZXR1cm4gc3RvcF9tYWNoaW5lX3J1bihyY3VfYmFycmllcl9hY3Rpb24sICZjcHVfY291
bnQsIE5SX0NQVVMpOwo+ID4gPiA+ID4gPiA+ICvCoMKgwqAgaWYgKCAhYXRvbWljX2NtcHhjaGco
JmNwdV9jb3VudCwgMCwgbnVtX29ubGluZV9jcHVzKCkpICkKPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IFdoYXQgZG9lcyBwcmV2ZW50IHRoZSBjcHVfb25saW5lX21hcCB0byBjaGFuZ2UgdW5kZXIg
eW91ciBmZWV0Pwo+ID4gPiA+ID4gPiBTaG91bGRuJ3QgeW91IGdyYWIgdGhlIGxvY2sgdmlhIGdl
dF9jcHVfbWFwcygpPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPaCwgaW5kZWVkLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBUaGlzIGluIHR1cm4gd2lsbCByZXF1aXJlIGEgbW9kaWZpY2F0aW9uIG9mIHRo
ZSBsb2dpYyB0byBkZXRlY3QgcGFyYWxsZWwKPiA+ID4gPiA+IGNhbGxzIG9uIG11bHRpcGxlIGNw
dXMuCj4gPiA+ID4gCj4gPiA+ID4gSWYgeW91IHBpY2sgbXkgcGF0Y2ggdG8gdHVybiB0aGF0IGlu
dG8gYSBydyBsb2NrIHlvdSBzaG91bGRuJ3Qgd29ycnkKPiA+ID4gPiBhYm91dCBwYXJhbGxlbCBj
YWxscyBJIHRoaW5rLCBidXQgdGhlIGxvY2sgYWNxdWlzaXRpb24gY2FuIHN0aWxsIGZhaWwKPiA+
ID4gPiBpZiB0aGVyZSdzIGEgQ1BVIHBsdWcvdW5wbHVnIGdvaW5nIG9uOgo+ID4gPiA+IAo+ID4g
PiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwv
MjAyMC0wMi9tc2cwMDk0MC5odG1sCj4gPiA+IAo+ID4gPiBUaGFua3MsIGJ1dCBsZXR0aW5nIHJj
dV9iYXJyaWVyKCkgZmFpbCBpcyBhIG5vIGdvLCBzbyBJIHN0aWxsIG5lZWQgdG8KPiA+ID4gaGFu
ZGxlIHRoYXQgY2FzZSAoSSBtZWFuIHRoZSBjYXNlIGZhaWxpbmcgdG8gZ2V0IHRoZSBsb2NrKS4g
QW5kIGhhbmRsaW5nCj4gPiA+IG9mIHBhcmFsbGVsIGNhbGxzIGlzIG5vdCBuZWVkZWQgdG8gYmUg
ZnVuY3Rpb25hbCBjb3JyZWN0LCBidXQgdG8gYXZvaWQKPiA+ID4gbm90IG5lY2Vzc2FyeSBjcHUg
c3luY2hyb25pemF0aW9uIChlYWNoIHBhcmFsbGVsIGNhbGwgZGV0ZWN0ZWQgY2FuIGp1c3QKPiA+
ID4gd2FpdCB1bnRpbCB0aGUgbWFzdGVyIGhhcyBmaW5pc2hlZCBhbmQgdGhlbiByZXR1cm4pLgo+
ID4gPiAKPiA+ID4gQlRXIC0gVGhlIHJlY3Vyc2l2ZSBzcGlubG9jayB0b2RheSB3b3VsZCBhbGxv
dyBmb3IgZS5nLiByY3VfYmFycmllcigpIHRvCj4gPiA+IGJlIGNhbGxlZCBpbnNpZGUgYSBDUFUg
cGx1Zy91bnBsdWcgc2VjdGlvbi4gWW91ciByd2xvY2sgaXMgcmVtb3ZpbmcgdGhhdAo+ID4gPiBw
b3NzaWJpbGl0eS4gQW55IGNoYW5jZSB0aGF0IGNvdWxkIGJlIGhhbmRsZWQ/Cj4gPiAKPiA+IFdo
aWxlIHRoaXMgbWlnaHQgYmUgaW50ZXJlc3RpbmcgZm9yIHRoZSByY3Ugc3R1ZmYsIGl0IGNlcnRh
aW5seSBpc24ndAo+ID4gZm9yIG90aGVyIHBpZWNlcyBhbHNvIHJlbHlpbmcgb24gdGhlIGNwdSBt
YXBzIGxvY2suCj4gPiAKPiA+IEllOiBnZXRfY3B1X21hcHMgbXVzdCBmYWlsIHdoZW4gY2FsbGVk
IGJ5IHNlbmRfSVBJX21hc2sgaWYgdGhlcmUncyBhCj4gPiBDUFUgcGx1Zy91bnBsdWcgb3BlcmF0
aW9uIGdvaW5nIG9uLCBldmVuIGlmIGl0J3Mgb24gdGhlIHNhbWUgcENQVQo+ID4gdGhhdCdzIGhv
bGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUgbW9kZS4KPiAKPiBTdXJlPyBIb3cgaXMgY3B1X2Rvd24o
KSB3b3JraW5nIHRoZW4/CgpzZW5kX0lQSV9tYXNrIGZhaWxpbmcgdG8gYWNxdWlyZSB0aGUgY3B1
IG1hcHMgbG9jayBwcmV2ZW50cyBpdCBmcm9tCnVzaW5nIHRoZSBBUElDIHNob3J0aGFuZCwgd2hp
Y2ggaXMgd2hhdCB3ZSB3YW50IGluIHRoYXQgY2FzZS4KCj4gSXQgaXMgY2FsbGluZyBzdG9wX21h
Y2hpbmVfcnVuKCkKPiB3aGljaCBpcyB1c2luZyBzZW5kX0lQSV9tYXNrKCkuLi4KClhlbiBzaG91
bGQgYXZvaWQgdXNpbmcgdGhlIEFQSUMgc2hvcnRoYW5kIGluIHRoYXQgY2FzZSwgd2hpY2ggSSBk
b24ndAp0aGluayBpdCdzIGhhcHBlbmluZyBub3csIGFzIHRoZSBsb2NrIGlzIHJlY3Vyc2l2ZS4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
