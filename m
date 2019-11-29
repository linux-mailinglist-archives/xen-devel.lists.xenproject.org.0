Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E643B10D6CA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:17:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iah39-00007N-Nx; Fri, 29 Nov 2019 14:15:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iah38-00007I-EX
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:15:10 +0000
X-Inumbo-ID: a654f9e6-12b2-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a654f9e6-12b2-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 14:15:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A4EDAD19;
 Fri, 29 Nov 2019 14:15:08 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <909ca24b-e673-e786-06b4-c8877288248b@suse.com>
Date: Fri, 29 Nov 2019 15:15:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] console: avoid buffer overrun in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y29ucmluZ19wdXRzKCkgaGFzIGJlZW4gcmVxdWlyaW5nIGEgbnVsLXRlcm1pbmF0ZWQgc3RyaW5n
LCB3aGljaCB0aGUKbG9jYWwga2J1ZltdIGRvZXNuJ3QgZ2V0IHNldCBmb3IgYW55bW9yZS4gQWRk
IGEgbGVuZ3RoIHBhcmFtZXRlciB0byB0aGUKZnVuY3Rpb24sIGp1c3QgbGlrZSB3YXMgZG9uZSBm
b3Igb3RoZXJzLCB0aHVzIGFsbG93aW5nIGVtYmVkZGVkIG51bCB0bwphbHNvIGJlIHJlYWQgdGhy
b3VnaCBYRU5fU1lTQ1RMX3JlYWRjb25zb2xlLgoKV2hpbGUgdGhlcmUgZHJvcCBhIHN0cmF5IGNh
c3Q6IEJvdGggb3BlcmFuZHMgb2YgLSBhcmUgYWxyZWFkeSB1aW50MzJfdC4KCkZpeGVzOiBlYTYw
MWVjOTk5NWIgKCJ4ZW4vY29uc29sZTogUmV3b3JrIEhZUEVSQ0FMTF9jb25zb2xlX2lvIGludGVy
ZmFjZSIpClJlcG9ydGVkLWJ5OiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2
ZXJzL2NoYXIvY29uc29sZS5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCkBAIC0y
NTcsMTYgKzI1NywxNCBAQCBzdGF0aWMgdm9pZCBkb19kZWNfdGhyZXNoKHVuc2lnbmVkIGNoYXIK
ICAqICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCiAgKi8KIAotc3RhdGljIHZvaWQgY29ucmluZ19wdXRzKGNvbnN0IGNoYXIgKnN0cikKK3N0
YXRpYyB2b2lkIGNvbnJpbmdfcHV0cyhjb25zdCBjaGFyICpzdHIsIHNpemVfdCBsZW4pCiB7Ci0g
ICAgY2hhciBjOwotCiAgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZjb25zb2xlX2xvY2spKTsK
IAotICAgIHdoaWxlICggKGMgPSAqc3RyKyspICE9ICdcMCcgKQotICAgICAgICBjb25yaW5nW0NP
TlJJTkdfSURYX01BU0soY29ucmluZ3ArKyldID0gYzsKKyAgICB3aGlsZSAoIGxlbi0tICkKKyAg
ICAgICAgY29ucmluZ1tDT05SSU5HX0lEWF9NQVNLKGNvbnJpbmdwKyspXSA9ICpzdHIrKzsKIAot
ICAgIGlmICggKHVpbnQzMl90KShjb25yaW5ncCAtIGNvbnJpbmdjKSA+IGNvbnJpbmdfc2l6ZSAp
CisgICAgaWYgKCBjb25yaW5ncCAtIGNvbnJpbmdjID4gY29ucmluZ19zaXplICkKICAgICAgICAg
Y29ucmluZ2MgPSBjb25yaW5ncCAtIGNvbnJpbmdfc2l6ZTsKIH0KIApAQCAtNTYyLDcgKzU2MCw3
IEBAIHN0YXRpYyBsb25nIGd1ZXN0X2NvbnNvbGVfd3JpdGUoWEVOX0dVRVMKIAogICAgICAgICAg
ICAgaWYgKCBvcHRfY29uc29sZV90b19yaW5nICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAg
ICAgICBjb25yaW5nX3B1dHMoa2J1Zik7CisgICAgICAgICAgICAgICAgY29ucmluZ19wdXRzKGti
dWYsIGtjb3VudCk7CiAgICAgICAgICAgICAgICAgdGFza2xldF9zY2hlZHVsZSgmbm90aWZ5X2Rv
bTBfY29uX3JpbmdfdGFza2xldCk7CiAgICAgICAgICAgICB9CiAKQEAgLTY4Nyw3ICs2ODUsNyBA
QCBzdGF0aWMgdm9pZCBfX3B1dHN0cihjb25zdCBjaGFyICpzdHIpCiAgICAgfQogI2VuZGlmCiAK
LSAgICBjb25yaW5nX3B1dHMoc3RyKTsKKyAgICBjb25yaW5nX3B1dHMoc3RyLCBsZW4pOwogCiAg
ICAgaWYgKCAhY29uc29sZV9sb2Nrc19idXN0ZWQgKQogICAgICAgICB0YXNrbGV0X3NjaGVkdWxl
KCZub3RpZnlfZG9tMF9jb25fcmluZ190YXNrbGV0KTsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
