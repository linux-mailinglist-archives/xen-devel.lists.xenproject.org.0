Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C36A37F0
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 15:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3h9g-0006H9-KE; Fri, 30 Aug 2019 13:41:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3h9e-0006H4-VC
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 13:41:30 +0000
X-Inumbo-ID: defc17d0-cb2b-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id defc17d0-cb2b-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 13:41:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69DFAAD54;
 Fri, 30 Aug 2019 13:41:29 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <793a54c4-902f-ca02-357f-5080f938e0d6@suse.com>
Message-ID: <6bca0f32-aea3-39cc-8d71-50b4ddcbe98c@suse.com>
Date: Fri, 30 Aug 2019 15:41:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <793a54c4-902f-ca02-357f-5080f938e0d6@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 1/3] x86/ACPI: restore VESA mode upon resume
 from S3
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

SW4gb3JkZXIgZm9yICJhY3BpX3NsZWVwPXMzX21vZGUiIHRvIGhhdmUgYW55IGVmZmVjdCwgd2Ug
c2hvdWxkIHJlY29yZAp0aGUgdmlkZW8gbW9kZSB3ZSBzd2l0Y2hlZCB0byBkdXJpbmcgYm9vdC4g
U2luY2UgcmlnaHQgbm93IHRoZXJlJ3MgbW9kZQpzZXR0aW5nIGNvZGUgZm9yIFZFU0EgbW9kZXMg
b25seSBpbiB0aGUgcmVzdW1lIGNhc2UsIHJlY29yZCB0aGUgbW9kZQpqdXN0IGluIHRoYXQgb25l
IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0t
LQpJJ20gd29uZGVyaW5nIGFjdHVhbGx5IHdoZXRoZXIgdGhlIHVzZXIgaGF2aW5nIHRvIGV4cGxp
Y2l0bHkgcmVxdWVzdCB0aGUKbW9kZSByZXN0b3JhdGlvbiBpcyBhIGdvb2QgbW9kZWw6IFdoeSB3
b3VsZCB3ZSBfbm90XyB3YW50IHRvIHJlc3RvcmUgdGhlCm1vZGUgd2UndmUgc2V0IGR1cmluZyBi
b290PyBJbiB0aGUgd29yc3QgY2FzZSBEb20wIGtlcm5lbCBvciBYIHdpbGwKY2hhbmdlIHRoZSBt
b2RlIGFub3RoZXIgdGltZS4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3ZpZGVvLlMKKysrIGIv
eGVuL2FyY2gveDg2L2Jvb3QvdmlkZW8uUwpAQCAtNDU1LDE0ICs0NTUsMTcgQEAgY2hlY2tfdmVz
YToKICAgICAgICAgY21wYiAgICAkMHg5OSwgJWFsCiAgICAgICAgIGpueiAgICAgX3NldGJhZCAg
ICAgICAgICAgICAgICAgIyBEb2ghIE5vIGxpbmVhciBmcmFtZSBidWZmZXIuCiAKKyAgICAgICAg
cHVzaHcgICAlYngKICAgICAgICAgc3ViYiAgICAkVklERU9fRklSU1RfVkVTQT4+OCwgJWJoCiAg
ICAgICAgIG9ydyAgICAgJDB4NDAwMCwgJWJ4ICAgICAgICAgICAgIyBVc2UgbGluZWFyIGZyYW1l
IGJ1ZmZlcgogICAgICAgICBtb3Z3ICAgICQweDRmMDIsICVheCAgICAgICAgICAgICMgVkVTQSBC
SU9TIG1vZGUgc2V0IGNhbGwKICAgICAgICAgaW50ICAgICAkMHgxMAorICAgICAgICBwb3B3ICAg
ICVieAogICAgICAgICBjbXB3ICAgICQweDAwNGYsICVheCAgICAgICAgICAgICMgQUw9NGYgaWYg
aW1wbGVtZW50ZWQKICAgICAgICAgam56ICAgICBfc2V0YmFkICAgICAgICAgICAgICAgICAjIEFI
PTAgaWYgT0sKIAogICAgICAgICBtb3ZiICAgICQxLCBib290c3ltKGdyYXBoaWNfbW9kZSkgICMg
ZmxhZyBncmFwaGljIG1vZGUKKyAgICAgICAgbW92dyAgICAlYngsIGJvb3RzeW0odmlkZW9fbW9k
ZSkKICAgICAgICAgc3RjCiAgICAgICAgIHJldAogCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
