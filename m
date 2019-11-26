Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F2109BFD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 11:11:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZXmM-0007e2-9c; Tue, 26 Nov 2019 10:09:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZXmK-0007dU-Hg
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 10:09:04 +0000
X-Inumbo-ID: c4b60d4d-1034-11ea-a39d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4b60d4d-1034-11ea-a39d-12813bfff9fa;
 Tue, 26 Nov 2019 10:09:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D782EBD86;
 Tue, 26 Nov 2019 10:09:00 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d3af9457-d905-3e94-06e9-3d346a5a5275@suse.com>
 <17e1d1e6-8ef3-423e-ab1d-1ea3815339a0@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <75edf8ec-c1e3-df62-6959-f2cb640bed39@suse.com>
Date: Tue, 26 Nov 2019 11:08:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <17e1d1e6-8ef3-423e-ab1d-1ea3815339a0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/p2m-pt: fix (latent) page table mapping
 leak on do_recalc() error paths
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMTkgMTU6MzksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTEvMjUvMTkgMTo0
OSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZXJlIGFyZSB0d28gbWFwcGluZ3MgYWN0aXZl
IGluIHRoZSBtaWRkbGUgb2YgZG9fcmVjYWxjKCksIGFuZCBoZW5jZQo+PiBjb21taXQgMGQwZjRk
NzhlNWQxICgicDJtOiBjaGFuZ2Ugd3JpdGVfcDJtX2VudHJ5IHRvIHJldHVybiBhbiBlcnJvcgo+
PiBjb2RlIikgc2hvdWxkIGhhdmUgYWRkZWQgKG9yIG90aGVyd2lzZSBpbnZva2VkKSB1bm1hcHBp
bmcgY29kZSBqdXN0Cj4+IGxpa2UgaXQgZGlkIGluIHAybV9uZXh0X2xldmVsKCksIGRlc3BpdGUg
dXMgbm90IGV4cGVjdGluZyBhbnkgZXJyb3JzCj4+IGhlcmUuIEFycmFuZ2UgZm9yIHRoZSBleGlz
dGluZyB1bm1hcCBpbnZvY2F0aW9uIHRvIHRha2UgZWZmZWN0IGluIGFsbAo+PiBjYXNlcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gCgpS
ZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
