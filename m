Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C64DFCABE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 17:29:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVHxx-0003Fk-34; Thu, 14 Nov 2019 16:27:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vhcS=ZG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVHxv-0003Ff-EB
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 16:27:27 +0000
X-Inumbo-ID: a4c587ca-06fb-11ea-a250-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4c587ca-06fb-11ea-a250-12813bfff9fa;
 Thu, 14 Nov 2019 16:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573748846;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=JCXIC+/8FMXBYUKrjs+IL/pnsuXOQa1/txE2/BEHIFs=;
 b=Ec7CTjw/zre79pjl4K73z9GRvieAjLPDcIR08Zs71E6v+x7OoI7zFTYN
 SZJ8d+x0vePNPxErbpOPajOWTuzDKQwm8NhtWqKtA58uzj7Fe8MRjjKjl
 Fq5TON9imtG8gMl9dqZW8rW1Pqy4C8v5Y41KkB4m6C2kM+ORdlU3PzeJP w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VUvz6J/BJRQDxpn2LWvP71/ct83I02wQ19R0TRQrod73uJas9SxEVp668qf4CTAAUmsOwRyEHg
 XvJFqVelfUN4TP0jDk0jAre8kjl+//HYLDM3D0l83lGHCvgi2GTP5F1u0xnPd7NNHLWc9/b6Rv
 NEnYKfJsQtewTP7TWPHoTwe3z+IXIHZaahFPs/6GUHhtcidU4jAklgO750oE7+MJeMO9kQ94dv
 JVhy3dKcZWyfku3AOjIUSqbhTG5ziZklNMNPcNlIF8QDUyG/4ws/lerEkAD5vGxBYIwdS8tcl0
 RC0=
X-SBRS: 2.7
X-MesageID: 8694335
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8694335"
To: Jan Beulich <jbeulich@suse.com>, osstest service owner
 <osstest-admin@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <osstest-144091-mainreport@xen.org>
 <29c593c2-0621-4f93-5074-d2d568ead829@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dde4c3d2-9ffb-53fa-939e-726b242e05dc@citrix.com>
Date: Thu, 14 Nov 2019 16:27:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <29c593c2-0621-4f93-5074-d2d568ead829@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [xen-unstable test] 144091: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMTEvMjAxOSAxNjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMTEuMjAxOSAx
Njo1Miwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+PiBmbGlnaHQgMTQ0MDkxIHhlbi11
bnN0YWJsZSByZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MvMTQ0MDkxLwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0
cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LWRt
cmVzdHJpY3QtYW1kNjQtZG1yZXN0cmljdCAxMiBndWVzdC1zdGFydC9kZWJpYW5odm0ucmVwZWF0
IGZhaWwgUkVHUi4gdnMuIDE0NDA0Mgo+PiAgdGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0ZWQt
aW50ZWwgMTcgZGViaWFuLWh2bS1pbnN0YWxsL2wxL2wyIGZhaWwgUkVHUi4gdnMuIDE0NDA0Mgo+
IEkndmUgdGFrZW4gYW5vdGhlciBsb29rLCBhbmQgSSBub3cgdGhpbmsgdGhlIEwyIGd1ZXN0IGRv
ZXNuJ3QgZXZlbgo+IG1ha2UgaXQgdG8gdGhlIGJvb3Rsb2FkZXIuIFRha2luZyB0b2dldGhlcgo+
Cj4gKGQxKSBTZWFCSU9TICh2ZXJzaW9uIHJlbC0xLjEyLjEtMC1nYTVjYWI1OC1YZW4pCj4gKGQx
KSBCVUlMRDogZ2NjOiAoRGViaWFuIDYuMy4wLTE4K2RlYjl1MSkgNi4zLjAgMjAxNzA1MTYgYmlu
dXRpbHM6IChHTlUgQmludXRpbHMgZm9yIERlYmlhbikgMi4yOAo+IChkMSkgCj4gKGQxKSBGb3Vu
ZCBYZW4gaHlwZXJ2aXNvciBzaWduYXR1cmUgYXQgNDAwMDAwMDAKPiAoZDEpIFJ1bm5pbmcgb24g
UUVNVSAoaTQ0MGZ4KQo+IChkMSkgeGVuOiBjb3B5IGU4MjAuLi4KPiAoZDEpIFJlbG9jYXRpbmcg
aW5pdCBmcm9tIDB4MDAwZDdjMjAgdG8gMHgyZjdhYmQ4MCAoc2l6ZSA4MjQwMCkKPgo+IGFuZAo+
Cj4gKFhFTikgKioqKioqKioqKiogVk1DUyBBcmVhcyAqKioqKioqKioqKioqKgo+IChYRU4pIAo+
IChYRU4pID4+PiBEb21haW4gMSA8PDwKPiAoWEVOKSAJVkNQVSAwCj4gKFhFTikgKioqIEd1ZXN0
IFN0YXRlICoqKgo+IChYRU4pIENSMDogYWN0dWFsPTB4MDAwMDAwMDAwMDAwMDAzMSwgc2hhZG93
PTB4MDAwMDAwMDAwMDAwMDAxMSwgZ2hfbWFzaz1mZmZmZmZmZmZmZmZmZmZmCj4gKFhFTikgQ1I0
OiBhY3R1YWw9MHgwMDAwMDAwMDAwMDAyMDUwLCBzaGFkb3c9MHgwMDAwMDAwMDAwMDAwMDAwLCBn
aF9tYXNrPWZmZmZmZmZmZmZmOGY4NzAKPiAoWEVOKSBDUjMgPSAweDAwMDAwMDAwMDA0MDAwMDAK
PiAoWEVOKSBSU1AgPSAweDAwMDAwMDAwMDAwMDZmYTQgKDB4MDAwMDAwMDAwMDAwNmZhNCkgIFJJ
UCA9IDB4MDAwMDAwMDAyZjdiYTlmNCAoMHgwMDAwMDAwMDJmN2JhOWY0KQo+Cj4gYW5kIHNpbWls
YXJseSBpbiB0aGUgTDAgbG9nCj4KPiAoWEVOKSBSU1AgPSAweDAwMDAwMDAwMDAwMDZmYTQgKDB4
MDAwMDAwMDAwMDAwNmZhNCkgIFJJUCA9IDB4MDAwMDAwMDAyZjdiYTlmNCAoMHgwMDAwMDAwMDJm
N2JhOWY0KQo+Cj4gSSBpbnN0ZWFkIHRoaW5rIGl0J3Mgc3RpbGwgaW4gU2VhQklPUyBjb2RlLiBJ
J2xsIHNlZSBpZiBJIGNhbgo+IGRlcml2ZSB3aGVyZSBleGFjdGx5IGl0J3Mgc2l0dGluZy4gSW4g
YW55IGV2ZW50IHRoZSBtb3N0IHJlY2VudAo+IGV4aXQgcmVhc29uIHRvIEwwIHdhcyBFUFRfVklP
TEFUSU9OIHdpdGggYSBxdWFsaWZpY2F0aW9uIG9mIDB4MTljCj4gKGZldGNoLCBlZmZfcmVhZCwg
ZWZmX3dyaXRlLCBnbGFfdmFsaWQsIGdsYV9mYXVsdCksIHdoaWNoIEkgZG9uJ3QKPiB0aGluayB3
b3VsZCBhbGxvdyB0aGUgZ3Vlc3QgdG8gY29udGludWUgd2l0aG91dCBhbiBhZGp1c3RtZW50IHRv
Cj4gaXRzIEVQVCBwZXJtaXNzaW9ucy4KClRoYXQgZG9lcyBzb3VuZCBzdXNwaWNpb3VzbHkgbGlr
ZSBpdCBpcyBsaXZlLWxvY2tlZC7CoCBGb3Igb3JkZXI+MCwgaXQKc2hvdWxkIHRha2UgdGhlIHNo
YXR0ZXIgcGF0aCBhbmQgdHVybiBpbnRvIGEgNGsgbWFwcGluZyB3aXRoIGVmZl9leGVjCnJlZ2Fp
bmVkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
