Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37668145861
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:03:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHUk-0002zr-G8; Wed, 22 Jan 2020 15:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuHUj-0002zl-8L
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:00:37 +0000
X-Inumbo-ID: ed481776-3d27-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed481776-3d27-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 15:00:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53CB0BEBD;
 Wed, 22 Jan 2020 15:00:27 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <8b7e04b4f853de484f5f15f4523b4ae85134d5e9.1579628566.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ba92fb88-1f7a-0a3a-6005-090afb6f7680@suse.com>
Date: Wed, 22 Jan 2020 16:00:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8b7e04b4f853de484f5f15f4523b4ae85134d5e9.1579628566.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/18] x86/hvm: introduce
 hvm_copy_context_and_params
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEN1cnJlbnRseSB0
aGUgaHZtIHBhcmFtZXRlcnMgYXJlIG9ubHkgYWNjZXNzaWJsZSB2aWEgdGhlIEhWTU9QIGh5cGVy
Y2FsbHMuIEluCj4gdGhpcyBwYXRjaCB3ZSBpbnRyb2R1Y2UgYSBuZXcgZnVuY3Rpb24gdGhhdCBj
YW4gY29weSBib3RoIHRoZSBodm0gY29udGV4dCBhbmQKPiBwYXJhbWV0ZXJzIGRpcmVjdGx5IGlu
dG8gYSB0YXJnZXQgZG9tYWluLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaW4gZXhpc3RpbmcKPiBj
b2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBp
bnRlbC5jb20+CgpJbiByZXBseSB0byBteSB2NCBjb21tZW50cyB5b3Ugc2FpZCAiSSBkb24ndCBo
YXZlIGFueSBvYmplY3Rpb25zIHRvIHRoZQp0aGluZ3MgeW91IHBvaW50ZWQgb3V0LiIgWWV0IG9u
bHkgb25lIGFzcGVjdCB3YXMgYWN0dWFsbHkgY2hhbmdlZCBoZXJlLgpJdCBhbHNvIGRvZXNuJ3Qg
aGVscCB0aGF0IHRoZXJlJ3Mgbm8gYnJpZWYgc3VtbWFyeSBvZiB0aGUgY2hhbmdlcyBkb25lCmZv
ciB2NS4gSSBndWVzcyBJJ20gY29uZnVzZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
