Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE6C17725F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 10:29:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j93px-0004Jw-Q8; Tue, 03 Mar 2020 09:27:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j93px-0004Jr-2H
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 09:27:37 +0000
X-Inumbo-ID: 37abfd22-5d31-11ea-a0c5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37abfd22-5d31-11ea-a0c5-12813bfff9fa;
 Tue, 03 Mar 2020 09:27:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A8F2AF4C;
 Tue,  3 Mar 2020 09:27:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  3 Mar 2020 10:27:33 +0100
Message-Id: <20200303092733.14983-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/sched: fix error path in
 cpupool_unassign_cpu_start()
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gY2FzZSBtb3ZpbmcgYXdheSBhbGwgZG9tYWlucyBmcm9tIHRoZSBjcHUgdG8gYmUgcmVtb3Zl
ZCBpcyBmYWlsaW5nCmluIGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KCkgdGhlIGVycm9yIHBh
dGggaXMgbWlzc2luZyB0byByZWxlYXNlCnNjaGVkX3Jlc19yY3Vsb2NrLgoKVGhlIG5vcm1hbCBl
eGl0IHBhdGggaXMgcmVsZWFzaW5nIGRvbWxpc3RfcmVhZF9sb2NrIGluc3RlYWQgKHRoaXMgaXMK
Y3VycmVudGx5IG5vIHByb2JsZW0gYXMgdGhlIHJlZmVyZW5jZSB0byB0aGUgc3BlY2lmaWMgcmN1
IGxvY2sgaXMgbm90CnVzZWQgYnkgcmN1X3JlYWRfdW5sb2NrKCkpLgoKV2hpbGUgYXQgaXQgaW5k
ZW50IHRoZSBwcmVzZW50IGVycm9yIGxhYmVsIGJ5IG9uZSBzcGFjZS4KClJlcG9ydGVkLWJ5OiBJ
Z29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KVjI6Ci0gaW5kZW50IGVycm9yIGxhYmVscyAoSmFuIEJl
dWxpY2gpCi0tLQogeGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMgfCA3ICsrKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYwpp
bmRleCBiNzcyMWI1ZDAyLi45ZjcwYzdlYzE3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVk
L2NwdXBvb2wuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYwpAQCAtNDY2LDcgKzQ2
Niw3IEBAIHN0YXRpYyBpbnQgY3B1cG9vbF91bmFzc2lnbl9jcHVfc3RhcnQoc3RydWN0IGNwdXBv
b2wgKmMsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgIH0KICAgICAgICAgcmN1X3JlYWRfdW5s
b2NrKCZkb21saXN0X3JlYWRfbG9jayk7CiAgICAgICAgIGlmICggcmV0ICkKLSAgICAgICAgICAg
IGdvdG8gb3V0OworICAgICAgICAgICAgZ290byBvdXRfcmN1OwogICAgIH0KICAgICBjcHVwb29s
X21vdmluZ19jcHUgPSBjcHU7CiAgICAgYXRvbWljX2luYygmYy0+cmVmY250KTsKQEAgLTQ3NCw4
ICs0NzQsOSBAQCBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KHN0cnVjdCBj
cHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQogICAgIGNwdW1hc2tfYW5kbm90KGMtPmNwdV92
YWxpZCwgYy0+Y3B1X3ZhbGlkLCBjcHVzKTsKICAgICBjcHVtYXNrX2FuZChjLT5yZXNfdmFsaWQs
IGMtPmNwdV92YWxpZCwgJnNjaGVkX3Jlc19tYXNrKTsKIAotICAgIHJjdV9yZWFkX3VubG9jaygm
ZG9tbGlzdF9yZWFkX2xvY2spOwotb3V0OgorIG91dF9yY3U6CisgICAgcmN1X3JlYWRfdW5sb2Nr
KCZzY2hlZF9yZXNfcmN1bG9jayk7Cisgb3V0OgogICAgIHNwaW5fdW5sb2NrKCZjcHVwb29sX2xv
Y2spOwogCiAgICAgcmV0dXJuIHJldDsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
