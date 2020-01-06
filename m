Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1631314EE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:36:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUOf-0001UT-7R; Mon, 06 Jan 2020 15:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioUOe-0001UJ-1E
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:34:24 +0000
X-Inumbo-ID: 033fe8e6-309a-11ea-ab1f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 033fe8e6-309a-11ea-ab1f-12813bfff9fa;
 Mon, 06 Jan 2020 15:34:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5034DAEAC;
 Mon,  6 Jan 2020 15:34:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
Message-ID: <b20c85c7-2824-598c-d372-822f979fd97f@suse.com>
Date: Mon, 6 Jan 2020 16:35:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <73ea220a-d234-7a87-464e-59683fc3d815@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 2/3] x86/mm: rename and tidy
 create_pae_xen_mappings()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgZGFkNzRiMGY5ZSAoImkzODY6IGZpeCBoYW5kbGluZyBvZiBYZW4gZW50cmllcyBpbiBm
aW5hbCBMMiBwYWdlCnRhYmxlIikgYW5kIHRoZSByZW1vdmFsIG9mIDMyLWJpdCBzdXBwb3J0IHRo
ZSBmdW5jdGlvbiBkb2Vzbid0IG1vZGlmeQpzdGF0ZSBhbnltb3JlLCBhbmQgaGVuY2UgaXRzIG5h
bWUgaGFzIGJlZW4gbWlzbGVhZGluZy4gQ2hhbmdlIGl0cyBuYW1lLApjb25zdGlmeSBwYXJhbWV0
ZXJzIGFuZCBhIGxvY2FsIHZhcmlhYmxlLCBhbmQgbWFrZSBpdCByZXR1cm4gYm9vbC4KCkFsc28g
ZHJvcCB0aGUgY2FsbCB0byBpdCBmcm9tIG1vZF9sM19lbnRyeSgpOiBUaGUgZnVuY3Rpb24gZXhw
bGljaXRseQpkaXNhbGxvd3MgMzItYml0IGRvbWFpbnMgdG8gbW9kaWZ5IHNsb3QgMy4gVGhpcyB3
YXkgd2UgYWxzbyB3b24ndApyZS1jaGVjayBzbG90IDMgd2hlbiBhIHNsb3Qgb3RoZXIgdGhhbiBz
bG90IDMgY2hhbmdlcy4gRG9pbmcgc28gaGFzCm5lZWRsZXNzbHkgZGlzYWxsb3dlZCBtYWtpbmcg
c29tZSBMMiB0YWJsZSByZWN1cnNpdmVseSBsaW5rIGJhY2sgdG8gYW4KTDIgdXNlZCBpbiBzb21l
IEwzJ3MgM3JkIHNsb3QsIGFzIHdlIGNoZWNrIGZvciB0aGUgdHlwZSByZWYgY291bnQgdG8gYmUK
MS4gKE5vdGUgdGhhdCBhbGxvd2luZyBkeW5hbWljIGNoYW5nZXMgb2YgTDMgZW50cmllcyBpbiB0
aGUgd2F5IHdlIGRvIGlzCmJvZ3VzIGFueXdheSwgYXMgdGhhdCdzIG5vdCBob3cgTDNzIGJlaGF2
ZSBpbiB0aGUgbmF0aXZlIGFuZCBFUFQgY2FzZXM6ClRoZXkgZ2V0IHJlLWV2YWx1YXRlZCBvbmx5
IHVwb24gQ1IzIHJlbG9hZHMuIE5QVCBpcyBkaWZmZXJlbnQgaW4gdGhpcwpyZWdhcmQuKQoKQXMg
YSByZXN1bHQgb2YgdGhpcyB3ZSBubyBsb25nZXIgbmVlZCB0byBwbGF5IGdhbWVzIHRvIGdldCBh
dCB0aGUgc3RhcnQKb2YgdGhlIEwzIHRhYmxlLgoKQWRkaXRpb25hbGx5IG1vdmUgdGhlIHNpbmds
ZSByZW1haW5pbmcgY2FsbCBzaXRlLCBhbGxvd2luZyB0byBkcm9wIG9uZQppc19wdl8zMmJpdF9k
b21haW4oKSBpbnZvY2F0aW9uIGFuZCBhIF9QQUdFX1BSRVNFTlQgY2hlY2sgKGluIHRoZQpmdW5j
dGlvbiBpdHNlbGYpIGFzIHdlbGwgYXMgdG8gZXhpdCB0aGUgbG9vcCBlYXJseSAocmVtYWluaW5n
IGVudHJpZXMKaGF2ZSBhbGwgYmVuIHNldCB0byBlbXB0eSBqdXN0IGFoZWFkIG9mIHRoaXMgbG9v
cCkuCgpGdXJ0aGVyIG1vdmUgYSBCVUdfT04oKSBzdWNoIHRoYXQgaW4gdGhlIGNvbW1vbiBjYXNl
IGl0cyBjb25kaXRpb24Kd291bGRuJ3QgbmVlZCBldmFsdWF0aW5nLgoKRmluYWxseSwgc2luY2Ug
d2UncmUgYXQgaXQsIG1vdmUgaW5pdF94ZW5fcGFlX2wyX3Nsb3RzKCkgbmV4dCB0byB0aGUKcmVu
YW1lZCBmdW5jdGlvbiwgYXMgdGhleSByZWFsbHkgYmVsb25nIHRvZ2V0aGVyIChpbiBmYWN0Cmlu
aXRfeGVuX3BhZV9sMl9zbG90cygpIHdhcyBbaW5kaXJlY3RseV0gYnJva2VuIG91dCBvZiB0aGlz
IGZ1bmN0aW9uKS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KLS0tCnYyOiBSZWZpbmUgZGVzY3JpcHRpb24uIERyb3AgYW4gQVNTRVJUKCkuIEFkZCBhIGNv
bW1lbnQgYWhlYWQgb2YgdGhlCiAgICBmdW5jdGlvbi4KLS0tCldlIGNvdWxkIGdvIGZ1cnRoZXIg
aGVyZSBhbmQgZGVsZXRlIHRoZSBmdW5jdGlvbiBhbHRvZ2V0aGVyOiBUaGVyZSBhcmUKbm8gbGlu
ZWFyIG1hcHBpbmdzIGluIGEgUEdUX3BhZV94ZW5fbDIgdGFibGUgYW55bW9yZSAodGhpcyB3YXMg
b24gMzItYml0Cm9ubHkpLiBUaGUgY29ycmVzcG9uZGluZyBjb25kaXRpb25hbCBpbiBtb2RfbDNf
ZW50cnkoKSBjb3VsZCB0aGVuIGdvCmF3YXkgYXMgd2VsbCAob3IsIG1vcmUgcHJlY2lzZWx5LCB3
b3VsZCBuZWVkIHRvIGJlIHJlcGxhY2VkIGJ5IGNvcnJlY3QKaGFuZGxpbmcgb2YgM3JkIHNsb3Qg
dXBkYXRlcykuIFRoaXMgd291bGQgbWVhbiB0aGF0IGEgMzItYml0IGd1ZXN0CmZ1bmN0aW9uaW5n
IG9uIG5ldyBYZW4gbWF5IGZhaWwgdG8gd29yayBvbiBvbGRlciAocG9zc2libHkgMzItYml0KSBY
ZW4uCgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAt
MTQxNCwyMyArMTQxNCwyMiBAQCBzdGF0aWMgaW50IHByb21vdGVfbDFfdGFibGUoc3RydWN0IHBh
Z2VfCiAgICAgcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBjcmVhdGVfcGFlX3hlbl9tYXBw
aW5ncyhzdHJ1Y3QgZG9tYWluICpkLCBsM19wZ2VudHJ5X3QgKnBsM2UpCisvKgorICogTm90ZTog
VGhlIGNoZWNrcyBwZXJmb3JtZWQgYnkgdGhpcyBmdW5jdGlvbiBhcmUganVzdCB0byBlbmZvcmNl
IGEKKyAqIGxlZ2FjeSByZXN0cmljdGlvbiBuZWNlc3Nhcnkgb24gMzItYml0IGhvc3RzLiBUaGVy
ZSdzIG5vdCBtdWNoIHBvaW50IGluCisgKiByZWxheGluZyAoZHJvcHBpbmcpIHRoaXMgdGhvdWdo
LCBhcyAzMi1iaXQgZ3Vlc3RzIHdvdWxkIHN0aWxsIG5lZWQgdG8KKyAqIGNvbmZvcm0gdG8gdGhl
IG9yaWdpbmFsIHJlc3RyaWN0aW9ucyBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHJ1biBvbiAob2xk
KQorICogMzItYml0IFhlbi4KKyAqLworc3RhdGljIGJvb2wgcGFlX3hlbl9tYXBwaW5nc19jaGVj
ayhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBsM19wZ2VudHJ5X3QgKnBsM2UpCiB7Ci0gICAgc3RydWN0IHBhZ2VfaW5mbyAq
cGFnZTsKLSAgICBsM19wZ2VudHJ5X3QgICAgIGwzZTM7Ci0KLSAgICBpZiAoICFpc19wdl8zMmJp
dF9kb21haW4oZCkgKQotICAgICAgICByZXR1cm4gMTsKLQotICAgIHBsM2UgPSAobDNfcGdlbnRy
eV90ICopKCh1bnNpZ25lZCBsb25nKXBsM2UgJiBQQUdFX01BU0spOwotCi0gICAgLyogM3JkIEwz
IHNsb3QgY29udGFpbnMgTDIgd2l0aCBYZW4tcHJpdmF0ZSBtYXBwaW5ncy4gSXQgKm11c3QqIGV4
aXN0LiAqLwotICAgIGwzZTMgPSBwbDNlWzNdOwotICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKGwz
ZTMpICYgX1BBR0VfUFJFU0VOVCkgKQotICAgIHsKLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX1dB
Uk5JTkcsICJQQUUgTDMgM3JkIHNsb3QgaXMgZW1wdHlcbiIpOwotICAgICAgICByZXR1cm4gMDsK
LSAgICB9CisgICAgLyoKKyAgICAgKiAzcmQgTDMgc2xvdCBjb250YWlucyBMMiB3aXRoIFhlbi1w
cml2YXRlIG1hcHBpbmdzLiBJdCAqbXVzdCogZXhpc3QsCisgICAgICogd2hpY2ggb3VyIGNhbGxl
ciBoYXMgYWxyZWFkeSB2ZXJpZmllZC4KKyAgICAgKi8KKyAgICBsM19wZ2VudHJ5X3QgbDNlMyA9
IHBsM2VbM107CisgICAgY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSA9IGwzZV9nZXRfcGFn
ZShsM2UzKTsKIAogICAgIC8qCiAgICAgICogVGhlIFhlbi1wcml2YXRlIG1hcHBpbmdzIGluY2x1
ZGUgbGluZWFyIG1hcHBpbmdzLiBUaGUgTDIgdGh1cyBjYW5ub3QKQEAgLTE0NDEsMTcgKzE0NDAs
MjQgQEAgc3RhdGljIGludCBjcmVhdGVfcGFlX3hlbl9tYXBwaW5ncyhzdHJ1YwogICAgICAqICAg
ICBhLiBwcm9tb3RlX2wzX3RhYmxlKCkgY2FsbHMgdGhpcyBmdW5jdGlvbiBhbmQgdGhpcyBjaGVj
ayB3aWxsIGZhaWwKICAgICAgKiAgICAgYi4gbW9kX2wzX2VudHJ5KCkgZGlzYWxsb3dzIHVwZGF0
ZXMgdG8gc2xvdCAzIGluIGFuIGV4aXN0aW5nIHRhYmxlCiAgICAgICovCi0gICAgcGFnZSA9IGwz
ZV9nZXRfcGFnZShsM2UzKTsKICAgICBCVUdfT04ocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQ
R1RfcGlubmVkKTsKLSAgICBCVUdfT04oKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2Nv
dW50X21hc2spID09IDApOwogICAgIEJVR19PTighKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYg
UEdUX3BhZV94ZW5fbDIpKTsKICAgICBpZiAoIChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBH
VF9jb3VudF9tYXNrKSAhPSAxICkKICAgICB7CisgICAgICAgIEJVR19PTighKHBhZ2UtPnUuaW51
c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spKTsKICAgICAgICAgZ2RwcmludGsoWEVOTE9H
X1dBUk5JTkcsICJQQUUgTDMgM3JkIHNsb3QgaXMgc2hhcmVkXG4iKTsKLSAgICAgICAgcmV0dXJu
IDA7CisgICAgICAgIHJldHVybiBmYWxzZTsKICAgICB9CiAKLSAgICByZXR1cm4gMTsKKyAgICBy
ZXR1cm4gdHJ1ZTsKK30KKwordm9pZCBpbml0X3hlbl9wYWVfbDJfc2xvdHMobDJfcGdlbnRyeV90
ICpsMnQsIGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCit7CisgICAgbWVtY3B5KCZsMnRbQ09NUEFU
X0wyX1BBR0VUQUJMRV9GSVJTVF9YRU5fU0xPVChkKV0sCisgICAgICAgICAgICZjb21wYXRfaWRs
ZV9wZ190YWJsZV9sMlsKKyAgICAgICAgICAgICAgIGwyX3RhYmxlX29mZnNldChISVJPX0NPTVBB
VF9NUFRfVklSVF9TVEFSVCldLAorICAgICAgICAgICBDT01QQVRfTDJfUEFHRVRBQkxFX1hFTl9T
TE9UUyhkKSAqIHNpemVvZigqbDJ0KSk7CiB9CiAKIHN0YXRpYyBpbnQgcHJvbW90ZV9sMl90YWJs
ZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCB1bnNpZ25lZCBsb25nIHR5cGUpCkBAIC0xNTkyLDYg
KzE1OTgsMTYgQEAgc3RhdGljIGludCBwcm9tb3RlX2wzX3RhYmxlKHN0cnVjdCBwYWdlXwogICAg
ICAgICAgICAgICAgICAgICBsM2VfZ2V0X21mbihsM2UpLAogICAgICAgICAgICAgICAgICAgICBQ
R1RfbDJfcGFnZV90YWJsZSB8IFBHVF9wYWVfeGVuX2wyLCBkLAogICAgICAgICAgICAgICAgICAg
ICBwYXJ0aWFsX2ZsYWdzIHwgUFRGX3ByZWVtcHRpYmxlIHwgUFRGX3JldGFpbl9yZWZfb25fcmVz
dGFydCk7CisKKyAgICAgICAgICAgIGlmICggIXJjICkKKyAgICAgICAgICAgIHsKKyAgICAgICAg
ICAgICAgICBpZiAoIHBhZV94ZW5fbWFwcGluZ3NfY2hlY2soZCwgcGwzZSkgKQorICAgICAgICAg
ICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgcGwzZVtpXSA9IGFkanVzdF9ndWVzdF9sM2Uo
bDNlLCBkKTsKKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICAgICAgfQor
ICAgICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKKyAgICAgICAgICAgIH0KICAgICAgICAgfQog
ICAgICAgICBlbHNlIGlmICggIShsM2VfZ2V0X2ZsYWdzKGwzZSkgJiBfUEFHRV9QUkVTRU5UKSAp
CiAgICAgICAgIHsKQEAgLTE2MjEsOCArMTYzNyw2IEBAIHN0YXRpYyBpbnQgcHJvbW90ZV9sM190
YWJsZShzdHJ1Y3QgcGFnZV8KICAgICAgICAgcGwzZVtpXSA9IGFkanVzdF9ndWVzdF9sM2UobDNl
LCBkKTsKICAgICB9CiAKLSAgICBpZiAoICFyYyAmJiAhY3JlYXRlX3BhZV94ZW5fbWFwcGluZ3Mo
ZCwgcGwzZSkgKQotICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgaWYgKCByYyA8IDAgJiYgcmMg
IT0gLUVSRVNUQVJUICYmIHJjICE9IC1FSU5UUiApCiAgICAgewogICAgICAgICBnZHByaW50ayhY
RU5MT0dfV0FSTklORywKQEAgLTE2NjMsMTQgKzE2NzcsNiBAQCBzdGF0aWMgaW50IHByb21vdGVf
bDNfdGFibGUoc3RydWN0IHBhZ2VfCiAgICAgdW5tYXBfZG9tYWluX3BhZ2UocGwzZSk7CiAgICAg
cmV0dXJuIHJjOwogfQotCi12b2lkIGluaXRfeGVuX3BhZV9sMl9zbG90cyhsMl9wZ2VudHJ5X3Qg
KmwydCwgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKLXsKLSAgICBtZW1jcHkoJmwydFtDT01QQVRf
TDJfUEFHRVRBQkxFX0ZJUlNUX1hFTl9TTE9UKGQpXSwKLSAgICAgICAgICAgJmNvbXBhdF9pZGxl
X3BnX3RhYmxlX2wyWwotICAgICAgICAgICAgICAgbDJfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFU
X01QVF9WSVJUX1NUQVJUKV0sCi0gICAgICAgICAgIENPTVBBVF9MMl9QQUdFVEFCTEVfWEVOX1NM
T1RTKGQpICogc2l6ZW9mKCpsMnQpKTsKLX0KICNlbmRpZiAvKiBDT05GSUdfUFYgKi8KIAogLyoK
QEAgLTIzNDcsMTAgKzIzNTMsNiBAQCBzdGF0aWMgaW50IG1vZF9sM19lbnRyeShsM19wZ2VudHJ5
X3QgKnBsCiAgICAgICAgIHJldHVybiAtRUZBVUxUOwogICAgIH0KIAotICAgIGlmICggbGlrZWx5
KHJjID09IDApICkKLSAgICAgICAgaWYgKCAhY3JlYXRlX3BhZV94ZW5fbWFwcGluZ3MoZCwgcGwz
ZSkgKQotICAgICAgICAgICAgQlVHKCk7Ci0KICAgICBwdXRfcGFnZV9mcm9tX2wzZShvbDNlLCBt
Zm4sIFBURl9kZWZlcik7CiAgICAgcmV0dXJuIHJjOwogfQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
