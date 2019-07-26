Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2619B75F0B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 08:28:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqtfr-00038C-8B; Fri, 26 Jul 2019 06:25:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6973=VX=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hqtfp-000387-Bp
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 06:25:49 +0000
X-Inumbo-ID: 34237fc6-af6e-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34237fc6-af6e-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 06:25:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B4BEAD31;
 Fri, 26 Jul 2019 06:25:46 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 08:25:45 +0200
Message-ID: <156412188377.2385.12588508835559819141.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] xen: sched: support vcpu
 hotplug/hotunplug in the 'null scheduler'
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpIZXJlIGl0IGlzIHYyIG9mIG15IHNlcmllcywgYWJvdXQgZml4aW5nIHZjcHUgb2Zm
LSBhbmQgb24tbGluaW5nIGluIHRoZQpudWxsIHNjaGVkdWxlciwgcmVjZW50bHkgcmV2aWV3ZWQg
YnkgR2VvcmdlLgoKdjEgcG9zdGluZyBpcyBoZXJlOgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDgvbXNnMDIxODIuaHRtbApNZXNzYWdl
LUlkOiA8MTUzNTE1NTg2NTA2Ljc0MDcuODkwODYyNjA1ODQ0MDUyNzY0MS5zdGdpdEBQYWxhbnRo
YXMuZnJpdHouYm94PgoKQmFzaWNhbGx5LCBpdCB0dXJuZWQgb3V0LCB3aGlsZSBkaXNjdXNzaW5n
IHRoaXMgcGF0Y2g6Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOC0wMS9tc2cwMDI0OS5odG1sCgp0aGF0IHRoZSAnbnVsbCBzY2hlZHVsZXIn
IGRvZXMgbm90IHJlYWxseSBzdXBwb3J0IHZjcHUKaG90cGx1Zy9ob3R1bnBsdWcuIEluIGZhY3Qs
IHVuZGVyIHNvbWUgY2lyY3VtbnN0YW5jZXMsIGl0IGlzIHBvc3NpYmxlCnRoYXQgdGhlIHZjcHVz
IHdoaWNoIGFyZSBhY3R1YWxseSBvZmZsaW5lLCBnZXQgYXNzaWduZWQgdG8gYSBwY3B1LCB3aGls
ZQpvbmUgb3IgbW9yZSBvbmxpbmUgdmNwdXMsIG1heSBiZSBsZWZ0IGluIHRoZSB3YWl0IGxpc3Qs
IGFuZCBzdGF5IHRoZXJlCmZvcmV2ZXIuCgpPbmUgb2YgdGhlc2UgY2lyY3VtbnN0YW5jZXMgd2Fz
LCBmb3IgaW5zdGFuY2UsIHdoZW4gdGhlICdudWxsIHNjaGVkdWxlcicKd2FzIHVzZWQgd2l0aGlu
IHRoZSBQVi1TSElNLCBidXQgdGhlIHByb2JsZW0gaXMgbW9yZSBnZW5lcmFsLCBhbmQgdGhpcwpz
ZXJpZXMgZml4ZXMgaXQuCgpJIHRoaW5rIEkndmUgYWRkcmVzc2VkIEdvZXJnZSdzIGNvbW1lbnRz
LiBUaGUgbW9zdCBub3RhYmxlIGNoYW5nZSBpcyB0aGUKbWVyZ2Ugb2Ygd2hhdCBpbiB2MSB3ZXJl
IHBhdGNoIDIgYW5kIHBhdGNoIDMuIFRoZSByZXN1bHRpbmcgcGF0Y2ggKGkuZS4sCnBhdGNoIDIg
b2YgdGhpcyBzZXJpZXMpIGlzIHRoZSBvbmx5IG9uZSBtaXNzaW5nIGFuIEFjayB0byBnbyBpbi4K
ClRoZSBzZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgaW4gZ2l0OgpnaXQ6Ly94ZW5iaXRzLnhlbi5v
cmcvcGVvcGxlL2RhcmlvZi94ZW4uZ2l0ICByZWwvc2NoZWQvbnVsbC1maXgtdmNwdS1ob3RwbHVn
LXYyCgpUaGFua3MgYW5kIFJlZ2FyZHMsCkRhcmlvCi0tLQpEYXJpbyBGYWdnaW9saSAoNCk6CiAg
ICAgIHhlbjogc2NoZWQ6IHJlZmVjdG9yIGNvZGUgYXJvdW5kIHZjcHVfZGVhc3NpZ24oKSBpbiBu
dWxsIHNjaGVkdWxlcgogICAgICB4ZW46IHNjaGVkOiBkZWFsIHdpdGggdkNQVXMgYmVpbmcgb3Ig
YmVjb21pbmcgb25saW5lIG9yIG9mZmxpbmUKICAgICAgeGVuOiBzY2hlZDogcmVhc3NpZ24gdkNQ
VXMgdG8gcENQVXMsIHdoZW4gdGhleSBjb21lIGJhY2sgb25saW5lCiAgICAgIHhlbjogc2NoZWQ6
IHJlZmFjdG9yIHRoZSBBU1NFUlRzIGFyb3VuZCB2Y3B1X2RlYXNzaW5nKCkKCiB4ZW4vY29tbW9u
L3NjaGVkX251bGwuYyB8ICAyMTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNTIgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRp
b25zKC0pCi0tCkRhcmlvIEZhZ2dpb2xpLCBQaC5ECmh0dHA6Ly9hYm91dC5tZS9kYXJpby5mYWdn
aW9saQpWaXJ0dWFsaXphdGlvbiBTb2Z0d2FyZSBFbmdpbmVlcgpTVVNFIExhYnMsIFNVU0UgaHR0
cHM6Ly93d3cuc3VzZS5jb20vCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPDxUaGlzIGhhcHBlbnMgYmVjYXVzZSBfSV8g
Y2hvb3NlIGl0IHRvIGhhcHBlbiE+PiAoUmFpc3RsaW4gTWFqZXJlKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
