Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F40D177BBF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:20:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9AEx-0001Lo-0w; Tue, 03 Mar 2020 16:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9AEw-0001Lj-7H
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:17:50 +0000
X-Inumbo-ID: 8679a376-5d6a-11ea-94a0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8679a376-5d6a-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 16:17:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6C64AB7F;
 Tue,  3 Mar 2020 16:17:48 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23854915-905d-d564-eca8-10435bd361eb@suse.com>
Date: Tue, 3 Mar 2020 17:17:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: refine APIC ID restriction
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

Tm93IHRoYXQgd2UgZGlzdGluZ3Vpc2ggInJlc3RyaWN0ZWQiIGFuZCAiZnVsbCIgaW50ZXJydXB0
IHJlbWFwcGluZwptb2RlLCB0aGUgOC1iaXQtQVBJQy1JRCByZXN0cmljdGlvbiBhbHNvIG5lZWRz
IHRvIGJlIGVuZm9yY2VkIGZvcgoicmVzdHJpY3RlZCIuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpPYnZpb3VzbHkgdG8gZ28gb24gdG9wIG9mICJB
TUQvSU9NTVU6IHdpdGhvdXQgWFQsIHgyQVBJQyBuZWVkcyB0byBiZQpmb3JjZWQgaW50byBwaHlz
aWNhbCBtb2RlIi4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYwpAQCAtMTMyOCw3ICsxMzI4LDcgQEAgaW50IF9fY3B1X3VwKHVuc2lnbmVk
IGludCBjcHUpCiAgICAgICAgIHJldHVybiAtRU5PREVWOwogCiAgICAgaWYgKCAoIXgyYXBpY19l
bmFibGVkICYmIGFwaWNpZCA+PSBBUElDX0FMTF9DUFVTKSB8fAotICAgICAgICAgKCFpb21tdV9p
bnRyZW1hcCAmJiAoYXBpY2lkID4+IDgpKSApCisgICAgICAgICAoaW9tbXVfaW50cmVtYXAgIT0g
aW9tbXVfaW50cmVtYXBfZnVsbCAmJiAoYXBpY2lkID4+IDgpKSApCiAgICAgewogICAgICAgICBw
cmludGsoIlVuc3VwcG9ydGVkOiBBUElDIElEICUjeCBpbiB4QVBJQyBtb2RlIHcvbyBpbnRlcnJ1
cHQgcmVtYXBwaW5nXG4iLAogICAgICAgICAgICAgICAgYXBpY2lkKTsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
