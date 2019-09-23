Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A150DBB8FA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 18:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQlf-0008FC-DZ; Mon, 23 Sep 2019 16:00:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCQld-0008F7-LS
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 16:00:49 +0000
X-Inumbo-ID: 4ee46dca-de1b-11e9-9602-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4ee46dca-de1b-11e9-9602-12813bfff9fa;
 Mon, 23 Sep 2019 16:00:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9543CAEFB;
 Mon, 23 Sep 2019 16:00:47 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
 <bf5b6218575445e1b278039ef793a3f6@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef57c67b-5707-a5f3-fae2-5776c7d8d4bf@suse.com>
Date: Mon, 23 Sep 2019 18:00:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bf5b6218575445e1b278039ef793a3f6@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/8] x86/PCI: read maximum MSI vector
 count early
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxNzo1NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4gU2VudDogMTkgU2Vw
dGVtYmVyIDIwMTkgMTQ6MjMKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
PiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+OyBTdXJhdmVlIFN1dGhpa3VscGFuaXQKPj4gPHN1cmF2ZWUuc3V0aGlrdWxw
YW5pdEBhbWQuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4g
U3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHY2IDMvOF0geDg2L1BDSTogcmVhZCBtYXhpbXVt
IE1TSSB2ZWN0b3IgY291bnQgZWFybHkKPj4KPj4gUmF0aGVyIHRoYW4gZG9pbmcgdGhpcyBldmVy
eSB0aW1lIHdlIHNldCB1cCBpbnRlcnJ1cHRzIGZvciBhIGRldmljZQo+PiBhbmV3IChhbmQgdGhl
biBpbiBzZXZlcmFsIHBsYWNlcykgZmlsbCB0aGlzIGludmFyaWFudCBmaWVsZCByaWdodCBhZnRl
cgo+PiBhbGxvY2F0aW5nIHN0cnVjdCBwY2lfZGV2Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpUaGFua3MuCgo+PiAtLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Ywo+PiBAQCAtMzQwLDYgKzM0MCwxNiBAQCBzdGF0aWMgc3RydWN0IHBjaV9kZXYgKmFsbG9jX3Bk
ZXYoc3RydWN0Cj4+ICAgICAgcGRldi0+ZG9tYWluID0gTlVMTDsKPj4gICAgICBJTklUX0xJU1Rf
SEVBRCgmcGRldi0+bXNpX2xpc3QpOwo+Pgo+PiArCj4gCj4gU3RyYXkgYmxhbmsgbGluZSBoZXJl
IGJ5IHRoZSBsb29rcyBvZiBpdC4KCk9oLCBpbmRlZWQgLSBkcm9wcGVkLgoKSmFuCgo+PiArICAg
IHBvcyA9IHBjaV9maW5kX2NhcF9vZmZzZXQocHNlZy0+bnIsIGJ1cywgUENJX1NMT1QoZGV2Zm4p
LCBQQ0lfRlVOQyhkZXZmbiksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lf
Q0FQX0lEX01TSSk7Cj4+ICsgICAgaWYgKCBwb3MgKQo+PiArICAgIHsKPj4gKyAgICAgICAgdWlu
dDE2X3QgY3RybCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBtc2lfY29udHJvbF9yZWco
cG9zKSk7Cj4+ICsKPj4gKyAgICAgICAgcGRldi0+bXNpX21heHZlYyA9IG11bHRpX21zaV9jYXBh
YmxlKGN0cmwpOwo+PiArICAgIH0KPj4gKwo+PiAgICAgIHBvcyA9IHBjaV9maW5kX2NhcF9vZmZz
ZXQocHNlZy0+bnIsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQ0FQX0lEX01TSVgpOwo+PiAgICAgIGlm
ICggcG9zICkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
