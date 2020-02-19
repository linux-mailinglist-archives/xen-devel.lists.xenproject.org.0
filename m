Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E6164DDD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 19:45:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4UIr-0008HE-S7; Wed, 19 Feb 2020 18:42:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4UIq-0008H9-NB
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 18:42:32 +0000
X-Inumbo-ID: 956a9aad-5347-11ea-8425-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 956a9aad-5347-11ea-8425-12813bfff9fa;
 Wed, 19 Feb 2020 18:42:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C0348B22A;
 Wed, 19 Feb 2020 18:42:30 +0000 (UTC)
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <87tv3mq1rm.fsf@nanos.tec.linutronix.de>
 <8808612b-11c2-f7b8-f027-7ff92e992c50@suse.com>
 <87h7zmpr1k.fsf@nanos.tec.linutronix.de>
 <878skypjrh.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a2dee352-409b-1c6b-e7f0-bcbbf5d71a95@suse.com>
Date: Wed, 19 Feb 2020 19:42:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <878skypjrh.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2] xen: Enable interrupts when calling
 _cond_resched()
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTg6MzAsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiB4ZW5fbWF5YmVfcHJl
ZW1wdF9oY2FsbCgpIGlzIGNhbGxlZCBmcm9tIHRoZSBleGNlcHRpb24gZW50cnkgcG9pbnQKPiB4
ZW5fZG9faHlwZXJ2aXNvcl9jYWxsYmFjayB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuCj4gCj4g
X2NvbmRfcmVzY2hlZCgpIGV2YWRlcyB0aGUgbWlnaHRfc2xlZXAoKSBjaGVjayBpbiBjb25kX3Jl
c2NoZWQoKSB3aGljaAo+IHdvdWxkIGhhdmUgY2F1Z2h0IHRoYXQgYW5kIHNjaGVkdWxlX2RlYnVn
KCkgdW5mb3J0dW5hdGVseSBsYWNrcyBhIGNoZWNrCj4gZm9yIGlycXNfZGlzYWJsZWQoKS4KPiAK
PiBFbmFibGUgaW50ZXJydXB0cyBhcm91bmQgdGhlIGNhbGwgYW5kIHVzZSBjb25kX3Jlc2NoZWQo
KSB0byBjYXRjaCBmdXR1cmUKPiBpc3N1ZXMuCj4gCj4gRml4ZXM6IGZkZmQ4MTFkZGRlMyAoIng4
Ni94ZW46IGFsbG93IHByaXZjbWQgaHlwZXJjYWxscyB0byBiZSBwcmVlbXB0ZWQiKQo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgoKUmV2aWV3ZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
