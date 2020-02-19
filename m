Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6199A163E2A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 08:51:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4K5q-00052C-Kv; Wed, 19 Feb 2020 07:48:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4K5p-000527-NF
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 07:48:25 +0000
X-Inumbo-ID: 340467da-52ec-11ea-8300-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 340467da-52ec-11ea-8300-12813bfff9fa;
 Wed, 19 Feb 2020 07:48:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3538BB24E;
 Wed, 19 Feb 2020 07:48:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
Message-ID: <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
Date: Wed, 19 Feb 2020 08:48:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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

KFJlc2VuZDsgbm8gaWRlYSB3aGVyZSB0aGUgb3JpZ2luYWwsIHNlbnQgb24gRGVjIDIzcmQsIGVu
ZGVkIHVwIC0gSQpjYW4ndCBmaW5kIGl0IGluIHRoZSBsaXN0IGFyY2hpdmVzIGluIGFueSBldmVu
dCkKCk9uIDIwLjEyLjIwMTkgMjI6MzksIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IEBAIC0zOCwy
NCArMzcsMjIgQEAgdm9pZCBodm1faW5pdF9ndWVzdF90aW1lKHN0cnVjdCBkb21haW4gKmQpCj4g
IHVpbnQ2NF90IGh2bV9nZXRfZ3Vlc3RfdGltZV9maXhlZChjb25zdCBzdHJ1Y3QgdmNwdSAqdiwg
dWludDY0X3QgYXRfdHNjKQo+ICB7Cj4gICAgICBzdHJ1Y3QgcGxfdGltZSAqcGwgPSB2LT5kb21h
aW4tPmFyY2guaHZtLnBsX3RpbWU7Cj4gLSAgICB1NjQgbm93Owo+ICsgICAgc190aW1lX3Qgb2xk
LCBuZXcsIG5vdyA9IGdldF9zX3RpbWVfZml4ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7
Cj4gIAo+ICAgICAgLyogQ2FsbGVkIGZyb20gZGV2aWNlIG1vZGVscyBzaGFyZWQgd2l0aCBQViBn
dWVzdHMuIEJlIGNhcmVmdWwuICovCj4gICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwo+ICAK
PiAtICAgIHNwaW5fbG9jaygmcGwtPnBsX3RpbWVfbG9jayk7Cj4gLSAgICBub3cgPSBnZXRfc190
aW1lX2ZpeGVkKGF0X3RzYykgKyBwbC0+c3RpbWVfb2Zmc2V0Owo+IC0KPiAgICAgIGlmICggIWF0
X3RzYyApCj4gICAgICB7Cj4gLSAgICAgICAgaWYgKCAoaW50NjRfdCkobm93IC0gcGwtPmxhc3Rf
Z3Vlc3RfdGltZSkgPiAwICkKPiAtICAgICAgICAgICAgcGwtPmxhc3RfZ3Vlc3RfdGltZSA9IG5v
dzsKPiAtICAgICAgICBlbHNlCj4gLSAgICAgICAgICAgIG5vdyA9ICsrcGwtPmxhc3RfZ3Vlc3Rf
dGltZTsKPiArICAgICAgICBkbyB7Cj4gKyAgICAgICAgICAgIG9sZCA9IHBsLT5sYXN0X2d1ZXN0
X3RpbWU7Cj4gKyAgICAgICAgICAgIG5ldyA9IG5vdyA+IHBsLT5sYXN0X2d1ZXN0X3RpbWUgPyBu
b3cgOiBvbGQgKyAxOwo+ICsgICAgICAgIH0gd2hpbGUgKCBjbXB4Y2hnKCZwbC0+bGFzdF9ndWVz
dF90aW1lLCBvbGQsIG5ldykgIT0gb2xkICk7CgpJIHdvbmRlciB3aGV0aGVyIHlvdSB3b3VsZG4n
dCBiZXR0ZXIgcmUtaW52b2tlIGdldF9zX3RpbWUoKSBpbgpjYXNlIHlvdSBuZWVkIHRvIHJldHJ5
IGhlcmUuIFNlZSBob3cgdGhlIGZ1bmN0aW9uIHByZXZpb3VzbHkKd2FzIGNhbGxlZCBvbmx5IGFm
dGVyIHRoZSBsb2NrIHdhcyBhbHJlYWR5IGFjcXVpcmVkLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
