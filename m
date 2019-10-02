Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035BC4885
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:30:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZ3t-0001xU-U6; Wed, 02 Oct 2019 07:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFZ3r-0001vI-MK
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:28:35 +0000
X-Inumbo-ID: 25634a4e-e4e6-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 25634a4e-e4e6-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 07:27:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9424AF81;
 Wed,  2 Oct 2019 07:27:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 09:27:42 +0200
Message-Id: <20191002072745.24919-18-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002072745.24919-1-jgross@suse.com>
References: <20191002072745.24919-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 17/20] xen/sched: support core scheduling for
 moving cpus to/from cpupools
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlIGl0IGlzIG5lY2Vzc2FyeSB0byBtb3ZlIG11bHRp
cGxlIGNwdXMgYXQKdGhlIHNhbWUgdGltZSB0byBvciBmcm9tIGEgY3B1cG9vbCBpbiBvcmRlciB0
byBhdm9pZCBzcGxpdCBzY2hlZHVsaW5nCnJlc291cmNlcyBpbiBiZXR3ZWVuLgoKU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogRGFyaW8g
RmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tClYxOiBuZXcgcGF0Y2gKLS0tCiB4ZW4v
Y29tbW9uL2NwdXBvb2wuYyAgICAgICB8IDEwMCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgICAzICstCiB4
ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaCB8ICAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDc2IGlu
c2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1
cG9vbC5jIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKaW5kZXggMDRjM2IzYzA0Yi4uZjdhMTNjN2E0
YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jcHVwb29sLmMKKysrIGIveGVuL2NvbW1vbi9jcHVw
b29sLmMKQEAgLTI2OCwyMyArMjY4LDMwIEBAIHN0YXRpYyBpbnQgY3B1cG9vbF9hc3NpZ25fY3B1
X2xvY2tlZChzdHJ1Y3QgY3B1cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkKIHsKICAgICBpbnQg
cmV0OwogICAgIHN0cnVjdCBkb21haW4gKmQ7CisgICAgY29uc3QgY3B1bWFza190ICpjcHVzOwor
CisgICAgY3B1cyA9IHNjaGVkX2dldF9vcHRfY3B1bWFzayhjLT5ncmFuLCBjcHUpOwogCiAgICAg
aWYgKCAoY3B1cG9vbF9tb3ZpbmdfY3B1ID09IGNwdSkgJiYgKGMgIT0gY3B1cG9vbF9jcHVfbW92
aW5nKSApCiAgICAgICAgIHJldHVybiAtRUFERFJOT1RBVkFJTDsKLSAgICByZXQgPSBzY2hlZHVs
ZV9jcHVfYWRkKGNwdSwgYyk7CisgICAgcmV0ID0gc2NoZWR1bGVfY3B1X2FkZChjcHVtYXNrX2Zp
cnN0KGNwdXMpLCBjKTsKICAgICBpZiAoIHJldCApCiAgICAgICAgIHJldHVybiByZXQ7CiAKLSAg
ICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsICZjcHVwb29sX2ZyZWVfY3B1cyk7CisgICAgcmN1X3Jl
YWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOworCisgICAgY3B1bWFza19hbmRub3QoJmNwdXBv
b2xfZnJlZV9jcHVzLCAmY3B1cG9vbF9mcmVlX2NwdXMsIGNwdXMpOwogICAgIGlmIChjcHVwb29s
X21vdmluZ19jcHUgPT0gY3B1KQogICAgIHsKICAgICAgICAgY3B1cG9vbF9tb3ZpbmdfY3B1ID0g
LTE7CiAgICAgICAgIGNwdXBvb2xfcHV0KGNwdXBvb2xfY3B1X21vdmluZyk7CiAgICAgICAgIGNw
dXBvb2xfY3B1X21vdmluZyA9IE5VTEw7CiAgICAgfQotICAgIGNwdW1hc2tfc2V0X2NwdShjcHUs
IGMtPmNwdV92YWxpZCk7CisgICAgY3B1bWFza19vcihjLT5jcHVfdmFsaWQsIGMtPmNwdV92YWxp
ZCwgY3B1cyk7CiAgICAgY3B1bWFza19hbmQoYy0+cmVzX3ZhbGlkLCBjLT5jcHVfdmFsaWQsICZz
Y2hlZF9yZXNfbWFzayk7CiAKKyAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2Nr
KTsKKwogICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKICAgICBmb3JfZWFj
aF9kb21haW5faW5fY3B1cG9vbChkLCBjKQogICAgIHsKQEAgLTI5OCw2ICszMDUsNyBAQCBzdGF0
aWMgaW50IGNwdXBvb2xfYXNzaWduX2NwdV9sb2NrZWQoc3RydWN0IGNwdXBvb2wgKmMsIHVuc2ln
bmVkIGludCBjcHUpCiBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X2ZpbmlzaChzdHJ1
Y3QgY3B1cG9vbCAqYykKIHsKICAgICBpbnQgY3B1ID0gY3B1cG9vbF9tb3ZpbmdfY3B1OworICAg
IGNvbnN0IGNwdW1hc2tfdCAqY3B1czsKICAgICBzdHJ1Y3QgZG9tYWluICpkOwogICAgIGludCBy
ZXQ7CiAKQEAgLTMxMCw3ICszMTgsMTAgQEAgc3RhdGljIGludCBjcHVwb29sX3VuYXNzaWduX2Nw
dV9maW5pc2goc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgICovCiAgICAgcmN1X3JlYWRfbG9jaygm
ZG9tbGlzdF9yZWFkX2xvY2spOwogICAgIHJldCA9IGNwdV9kaXNhYmxlX3NjaGVkdWxlcihjcHUp
OwotICAgIGNwdW1hc2tfc2V0X2NwdShjcHUsICZjcHVwb29sX2ZyZWVfY3B1cyk7CisKKyAgICBy
Y3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CisgICAgY3B1cyA9IGdldF9zY2hlZF9y
ZXMoY3B1KS0+Y3B1czsKKyAgICBjcHVtYXNrX29yKCZjcHVwb29sX2ZyZWVfY3B1cywgJmNwdXBv
b2xfZnJlZV9jcHVzLCBjcHVzKTsKIAogICAgIC8qCiAgICAgICogY3B1X2Rpc2FibGVfc2NoZWR1
bGVyKCkgcmV0dXJuaW5nIGFuIGVycm9yIGRvZXNuJ3QgcmVxdWlyZSByZXNldHRpbmcKQEAgLTMy
Myw3ICszMzQsNyBAQCBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X2ZpbmlzaChzdHJ1
Y3QgY3B1cG9vbCAqYykKICAgICB7CiAgICAgICAgIHJldCA9IHNjaGVkdWxlX2NwdV9ybShjcHUp
OwogICAgICAgICBpZiAoIHJldCApCi0gICAgICAgICAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUs
ICZjcHVwb29sX2ZyZWVfY3B1cyk7CisgICAgICAgICAgICBjcHVtYXNrX2FuZG5vdCgmY3B1cG9v
bF9mcmVlX2NwdXMsICZjcHVwb29sX2ZyZWVfY3B1cywgY3B1cyk7CiAgICAgICAgIGVsc2UKICAg
ICAgICAgewogICAgICAgICAgICAgY3B1cG9vbF9tb3ZpbmdfY3B1ID0gLTE7CkBAIC0zMzEsNiAr
MzQyLDcgQEAgc3RhdGljIGludCBjcHVwb29sX3VuYXNzaWduX2NwdV9maW5pc2goc3RydWN0IGNw
dXBvb2wgKmMpCiAgICAgICAgICAgICBjcHVwb29sX2NwdV9tb3ZpbmcgPSBOVUxMOwogICAgICAg
ICB9CiAgICAgfQorICAgIHJjdV9yZWFkX3VubG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogCiAg
ICAgZm9yX2VhY2hfZG9tYWluX2luX2NwdXBvb2woZCwgYykKICAgICB7CkBAIC0zNDUsNiArMzU3
LDcgQEAgc3RhdGljIGludCBjcHVwb29sX3VuYXNzaWduX2NwdV9zdGFydChzdHJ1Y3QgY3B1cG9v
bCAqYywgdW5zaWduZWQgaW50IGNwdSkKIHsKICAgICBpbnQgcmV0OwogICAgIHN0cnVjdCBkb21h
aW4gKmQ7CisgICAgY29uc3QgY3B1bWFza190ICpjcHVzOwogCiAgICAgc3Bpbl9sb2NrKCZjcHVw
b29sX2xvY2spOwogICAgIHJldCA9IC1FQUREUk5PVEFWQUlMOwpAQCAtMzUzLDcgKzM2NiwxMSBA
QCBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KHN0cnVjdCBjcHVwb29sICpj
LCB1bnNpZ25lZCBpbnQgY3B1KQogICAgICAgICBnb3RvIG91dDsKIAogICAgIHJldCA9IDA7Ci0g
ICAgaWYgKCAoYy0+bl9kb20gPiAwKSAmJiAoY3B1bWFza193ZWlnaHQoYy0+Y3B1X3ZhbGlkKSA9
PSAxKSAmJgorICAgIHJjdV9yZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKyAgICBjcHVz
ID0gZ2V0X3NjaGVkX3JlcyhjcHUpLT5jcHVzOworCisgICAgaWYgKCAoYy0+bl9kb20gPiAwKSAm
JgorICAgICAgICAgKGNwdW1hc2tfd2VpZ2h0KGMtPmNwdV92YWxpZCkgPT0gY3B1bWFza193ZWln
aHQoY3B1cykpICYmCiAgICAgICAgICAoY3B1ICE9IGNwdXBvb2xfbW92aW5nX2NwdSkgKQogICAg
IHsKICAgICAgICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwpAQCAtMzc1LDkg
KzM5MiwxMCBAQCBzdGF0aWMgaW50IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KHN0cnVjdCBj
cHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQogICAgIGNwdXBvb2xfbW92aW5nX2NwdSA9IGNw
dTsKICAgICBhdG9taWNfaW5jKCZjLT5yZWZjbnQpOwogICAgIGNwdXBvb2xfY3B1X21vdmluZyA9
IGM7Ci0gICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCBjLT5jcHVfdmFsaWQpOworICAgIGNwdW1h
c2tfYW5kbm90KGMtPmNwdV92YWxpZCwgYy0+Y3B1X3ZhbGlkLCBjcHVzKTsKICAgICBjcHVtYXNr
X2FuZChjLT5yZXNfdmFsaWQsIGMtPmNwdV92YWxpZCwgJnNjaGVkX3Jlc19tYXNrKTsKIAorICAg
IHJjdV9yZWFkX3VubG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwogb3V0OgogICAgIHNwaW5fdW5s
b2NrKCZjcHVwb29sX2xvY2spOwogCkBAIC00MTcsMTEgKzQzNSwxMyBAQCBzdGF0aWMgaW50IGNw
dXBvb2xfdW5hc3NpZ25fY3B1KHN0cnVjdCBjcHVwb29sICpjLCB1bnNpZ25lZCBpbnQgY3B1KQog
ewogICAgIGludCB3b3JrX2NwdTsKICAgICBpbnQgcmV0OworICAgIHVuc2lnbmVkIGludCBtYXN0
ZXJfY3B1OwogCiAgICAgZGVidWd0cmFjZV9wcmludGsoImNwdXBvb2xfdW5hc3NpZ25fY3B1KHBv
b2w9JWQsY3B1PSVkKVxuIiwKICAgICAgICAgICAgICAgICAgICAgICBjLT5jcHVwb29sX2lkLCBj
cHUpOwogCi0gICAgcmV0ID0gY3B1cG9vbF91bmFzc2lnbl9jcHVfc3RhcnQoYywgY3B1KTsKKyAg
ICBtYXN0ZXJfY3B1ID0gc2NoZWRfZ2V0X3Jlc291cmNlX2NwdShjcHUpOworICAgIHJldCA9IGNw
dXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KGMsIG1hc3Rlcl9jcHUpOwogICAgIGlmICggcmV0ICkK
ICAgICB7CiAgICAgICAgIGRlYnVndHJhY2VfcHJpbnRrKCJjcHVwb29sX3VuYXNzaWduX2NwdShw
b29sPSVkLGNwdT0lZCkgcmV0ICVkXG4iLApAQCAtNDI5LDEyICs0NDksMTIgQEAgc3RhdGljIGlu
dCBjcHVwb29sX3VuYXNzaWduX2NwdShzdHJ1Y3QgY3B1cG9vbCAqYywgdW5zaWduZWQgaW50IGNw
dSkKICAgICAgICAgcmV0dXJuIHJldDsKICAgICB9CiAKLSAgICB3b3JrX2NwdSA9IHNtcF9wcm9j
ZXNzb3JfaWQoKTsKLSAgICBpZiAoIHdvcmtfY3B1ID09IGNwdSApCisgICAgd29ya19jcHUgPSBz
Y2hlZF9nZXRfcmVzb3VyY2VfY3B1KHNtcF9wcm9jZXNzb3JfaWQoKSk7CisgICAgaWYgKCB3b3Jr
X2NwdSA9PSBtYXN0ZXJfY3B1ICkKICAgICB7CiAgICAgICAgIHdvcmtfY3B1ID0gY3B1bWFza19m
aXJzdChjcHVwb29sMC0+Y3B1X3ZhbGlkKTsKLSAgICAgICAgaWYgKCB3b3JrX2NwdSA9PSBjcHUg
KQotICAgICAgICAgICAgd29ya19jcHUgPSBjcHVtYXNrX25leHQoY3B1LCBjcHVwb29sMC0+Y3B1
X3ZhbGlkKTsKKyAgICAgICAgaWYgKCB3b3JrX2NwdSA9PSBtYXN0ZXJfY3B1ICkKKyAgICAgICAg
ICAgIHdvcmtfY3B1ID0gY3B1bWFza19sYXN0KGNwdXBvb2wwLT5jcHVfdmFsaWQpOwogICAgIH0K
ICAgICByZXR1cm4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSh3b3JrX2NwdSwgY3B1cG9vbF91
bmFzc2lnbl9jcHVfaGVscGVyLCBjKTsKIH0KQEAgLTUwMCw2ICs1MjAsNyBAQCB2b2lkIGNwdXBv
b2xfcm1fZG9tYWluKHN0cnVjdCBkb21haW4gKmQpCiBzdGF0aWMgaW50IGNwdXBvb2xfY3B1X2Fk
ZCh1bnNpZ25lZCBpbnQgY3B1KQogewogICAgIGludCByZXQgPSAwOworICAgIGNvbnN0IGNwdW1h
c2tfdCAqY3B1czsKIAogICAgIHNwaW5fbG9jaygmY3B1cG9vbF9sb2NrKTsKICAgICBjcHVtYXNr
X2NsZWFyX2NwdShjcHUsICZjcHVwb29sX2xvY2tlZF9jcHVzKTsKQEAgLTUxMyw3ICs1MzQsMTEg
QEAgc3RhdGljIGludCBjcHVwb29sX2NwdV9hZGQodW5zaWduZWQgaW50IGNwdSkKICAgICAgKi8K
ICAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7CiAgICAgZ2V0X3NjaGVkX3Jl
cyhjcHUpLT5jcHVwb29sID0gTlVMTDsKLSAgICByZXQgPSBjcHVwb29sX2Fzc2lnbl9jcHVfbG9j
a2VkKGNwdXBvb2wwLCBjcHUpOworCisgICAgY3B1cyA9IHNjaGVkX2dldF9vcHRfY3B1bWFzayhj
cHVwb29sMC0+Z3JhbiwgY3B1KTsKKyAgICBpZiAoIGNwdW1hc2tfc3Vic2V0KGNwdXMsICZjcHVw
b29sX2ZyZWVfY3B1cykgKQorICAgICAgICByZXQgPSBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2Vk
KGNwdXBvb2wwLCBjcHUpOworCiAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9j
ayk7CiAKICAgICBzcGluX3VubG9jaygmY3B1cG9vbF9sb2NrKTsKQEAgLTU0OCwyNyArNTczLDMz
IEBAIHN0YXRpYyB2b2lkIGNwdXBvb2xfY3B1X3JlbW92ZSh1bnNpZ25lZCBpbnQgY3B1KQogc3Rh
dGljIGludCBjcHVwb29sX2NwdV9yZW1vdmVfcHJvbG9ndWUodW5zaWduZWQgaW50IGNwdSkKIHsK
ICAgICBpbnQgcmV0ID0gMDsKKyAgICBjcHVtYXNrX3QgKmNwdXM7CisgICAgdW5zaWduZWQgaW50
IG1hc3Rlcl9jcHU7CiAKICAgICBzcGluX2xvY2soJmNwdXBvb2xfbG9jayk7CiAKLSAgICBpZiAo
IGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmY3B1cG9vbF9sb2NrZWRfY3B1cykgKQorICAgIHJjdV9y
ZWFkX2xvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsKKyAgICBjcHVzID0gZ2V0X3NjaGVkX3Jlcyhj
cHUpLT5jcHVzOworICAgIG1hc3Rlcl9jcHUgPSBzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSk7
CisgICAgaWYgKCBjcHVtYXNrX2ludGVyc2VjdHMoY3B1cywgJmNwdXBvb2xfbG9ja2VkX2NwdXMp
ICkKICAgICAgICAgcmV0ID0gLUVCVVNZOwogICAgIGVsc2UKICAgICAgICAgY3B1bWFza19zZXRf
Y3B1KGNwdSwgJmNwdXBvb2xfbG9ja2VkX2NwdXMpOworICAgIHJjdV9yZWFkX3VubG9jaygmc2No
ZWRfcmVzX3JjdWxvY2spOwogCiAgICAgc3Bpbl91bmxvY2soJmNwdXBvb2xfbG9jayk7CiAKICAg
ICBpZiAoIHJldCApCiAgICAgICAgIHJldHVybiAgcmV0OwogCi0gICAgaWYgKCBjcHVtYXNrX3Rl
c3RfY3B1KGNwdSwgY3B1cG9vbDAtPmNwdV92YWxpZCkgKQorICAgIGlmICggY3B1bWFza190ZXN0
X2NwdShtYXN0ZXJfY3B1LCBjcHVwb29sMC0+Y3B1X3ZhbGlkKSApCiAgICAgewogICAgICAgICAv
KiBDcHVwb29sMCBpcyBwb3B1bGF0ZWQgb25seSBhZnRlciBhbGwgY3B1cyBhcmUgdXAuICovCiAg
ICAgICAgIEFTU0VSVChzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2FjdGl2ZSk7CiAKLSAgICAg
ICAgcmV0ID0gY3B1cG9vbF91bmFzc2lnbl9jcHVfc3RhcnQoY3B1cG9vbDAsIGNwdSk7CisgICAg
ICAgIHJldCA9IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0KGNwdXBvb2wwLCBtYXN0ZXJfY3B1
KTsKICAgICB9Ci0gICAgZWxzZSBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNwdXBvb2xf
ZnJlZV9jcHVzKSApCisgICAgZWxzZSBpZiAoICFjcHVtYXNrX3Rlc3RfY3B1KG1hc3Rlcl9jcHUs
ICZjcHVwb29sX2ZyZWVfY3B1cykgKQogICAgICAgICByZXQgPSAtRU5PREVWOwogCiAgICAgcmV0
dXJuIHJldDsKQEAgLTU4NSwxMiArNjE2LDEzIEBAIHN0YXRpYyB2b2lkIGNwdXBvb2xfY3B1X3Jl
bW92ZV9mb3JjZWQodW5zaWduZWQgaW50IGNwdSkKIHsKICAgICBzdHJ1Y3QgY3B1cG9vbCAqKmM7
CiAgICAgaW50IHJldDsKKyAgICB1bnNpZ25lZCBpbnQgbWFzdGVyX2NwdSA9IHNjaGVkX2dldF9y
ZXNvdXJjZV9jcHUoY3B1KTsKIAogICAgIGZvcl9lYWNoX2NwdXBvb2wgKCBjICkKICAgICB7Ci0g
ICAgICAgIGlmICggY3B1bWFza190ZXN0X2NwdShjcHUsICgqYyktPmNwdV92YWxpZCkgKQorICAg
ICAgICBpZiAoIGNwdW1hc2tfdGVzdF9jcHUobWFzdGVyX2NwdSwgKCpjKS0+Y3B1X3ZhbGlkKSAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgIHJldCA9IGNwdXBvb2xfdW5hc3NpZ25fY3B1X3N0YXJ0
KCpjLCBjcHUpOworICAgICAgICAgICAgcmV0ID0gY3B1cG9vbF91bmFzc2lnbl9jcHVfc3RhcnQo
KmMsIG1hc3Rlcl9jcHUpOwogICAgICAgICAgICAgQlVHX09OKHJldCk7CiAgICAgICAgICAgICBy
ZXQgPSBjcHVwb29sX3VuYXNzaWduX2NwdV9maW5pc2goKmMpOwogICAgICAgICAgICAgQlVHX09O
KHJldCk7CkBAIC02NTgsMjkgKzY5MCw0NSBAQCBpbnQgY3B1cG9vbF9kb19zeXNjdGwoc3RydWN0
IHhlbl9zeXNjdGxfY3B1cG9vbF9vcCAqb3ApCiAgICAgY2FzZSBYRU5fU1lTQ1RMX0NQVVBPT0xf
T1BfQUREQ1BVOgogICAgIHsKICAgICAgICAgdW5zaWduZWQgY3B1OworICAgICAgICBjb25zdCBj
cHVtYXNrX3QgKmNwdXM7CiAKICAgICAgICAgY3B1ID0gb3AtPmNwdTsKICAgICAgICAgZGVidWd0
cmFjZV9wcmludGsoImNwdXBvb2xfYXNzaWduX2NwdShwb29sPSVkLGNwdT0lZClcbiIsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG9wLT5jcHVwb29sX2lkLCBjcHUpOworCiAgICAgICAgIHNw
aW5fbG9jaygmY3B1cG9vbF9sb2NrKTsKKworICAgICAgICBjID0gY3B1cG9vbF9maW5kX2J5X2lk
KG9wLT5jcHVwb29sX2lkKTsKKyAgICAgICAgcmV0ID0gLUVOT0VOVDsKKyAgICAgICAgaWYgKCBj
ID09IE5VTEwgKQorICAgICAgICAgICAgZ290byBhZGRjcHVfb3V0OwogICAgICAgICBpZiAoIGNw
dSA9PSBYRU5fU1lTQ1RMX0NQVVBPT0xfUEFSX0FOWSApCi0gICAgICAgICAgICBjcHUgPSBjcHVt
YXNrX2ZpcnN0KCZjcHVwb29sX2ZyZWVfY3B1cyk7CisgICAgICAgIHsKKyAgICAgICAgICAgIGZv
cl9lYWNoX2NwdSAoIGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzICkKKyAgICAgICAgICAgIHsKKyAg
ICAgICAgICAgICAgICBjcHVzID0gc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGMtPmdyYW4sIGNwdSk7
CisgICAgICAgICAgICAgICAgaWYgKCBjcHVtYXNrX3N1YnNldChjcHVzLCAmY3B1cG9vbF9mcmVl
X2NwdXMpICkKKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CisgICAg
ICAgICAgICByZXQgPSAtRU5PREVWOworICAgICAgICAgICAgaWYgKCBjcHUgPj0gbnJfY3B1X2lk
cyApCisgICAgICAgICAgICAgICAgZ290byBhZGRjcHVfb3V0OworICAgICAgICB9CiAgICAgICAg
IHJldCA9IC1FSU5WQUw7CiAgICAgICAgIGlmICggY3B1ID49IG5yX2NwdV9pZHMgKQogICAgICAg
ICAgICAgZ290byBhZGRjcHVfb3V0OwogICAgICAgICByZXQgPSAtRU5PREVWOwotICAgICAgICBp
ZiAoICFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKSB8fAotICAgICAg
ICAgICAgIGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmY3B1cG9vbF9sb2NrZWRfY3B1cykgKQotICAg
ICAgICAgICAgZ290byBhZGRjcHVfb3V0OwotICAgICAgICBjID0gY3B1cG9vbF9maW5kX2J5X2lk
KG9wLT5jcHVwb29sX2lkKTsKLSAgICAgICAgcmV0ID0gLUVOT0VOVDsKLSAgICAgICAgaWYgKCBj
ID09IE5VTEwgKQorICAgICAgICBjcHVzID0gc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGMtPmdyYW4s
IGNwdSk7CisgICAgICAgIGlmICggIWNwdW1hc2tfc3Vic2V0KGNwdXMsICZjcHVwb29sX2ZyZWVf
Y3B1cykgfHwKKyAgICAgICAgICAgICBjcHVtYXNrX2ludGVyc2VjdHMoY3B1cywgJmNwdXBvb2xf
bG9ja2VkX2NwdXMpICkKICAgICAgICAgICAgIGdvdG8gYWRkY3B1X291dDsKICAgICAgICAgcmV0
ID0gY3B1cG9vbF9hc3NpZ25fY3B1X2xvY2tlZChjLCBjcHUpOworCiAgICAgYWRkY3B1X291dDoK
ICAgICAgICAgc3Bpbl91bmxvY2soJmNwdXBvb2xfbG9jayk7CiAgICAgICAgIGRlYnVndHJhY2Vf
cHJpbnRrKCJjcHVwb29sX2Fzc2lnbl9jcHUocG9vbD0lZCxjcHU9JWQpIHJldCAlZFxuIiwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb3AtPmNwdXBvb2xfaWQsIGNwdSwgcmV0KTsKKwogICAg
IH0KICAgICBicmVhazsKIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGU0MTFiNmQwM2UuLjQ4ZGRiZGZkN2UgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAg
LTI2MDYsOCArMjYwNiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgY3B1X3NjaGVk
dWxlX25mYiA9IHsKICAgICAubm90aWZpZXJfY2FsbCA9IGNwdV9zY2hlZHVsZV9jYWxsYmFjawog
fTsKIAotc3RhdGljIGNvbnN0IGNwdW1hc2tfdCAqc2NoZWRfZ2V0X29wdF9jcHVtYXNrKGVudW0g
c2NoZWRfZ3JhbiBvcHQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGNwdSkKK2NvbnN0IGNwdW1hc2tfdCAqc2NoZWRfZ2V0X29wdF9j
cHVtYXNrKGVudW0gc2NoZWRfZ3JhbiBvcHQsIHVuc2lnbmVkIGludCBjcHUpCiB7CiAgICAgY29u
c3QgY3B1bWFza190ICptYXNrOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQt
aWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IDc4MDczNWRkYTMuLmNkNzMx
ZDcxNzIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCisrKyBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC02MzgsNSArNjM4LDYgQEAgYWZmaW5pdHlfYmFsYW5j
ZV9jcHVtYXNrKGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCBpbnQgc3RlcCwKIH0KIAog
dm9pZCBzY2hlZF9ybV9jcHUodW5zaWduZWQgaW50IGNwdSk7Citjb25zdCBjcHVtYXNrX3QgKnNj
aGVkX2dldF9vcHRfY3B1bWFzayhlbnVtIHNjaGVkX2dyYW4gb3B0LCB1bnNpZ25lZCBpbnQgY3B1
KTsKIAogI2VuZGlmIC8qIF9fWEVOX1NDSEVEX0lGX0hfXyAqLwotLSAKMi4xNi40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
