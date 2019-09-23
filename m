Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 699EFBB7EA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:30:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQEp-0003vj-NR; Mon, 23 Sep 2019 15:26:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCQEo-0003ve-8P
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:26:54 +0000
X-Inumbo-ID: 91e718b6-de16-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91e718b6-de16-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 15:26:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4FC6AB9B;
 Mon, 23 Sep 2019 15:26:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <14624609-019f-2993-261c-d4f45ce78cbe@suse.com>
 <20190923142253.dqvbg2tsfke3mmtc@Air-de-Roger>
 <db9b21f5-108b-eee4-692b-199d25c02b10@suse.com>
 <20190923151810.x2mxtbxr7hqmstns@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9008736e-4dde-ade4-1d4e-baa736ba97c2@suse.com>
Date: Mon, 23 Sep 2019 17:26:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923151810.x2mxtbxr7hqmstns@Air-de-Roger>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBT
ZXAgMjMsIDIwMTkgYXQgMDQ6NDE6MDFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDIzLjA5LjIwMTkgMTY6MjIsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVGh1LCBT
ZXAgMTksIDIwMTkgYXQgMDM6MjI6NTRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
UmF0aGVyIHRoYW4gZG9pbmcgdGhpcyBldmVyeSB0aW1lIHdlIHNldCB1cCBpbnRlcnJ1cHRzIGZv
ciBhIGRldmljZQo+Pj4+IGFuZXcgKGFuZCB0aGVuIGluIHNldmVyYWwgcGxhY2VzKSBmaWxsIHRo
aXMgaW52YXJpYW50IGZpZWxkIHJpZ2h0IGFmdGVyCj4+Pj4gYWxsb2NhdGluZyBzdHJ1Y3QgcGNp
X2Rldi4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPj4+Cj4+PiBMR1RNOgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4KPj4gVGhhbmtzLgo+Pgo+Pj4gSnVzdCBvbmUgbml0
IGJlbG93Lgo+Pj4KPj4+PiBAQCAtNzExLDcgKzcxMCw3IEBAIHN0YXRpYyBpbnQgbXNpX2NhcGFi
aWxpdHlfaW5pdChzdHJ1Y3QgcGMKPj4+PiAgCj4+Pj4gICAgICAgICAgLyogQWxsIE1TSXMgYXJl
IHVubWFza2VkIGJ5IGRlZmF1bHQsIE1hc2sgdGhlbSBhbGwgKi8KPj4+PiAgICAgICAgICBtYXNr
Yml0cyA9IHBjaV9jb25mX3JlYWQzMihkZXYtPnNiZGYsIG1wb3MpOwo+Pj4+IC0gICAgICAgIG1h
c2tiaXRzIHw9IH4odTMyKTAgPj4gKDMyIC0gbWF4dmVjKTsKPj4+PiArICAgICAgICBtYXNrYml0
cyB8PSB+KHUzMikwID4+ICgzMiAtIGRldi0+bXNpX21heHZlYyk7Cj4+Pgo+Pj4gR0VOTUFTSyB3
b3VsZCBiZSBzbGlnaHRseSBlYXNpZXIgdG8gcGFyc2UgSU1PIChoZXJlIGFuZCBiZWxvdykuCj4+
Cj4+IEJlc2lkZXMgdGhpcyBiZWluZyBhbiB1bnJlbGF0ZWQgY2hhbmdlLCBJJ20gYWZyYWlkIEkn
bSBnb2luZyB0bwo+PiBvYmplY3QgdG8gdXNlIG9mIGEgbWFjcm8gd2hlcmUgaXQncyB1bmNsZWFy
IHdoYXQgaXRzIHBhcmFtZXRlcnMKPj4gbWVhbjogRXZlbiB0aGUgZXhhbXBsZSBpbiB4ZW4vYml0
b3BzLmggaXMgc28gY29uZnVzaW5nIHRoYXQgSQo+PiBjYW4ndCB0ZWxsIHdoZXRoZXIgImgiIGlz
IG1lYW50IHRvIGJlIGV4Y2x1c2l2ZSBvciBpbmNsdXNpdmUKPj4gKGxvb2tzIGxpa2UgdGhlIGxh
dHRlciBpcyBpbnRlbmRlZCkuIFRvIG1lIHRoZSB0d28gcGFyYW1ldGVycwo+PiBhbHNvIGxvb2sg
cmV2ZXJzZWQgLSBJJ2QgZXhwZWN0ICJsb3ciIGZpcnN0IGFuZCAiaGlnaCIgc2Vjb25kLgo+PiAo
SVNUUiBoYXZpbmcgdm9pY2VkIHJlc2VydmF0aW9ucyBhZ2FpbnN0IGl0cyBpbnRyb2R1Y3Rpb24s
IGFuZAo+PiBJJ20gaGFwcHkgdG8gc2VlIHRoYXQgaXQncyB1c2VkIGluIEFybSBjb2RlIG9ubHku
KQo+IAo+IEknbSBub3Qgc3BlY2lhbGx5IHRyaWxsZWQgdG8gc3dpdGNoIHRvIEdFTk1BU0ssIGJ1
dCB3b3VsZCB5b3UgYmUKPiB3aWxsaW5nIHRvIGNoYW5nZSB1MzIgdG8gdWludDMyX3Q/CgpOb3Rp
Y2luZyB5b3VyIHJlbWFyaydzIGNvbnRleHQsIEkndmUgZG9uZSB0aGF0IGNoYW5nZSBhbHJlYWR5
IChhbmQKSSBkb24ndCBrbm93IHdoeSBJIG1pc3NlZCBkb2luZyBzbyByaWdodCBhd2F5KS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
