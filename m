Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852C81715D2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 12:17:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7H7n-0000UX-Vi; Thu, 27 Feb 2020 11:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7H7m-0000US-Gt
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 11:14:38 +0000
X-Inumbo-ID: 572ab162-5952-11ea-b0f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 572ab162-5952-11ea-b0f0-bc764e2007e4;
 Thu, 27 Feb 2020 11:14:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA49CAE52;
 Thu, 27 Feb 2020 11:14:36 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e651d6f5-0331-4bf1-7385-e64dad3a1e8e@suse.com>
Date: Thu, 27 Feb 2020 12:14:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] VT-d: fix and extend RMRR reservation check
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rmlyc3Qgb2YgYWxsIGluIGNvbW1pdCBkNjU3M2JjNmU2YjcgKCJWVC1kOiBjaGVjayBhbGwgb2Yg
YW4gUk1SUiBmb3IKYmVpbmcgRTgyMC1yZXNlcnZlZCIpIGFsb25nIHdpdGggY2hhbmdpbmcgdGhl
IGZ1bmN0aW9uIHVzZWQsIHRoZSBlbnVtLQpsaWtlIHZhbHVlIHBhc3NlZCBzaG91bGQgaGF2ZSBi
ZWVuIGNoYW5nZWQgdG9vICh0byBFODIwXyopLiBEbyBzbyBub3cuCihMdWNraWx5IHRoZSBhY3R1
YWwgdmFsdWVzIG9mIFJBTV9UWVBFX1JFU0VSVkVEIGFuZCBFODIwX1JFU0VSVkVECm1hdGNoLCBz
byB0aGUgYnJlYWthZ2UgaW50cm9kdWNlZCB3YXMgIm9ubHkiIGxhdGVudC4pCgpGdXJ0aGVybW9y
ZSBvbmUgb2YgbXkgc3lzdGVtcyBzdXJmYWNlcyBSTVJSIGluIGFuIEFDUEkgTlZTIEU4MjAgcmFu
Z2UuClRoZSBwdXJwb3NlIG9mIHRoZSBjaGVjayBpcyBqdXN0IHRvIG1ha2Ugc3VyZSB0aGVyZSB3
b24ndCBiZSAib3JkaW5hcnkiCm1hcHBpbmdzIG9mIHRoZXNlIHJhbmdlcywgYW5kIGRvbWFpbnMg
KGluY2x1ZGluZyBEb20wKSB3b24ndCB3YW50IHRvCnVzZSB0aGUgcmVnaW9uIHRvIGUuZy4gcHV0
IFBDSSBkZXZpY2UgQkFScyB0aGVyZS4gVGhlIHR3byBBQ1BJIHJlbGF0ZWQKRTgyMCB0eXBlcyBh
cmUgZ29vZCBlbm91Z2ggZm9yIHRoaXMgcHVycG9zZSwgc28gYWxsb3cgdGhlbSBhcyB3ZWxsLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvZG1hci5jCkBAIC02MzIsNyArNjMyLDkgQEAgYWNwaV9wYXJzZV9vbmVfcm1ycihz
dHJ1Y3QgYWNwaV9kbWFyX2hlYQogICAgICAqIG5vdCBwcm9wZXJseSByZXByZXNlbnRlZCBpbiB0
aGUgc3lzdGVtIG1lbW9yeSBtYXAgYW5kCiAgICAgICogaW5mb3JtIHRoZSB1c2VyCiAgICAgICov
Ci0gICAgaWYgKCAhZTgyMF9hbGxfbWFwcGVkKGJhc2VfYWRkciwgZW5kX2FkZHIgKyAxLCBSQU1f
VFlQRV9SRVNFUlZFRCkgKQorICAgIGlmICggIWU4MjBfYWxsX21hcHBlZChiYXNlX2FkZHIsIGVu
ZF9hZGRyICsgMSwgRTgyMF9SRVNFUlZFRCkgJiYKKyAgICAgICAgICFlODIwX2FsbF9tYXBwZWQo
YmFzZV9hZGRyLCBlbmRfYWRkciArIDEsIEU4MjBfTlZTKSAmJgorICAgICAgICAgIWU4MjBfYWxs
X21hcHBlZChiYXNlX2FkZHIsIGVuZF9hZGRyICsgMSwgRTgyMF9BQ1BJKSApCiAgICAgICAgIHBy
aW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVGSVgKICAgICAgICAgICAgICAgICIgUk1SUiBbJSJQ
Ukl4NjQiLCUiUFJJeDY0Il0gbm90IGluIHJlc2VydmVkIG1lbW9yeTsiCiAgICAgICAgICAgICAg
ICAiIG5lZWQgXCJpb21tdV9pbmNsdXNpdmVfbWFwcGluZz0xXCI/XG4iLAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
