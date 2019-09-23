Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA974BB195
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKrG-0004CI-GQ; Mon, 23 Sep 2019 09:42:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0fYd=XS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCKrF-0004CD-AO
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:42:13 +0000
X-Inumbo-ID: 6a38dece-dde6-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a38dece-dde6-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 09:42:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 537FFAF55;
 Mon, 23 Sep 2019 09:42:10 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
 <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9d1c6e2b-fc3d-ad28-580b-cbfbb83d93e1@suse.com>
Date: Mon, 23 Sep 2019 11:42:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Regression with vcpu runstate info and
 XEN_RUNSTATE_UPDATE
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 SergeyDyasli <sergey.dyasli@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMTkgMTc6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE2LjA5LjIwMTkgMTY6
NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEFmdGVyIGEgY29tcGxpY2F0ZWQgaW52ZXN0aWdh
dGlvbiwgaXQgdHVybnMgb3V0IHRoYXQgYy9zIDI1MjljODUwZWE0OAo+PiBicm9rZSB4Y192Y3B1
X2dldGluZm8oKS4KPj4KPj4gVGhlIGJ1ZyBsb29rcyBhcyBpZiBpdCBpcyBpbiB2Y3B1X3J1bnN0
YXRlX2dldCgpLCB3aGljaCBkb2Vzbid0IGFjY291bnQKPj4gZm9yIFhFTl9SVU5TVEFURV9VUERB
VEUgYW5kIGNhbGN1bGF0aW5nIGEgd2lsZGx5IGluYXBwcm9wcmlhdGUgZGVsdGEuCj4+IFVsdGlt
YXRlbHksIHRoZSByZXN1bHQgb2YgWEVOX0RPTUNUTF9nZXR2Y3B1aW5mbyBlbmRzIHVwIHZlcnkK
Pj4gb2NjYXNpb25hbGx5IHdpdGggb3AtPnUuZ2V0dmNwdWluZm8uY3B1X3RpbWUgYmVpbmcgd3Jv
bmcgYnkgMSA8PCA2My4KPj4KPj4gR2l2ZW4gc29tZSBvZiB0aGUgY2FsbGVycyBvZiB2Y3B1X3J1
bnN0YXRlX2dldCgpLCBJIGRvbid0IHRoaW5rIGl0IGlzCj4+IHJlYXNvbmFibGUgdG8gcGF1c2Ug
dGhlIFZDUFUgd2hpbGUgcmVhZGluZyB0aGUgcnVuc3RhdGUgaW5mby7CoCBIb3dldmVyLAo+PiBp
dCBpcyBhbHNvIHVuY2xlYXIgd2hldGhlciB3YWl0aW5nIGZvciBYRU5fUlVOU1RBVEVfVVBEQVRF
IHRvIGRyb3AgaW4KPj4gdmNwdV9ydW5zdGF0ZV9nZXQoKSBpcyBzYWZlIGVpdGhlci4KPiAKPiBG
aXJzdCBhbmQgZm9yZW1vc3QgSSdtIHdvbmRlcmluZyB3aGV0aGVyIHNpbXBseSBtYXNraW5nIG9m
Zgo+IFhFTl9SVU5TVEFURV9VUERBVEUgaW4gdmNwdV9ydW5zdGF0ZV9nZXQoKSB3b3VsZG4ndCBi
ZSBhbgo+IG9wdGlvbi4gVGhlIGFzc3VtcHRpb24gb2YgdGhlIGZlYXR1cmUgYXMgYSB3aG9sZSBp
cyBmb3IgdGhlCj4gaGlnaCBiaXQgdG8gbmV2ZXIgYmUgc2V0IGluIGFuIGFjdHVhbCB0aW1lIHZh
bHVlLCBhZnRlciBhbGwuCj4gCj4gVGhlIG90aGVyIG9wdGlvbiBJJ2Qgc2VlIGlzIGZvciB2Y3B1
X3J1bnN0YXRlX2dldCgpIHRvIGdhaW4KPiBhIGJvb2xlYW4gcmV0dXJuIHR5cGUgYnkgd2hpY2gg
aXQgd291bGQgaW5kaWNhdGUgdG8KPiBpbnRlcmVzdGVkIGNhbGxlcnMgd2hldGhlciB0aGUgbGF0
Y2hpbmcgb2YgdGhlIHZhbHVlcwo+IGhhcHBlbmVkIHdoaWxlIGFuIHVwZGF0ZSB3YXMgaW4gcHJv
Z3Jlc3MgZWxzZXdoZXJlLiBDYWxsZXJzCj4gbmVlZGluZyB0byBjb25zdW1lIHRoZSBwb3RlbnRp
YWxseSBpbmNvcnJlY3QgcmVzdWx0IGNvdWxkCj4gdGhlbiBjaG9vc2UgdG8gd2FpdCBvciBzY2hl
ZHVsZSBhIGh5cGVyY2FsbCBjb250aW51YXRpb24uCj4gCj4gVGhlIDNyZCBvcHRpb24gKGxlc3Mg
ZGVzaXJhYmxlIGltbyBub3QgdGhlIGxlYXN0IGJlY2F1c2UgaXQKPiB3b3VsZCByZXF1aXJlIHRv
dWNoaW5nIGFsbCBjYWxsZXJzKSB3b3VsZCBiZSBmb3IgdGhlIGZ1bmN0aW9uCj4gdG8gZ2FpbiBh
IHBhcmFtZXRlciB0ZWxsaW5nIGl0IHdoZXRoZXIgdG8gc3BpbiB1bnRpbAo+IFhFTl9SVU5TVEFU
RV9VUERBVEUgaXMgb2JzZXJ2ZWQgY2xlYXIuCgpBbmQgdGhlIDR0aCBvcHRpb24gd291bGQgYmUg
dG8gbGV0IHZjcHVfcnVuc3RhdGVfZ2V0KCkgb3BlcmF0ZSBvbiBhCmxvY2FsIHJ1bnN0YXRlIGNv
cHkgaW4gb3JkZXIgdG8gYXZvaWQgc2V0dGluZyBYRU5fUlVOU1RBVEVfVVBEQVRFIGluCnRoZSAi
b2ZmaWNpYWwiIHJ1bnN0YXRlIGluZm8gb2YgdGhlIHZjcHUuCgoKSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
