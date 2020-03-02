Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF181757B4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:53:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8hhx-0005Uu-Hx; Mon, 02 Mar 2020 09:49:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8hhw-0005Up-By
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:49:52 +0000
X-Inumbo-ID: 2884b788-5c6b-11ea-9f16-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2884b788-5c6b-11ea-9f16-12813bfff9fa;
 Mon, 02 Mar 2020 09:49:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4922EB0B7;
 Mon,  2 Mar 2020 09:49:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f320d25d-7fc8-8f34-932c-31b3a5f2d115@suse.com>
Date: Mon, 2 Mar 2020 10:49:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] IOMMU/x86: don't bypass softirq processing in
 arch_iommu_hwdom_init()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXZlbiB3aGVuIGEgcGFnZSBkb2Vzbid0IG5lZWQgbWFwcGluZywgd2Ugc2hvdWxkIGNoZWNrIHdo
ZXRoZXIgc29mdGlycQpwcm9jZXNzaW5nIHNob3VsZCBiZSBpbnZva2VkLiBPdGhlcndpc2Ugd2l0
aCBzdWZmaWNpZW50bHkgbXVjaCBSQU0KY2hhbmNlcyBvZiBhIHRvLWJlLW1hcHBlZCBwYWdlIGFj
dHVhbGx5IG9jY3VycmluZyB3aXRoIHRoZSBsb29wIGNvdW50ZXIKaGF2aW5nIHRoZSAicmlnaHQi
IHZhbHVlIG1heSBiZWNvbWUgZGltaW5pc2hpbmdseSBzbWFsbC4KClJlcG9ydGVkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC94ODYvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwpA
QCAtMjI2LDkgKzIyNiw4IEBAIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfaHdkb21faW5p
dCgKICAgICAgICAgaW50IHJjOwogCiAgICAgICAgIGlmICggIWh3ZG9tX2lvbW11X21hcChkLCBw
Zm4sIG1heF9wZm4pICkKLSAgICAgICAgICAgIGNvbnRpbnVlOwotCi0gICAgICAgIGlmICggcGFn
aW5nX21vZGVfdHJhbnNsYXRlKGQpICkKKyAgICAgICAgICAgIHJjID0gMDsKKyAgICAgICAgZWxz
ZSBpZiAoIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCiAgICAgICAgICAgICByYyA9IHNldF9p
ZGVudGl0eV9wMm1fZW50cnkoZCwgcGZuLCBwMm1fYWNjZXNzX3J3LCAwKTsKICAgICAgICAgZWxz
ZQogICAgICAgICAgICAgcmMgPSBpb21tdV9tYXAoZCwgX2RmbihwZm4pLCBfbWZuKHBmbiksIFBB
R0VfT1JERVJfNEssCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
