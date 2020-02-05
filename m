Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253515323A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:49:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izL0w-0008Te-JY; Wed, 05 Feb 2020 13:46:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AtEH=3Z=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1izL0u-0008TX-VQ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:46:45 +0000
X-Inumbo-ID: f16cfb54-481d-11ea-90fd-12813bfff9fa
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f16cfb54-481d-11ea-90fd-12813bfff9fa;
 Wed, 05 Feb 2020 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1580910402; i=@ts.fujitsu.com;
 bh=Z3jYvIl+sAx95hMO6Bbu5q94pSJA7Iffi+BWenIlt44=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type;
 b=W22j5wW6U/AUWSJy3hiXWrJ+vPuAmKKyulWDZV/FY9iNC3yc7JiLD5s8kIt1vXaMq
 B+dAU+2GDjp0PpTj5rLjgddWNASkpgOdInxb1QZu+BNaiOEwBV5yqu1qkQik4bZW0q
 EccZ4pNT/Cu+QwJPbU48jQ66VHAMwWQ1jt8Xk7e1hGDJgYK6zdhLRBv38VGU4SnPzn
 I6grBiprAKOWznyaIUMFytbLe6qqp8Pp3ZO5iLUACsaM6y0/HTeZG1venmer8sDdoQ
 0Zfg5VLGLg+/IZVm60ujM5zXwLyme50FUbCwJWKMmMfIRd11AF38H2Hgs4+7yVvOgw
 IGvUuacLr18ng==
Received: from [100.112.197.112] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-b.eu-west-1.aws.symcld.net id DE/C2-20893-247CA3E5;
 Wed, 05 Feb 2020 13:46:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxVdfpuFW
 cwa4PAharN01ns5hz08ji+5bJTA7MHq8nT2D0OPzhCovH+i1XWQKYo1gz85LyKxJYMy62TWMr
 +CNVseB7cQPjIbEuRk4OIYHZjBLHuuu7GLmA7HmMElOm3WYHSbAJGEjsenWIGcQWETCT6Gt8A
 xZnFqiUWNx6lQXEFhYIltjUtAssziKgKrF4disTiM0rYCixZddiNhCbU8BGYsK1aywQC9oZJT
 pfPGOGKBKUODnzCQvEUG2JZQtfM0PYehI3pk5hm8DIOwtJ2SwkZbOQlC1gZF7FaJFUlJmeUZK
 bmJmja2hgoGtoaKRraGmha2hhopdYpZukl1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokRGJwp
 Bcd27GA8svy93iFGSQ4mJVFe7m6rOCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvHZHgXKCRanpq
 RVpmTnASIFJS3DwKInwrgZJ8xYXJOYWZ6ZDpE4xKkqJ8/IcA0oIgCQySvPg2mDReYlRVkqYl5
 GBgUGIpyC1KDezBFX+FaM4B6OSMO9NkPE8mXklcNNfAS1mAlos7W0BsrgkESEl1cBUde72NEl
 fM7ZShiU6nB8DxZ/c87q39efUg73qHSacy0KjS6Mz3/VPT5IMif7+yXgqzxG2mXIFBWsOvitb
 c96xe/Kzzf/CXtnlM3984rT8lF3db8+Vvd3r2dWz2z+73V5TIaFpeaqYb+6PyL76JWx3XPknb
 d50aqL/KlsVtYhXa68WcnJv3O9/e6u+TrVrRKfElaWOGXPc++Y0WfbJbWV/tlT8O1+nycvjl/
 ec+SKrc1v7ecP1+c8351euqjBTcRDtSzx6zcE8ZI52XA0H8+qvfQcFnh94J1QZuOzkmoLkQPH
 Tszk6ti3bdP+V1p7ZKs5RG0v9pF6bFN98PMmzN1TTJTZVakvNO73DyziXirkrsRRnJBpqMRcV
 JwIASXhVDEkDAAA=
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-19.tower-287.messagelabs.com!1580910401!676499!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7541 invoked from network); 5 Feb 2020 13:46:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-19.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Feb 2020 13:46:42 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 015DkfQv024313;
 Wed, 5 Feb 2020 13:46:41 GMT
Received: from amur.mch.fsc.net (unknown [10.172.102.28])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 75347A15098;
 Wed,  5 Feb 2020 14:46:32 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Date: Wed, 05 Feb 2020 14:46:22 +0100
Message-ID: <4430557.VeX946I8Wz@amur.mch.fsc.net>
In-Reply-To: <c975ae29-bdc2-e57f-d0b7-8ef829de6f1b@suse.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <2063375.Nye48AXmgY@amur.mch.fsc.net>
 <c975ae29-bdc2-e57f-d0b7-8ef829de6f1b@suse.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gTWl0dHdvY2gsIDUuIEZlYnJ1YXIgMjAyMCwgMTA6MzE6MzcgQ0VUIHNjaHJpZWIgSsO8cmdl
biBHcm/DnzoKPiBPbiAwNS4wMi4yMCAxMDowMywgRGlldG1hciBIYWhuIHdyb3RlOgo+ID4gQW0g
RGllbnN0YWcsIDQuIEZlYnJ1YXIgMjAyMCwgMTU6MTg6NTMgQ0VUIHNjaHJpZWIgSsO8cmdlbiBH
cm/DnzoKPiA+PiBPbiAwNC4wMi4yMCAxNTowNywgRGlldG1hciBIYWhuIHdyb3RlOgo+ID4+PiBB
bSBGcmVpdGFnLCAzMS4gSmFudWFyIDIwMjAsIDIyOjU5OjE5IENFVCBzY2hyaWViIElnb3IgRHJ1
emhpbmluOgo+ID4+Pj4gT24gMzAvMDEvMjAyMCAxMzowMywgRGlldG1hciBIYWhuIHdyb3RlOgo+
ID4+Pj4+IEhpLAo+ID4+Pj4+Cj4gPj4+Pj4gd2UgdXNlIFNMRVMxMiB3aXRoIGtlcm5lbC1kZWZh
dWx0LTQuMTIuMTQtOTUuNDUuMS54ODZfNjQgYW5kCj4gPj4+Pj4geGVuLTQuMTEuM18wMi0yLjIw
LjEueDg2XzY0Cj4gPj4+Pj4KPiA+Pj4+PiBUaGUgZHVtcCBrZXJuZWwgZG9lc24ndCBzdGFydCBh
ZnRlciAiZWNobyBjID4gL3Byb2Mvc3lzcnFfdHJpZ2dlciIuCj4gPj4+Pj4gTGFzdCBtZXNzYWdl
cyBvbiBjb25zb2xlIGFyZToKPiA+Pj4+PiBbICAzODUuNzE3NTMyXSBLZXJuZWwgcGFuaWMgLSBu
b3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uCj4gPj4+Pj4gWyAgMzg1LjczNDU2NV0gS2VybmVs
IE9mZnNldDogZGlzYWJsZWQKPiA+Pj4+PiAoWEVOKSBIYXJkd2FyZSBEb20wIGNyYXNoZWQ6IEV4
ZWN1dGluZyBrZXhlYyBpbWFnZSBvbiBjcHU1OAo+ID4+Pj4+IChYRU4pIFNob3QgZG93biBhbGwg
Q1BVcwo+ID4+Pj4+Cj4gPj4+Pj4gQWZ0ZXIgYSBzaG9ydCB0aW1lIGEgcmVib290IGlzIGluaXRp
YXRlZC4KPiA+Pj4+PiBXaXRob3V0IHhlbiB0aGUga2R1bXAgd29ya3MuCj4gPj4+Pj4KPiA+Pj4+
PiBXZSBzZWUgdGhpcyBiZWhhdmlvdXIgb25seSBvbiBuZXdlciBoYXJkd2FyZSwgZm9yIGV4YW1w
bGUgYSBzZXJ2ZXIgd2l0aAo+ID4+Pj4+IEludGVsKFIpIFhlb24oUikgR29sZCA2MjQyIENQVSBA
IDIuODBHSHoKPiA+Pj4+Pgo+ID4+Pj4+IEkgYnVpbHQgdGhlIGZyZXNoIHJlbGVhc2VkIHhlbi00
LjEzIG15c2VsZiBhbmQgdHJpZWQgaXQgYnV0IHRoaXMgZG9lc24ndCBoZWxwLgo+ID4+Pj4+Cj4g
Pj4+Pj4gSSB0cmllZCB4MmFwaWM9b2ZmIG9uIHRoZSB4ZW4gc2lkZSBhbmQgbm94MmFwaWMgb24g
dGhlIGxpbnV4IHNpZGUgYnV0IG5vIHN1Y2Nlc3MuCj4gPj4+Pgo+ID4+Pj4gU3RhcnRpbmcgZnJv
bSBYZW4gNC4xMiB3ZSBrZWVwIElPTU1VIGVuYWJsZWQgZHVyaW5nIGtleGVjIHRyYW5zaXRpb24K
PiA+Pj4+IHdoaWNoIHJlc29sdmVkIHRoZSBwcm9ibGVtIHlvdSdyZSBkZXNjcmliaW5nLiBCdXQg
eW91IGFsc28gbmVlZCB0byBtYWtlCj4gPj4+PiBzdXJlIElPTU1VIGlzIGVuYWJsZWQgaW4geW91
ciBrZXhlYyBrZXJuZWwgKHdoaWNoIEkgdGhpbmsgaXMgbm93IHRoZQo+ID4+Pj4gZGVmYXVsdCBm
b3IgbW9zdCBkaXN0cm9zKS4gWW91IGNhbiBzdGlsbCB0cnkgdG8gd29ya2Fyb3VuZCB0aGUgaXNz
dWUKPiA+Pj4+IHlvdSdyZSBzZWVpbmcgb24gNC4xMSBieSB1c2luZyAiaW9tbXU9ZG9tMC1wYXNz
dGhvdWdoIiBYZW4gb3B0aW9uLgo+ID4+Pgo+ID4+PiBJIGFkZGVkICJpb21tdT1kb20wLXBhc3N0
aHJvdWdoIiB0byB0aGUgeGVuLTQuMTEgY29tbWFuZCBsaW5lIGJ1dCBubyBzdWNjZXNzLgo+ID4+
PiBGdXJ0aGVyIEkgYWRkZWQgZWFybHlwcmludGs9Li4uIHRvIHRoZSB0aGUga2R1bXAga2VybmVs
IGFuZCBJIGNvdWxkIHNlZSB0aGUKPiA+Pj4gZHVtcCBrZXJuZWwgc3RhcnRlZCBhbmQgb25seSBv
bmUgbWVzc2FnZSBmcm9tIGV4dHJhY3Rfa2VybmVsKCkKPiA+Pj4gd2FzIHByaW50ZWQuIFRoZW4g
dGhlIHJlYm9vdCBmb2xsb3dlZC4KPiA+Pgo+ID4+IFdoaWNoIG1lc3NhZ2U/Cj4gPj4KPiA+PiBB
bnkgY2hhbmNlIHlvdSBjYW4gYnVpbGQgdGhlIGtkdW1wIGtlcm5lbCB3aXRoIENPTkZJR19YODZf
VkVSQk9TRV9CT09UVVAKPiA+PiBlbmFibGVkPwo+ID4gCj4gPiBZZXMgaXQncyBzd2l0Y2hlZCBv
bi4gVGhlIE1lc3NhZ2UgaXMgZnJvbSB0aGUgZmlyc3QgZGVidWcgbWVzc2FnZSBpbgo+ID4gZXh0
cmFjdF9rZXJuZWwoKSAtIGRlYnVnX3B1dGFkZHIoaW5wdXRfZGF0YSk6Cj4gPiAiaW5wdXRfZGF0
YTogMHgiCj4gCj4gV2VpcmQsIHRoZXJlIHNob3VsZCBiZSAiZWFybHkgY29uc29sZSBpbiBleHRy
YWN0X2tlcm5lbFxuIiBiZWZvcmUgdGhhdC4KCkFoIHNvcnJ5LCBteSBmYXVsdC4gSSBmaWRkbGVk
IGFyb3VuZCB3aXRoIHRoaXMgYm9vdCBhbmQgY29tbWVudGVkIG91dCB0aGlzCm1lc3NhZ2UuIFNv
IEkgc2VlOgooWEVOKSBIYXJkd2FyZSBEb20wIGNyYXNoZWQ6IEV4ZWN1dGluZyBrZXhlYyBpbWFn
ZSBvbiBjcHUzNwooWEVOKSBTaG90IGRvd24gYWxsIENQVXMKZWFybHkgY29uc29sZSBpbiBleHRy
YWN0X2tlcm5lbAoKPiA+IEJ1dCBub3QgYWxsIG9mIHRoZSB0ZXh0IGlzIHNlZW4hCj4gCj4gV2Vp
cmQgYWdhaW4gLSB0aGUgYWRkcmVzcyBzaG91bGQgYmUgcHJpbnRlZC4KPiAKPiA+IElmIEkgdW50
ZXJzdGFuZCB0aGUgZWFybHlfc2VyaWFsX2luaXQgY29kZSBpbiBhcmNoL3g4Ni9ib290L2Vhcmx5
X3NlcmlhbF9jb25zb2xlLmMKPiA+IGNvcnJlY3RseSB0aGUgc2VyaWFsIGxpbmUgd29ya3Mgd2l0
aCBwb2xsaW5nIChubyBpbnRlcnJ1cHRzKSwgc28gaXQgc2VlbXMgdGhlCj4gPiByZWJvb3QgaXMg
aW5pdGlhdGVkIGJlZm9yZSB0aGUgY29tcGxldGUgbWVzc2FnZSBpcyBwcmludGVkLgo+IAo+IEJ1
dCBwb2xsaW5nIGlzIHN5bmNocm9ub3VzIChzZWUgc2VyaWFsX3B1dGNoYXIoKSBpbgo+IGFyY2gv
eDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmMpLiBTbyBhIHJlYm9vdCBpbmRpY2F0ZXMgYSB2ZXJ5
IGVhcmx5Cj4gZmFpbHVyZS4KPiAKPiBDYW4geW91IHBsZWFzZSBzaG93IHRoZSBjb21wbGV0ZSBr
ZHVtcCBrZXJuZWwgYm9vdCBwYXJhbWV0ZXJzPwoKa2V4ZWMgbG9hZHM6Ci9zYmluL2tleGVjIC1w
IC9ib290L3ZtbGludXotNC4xMi4xNC05NS4yOS1kZWZhdWx0IC0tYXBwZW5kPSJlbGV2YXRvcj1k
ZWFkbGluZSBzeXNycT15ZXMgcmVzZXRfZGV2aWNlcyBhY3BpX25vX21lbWhvdHBsdWcgY2dyb3Vw
X2Rpc2FibGU9bWVtb3J5IG5va2FzbHIgbnVtYT1vZmYgaXJxcG9sbCBucl9jcHVzPTEgcm9vdD1r
ZHVtcCByb290ZmxhZ3M9YmluZCByZC51ZGV2LmNoaWxkcmVuLW1heD04IGRpc2FibGVfY3B1X2Fw
aWNpZD0wICBlYXJseXByaW50az1zZXJpYWwsdHR5UzAsMzg0MDAiIC0taW5pdHJkPS9ib290L2lu
aXRyZC00LjEyLjE0LTk1LjI5LWRlZmF1bHQta2R1bXAgIC1zCgpUaGFuayB5b3UhCkRpZXRtYXIu
Cgo+IEp1ZXJnZW4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
