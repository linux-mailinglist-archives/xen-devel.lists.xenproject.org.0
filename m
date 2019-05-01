Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D37105DB
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 09:22:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLjVg-0002mt-JY; Wed, 01 May 2019 07:18:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WEFG=TB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hLjVf-0002mo-EL
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 07:18:31 +0000
X-Inumbo-ID: 5188e907-6be1-11e9-843c-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5188e907-6be1-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 07:18:30 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 841343064498; Wed,  1 May 2019 10:18:28 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.158.85])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 24E21306E4AC;
 Wed,  1 May 2019 10:18:28 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20190501042249.1218-1-tamas@tklengyel.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <2924b458-c79d-0993-b54f-924fec1f0caf@bitdefender.com>
Date: Wed, 1 May 2019 10:17:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501042249.1218-1-tamas@tklengyel.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow
 value
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xLzE5IDc6MjIgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBDdXJyZW50bHkgdGhl
IGdzX3NoYWRvdyB2YWx1ZSBpcyBvbmx5IGNhY2hlZCB3aGVuIHRoZSB2Q1BVIGlzIGJlaW5nIHNj
aGVkdWxlZAo+IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1
ZSB0aHJvdWdoIHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPiBzaW5jZSBpdCBkb2Vzbid0IHJlcHJl
c2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRoZSBldmVudAo+
IHdhcyByZWNvcmRlZC4gVGhpcyBwcmV2ZW50cyB2bV9ldmVudCBzdWJzY3JpYmVycyBmcm9tIGNv
cnJlY3RseSBmaW5kaW5nIGtlcm5lbAo+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQg
aXMgdHJhcHBlZCB3aGlsZSBpbiByaW5nMy4KCklzbid0IHRoZSBWQ1BVIGFsd2F5cyBzY2hlZHVs
ZWQgb3V0IChzaW5jZSBpdCBpcyBwYXVzZWQpIHdpdGggc3luYwp2bV9ldmVudHM/IElzIHRoaXMg
YW4gYXN5bmMgZml4IG9ubHk/CgpJbiBhbnkgY2FzZSwKCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2Nh
cnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
