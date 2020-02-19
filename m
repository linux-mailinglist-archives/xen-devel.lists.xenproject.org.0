Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE076163EA9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 09:14:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4KSi-0008Jz-4u; Wed, 19 Feb 2020 08:12:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4KSg-0008JH-J7
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 08:12:02 +0000
X-Inumbo-ID: 707da246-52ef-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 707da246-52ef-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 08:11:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 159D6B268;
 Wed, 19 Feb 2020 08:11:30 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Feb 2020 09:11:18 +0100
Message-Id: <20200219081126.29534-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v5 0/8] Add hypervisor sysfs-like support
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gdGhlIDIwMTkgWGVuIGRldmVsb3BlciBzdW1taXQgdGhlcmUgd2FzIGFncmVlbWVudCB0aGF0
IHRoZSBYZW4KaHlwZXJ2aXNvciBzaG91bGQgZ2FpbiBzdXBwb3J0IGZvciBhIGhpZXJhcmNoaWNh
bCBuYW1lLXZhbHVlIHN0b3JlCnNpbWlsYXIgdG8gdGhlIExpbnV4IGtlcm5lbCdzIHN5c2ZzLgoK
VGhpcyBpcyBhIGZpcnN0IGltcGxlbWVudGF0aW9uIG9mIHRoYXQgaWRlYSBhZGRpbmcgdGhlIGJh
c2ljCmZ1bmN0aW9uYWxpdHkgdG8gaHlwZXJ2aXNvciBhbmQgdG9vbHMgc2lkZS4gVGhlIGludGVy
ZmFjZSB0byBhbnkKdXNlciBwcm9ncmFtIG1ha2luZyB1c2Ugb2YgdGhhdCAieGVuLWh5cGZzIiBp
cyBhIG5ldyBsaWJyYXJ5CiJsaWJ4ZW5oeXBmcyIgd2l0aCBhIHN0YWJsZSBpbnRlcmZhY2UuCgpB
cyBhIGZvbGxvd3VwIHN3aXRjaGluZyBsaWJ4bCB0byB1c2UgdGhlIGh5cGVydmlzb3IgZmlsZSBz
eXN0ZW0gZm9yCnJ1bnRpbWUgcGFyYW1ldGVyIG1vZGlmaWNhdGlvbnMgaXMgcG9zc2libGUuIFRo
aXMgd291bGQgZW5hYmxlCnJlbW92YWwgb2YgdGhlIFhFTl9TWVNDVExfc2V0X3BhcmFtZXRlciBz
eXNjdGwgb3BlcmF0aW9uLgoKQ2hhbmdlcyBpbiBWNToKLSBzd2l0Y2hlZCB0byB4c20gZm9yIHBy
aXZpbGVnZSBjaGVjawoKQ2hhbmdlcyBpbiBWNDoKLSBmb3JtZXIgcGF0Y2ggMiByZW1vdmVkIGFz
IGFscmVhZHkgY29tbWl0dGVkCi0gYWRkcmVzc2VkIHJldmlldyBjb21tZW50cwoKQ2hhbmdlcyBp
biBWMzoKLSBtYWpvciByZXdvcmssIGVzcGVjaWFsbHkgYnkgc3VwcG9ydGluZyBiaW5hcnkgY29u
dGVudHMgb2YgZW50cmllcwotIGFkZGVkIHNldmVyYWwgbmV3IHBhdGNoZXMgKDEsIDIsIDcpCi0g
ZnVsbCBzdXBwb3J0IG9mIGFsbCBydW50aW1lIHBhcmFtZXRlcnMKLSBzdXBwb3J0IG9mIHdyaXRp
bmcgZW50cmllcyAoZXNwZWNpYWxseSBydW50aW1lIHBhcmFtZXRlcnMpCgpDaGFuZ2VzIGluIFYy
OgotIGFsbCBjb21tZW50cyB0byBWMSBhZGRyZXNzZWQKLSBhZGRlZCBtYW4tcGFnZSBmb3IgeGVu
aHlwZnMgdG9vbAotIGFkZGVkIHJ1bnRpbWUgcGFyYW1ldGVyIHJlYWQgYWNjZXNzIGZvciBzdHJp
bmcgcGFyYW1ldGVycwoKQ2hhbmdlcyBpbiBWMToKLSByZW5hbWVkIHhlbmZzIC0+eGVuaHlwZnMK
LSBhZGRlZCB3cml0YWJsZSBlbnRyaWVzIHN1cHBvcnQgYXQgdGhlIGludGVyZmFjZSBsZXZlbCBh
bmQgaW4gdGhlCiAgeGVuaHlwZnMgdG9vbAotIGFkZGVkIHJ1bnRpbWUgcGFyYW1ldGVyIHJlYWQg
YWNjZXNzIChpbnRlZ2VyIHR5cGUgb25seSBmb3Igbm93KQotIGFkZGVkIGRvY3MvbWlzYy9oeXBm
cy1wYXRocy5wYW5kb2MgZm9yIHBhdGggZGVzY3JpcHRpb25zCgpKdWVyZ2VuIEdyb3NzICg4KToK
ICB4ZW46IGFkZCBhIGdlbmVyaWMgd2F5IHRvIGluY2x1ZGUgYmluYXJ5IGZpbGVzIGFzIHZhcmlh
YmxlcwogIGRvY3M6IGFkZCBmZWF0dXJlIGRvY3VtZW50IGZvciBYZW4gaHlwZXJ2aXNvciBzeXNm
cy1saWtlIHN1cHBvcnQKICB4ZW46IGFkZCBiYXNpYyBoeXBlcnZpc29yIGZpbGVzeXN0ZW0gc3Vw
cG9ydAogIGxpYnM6IGFkZCBsaWJ4ZW5oeXBmcwogIHRvb2xzOiBhZGQgeGVuZnMgdG9vbAogIHhl
bjogcHJvdmlkZSB2ZXJzaW9uIGluZm9ybWF0aW9uIGluIGh5cGZzCiAgeGVuOiBhZGQgL2J1aWxk
aW5mby9jb25maWcgZW50cnkgdG8gaHlwZXJ2aXNvciBmaWxlc3lzdGVtCiAgeGVuOiBhZGQgcnVu
dGltZSBwYXJhbWV0ZXIgYWNjZXNzIHN1cHBvcnQgdG8gaHlwZnMKCiAuZ2l0aWdub3JlICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBkb2NzL2ZlYXR1cmVzL2h5cGVydmlzb3Jmcy5w
YW5kb2MgICB8ICA5MiArKysrKysrCiBkb2NzL21hbi94ZW5oeXBmcy4xLnBvZCAgICAgICAgICAg
ICB8ICA2MSArKysrKwogZG9jcy9taXNjL2h5cGZzLXBhdGhzLnBhbmRvYyAgICAgICAgfCAxNjMg
KysrKysrKysrKysKIHRvb2xzL1J1bGVzLm1rICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsK
IHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL2RvbTAudGUgIHwgICAyICstCiB0b29scy9saWJz
L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArCiB0b29scy9saWJzL2h5cGZzL01ha2Vm
aWxlICAgICAgICAgICB8ICAxNiArKwogdG9vbHMvbGlicy9oeXBmcy9jb3JlLmMgICAgICAgICAg
ICAgfCA1MzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJz
L2h5cGZzL2luY2x1ZGUveGVuaHlwZnMuaCB8ICA3NSArKysrKwogdG9vbHMvbGlicy9oeXBmcy9s
aWJ4ZW5oeXBmcy5tYXAgICAgfCAgMTAgKwogdG9vbHMvbGlicy9oeXBmcy94ZW5oeXBmcy5wYy5p
biAgICAgfCAgMTAgKwogdG9vbHMvbWlzYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDYg
KwogdG9vbHMvbWlzYy94ZW5oeXBmcy5jICAgICAgICAgICAgICAgfCAxODkgKysrKysrKysrKysr
KwogeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gv
YXJtL3hlbi5sZHMuUyAgICAgICAgICAgICAgfCAgIDUgKwogeGVuL2FyY2gveDg2L2h2bS9oeXBl
cmNhbGwuYyAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jICAgICAg
ICAgfCAgMTcgKy0KIHhlbi9hcmNoL3g4Ni9oeXBlcmNhbGwuYyAgICAgICAgICAgIHwgICAxICsK
IHhlbi9hcmNoL3g4Ni9wdi9kb21haW4uYyAgICAgICAgICAgIHwgICA3ICstCiB4ZW4vYXJjaC94
ODYvcHYvaHlwZXJjYWxsLmMgICAgICAgICB8ICAgMSArCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5T
ICAgICAgICAgICAgICB8ICAgNSArCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAg
ICB8ICAxMyArCiB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgICB8ICAxNyArLQog
eGVuL2NvbW1vbi9oeXBmcy5jICAgICAgICAgICAgICAgICAgfCAzOTUgKysrKysrKysrKysrKysr
KysrKysrKysrKysKIHhlbi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgICAgIHwgIDc4ICsr
KysrLQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgICAgICAgICAgfCAgNDkgKysrLQogeGVu
L2luY2x1ZGUvcHVibGljL2h5cGZzLmggICAgICAgICAgfCAxMjcgKysrKysrKysrCiB4ZW4vaW5j
bHVkZS9wdWJsaWMveGVuLmggICAgICAgICAgICB8ICAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vaHlw
ZXJjYWxsLmggICAgICAgICB8ICAgOCArCiB4ZW4vaW5jbHVkZS94ZW4vaHlwZnMuaCAgICAgICAg
ICAgICB8IDExMiArKysrKysrKwogeGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oICAgICAgICAgICAg
fCAgIDMgKwogeGVuL2luY2x1ZGUveGVuL3BhcmFtLmggICAgICAgICAgICAgfCAgNzQgKysrKy0K
IHhlbi9pbmNsdWRlL3hsYXQubHN0ICAgICAgICAgICAgICAgIHwgICAyICsKIHhlbi9pbmNsdWRl
L3hzbS9kdW1teS5oICAgICAgICAgICAgIHwgICA2ICsKIHhlbi9pbmNsdWRlL3hzbS94c20uaCAg
ICAgICAgICAgICAgIHwgICA2ICsKIHhlbi90b29scy9iaW5maWxlICAgICAgICAgICAgICAgICAg
IHwgIDQxICsrKwogeGVuL3hzbS9mbGFzay9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDUgKy0K
IHhlbi94c20vZmxhc2svZmxhc2stcG9saWN5LlMgICAgICAgIHwgIDE2IC0tCiB4ZW4veHNtL2Zs
YXNrL3BvbGljeS9hY2Nlc3NfdmVjdG9ycyB8ICAgMiArCiA0MCBmaWxlcyBjaGFuZ2VkLCAyMTIz
IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3Mv
ZmVhdHVyZXMvaHlwZXJ2aXNvcmZzLnBhbmRvYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvbWFu
L3hlbmh5cGZzLjEucG9kCiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9taXNjL2h5cGZzLXBhdGhz
LnBhbmRvYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMvaHlwZnMvTWFrZWZpbGUKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2h5cGZzL2NvcmUuYwogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL2xpYnMvaHlwZnMvaW5jbHVkZS94ZW5oeXBmcy5oCiBjcmVhdGUgbW9kZSAxMDA2
NDQgdG9vbHMvbGlicy9oeXBmcy9saWJ4ZW5oeXBmcy5tYXAKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy9saWJzL2h5cGZzL3hlbmh5cGZzLnBjLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMv
bWlzYy94ZW5oeXBmcy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9oeXBmcy5jCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvcHVibGljL2h5cGZzLmgKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vaW5jbHVkZS94ZW4vaHlwZnMuaAogY3JlYXRlIG1vZGUgMTAwNzU1IHhlbi90
b29scy9iaW5maWxlCiBkZWxldGUgbW9kZSAxMDA2NDQgeGVuL3hzbS9mbGFzay9mbGFzay1wb2xp
Y3kuUwoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
