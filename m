Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C74B116D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:49:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QNV-0005d2-9Z; Thu, 12 Sep 2019 14:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8QNT-0005cl-FE
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:47:19 +0000
X-Inumbo-ID: 37470220-d56c-11e9-959c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37470220-d56c-11e9-959c-12813bfff9fa;
 Thu, 12 Sep 2019 14:47:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E82DDAC7F;
 Thu, 12 Sep 2019 14:47:16 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
 <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
 <7ea0eb1e-1063-b7ef-8cde-6f47f70e41e0@suse.com>
 <20190912144434.e7wnmdumfpnp2z3m@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a77b09ff-e0df-6b54-c6e7-156ce9dd6f29@suse.com>
Date: Thu, 12 Sep 2019 16:47:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912144434.e7wnmdumfpnp2z3m@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNjo0NCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gYSBkaWZm
ZXJlbnQgcXVlc3Rpb24sIEFGQUlDVCBodm1fc2V0X2NyMyBzaG91bGQgbmV2ZXIgYmUgY2FsbGVk
Cj4gd2l0aCBYODZfQ1IzX05PRkxVU0ggc2V0PyBJZiBzbywgZG8geW91IHRoaW5rIGl0IHdvdWxk
IG1ha2Ugc2Vuc2UgdG8KPiBhZGQgYW4gYXNzZXJ0IHRvIHRoYXQgcmVnYXJkPwoKSSd2ZSBiZWVu
IGRlYmF0aW5nIHRoaXMgd2l0aCBteXNlbGYsIGFuZCBkZWNpZGVkIGFnYWluc3QgZm9yIG5vdy4K
V2UgZG9uJ3Qga25vdyB3aGF0IG1lYW5pbmcgdGhlIGJpdCBtYXkgZ2FpbiBldmVudHVhbGx5IGlu
IHRoZQphY3R1YWwgcmVnaXN0ZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
