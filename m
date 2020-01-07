Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D09132972
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:00:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqJM-0005AW-VB; Tue, 07 Jan 2020 14:58:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioqJK-0005AF-JT
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 14:58:22 +0000
X-Inumbo-ID: 20bfc9b2-315e-11ea-b56d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20bfc9b2-315e-11ea-b56d-bc764e2007e4;
 Tue, 07 Jan 2020 14:58:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0BA8AC50;
 Tue,  7 Jan 2020 14:58:12 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d085404-ab62-fd67-646b-d539c77080d9@suse.com>
Date: Tue, 7 Jan 2020 15:58:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] libxl: don't needlessly report "highmem" in use
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVlIHRvIHRoZSB1bmNvbmRpdGlvbmFsIHVwZGF0aW5nIG9mIGRvbS0+aGlnaG1lbV9lbmQgaW4K
bGlieGxfX2RvbWFpbl9kZXZpY2VfY29uc3RydWN0X3JkbSgpIEkndmUgb2JzZXJ2ZWQgb24gYSAy
R2IgSFZNIGd1ZXN0CndpdGggYSBwYXNzZWQgdGhyb3VnaCBkZXZpY2UgKHdpdGhvdXQgb3Zlcmx5
IGxhcmdlIEJBUnMsIGFuZCB3aXRoIG5vIFJETQpyYW5nZXMgYXQgYWxsKQoKKGQyKSBSQU0gaW4g
aGlnaCBtZW1vcnk7IHNldHRpbmcgaGlnaF9tZW0gcmVzb3VyY2UgYmFzZSB0byAxMDAwMDAwMDAK
Li4uCihkMikgRTgyMCB0YWJsZToKKGQyKSAgWzAwXTogMDAwMDAwMDA6MDAwMDAwMDAgLSAwMDAw
MDAwMDowMDBhMDAwMDogUkFNCihkMikgIEhPTEU6IDAwMDAwMDAwOjAwMGEwMDAwIC0gMDAwMDAw
MDA6MDAwZDAwMDAKKGQyKSAgWzAxXTogMDAwMDAwMDA6MDAwZDAwMDAgLSAwMDAwMDAwMDowMDEw
MDAwMDogUkVTRVJWRUQKKGQyKSAgWzAyXTogMDAwMDAwMDA6MDAxMDAwMDAgLSAwMDAwMDAwMDo3
ZjgwMDAwMDogUkFNCihkMikgIEhPTEU6IDAwMDAwMDAwOjdmODAwMDAwIC0gMDAwMDAwMDA6ZmMw
MDAwMDAKKGQyKSAgWzAzXTogMDAwMDAwMDA6ZmMwMDAwMDAgLSAwMDAwMDAwMTowMDAwMDAwMDog
UkVTRVJWRUQKKGQyKSAgWzA0XTogMDAwMDAwMDE6MDAwMDAwMDAgLSAwMDAwMDAwMTowMDAwMDAw
MDogUkFNCgpib3RoIG9mIHdoaWNoIGFyZW4ndCByZWFsbHkgYXBwcm9wcmlhdGUgaW4gdGhpcyBj
YXNlLiBBcnJhbmdlIGZvciB0aGlzCnRvIG5vdCBoYXBwZW4uCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTQzMiw3ICs0MzIsNyBAQCBpbnQgbGli
eGxfX2RvbWFpbl9kZXZpY2VfY29uc3RydWN0X3JkbShsCiAgICAgdWludDE2X3Qgc2VnOwogICAg
IHVpbnQ4X3QgYnVzLCBkZXZmbjsKICAgICB1aW50NjRfdCByZG1fc3RhcnQsIHJkbV9zaXplOwot
ICAgIHVpbnQ2NF90IGhpZ2htZW1fZW5kID0gZG9tLT5oaWdobWVtX2VuZCA/IGRvbS0+aGlnaG1l
bV9lbmQgOiAoMXVsbDw8MzIpOworICAgIHVpbnQ2NF90IGhpZ2htZW1fZW5kID0gZG9tLT5oaWdo
bWVtX2VuZDsKIAogICAgIC8qCiAgICAgICogV2UganVzdCB3YW50IHRvIGNvbnN0cnVjdCBSRE0g
b25jZSBzaW5jZSBSRE0gaXMgc3BlY2lmaWMgdG8gdGhlCkBAIC01NTcsNiArNTU3LDggQEAgaW50
IGxpYnhsX19kb21haW5fZGV2aWNlX2NvbnN0cnVjdF9yZG0obAogICAgICAgICAgICAgICogV2Ug
d2lsbCBtb3ZlIGRvd253YXJkcyBsb3dtZW1fZW5kIHNvIHdlIGhhdmUgdG8gZXhwYW5kCiAgICAg
ICAgICAgICAgKiBoaWdobWVtX2VuZC4KICAgICAgICAgICAgICAqLworICAgICAgICAgICAgaWYg
KCFoaWdobWVtX2VuZCkKKyAgICAgICAgICAgICAgICBoaWdobWVtX2VuZCA9IDF1bGwgPDwgMzI7
CiAgICAgICAgICAgICBoaWdobWVtX2VuZCArPSAoZG9tLT5sb3dtZW1fZW5kIC0gcmRtX3N0YXJ0
KTsKICAgICAgICAgICAgIC8qIE5vdyBtb3ZlIGRvd253YXJkcyBsb3dtZW1fZW5kLiAqLwogICAg
ICAgICAgICAgZG9tLT5sb3dtZW1fZW5kID0gcmRtX3N0YXJ0OwpAQCAtNTc3LDkgKzU3OSwxMCBA
QCBpbnQgbGlieGxfX2RvbWFpbl9kZXZpY2VfY29uc3RydWN0X3JkbShsCiAgICAgICAgIGNvbmZs
aWN0ID0gb3ZlcmxhcHNfcmRtKDAsIGRvbS0+bG93bWVtX2VuZCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmRtX3N0YXJ0LCByZG1fc2l6ZSk7CiAgICAgICAgIC8qIERvZXMgdGhp
cyBlbnRyeSBjb25mbGljdCB3aXRoIGhpZ2htZW0/ICovCi0gICAgICAgIGNvbmZsaWN0IHw9IG92
ZXJsYXBzX3JkbSgoMVVMTDw8MzIpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZG9tLT5oaWdobWVtX2VuZCAtICgxVUxMPDwzMiksCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZG1fc3RhcnQsIHJkbV9zaXplKTsKKyAgICAgICAgaWYgKGhpZ2htZW1fZW5kKQor
ICAgICAgICAgICAgY29uZmxpY3QgfD0gb3ZlcmxhcHNfcmRtKCgxVUxMIDw8IDMyKSwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoaWdobWVtX2VuZCAtICgxVUxMIDw8IDMy
KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZG1fc3RhcnQsIHJkbV9z
aXplKTsKIAogICAgICAgICBpZiAoIWNvbmZsaWN0KQogICAgICAgICAgICAgY29udGludWU7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
