Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037E184776
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 14:08:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCk16-00018d-Il; Fri, 13 Mar 2020 13:06:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCk15-00018S-86
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 13:06:19 +0000
X-Inumbo-ID: 6cd2afee-652b-11ea-b2f0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cd2afee-652b-11ea-b2f0-12813bfff9fa;
 Fri, 13 Mar 2020 13:06:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B935AAD26;
 Fri, 13 Mar 2020 13:06:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 14:06:10 +0100
Message-Id: <20200313130614.27265-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v6 0/4] xen/rcu: let rcu work better with core
 scheduling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlIFJDVSBoYW5kbGluZyBpbiBYZW4gaXMgYWZmZWN0aW5nIHNjaGVkdWxpbmcgaW4g
c2V2ZXJhbCB3YXlzLgpJdCBpcyByYWlzaW5nIHNjaGVkIHNvZnRpcnFzIHdpdGhvdXQgYW55IHJl
YWwgbmVlZCBhbmQgaXQgcmVxdWlyZXMKdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNo
IGludGVyYWN0cyBiYWRseSB3aXRoIGNvcmUgc2NoZWR1bGluZy4KClRoaXMgc21hbGwgc2VyaWVz
IHJlcGFpcnMgdGhvc2UgaXNzdWVzLgoKQWRkaXRpb25hbGx5IHNvbWUgQVNTRVJUKClzIGFyZSBh
ZGRlZCBmb3IgdmVyaWZpY2F0aW9uIG9mIHNhbmUgcmN1CmhhbmRsaW5nLiBJbiBvcmRlciB0byBh
dm9pZCB0aG9zZSB0cmlnZ2VyaW5nIHJpZ2h0IGF3YXkgdGhlIG9idmlvdXMKdmlvbGF0aW9ucyBh
cmUgZml4ZWQuIFRoaXMgaW5jbHVkZXMgbWFraW5nIHJjdSBsb2NraW5nIGZ1bmN0aW9ucyB0eXBl
CnNhZmUuCgpDaGFuZ2VzIGluIFY2OgotIGFkZGVkIG1lbW9yeSBiYXJyaWVyIGluIHBhdGNoIDEK
LSBkcm9wIGNwdV9tYXBfbG9jayBvbmx5IGF0IHRoZSBlbmQgb2YgcmN1X2JhcnJpZXIoKQotIHJl
LWFkZCBwcmVtcHRfZGlzYWJsZSgpIGluIHBhdGNoIDMKCkNoYW5nZXMgaW4gVjU6Ci0gZHJvcHBl
ZCBhbHJlYWR5IGNvbW1pdHRlZCBwYXRjaGVzIDEgYW5kIDQKLSBmaXhlZCByYWNlCi0gcmV3b3Jr
IGJsb2NraW5nIG9mIHJjdSBwcm9jZXNzaW5nIHdpdGggaGVsZCByY3UgbG9ja3MKCkNoYW5nZXMg
aW4gVjQ6Ci0gcGF0Y2ggNTogdXNlIGJhcnJpZXIoKQoKQ2hhbmdlcyBpbiBWMzoKLSB0eXBlIHNh
ZmUgbG9ja2luZyBmdW5jdGlvbnMgKGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIG1hY3JvcykKLSBwZXIt
bG9jayBkZWJ1ZyBhZGRpdGlvbnMKLSBuZXcgcGF0Y2hlcyA0IGFuZCA2Ci0gZml4ZWQgcmFjZXMK
CkNoYW5nZXMgaW4gVjI6Ci0gdXNlIGdldF9jcHVfbWFwcygpIGluIHJjdV9iYXJyaWVyKCkgaGFu
ZGxpbmcKLSBhdm9pZCByZWN1cnNpb24gaW4gcmN1X2JhcnJpZXIoKSBoYW5kbGluZwotIG5ldyBw
YXRjaGVzIDMgYW5kIDQKCkp1ZXJnZW4gR3Jvc3MgKDQpOgogIHhlbi9yY3U6IGRvbid0IHVzZSBz
dG9wX21hY2hpbmVfcnVuKCkgZm9yIHJjdV9iYXJyaWVyKCkKICB4ZW46IGRvbid0IHByb2Nlc3Mg
cmN1IGNhbGxiYWNrcyB3aGVuIGhvbGRpbmcgYSByY3VfcmVhZF9sb2NrKCkKICB4ZW4vcmN1OiBh
ZGQgYXNzZXJ0aW9ucyB0byBkZWJ1ZyBidWlsZAogIHhlbi9yY3U6IGFkZCBwZXItbG9jayBjb3Vu
dGVyIGluIGRlYnVnIGJ1aWxkcwoKIHhlbi9jb21tb24vcmN1cGRhdGUuYyAgICAgIHwgOTcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9z
b2Z0aXJxLmMgICAgICAgfCAxNCArKysrKystCiB4ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaCB8
IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAxNDUgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
