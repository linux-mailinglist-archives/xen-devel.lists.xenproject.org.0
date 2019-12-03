Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577B10FB6D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 11:10:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic565-00029Q-Mx; Tue, 03 Dec 2019 10:07:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic563-00029L-Lv
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 10:07:55 +0000
X-Inumbo-ID: c5f224e0-15b4-11ea-81d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5f224e0-15b4-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 10:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77169B0A5;
 Tue,  3 Dec 2019 10:07:54 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47063d30-dd6a-2528-21f3-0bc7e7951b34@suse.com>
Date: Tue, 3 Dec 2019 11:08:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575057677-13839-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/AMD: unbreak CPU hotplug on
 AMD systems without RstrFpErrPtrs
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAyMTowMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2NwdS9jb21tb24uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKPiBA
QCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGZvcmNlZF9jYXBzW05DQVBJTlRT
XTsKPiAgCj4gIERFRklORV9QRVJfQ1BVKGJvb2wsIGZ1bGxfZ2R0X2xvYWRlZCk7Cj4gIAo+IC12
b2lkIF9faW5pdCBzZXR1cF9jbGVhcl9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4gK3ZvaWQg
c2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+ICB7Cj4gIAljb25zdCB1aW50
MzJfdCAqZGZzOwo+ICAJdW5zaWduZWQgaW50IGk7Cj4gQEAgLTgzLDcgKzgzLDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfY2xlYXJfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+ICAJfQo+ICB9Cj4g
IAo+IC12b2lkIF9faW5pdCBzZXR1cF9mb3JjZV9jcHVfY2FwKHVuc2lnbmVkIGludCBjYXApCj4g
K3ZvaWQgc2V0dXBfZm9yY2VfY3B1X2NhcCh1bnNpZ25lZCBpbnQgY2FwKQo+ICB7Cj4gIAlpZiAo
X190ZXN0X2FuZF9zZXRfYml0KGNhcCwgZm9yY2VkX2NhcHMpKQo+ICAJCXJldHVybjsKClRoZSB0
d28gZnVuY3Rpb25zIGFyZSBkZWxpYmVyYXRlbHkgX19pbml0LCBhcyBhbnkgY2FsbCB0byB0aGVt
CnBvc3QtaW5pdCBpcyBub3QgZ29pbmcgdG8gdGFrZSBzeXN0ZW0td2lkZSBlZmZlY3QuIFRoZXNl
IGZ1bmN0aW9ucwpzaG91bGQgcmVhbGx5IGJlIF9faW5pdF9wcmVzbXAsIGlmIHdlIGhhZCBzb21l
dGhpbmcgbGlrZSB0aGlzLiBObwp1c2Ugb2YgdGhlbSBvbiBhbiBBUCBib290IHBhdGggaXMgZ29p
bmcgdG8gYWZmZWN0IHRoZSBCU1AsIGFuZApoZW5jZSB3aWxsIGxlYXZlIHRoZSBzeXN0ZW0gaW4g
YW4gaW5jb25zaXN0ZW50IHN0YXRlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
