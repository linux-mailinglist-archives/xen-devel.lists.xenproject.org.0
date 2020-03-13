Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300281845D2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:19:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiJS-0006SR-Cv; Fri, 13 Mar 2020 11:17:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiJR-0006Rv-38
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:17:09 +0000
X-Inumbo-ID: 2d51ef1a-651c-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d51ef1a-651c-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 11:17:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDC52AAC7;
 Fri, 13 Mar 2020 11:17:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Message-ID: <675a13a0-9dd8-0df1-4f0c-7265d2b328cc@suse.com>
Date: Fri, 13 Mar 2020 12:17:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 7/9] x86/HVM: reduce io.h include dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYgYXMgd2VsbCBh
cyBvbmUgaW5jbHVkZQpvZiB0aGUgaGVhZGVyIHdoaWNoIGlzbid0IG5lZWRlZC4gUHV0IHRoZSBv
bmUgbmVlZGVkIGludG8gdGhlIGZpbGUKYWN0dWFsbHkgcmVxdWlyaW5nIGl0LgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS9pby5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvLmgKQEAgLTE5LDEyICsxOSw4
IEBACiAjaWZuZGVmIF9fQVNNX1g4Nl9IVk1fSU9fSF9fCiAjZGVmaW5lIF9fQVNNX1g4Nl9IVk1f
SU9fSF9fCiAKLSNpbmNsdWRlIDx4ZW4vbW0uaD4KICNpbmNsdWRlIDx4ZW4vcGNpLmg+Ci0jaW5j
bHVkZSA8YXNtL2h2bS92cGljLmg+Ci0jaW5jbHVkZSA8YXNtL2h2bS92aW9hcGljLmg+CiAjaW5j
bHVkZSA8cHVibGljL2h2bS9pb3JlcS5oPgotI2luY2x1ZGUgPHB1YmxpYy9ldmVudF9jaGFubmVs
Lmg+CiAKICNkZWZpbmUgTlJfSU9fSEFORExFUlMgMzIKIAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92Y3B1LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCkBAIC0y
Niw2ICsyNiw3IEBACiAjaW5jbHVkZSA8YXNtL2h2bS9zdm0vdm1jYi5oPgogI2luY2x1ZGUgPGFz
bS9odm0vc3ZtL25lc3RlZHN2bS5oPgogI2luY2x1ZGUgPGFzbS9tdHJyLmg+CisjaW5jbHVkZSA8
cHVibGljL2h2bS9pb3JlcS5oPgogCiBlbnVtIGh2bV9pb19jb21wbGV0aW9uIHsKICAgICBIVk1J
T19ub19jb21wbGV0aW9uLAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKQEAgLTE4LDggKzE4LDYg
QEAKICNpZm5kZWYgX19BU01fWDg2X0hWTV9WTVhfVk1DU19IX18KICNkZWZpbmUgX19BU01fWDg2
X0hWTV9WTVhfVk1DU19IX18KIAotI2luY2x1ZGUgPGFzbS9odm0vaW8uaD4KLQogZXh0ZXJuIHZv
aWQgdm1jc19kdW1wX3ZjcHUoc3RydWN0IHZjcHUgKnYpOwogZXh0ZXJuIHZvaWQgc2V0dXBfdm1j
c19kdW1wKHZvaWQpOwogZXh0ZXJuIGludCAgdm14X2NwdV91cF9wcmVwYXJlKHVuc2lnbmVkIGlu
dCBjcHUpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
