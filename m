Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C09F33308
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 17:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXoOV-0002lK-OJ; Mon, 03 Jun 2019 14:57:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SGpH=UC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hXoOT-0002l7-Qa
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:57:01 +0000
X-Inumbo-ID: d6761a5e-860f-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d6761a5e-860f-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 14:57:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B079830747CA; Mon,  3 Jun 2019 17:56:58 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 969AD306E477;
 Mon,  3 Jun 2019 17:56:58 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-5-git-send-email-andrew.cooper3@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <b9456f0c-af8c-a4de-73e0-db4a69240c3a@bitdefender.com>
Date: Mon, 3 Jun 2019 17:56:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559564728-17167-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH 4/5] xen/vm-event: Fix interactions with the
 vcpu list
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8zLzE5IDM6MjUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gdm1fZXZlbnRfcmVzdW1l
KCkgc2hvdWxkIHVzZSBkb21haW5fdmNwdSgpLCByYXRoZXIgdGhhbiBvcGVuY29kaW5nIGl0Cj4g
d2l0aG91dCBpdHMgU3BlY3RyZSB2MSBzYWZldHkuCj4gCj4gdm1fZXZlbnRfd2FrZV9ibG9ja2Vk
KCkgY2FuJ3QgZXZlciBiZSBpbnZva2VkIGluIGEgY2FzZSB3aGVyZSBkLT52Y3B1IGlzCj4gTlVM
TCwgc28gZHJvcCB0aGUgb3V0ZXIgaWYoKSBhbmQgcmVpbmRlbnQsIGZpeGluZyB1cCBzdHlsZSBp
c3N1ZXMuCj4gCj4gVGhlIGNvbW1lbnQsIHdoaWNoIGlzIGxlZnQgYWxvbmUsIGlzIGZhbHNlLiAg
VGhpcyBhbGdvcml0aG0gc3RpbGwgaGFzCj4gc3RhcnZhdGlvbiBpc3N1ZXMgd2hlbiB0aGVyZSBp
cyBhbiBhc3ltZXRyaWMgcmF0ZSBvZiBnZW5lcmF0ZWQgZXZlbnRzLgo+IAo+IEhvd2V2ZXIsIHRo
ZSBleGlzdGluZyBsb2dpYyBpcyBzdWZmaWNpZW50bHkgY29tcGxpY2F0ZWQgYW5kIGZyYWdpbGUg
dGhhdAo+IEkgZG9uJ3QgdGhpbmsgSSd2ZSBmb2xsb3dlZCBpdCBmdWxseSwgYW5kIGJlY2F1c2Ug
d2UncmUgdHJ5aW5nIHRvCj4gb2Jzb2xldGUgdGhpcyBpbnRlcmZhY2UsIHRoZSBzYWZlc3QgY291
cnNlIG9mIGFjdGlvbiBpcyB0byBsZWF2ZSBpdAo+IGFsb25lLCByYXRoZXIgdGhhbiB0byBlbmQg
dXAgbWFraW5nIHRoaW5ncyBzdWJ0bHkgZGlmZmVyZW50Lgo+IAo+IFRoZXJlZm9yZSwgbm8gcHJh
Y3RpY2FsIGNoYW5nZSB0aGF0IGNhbGxlcnMgd291bGQgbm90aWNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXI8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBS
YXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
