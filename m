Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69A9E649
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 13:01:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ZCJ-00084y-Ak; Tue, 27 Aug 2019 10:59:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7YVi=WX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ZCH-00084s-S2
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 10:59:33 +0000
X-Inumbo-ID: bf636e1b-c8b9-11e9-ae32-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf636e1b-c8b9-11e9-ae32-12813bfff9fa;
 Tue, 27 Aug 2019 10:59:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EE4BAF3B;
 Tue, 27 Aug 2019 10:59:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 27 Aug 2019 12:59:25 +0200
Message-Id: <20190827105928.1769-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/3] xen/sched: use new idle scheduler for
 free cpus
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgdGhyZWUgcGF0Y2hlcyBoYXZlIGJlZW4gY2FydmVkIG91dCBmcm9tIG15IGNvcmUgc2No
ZWR1bGluZyBzZXJpZXMKYXMgdGhleSBhcmUgc3VmZmljaWVudGx5IGluZGVwZW5kZW50IHRvIGJl
IGFwcGxpZWQgZXZlbiB3aXRob3V0IHRoZSBiaWcKc2VyaWVzLgoKV2l0aG91dCB0aGlzIGxpdHRs
ZSBzZXJpZXMgdGhlcmUgYXJlIG1lc3NhZ2VzIGxpa2UgdGhlIGZvbGxvd2luZyB0byBiZQpzZWVu
IG9uIHRoZSBjb25zb2xlIHdoZW4gYm9vdGluZyB3aXRoIHNtdD0wOgoKKFhFTikgQWRkaW5nIGNw
dSAxIHRvIHJ1bnF1ZXVlIDAKKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KKFhFTikgQ1BV
IDEgc3RpbGwgbm90IGRlYWQuLi4KKFhFTikgQ1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KKFhFTikg
Q1BVIDEgc3RpbGwgbm90IGRlYWQuLi4KCkJ5IGFzc2lnbmluZyBjcHVzIHRvIENwdXBvb2wtMCBv
bmx5IGFmdGVyIGFsbCBjcHVzIGFyZSB1cCBhbmQgYnkgbm90CnVzaW5nIHRoZSBtb3JlIGNvbXBs
aWNhdGVkIGNyZWRpdDIgc2NoZWR1bGVyIGZvciBjcHVzIG5vdCBpbiBhbnkKY3B1cG9vbCB0aGlz
IHNpdHVhdGlvbiBjYW4gc2ltcGx5IG5vIGxvbmdlciBoYXBwZW4sIGFzIHBhcmtpbmcgdGhlIG5v
dAp0byBiZSBzdGFydGVkIHRocmVhZHMgaXMgZG9uZSBiZWZvcmUuCgpDaGFuZ2VzIGluIFYyOgot
IGNvbW1pdCBtZXNzYWdlcyB1cGRhdGVkCi0gcmVuYW1lZCBmdW5jdGlvbnMgKFBhdGNoIDIpCgpK
dWVyZ2VuIEdyb3NzICgzKToKICB4ZW4vc2NoZWQ6IHBvcHVsYXRlIGNwdXBvb2wwIG9ubHkgYWZ0
ZXIgYWxsIGNwdXMgYXJlIHVwCiAgeGVuL3NjaGVkOiByZW1vdmUgY3B1IGZyb20gcG9vbDAgYmVm
b3JlIHJlbW92aW5nIGl0CiAgeGVuL3NjaGVkOiBhZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1
bGVyIGZvciBmcmVlIGNwdXMKCiB4ZW4vY29tbW9uL2NwdXBvb2wuYyAgICAgICB8IDE5NCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9jb21tb24vc2No
ZWRfY3JlZGl0LmMgIHwgICA5IC0tLQogeGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgICAgfCAgIDcg
LS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgMTcyICsrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgICAyICsK
IDUgZmlsZXMgY2hhbmdlZCwgMjEzIGluc2VydGlvbnMoKyksIDE3MSBkZWxldGlvbnMoLSkKCi0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
