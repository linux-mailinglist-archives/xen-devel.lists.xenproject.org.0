Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9420A2C48A
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:38:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZRb-0007sC-Ih; Tue, 28 May 2019 10:34:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQK-00056F-JG
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:40 +0000
X-Inumbo-ID: 099648cc-8134-11e9-9c04-7f1aa7400b05
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 099648cc-8134-11e9-9c04-7f1aa7400b05;
 Tue, 28 May 2019 10:33:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C3D58AFF9;
 Tue, 28 May 2019 10:33:30 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:33:08 +0200
Message-Id: <20190528103313.1343-56-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 55/60] xen/sched: split schedule_cpu_switch()
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

SW5zdGVhZCBvZiBsZXR0aW5nIHNjaGVkdWxlX2NwdV9zd2l0Y2goKSBoYW5kbGUgbW92aW5nIGNw
dXMgZnJvbSBhbmQKdG8gY3B1cG9vbHMsIHNwbGl0IGl0IGludG8gc2NoZWR1bGVfY3B1X2FkZCgp
IGFuZCBzY2hlZHVsZV9jcHVfcm0oKS4KClRoaXMgd2lsbCBhbGxvdyB1cyB0byBkcm9wIGFsbG9j
YXRpbmcvZnJlZWluZyBzY2hlZHVsZXIgZGF0YSBmb3IgZnJlZQpjcHVzIGFzIHRoZSBpZGxlIHNj
aGVkdWxlciBkb2Vzbid0IG5lZWQgc3VjaCBkYXRhLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KVjE6IG5ldyBwYXRjaAotLS0KIHhlbi9jb21tb24v
Y3B1cG9vbC5jICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICB8IDEyMSArKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oIHwgICAzICstCiAzIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyks
IDU2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1cG9vbC5jIGIveGVu
L2NvbW1vbi9jcHVwb29sLmMKaW5kZXggYWI0YTJiZTRmYy4uMzUxMDhiOTExOSAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKQEAgLTI2
OCw3ICsyNjgsNyBAQCBzdGF0aWMgaW50IGNwdXBvb2xfYXNzaWduX2NwdV9sb2NrZWQoc3RydWN0
IGNwdXBvb2wgKmMsIHVuc2lnbmVkIGludCBjcHUpCiAKICAgICBpZiAoIChjcHVwb29sX21vdmlu
Z19jcHUgPT0gY3B1KSAmJiAoYyAhPSBjcHVwb29sX2NwdV9tb3ZpbmcpICkKICAgICAgICAgcmV0
dXJuIC1FQUREUk5PVEFWQUlMOwotICAgIHJldCA9IHNjaGVkdWxlX2NwdV9zd2l0Y2goY3B1LCBj
KTsKKyAgICByZXQgPSBzY2hlZHVsZV9jcHVfYWRkKGNwdSwgYyk7CiAgICAgaWYgKCByZXQgKQog
ICAgICAgICByZXR1cm4gcmV0OwogCkBAIC0zMTgsNyArMzE4LDcgQEAgc3RhdGljIGludCBjcHVw
b29sX3VuYXNzaWduX2NwdV9lcGlsb2d1ZShzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICAgKi8KICAg
ICBpZiAoICFyZXQgKQogICAgIHsKLSAgICAgICAgcmV0ID0gc2NoZWR1bGVfY3B1X3N3aXRjaChj
cHUsIE5VTEwpOworICAgICAgICByZXQgPSBzY2hlZHVsZV9jcHVfcm0oY3B1KTsKICAgICAgICAg
aWYgKCByZXQgKQogICAgICAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmY3B1cG9vbF9m
cmVlX2NwdXMpOwogICAgICAgICBlbHNlCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggZDNlNGFlMjI2Yy4uMGY2NjcwNjhhOCAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1
bGUuYwpAQCAtODMsMTUgKzgzLDYgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKl9f
c3RhcnRfc2NoZWR1bGVyc19hcnJheVtdLCAqX19lbmRfc2NoZWR1bGVyc19hcnIKIAogc3RhdGlj
IHN0cnVjdCBzY2hlZHVsZXIgX19yZWFkX21vc3RseSBvcHM7CiAKLXN0YXRpYyBzcGlubG9ja190
ICoKLXNjaGVkX2lkbGVfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMsIHVu
c2lnbmVkIGludCBjcHUsCi0gICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpwZGF0YSwgdm9p
ZCAqdmRhdGEpCi17Ci0gICAgc2NoZWRfaWRsZV91bml0KGNwdSktPnByaXYgPSBOVUxMOwotCi0g
ICAgcmV0dXJuICZzY2hlZF9mcmVlX2NwdV9sb2NrOwotfQotCiBzdGF0aWMgc3RydWN0IHNjaGVk
X3Jlc291cmNlICoKIHNjaGVkX2lkbGVfcmVzX3BpY2soY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIHsKQEAgLTEzMSw3ICsxMjIsNiBAQCBzdGF0
aWMgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9pZGxlX29wcyA9IHsKIAogICAgIC5hbGxvY192ZGF0
YSAgICA9IHNjaGVkX2lkbGVfYWxsb2NfdmRhdGEsCiAgICAgLmZyZWVfdmRhdGEgICAgID0gc2No
ZWRfaWRsZV9mcmVlX3ZkYXRhLAotICAgIC5zd2l0Y2hfc2NoZWQgICA9IHNjaGVkX2lkbGVfc3dp
dGNoX3NjaGVkLAogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgdmNwdSAqdW5pdDJ2Y3B1X2Nw
dShzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKQEAgLTI0MDcsMzYgKzIzOTcsMjIgQEAgdm9pZCBf
X2luaXQgc2NoZWR1bGVyX2luaXQodm9pZCkKIH0KIAogLyoKLSAqIE1vdmUgYSBwQ1BVIG91dHNp
ZGUgb2YgdGhlIGluZmx1ZW5jZSBvZiB0aGUgc2NoZWR1bGVyIG9mIGl0cyBjdXJyZW50Ci0gKiBj
cHVwb29sLCBvciBzdWJqZWN0IGl0IHRvIHRoZSBzY2hlZHVsZXIgb2YgYSBuZXcgY3B1cG9vbC4K
LSAqCi0gKiBGb3IgdGhlIHBDUFVzIHRoYXQgYXJlIHJlbW92ZWQgZnJvbSB0aGVpciBjcHVwb29s
LCB0aGVpciBzY2hlZHVsZXIgYmVjb21lcwotICogJnNjaGVkX2lkbGVfb3BzICh0aGUgaWRsZSBz
Y2hlZHVsZXIpLgorICogTW92ZSBhIHBDUFUgZnJvbSBmcmVlIGNwdXMgKHJ1bm5pbmcgdGhlIGlk
bGUgc2NoZWR1bGVyKSB0byBhIGNwdXBvb2wKKyAqIHVzaW5nIGFueSAicmVhbCIgc2NoZWR1bGVy
LgorICogVGhlIGNwdSBpcyBzdGlsbCBtYXJrZWQgYXMgImZyZWUiIGFuZCBub3QgeWV0IHZhbGlk
IGZvciBpdHMgY3B1cG9vbC4KICAqLwotaW50IHNjaGVkdWxlX2NwdV9zd2l0Y2godW5zaWduZWQg
aW50IGNwdSwgc3RydWN0IGNwdXBvb2wgKmMpCitpbnQgc2NoZWR1bGVfY3B1X2FkZCh1bnNpZ25l
ZCBpbnQgY3B1LCBzdHJ1Y3QgY3B1cG9vbCAqYykKIHsKICAgICBzdHJ1Y3QgdmNwdSAqaWRsZTsK
LSAgICB2b2lkICpwcHJpdiwgKnBwcml2X29sZCwgKnZwcml2LCAqdnByaXZfb2xkOwotICAgIHN0
cnVjdCBzY2hlZHVsZXIgKm9sZF9vcHMgPSBnZXRfc2NoZWRfcmVzKGNwdSktPnNjaGVkdWxlcjsK
LSAgICBzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdfb3BzID0gKGMgPT0gTlVMTCkgPyAmc2NoZWRfaWRs
ZV9vcHMgOiBjLT5zY2hlZDsKKyAgICB2b2lkICpwcHJpdiwgKnZwcml2OworICAgIHN0cnVjdCBz
Y2hlZHVsZXIgKm5ld19vcHMgPSBjLT5zY2hlZDsKICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2Ug
KnNkID0gZ2V0X3NjaGVkX3JlcyhjcHUpOwotICAgIHN0cnVjdCBjcHVwb29sICpvbGRfcG9vbCA9
IHNkLT5jcHVwb29sOwogICAgIHNwaW5sb2NrX3QgKm9sZF9sb2NrLCAqbmV3X2xvY2s7CiAgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsKIAotICAgIC8qCi0gICAgICogcENQVXMgb25seSBtb3ZlIGZy
b20gYSB2YWxpZCBjcHVwb29sIHRvIGZyZWUgKGkuZS4sIG91dCBvZiBhbnkgcG9vbCksCi0gICAg
ICogb3IgZnJvbSBmcmVlIHRvIGEgdmFsaWQgY3B1cG9vbC4gSW4gdGhlIGZvcm1lciBjYXNlICh3
aGljaCBoYXBwZW5zIHdoZW4KLSAgICAgKiBjIGlzIE5VTEwpLCB3ZSB3YW50IHRoZSBDUFUgdG8g
aGF2ZSBiZWVuIG1hcmtlZCBhcyBmcmVlIGFscmVhZHksIGFzCi0gICAgICogd2VsbCBhcyB0byBu
b3QgYmUgdmFsaWQgZm9yIHRoZSBzb3VyY2UgcG9vbCBhbnkgbG9uZ2VyLCB3aGVuIHdlIGdldCB0
bwotICAgICAqIGhlcmUuIEluIHRoZSBsYXR0ZXIgY2FzZSAod2hpY2ggaGFwcGVucyB3aGVuIGMg
aXMgYSB2YWxpZCBjcHVwb29sKSwgd2UKLSAgICAgKiB3YW50IHRoZSBDUFUgdG8gc3RpbGwgYmUg
bWFya2VkIGFzIGZyZWUsIGFzIHdlbGwgYXMgdG8gbm90IHlldCBiZSB2YWxpZAotICAgICAqIGZv
ciB0aGUgZGVzdGluYXRpb24gcG9vbC4KLSAgICAgKi8KLSAgICBBU1NFUlQoYyAhPSBvbGRfcG9v
bCAmJiAoYyAhPSBOVUxMIHx8IG9sZF9wb29sICE9IE5VTEwpKTsKICAgICBBU1NFUlQoY3B1bWFz
a190ZXN0X2NwdShjcHUsICZjcHVwb29sX2ZyZWVfY3B1cykpOwotICAgIEFTU0VSVCgoYyA9PSBO
VUxMICYmICFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgb2xkX3Bvb2wtPmNwdV92YWxpZCkpIHx8Ci0g
ICAgICAgICAgIChjICE9IE5VTEwgJiYgIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCBjLT5jcHVfdmFs
aWQpKSk7CisgICAgQVNTRVJUKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgYy0+Y3B1X3ZhbGlkKSk7
CisgICAgQVNTRVJUKGdldF9zY2hlZF9yZXMoY3B1KS0+Y3B1cG9vbCA9PSBOVUxMKTsKIAogICAg
IC8qCiAgICAgICogVG8gc2V0dXAgdGhlIGNwdSBmb3IgdGhlIG5ldyBzY2hlZHVsZXIgd2UgbmVl
ZDoKQEAgLTI0NjEsNTIgKzI0MzcsOTEgQEAgaW50IHNjaGVkdWxlX2NwdV9zd2l0Y2godW5zaWdu
ZWQgaW50IGNwdSwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwog
ICAgIH0KIAotICAgIHNjaGVkX2RvX3RpY2tfc3VzcGVuZChvbGRfb3BzLCBjcHUpOwotCiAgICAg
LyoKLSAgICAgKiBUaGUgYWN0dWFsIHN3aXRjaCwgaW5jbHVkaW5nIChpZiBuZWNlc3NhcnkpIHRo
ZSByZXJvdXRpbmcgb2YgdGhlCi0gICAgICogc2NoZWR1bGVyIGxvY2sgdG8gd2hhdGV2ZXIgbmV3
X29wcyBwcmVmZXJzLCAgbmVlZHMgdG8gaGFwcGVuIGluIG9uZQotICAgICAqIGNyaXRpY2FsIHNl
Y3Rpb24sIHByb3RlY3RlZCBieSBvbGRfb3BzJyBsb2NrLCBvciByYWNlcyBhcmUgcG9zc2libGUu
Ci0gICAgICogSXQgaXMsIGluIGZhY3QsIHRoZSBsb2NrIG9mIGFub3RoZXIgc2NoZWR1bGVyIHRo
YXQgd2UgYXJlIHRha2luZyAodGhlCi0gICAgICogc2NoZWR1bGVyIG9mIHRoZSBjcHVwb29sIHRo
YXQgY3B1IHN0aWxsIGJlbG9uZ3MgdG8pLiBCdXQgdGhhdCBpcyBvawotICAgICAqIGFzLCBhbnlv
bmUgdHJ5aW5nIHRvIHNjaGVkdWxlIG9uIHRoaXMgY3B1IHdpbGwgc3BpbiB1bnRpbCB3aGVuIHdl
Ci0gICAgICogcmVsZWFzZSB0aGF0IGxvY2sgKGJvdHRvbSBvZiB0aGlzIGZ1bmN0aW9uKS4gV2hl
biBoZSdsbCBnZXQgdGhlIGxvY2sKLSAgICAgKiAtLXRoYW5rcyB0byB0aGUgbG9vcCBpbnNpZGUg
Kl9zY2hlZHVsZV9sb2NrKCkgZnVuY3Rpb25zLS0gaGUnbGwgbm90aWNlCi0gICAgICogdGhhdCB0
aGUgbG9jayBpdHNlbGYgY2hhbmdlZCwgYW5kIHJldHJ5IGFjcXVpcmluZyB0aGUgbmV3IG9uZSAo
d2hpY2gKLSAgICAgKiB3aWxsIGJlIHRoZSBjb3JyZWN0LCByZW1hcHBlZCBvbmUsIGF0IHRoYXQg
cG9pbnQpLgorICAgICAqIFRoZSBhY3R1YWwgc3dpdGNoLCBpbmNsdWRpbmcgdGhlIHJlcm91dGlu
ZyBvZiB0aGUgc2NoZWR1bGVyIGxvY2sgdG8KKyAgICAgKiB3aGF0ZXZlciBuZXdfb3BzIHByZWZl
cnMsIG5lZWRzIHRvIGhhcHBlbiBpbiBvbmUgY3JpdGljYWwgc2VjdGlvbiwKKyAgICAgKiBwcm90
ZWN0ZWQgYnkgb2xkX29wcycgbG9jaywgb3IgcmFjZXMgYXJlIHBvc3NpYmxlLgorICAgICAqIEl0
IGlzLCBpbiBmYWN0LCB0aGUgbG9jayBvZiB0aGUgaWRsZSBzY2hlZHVsZXIgdGhhdCB3ZSBhcmUg
dGFraW5nLgorICAgICAqIEJ1dCB0aGF0IGlzIG9rIGFzIGFueW9uZSB0cnlpbmcgdG8gc2NoZWR1
bGUgb24gdGhpcyBjcHUgd2lsbCBzcGluIHVudGlsCisgICAgICogd2hlbiB3ZSByZWxlYXNlIHRo
YXQgbG9jayAoYm90dG9tIG9mIHRoaXMgZnVuY3Rpb24pLiBXaGVuIGhlJ2xsIGdldCB0aGUKKyAg
ICAgKiBsb2NrIC0tdGhhbmtzIHRvIHRoZSBsb29wIGluc2lkZSAqX3NjaGVkdWxlX2xvY2soKSBm
dW5jdGlvbnMtLSBoZSdsbAorICAgICAqIG5vdGljZSB0aGF0IHRoZSBsb2NrIGl0c2VsZiBjaGFu
Z2VkLCBhbmQgcmV0cnkgYWNxdWlyaW5nIHRoZSBuZXcgb25lCisgICAgICogKHdoaWNoIHdpbGwg
YmUgdGhlIGNvcnJlY3QsIHJlbWFwcGVkIG9uZSwgYXQgdGhhdCBwb2ludCkuCiAgICAgICovCiAg
ICAgb2xkX2xvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShjcHUsICZmbGFncyk7CiAK
LSAgICB2cHJpdl9vbGQgPSBpZGxlLT5zY2hlZF91bml0LT5wcml2OwotICAgIHBwcml2X29sZCA9
IHNkLT5zY2hlZF9wcml2OwogICAgIG5ld19sb2NrID0gc2NoZWRfc3dpdGNoX3NjaGVkKG5ld19v
cHMsIGNwdSwgcHByaXYsIHZwcml2KTsKIAogICAgIHNkLT5zY2hlZHVsZXIgPSBuZXdfb3BzOwog
ICAgIHNkLT5zY2hlZF9wcml2ID0gcHByaXY7CiAKICAgICAvKgotICAgICAqIChSZT8pcm91dGUg
dGhlIGxvY2sgdG8gdGhlIHBlciBwQ1BVIGxvY2sgYXMgL2xhc3QvIHRoaW5nLiBJbiBmYWN0LAor
ICAgICAqIFJlcm91dGUgdGhlIGxvY2sgdG8gdGhlIHBlciBwQ1BVIGxvY2sgYXMgL2xhc3QvIHRo
aW5nLiBJbiBmYWN0LAogICAgICAqIGlmIGl0IGlzIGZyZWUgKGFuZCBpdCBjYW4gYmUpIHdlIHdh
bnQgdGhhdCBhbnlvbmUgdGhhdCBtYW5hZ2VzCiAgICAgICogdGFraW5nIGl0LCBmaW5kcyBhbGwg
dGhlIGluaXRpYWxpemF0aW9ucyB3ZSd2ZSBkb25lIGFib3ZlIGluIHBsYWNlLgogICAgICAqLwog
ICAgIHNtcF9tYigpOwogICAgIHNkLT5zY2hlZHVsZV9sb2NrID0gbmV3X2xvY2s7CiAKLSAgICAv
KiBfTm90XyBwY3B1X3NjaGVkdWxlX3VubG9jaygpOiBzY2hlZHVsZV9sb2NrIG1heSBoYXZlIGNo
YW5nZWQhICovCisgICAgLyogX05vdF8gcGNwdV9zY2hlZHVsZV91bmxvY2soKTogc2NoZWR1bGVf
bG9jayBoYXMgY2hhbmdlZCEgKi8KICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKG9sZF9sb2Nr
LCBmbGFncyk7CiAKICAgICBzY2hlZF9kb190aWNrX3Jlc3VtZShuZXdfb3BzLCBjcHUpOwogCisg
ICAgc2QtPmdyYW51bGFyaXR5ID0gYy0+Z3JhbnVsYXJpdHk7CisgICAgc2QtPmNwdXBvb2wgPSBj
OworICAgIC8qIFRoZSAgY3B1IGlzIGFkZGVkIHRvIGEgcG9vbCwgdHJpZ2dlciBpdCB0byBnbyBw
aWNrIHVwIHNvbWUgd29yayAqLworICAgIGNwdV9yYWlzZV9zb2Z0aXJxKGNwdSwgU0NIRURVTEVf
U09GVElSUSk7CisKKyAgICByZXR1cm4gMDsKK30KKworLyoKKyAqIFJlbW92ZSBhIHBDUFUgZnJv
bSBpdHMgY3B1cG9vbC4gSXRzIHNjaGVkdWxlciBiZWNvbWVzICZzY2hlZF9pZGxlX29wcworICog
KHRoZSBpZGxlIHNjaGVkdWxlcikuCisgKiBUaGUgY3B1IGlzIGFscmVhZHkgbWFya2VkIGFzICJm
cmVlIiBhbmQgbm90IHZhbGlkIGFueSBsb25nZXIgZm9yIGl0cworICogY3B1cG9vbC4KKyAqLwor
aW50IHNjaGVkdWxlX2NwdV9ybSh1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIHN0cnVjdCB2Y3B1
ICppZGxlOworICAgIHZvaWQgKnBwcml2X29sZCwgKnZwcml2X29sZDsKKyAgICBzdHJ1Y3Qgc2No
ZWRfcmVzb3VyY2UgKnNkID0gZ2V0X3NjaGVkX3JlcyhjcHUpOworICAgIHN0cnVjdCBzY2hlZHVs
ZXIgKm9sZF9vcHMgPSBzZC0+c2NoZWR1bGVyOworICAgIHNwaW5sb2NrX3QgKm9sZF9sb2NrOwor
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CisKKyAgICBBU1NFUlQoc2QtPmNwdXBvb2wgIT0gTlVM
TCk7CisgICAgQVNTRVJUKGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmY3B1cG9vbF9mcmVlX2NwdXMp
KTsKKyAgICBBU1NFUlQoIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCBzZC0+Y3B1cG9vbC0+Y3B1X3Zh
bGlkKSk7CisKKyAgICBpZGxlID0gaWRsZV92Y3B1W2NwdV07CisKKyAgICBzY2hlZF9kb190aWNr
X3N1c3BlbmQob2xkX29wcywgY3B1KTsKKworICAgIC8qIFNlZSBjb21tZW50IGluIHNjaGVkdWxl
X2NwdV9hZGQoKSByZWdhcmRpbmcgbG9jayBzd2l0Y2hpbmcuICovCisgICAgb2xkX2xvY2sgPSBw
Y3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShjcHUsICZmbGFncyk7CisKKyAgICB2cHJpdl9vbGQg
PSBpZGxlLT5zY2hlZF91bml0LT5wcml2OworICAgIHBwcml2X29sZCA9IHNkLT5zY2hlZF9wcml2
OworCisgICAgaWRsZS0+c2NoZWRfdW5pdC0+cHJpdiA9IE5VTEw7CisgICAgc2QtPnNjaGVkdWxl
ciA9ICZzY2hlZF9pZGxlX29wczsKKyAgICBzZC0+c2NoZWRfcHJpdiA9IE5VTEw7CisKKyAgICBz
bXBfbWIoKTsKKyAgICBzZC0+c2NoZWR1bGVfbG9jayA9ICZzY2hlZF9mcmVlX2NwdV9sb2NrOwor
CisgICAgLyogX05vdF8gcGNwdV9zY2hlZHVsZV91bmxvY2soKTogc2NoZWR1bGVfbG9jayBtYXkg
aGF2ZSBjaGFuZ2VkISAqLworICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUob2xkX2xvY2ssIGZs
YWdzKTsKKwogICAgIHNjaGVkX2RlaW5pdF9wZGF0YShvbGRfb3BzLCBwcHJpdl9vbGQsIGNwdSk7
CiAKICAgICBzY2hlZF9mcmVlX3ZkYXRhKG9sZF9vcHMsIHZwcml2X29sZCk7CiAgICAgc2NoZWRf
ZnJlZV9wZGF0YShvbGRfb3BzLCBwcHJpdl9vbGQsIGNwdSk7CiAKLSAgICBnZXRfc2NoZWRfcmVz
KGNwdSktPmdyYW51bGFyaXR5ID0gYyA/IGMtPmdyYW51bGFyaXR5IDogMTsKLSAgICBnZXRfc2No
ZWRfcmVzKGNwdSktPmNwdXBvb2wgPSBjOwotICAgIC8qIFdoZW4gYSBjcHUgaXMgYWRkZWQgdG8g
YSBwb29sLCB0cmlnZ2VyIGl0IHRvIGdvIHBpY2sgdXAgc29tZSB3b3JrICovCi0gICAgaWYgKCBj
ICE9IE5VTEwgKQotICAgICAgICBjcHVfcmFpc2Vfc29mdGlycShjcHUsIFNDSEVEVUxFX1NPRlRJ
UlEpOworICAgIHNkLT5ncmFudWxhcml0eSA9IDE7CisgICAgc2QtPmNwdXBvb2wgPSBOVUxMOwog
CiAgICAgcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IGU2ODliYmEzNjEuLjljZWUwZWM5YTMgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oCkBAIC05MDgsNyArOTA4LDggQEAgc3RydWN0IHNjaGVkdWxlcjsKIHN0cnVjdCBzY2hl
ZHVsZXIgKnNjaGVkdWxlcl9nZXRfZGVmYXVsdCh2b2lkKTsKIHN0cnVjdCBzY2hlZHVsZXIgKnNj
aGVkdWxlcl9hbGxvYyh1bnNpZ25lZCBpbnQgc2NoZWRfaWQsIGludCAqcGVycik7CiB2b2lkIHNj
aGVkdWxlcl9mcmVlKHN0cnVjdCBzY2hlZHVsZXIgKnNjaGVkKTsKLWludCBzY2hlZHVsZV9jcHVf
c3dpdGNoKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBjcHVwb29sICpjKTsKK2ludCBzY2hlZHVs
ZV9jcHVfYWRkKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBjcHVwb29sICpjKTsKK2ludCBzY2hl
ZHVsZV9jcHVfcm0odW5zaWduZWQgaW50IGNwdSk7CiB2b2lkIHZjcHVfc2V0X3BlcmlvZGljX3Rp
bWVyKHN0cnVjdCB2Y3B1ICp2LCBzX3RpbWVfdCB2YWx1ZSk7CiBpbnQgY3B1X2Rpc2FibGVfc2No
ZWR1bGVyKHVuc2lnbmVkIGludCBjcHUpOwogLyogV2UgbmVlZCBpdCBpbiBkb20wX3NldHVwX3Zj
cHUgKi8KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
