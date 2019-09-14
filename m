Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE71AB29F8
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 07:22:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i90TO-0006Sf-Fu; Sat, 14 Sep 2019 05:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i90TN-0006SV-Jr
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 05:19:49 +0000
X-Inumbo-ID: 44d84f4a-d6af-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44d84f4a-d6af-11e9-978d-bc764e2007e4;
 Sat, 14 Sep 2019 05:19:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4CA5ADF0;
 Sat, 14 Sep 2019 05:19:46 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 07:19:40 +0200
Message-Id: <20190914051944.21409-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v4 0/4] xen/sched: use new idle scheduler for
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
dAp0byBiZSBzdGFydGVkIHRocmVhZHMgaXMgZG9uZSBiZWZvcmUuCgpDaGFuZ2VzIGluIFY0Ogot
IGZpeCBhIGJ1ZyB3aGVuIHVuYXNzaWduaW5nIGEgY3B1IG5vdCBpbiBhIGNwdXBvb2wgKHBhdGNo
IDIpCgpDaGFuZ2VzIGluIFYzOgotIHVzZSBaRVJPX0JMT0NLX1BUUiAoUGF0Y2ggMykKLSBhZGQg
cGF0Y2ggNAoKQ2hhbmdlcyBpbiBWMjoKLSBjb21taXQgbWVzc2FnZXMgdXBkYXRlZAotIHJlbmFt
ZWQgZnVuY3Rpb25zIChQYXRjaCAyKQoKSnVlcmdlbiBHcm9zcyAoNCk6CiAgeGVuL3NjaGVkOiBw
b3B1bGF0ZSBjcHVwb29sMCBvbmx5IGFmdGVyIGFsbCBjcHVzIGFyZSB1cAogIHhlbi9zY2hlZDog
cmVtb3ZlIGNwdSBmcm9tIHBvb2wwIGJlZm9yZSByZW1vdmluZyBpdAogIHhlbi9zY2hlZDogYWRk
IG1pbmltYWxpc3RpYyBpZGxlIHNjaGVkdWxlciBmb3IgZnJlZSBjcHVzCiAgeGVuL3NjaGVkOiBz
d2l0Y2ggdG8gZGVidWd0cmFjZSBpbiBjcHVwb29sIGhhbmRsaW5nCgogeGVuL2NvbW1vbi9jcHVw
b29sLmMgICAgICAgfCAyMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jICB8ICAgOSAtLQogeGVuL2NvbW1vbi9z
Y2hlZF9udWxsLmMgICAgfCAgIDcgLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgMTcy
ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVk
LWlmLmggfCAgIDIgKwogNSBmaWxlcyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKSwgMTkzIGRl
bGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
