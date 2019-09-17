Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C9B5100
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAF2A-0007OW-5q; Tue, 17 Sep 2019 15:04:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAF28-0007Ny-Ro
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 15:04:48 +0000
X-Inumbo-ID: 7d337fea-d95c-11e9-9618-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d337fea-d95c-11e9-9618-12813bfff9fa;
 Tue, 17 Sep 2019 15:04:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF85CB6AA;
 Tue, 17 Sep 2019 15:04:46 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <7a5adec2-4134-9617-555c-3dd2adf140ac@suse.com>
 <b1f9bb69-5fe5-69b8-0dce-93d13f363b0a@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5fe3bf07-31e7-12c8-ad2b-0fb1fe15c226@suse.com>
Date: Tue, 17 Sep 2019 17:04:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b1f9bb69-5fe5-69b8-0dce-93d13f363b0a@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxNzowMCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gVGhl
cmUgaXMgbm8gcHJvYmxlbSwgSSB1bmRlcnN0YW5kIHRoZSByaXNrIG9mIGhhdmluZyBzdXNwaWNp
b3VzIHJldHVybiAKPiB2YWx1ZXMuIEkgYW0gbm90IGhhbmdlZCBvbiBoYXZpbmcgdGhpcyByZXR1
cm4uIEkgdXNlZCB0aGlzIHRvIHNraXAgCj4gYWRkaW5nIGEgbmV3IHJldHVybiB2YWx1ZS4gSSBj
YW4gZG8gdGhpcyBpZiB3ZSBhZ3JlZSBvbiBhIHN1aXRhYmxlIG5hbWUgCj4gZm9yIGEgbmV3IHJl
dHVybiB2YWx1ZSBpbiBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQuIEkgY2FuIHByb3Bvc2Ug
Cj4gSFZNVFJBTlNfYmFkX2dmbl9hY2Nlc3MuCgpIb3cgaW50cnVzaXZlIHdvdWxkIHN1Y2ggYSBj
aGFuZ2UgYmU/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
