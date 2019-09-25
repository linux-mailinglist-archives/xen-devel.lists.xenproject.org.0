Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8ABDE48
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6g9-0005km-1m; Wed, 25 Sep 2019 12:45:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD6g7-0005kh-4y
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:45:55 +0000
X-Inumbo-ID: 68dec392-df92-11e9-9630-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 68dec392-df92-11e9-9630-12813bfff9fa;
 Wed, 25 Sep 2019 12:45:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C6CAABC6;
 Wed, 25 Sep 2019 12:45:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <263f19db-be1a-f351-ae57-029475fd9c3a@suse.com>
Date: Wed, 25 Sep 2019 14:45:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 TimDeegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxMTo0MSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMjUsIDIwMTkgYXQgMDQ6NDE6MjZBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPj4gKysrIGIveGVuL2FyY2gv
eDg2L2lycS5jCj4+IEBAIC0yNTQsNyArMjU0LDggQEAgdm9pZCBfX2luaXQgY2xlYXJfaXJxX3Zl
Y3RvcihpbnQgaXJxKQo+PiAgLyoKPj4gICAqIER5bmFtaWMgaXJxIGFsbG9jYXRlIGFuZCBkZWFs
bG9jYXRpb24gZm9yIE1TSQo+PiAgICovCj4+IC1pbnQgY3JlYXRlX2lycShub2RlaWRfdCBub2Rl
KQo+PiArCj4gCj4gRXh0cmEgbmV3bGluZS4KPiAKPj4gK2ludCBjcmVhdGVfaXJxKG5vZGVpZF90
IG5vZGUsIGJvb2wgZ3JhbnRfYWNjZXNzKQo+PiAgewo+PiAgICAgIGludCBpcnEsIHJldDsKPj4g
ICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2M7CgpJIGRpZCBub3RpY2UgdGhpcyB0b28gKG9uIGFu
IGVhcmxpZXIgdmVyc2lvbiksIGFuZCBpdCB3YXMgbXkKdW5kZXJzdGFuZGluZyB0aGF0IHRoZSBh
ZGRpdGlvbiB3YXMgZGVsaWJlcmF0ZSAtIHRoZSBjb21tZW50CmlzIGZvciBtb3JlIHRoYW4ganVz
dCB0aGlzIG9uZSBmdW5jdGlvbi4gSSB3b3VsZG4ndCBpbnNpc3QKb24gZWl0aGVyIHZhcmlhbnQs
IGkuZS4gSSdtIGZpbmUgd2l0aCB0aGUgYmxhbmsgbGluZSBhZGRlZAphbmQgSSdtIGFsc28gZmlu
ZSB3aXRoIHRoZSBhZGRpdGlvbiBkcm9wcGVkIGFnYWluLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
