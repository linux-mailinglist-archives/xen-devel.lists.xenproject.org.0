Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFDEC3195
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:38:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFUH-0004O5-AG; Tue, 01 Oct 2019 10:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIsb=X2=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iFFUG-0004O0-7G
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:34:32 +0000
X-Inumbo-ID: 0d52b5b6-e437-11e9-97fb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 0d52b5b6-e437-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926071;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=u7FMYIfN5ICNsYl4WqIFXuugDnERaq4tT1+D9XnKapk=;
 b=E8o7Llv+H32LD9fCsyDA/bJvG38T/JzUnAnSbB9DOzn0V2EkYvtWX0tG
 eKDb36OZ+iPj9vAotmcoF52BS8IgPdtKic5mwxHI84fJRXpl1kbht5yDt
 y7ifmc4dkhlforlPgEWTX67iQbk2DPLTqQLa1uH0Seqyhsvp2NVM2F8a1 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2R+StLSOBVUNMCmWEtWC0iNJvUEVCLDJpRZa/q8LkJBcdbXzKDvEHAC88qJZza4H/Bnj3labLM
 /BtJh+gIeT1NSuoxLm/KL2IawN7DrSblJDCJtaaK/AsE46JlYIcLfx6kQiHNfGLOQjrjF6Dfjc
 t66q49DIYcYlssUNdqEEKVWNHRxQtK7KlOCbUJGaUcoPkqv7KeK8RKPQoMzc9uz9QaUOTdCnMN
 4mfu1Dn1KKaIro+wgtw1rqgjvgvDRP/ik1VYSDG6DpxyT8UVwM9H/l2kQFXxqMjteIkQwAa42q
 Tkc=
X-SBRS: 2.7
X-MesageID: 6369397
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6369397"
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
 <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
Date: Tue, 1 Oct 2019 11:34:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMS8xOSAxMToyNCBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDAxIE9jdG9iZXIgMjAxOSAxMToxNQo+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUKPj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBXZWkgTGl1Cj4+
IDx3bEB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEz
XSB4ODYvbW06IGRvbid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24KPj4KPj4gT24gMDEuMTAu
MjAxOSAxMTozNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNl
bnQ6IDAxIE9jdG9iZXIgMjAxOSAxMDoxOQo+Pj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPgo+Pj4+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgUm9n
ZXIgUGF1Cj4+Pj4gTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBXZWkKPj4g
TGl1Cj4+Pj4gPHdsQHhlbi5vcmc+Cj4+Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SC1mb3ItNC4xM10geDg2L21tOiBkb24ndCBuZWVkbGVzc2x5IHZldG8gbWlncmF0aW9uCj4+Pj4K
Pj4+PiBPbiAwMS4xMC4yMDE5IDEwOjUyLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+Pj4+Pj4gU2VudDogMDEgT2N0b2JlciAyMDE5IDA5OjQ2Cj4+Pj4+PiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPj4+Pj4+IENjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPj4+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEp1ZXJnZW4gR3Jvc3MK
Pj4gPGpncm9zc0BzdXNlLmNvbT47Cj4+Pj4gV2VpCj4+Pj4+PiBMaXUgPHdsQHhlbi5vcmc+Cj4+
Pj4+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENILWZvci00LjEzXSB4ODYvbW06IGRv
bid0IG5lZWRsZXNzbHkgdmV0byBtaWdyYXRpb24KPj4+Pj4+Cj4+Pj4+PiBPbiAwMS4xMC4yMDE5
IDEwOjI4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+Pj4gTm93IHRoYXQgeGwuY2ZnIGhhcyBh
biBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9NTVUgbWFwcGluZ3MgZm9yIGEKPj4+Pj4+
PiBkb21haW4sIG1pZ3JhdGlvbiBtYXkgYmUgbmVlZGxlc3NseSB2ZXRvZWQgZHVlIHRvIHRoZSBj
aGVjayBvZgo+Pj4+Pj4+IGlzX2lvbW11X2VuYWJsZWQoKSBpbiBwYWdpbmdfbG9nX2RpcnR5X2Vu
YWJsZSgpLgo+Pj4+Pj4+IFRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQgdG8gcHJldmVudCBsb2dk
aXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNzCj4+Pj4+Pj4gZGV2aWNlcyBhcmUgYXNzaWdu
ZWQgdG8gYSBkb21haW4gYW5kIHRoYXQgZG9tYWluIGlzIHNoYXJpbmcgSEFQIG1hcHBpbmdzCj4+
Pj4+Pj4gd2l0aCB0aGUgSU9NTVUgKGluIHdoaWNoIGNhc2UgZGlzYWJsaW5nIHdyaXRlIHBlcm1p
c3Npb25zIGluIHRoZSBQMk0gbWF5Cj4+Pj4+Pj4gY2F1c2UgRE1BIGZhdWx0cykuCj4+Pj4+Pgo+
Pj4+Pj4gQnV0IHRoYXQncyB0YWtpbmcgaW50byBhY2NvdW50IG9ubHkgaGFsZiBvZiB0aGUgcmVh
c29uIG9mIHRoZQo+Pj4+Pj4gZXhjbHVzaW9uLiBUaGUgb3RoZXIgaGFsZiBpcyB0aGF0IGFzc2ln
bmVkIGRldmljZXMgbWF5IGNhdXNlIHBhZ2VzCj4+Pj4+PiB0byBiZSBkaXJ0aWVkIGJlaGluZCB0
aGUgYmFjayBvZiB0aGUgbG9nLWRpcnR5IGxvZ2ljLgo+Pj4+Pgo+Pj4+PiBCdXQgdGhhdCdzIG5v
IHJlYXNvbiB0byB2ZXRvIGxvZ2RpcnR5LiBTb21lIGRldmljZXMgaGF2ZSBkcml2ZXJzIChpbiBk
b20wKQo+Pj4+PiB3aGljaCBjYW4gZXh0cmFjdCBETUEgZGlydHlpbmcgaW5mb3JtYXRpb24gYW5k
IHNldCBkaXJ0eSB0cmFja2luZwo+Pj4+PiBpbmZvcm1hdGlvbiBhcHByb3ByaWF0ZWx5Lgo+Pj4+
Cj4+Pj4gSXQgc3RpbGwgbmVlZHMgYSBwb3NpdGl2ZSBpZGVudGlmaWNhdGlvbiB0aGVuOiBTdWNo
IGRyaXZlcnMgc2hvdWxkIHRlbGwKPj4+PiBYZW4gZm9yIHdoaWNoIHNwZWNpZmljIGRldmljZXMg
c3VjaCBpbmZvcm1hdGlvbiBpcyBnb2luZyB0byBiZSBwcm92aWRlZC4KPj4+Cj4+PiBXaHkgZG9l
cyB0aGUgaHlwZXJ2aXNvciBuZWVkIGhhdmUgdGhlIHJpZ2h0IG9mIHZldG8gdGhvdWdoPyBTdXJl
bHkgaXQgaXMKPj4+IHRoZSB0b29sc3RhY2sgdGhhdCBzaG91bGQgZGVjaWRlIHdoZXRoZXIgYSBW
TSBpcyBtaWdyYXRhYmxlIGluIHRoZQo+Pj4gcHJlc2VuY2Ugb2YgYXNzaWduZWQgaC93LiBYZW4g
bmVlZCBvbmx5IGJlIGNvbmNlcm5lZCB3aXRoIHRoZSBpbnRlZ3JpdHkKPj4+IG9mIHRoZSBob3N0
LCB3aGljaCBpcyB3aHkgdGhlIGNoZWNrIGZvciBFVFAgc2hhcmluZyByZW1haW5zLgo+Pgo+PiBX
aGlsZSB0aGUgdG9vbCBzdGFjayBpcyB0byBkZWNpZGUsIHRoZSBoeXBlcnZpc29yIGlzIGV4cGVj
dGVkIHRvIGd1YXJhbnRlZQo+PiBjb3JyZWN0IGRhdGEgY29taW5nIGJhY2sgZnJvbSBYRU5fRE9N
Q1RMX1NIQURPV19PUF97UEVFSyxDTEVBTn0uCj4gCj4gRm9yIHNvbWUgZGVmaW5pdGlvbiBvZiAn
Y29ycmVjdCcsIHllcywgYW5kIEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGNoYW5nZSB2aW9sYXRl
cyBhbnkgZGVmaW5pdGlvbiBJIGNhbiBmaW5kIGluIHRoZSBkb21jdGwgaGVhZGVyLgo+IAo+IE5v
dGU6IHRoZXJlIGFyZSBhbHJlYWR5IGVtdWxhdG9ycyB0aGF0IHdpbGwgYmUgcGxheWluZyB3aXRo
IHRoZSBkaXJ0eSBtYXAgb24gYW4gYXJiaXRyYXJ5IGFuZCB1bnN5bmNocm9uaXplZCBiYXNpcyBi
ZWNhdXNlIHRoZXkgYXJlIGVtdWxhdGluZyBidXMgbWFzdGVyaW5nIGgvdy4KCkJ1dCB0aGUgcXVl
c3Rpb24gaXMsIGRvIHdlIHdhbnQgdGhlIHRvb2xzdGFjayB0byBoYXZlIHRvIGJlY29tZSBhbgpl
eHBlcnQgaW4gd2hhdCBoYXJkd2FyZSBtaWdodCBoYXZlIGV4dGVybmFsIGRpcnR5IHRyYWNraW5n
LCBhbmQgd2hldGhlcgpzdWNoIHRyYWNraW5nIGlzIGFjdGl2ZT8gIEF0IHRoZSBtb21lbnQgdGhh
dCB3b3VsZCBtZWFuIGVpdGhlciAxKQpwdXR0aW5nIHRoYXQgaW5mb3JtYXRpb24gaW5zaWRlIG9m
IGxpYnhjLCBvciAyKSBkdXBsaWNhdGluZyBpdCBhY3Jvc3MKeGFwaSBhbmQgbGlieGwsIGZvciBp
bnN0YW5jZS4KCk9uZSB0aGluZyB3ZSBjb3VsZCBpbWFnaW5lIGlzIHRoYXQgd2hlbiBzcGVjaWZp
YyBkZXZpY2VzIGhhdmUgYW4gYWN0aXZlCmVtdWxhdG9yIChvciB3aGF0ZXZlcikgcHJvcGFnYXRp
bmcgdGhlIGRpcnR5IGluZm9ybWF0aW9uLCBmb3IgdGhhdCBjb2RlCnRvIHRlbGwgWGVuLCAiSSBh
bSBpbXBsZW1lbnRpbmcgZGlydHkgdHJhY2tpbmcgZm9yIHRoaXMgZGV2aWNlIi4gIFRoZW4Kd2hl
biB0aGUgdG9vbHN0YWNrIGVuYWJsZXMgbG9nZGlydHksIHRoZSBjaGVjayBjYW4gYmUsICJBcmUg
dGhlcmUgYW55CmRldmljZXMgKnRoYXQgZG9uJ3QgaGF2ZSBleHRlcm5hbCBkaXJ0eSB0cmFja2lu
ZyBlbmFibGVkKiBhc3NpZ25lZCB0bwp0aGUgZ3Vlc3Q/IgoKIC1HZW9yZ2UKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
