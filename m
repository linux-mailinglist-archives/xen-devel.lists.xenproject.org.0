Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D90127EB8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:49:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJZI-0008Ej-7s; Fri, 20 Dec 2019 14:47:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJZG-0008ER-OU
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:47:50 +0000
X-Inumbo-ID: b1871dae-2337-11ea-9372-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1871dae-2337-11ea-9372-12813bfff9fa;
 Fri, 20 Dec 2019 14:47:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51196AE44;
 Fri, 20 Dec 2019 14:47:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
 <8be5ebf6-c710-e1de-12af-f87137b69c44@suse.com>
 <bcf40a51-eed4-a48d-8f7e-e3b10df504cd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25646dda-e5a4-eb58-714f-45cb192a31d4@suse.com>
Date: Fri, 20 Dec 2019 15:48:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bcf40a51-eed4-a48d-8f7e-e3b10df504cd@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] x86/mm: mod_l<N>_entry() have no need
 to use __copy_from_user()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8xMi8yMDE5
IDE0OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gbW9kX2wxX2VudHJ5KCkncyBuZWVkIHRvIGRv
IHNvIHdlbnQgYXdheSB3aXRoIGNvbW1pdCAyZDA1NTdjNWNiICgieDg2Ogo+PiBGb2xkIHBhZ2Vf
aW5mbyBsb2NrIGludG8gdHlwZV9pbmZvIiksIGFuZCB0aGUgb3RoZXIgdGhyZWUgbmV2ZXIgaGFk
IHN1Y2gKPj4gYSBuZWVkLCBhdCBsZWFzdCBnb2luZyBiYWNrIGFzIGZhciBhcyAzLjIuMC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRo
ZXNlIHByZXN1bWFibHkgd2FudCBBQ0NFU1NfT05DRSgpIHRvIGF2b2lkIGludHJvZHVjaW5nIHJl
cGVhdGVkIHJlYWQKPiB2dWxuZXJhYmlsaXRpZXM/wqAgV2hpbGUgdGhlIG1hcHBpbmdzIG1pZ2h0
IGJlIHNhZmUsIHRoZXkgc3RpbGwgcG9pbnQgdG8KPiBsaXZlIGd1ZXN0IGRhdGEuCgpPaCwgeWVz
IC0gd2lsbCBkby4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
