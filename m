Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9D144039
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 16:11:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itv7h-0006Fh-VL; Tue, 21 Jan 2020 15:07:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li9x=3K=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1itv7f-0006Fc-V8
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 15:07:19 +0000
X-Inumbo-ID: b2b9be53-3c5f-11ea-bacb-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b2b9be53-3c5f-11ea-bacb-12813bfff9fa;
 Tue, 21 Jan 2020 15:07:12 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 10:07:02 -0500
Message-ID: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v4 0/2] xen/arm: physical timer improvements
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXQgaW1wcm92ZXMgdGhlIGVtdWxhdGlvbiBvZiB0aGUgcGh5c2ljYWwgdGlt
ZXIgYnkgcmVtb3ZpbmcgdGhlCnBoeXNpY2FsIHRpbWVyIG9mZnNldCBhbmQgc2lnbiBleHRlbmQg
dGhlIFRpbWVyVmFsdWUgdG8gYmV0dGVyIG1hdGNoIHRoZQpiZWhhdmlvciBkZXNjcmliZWQgaW4g
dGhlIEFSTXY4IFJlZmVyZW5jZSBNYW51YWwgKEFSTSBEREkgMDQ4N0UuYSksIHNlY3Rpb24KRDEx
LjIuNC4KCkNoYW5nZXMgaW4gdjI6Ci0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHNwZWNpZnkg
cmVmZXJlbmNlIG1hbnVhbCB2ZXJzaW9uIGFuZCBzZWN0aW9uCi0gQ2hhbmdlIHBoeXNpY2FsIHRp
bWVyIGN2YWwgdG8gaG9sZCBoYXJkd2FyZSB2YWx1ZQotIE1ha2Ugc3VyZSB0byBzaWduIGV4dGVu
ZCBUaW1lclZhbHVlIG9uIHdyaXRlcy4gVGhpcyB3YXMgZG9uZSBieSBmaXJzdAogIGNhc3Rpbmcg
dGhlIHIgcG9pbnRlciB0byAoaW50MzJfdCAqKSwgZGVyZWZlcmVuY2luZyBpdCwgdGhlbiBjYXN0
aW5nCiAgdG8gdWludDY0X3QuIFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBhIG1vcmUg
Y29ycmVjdCB3YXkgdG8gZG8KICB0aGlzCgpDaGFuZ2VzIGluIHYzOgotIFNwbGl0IFRpbWVyVmFs
dWUgc2lnbiBleHRlbnNpb24gZml4IGludG8gc2VwYXJhdGUgcGF0Y2gKLSBVcGRhdGUgY29tbWl0
IG1lc3NhZ2UgdG8gbWVudGlvbiBwaHlzaWNhbCB0aW1lciBjbGVhbnVwCi0gUmVtb3ZlZCBwaHlz
aWNhbCB0aW1lciBjdmFsIGluaXRpYWxpemF0aW9uIGxpbmUKLSBDaGFuZ2VkIFRpbWVyVmFsdWUg
c2lnbiBleHRlbnNpb24gdG8gKHVpbnQ2NF90KShpbnQzMl90KSpyCi0gQWNjb3VudCBmb3IgY29u
ZGl0aW9uIHdoZXJlIGN2YWwgPCBib290X2NvdW50CgpDaGFuZ2VzIGluIHY0OgotIEltcHJvdmVk
IGNvbW1pdCBtZXNzYWdlIGZvciBwYXRjaCAjMiwgYXMgc3VnZ2VzdGVkL3Byb3ZpZGVkIGJ5IEp1
bGllbgoKSmVmZiBLdWJhc2NpayAoMik6CiAgeGVuL2FybTogcmVtb3ZlIHBoeXNpY2FsIHRpbWVy
IG9mZnNldAogIHhlbi9hcm06IFNpZ24gZXh0ZW5kIFRpbWVyVmFsdWUgd2hlbiBjb21wdXRpbmcg
dGhlIENvbXBhcmVWYWx1ZQoKIHhlbi9hcmNoL2FybS92dGltZXIuYyAgICAgICAgfCAzNCArKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFp
bi5oIHwgIDMgLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0
aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
