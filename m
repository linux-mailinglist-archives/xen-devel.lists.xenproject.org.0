Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EF117F108
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 08:32:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBZKD-0001bO-6i; Tue, 10 Mar 2020 07:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBZKA-0001ao-PT
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 07:29:10 +0000
X-Inumbo-ID: ceac9eed-62a0-11ea-ad1e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceac9eed-62a0-11ea-ad1e-12813bfff9fa;
 Tue, 10 Mar 2020 07:28:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C872ABDE;
 Tue, 10 Mar 2020 07:28:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Mar 2020 08:28:47 +0100
Message-Id: <20200310072853.27567-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v4 0/6] xen/rcu: let rcu work better with core
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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
CnNhZmUuCgpDaGFuZ2VzIGluIFY0OgotIHBhdGNoIDU6IHVzZSBiYXJyaWVyKCkKCkNoYW5nZXMg
aW4gVjM6Ci0gdHlwZSBzYWZlIGxvY2tpbmcgZnVuY3Rpb25zIChmdW5jdGlvbnMgaW5zdGVhZCBv
ZiBtYWNyb3MpCi0gcGVyLWxvY2sgZGVidWcgYWRkaXRpb25zCi0gbmV3IHBhdGNoZXMgNCBhbmQg
NgotIGZpeGVkIHJhY2VzCgpDaGFuZ2VzIGluIFYyOgotIHVzZSBnZXRfY3B1X21hcHMoKSBpbiBy
Y3VfYmFycmllcigpIGhhbmRsaW5nCi0gYXZvaWQgcmVjdXJzaW9uIGluIHJjdV9iYXJyaWVyKCkg
aGFuZGxpbmcKLSBuZXcgcGF0Y2hlcyAzIGFuZCA0CgpKdWVyZ2VuIEdyb3NzICg2KToKICB4ZW4v
cmN1OiB1c2UgcmN1IHNvZnRpcnEgZm9yIGZvcmNpbmcgcXVpZXNjZW50IHN0YXRlCiAgeGVuL3Jj
dTogZG9uJ3QgdXNlIHN0b3BfbWFjaGluZV9ydW4oKSBmb3IgcmN1X2JhcnJpZXIoKQogIHhlbjog
YWRkIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxc19ub3JjdSgpIGZvciBrZXloYW5kbGVycwogIHhl
bi9yY3U6IGZpeCByY3VfbG9ja19kb21haW4oKQogIHhlbi9yY3U6IGFkZCBhc3NlcnRpb25zIHRv
IGRlYnVnIGJ1aWxkCiAgeGVuL3JjdTogYWRkIHBlci1sb2NrIGNvdW50ZXIgaW4gZGVidWcgYnVp
bGRzCgogeGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQogeGVuL2FyY2gveDg2L251bWEuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQog
eGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiB4ZW4v
Y29tbW9uL2tleWhhbmRsZXIuYyAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4vY29t
bW9uL211bHRpY2FsbC5jICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9jb21tb24v
cHJlZW1wdC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9jb21tb24vcmN1
cGRhdGUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxMDkgKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLQogeGVuL2NvbW1vbi9zb2Z0aXJxLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
OSArKysrLQogeGVuL2NvbW1vbi93YWl0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jIHwgICAyICst
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICAgIHwgICAyICstCiB4
ZW4vZHJpdmVycy92cGNpL21zaS5jICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCiB4ZW4v
aW5jbHVkZS94ZW4vcmN1cGRhdGUuaCAgICAgICAgICAgICAgICAgIHwgIDc2ICsrKysrKysrKysr
KysrKy0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICAgICAgICAgICAgfCAg
IDYgKy0KIHhlbi9pbmNsdWRlL3hlbi9zb2Z0aXJxLmggICAgICAgICAgICAgICAgICAgfCAgIDIg
KwogMTUgZmlsZXMgY2hhbmdlZCwgMTgwIGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygtKQoK
LS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
