Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3842582BB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 14:40:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgTdi-00073K-SZ; Thu, 27 Jun 2019 12:36:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCrz=U2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgTdh-00073C-BR
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 12:36:33 +0000
X-Inumbo-ID: 30b5f1d3-98d8-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30b5f1d3-98d8-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 12:36:31 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vDRx+lnEmryJtjdFyCqyOdN45QUU4lLAKViiD0vd08g5/np6tFfZoMc0lwoMvBSnNAh49iM1qK
 fXv/GObJtOu1hSPB09X8r7DuOGAI/Eq9W3sNfeJY14VDu6DeikALu+957l86SrrM542wrNAi34
 kiOzhKyaA2dxrqEZf16bcM4nKRjzEvq7+FydC32wK9DuTTwRc+bJFdHpzMfLeBtMH36mcVAZyp
 8Gf+3rcd2soVv690a5uUrkNpwTPuaSjXAXdpz+DeplgucmIhR+/va2Lf6Q/DK4evtQWdJ9tLqs
 8mQ=
X-SBRS: 2.7
X-MesageID: 2297066
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2297066"
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <20190627093335.56355-3-roger.pau@citrix.com>
 <dd4c70a7-9680-7235-f39c-790536129a0a@citrix.com>
 <5D14B22B020000780023B8B6@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a2b06612-4b59-122d-9436-64ae5d0af973@citrix.com>
Date: Thu, 27 Jun 2019 13:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D14B22B020000780023B8B6@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDYvMjAxOSAxMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMDYuMTkg
YXQgMTM6NTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjcvMDYv
MjAxOSAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+Pj4gaW5kZXggOGE4ZDhm
MDYwZi4uOTRlNmM5YWVlMyAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+
Pj4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4+PiBAQCAtOTksOSArOTksMTQgQEAgZW5k
aWYKPj4+ICBzeW1zLXdhcm4tZHVwLXkgOj0gLS13YXJuLWR1cAo+Pj4gIHN5bXMtd2Fybi1kdXAt
JChDT05GSUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUykgOj0KPj4+ICAKPj4+
ICskKFRBUkdFVCk6IFRNUCA9ICQoQEQpLy4kKEBGKQo+PiBJJ2Qgc3VnZ2VzdCBnaXZpbmcgdGhp
cyBhIC5lbGYzMiBzdWZmaXggdG8gbWFrZSBpdCBjbGVhciB3aGljaCBwYXNzIG9mCj4+IHRoZSBi
dWlsZCBpdCBjb21lcyBmcm9tLgo+Pgo+Pj4gICQoVEFSR0VUKTogJChUQVJHRVQpLXN5bXMgJChl
ZmkteSkgYm9vdC9ta2VsZjMyCj4+PiAtCS4vYm9vdC9ta2VsZjMyICQobm90ZXNfcGhkcnMpICQo
VEFSR0VUKS1zeW1zICQoVEFSR0VUKSAkKFhFTl9JTUdfT0ZGU0VUKSBcCj4+PiArCS4vYm9vdC9t
a2VsZjMyICQobm90ZXNfcGhkcnMpICQoVEFSR0VUKS1zeW1zICQoVE1QKSAkKFhFTl9JTUdfT0ZG
U0VUKSBcCj4+PiAgCSAgICAgICAgICAgICAgIGAkKE5NKSAkKFRBUkdFVCktc3ltcyB8IHNlZCAt
bmUgJ3MvXlwoW14gXSpcKSAuIF9fMk1fcndkYXRhX2VuZCQkLzB4XDEvcCdgCj4+PiArCSMgQ2hl
Y2sgZm9yIG11bHRpYm9vdHsxLDJ9IGhlYWRlcnMKPj4+ICsJb2QgLXQgeDQgLU4gODE5MiAkKFRN
UCkgfCBncmVwIDFiYWRiMDAyID4gL2Rldi9udWxsIHx8Cj4+PiArCW9kIC10IHg0IC1OIDMyNzY4
ICQoVE1QKSB8IGdyZXAgZTg1MjUwZDYgPiAvZGV2L251bGwKPj4gVGhpcyB3b3JrcywgYnV0Cj4+
Cj4+IE1ha2VmaWxlOjEwNDogcmVjaXBlIGZvciB0YXJnZXQgJy9sb2NhbC94ZW4uZ2l0L3hlbi94
ZW4nIGZhaWxlZAo+Pgo+PiBJc24ndCBoZWxwZnVsIHRvIGlkZW50aWZ5IHdoYXQgd2VudCB3cm9u
Zy4gIFNhZGx5LCB3ZSBjYW4ndCB1c2UgJChlcnJvcgo+PiAuLi4pIGluIGEgc2hlbGwgc25pcHBl
dCwKPiBJIHRoaW5rIHdlIGNvdWxkOgo+Cj4gICAgICAgICQoaWYgJChzaGVsbCBvZCAtdCB4NCAt
TiA4MTkyICQoVE1QKSB8IGdyZXAgMWJhZGIwMDIpLCwkKGVycm9yIC4uLilleGl0IDEpCj4KPiBC
dXQgSSBhZG1pdCBJIGRpZG4ndCBjaGVjayB3aGV0aGVyIGl0IGlzIHdlbGwgZGVmaW5lZCB0aGF0
IG9ubHkgb25lIG9mCj4gdGhlIGxhc3QgdHdvIG9wZXJhbmRzIG9mICQoaWYgKSBnZXQgYWN0dWFs
bHkgZXZhbHVhdGVkLgoKT2YgdGhlIHR3byBvcHRpb25zLCBJIHRoaW5rIHRoZSB8fCB7IDsgZmFs
c2UgfSBpcyBjbGVhcmVyIHRvIGZvbGxvdy4KCj4KPj4gYnV0Ogo+Pgo+PiBhbmRyZXdjb29wQGFu
ZHJld2Nvb3A6L2xvY2FsL3hlbi5naXQveGVuJCBnaXQgZAo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4+IGluZGV4IDk0ZTZjOWFl
ZTMuLmExZDY2MDVhOGIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+PiAr
KysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPj4gQEAgLTk5LDEzICs5OSwxNCBAQCBlbmRpZgo+
PiAgc3ltcy13YXJuLWR1cC15IDo9IC0td2Fybi1kdXAKPj4gIHN5bXMtd2Fybi1kdXAtJChDT05G
SUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUykgOj0KPj4gIAo+PiAtJChUQVJH
RVQpOiBUTVAgPSAkKEBEKS8uJChARikKPj4gKyQoVEFSR0VUKTogVE1QID0gJChARCkvLiQoQEYp
LmVsZjMyCj4+ICAkKFRBUkdFVCk6ICQoVEFSR0VUKS1zeW1zICQoZWZpLXkpIGJvb3QvbWtlbGYz
Mgo+PiAgICAgICAgIC4vYm9vdC9ta2VsZjMyICQobm90ZXNfcGhkcnMpICQoVEFSR0VUKS1zeW1z
ICQoVE1QKSAkKFhFTl9JTUdfT0ZGU0VUKSBcCj4+ICAgICAgICAgICAgICAgICAgICAgICAgYCQo
Tk0pICQoVEFSR0VUKS1zeW1zIHwgc2VkIC1uZSAncy9eXChbXiBdKlwpIC4gX18yTV9yd2RhdGFf
ZW5kJCQvMHhcMS9wJ2AKPj4gLSAgICAgICAjIENoZWNrIGZvciBtdWx0aWJvb3R7MSwyfSBoZWFk
ZXJzCj4+IC0gICAgICAgb2QgLXQgeDQgLU4gODE5MiAkKFRNUCkgfCBncmVwIDFiYWRiMDAyID4g
L2Rldi9udWxsCj4+IC0gICAgICAgb2QgLXQgeDQgLU4gMzI3NjggJChUTVApIHwgZ3JlcCBlODUy
NTBkNiA+IC9kZXYvbnVsbAo+PiArICAgICAgIG9kIC10IHg0IC1OIDgxOTIgJChUTVApICB8IGdy
ZXAgMWJhZGIwMDIgPiAvZGV2L251bGwgfHwgXAo+PiArICAgICAgICAgICAgICAgeyBlY2hvICJO
byBNdWx0aWJvb3QxIGhlYWRlciBmb3VuZCI7IGZhbHNlOyB9Cj4+ICsgICAgICAgb2QgLXQgeDQg
LU4gMzI3NjggJChUTVApIHwgZ3JlcCBlODUyNTBkNiA+IC9kZXYvbnVsbCB8fCBcCj4+ICsgICAg
ICAgICAgICAgICB7IGVjaG8gIk5vIE11bHRpYm9vdDIgaGVhZGVyIGZvdW5kIjsgZmFsc2U7IH0K
Pj4gICAgICAgICBtdiAkKFRNUCkgJChUQVJHRVQpCj4+ICAKPj4gIEFMTF9PQkpTIDo9ICQoQkFT
RURJUikvYXJjaC94ODYvYm9vdC9idWlsdF9pbi5vIAo+PiAkKEJBU0VESVIpL2FyY2gveDg2L2Vm
aS9idWlsdF9pbi5vICQoQUxMX09CSlMpCj4+Cj4+IHJlc3VsdHMgaW46Cj4+Cj4+IE5vIE11bHRp
Ym9vdDEgaGVhZGVyIGZvdW5kCj4+IE1ha2VmaWxlOjEwNDogcmVjaXBlIGZvciB0YXJnZXQgJy9s
b2NhbC94ZW4uZ2l0L3hlbi94ZW4nIGZhaWxlZAo+PiBtYWtlWzJdOiAqKiogWy9sb2NhbC94ZW4u
Z2l0L3hlbi94ZW5dIEVycm9yIDEKPj4gTWFrZWZpbGU6MTM2OiByZWNpcGUgZm9yIHRhcmdldCAn
L2xvY2FsL3hlbi5naXQveGVuL3hlbicgZmFpbGVkCj4+IG1ha2VbMV06ICoqKiBbL2xvY2FsL3hl
bi5naXQveGVuL3hlbl0gRXJyb3IgMgo+PiBNYWtlZmlsZTo0NTogcmVjaXBlIGZvciB0YXJnZXQg
J2J1aWxkJyBmYWlsZWQKPj4gbWFrZTogKioqIFtidWlsZF0gRXJyb3IgMgo+Pgo+PiBXaGljaCBp
cyBmYXIgbW9yZSBjbGVhci4KPj4KPj4gVGhvdWdodHM/Cj4gR29vZCBpZGVhLiBUaGUgb25seSBm
dXJ0aGVyIHJlcXVlc3QgSSBoYXZlIGlzIHRvIGFkZCA+JjIgdG8gdGhlCj4gZWNobyBjb21tYW5k
cy4KCkRvbmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
