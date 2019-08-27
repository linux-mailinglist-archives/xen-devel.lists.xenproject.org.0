Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8429E651
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 13:02:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ZCO-00085o-Kf; Tue, 27 Aug 2019 10:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7YVi=WX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ZCM-00085Y-S4
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 10:59:38 +0000
X-Inumbo-ID: bf9b89c6-c8b9-11e9-ae32-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf9b89c6-c8b9-11e9-ae32-12813bfff9fa;
 Tue, 27 Aug 2019 10:59:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9674AF8D;
 Tue, 27 Aug 2019 10:59:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 27 Aug 2019 12:59:27 +0200
Message-Id: <20190827105928.1769-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190827105928.1769-1-jgross@suse.com>
References: <20190827105928.1769-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 2/3] xen/sched: remove cpu from pool0 before
 removing it
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

VG9kYXkgYSBjcHUgd2hpY2ggaXMgcmVtb3ZlZCBmcm9tIHRoZSBzeXN0ZW0gaXMgdGFrZW4gZGly
ZWN0bHkgZnJvbQpQb29sMCB0byB0aGUgb2ZmbGluZSBzdGF0ZS4gVGhpcyB3aWxsIGNvbmZsaWN0
IHdpdGggdGhlIG5ldyBpZGxlCnNjaGVkdWxlciwgc28gcmVtb3ZlIGl0IGZyb20gUG9vbDAgZmly
c3QuIEFkZGl0aW9uYWxseSBhY2NlcHQgcmVtb3ZpbmcKYSBmcmVlIGNwdSBpbnN0ZWFkIG9mIHJl
cXVpcmluZyBpdCB0byBiZSBpbiBQb29sMC4KCkZvciB0aGUgcmVzdW1lIGZhaWxlZCBjYXNlIHdl
IG5lZWQgdG8gY2FsbCB0aGUgc2NoZWR1bGVyIGNvZGUgZm9yIHRoYXQKc2l0dWF0aW9uIGFmdGVy
IHRoZSBjcHVwb29sIGhhbmRsaW5nLCBzbyBtb3ZlIHRoZSBzY2hlZHVsZXIgY29kZSBpbnRvCmEg
ZnVuY3Rpb24gYW5kIGNhbGwgaXQgZnJvbSBjcHVwb29sX2NwdV9yZW1vdmVfZm9yY2VkKCkgYW5k
IHJlbW92ZSB0aGUKQ1BVX1JFU1VNRV9GQUlMRUQgY2FzZSBmcm9tIGNwdV9zY2hlZHVsZV9jYWxs
YmFjaygpLgoKTm90ZSB0aGF0IHdlIGFyZSBjYWxsaW5nIG5vdyBzY2hlZHVsZV9jcHVfc3dpdGNo
KCkgaW4gc3RvcF9tYWNoaW5lCmNvbnRleHQgc28gd2UgbmVlZCB0byBzd2l0Y2ggZnJvbSBzcGlu
bG9ja19pcnEgdG8gc3BpbmxvY2tfaXJxc2F2ZS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYyOiByZW5hbWUgY3B1cG9vbF91bmFzc2lnbl9jcHVf
W2VwaXxwcm9dbG9ndWUoKSAoRGFyaW8gRmFnZ2lvbGkpCi0tLQogeGVuL2NvbW1vbi9jcHVwb29s
LmMgICAgICAgfCAxNzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgICB8ICAyNyArKysrLS0tCiB4ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaCB8ICAgMiArCiAzIGZpbGVzIGNoYW5nZWQsIDEyOCBpbnNlcnRpb25z
KCspLCA3NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdXBvb2wuYyBi
L3hlbi9jb21tb24vY3B1cG9vbC5jCmluZGV4IGNhZWE1YmQ4YjMuLjQ3ZDIwYTc2NTYgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vY3B1cG9vbC5jCisrKyBiL3hlbi9jb21tb24vY3B1cG9vbC5jCkBA
IC0yODIsMjIgKzI4MiwxNCBAQCBzdGF0aWMgaW50IGNwdXBvb2xfYXNzaWduX2NwdV9sb2NrZWQo
c3RydWN0IGNwdXBvb2wgKmMsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgcmV0dXJuIDA7CiB9CiAK
LXN0YXRpYyBsb25nIGNwdXBvb2xfdW5hc3NpZ25fY3B1X2hlbHBlcih2b2lkICppbmZvKQorc3Rh
dGljIGludCBjcHVwb29sX3VuYXNzaWduX2NwdV9maW5pc2goc3RydWN0IGNwdXBvb2wgKmMpCiB7
CiAgICAgaW50IGNwdSA9IGNwdXBvb2xfbW92aW5nX2NwdTsKLSAgICBzdHJ1Y3QgY3B1cG9vbCAq
YyA9IGluZm87CiAgICAgc3RydWN0IGRvbWFpbiAqZDsKLSAgICBsb25nIHJldDsKLQotICAgIGNw
dXBvb2xfZHByaW50aygiY3B1cG9vbF91bmFzc2lnbl9jcHUocG9vbD0lZCxjcHU9JWQpXG4iLAot
ICAgICAgICAgICAgICAgICAgICBjcHVwb29sX2NwdV9tb3ZpbmctPmNwdXBvb2xfaWQsIGNwdSk7
CisgICAgaW50IHJldDsKIAotICAgIHNwaW5fbG9jaygmY3B1cG9vbF9sb2NrKTsKICAgICBpZiAo
IGMgIT0gY3B1cG9vbF9jcHVfbW92aW5nICkKLSAgICB7Ci0gICAgICAgIHJldCA9IC1FQUREUk5P
VEFWQUlMOwotICAgICAgICBnb3RvIG91dDsKLSAgICB9CisgICAgICAgIHJldHVybiAtRUFERFJO
T1RBVkFJTDsKIAogICAgIC8qCiAgICAgICogV2UgbmVlZCB0aGlzIGZvciBzY2FubmluZyB0aGUg
ZG9tYWluIGxpc3QsIGJvdGggaW4KQEAgLTMzMiwzOSArMzI0LDE5IEBAIHN0YXRpYyBsb25nIGNw
dXBvb2xfdW5hc3NpZ25fY3B1X2hlbHBlcih2b2lkICppbmZvKQogICAgICAgICBkb21haW5fdXBk
YXRlX25vZGVfYWZmaW5pdHkoZCk7CiAgICAgfQogICAgIHJjdV9yZWFkX3VubG9jaygmZG9tbGlz
dF9yZWFkX2xvY2spOwotb3V0OgotICAgIHNwaW5fdW5sb2NrKCZjcHVwb29sX2xvY2spOwotICAg
IGNwdXBvb2xfZHByaW50aygiY3B1cG9vbF91bmFzc2lnbl9jcHUgcmV0PSVsZFxuIiwgcmV0KTsK
KwogICAgIHJldHVybiByZXQ7CiB9CiAKLS8qCi0gKiB1bmFzc2lnbiBhIHNwZWNpZmljIGNwdSBm
cm9tIGEgY3B1cG9vbAotICogd2UgbXVzdCBiZSBzdXJlIG5vdCB0byBydW4gb24gdGhlIGNwdSB0
byBiZSB1bmFzc2lnbmVkISB0byBhY2hpZXZlIHRoaXMKLSAqIHRoZSBtYWluIGZ1bmN0aW9uYWxp
dHkgaXMgcGVyZm9ybWVkIHZpYSBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1IG9uIGEKLSAqIHNw
ZWNpZmljIGNwdS4KLSAqIGlmIHRoZSBjcHUgdG8gYmUgcmVtb3ZlZCBpcyB0aGUgbGFzdCBvbmUg
b2YgdGhlIGNwdXBvb2wgbm8gYWN0aXZlIGRvbWFpbgotICogbXVzdCBiZSBib3VuZCB0byB0aGUg
Y3B1cG9vbC4gZHlpbmcgZG9tYWlucyBhcmUgbW92ZWQgdG8gY3B1cG9vbDAgYXMgdGhleQotICog
bWlnaHQgYmUgem9tYmllcy4KLSAqIHBvc3NpYmxlIGZhaWx1cmVzOgotICogLSBsYXN0IGNwdSBh
bmQgc3RpbGwgYWN0aXZlIGRvbWFpbnMgaW4gY3B1cG9vbAotICogLSBjcHUganVzdCBiZWluZyB1
bnBsdWdnZWQKLSAqLwotc3RhdGljIGludCBjcHVwb29sX3VuYXNzaWduX2NwdShzdHJ1Y3QgY3B1
cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkKK3N0YXRpYyBpbnQgY3B1cG9vbF91bmFzc2lnbl9j
cHVfc3RhcnQoc3RydWN0IGNwdXBvb2wgKmMsIHVuc2lnbmVkIGludCBjcHUpCiB7Ci0gICAgaW50
IHdvcmtfY3B1OwogICAgIGludCByZXQ7CiAgICAgc3RydWN0IGRvbWFpbiAqZDsKIAotICAgIGNw
dXBvb2xfZHByaW50aygiY3B1cG9vbF91bmFzc2lnbl9jcHUocG9vbD0lZCxjcHU9JWQpXG4iLAot
ICAgICAgICAgICAgICAgICAgICBjLT5jcHVwb29sX2lkLCBjcHUpOwotCiAgICAgc3Bpbl9sb2Nr
KCZjcHVwb29sX2xvY2spOwogICAgIHJldCA9IC1FQUREUk5PVEFWQUlMOwogICAgIGlmICggKGNw
dXBvb2xfbW92aW5nX2NwdSAhPSAtMSkgJiYgKGNwdSAhPSBjcHVwb29sX21vdmluZ19jcHUpICkK
ICAgICAgICAgZ290byBvdXQ7Ci0gICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNwdXBv
b2xfbG9ja2VkX2NwdXMpICkKLSAgICAgICAgZ290byBvdXQ7CiAKICAgICByZXQgPSAwOwogICAg
IGlmICggIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCBjLT5jcHVfdmFsaWQpICYmIChjcHUgIT0gY3B1
cG9vbF9tb3ZpbmdfY3B1KSApCkBAIC0zNzYsNyArMzQ4LDcgQEAgc3RhdGljIGludCBjcHVwb29s
X3VuYXNzaWduX2NwdShzdHJ1Y3QgY3B1cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkKICAgICAg
ICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwogICAgICAgICBmb3JfZWFjaF9k
b21haW5faW5fY3B1cG9vbChkLCBjKQogICAgICAgICB7Ci0gICAgICAgICAgICBpZiAoICFkLT5p
c19keWluZyApCisgICAgICAgICAgICBpZiAoICFkLT5pc19keWluZyAmJiBzeXN0ZW1fc3RhdGUg
PT0gU1lTX1NUQVRFX2FjdGl2ZSApCiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgcmV0
ID0gLUVCVVNZOwogICAgICAgICAgICAgICAgIGJyZWFrOwpAQCAtMzkzLDggKzM2NSw1OCBAQCBz
dGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1KHN0cnVjdCBjcHVwb29sICpjLCB1bnNpZ25l
ZCBpbnQgY3B1KQogICAgIGF0b21pY19pbmMoJmMtPnJlZmNudCk7CiAgICAgY3B1cG9vbF9jcHVf
bW92aW5nID0gYzsKICAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsIGMtPmNwdV92YWxpZCk7CisK
K291dDoKICAgICBzcGluX3VubG9jaygmY3B1cG9vbF9sb2NrKTsKIAorICAgIHJldHVybiByZXQ7
Cit9CisKK3N0YXRpYyBsb25nIGNwdXBvb2xfdW5hc3NpZ25fY3B1X2hlbHBlcih2b2lkICppbmZv
KQoreworICAgIHN0cnVjdCBjcHVwb29sICpjID0gaW5mbzsKKyAgICBsb25nIHJldDsKKworICAg
IGNwdXBvb2xfZHByaW50aygiY3B1cG9vbF91bmFzc2lnbl9jcHUocG9vbD0lZCxjcHU9JWQpXG4i
LAorICAgICAgICAgICAgICAgICAgICBjcHVwb29sX2NwdV9tb3ZpbmctPmNwdXBvb2xfaWQsIGNw
dSk7CisgICAgc3Bpbl9sb2NrKCZjcHVwb29sX2xvY2spOworCisgICAgcmV0ID0gY3B1cG9vbF91
bmFzc2lnbl9jcHVfZmluaXNoKGMpOworCisgICAgc3Bpbl91bmxvY2soJmNwdXBvb2xfbG9jayk7
CisgICAgY3B1cG9vbF9kcHJpbnRrKCJjcHVwb29sX3VuYXNzaWduX2NwdSByZXQ9JWxkXG4iLCBy
ZXQpOworCisgICAgcmV0dXJuIHJldDsKK30KKworLyoKKyAqIHVuYXNzaWduIGEgc3BlY2lmaWMg
Y3B1IGZyb20gYSBjcHVwb29sCisgKiB3ZSBtdXN0IGJlIHN1cmUgbm90IHRvIHJ1biBvbiB0aGUg
Y3B1IHRvIGJlIHVuYXNzaWduZWQhIHRvIGFjaGlldmUgdGhpcworICogdGhlIG1haW4gZnVuY3Rp
b25hbGl0eSBpcyBwZXJmb3JtZWQgdmlhIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUgb24gYQor
ICogc3BlY2lmaWMgY3B1LgorICogaWYgdGhlIGNwdSB0byBiZSByZW1vdmVkIGlzIHRoZSBsYXN0
IG9uZSBvZiB0aGUgY3B1cG9vbCBubyBhY3RpdmUgZG9tYWluCisgKiBtdXN0IGJlIGJvdW5kIHRv
IHRoZSBjcHVwb29sLiBkeWluZyBkb21haW5zIGFyZSBtb3ZlZCB0byBjcHVwb29sMCBhcyB0aGV5
CisgKiBtaWdodCBiZSB6b21iaWVzLgorICogcG9zc2libGUgZmFpbHVyZXM6CisgKiAtIGxhc3Qg
Y3B1IGFuZCBzdGlsbCBhY3RpdmUgZG9tYWlucyBpbiBjcHVwb29sCisgKiAtIGNwdSBqdXN0IGJl
aW5nIHVucGx1Z2dlZAorICovCitzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1KHN0cnVj
dCBjcHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIGludCB3b3JrX2NwdTsKKyAg
ICBpbnQgcmV0OworCisgICAgY3B1cG9vbF9kcHJpbnRrKCJjcHVwb29sX3VuYXNzaWduX2NwdShw
b29sPSVkLGNwdT0lZClcbiIsCisgICAgICAgICAgICAgICAgICAgIGMtPmNwdXBvb2xfaWQsIGNw
dSk7CisKKyAgICByZXQgPSBjcHVwb29sX3VuYXNzaWduX2NwdV9zdGFydChjLCBjcHUpOworICAg
IGlmICggcmV0ICkKKyAgICB7CisgICAgICAgIGNwdXBvb2xfZHByaW50aygiY3B1cG9vbF91bmFz
c2lnbl9jcHUocG9vbD0lZCxjcHU9JWQpIHJldCAlZFxuIiwKKyAgICAgICAgICAgICAgICAgICAg
ICAgIGMtPmNwdXBvb2xfaWQsIGNwdSwgcmV0KTsKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9
CisKICAgICB3b3JrX2NwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKICAgICBpZiAoIHdvcmtfY3B1
ID09IGNwdSApCiAgICAgewpAQCAtNDAzLDEyICs0MjUsNiBAQCBzdGF0aWMgaW50IGNwdXBvb2xf
dW5hc3NpZ25fY3B1KHN0cnVjdCBjcHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQogICAgICAg
ICAgICAgd29ya19jcHUgPSBjcHVtYXNrX25leHQoY3B1LCBjcHVwb29sMC0+Y3B1X3ZhbGlkKTsK
ICAgICB9CiAgICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUod29ya19jcHUsIGNw
dXBvb2xfdW5hc3NpZ25fY3B1X2hlbHBlciwgYyk7Ci0KLW91dDoKLSAgICBzcGluX3VubG9jaygm
Y3B1cG9vbF9sb2NrKTsKLSAgICBjcHVwb29sX2RwcmludGsoImNwdXBvb2xfdW5hc3NpZ25fY3B1
KHBvb2w9JWQsY3B1PSVkKSByZXQgJWRcbiIsCi0gICAgICAgICAgICAgICAgICAgIGMtPmNwdXBv
b2xfaWQsIGNwdSwgcmV0KTsKLSAgICByZXR1cm4gcmV0OwogfQogCiAvKgpAQCAtNDkyLDMwICs1
MDgsNTQgQEAgc3RhdGljIGludCBjcHVwb29sX2NwdV9hZGQodW5zaWduZWQgaW50IGNwdSkKIH0K
IAogLyoKLSAqIENhbGxlZCB0byByZW1vdmUgYSBDUFUgZnJvbSBhIHBvb2wuIFRoZSBDUFUgaXMg
bG9ja2VkLCB0byBmb3JiaWQgcmVtb3ZpbmcKLSAqIGl0IGZyb20gcG9vbDAuIEluIGZhY3QsIGlm
IHdlIHdhbnQgdG8gaG90LXVucGx1ZyBhIENQVSwgaXQgbXVzdCBiZWxvbmcgdG8KLSAqIHBvb2ww
LCBvciB3ZSBmYWlsLgorICogVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgaW4gc3RvcF9tYWNoaW5l
IGNvbnRleHQsIHNvIHdlIGNhbiBiZSBzdXJlIG5vCisgKiBub24taWRsZSB2Y3B1IGlzIGFjdGl2
ZSBvbiB0aGUgc3lzdGVtLgogICovCi1zdGF0aWMgaW50IGNwdXBvb2xfY3B1X3JlbW92ZSh1bnNp
Z25lZCBpbnQgY3B1KQorc3RhdGljIHZvaWQgY3B1cG9vbF9jcHVfcmVtb3ZlKHVuc2lnbmVkIGlu
dCBjcHUpCiB7Ci0gICAgaW50IHJldCA9IC1FTk9ERVY7CisgICAgaW50IHJldDsKIAotICAgIHNw
aW5fbG9jaygmY3B1cG9vbF9sb2NrKTsKKyAgICBBU1NFUlQoaXNfaWRsZV92Y3B1KGN1cnJlbnQp
KTsKIAotICAgIGlmICggY3B1bWFza190ZXN0X2NwdShjcHUsIGNwdXBvb2wwLT5jcHVfdmFsaWQp
ICkKKyAgICBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKSAp
CiAgICAgewotICAgICAgICAvKgotICAgICAgICAgKiBJZiB3ZSBhcmUgbm90IHN1c3BlbmRpbmcs
IHdlIGFyZSBob3QtdW5wbHVnZ2luZyBjcHUsIGFuZCB0aGF0IGlzCi0gICAgICAgICAqIGFsbG93
ZWQgb25seSBmb3IgQ1BVcyBpbiBwb29sMC4KLSAgICAgICAgICovCi0gICAgICAgIGNwdW1hc2tf
Y2xlYXJfY3B1KGNwdSwgY3B1cG9vbDAtPmNwdV92YWxpZCk7Ci0gICAgICAgIHJldCA9IDA7Cisg
ICAgICAgIHJldCA9IGNwdXBvb2xfdW5hc3NpZ25fY3B1X2ZpbmlzaChjcHVwb29sMCk7CisgICAg
ICAgIEJVR19PTihyZXQpOwogICAgIH0KK30KIAotICAgIGlmICggIXJldCApCisvKgorICogQ2Fs
bGVkIGJlZm9yZSBhIENQVSBpcyBiZWluZyByZW1vdmVkIGZyb20gdGhlIHN5c3RlbS4KKyAqIFJl
bW92aW5nIGEgQ1BVIGlzIGFsbG93ZWQgZm9yIGZyZWUgQ1BVcyBvciBDUFVzIGluIFBvb2wtMCAo
dGhvc2UgYXJlIG1vdmVkCisgKiB0byBmcmVlIGNwdXMgYWN0dWFsbHkgYmVmb3JlIHJlbW92aW5n
IHRoZW0pLgorICogVGhlIENQVSBpcyBsb2NrZWQsIHRvIGZvcmJpZCBhZGRpbmcgaXQgYWdhaW4g
dG8gYW5vdGhlciBjcHVwb29sLgorICovCitzdGF0aWMgaW50IGNwdXBvb2xfY3B1X3JlbW92ZV9w
cm9sb2d1ZSh1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIGludCByZXQgPSAwOworCisgICAgc3Bp
bl9sb2NrKCZjcHVwb29sX2xvY2spOworCisgICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwg
JmNwdXBvb2xfbG9ja2VkX2NwdXMpICkKKyAgICAgICAgcmV0ID0gLUVCVVNZOworICAgIGVsc2UK
ICAgICAgICAgY3B1bWFza19zZXRfY3B1KGNwdSwgJmNwdXBvb2xfbG9ja2VkX2NwdXMpOworCiAg
ICAgc3Bpbl91bmxvY2soJmNwdXBvb2xfbG9jayk7CiAKKyAgICBpZiAoIHJldCApCisgICAgICAg
IHJldHVybiAgcmV0OworCisgICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgY3B1cG9vbDAt
PmNwdV92YWxpZCkgKQorICAgIHsKKyAgICAgICAgLyogQ3B1cG9vbDAgaXMgcG9wdWxhdGVkIG9u
bHkgYWZ0ZXIgYWxsIGNwdXMgYXJlIHVwLiAqLworICAgICAgICBBU1NFUlQoc3lzdGVtX3N0YXRl
ID09IFNZU19TVEFURV9hY3RpdmUpOworCisgICAgICAgIHJldCA9IGNwdXBvb2xfdW5hc3NpZ25f
Y3B1X3N0YXJ0KGNwdXBvb2wwLCBjcHUpOworICAgIH0KKyAgICBlbHNlIGlmICggIWNwdW1hc2tf
dGVzdF9jcHUoY3B1LCAmY3B1cG9vbF9mcmVlX2NwdXMpICkKKyAgICAgICAgcmV0ID0gLUVOT0RF
VjsKKwogICAgIHJldHVybiByZXQ7CiB9CiAKQEAgLTUyMywxMyArNTYzLDEzIEBAIHN0YXRpYyBp
bnQgY3B1cG9vbF9jcHVfcmVtb3ZlKHVuc2lnbmVkIGludCBjcHUpCiAgKiBDYWxsZWQgZHVyaW5n
IHJlc3VtZSBmb3IgYWxsIGNwdXMgd2hpY2ggZGlkbid0IGNvbWUgdXAgYWdhaW4uIFRoZSBjcHUg
bXVzdAogICogYmUgcmVtb3ZlZCBmcm9tIHRoZSBjcHVwb29sIGl0IGlzIGFzc2lnbmVkIHRvLiBJ
biBjYXNlIGEgY3B1cG9vbCB3aWxsIGJlCiAgKiBsZWZ0IHdpdGhvdXQgY3B1IHdlIG1vdmUgYWxs
IGRvbWFpbnMgb2YgdGhhdCBjcHVwb29sIHRvIGNwdXBvb2wwLgorICogQXMgd2UgYXJlIGNhbGxl
ZCB3aXRoIGFsbCBkb21haW5zIHN0aWxsIGZyb3plbiB0aGVyZSBpcyBubyBuZWVkIHRvIHRha2Ug
dGhlCisgKiBjcHVwb29sIGxvY2sgaGVyZS4KICAqLwogc3RhdGljIHZvaWQgY3B1cG9vbF9jcHVf
cmVtb3ZlX2ZvcmNlZCh1bnNpZ25lZCBpbnQgY3B1KQogewogICAgIHN0cnVjdCBjcHVwb29sICoq
YzsKLSAgICBzdHJ1Y3QgZG9tYWluICpkOwotCi0gICAgc3Bpbl9sb2NrKCZjcHVwb29sX2xvY2sp
OworICAgIGludCByZXQ7CiAKICAgICBpZiAoIGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmY3B1cG9v
bF9mcmVlX2NwdXMpICkKICAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCAmY3B1cG9vbF9m
cmVlX2NwdXMpOwpAQCAtNTM5LDE5ICs1NzksMTMgQEAgc3RhdGljIHZvaWQgY3B1cG9vbF9jcHVf
cmVtb3ZlX2ZvcmNlZCh1bnNpZ25lZCBpbnQgY3B1KQogICAgICAgICB7CiAgICAgICAgICAgICBp
ZiAoIGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAoKmMpLT5jcHVfdmFsaWQpICkKICAgICAgICAgICAg
IHsKLSAgICAgICAgICAgICAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsICgqYyktPmNwdV92YWxp
ZCk7Ci0gICAgICAgICAgICAgICAgaWYgKCBjcHVtYXNrX3dlaWdodCgoKmMpLT5jcHVfdmFsaWQp
ID09IDAgKQotICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAgaWYgKCAqYyA9
PSBjcHVwb29sMCApCi0gICAgICAgICAgICAgICAgICAgICAgICBwYW5pYygiTm8gY3B1IGxlZnQg
aW4gY3B1cG9vbDBcbiIpOwotICAgICAgICAgICAgICAgICAgICBmb3JfZWFjaF9kb21haW5faW5f
Y3B1cG9vbChkLCAqYykKLSAgICAgICAgICAgICAgICAgICAgICAgIGNwdXBvb2xfbW92ZV9kb21h
aW5fbG9ja2VkKGQsIGNwdXBvb2wwKTsKLSAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAg
ICAgcmV0ID0gY3B1cG9vbF91bmFzc2lnbl9jcHUoKmMsIGNwdSk7CisgICAgICAgICAgICAgICAg
QlVHX09OKHJldCk7CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9CiAKLSAgICBzcGlu
X3VubG9jaygmY3B1cG9vbF9sb2NrKTsKKyAgICBzY2hlZF9ybV9jcHUoY3B1KTsKIH0KIAogLyoK
QEAgLTYxOSw3ICs2NTMsOCBAQCBpbnQgY3B1cG9vbF9kb19zeXNjdGwoc3RydWN0IHhlbl9zeXNj
dGxfY3B1cG9vbF9vcCAqb3ApCiAgICAgICAgIGlmICggY3B1ID49IG5yX2NwdV9pZHMgKQogICAg
ICAgICAgICAgZ290byBhZGRjcHVfb3V0OwogICAgICAgICByZXQgPSAtRU5PREVWOwotICAgICAg
ICBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKSApCisgICAg
ICAgIGlmICggIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmY3B1cG9vbF9mcmVlX2NwdXMpIHx8Cisg
ICAgICAgICAgICAgY3B1bWFza190ZXN0X2NwdShjcHUsICZjcHVwb29sX2xvY2tlZF9jcHVzKSAp
CiAgICAgICAgICAgICBnb3RvIGFkZGNwdV9vdXQ7CiAgICAgICAgIGMgPSBjcHVwb29sX2ZpbmRf
YnlfaWQob3AtPmNwdXBvb2xfaWQpOwogICAgICAgICByZXQgPSAtRU5PRU5UOwpAQCAtNzQ2LDcg
Kzc4MSwxMiBAQCBzdGF0aWMgaW50IGNwdV9jYWxsYmFjaygKICAgICBjYXNlIENQVV9ET1dOX1BS
RVBBUkU6CiAgICAgICAgIC8qIFN1c3BlbmQvUmVzdW1lIGRvbid0IGNoYW5nZSBhc3NpZ25tZW50
cyBvZiBjcHVzIHRvIGNwdXBvb2xzLiAqLwogICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA8PSBT
WVNfU1RBVEVfYWN0aXZlICkKLSAgICAgICAgICAgIHJjID0gY3B1cG9vbF9jcHVfcmVtb3ZlKGNw
dSk7CisgICAgICAgICAgICByYyA9IGNwdXBvb2xfY3B1X3JlbW92ZV9wcm9sb2d1ZShjcHUpOwor
ICAgICAgICBicmVhazsKKyAgICBjYXNlIENQVV9EWUlORzoKKyAgICAgICAgLyogU3VzcGVuZC9S
ZXN1bWUgZG9uJ3QgY2hhbmdlIGFzc2lnbm1lbnRzIG9mIGNwdXMgdG8gY3B1cG9vbHMuICovCisg
ICAgICAgIGlmICggc3lzdGVtX3N0YXRlIDw9IFNZU19TVEFURV9hY3RpdmUgKQorICAgICAgICAg
ICAgY3B1cG9vbF9jcHVfcmVtb3ZlKGNwdSk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgQ1BV
X1JFU1VNRV9GQUlMRUQ6CiAgICAgICAgIGNwdXBvb2xfY3B1X3JlbW92ZV9mb3JjZWQoY3B1KTsK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
YwppbmRleCA3YjcxNTgxNzU2Li45MzE2NGM2NGY2IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0xNjU0LDYgKzE2NTQsMjAg
QEAgc3RhdGljIHZvaWQgY3B1X3NjaGVkdWxlX2Rvd24odW5zaWduZWQgaW50IGNwdSkKICAgICBr
aWxsX3RpbWVyKCZzZC0+c190aW1lcik7CiB9CiAKK3ZvaWQgc2NoZWRfcm1fY3B1KHVuc2lnbmVk
IGludCBjcHUpCit7CisgICAgaW50IHJjOworICAgIHN0cnVjdCBzY2hlZHVsZV9kYXRhICpzZCA9
ICZwZXJfY3B1KHNjaGVkdWxlX2RhdGEsIGNwdSk7CisgICAgc3RydWN0IHNjaGVkdWxlciAqc2No
ZWQgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKKworICAgIHJjdV9yZWFkX2xvY2soJmRvbWxp
c3RfcmVhZF9sb2NrKTsKKyAgICByYyA9IGNwdV9kaXNhYmxlX3NjaGVkdWxlcihjcHUpOworICAg
IEJVR19PTihyYyk7CisgICAgcmN1X3JlYWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7Cisg
ICAgc2NoZWRfZGVpbml0X3BkYXRhKHNjaGVkLCBzZC0+c2NoZWRfcHJpdiwgY3B1KTsKKyAgICBj
cHVfc2NoZWR1bGVfZG93bihjcHUpOworfQorCiBzdGF0aWMgaW50IGNwdV9zY2hlZHVsZV9jYWxs
YmFjaygKICAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5mYiwgdW5zaWduZWQgbG9uZyBhY3Rp
b24sIHZvaWQgKmhjcHUpCiB7CkBAIC0xNzA5LDE2ICsxNzIzLDEwIEBAIHN0YXRpYyBpbnQgY3B1
X3NjaGVkdWxlX2NhbGxiYWNrKAogICAgICAgICByYyA9IGNwdV9kaXNhYmxlX3NjaGVkdWxlcl9j
aGVjayhjcHUpOwogICAgICAgICByY3VfcmVhZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsK
ICAgICAgICAgYnJlYWs7Ci0gICAgY2FzZSBDUFVfUkVTVU1FX0ZBSUxFRDoKICAgICBjYXNlIENQ
VV9ERUFEOgogICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVfc3VzcGVuZCAp
CiAgICAgICAgICAgICBicmVhazsKLSAgICAgICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFk
X2xvY2spOwotICAgICAgICByYyA9IGNwdV9kaXNhYmxlX3NjaGVkdWxlcihjcHUpOwotICAgICAg
ICBCVUdfT04ocmMpOwotICAgICAgICByY3VfcmVhZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2Nr
KTsKLSAgICAgICAgc2NoZWRfZGVpbml0X3BkYXRhKHNjaGVkLCBzZC0+c2NoZWRfcHJpdiwgY3B1
KTsKLSAgICAgICAgY3B1X3NjaGVkdWxlX2Rvd24oY3B1KTsKKyAgICAgICAgc2NoZWRfcm1fY3B1
KGNwdSk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgQ1BVX1VQX0NBTkNFTEVEOgogICAgICAg
ICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfcmVzdW1lICkKQEAgLTE4NDEsNiArMTg0
OSw3IEBAIGludCBzY2hlZHVsZV9jcHVfc3dpdGNoKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBj
cHVwb29sICpjKQogICAgIHN0cnVjdCBjcHVwb29sICpvbGRfcG9vbCA9IHBlcl9jcHUoY3B1cG9v
bCwgY3B1KTsKICAgICBzdHJ1Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShzY2hlZHVs
ZV9kYXRhLCBjcHUpOwogICAgIHNwaW5sb2NrX3QgKm9sZF9sb2NrLCAqbmV3X2xvY2s7CisgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsKIAogICAgIC8qCiAgICAgICogcENQVXMgb25seSBtb3ZlIGZy
b20gYSB2YWxpZCBjcHVwb29sIHRvIGZyZWUgKGkuZS4sIG91dCBvZiBhbnkgcG9vbCksCkBAIC0x
ODk1LDcgKzE5MDQsNyBAQCBpbnQgc2NoZWR1bGVfY3B1X3N3aXRjaCh1bnNpZ25lZCBpbnQgY3B1
LCBzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICAgKiB0aGF0IHRoZSBsb2NrIGl0c2VsZiBjaGFuZ2Vk
LCBhbmQgcmV0cnkgYWNxdWlyaW5nIHRoZSBuZXcgb25lICh3aGljaAogICAgICAqIHdpbGwgYmUg
dGhlIGNvcnJlY3QsIHJlbWFwcGVkIG9uZSwgYXQgdGhhdCBwb2ludCkuCiAgICAgICovCi0gICAg
b2xkX2xvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJxKGNwdSk7CisgICAgb2xkX2xvY2sgPSBw
Y3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShjcHUsICZmbGFncyk7CiAKICAgICB2cHJpdl9vbGQg
PSBpZGxlLT5zY2hlZF9wcml2OwogICAgIHBwcml2X29sZCA9IHNkLT5zY2hlZF9wcml2OwpAQCAt
MTkxMyw3ICsxOTIyLDcgQEAgaW50IHNjaGVkdWxlX2NwdV9zd2l0Y2godW5zaWduZWQgaW50IGNw
dSwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgc2QtPnNjaGVkdWxlX2xvY2sgPSBuZXdfbG9jazsK
IAogICAgIC8qIF9Ob3RfIHBjcHVfc2NoZWR1bGVfdW5sb2NrKCk6IHNjaGVkdWxlX2xvY2sgbWF5
IGhhdmUgY2hhbmdlZCEgKi8KLSAgICBzcGluX3VubG9ja19pcnEob2xkX2xvY2spOworICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUob2xkX2xvY2ssIGZsYWdzKTsKIAogICAgIHNjaGVkX2RvX3Rp
Y2tfcmVzdW1lKG5ld19vcHMsIGNwdSk7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggZDgyZWFkNTg2YS4u
ZGMyNTViMDY0YiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTQzNyw0ICs0MzcsNiBAQCBhZmZpbml0eV9i
YWxhbmNlX2NwdW1hc2soY29uc3Qgc3RydWN0IHZjcHUgKnYsIGludCBzdGVwLCBjcHVtYXNrX3Qg
Km1hc2spCiAgICAgICAgIGNwdW1hc2tfY29weShtYXNrLCB2LT5jcHVfaGFyZF9hZmZpbml0eSk7
CiB9CiAKK3ZvaWQgc2NoZWRfcm1fY3B1KHVuc2lnbmVkIGludCBjcHUpOworCiAjZW5kaWYgLyog
X19YRU5fU0NIRURfSUZfSF9fICovCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
