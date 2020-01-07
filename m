Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EF6132095
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 08:40:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iojR7-0004Ca-S0; Tue, 07 Jan 2020 07:37:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iojR6-0004CV-Rs
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 07:37:56 +0000
X-Inumbo-ID: 99e62342-3120-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99e62342-3120-11ea-88e7-bc764e2007e4;
 Tue, 07 Jan 2020 07:37:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DDEDB011;
 Tue,  7 Jan 2020 07:37:47 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0fd3167-9702-39f0-0222-03bbcafb3093@suse.com>
Message-ID: <64149ced-6e88-abf5-2740-a43db6a0a4be@suse.com>
Date: Tue, 7 Jan 2020 08:37:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f0fd3167-9702-39f0-0222-03bbcafb3093@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBwYXNzZWQgYSBub24tTlVMTCBwZGV2LCB0aGUgZnVuY3Rpb24gZG9lcyBhbiBvd25lciBj
aGVjayB3aGVuIGl0CmZpbmRzIGFuIGFscmVhZHkgZXhpc3RpbmcgY29udGV4dCBtYXBwaW5nLiBC
cmlkZ2VzLCBob3dldmVyLCBkb24ndCBnZXQKcGFzc2VkIHRocm91Z2ggdG8gZ3Vlc3RzLCBhbmQg
aGVuY2UgdGhlaXIgb3duZXIgaXMgYWx3YXlzIGdvaW5nIHRvIGJlCkRvbTAsIGxlYWRpbmcgdG8g
dGhlIGFzc2lnbWVudCBvZiBhbGwgYnV0IG9uZSBvZiB0aGUgZnVuY3Rpb24gb2YgbXVsdGktCmZ1
bmN0aW9uIFBDSSBkZXZpY2VzIGJlaGluZCBicmlkZ2VzIHRvIGZhaWwuCgpSZXBvcnRlZC1ieTog
TWFyZWsgTWFyY3p5a293c2tpLUfDg8KzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0t
Ck5vdGU6IFRoaXMgd2FzIHJlcG9ydGVkIGFzIGFuIGFwcGFyZW50IHJlZ3Jlc3Npb24gZnJvbSBY
U0EtMzAyIC8gLTMwNi4KICAgICAgU28gZmFyIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZmlndXJl
IG91dCBob3cgdGhlIGNvZGUgd291bGQgaGF2ZQogICAgICB3b3JrZWQgYmVmb3JlLCBpLmUuIHRv
IG1lIGl0IGxvb2tzIGxpa2UgYSBwcmUtZXhpc3RpbmcgcHJvYmxlbS4KICAgICAgVGhpcyBsZWF2
ZXMgdGhlIHJpc2sgb2YgdGhlIGNoYW5nZSBoZXJlIHBhcGVyaW5nIG92ZXIgYW5vdGhlcgogICAg
ICBpc3N1ZS4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCisrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCkBAIC0xNDk5LDcgKzE0OTksNyBA
QCBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X21hcHBpbmcoc3RydWN0CiAgICAgICAgICAgICBi
cmVhazsKIAogICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZShkb21haW4s
IGRyaGQtPmlvbW11LCBidXMsIGRldmZuLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBidXMsIGRldmZuKSk7CisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOwogCiAgICAgICAgIC8qCiAgICAgICAg
ICAqIERldmljZXMgYmVoaW5kIFBDSWUtdG8tUENJL1BDSXggYnJpZGdlIG1heSBnZW5lcmF0ZSBk
aWZmZXJlbnQKQEAgLTE1MDksNyArMTUwOSw3IEBAIHN0YXRpYyBpbnQgZG9tYWluX2NvbnRleHRf
bWFwcGluZyhzdHJ1Y3QKICAgICAgICAgaWYgKCAhcmV0ICYmIHBkZXZfdHlwZShzZWcsIGJ1cywg
ZGV2Zm4pID09IERFVl9UWVBFX1BDSWUyUENJX0JSSURHRSAmJgogICAgICAgICAgICAgIChzZWNi
dXMgIT0gcGRldi0+YnVzIHx8IHBkZXYtPmRldmZuICE9IDApICkKICAgICAgICAgICAgIHJldCA9
IGRvbWFpbl9jb250ZXh0X21hcHBpbmdfb25lKGRvbWFpbiwgZHJoZC0+aW9tbXUsIHNlY2J1cywg
MCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9nZXRf
cGRldihzZWcsIHNlY2J1cywgMCkpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCk7CiAKICAgICAgICAgYnJlYWs7CiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
