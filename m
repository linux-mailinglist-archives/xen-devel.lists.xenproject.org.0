Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15ACBFE3F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 06:44:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDi54-0006Zk-1S; Fri, 27 Sep 2019 04:42:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDi53-0006Zf-5M
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 04:42:09 +0000
X-Inumbo-ID: 28eb06b0-e0e1-11e9-966a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 28eb06b0-e0e1-11e9-966a-12813bfff9fa;
 Fri, 27 Sep 2019 04:42:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8773EAC0C;
 Fri, 27 Sep 2019 04:42:06 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-36-jgross@suse.com>
 <af34c647-ffec-48d5-64f3-7aa00a57fa35@suse.com>
 <95f6907a-9a82-38a9-7937-61286d552138@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <739bf431-90d3-018b-8282-191e0bf06fed@suse.com>
Date: Fri, 27 Sep 2019 06:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95f6907a-9a82-38a9-7937-61286d552138@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 35/47] xen/sched: make vcpu_wake() and
 vcpu_sleep() core scheduling aware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTU6MDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMjQuMDkuMTkgMTM6
NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNC4wOS4yMDE5IDEwOjUyLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gQEAgLTc2NSwxNiArNzc0LDIyIEBAIHZvaWQgdmNwdV93YWtlKHN0cnVj
dCB2Y3B1ICp2KQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+
Pj4gwqDCoMKgwqDCoCBzcGlubG9ja190ICpsb2NrOwo+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCA9IHYtPnNjaGVkX3VuaXQ7Cj4+PiDCoMKgwqDCoMKgIFRSQUNFXzJEKFRSQ19T
Q0hFRF9XQUtFLCB2LT5kb21haW4tPmRvbWFpbl9pZCwgdi0+dmNwdV9pZCk7Cj4+PiAtwqDCoMKg
IGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZSh2LT5zY2hlZF91bml0LCAmZmxhZ3Mp
Owo+Pj4gK8KgwqDCoCBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycXNhdmUodW5pdCwgJmZs
YWdzKTsKPj4+IMKgwqDCoMKgwqAgaWYgKCBsaWtlbHkodmNwdV9ydW5uYWJsZSh2KSkgKQo+Pj4g
wqDCoMKgwqDCoCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCB2LT5ydW5zdGF0ZS5zdGF0
ZSA+PSBSVU5TVEFURV9ibG9ja2VkICkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZj
cHVfcnVuc3RhdGVfY2hhbmdlKHYsIFJVTlNUQVRFX3J1bm5hYmxlLCBOT1coKSk7Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgc2NoZWRfd2FrZSh2Y3B1X3NjaGVkdWxlcih2KSwgdi0+c2NoZWRfdW5pdCk7
Cj4+PiArwqDCoMKgwqDCoMKgwqAgc2NoZWRfd2FrZSh2Y3B1X3NjaGVkdWxlcih2KSwgdW5pdCk7
Cj4+Cj4+IElzIHRoaXMgY29ycmVjdCAvIG5lY2Vzc2FyeSB3aGVuIHRoZSB1bml0IGlzIG5vdCBh
c2xlZXAgYXMgYSB3aG9sZT8KPj4gQWZ0ZXIgYWxsIHRoZSBjb3JyZXNwb25kaW5nIHNjaGVkX3Ns
ZWVwKCkgZnVydGhlciB1cCBpcyBjYWxsZWQKPj4gY29uZGl0aW9uYWxseSBvbmx5Lgo+IAo+IE9o
LCBpbmRlZWQuIFdpbGwgY2hhbmdlIHRoYXQuCgpJdCB0dXJuZWQgb3V0IHRoaXMgaXMgbm90IHNv
IGVhc3kgYXQgaXQgc2VlbWVkLgoKSSBlbmNvdW50ZXJlZCBkb20wIGJvb3QgaGFuZ3Mgd2l0aCBt
YWtpbmcgdGhlIGNhbGwgY29uZGl0aW9uYWwsIGV2ZW4Kd2hlbiBydW5uaW5nIGluIGNwdSBzY2hl
ZHVsaW5nIG1vZGUuIEkgZ3Vlc3MgdGhlIHJlYXNvbiBpcyB0aGF0IGEgdmNwdQpjYW4gY2FsbCBk
b19wb2xsKCkgd2hpY2ggd2lsbCB0cnkgdG8gcHV0IGl0c2VsZiB0byBzbGVlcCBhbmQgaW4gc29t
ZQpjYXNlcyBjYWxsIHZjcHVfd2FrZSgpIGluIGNhc2UgdGhlIGNvbmRpdGlvbiBhbHJlYWR5IGNo
YW5nZWQuIEluIHRoYXQKY2FzZSB3ZSBuZWVkIHRoZSBzY2hlZF93YWtlKCkgY2FsbCBldmVuIGlm
IHRoZSB1bml0IGlzIHN0aWxsIHJ1bm5pbmcuCgoKPj4+IEBAIC0yMDY3LDkgKzIxNjAsMjkgQEAg
c3RhdGljIHZvaWQgc2NoZWRfc2xhdmUodm9pZCkKPj4+IMKgwqDCoMKgwqAgbm93ID0gTk9XKCk7
Cj4+PiArwqDCoMKgIHYgPSB1bml0MnZjcHVfY3B1KHByZXYsIGNwdSk7Cj4+PiArwqDCoMKgIGlm
ICggdiAmJiB2LT5mb3JjZV9jb250ZXh0X3N3aXRjaCApCj4+PiArwqDCoMKgIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoCB2ID0gc2NoZWRfZm9yY2VfY29udGV4dF9zd2l0Y2godnByZXYsIHYsIGNwdSwg
bm93KTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHYgKQo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2ly
cShsb2NrLCBjcHUpOwo+Pgo+PiBJIGNhbid0IGZpZ3VyZSB3aGF0IGl0IGlzIHRoYXQgZ3VhcmFu
dGVlcyB0aGF0IHRoaXMgdW5sb2NrIGlzbid0Cj4+IGdvaW5nIHRvIGJlIGZvbGxvd2VkIC4uLgo+
Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWRfY29udGV4dF9zd2l0Y2godnByZXYs
IHYsIGZhbHNlLCBub3cpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqDC
oMKgwqDCoCBkb19zb2Z0aXJxID0gdHJ1ZTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gwqDCoMKg
wqDCoCBpZiAoICFwcmV2LT5yZW5kZXp2b3VzX2luX2NudCApCj4+PiDCoMKgwqDCoMKgIHsKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsK
Pj4KPj4gLi4uIGJ5IGFub3RoZXIgdW5sb2NrIGhlcmUuIE9yIHdhaXQgLSBpcyBzY2hlZF9jb250
ZXh0X3N3aXRjaCgpCj4+IChhbmQgcGVyaGFwcyBvdGhlciBmdW5jdGlvbnMgaW52b2x2ZWQgdGhl
cmUpIGxhY2tpbmcgYSAibm9yZXR1cm4iCj4+IGFubm90YXRpb24/Cj4gCj4gSW5kZWVkIGl0IGlz
LiBMaWtlIGNvbnRleHRfc3dpdGNoKCkgdG9kYXkuIDotKQo+IAo+IEknbGwgYW5ub3RhdGUgdGhl
IGZ1bmN0aW9ucy4KCkFuZCBub3cgSSBkaXNjb3ZlcmVkIHRoYXQgb24gQVJNIGNvbnRleHRfc3dp
dGNoIGlzIF9ub3RfICJub3JldHVybiIuClNvIHRoYW5rcyBmb3Igbm90aWNpbmcgdGhhdCBwcm9i
bGVtLiBJIGhhdmUgZml4ZWQgaXQgaW4gb3JkZXIgdG8KYXZvaWQgYSBsYXRlbnQgcHJvYmxlbSBp
biBjYXNlIHdlIHdhbnQgdG8gc3VwcG9ydCBjb3JlIHNjaGVkdWxpbmcgb24KQVJNIHNvbWUgZGF5
IChhbmQgeWVzOiB0aGF0IHdvdWxkIG9ubHkgaGF2ZSBiZWVuIGEgcHJvYmxlbSBpbiBjb3JlCm1v
ZGUpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
