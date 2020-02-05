Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B9415318C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:17:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKVl-00052W-C5; Wed, 05 Feb 2020 13:14:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKVj-00052N-IK
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:14:31 +0000
X-Inumbo-ID: 718fbccc-4819-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 718fbccc-4819-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 13:14:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3474FAC69;
 Wed,  5 Feb 2020 13:14:30 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <c9194b35-f2d8-60b6-3a56-33c73eccec17@suse.com>
Date: Wed, 5 Feb 2020 14:14:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/6] EFI: re-check {get,
 set}-variable name strings after copying in
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBtYWxpY2lvdXMgZ3Vlc3QgZ2l2ZW4gcGVybWlzc2lvbiB0byBpbnZva2UgWEVOUEZfZWZpX3J1
bnRpbWVfY2FsbCBtYXkKcGxheSB3aXRoIHRoZSBzdHJpbmdzIHVuZGVybmVhdGggWGVuIHNpemlu
ZyB0aGVtIGFuZCBjb3B5aW5nIHRoZW0gaW4uCkd1YXJkIGFnYWluc3QgdGhpcyBieSByZS1jaGVj
a2luZyB0aGUgY29weWllZCBpbiBkYXRhIGZvciBjb25zaXN0ZW5jeQp3aXRoIHRoZSBpbml0aWFs
IHNpemluZy4gQXQgdGhlIHNhbWUgdGltZSBhbHNvIGNoZWNrIHRoYXQgdGhlIGFjdHVhbApjb3B5
LWluIGlzIGluIGZhY3Qgc3VjY2Vzc2Z1bCwgYW5kIHN3aXRjaCB0byB0aGUgbGlnaHRlciB3ZWln
aHQgbm9uLQpjaGVja2luZyBmbGF2b3Igb2YgdGhlIGZ1bmN0aW9uLgoKUmVwb3J0ZWQtYnk6IEls
amEgVmFuIFNwcnVuZGVsIDxpdmFuc3BydW5kZWxAaW9hY3RpdmUuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpOb3RlIHRoYXQgdGhpcyBjb2xsaWRl
cyB3aXRoIFhTQS0yNTcncyBwYXRjaCA2LgoKLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jCisr
KyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwpAQCAtMjgxLDE2ICsyODEsNiBAQCBzdGF0aWMgaW50
IF9faW5pdCB3c3RybmNtcChjb25zdCBDSEFSMTYKICAgICByZXR1cm4gbiA/ICpzMSAtICpzMiA6
IDA7CiB9CiAKLXN0YXRpYyBjb25zdCBDSEFSMTYgKl9faW5pdCB3bWVtY2hyKGNvbnN0IENIQVIx
NiAqcywgQ0hBUjE2IGMsIFVJTlROIG4pCi17Ci0gICAgd2hpbGUgKCBuICYmICpzICE9IGMgKQot
ICAgIHsKLSAgICAgICAgLS1uOwotICAgICAgICArK3M7Ci0gICAgfQotICAgIHJldHVybiBuID8g
cyA6IE5VTEw7Ci19Ci0KIHN0YXRpYyBDSEFSMTYgKl9faW5pdCBzMncodW5pb24gc3RyaW5nICpz
dHIpCiB7CiAgICAgY29uc3QgY2hhciAqcyA9IHN0ci0+czsKLS0tIGEveGVuL2NvbW1vbi9lZmkv
ZWZpLmgKKysrIGIveGVuL2NvbW1vbi9lZmkvZWZpLmgKQEAgLTM5LDMgKzM5LDUgQEAgZXh0ZXJu
IFVJTlQ2NCBlZmlfYm9vdF9tYXhfdmFyX3N0b3JlX3NpegogCiBleHRlcm4gVUlOVDY0IGVmaV9h
cHBsZV9wcm9wZXJ0aWVzX2FkZHI7CiBleHRlcm4gVUlOVE4gZWZpX2FwcGxlX3Byb3BlcnRpZXNf
bGVuOworCitjb25zdCBDSEFSMTYgKndtZW1jaHIoY29uc3QgQ0hBUjE2ICpzLCBDSEFSMTYgYywg
VUlOVE4gbik7Ci0tLSBhL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYworKysgYi94ZW4vY29tbW9u
L2VmaS9ydW50aW1lLmMKQEAgLTE5NCw3ICsxOTQsMTggQEAgdm9pZCBlZmlfcmVzZXRfc3lzdGVt
KGJvb2wgd2FybSkKIH0KIAogI2VuZGlmIC8qIENPTkZJR19BUk0gKi8KLSNlbmRpZgorCitjb25z
dCBDSEFSMTYgKndtZW1jaHIoY29uc3QgQ0hBUjE2ICpzLCBDSEFSMTYgYywgVUlOVE4gbikKK3sK
KyAgICB3aGlsZSAoIG4gJiYgKnMgIT0gYyApCisgICAgeworICAgICAgICAtLW47CisgICAgICAg
ICsrczsKKyAgICB9CisgICAgcmV0dXJuIG4gPyBzIDogTlVMTDsKK30KKworI2VuZGlmIC8qIENP
TVBBVCAqLwogCiAjaWZuZGVmIENPTkZJR19BUk0gLyogVE9ETyAtIGRpc2FibGVkIHVudGlsIGlt
cGxlbWVudGVkIG9uIEFSTSAqLwogaW50IGVmaV9nZXRfaW5mbyh1aW50MzJfdCBpZHgsIHVuaW9u
IHhlbnBmX2VmaV9pbmZvICppbmZvKQpAQCAtNDY1LDcgKzQ3NiwxMiBAQCBpbnQgZWZpX3J1bnRp
bWVfY2FsbChzdHJ1Y3QgeGVucGZfZWZpX3J1CiAgICAgICAgIG5hbWUgPSB4bWFsbG9jX2FycmF5
KENIQVIxNiwgKytsZW4pOwogICAgICAgICBpZiAoICFuYW1lICkKICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Ci0gICAgICAgIF9fY29weV9mcm9tX2d1ZXN0KG5hbWUsIG9wLT51LmdldF92YXJp
YWJsZS5uYW1lLCBsZW4pOworICAgICAgICBpZiAoIF9fY29weV9mcm9tX2d1ZXN0KG5hbWUsIG9w
LT51LmdldF92YXJpYWJsZS5uYW1lLCBsZW4pIHx8CisgICAgICAgICAgICAgd21lbWNocihuYW1l
LCAwLCBsZW4pICE9IG5hbWUgKyBsZW4gLSAxICkKKyAgICAgICAgeworICAgICAgICAgICAgeGZy
ZWUobmFtZSk7CisgICAgICAgICAgICByZXR1cm4gLUVJTzsKKyAgICAgICAgfQogCiAgICAgICAg
IHNpemUgPSBvcC0+dS5nZXRfdmFyaWFibGUuc2l6ZTsKICAgICAgICAgaWYgKCBzaXplICkKQEAg
LTUxMyw3ICs1MjksMTIgQEAgaW50IGVmaV9ydW50aW1lX2NhbGwoc3RydWN0IHhlbnBmX2VmaV9y
dQogICAgICAgICBuYW1lID0geG1hbGxvY19hcnJheShDSEFSMTYsICsrbGVuKTsKICAgICAgICAg
aWYgKCAhbmFtZSApCiAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwotICAgICAgICBfX2NvcHlf
ZnJvbV9ndWVzdChuYW1lLCBvcC0+dS5zZXRfdmFyaWFibGUubmFtZSwgbGVuKTsKKyAgICAgICAg
aWYgKCBfX2NvcHlfZnJvbV9ndWVzdChuYW1lLCBvcC0+dS5zZXRfdmFyaWFibGUubmFtZSwgbGVu
KSB8fAorICAgICAgICAgICAgIHdtZW1jaHIobmFtZSwgMCwgbGVuKSAhPSBuYW1lICsgbGVuIC0g
MSApCisgICAgICAgIHsKKyAgICAgICAgICAgIHhmcmVlKG5hbWUpOworICAgICAgICAgICAgcmV0
dXJuIC1FSU87CisgICAgICAgIH0KIAogICAgICAgICBkYXRhID0geG1hbGxvY19ieXRlcyhvcC0+
dS5zZXRfdmFyaWFibGUuc2l6ZSk7CiAgICAgICAgIGlmICggIWRhdGEgKQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
