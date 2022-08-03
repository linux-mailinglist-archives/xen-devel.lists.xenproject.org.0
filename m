Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5245885E7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 04:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379512.613003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ4Mq-0001Vy-1h; Wed, 03 Aug 2022 02:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379512.613003; Wed, 03 Aug 2022 02:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ4Mp-0001TI-Sb; Wed, 03 Aug 2022 02:44:15 +0000
Received: by outflank-mailman (input) for mailman id 379512;
 Wed, 03 Aug 2022 02:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NhsF=YH=samsung.com=boyoun.park@srs-se1.protection.inumbo.net>)
 id 1oJ4Mo-0001TC-8Y
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 02:44:14 +0000
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 271a6174-12d6-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 04:44:12 +0200 (CEST)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220803024409epoutp0162dc1b2e5e54efe5e11ddc4642c05194~HtZdzF9zr0796607966epoutp01R
 for <xen-devel@lists.xenproject.org>; Wed,  3 Aug 2022 02:44:09 +0000 (GMT)
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220803024409epcas2p26103aa155034409ab6a66920bfb00c03~HtZdM5PLa3089130891epcas2p26;
 Wed,  3 Aug 2022 02:44:09 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.70]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4LyGQc2hZnz4x9Q0; Wed,  3 Aug
 2022 02:44:08 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.63.09650.8F0E9E26; Wed,  3 Aug 2022 11:44:08 +0900 (KST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: 271a6174-12d6-11ed-bd2d-47488cf2e6aa
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220803024409epoutp0162dc1b2e5e54efe5e11ddc4642c05194~HtZdzF9zr0796607966epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1659494649;
	bh=vSLU8kXF3mDoua1yVqGRtcIV/QdQxoaJke5YWxbr2Pk=;
	h=Date:Subject:Reply-To:From:To:CC:In-Reply-To:References:From;
	b=E5AKdE7ZjBqqLg69GJv8pB/pYJyR5KW2jwWtoTkblp4A57yj5Vi2EZNY41ZGIuy1g
	 6VNoNfklkYUqCr0bYMSiKapzoubAuEKjHX/ry47+axdGUwB4ypx4knyYkhQs4m+jeE
	 +Ubfe87XZIWgcFWUUQNubDRmUOeKC4yPnmyNsVjU=
X-AuditID: b6c32a46-0b9ff700000025b2-6d-62e9e0f8dbc7
Date: Wed, 03 Aug 2022 11:44:07 +0900
Message-ID: <1238367271.9969045.1659494647714@mail-kr2-1>
Mime-Version: 1.0
Subject: [PATCH v2 2/2] xen: remove init_constructors out of start_xen
Reply-To: boyoun.park@samsung.com
Sender: Boyoun Park <boyoun.park@samsung.com>
From: Boyoun Park <boyoun.park@samsung.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
	Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "wl@xen.org"
	<wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, Chungwoo Park
	<cww.park@samsung.com>, Gang Li <gang30.li@samsung.com>, Lei Wang
	<lei19.wang@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>, DongJin PARK
	<djpax.park@samsung.com>, Joonjae Lee <joonjae7.lee@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <1470588578.9967963.1659494457934@mail-kr2-1>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
X-CMS-MailID: 20220803024407epcms2p208a983abf94dd9d5732d85b715c6b95a
Content-Type: multipart/mixed;
	boundary="----=_Part_9969044_1992550747.1659494647714"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDJsWRmVeSWpSXmKPExsWy7bCmue6PBy+TDB4vELBY/HgXu8XSJZuZ
	LE7N6mSyWHb4HrvFhY97WSzmdxxisvi55yGbRWfXF1aLz7Mns1m07bjMajHj/GJWi8aF8Rar
	18Vb/FsaYfFxjbjF9y2TmRwEPNbMW8Po8XryBEaPO0t3MnpsWtXJ5nH4wxUWj74tqxg91m+5
	yuJx+tYstgCOqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58A
	XbfMHKD7lRTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVW
	hgYGRqZAhQnZGWvudDEWrDevmLlmBUsD40ajLkZODgkBE4mJi7czdTFycQgJ7GCU+Pp+GhtI
	gkVAVeL/zb0sIDavgKXElZPX2bsYOYBsQYm/O4RBwsICbhLfJ39mArGFBBQlWs8sZIeI60r0
	dO0FG8MmoC3x4uYtsDEiAvoSm243gtUwCyxjlVj5khfiBl6JGe1PWSBsaYnty7cygticAlYS
	6z80QMU1JH4s62WGsEUlbq5+yw5jvz82nxHCFpFovXcWqkZQ4sHP3VBxKYnGT4eg6osl5vSt
	Zwf5V0KggVHi5sWLTBAJfYkpLXNYIWwXia8bPzBCHBou8frUcWaQ3yUElCWOQPzCLMAn0XH4
	LzvM/TvmPYEaoyrxq+kFI8wve862Q9keEodfPGGBhPNGZom1t6axT2BUmIUI0llItkHY8hLb
	385hBilhFtCUWL9LHyKsJjGl/wsbRDhd4vc6Z4iwosSU7ofsCxjZVzGKpRYU56anFhsVGMET
	Q3J+7iZGcNLXctvBOOXtB71DjEwcjIcYVYB6H21YfYFRiiUvPy9VSYT3jsvzJCHelMTKqtSi
	/Pii0pzU4kOMpsAkMZFZSjQ5H5iP8kriDU0sDUzMzAzNjUwNzJXEeb1SNiQKCaQnlqRmp6YW
	pBbB9DFxcEo1MB0LDn3mPmHvjaQlO9n15fcLmJ+IkeTQLPngyPNvpUj78yWLVqXJru59arlY
	zW0Pr2Py65d9H7xbp+6wnDU77e7M6X/elHVPTnp6c9a+mLaZc7ocE63kbgdWW8jcyf0n/zTC
	etG/8M5V6xc/3/60bG3N97ssT7fnrzjFKlrSXs96w10oMK/sX/7Nn3lqinfX/b7K1rOtXlxu
	Q/l18UYni+Yr1vHhcQXTfCzNXNTLD0Z4O0pUmEw74pRiH+bWae9jwDHp4+1wrviT32bKt79u
	3LLpqQLDITklpdXTzx+Y172sJfLcTfFpijvryh18V4Rql+oUB/m389xOPPpW6N7l+addo67N
	cn9Z6HpE8NrTdCWW4oxEQy3mouJEAE1sPC2PBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220728092237epcms2p53821bba31388763f45b5204d56520c20
References: <1470588578.9967963.1659494457934@mail-kr2-1>
	<alpine.DEB.2.22.394.2207291447080.4648@ubuntu-linux-20-04-desktop>
	<alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
	<97499212.9948800.1659000157467@mail-kr2-3>
	<88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
	<20220729110313epcms2p5f9b24d5a65b98c220a6e99675298560f@epcms2p5>
	<CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p2>

------=_Part_9969044_1992550747.1659494647714
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

From: Boyoun Park <boyoun.park@samsung.com>
Date: Wed, 3 Aug 2022 10:31:55 +0900
Subject: [PATCH v2 2/2] xen: remove init_constructors out of start_xen

This patch removed init_constructors from start_xen
by using __late_initcall.
It can be applied to other init functions in start_xen
so that only main init functions are included in there.

To use __late_initcall, the format of a function should
be changed according to initcall. Thus, the return type
of init_constructors function is changed in this patch.

Change-Id: Ife13484d346cff15983aacbfefde21d508f4690a
Signed-off-by: Boyoun Park <boyoun.park@samsung.com>
---
 xen/arch/arm/setup.c  | 2 --
 xen/arch/x86/setup.c  | 2 --
 xen/include/xen/lib.h | 2 +-
 xen/lib/ctors.c       | 6 +++++-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 332a207..6c88b31 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1056,8 +1056,6 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     init_trace_bufs();
 
-    init_constructors();
-
     console_endboot();
 
     /* Hide UART from DOM0 if we're using it */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5dc6654..603100c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1941,8 +1941,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     init_trace_bufs();
 
-    init_constructors();
-
     console_endboot();
 
     /* Hide UART from DOM0 if we're using it */
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e1..8e08c29 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -211,7 +211,7 @@ extern void add_taint(unsigned int taint);
 struct cpu_user_regs;
 void cf_check dump_execstate(struct cpu_user_regs *);
 
-void init_constructors(void);
+int init_constructors(void);
 
 /*
  * bsearch - binary search an array of elements
diff --git a/xen/lib/ctors.c b/xen/lib/ctors.c
index 5bdc591..b54144b 100644
--- a/xen/lib/ctors.c
+++ b/xen/lib/ctors.c
@@ -4,7 +4,7 @@
 typedef void (*ctor_func_t)(void);
 extern const ctor_func_t __ctors_start[], __ctors_end[];
 
-void __init init_constructors(void)
+int __init init_constructors(void)
 {
     const ctor_func_t *f;
     for ( f = __ctors_start; f < __ctors_end; ++f )
@@ -12,8 +12,12 @@ void __init init_constructors(void)
 
     /* Putting this here seems as good (or bad) as any other place. */
     BUILD_BUG_ON(sizeof(size_t) != sizeof(ssize_t));
+
+    return 0;
 }
 
+__late_initcall(init_constructors);
+
 /*
  * Local variables:
  * mode: C
-- 
2.7.4
------=_Part_9969044_1992550747.1659494647714
Content-Type: application/octet-stream
Content-Disposition: attachment;
	filename="v2-0002-xen-remove-init_constructors-out-of-start_xen.patch"
Content-Transfer-Encoding: base64

RnJvbSA4MjVhMzA0ZDQ1YzgwYjgxNmIzMGZjYmM4MWUxZDNkYWI0ZjhjODFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8ODI1YTMwNGQ0NWM4MGI4MTZiMzBmY2JjODFlMWQz
ZGFiNGY4YzgxYS4xNjU5NDkyODE4LmdpdC5ib3lvdW4ucGFya0BzYW1zdW5nLmNvbT4KSW4tUmVw
bHktVG86IDw1ZmQ1OGFjODY3OTE4OWE4Nzg2MDllNDViNGJjZTFlNzhkZWU0ODQ4LjE2NTk0OTI4
MTguZ2l0LmJveW91bi5wYXJrQHNhbXN1bmcuY29tPgpSZWZlcmVuY2VzOiA8NWZkNThhYzg2Nzkx
ODlhODc4NjA5ZTQ1YjRiY2UxZTc4ZGVlNDg0OC4xNjU5NDkyODE4LmdpdC5ib3lvdW4ucGFya0Bz
YW1zdW5nLmNvbT4KRnJvbTogQm95b3VuIFBhcmsgPGJveW91bi5wYXJrQHNhbXN1bmcuY29tPgpE
YXRlOiBXZWQsIDMgQXVnIDIwMjIgMTA6MzE6NTUgKzA5MDAKU3ViamVjdDogW1BBVENIIHYyIDIv
Ml0geGVuOiByZW1vdmUgaW5pdF9jb25zdHJ1Y3RvcnMgb3V0IG9mIHN0YXJ0X3hlbgoKVGhpcyBw
YXRjaCByZW1vdmVkIGluaXRfY29uc3RydWN0b3JzIGZyb20gc3RhcnRfeGVuCmJ5IHVzaW5nIF9f
bGF0ZV9pbml0Y2FsbC4KSXQgY2FuIGJlIGFwcGxpZWQgdG8gb3RoZXIgaW5pdCBmdW5jdGlvbnMg
aW4gc3RhcnRfeGVuCnNvIHRoYXQgb25seSBtYWluIGluaXQgZnVuY3Rpb25zIGFyZSBpbmNsdWRl
ZCBpbiB0aGVyZS4KClRvIHVzZSBfX2xhdGVfaW5pdGNhbGwsIHRoZSBmb3JtYXQgb2YgYSBmdW5j
dGlvbiBzaG91bGQKYmUgY2hhbmdlZCBhY2NvcmRpbmcgdG8gaW5pdGNhbGwuIFRodXMsIHRoZSBy
ZXR1cm4gdHlwZQpvZiBpbml0X2NvbnN0cnVjdG9ycyBmdW5jdGlvbiBpcyBjaGFuZ2VkIGluIHRo
aXMgcGF0Y2guCgpDaGFuZ2UtSWQ6IElmZTEzNDg0ZDM0NmNmZjE1OTgzYWFjYmZlZmRlMjFkNTA4
ZjQ2OTBhClNpZ25lZC1vZmYtYnk6IEJveW91biBQYXJrIDxib3lvdW4ucGFya0BzYW1zdW5nLmNv
bT4KLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgfCAyIC0tCiB4ZW4vYXJjaC94ODYvc2V0dXAu
YyAgfCAyIC0tCiB4ZW4vaW5jbHVkZS94ZW4vbGliLmggfCAyICstCiB4ZW4vbGliL2N0b3JzLmMg
ICAgICAgfCA2ICsrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9h
cm0vc2V0dXAuYwppbmRleCAzMzJhMjA3Li42Yzg4YjMxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtMTA1Niw4ICsxMDU2LDYg
QEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwK
IAogICAgIGluaXRfdHJhY2VfYnVmcygpOwogCi0gICAgaW5pdF9jb25zdHJ1Y3RvcnMoKTsKLQog
ICAgIGNvbnNvbGVfZW5kYm9vdCgpOwogCiAgICAgLyogSGlkZSBVQVJUIGZyb20gRE9NMCBpZiB3
ZSdyZSB1c2luZyBpdCAqLwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYwppbmRleCA1ZGM2NjU0Li42MDMxMDBjIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTk0MSw4ICsx
OTQxLDYgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBt
YmlfcCkKIAogICAgIGluaXRfdHJhY2VfYnVmcygpOwogCi0gICAgaW5pdF9jb25zdHJ1Y3RvcnMo
KTsKLQogICAgIGNvbnNvbGVfZW5kYm9vdCgpOwogCiAgICAgLyogSGlkZSBVQVJUIGZyb20gRE9N
MCBpZiB3ZSdyZSB1c2luZyBpdCAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpYi5o
IGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCmluZGV4IDA1ZWUxZTEuLjhlMDhjMjkgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKQEAg
LTIxMSw3ICsyMTEsNyBAQCBleHRlcm4gdm9pZCBhZGRfdGFpbnQodW5zaWduZWQgaW50IHRhaW50
KTsKIHN0cnVjdCBjcHVfdXNlcl9yZWdzOwogdm9pZCBjZl9jaGVjayBkdW1wX2V4ZWNzdGF0ZShz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqKTsKIAotdm9pZCBpbml0X2NvbnN0cnVjdG9ycyh2b2lkKTsK
K2ludCBpbml0X2NvbnN0cnVjdG9ycyh2b2lkKTsKIAogLyoKICAqIGJzZWFyY2ggLSBiaW5hcnkg
c2VhcmNoIGFuIGFycmF5IG9mIGVsZW1lbnRzCmRpZmYgLS1naXQgYS94ZW4vbGliL2N0b3JzLmMg
Yi94ZW4vbGliL2N0b3JzLmMKaW5kZXggNWJkYzU5MS4uYjU0MTQ0YiAxMDA2NDQKLS0tIGEveGVu
L2xpYi9jdG9ycy5jCisrKyBiL3hlbi9saWIvY3RvcnMuYwpAQCAtNCw3ICs0LDcgQEAKIHR5cGVk
ZWYgdm9pZCAoKmN0b3JfZnVuY190KSh2b2lkKTsKIGV4dGVybiBjb25zdCBjdG9yX2Z1bmNfdCBf
X2N0b3JzX3N0YXJ0W10sIF9fY3RvcnNfZW5kW107CiAKLXZvaWQgX19pbml0IGluaXRfY29uc3Ry
dWN0b3JzKHZvaWQpCitpbnQgX19pbml0IGluaXRfY29uc3RydWN0b3JzKHZvaWQpCiB7CiAgICAg
Y29uc3QgY3Rvcl9mdW5jX3QgKmY7CiAgICAgZm9yICggZiA9IF9fY3RvcnNfc3RhcnQ7IGYgPCBf
X2N0b3JzX2VuZDsgKytmICkKQEAgLTEyLDggKzEyLDEyIEBAIHZvaWQgX19pbml0IGluaXRfY29u
c3RydWN0b3JzKHZvaWQpCiAKICAgICAvKiBQdXR0aW5nIHRoaXMgaGVyZSBzZWVtcyBhcyBnb29k
IChvciBiYWQpIGFzIGFueSBvdGhlciBwbGFjZS4gKi8KICAgICBCVUlMRF9CVUdfT04oc2l6ZW9m
KHNpemVfdCkgIT0gc2l6ZW9mKHNzaXplX3QpKTsKKworICAgIHJldHVybiAwOwogfQogCitfX2xh
dGVfaW5pdGNhbGwoaW5pdF9jb25zdHJ1Y3RvcnMpOworCiAvKgogICogTG9jYWwgdmFyaWFibGVz
OgogICogbW9kZTogQwotLSAKMi43LjQKCg==

------=_Part_9969044_1992550747.1659494647714--

