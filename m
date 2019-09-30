Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F290C1FA3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtLn-0006z4-PP; Mon, 30 Sep 2019 10:56:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtLm-0006yy-I5
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:56:18 +0000
X-Inumbo-ID: ed45e44e-e370-11e9-96ce-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ed45e44e-e370-11e9-96ce-12813bfff9fa;
 Mon, 30 Sep 2019 10:56:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 853E6AC7B;
 Mon, 30 Sep 2019 10:56:16 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
 <e8b69bec-d9e2-8803-bc0a-4c3c315f97f2@suse.com>
 <9fca36ed-4090-8e35-1aec-2273dc74ab8d@citrix.com>
 <60f98176-cfd7-460e-f5f8-05f263403bfa@suse.com>
 <f9af41cc-ef7c-e4ba-5af6-da4f27dc536c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbe98480-6929-d97a-07d4-851d82b304ca@suse.com>
Date: Mon, 30 Sep 2019 12:56:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9af41cc-ef7c-e4ba-5af6-da4f27dc536c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/19] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMjo0MiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAzMC4wOS4xOSAx
MjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDMwLjA5LjIwMTkgMTI6MzgsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAzMC8wOS8yMDE5IDExOjM2LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAzMC4wOS4yMDE5IDA3OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBXaGVu
IHN3aXRjaGluZyBzY2hlZCB1bml0cyBzeW5jaHJvbml6ZSBhbGwgdmNwdXMgb2YgdGhlIG5ldyB1
bml0IHRvIGJlCj4+Pj4+IHNjaGVkdWxlZCBhdCB0aGUgc2FtZSB0aW1lLgo+Pj4+Pgo+Pj4+PiBB
IHZhcmlhYmxlIHNjaGVkX2dyYW51bGFyaXR5IGlzIGFkZGVkIHdoaWNoIGhvbGRzIHRoZSBudW1i
ZXIgb2YgdmNwdXMKPj4+Pj4gcGVyIHNjaGVkdWxlIHVuaXQuCj4+Pj4+Cj4+Pj4+IEFzIHRhc2ts
ZXRzIHJlcXVpcmUgdG8gc2NoZWR1bGUgdGhlIGlkbGUgdW5pdCBpdCBpcyByZXF1aXJlZCB0byBz
ZXQgdGhlCj4+Pj4+IHRhc2tsZXRfd29ya19zY2hlZHVsZWQgcGFyYW1ldGVyIG9mIGRvX3NjaGVk
dWxlKCkgdG8gdHJ1ZSBpZiBhbnkgY3B1Cj4+Pj4+IGNvdmVyZWQgYnkgdGhlIGN1cnJlbnQgc2No
ZWR1bGUoKSBjYWxsIGhhcyBhbnkgcGVuZGluZyB0YXNrbGV0IHdvcmsuCj4+Pj4+Cj4+Pj4+IEZv
ciBqb2luaW5nIG90aGVyIHZjcHVzIG9mIHRoZSBzY2hlZHVsZSB1bml0IHdlIG5lZWQgdG8gYWRk
IGEgbmV3Cj4+Pj4+IHNvZnRpcnEgU0NIRURfU0xBVkVfU09GVElSUSBpbiBvcmRlciB0byBoYXZl
IGEgd2F5IHRvIGluaXRpYXRlIGEKPj4+Pj4gY29udGV4dCBzd2l0Y2ggd2l0aG91dCBjYWxsaW5n
IHRoZSBnZW5lcmljIHNjaGVkdWxlKCkgZnVuY3Rpb24KPj4+Pj4gc2VsZWN0aW5nIHRoZSB2Y3B1
IHRvIHN3aXRjaCB0bywgYXMgd2UgYWxyZWFkeSBrbm93IHdoaWNoIHZjcHUgd2UKPj4+Pj4gd2Fu
dCB0byBydW4uIFRoaXMgaGFzIHRoZSBvdGhlciBhZHZhbnRhZ2Ugbm90IHRvIGxvb3NlIGFueSBv
dGhlcgo+Pj4+PiBjb25jdXJyZW50IFNDSEVEVUxFX1NPRlRJUlEgZXZlbnRzLgo+Pj4+Pgo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+IFJl
dmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+Pj4+IHg4NiBh
bmQgYXBwbGljYWJsZSBjb21tb24gY29kZSBwYXJ0cwo+Pj4+IEFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4KPj4+PiBIb3dldmVyLCAuLi4KPj4+Pgo+Pj4+PiAr
c3RhdGljIHZvaWQgc2NoZWRfY29udGV4dF9zd2l0Y2goc3RydWN0IHZjcHUgKnZwcmV2LCBzdHJ1
Y3QgdmNwdSAqdm5leHQsCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
X3RpbWVfdCBub3cpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSh2cHJldiA9PSB2
bmV4dCkgKQo+Pj4+PiAgICAgICB7Cj4+Pj4+IC0gICAgICAgIHBjcHVfc2NoZWR1bGVfdW5sb2Nr
X2lycShsb2NrLCBjcHUpOwo+Pj4+PiAgICAgICAgICAgVFJBQ0VfNEQoVFJDX1NDSEVEX1NXSVRD
SF9JTkZDT05ULAo+Pj4+PiAtICAgICAgICAgICAgICAgICBuZXh0LT5kb21haW4tPmRvbWFpbl9p
ZCwgbmV4dC0+dW5pdF9pZCwKPj4+Pj4gLSAgICAgICAgICAgICAgICAgbm93IC0gcHJldi0+c3Rh
dGVfZW50cnlfdGltZSwKPj4+Pj4gLSAgICAgICAgICAgICAgICAgcHJldi0+bmV4dF90aW1lKTsK
Pj4+Pj4gLSAgICAgICAgdHJhY2VfY29udGludWVfcnVubmluZyhuZXh0LT52Y3B1X2xpc3QpOwo+
Pj4+PiAtICAgICAgICByZXR1cm4gY29udGludWVfcnVubmluZyhwcmV2LT52Y3B1X2xpc3QpOwo+
Pj4+PiArICAgICAgICAgICAgICAgICB2bmV4dC0+ZG9tYWluLT5kb21haW5faWQsIHZuZXh0LT5z
Y2hlZF91bml0LT51bml0X2lkLAo+Pj4+PiArICAgICAgICAgICAgICAgICBub3cgLSB2cHJldi0+
cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSwKPj4+Pj4gKyAgICAgICAgICAgICAgICAgdnByZXYt
PnNjaGVkX3VuaXQtPm5leHRfdGltZSk7Cj4+Pj4+ICsgICAgICAgIHNjaGVkX2NvbnRleHRfc3dp
dGNoZWQodnByZXYsIHZuZXh0KTsKPj4+Pj4gKyAgICAgICAgdHJhY2VfY29udGludWVfcnVubmlu
Zyh2bmV4dCk7Cj4+Pj4+ICsgICAgICAgIHJldHVybiBjb250aW51ZV9ydW5uaW5nKHZwcmV2KTsK
Pj4+Pj4gICAgICAgfQo+Pj4+IC4uLiBJIGRvbid0IHJlY2FsbCBpZiB0aGVyZSB3ZXJlbid0IGNv
bXBpbGVyIChjbGFuZz8pIHZlcnNpb25zIG5vdAo+Pj4+IGFsbG93aW5nIChvciBhdCBsZWFzdCB3
YXJuaW5nIGFib3V0KSB1c2Ugb2YgdGhpcyBleHRlbnNpb24uCj4+Pgo+Pj4gV2hpY2ggZXh0ZW5z
aW9uPwo+Pgo+PiAicmV0dXJuIiB3aXRoIGFuIGV4cHJlc3Npb24gb2YgInZvaWQiIHR5cGUuCj4g
Cj4gSXQgd2FzIHRoZXJlIGluIHRoZSBvcmlnaW5hbCBjb2RlLCB0b286Cj4gCj4gaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj14ZW4vY29tbW9uL3NjaGVk
dWxlLmM7aD1mZDU4NzYyMmY0YzNlZTEzZDU3MzM0ZjkwYjFlYWI0YjE3MDMxYzBiO2hiPXJlZnMv
aGVhZHMvc3RhZ2luZy00LjEyI2wxNTM2CgpPaCwgaW5kZWVkIC0gSSBtdXN0IGhhdmUgYmVlbiBi
bGluZDogSXQncyBhbHNvIHRoZXJlIGluIGNvbnRleHQgYWJvdmUsCmFtb25nIHRoZSBjb2RlIGJl
aW5nIHJlcGxhY2VkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
