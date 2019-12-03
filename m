Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCD10FC2D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 12:07:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic5ys-0007J7-Hq; Tue, 03 Dec 2019 11:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pRqY=ZZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ic5yr-0007J2-JG
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 11:04:33 +0000
X-Inumbo-ID: af1b98de-15bc-11ea-83b8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af1b98de-15bc-11ea-83b8-bc764e2007e4;
 Tue, 03 Dec 2019 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575371073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7ABgMPwE7msgLJNy/5wCz2xPoflosoeHKZMasiu/ack=;
 b=fhnc2rYU2ZncFo4dQ/ZswGNA8yv2nsRGuQ5VClmKHt3irH31JVypHlcd
 QkLIJOp6/COVhjpTvcYZseMMz6Iz+z91msWoarMLcbDjhsc/KqgfuvwwT
 gw3lTSYlrqqqcbowEmoSwLeQ2679gPzteTg7hUX11Gsn6rYZOMVqZkljX s=;
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
IronPort-SDR: 1/wb6eTZjfoO9qm1iTeREjkRVaUeE/xA9CijFQoUQb3btTUbNW9Ir0PCaN9EDl86laz3Bv0VVm
 7dHBujPKrE1BMjgVeNp1P/UL2FD6h/MwfzMRY/W7YmA5cSO7IiMAHSdfqqoHgv+CU2rzni6utG
 MFIyTzJVZsiwYMaxqzePDmqlH9uqY29b+qDq3a3N2b3cp1OA2QnXNRyzq94vToqehwcJ7iIY4t
 /6VG+UAge457JnG+YRFhdyoaGzmMiQQJweZ9JMrbJ2Wf5VrWLWsL5NIr5wyMfcYDT4gXjBYYLz
 uvk=
X-SBRS: 2.7
X-MesageID: 9235484
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,272,1571716800"; 
   d="scan'208";a="9235484"
Date: Tue, 3 Dec 2019 12:04:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191203110422.GE980@Air-de-Roger>
References: <20191202112946.25461-1-roger.pau@citrix.com>
 <886dbb28-4729-7bb4-b40a-2e10e803e152@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <886dbb28-4729-7bb4-b40a-2e10e803e152@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86: re-order clang no integrated
 assembler tests
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 DougGoldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMTE6MDM6MzFBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMTIuMjAxOSAxMjoyOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhl
IHRlc3RzIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGludGVncmF0ZWQgYXNzZW1ibGVyIGlzIGNhcGFi
bGUgb2YKPiA+IGJ1aWxkaW5nIFhlbiBzaG91bGQgYmUgcGVyZm9ybWVkIGJlZm9yZSB0ZXN0aW5n
IGFueSBhc3NlbWJsZXIKPiA+IGZlYXR1cmVzLCBvciBlbHNlIHRoZSBmZWF0dXJlIHNwZWNpZmlj
IHRlc3RzIHdvdWxkIGJlIHN0YWxlIGlmIHRoZQo+ID4gaW50ZWdyYXRlZCBhc3NlbWJsZXIgaXMg
ZGlzYWJsZWQgYWZ0ZXJ3YXJkcy4KPiA+IAo+ID4gRml4ZXM6IGVmMjg2ZjY3Nzg3YSAoJ3g4Njog
bW92ZSBhbmQgZml4IGNsYW5nIC5za2lwIGNoZWNrJykKPiAKPiBQZXJoYXBzIHRoaXMgY2hhbmdl
IGhhcyBtYWRlIHRoZSBzaXR1YXRpb24gd29yc2UgKGFuZCBJJ20gc29ycnkKPiBmb3IgdGhlIGJy
ZWFrYWdlKSwgYnV0IHRoZSBpc3N1ZSB3YXMgZGVmaW5pdGVseSB0aGVyZSBiZWZvcmUuCj4gVGhl
IGNoYW5nZSBhYm92ZSBtZXJlbHkgYWRkZWQgb25lIGNoZWNrIHRvIHR3byBhbHJlYWR5IHByZXNl
bnQKPiBvbmVzIGluIHRoZSBzYW1lIHBsYWNlLgoKSSBhZ3JlZSB0aGlzIHdhcyBhbHJlYWR5IGJy
b2tlbiwgdGhhdCBjaGFuZ2UganVzdCBtYWRlIHRoaW5ncyB3b3JzZQphbmQgY2F1c2VkIHRlc3Rz
IHRvIHN0YXJ0IGZhaWxpbmcsIHNvIEkndmUgdXNlZCB0aGUgZml4ZXMgdGFnIGluIG9yZGVyCnRv
IG5vdGljZSB0aGlzIGNoYW5nZSBkaWQgcmVzdG9yZSB0aGluZ3MgdG8gdGhlIHByZXZpb3VzIHN0
YXRlLgoKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L1J1bGVzLm1rCj4gPiBAQCAtMTIsNiArMTIsMzAgQEAgQ0ZMQUdTICs9ICctRF9fT0JKRUNU
X0xBQkVMX189JChzdWJzdCAvLCQkLCQoc3Vic3QgLSxfLCQoc3Vic3QgJChCQVNFRElSKS8sLCQo
Q1UKPiA+ICAjIFByZXZlbnQgZmxvYXRpbmctcG9pbnQgdmFyaWFibGVzIGZyb20gY3JlZXBpbmcg
aW50byBYZW4uCj4gPiAgQ0ZMQUdTICs9IC1tc29mdC1mbG9hdAo+ID4gIAo+ID4gK2lmZXEgKCQo
Y2xhbmcpLHkpCj4gPiArIyBOb3RlOiBBbnkgdGVzdCB3aGljaCBhZGRzIC1uby1pbnRlZ3JhdGVk
LWFzIHdpbGwgY2F1c2Ugc3Vic2VxdWVudCB0ZXN0cyB0bwo+ID4gKyMgc3VjY2VlZCwgYW5kIG5v
dCB0cmlnZ2VyIGZ1cnRoZXIgYWRkaXRpb25zLgo+ID4gKyMKPiA+ICsjIFRoZSB0ZXN0cyB0byBz
ZWxlY3Qgd2hldGhlciB0aGUgaW50ZWdyYXRlZCBhc3NlbWJsZXIgaXMgdXNhYmxlIG5lZWQgdG8g
aGFwcGVuCj4gPiArIyBiZWZvcmUgdGVzdGluZyBhbnkgYXNzZW1ibGVyIGZlYXR1cmVzLCBvciBl
bHNlIHRoZSByZXN1bHQgb2YgdGhlIHRlc3RzIHdvdWxkCj4gPiArIyBiZSBzdGFsZSBpZiB0aGUg
aW50ZWdyYXRlZCBhc3NlbWJsZXIgaXMgbm90IHVzZWQuCj4gPiArCj4gPiArIyBPbGRlciBjbGFu
ZydzIGJ1aWx0LWluIGFzc2VtYmxlciBkb2Vzbid0IHVuZGVyc3RhbmQgLnNraXAgd2l0aCBsYWJl
bHM6Cj4gPiArIyBodHRwczovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTI3MzY5Cj4g
PiArJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZMQUdTLENDLCIuTDA6IC5MMTogLnNraXAgKC5MMSAt
IC5MMCkiLCxcCj4gPiArICAgICAgICAgICAgICAgICAgICAgLW5vLWludGVncmF0ZWQtYXMpCj4g
PiArCj4gPiArIyBDaGVjayB3aGV0aGVyIGNsYW5nIGFzbSgpLXMgc3VwcG9ydCAuaW5jbHVkZS4K
PiA+ICskKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsIi5pbmNsdWRlIFwiYXNtL2luZGly
ZWN0X3RodW5rX2FzbS5oXCIiLCxcCj4gPiArICAgICAgICAgICAgICAgICAgICAgLW5vLWludGVn
cmF0ZWQtYXMpCj4gPiArCj4gPiArIyBDaGVjayB3aGV0aGVyIGNsYW5nIGtlZXBzIC5tYWNyby1z
IGJldHdlZW4gYXNtKCktczoKPiA+ICsjIGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MzYxMTAKPiA+ICskKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsXAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICIubWFjcm8gRk9POy5lbmRtIiQkKGNsb3NlKTsgYXNtIHZvbGF0
aWxlICQkKG9wZW4pIi5tYWNybyBGT087LmVuZG0iLFwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAtbm8taW50ZWdyYXRlZC1hcykKPiA+ICtlbmRpZgo+ID4gKwo+ID4gICQoY2FsbCBjYy1vcHRp
b25zLWFkZCxDRkxBR1MsQ0MsJChFTUJFRERFRF9FWFRSQV9DRkxBR1MpKQo+ID4gICQoY2FsbCBj
Yy1vcHRpb24tYWRkLENGTEFHUyxDQywtV25lc3RlZC1leHRlcm5zKQo+ID4gICQoY2FsbCBhcy1v
cHRpb24tYWRkLENGTEFHUyxDQywidm1jYWxsIiwtREhBVkVfQVNfVk1YKQo+ID4gQEAgLTcwLDIy
ICs5NCwzIEBAIGVuZGlmCj4gPiAgIyBTZXQgdXAgdGhlIGFzc2VtYmxlciBpbmNsdWRlIHBhdGgg
cHJvcGVybHkgZm9yIG9sZGVyIHRvb2xjaGFpbnMuCj4gPiAgQ0ZMQUdTICs9IC1XYSwtSSQoQkFT
RURJUikvaW5jbHVkZQo+ID4gIAo+ID4gLWlmZXEgKCQoY2xhbmcpLHkpCj4gPiAtIyBOb3RlOiBB
bnkgdGVzdCB3aGljaCBhZGRzIC1uby1pbnRlZ3JhdGVkLWFzIHdpbGwgY2F1c2Ugc3Vic2VxdWVu
dCB0ZXN0cyB0bwo+ID4gLSMgc3VjY2VlZCwgYW5kIG5vdCB0cmlnZ2VyIGZ1cnRoZXIgYWRkaXRp
b25zLgo+ID4gLQo+ID4gLSMgT2xkZXIgY2xhbmcncyBidWlsdC1pbiBhc3NlbWJsZXIgZG9lc24n
dCB1bmRlcnN0YW5kIC5za2lwIHdpdGggbGFiZWxzOgo+ID4gLSMgaHR0cHM6Ly9idWdzLmxsdm0u
b3JnL3Nob3dfYnVnLmNnaT9pZD0yNzM2OQo+ID4gLSQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFH
UyxDQywiLkwwOiAuTDE6IC5za2lwICguTDEgLSAuTDApIiwsXAo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgIC1uby1pbnRlZ3JhdGVkLWFzKQo+ID4gLQo+ID4gLSMgQ2hlY2sgd2hldGhlciBjbGFu
ZyBhc20oKS1zIHN1cHBvcnQgLmluY2x1ZGUuCj4gPiAtJChjYWxsIGFzLW9wdGlvbi1hZGQsQ0ZM
QUdTLENDLCIuaW5jbHVkZSBcImFzbS9pbmRpcmVjdF90aHVua19hc20uaFwiIiwsXAo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIC1uby1pbnRlZ3JhdGVkLWFzKQo+ID4gLQo+ID4gLSMgQ2hlY2sg
d2hldGhlciBjbGFuZyBrZWVwcyAubWFjcm8tcyBiZXR3ZWVuIGFzbSgpLXM6Cj4gPiAtIyBodHRw
czovL2J1Z3MubGx2bS5vcmcvc2hvd19idWcuY2dpP2lkPTM2MTEwCj4gPiAtJChjYWxsIGFzLW9w
dGlvbi1hZGQsQ0ZMQUdTLENDLFwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAiLm1hY3JvIEZP
TzsuZW5kbSIkJChjbG9zZSk7IGFzbSB2b2xhdGlsZSAkJChvcGVuKSIubWFjcm8gRk9POy5lbmRt
IixcCj4gPiAtICAgICAgICAgICAgICAgICAgICAgLW5vLWludGVncmF0ZWQtYXMpCj4gPiAtZW5k
aWYKPiAKPiBGdXJ0aGVybW9yZSBJIHRoaW5rIHRoaXMgbW92aW5nIGFyb3VuZCBvZiBsb2dpYyAo
d2hpY2ggaW1vCj4gd291bGQgYmV0dGVyIHJlbWFpbiBhdCB0aGUgYm90dG9tIG9mIHRoZSBmaWxl
LCB3ZWxsIG91dCBvZgo+IHNpZ2h0KSBpcyBvbmx5IHRoZSBzZWNvbmQgYmVzdCBzb2x1dGlvbiB0
byB0aGUgaXNzdWUuIFRoZQo+IHJlYXNvbiBJIGRpZG4ndCBub3RpY2UgdGhlIGJyZWFrYWdlIHdh
cyBiZWNhdXNlIEkgaGFkIG5vdGljZWQKPiB3aGF0IG1hZGUgbWUgY3JlYXRlIHRoZSBwYXRjaCBp
biBxdWVzdGlvbiBvbmx5IHdoaWxlIHB1dHRpbmcKPiB0b2dldGhlciBhIGNoYW5nZSBtb3Zpbmcg
b3V0IHRoZSBtYWpvcml0eSBvZiB0aGUgYXMtb3B0aW9uLWFkZAo+IGludm9jYXRpb25zLCBwcmlt
YXJpbHkgd2l0aCB0aGUgZ29hbCBvZiBub3QgaGF2aW5nIHRoZQo+IGNvbXBpbGVyIGludm9rZWQg
b3ZlciBhbmQgb3ZlciBqdXN0IHRvIGNhbGN1bGF0ZSBDRkxBR1MuIEkKPiBkaWRuJ3QgcG9zdCB0
aGlzIGNoYW5nZSB5ZXQgc2ltcGx5IGJlY2F1c2UgSSB3YW50ZWQgdG8gZ2l2ZSBpdAo+IHNvbWUg
bW9yZSAobG9jYWwpIHRlc3RpbmcuCgpMb29rcyBsaWtlIGFuIGltcHJvdmVtZW50LCBidXQgaG93
IGRvIHlvdSBwbGFuIHRvIGFjaGlldmUgdGhlIHNhbWU/CgpBcmUgdGhlcmUgc29tZSBjb21waWxl
ci9hc3NlbWJsZXIgaGludHMgYXZhaWxhYmxlIGF0IGJ1aWxkIHRpbWUgYWJvdXQKd2hpY2ggZmVh
dHVyZXMgYXJlIHN1cHBvcnRlZD8KCj4gQW5vdGhlciByZWFzb24gdG8ga2VlcCB0aGlzIGF0IHRo
ZSBib3R0b20gb2YgdGhlIGZpbGUgaXMgdGhhdAo+IG90aGVyIENGTEFHUyBhZGRpdGlvbnMgd291
bGRuJ3QgaGF2ZSBoYXBwZW5lZCB5ZXQgYXQgdGhlCj4gcGxhY2UgdGhlIGNoZWNrcyBsaXZlIG5v
dy4KClJpZ2h0LCBidXQgaXQncyB1bmxpa2VseSB0aGF0IENGTEFHUyBjYW4gaW5mbHVlbmNlIHdo
ZXRoZXIgdGhlCmludGVybmFsIGFzc2VtYmxlciBpcyBjYXBhYmxlIG9mIGJ1aWxkaW5nIFhlbiBv
ciBub3QsIHdoaWxlIGl0J3MgSU1PCm1vcmUgbGlrZWx5IHRoYXQgdXNpbmcgdGhlIGludGVybmFs
IG9yIGFuIGV4dGVybmFsIGFzc2VtYmxlciBjYW4gbGVhZAp0byBhIGRpZmZlcmVudCBzZXQgb2Yg
Q0ZMQUdTIChhcyBDRkxBR1MgYWxzbyBpbmNsdWRlIG9wdGlvbnMgdGhhdAphZmZlY3QgdGhlIGFz
c2VtYmxlcikuCgo+IFNpbmNlIHRoZXJlJ3Mgb25lIGFzLW9wdGlvbi1hZGQKPiBpbnZvY2F0aW9u
IHJlbWFpbmluZyBldmVuIGFmdGVyIG15IGNoYW5nZSAodGhlIG9uZQo+IGVzdGFibGlzaGluZyBI
QVZFX0FTX1FVT1RFRF9TWU0sIG5vdCBmaXR0aW5nIHRoZSBtb2RlbCB1c2VkCj4gYmVjYXVzZSBv
ZiB0aGUgZnVydGhlciBvcHRpb24gYWRkaXRpb25zKSwgSSBndWVzcyB0aGUgcmlnaHQKPiBjb3Vy
c2Ugb2YgYWN0aW9uIGlzIGdvaW5nIHRvIGJlIHRvIG1vdmUgdGhlIGJsb2NrIGJhY2sgZG93bgo+
IGFnYWluIGFmdGVyIG15IGNoYW5nZSAoaG9wZWZ1bGx5KSB3ZW50IGluLCBtb3ZpbmcgdGhlIG9u
ZQo+IHJlbWFpbmluZyBhcy1vcHRpb24tYWRkIHBhc3QgaXQgYXQgdGhlIHNhbWUgdGltZS4KCkFz
IGxvbmcgYXMgYXNzZW1ibGVyIG9wdGlvbnMvZmVhdHVyZXMgYXJlIGNoZWNrZWQgZm9yIGFmdGVy
IHdoZXRoZXIKdGhlIGludGVybmFsIGFzc2VtYmxlciBpcyBzdWl0YWJsZSBvciBub3QgaGFzIGJl
ZW4gdGVzdGVkIGl0IHNob3VsZCBiZQpmaW5lLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
