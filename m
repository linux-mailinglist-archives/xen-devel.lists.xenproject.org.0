Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EF58326
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 15:12:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgU93-0000wF-GG; Thu, 27 Jun 2019 13:08:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgU91-0000wA-8y
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 13:08:55 +0000
X-Inumbo-ID: b62dcf28-98dc-11e9-93a8-ffbba79d9691
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b62dcf28-98dc-11e9-93a8-ffbba79d9691;
 Thu, 27 Jun 2019 13:08:53 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dQyezhxtpN+vrPlnNNyou01y0Jyt+CGVd8HcM3He6YR0TubwAI0xYrnWrAY2OrcD5KmsiXDMNs
 vECEt4SB70kfNqre9Sdx2+CZUpkcc4pG8eAC9JGm34hxixP8s0WtQeTdtRPQG6JTIaAddddFgd
 15tsEmA7OFwI70o/A3kZfN/OZFJYvLnUnl85RjJS4jhQZ2lrK7r7JfFx0EFys3jwrV56Tez9Sg
 1pgJic5NIK54pXc+akUvFD3k85HC/nkKChxhQqOCWtwHHXbFjxxvp2+BkmSUasuvF+0yVC4qvn
 xKc=
X-SBRS: 2.7
X-MesageID: 2298858
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2298858"
Date: Thu, 27 Jun 2019 15:08:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190627130846.ewu4tpq7bzxxmz4g@MacBook-Air-de-Roger.local>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <20190627093335.56355-3-roger.pau@citrix.com>
 <dd4c70a7-9680-7235-f39c-790536129a0a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd4c70a7-9680-7235-f39c-790536129a0a@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86: check for multiboot{1,
 2} header presence
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTI6NTE6MDVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wNi8yMDE5IDEwOjMzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L01ha2VmaWxl
Cj4gPiBpbmRleCA4YThkOGYwNjBmLi45NGU2YzlhZWUzIDEwMDY0NAo+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L01ha2VmaWxlCj4gPiArKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiA+IEBAIC05
OSw5ICs5OSwxNCBAQCBlbmRpZgo+ID4gIHN5bXMtd2Fybi1kdXAteSA6PSAtLXdhcm4tZHVwCj4g
PiAgc3ltcy13YXJuLWR1cC0kKENPTkZJR19TVVBQUkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5J
TkdTKSA6PQo+ID4gIAo+ID4gKyQoVEFSR0VUKTogVE1QID0gJChARCkvLiQoQEYpCj4gCj4gSSdk
IHN1Z2dlc3QgZ2l2aW5nIHRoaXMgYSAuZWxmMzIgc3VmZml4IHRvIG1ha2UgaXQgY2xlYXIgd2hp
Y2ggcGFzcyBvZgo+IHRoZSBidWlsZCBpdCBjb21lcyBmcm9tLgoKVGhhdCdzIGZpbmUsIHBsZWFz
ZSBhbHNvIGFkanVzdCB0aGUgaWdub3JlZCBsaXN0IGFuZCB0aGUgY2xlYW4KdGFyZ2V0LgoKPiA+
ICAkKFRBUkdFVCk6ICQoVEFSR0VUKS1zeW1zICQoZWZpLXkpIGJvb3QvbWtlbGYzMgo+ID4gLQku
L2Jvb3QvbWtlbGYzMiAkKG5vdGVzX3BoZHJzKSAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChY
RU5fSU1HX09GRlNFVCkgXAo+ID4gKwkuL2Jvb3QvbWtlbGYzMiAkKG5vdGVzX3BoZHJzKSAkKFRB
UkdFVCktc3ltcyAkKFRNUCkgJChYRU5fSU1HX09GRlNFVCkgXAo+ID4gIAkgICAgICAgICAgICAg
ICBgJChOTSkgJChUQVJHRVQpLXN5bXMgfCBzZWQgLW5lICdzL15cKFteIF0qXCkgLiBfXzJNX3J3
ZGF0YV9lbmQkJC8weFwxL3AnYAo+ID4gKwkjIENoZWNrIGZvciBtdWx0aWJvb3R7MSwyfSBoZWFk
ZXJzCj4gPiArCW9kIC10IHg0IC1OIDgxOTIgJChUTVApIHwgZ3JlcCAxYmFkYjAwMiA+IC9kZXYv
bnVsbCB8fAo+ID4gKwlvZCAtdCB4NCAtTiAzMjc2OCAkKFRNUCkgfCBncmVwIGU4NTI1MGQ2ID4g
L2Rldi9udWxsCj4gCj4gVGhpcyB3b3JrcywgYnV0Cj4gCj4gTWFrZWZpbGU6MTA0OiByZWNpcGUg
Zm9yIHRhcmdldCAnL2xvY2FsL3hlbi5naXQveGVuL3hlbicgZmFpbGVkCj4gCj4gSXNuJ3QgaGVs
cGZ1bCB0byBpZGVudGlmeSB3aGF0IHdlbnQgd3JvbmcuwqAgU2FkbHksIHdlIGNhbid0IHVzZSAk
KGVycm9yCj4gLi4uKSBpbiBhIHNoZWxsIHNuaXBwZXQsIGJ1dDoKPiAKPiBhbmRyZXdjb29wQGFu
ZHJld2Nvb3A6L2xvY2FsL3hlbi5naXQveGVuJCBnaXQgZAo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiBpbmRleCA5NGU2YzlhZWUz
Li5hMWQ2NjA1YThiIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+IEBAIC05OSwxMyArOTksMTQgQEAgZW5kaWYKPiAgc3lt
cy13YXJuLWR1cC15IDo9IC0td2Fybi1kdXAKPiAgc3ltcy13YXJuLWR1cC0kKENPTkZJR19TVVBQ
UkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTKSA6PQo+ICAKPiAtJChUQVJHRVQpOiBUTVAg
PSAkKEBEKS8uJChARikKPiArJChUQVJHRVQpOiBUTVAgPSAkKEBEKS8uJChARikuZWxmMzIKPiAg
JChUQVJHRVQpOiAkKFRBUkdFVCktc3ltcyAkKGVmaS15KSBib290L21rZWxmMzIKPiAgICAgICAg
IC4vYm9vdC9ta2VsZjMyICQobm90ZXNfcGhkcnMpICQoVEFSR0VUKS1zeW1zICQoVE1QKSAkKFhF
Tl9JTUdfT0ZGU0VUKSBcCj4gICAgICAgICAgICAgICAgICAgICAgICBgJChOTSkgJChUQVJHRVQp
LXN5bXMgfCBzZWQgLW5lICdzL15cKFteIF0qXCkgLiBfXzJNX3J3ZGF0YV9lbmQkJC8weFwxL3An
YAo+IC0gICAgICAgIyBDaGVjayBmb3IgbXVsdGlib290ezEsMn0gaGVhZGVycwo+IC0gICAgICAg
b2QgLXQgeDQgLU4gODE5MiAkKFRNUCkgfCBncmVwIDFiYWRiMDAyID4gL2Rldi9udWxsCj4gLSAg
ICAgICBvZCAtdCB4NCAtTiAzMjc2OCAkKFRNUCkgfCBncmVwIGU4NTI1MGQ2ID4gL2Rldi9udWxs
Cj4gKyAgICAgICBvZCAtdCB4NCAtTiA4MTkyICQoVE1QKSAgfCBncmVwIDFiYWRiMDAyID4gL2Rl
di9udWxsIHx8IFwKPiArICAgICAgICAgICAgICAgeyBlY2hvICJObyBNdWx0aWJvb3QxIGhlYWRl
ciBmb3VuZCI7IGZhbHNlOyB9Cj4gKyAgICAgICBvZCAtdCB4NCAtTiAzMjc2OCAkKFRNUCkgfCBn
cmVwIGU4NTI1MGQ2ID4gL2Rldi9udWxsIHx8IFwKPiArICAgICAgICAgICAgICAgeyBlY2hvICJO
byBNdWx0aWJvb3QyIGhlYWRlciBmb3VuZCI7IGZhbHNlOyB9Cj4gICAgICAgICBtdiAkKFRNUCkg
JChUQVJHRVQpCj4gIAo+ICBBTExfT0JKUyA6PSAkKEJBU0VESVIpL2FyY2gveDg2L2Jvb3QvYnVp
bHRfaW4ubyAkKEJBU0VESVIpL2FyY2gveDg2L2VmaS9idWlsdF9pbi5vICQoQUxMX09CSlMpCj4g
Cj4gcmVzdWx0cyBpbjoKPiAKPiBObyBNdWx0aWJvb3QxIGhlYWRlciBmb3VuZAo+IE1ha2VmaWxl
OjEwNDogcmVjaXBlIGZvciB0YXJnZXQgJy9sb2NhbC94ZW4uZ2l0L3hlbi94ZW4nIGZhaWxlZAo+
IG1ha2VbMl06ICoqKiBbL2xvY2FsL3hlbi5naXQveGVuL3hlbl0gRXJyb3IgMQo+IE1ha2VmaWxl
OjEzNjogcmVjaXBlIGZvciB0YXJnZXQgJy9sb2NhbC94ZW4uZ2l0L3hlbi94ZW4nIGZhaWxlZAo+
IG1ha2VbMV06ICoqKiBbL2xvY2FsL3hlbi5naXQveGVuL3hlbl0gRXJyb3IgMgo+IE1ha2VmaWxl
OjQ1OiByZWNpcGUgZm9yIHRhcmdldCAnYnVpbGQnIGZhaWxlZAo+IG1ha2U6ICoqKiBbYnVpbGRd
IEVycm9yIDIKPiAKPiBXaGljaCBpcyBmYXIgbW9yZSBjbGVhci4KPiAKPiBUaG91Z2h0cz8KClRo
YW5rcywgaXMgaW5kZWVkIGJldHRlci4gSSBhbHNvIGFncmVlIHdpdGggSmFuIG9uIHRoZQpyZWRp
cmVjdGlvbiB0byBzdGRlcnIuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
