Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3A2C455
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQ3-0004Xr-4w; Tue, 28 May 2019 10:33:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ1-0004XM-MO
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:21 +0000
X-Inumbo-ID: 01163e78-8134-11e9-b2e5-f7d053e7786e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01163e78-8134-11e9-b2e5-f7d053e7786e;
 Tue, 28 May 2019 10:33:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3AAA1AE52;
 Tue, 28 May 2019 10:33:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:13 +0200
Message-Id: <20190528103313.1343-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHN1cHBvcnQgZm9yIGNvcmUtIGFuZCBzb2NrZXQtc2NoZWR1bGluZyBpbiB0aGUgWGVuIGh5
cGVydmlzb3IuCgpWaWEgYm9vdCBwYXJhbWV0ZXIgc2NoZWQtZ3Jhbj1jb3JlIChvciBzY2hlZC1n
cmFuPXNvY2tldCkKaXQgaXMgcG9zc2libGUgdG8gY2hhbmdlIHRoZSBzY2hlZHVsaW5nIGdyYW51
bGFyaXR5IGZyb20gY3B1ICh0aGUKZGVmYXVsdCkgdG8gZWl0aGVyIHdob2xlIGNvcmVzIG9yIGV2
ZW4gc29ja2V0cy4KCkFsbCBsb2dpY2FsIGNwdXMgKHRocmVhZHMpIG9mIHRoZSBjb3JlIG9yIHNv
Y2tldCBhcmUgYWx3YXlzIHNjaGVkdWxlZAp0b2dldGhlci4gVGhpcyBtZWFucyB0aGF0IG9uIGEg
Y29yZSBhbHdheXMgdmNwdXMgb2YgdGhlIHNhbWUgZG9tYWluCndpbGwgYmUgYWN0aXZlLCBhbmQg
dGhvc2UgdmNwdXMgd2lsbCBhbHdheXMgYmUgc2NoZWR1bGVkIGF0IHRoZSBzYW1lCnRpbWUuCgpU
aGlzIGlzIGFjaGlldmVkIGJ5IHN3aXRjaGluZyB0aGUgc2NoZWR1bGVyIHRvIG5vIGxvbmdlciBz
ZWUgdmNwdXMgYXMKdGhlIHByaW1hcnkgb2JqZWN0IHRvIHNjaGVkdWxlLCBidXQgInNjaGVkdWxl
IHVuaXRzIi4gRWFjaCBzY2hlZHVsZQp1bml0IGNvbnNpc3RzIG9mIGFzIG1hbnkgdmNwdXMgYXMg
ZWFjaCBjb3JlIGhhcyB0aHJlYWRzIG9uIHRoZSBjdXJyZW50CnN5c3RlbS4gVGhlIHZjcHUtPnVu
aXQgcmVsYXRpb24gaXMgZml4ZWQuCgpJIGhhdmUgZG9uZSBzb21lIHZlcnkgYmFzaWMgcGVyZm9y
bWFuY2UgdGVzdGluZzogb24gYSA0IGNwdSBzeXN0ZW0KKDIgY29yZXMgd2l0aCAyIHRocmVhZHMg
ZWFjaCkgSSBkaWQgYSAibWFrZSAtaiA0IiBmb3IgYnVpbGRpbmcgdGhlIFhlbgpoeXBlcnZpc29y
LiBXaXRoIFRoaXMgdGVzdCBoYXMgYmVlbiBydW4gb24gZG9tMCwgb25jZSB3aXRoIG5vIG90aGVy
Cmd1ZXN0IGFjdGl2ZSBhbmQgb25jZSB3aXRoIGFub3RoZXIgZ3Vlc3Qgd2l0aCA0IHZjcHVzIHJ1
bm5pbmcgdGhlIHNhbWUKdGVzdC4gVGhlIHJlc3VsdHMgYXJlIChhbHdheXMgZWxhcHNlZCB0aW1l
LCBzeXN0ZW0gdGltZSwgdXNlciB0aW1lKToKCnNjaGVkLWdyYW49Y3B1LCAgICBubyBvdGhlciBn
dWVzdDogMTE2LjEwIDE3Ny42NSAyMDcuODQKc2NoZWQtZ3Jhbj1jb3JlLCAgIG5vIG90aGVyIGd1
ZXN0OiAxMTQuMDQgMTc1LjQ3IDIwNy40NQpzY2hlZC1ncmFuPWNwdSwgICAgb3RoZXIgZ3Vlc3Q6
ICAgIDIwMi4zMCAzMzQuMjEgMzg0LjYzCnNjaGVkLWdyYW49Y29yZSwgICBvdGhlciBndWVzdDog
ICAgMjA3LjI0IDI5My4wNCAzNzEuMzcKClRoZSBwZXJmb3JtYW5jZSB0ZXN0cyBoYXZlIGJlZW4g
cGVyZm9ybWVkIHdpdGggY3JlZGl0MiwgdGhlIG90aGVyCnNjaGVkdWxlcnMgYXJlIHRlc3RlZCBv
bmx5IGJyaWVmbHkgdG8gYmUgYWJsZSB0byBjcmVhdGUgYSBkb21haW4gaW4gYQpjcHVwb29sLgoK
Q3B1cG9vbHMgaGF2ZSBiZWVuIG1vZGVyYXRlbHkgdGVzdGVkIChjcHUgYWRkL3JlbW92ZSwgY3Jl
YXRlLCBkZXN0cm95LAptb3ZlIGRvbWFpbikuCgpDcHUgb24tL29mZmxpbmluZyBoYXMgYmVlbiBt
b2RlcmF0ZWx5IHRlc3RlZCwgdG9vLgoKVGhlIGNvbXBsZXRlIHBhdGNoIHNlcmllcyBpcyBhdmFp
bGFibGUgdW5kZXI6CgogIGdpdDovL2dpdGh1Yi5jb20vamdyb3NzMS94ZW4vIHNjaGVkLXYxCgpD
aGFuZ2VzIGluIFYxOgotIGNwdXBvb2xzIGFyZSB3b3JraW5nIG5vdwotIGNwdSBvbi0vb2ZmbGlu
aW5nIHdvcmtpbmcgbm93Ci0gYWxsIHNjaGVkdWxlcnMgd29ya2luZyBub3cKLSByZW5hbWVkICJp
dGVtcyIgdG8gInVuaXRzIgotIGludHJvZHVjdGlvbiBvZiAiaWRsZSBzY2hlZHVsZXIiCi0gc2V2
ZXJhbCBuZXcgcGF0Y2hlcyAoc2VlIGluZGl2aWR1YWwgcGF0Y2hlcywgbW9zdGx5IHNwbGl0cyBv
ZgogIGZvcm1lciBwYXRjaGVzIG9yIGNwdXBvb2wgYW5kIGNwdSBvbi0vb2ZmbGluaW5nIHN1cHBv
cnQpCi0gYWxsIHJldmlldyBjb21tZW50cyBhZGRyZXNzZWQKLSBzb21lIG1pbm9yIGNoYW5nZXMg
KHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMpCgpDaGFuZ2VzIGluIFJGQyBWMjoKLSBBUk0gaXMgYnVp
bGRpbmcgbm93Ci0gSFZNIGRvbWFpbnMgYXJlIHdvcmtpbmcgbm93Ci0gaWRsaW5nIHdpbGwgYWx3
YXlzIGJlIGRvbmUgd2l0aCBpZGxlX3ZjcHUgYWN0aXZlCi0gb3RoZXIgc21hbGwgY2hhbmdlcyBz
ZWUgaW5kaXZpZHVhbCBwYXRjaGVzCgpKdWVyZ2VuIEdyb3NzICg2MCk6CiAgeGVuL3NjaGVkOiBv
bmx5IGFsbG93IHNjaGVkdWxlcnMgd2l0aCBhbGwgbWFuZGF0b3J5IGZ1bmN0aW9ucwogICAgYXZh
aWxhYmxlCiAgeGVuL3NjaGVkOiBhZGQgaW5saW5lIHdyYXBwZXJzIGZvciBjYWxsaW5nIHBlci1z
Y2hlZHVsZXIgZnVuY3Rpb25zCiAgeGVuL3NjaGVkOiBsZXQgc2NoZWRfc3dpdGNoX3NjaGVkKCkg
cmV0dXJuIG5ldyBsb2NrIGFkZHJlc3MKICB4ZW4vc2NoZWQ6IHVzZSBuZXcgc2NoZWRfdW5pdCBp
bnN0ZWFkIG9mIHZjcHUgaW4gc2NoZWR1bGVyIGludGVyZmFjZXMKICB4ZW4vc2NoZWQ6IGFsbG9j
IHN0cnVjdCBzY2hlZF91bml0IGZvciBlYWNoIHZjcHUKICB4ZW4vc2NoZWQ6IG1vdmUgcGVyLXZj
cHUgc2NoZWR1bGVyIHByaXZhdGUgZGF0YSBwb2ludGVyIHRvIHNjaGVkX3VuaXQKICB4ZW4vc2No
ZWQ6IGJ1aWxkIGEgbGlua2VkIGxpc3Qgb2Ygc3RydWN0IHNjaGVkX3VuaXQKICB4ZW4vc2NoZWQ6
IGludHJvZHVjZSBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UKICB4ZW4vc2NoZWQ6IGxldCBwaWNrX2Nw
dSByZXR1cm4gYSBzY2hlZHVsZXIgcmVzb3VyY2UKICB4ZW4vc2NoZWQ6IHN3aXRjaCBzY2hlZHVs
ZV9kYXRhLmN1cnIgdG8gcG9pbnQgYXQgc2NoZWRfdW5pdAogIHhlbi9zY2hlZDogbW92ZSBwZXIg
Y3B1IHNjaGVkdWxlciBwcml2YXRlIGRhdGEgaW50byBzdHJ1Y3QKICAgIHNjaGVkX3Jlc291cmNl
CiAgeGVuL3NjaGVkOiBzd2l0Y2ggdmNwdV9zY2hlZHVsZV9sb2NrIHRvIHVuaXRfc2NoZWR1bGVf
bG9jawogIHhlbi9zY2hlZDogbW92ZSBzb21lIHBlci12Y3B1IGl0ZW1zIHRvIHN0cnVjdCBzY2hl
ZF91bml0CiAgeGVuL3NjaGVkOiBhZGQgc2NoZWR1bGVyIGhlbHBlcnMgaGlkaW5nIHZjcHUKICB4
ZW4vc2NoZWQ6IGFkZCBkb21haW4gcG9pbnRlciB0byBzdHJ1Y3Qgc2NoZWRfdW5pdAogIHhlbi9z
Y2hlZDogYWRkIGlkIHRvIHN0cnVjdCBzY2hlZF91bml0CiAgeGVuL3NjaGVkOiByZW5hbWUgc2No
ZWR1bGVyIHJlbGF0ZWQgcGVyZiBjb3VudGVycwogIHhlbi9zY2hlZDogc3dpdGNoIHN0cnVjdCB0
YXNrX3NsaWNlIGZyb20gdmNwdSB0byBzY2hlZF91bml0CiAgeGVuL3NjaGVkOiBhZGQgaXNfcnVu
bmluZyBpbmRpY2F0b3IgdG8gc3RydWN0IHNjaGVkX3VuaXQKICB4ZW4vc2NoZWQ6IG1ha2UgbnVs
bCBzY2hlZHVsZXIgdmNwdSBhZ25vc3RpYy4KICB4ZW4vc2NoZWQ6IG1ha2UgcnQgc2NoZWR1bGVy
IHZjcHUgYWdub3N0aWMuCiAgeGVuL3NjaGVkOiBtYWtlIGNyZWRpdCBzY2hlZHVsZXIgdmNwdSBh
Z25vc3RpYy4KICB4ZW4vc2NoZWQ6IG1ha2UgY3JlZGl0MiBzY2hlZHVsZXIgdmNwdSBhZ25vc3Rp
Yy4KICB4ZW4vc2NoZWQ6IG1ha2UgYXJpbmM2NTMgc2NoZWR1bGVyIHZjcHUgYWdub3N0aWMuCiAg
eGVuOiBhZGQgc2NoZWRfdW5pdF9wYXVzZV9ub3N5bmMoKSBhbmQgc2NoZWRfdW5pdF91bnBhdXNl
KCkKICB4ZW46IGxldCB2Y3B1X2NyZWF0ZSgpIHNlbGVjdCBwcm9jZXNzb3IKICB4ZW4vc2NoZWQ6
IHVzZSBzY2hlZF9yZXNvdXJjZSBjcHUgaW5zdGVhZCBzbXBfcHJvY2Vzc29yX2lkIGluCiAgICBz
Y2hlZHVsZXJzCiAgeGVuL3NjaGVkOiBzd2l0Y2ggc2NoZWR1bGUoKSBmcm9tIHZjcHVzIHRvIHNj
aGVkX3VuaXRzCiAgeGVuL3NjaGVkOiBzd2l0Y2ggc2NoZWRfbW92ZV9pcnFzKCkgdG8gdGFrZSBz
Y2hlZF91bml0IGFzIHBhcmFtZXRlcgogIHhlbjogc3dpdGNoIGZyb20gZm9yX2VhY2hfdmNwdSgp
IHRvIGZvcl9lYWNoX3NjaGVkX3VuaXQoKQogIHhlbi9zY2hlZDogYWRkIHJ1bnN0YXRlIGNvdW50
ZXJzIHRvIHN0cnVjdCBzY2hlZF91bml0CiAgeGVuL3NjaGVkOiByZXdvcmsgYW5kIHJlbmFtZSB2
Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoKQogIHhlbi9zY2hlZDogQ2hhbmdlIHZjcHVfbWlncmF0ZV8q
KCkgdG8gb3BlcmF0ZSBvbiBzY2hlZHVsZSB1bml0CiAgeGVuL3NjaGVkOiBtb3ZlIHN0cnVjdCB0
YXNrX3NsaWNlIGludG8gc3RydWN0IHNjaGVkX3VuaXQKICB4ZW4vc2NoZWQ6IGFkZCBjb2RlIHRv
IHN5bmMgc2NoZWR1bGluZyBvZiBhbGwgdmNwdXMgb2YgYSBzY2hlZCB1bml0CiAgeGVuL3NjaGVk
OiBpbnRyb2R1Y2UgdW5pdF9ydW5uYWJsZV9zdGF0ZSgpCiAgeGVuL3NjaGVkOiBhZGQgc3VwcG9y
dCBmb3IgbXVsdGlwbGUgdmNwdXMgcGVyIHNjaGVkIHVuaXQgd2hlcmUgbWlzc2luZwogIHg4Njog
bWFrZSBsb2FkaW5nIG9mIEdEVCBhdCBjb250ZXh0IHN3aXRjaCBtb3JlIG1vZHVsYXIKICB4ODY6
IG9wdGltaXplIGxvYWRpbmcgb2YgR0RUIGF0IGNvbnRleHQgc3dpdGNoCiAgeGVuL3NjaGVkOiBt
b2RpZnkgY3B1cG9vbF9kb21haW5fY3B1bWFzaygpIHRvIGJlIGFuIHVuaXQgbWFzawogIHhlbi9z
Y2hlZDogc3VwcG9ydCBhbGxvY2F0aW5nIG11bHRpcGxlIHZjcHVzIGludG8gb25lIHNjaGVkIHVu
aXQKICB4ZW4vc2NoZWQ6IGFkZCBhIHNjaGVkdWxlcl9wZXJjcHVfaW5pdCgpIGZ1bmN0aW9uCiAg
eGVuL3NjaGVkOiBhZGQgYSBwZXJjcHUgcmVzb3VyY2UgaW5kZXgKICB4ZW4vc2NoZWQ6IGFkZCBm
YWxsIGJhY2sgdG8gaWRsZSB2Y3B1IHdoZW4gc2NoZWR1bGluZyB1bml0CiAgeGVuL3NjaGVkOiBt
YWtlIHZjcHVfd2FrZSgpIGFuZCB2Y3B1X3NsZWVwKCkgY29yZSBzY2hlZHVsaW5nIGF3YXJlCiAg
eGVuL3NjaGVkOiBjYXJ2ZSBvdXQgZnJlZWluZyBzY2hlZF91bml0IG1lbW9yeSBpbnRvIGRlZGlj
YXRlZCBmdW5jdGlvbgogIHhlbi9zY2hlZDogbW92ZSBwZXItY3B1IHZhcmlhYmxlIHNjaGVkdWxl
ciB0byBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UKICB4ZW4vc2NoZWQ6IG1vdmUgcGVyLWNwdSB2YXJp
YWJsZSBjcHVwb29sIHRvIHN0cnVjdCBzY2hlZF9yZXNvdXJjZQogIHhlbi9zY2hlZDogcmVqZWN0
IHN3aXRjaGluZyBzbXQgb24vb2ZmIHdpdGggY29yZSBzY2hlZHVsaW5nIGFjdGl2ZQogIHhlbi9z
Y2hlZDogcHJlcGFyZSBwZXItY3B1cG9vbCBzY2hlZHVsaW5nIGdyYW51bGFyaXR5CiAgeGVuL3Nj
aGVkOiB1c2Ugb25lIHNjaGVkdWxlIGxvY2sgZm9yIGFsbCBmcmVlIGNwdXMKICB4ZW4vc2NoZWQ6
IHBvcHVsYXRlIGNwdXBvb2wwIG9ubHkgYWZ0ZXIgYWxsIGNwdXMgYXJlIHVwCiAgeGVuL3NjaGVk
OiByZW1vdmUgY3B1IGZyb20gcG9vbDAgYmVmb3JlIHJlbW92aW5nIGl0CiAgeGVuL3NjaGVkOiBh
ZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1bGVyIGZvciBmcmVlIGNwdXMKICB4ZW4vc2NoZWQ6
IHNwbGl0IHNjaGVkdWxlX2NwdV9zd2l0Y2goKQogIHhlbi9zY2hlZDogcHJvdGVjdCBzY2hlZHVs
aW5nIHJlc291cmNlIHZpYSByY3UKICB4ZW4vc2NoZWQ6IHN1cHBvcnQgbXVsdGlwbGUgY3B1cyBw
ZXIgc2NoZWR1bGluZyByZXNvdXJjZQogIHhlbi9zY2hlZDogc3VwcG9ydCBkaWZmZXJpbmcgZ3Jh
bnVsYXJpdHkgaW4gc2NoZWR1bGVfY3B1X1thZGQvcm1dKCkKICB4ZW4vc2NoZWQ6IHN1cHBvcnQg
Y29yZSBzY2hlZHVsaW5nIGZvciBtb3ZpbmcgY3B1cyB0by9mcm9tIGNwdXBvb2xzCiAgeGVuL3Nj
aGVkOiBhZGQgc2NoZWR1bGluZyBncmFudWxhcml0eSBlbnVtCgogeGVuL2FyY2gvYXJtL2RvbWFp
bi5jICAgICAgICAgICAgIHwgICAgMiArLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAg
ICAgIHwgICAxMyArLQogeGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYyAgICAgIHwgICAgMSAt
CiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAgICAgICAgfCAgICAzICsKIHhlbi9hcmNoL3g4
Ni9jcHUvbWNoZWNrL21jZS5jICAgICB8ICAgIDEgLQogeGVuL2FyY2gveDg2L2NwdS9tY2hlY2sv
bWN0ZWxlbS5jIHwgICAgMSAtCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgfCAg
IDEwICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgfCAgIDkzICstCiB4ZW4v
YXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyAgICAgfCAgICA5ICstCiB4ZW4vYXJjaC94ODYvcHYv
ZG9tMF9idWlsZC5jICAgICAgfCAgIDEwICstCiB4ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9w
LmMgICAgfCAgICAxICsKIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgICAgICAgICB8ICAgIDQg
Ky0KIHhlbi9hcmNoL3g4Ni9wdi90cmFwcy5jICAgICAgICAgICB8ICAgIDUgKy0KIHhlbi9hcmNo
L3g4Ni9zZXR1cC5jICAgICAgICAgICAgICB8ICAgIDEgLQogeGVuL2FyY2gveDg2L3NtcGJvb3Qu
YyAgICAgICAgICAgIHwgICAgMSAtCiB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgICAgICAg
fCAgICAzICstCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICAgICAgfCAgICA5ICstCiB4
ZW4vY29tbW9uL2NwdXBvb2wuYyAgICAgICAgICAgICAgfCAgMzI2ICsrKystLS0KIHhlbi9jb21t
b24vZG9tYWluLmMgICAgICAgICAgICAgICB8ICAgMzQgKy0KIHhlbi9jb21tb24vZG9tY3RsLmMg
ICAgICAgICAgICAgICB8ICAgMjMgKy0KIHhlbi9jb21tb24va2V5aGFuZGxlci5jICAgICAgICAg
ICB8ICAgIDQgKy0KIHhlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYyAgICAgICB8ICAyNzAgKysr
LS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jICAgICAgICAgfCAgNzgzICsrKysrKysrLS0t
LS0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgICAgICAgIHwgMTEzNCArKysrKysrKysr
Ky0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX251bGwuYyAgICAgICAgICAgfCAgNDQzICsr
KysrLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9ydC5jICAgICAgICAgICAgIHwgIDU1NSArKysrKy0t
LS0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgICAgICAgIHwgMTkyMyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB4ZW4vY29tbW9uL3NvZnRpcnEuYyAgICAgICAg
ICAgICAgfCAgICA2ICstCiB4ZW4vY29tbW9uL3dhaXQuYyAgICAgICAgICAgICAgICAgfCAgICA0
ICstCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2N1cnJlbnQuaCAgICAgfCAgICAxICsKIHhlbi9pbmNs
dWRlL2FzbS14ODYvY3B1aWRsZS5oICAgICB8ICAgMTEgLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9j
dXJyZW50LmggICAgIHwgICAgNyArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9kZXNjLmggICAgICAg
IHwgICAgMSArCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbTBfYnVpbGQuaCAgfCAgICAzICstCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oICAgICAgICAgfCAgICAzICsKIHhlbi9pbmNsdWRlL3hl
bi9kb21haW4uaCAgICAgICAgICB8ICAgIDMgKy0KIHhlbi9pbmNsdWRlL3hlbi9wZXJmY19kZWZu
LmggICAgICB8ICAgMzIgKy0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oICAgICAgICB8ICA0
NDQgKysrKysrKy0tCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgfCAgIDk5ICst
CiB4ZW4vaW5jbHVkZS94ZW4vc29mdGlycS5oICAgICAgICAgfCAgICAxICsKIDQwIGZpbGVzIGNo
YW5nZWQsIDM5MDUgaW5zZXJ0aW9ucygrKSwgMjM3MiBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
