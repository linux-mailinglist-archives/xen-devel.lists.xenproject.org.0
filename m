Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602592494C
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 09:48:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSzTv-0007mS-9i; Tue, 21 May 2019 07:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+mW=TV=amazon.de=prvs=03752d4d0=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hSzTt-0007mJ-J9
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 07:46:41 +0000
X-Inumbo-ID: 91f33a10-7b9c-11e9-9bfb-1fca9b551493
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91f33a10-7b9c-11e9-9bfb-1fca9b551493;
 Tue, 21 May 2019 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1558424800; x=1589960800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=xzkF0tptD1K+vwbOYdTSieHRrkGZbMSfljV+kn7SWDI=;
 b=nVhHJ8ToplmqXLf94sh+fTMxfGdp3Qfxvu00ROWchqBR6HSnO90FASif
 jqnpuvAVZfGZQqohCLO940/yaXF+fA3GiCJCYn3kByMkLwvDBM/bJZTp0
 r2uMnKkKgEykMg4cWuv86vQQxjhuWFo2L5jxPj1kb5eK5l6cAz2CvMQcD o=;
X-IronPort-AV: E=Sophos;i="5.60,494,1549929600"; d="scan'208";a="733992337"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 May 2019 07:46:39 +0000
Received: from EX13MTAUEB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4L7kYIV080694
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 21 May 2019 07:46:37 GMT
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 May 2019 07:46:24 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 May 2019 07:46:23 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.28.85.34) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 21 May 2019 07:46:19 +0000
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 May 2019 09:45:44 +0200
Message-ID: <1558424746-24059-2-git-send-email-nmanthey@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH L1TF MDS GT v1 1/3] common/grant_table: harden
 helpers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3Vlc3RzIGNhbiBpc3N1ZSBncmFudCB0YWJsZSBvcGVyYXRpb25zIGFuZCBwcm92aWRlIGd1ZXN0
IGNvbnRyb2xsZWQKZGF0YSB0byB0aGVtLiBUaGlzIGRhdGEgaXMgdXNlZCBmb3IgbWVtb3J5IGxv
YWRzIGluIGhlbHBlciBmdW5jdGlvbnMKYW5kIG1hY3Jvcy4gVG8gYXZvaWQgc3BlY3VsYXRpdmUg
b3V0LW9mLWJvdW5kIGFjY2Vzc2VzLCB3ZSB1c2UgdGhlCmFycmF5X2luZGV4X25vc3BlYyBtYWNy
byB3aGVyZSBhcHBsaWNhYmxlLCBvciB0aGUgYmxvY2tfc3BlY3VsYXRpb24KbWFjcm8uCgpUaGlz
IGlzIHBhcnQgb2YgdGhlIHNwZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuCgpTaWduZWQtb2Zm
LWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KCi0tLQoKTm90ZXM6CiAg
djE6ICBzcGxpdCB0aGUgZ250dGFiIGNvbW1pdCBvZiB0aGUgcHJldmlvdXMgTDFURiBzZXJpZXMg
aW50byBtdWx0aXBsZSBjb21taXRzCgogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwgMzMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90
YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMzcsNiArMzcsNyBAQAog
I2luY2x1ZGUgPHhlbi9wYWdpbmcuaD4KICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgogI2lu
Y2x1ZGUgPHhlbi92bWFwLmg+CisjaW5jbHVkZSA8eGVuL25vc3BlYy5oPgogI2luY2x1ZGUgPHhz
bS94c20uaD4KICNpbmNsdWRlIDxhc20vZmx1c2h0bGIuaD4KIApAQCAtMjAzLDggKzIwNCw5IEBA
IHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IG5yX3N0YXR1c19mcmFtZXMoY29uc3Qgc3RydWN0
IGdyYW50X3RhYmxlICpndCkKIH0KIAogI2RlZmluZSBNQVBUUkFDS19QRVJfUEFHRSAoUEFHRV9T
SVpFIC8gc2l6ZW9mKHN0cnVjdCBncmFudF9tYXBwaW5nKSkKLSNkZWZpbmUgbWFwdHJhY2tfZW50
cnkodCwgZSkgXAotICAgICgodCktPm1hcHRyYWNrWyhlKS9NQVBUUkFDS19QRVJfUEFHRV1bKGUp
JU1BUFRSQUNLX1BFUl9QQUdFXSkKKyNkZWZpbmUgbWFwdHJhY2tfZW50cnkodCwgZSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgKCh0KS0+
bWFwdHJhY2tbYXJyYXlfaW5kZXhfbm9zcGVjKGUsICh0KS0+bWFwdHJhY2tfbGltaXQpIC8gICAg
ICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFQVFJB
Q0tfUEVSX1BBR0VdWyhlKSAlIE1BUFRSQUNLX1BFUl9QQUdFXSkKIAogc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQKIG5yX21hcHRyYWNrX2ZyYW1lcyhzdHJ1Y3QgZ3JhbnRfdGFibGUgKnQpCkBA
IC0yMjYsMTAgKzIyOCwyMyBAQCBucl9tYXB0cmFja19mcmFtZXMoc3RydWN0IGdyYW50X3RhYmxl
ICp0KQogc3RhdGljIGdyYW50X2VudHJ5X2hlYWRlcl90ICoKIHNoYXJlZF9lbnRyeV9oZWFkZXIo
c3RydWN0IGdyYW50X3RhYmxlICp0LCBncmFudF9yZWZfdCByZWYpCiB7Ci0gICAgaWYgKCB0LT5n
dF92ZXJzaW9uID09IDEgKQorICAgIHN3aXRjaCAoIHQtPmd0X3ZlcnNpb24gKQorICAgIHsKKyAg
ICBjYXNlIDE6CisgICAgICAgIC8qIFJldHVybmVkIHZhbHVlcyBzaG91bGQgYmUgaW5kZXBlbmRl
bnQgb2Ygc3BlY3VsYXRpdmUgZXhlY3V0aW9uICovCisgICAgICAgIGJsb2NrX3NwZWN1bGF0aW9u
KCk7CiAgICAgICAgIHJldHVybiAoZ3JhbnRfZW50cnlfaGVhZGVyX3QqKSZzaGFyZWRfZW50cnlf
djEodCwgcmVmKTsKLSAgICBlbHNlCisKKyAgICBjYXNlIDI6CisgICAgICAgIC8qIFJldHVybmVk
IHZhbHVlcyBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2Ygc3BlY3VsYXRpdmUgZXhlY3V0aW9uICov
CisgICAgICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7CiAgICAgICAgIHJldHVybiAmc2hhcmVkX2Vu
dHJ5X3YyKHQsIHJlZikuaGRyOworICAgIH0KKworICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwor
ICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7CisKKyAgICByZXR1cm4gTlVMTDsKIH0KIAogLyogQWN0
aXZlIGdyYW50IGVudHJ5IC0gdXNlZCBmb3Igc2hhZG93aW5nIEdURl9wZXJtaXRfYWNjZXNzIGdy
YW50cy4gKi8KQEAgLTYzNCwxNCArNjQ5LDI0IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbnJfZ3Jh
bnRfZW50cmllcyhzdHJ1Y3QgZ3JhbnRfdGFibGUgKmd0KQogICAgIGNhc2UgMToKICAgICAgICAg
QlVJTERfQlVHX09OKGYyZShJTklUSUFMX05SX0dSQU5UX0ZSQU1FUywgMSkgPAogICAgICAgICAg
ICAgICAgICAgICAgR05UVEFCX05SX1JFU0VSVkVEX0VOVFJJRVMpOworCisgICAgICAgIC8qIE1h
a2Ugc3VyZSB3ZSByZXR1cm4gYSB2YWx1ZSBpbmRlcGVuZGVudGx5IG9mIHNwZWN1bGF0aXZlIGV4
ZWN1dGlvbiAqLworICAgICAgICBibG9ja19zcGVjdWxhdGlvbigpOwogICAgICAgICByZXR1cm4g
ZjJlKG5yX2dyYW50X2ZyYW1lcyhndCksIDEpOworCiAgICAgY2FzZSAyOgogICAgICAgICBCVUlM
RF9CVUdfT04oZjJlKElOSVRJQUxfTlJfR1JBTlRfRlJBTUVTLCAyKSA8CiAgICAgICAgICAgICAg
ICAgICAgICBHTlRUQUJfTlJfUkVTRVJWRURfRU5UUklFUyk7CisKKyAgICAgICAgLyogTWFrZSBz
dXJlIHdlIHJldHVybiBhIHZhbHVlIGluZGVwZW5kZW50bHkgb2Ygc3BlY3VsYXRpdmUgZXhlY3V0
aW9uICovCisgICAgICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7CiAgICAgICAgIHJldHVybiBmMmUo
bnJfZ3JhbnRfZnJhbWVzKGd0KSwgMik7CiAjdW5kZWYgZjJlCiAgICAgfQogCisgICAgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7CisgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKKwogICAgIHJldHVybiAw
OwogfQogCi0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdt
YkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3Rp
YW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
