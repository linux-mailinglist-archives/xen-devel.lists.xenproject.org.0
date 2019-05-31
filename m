Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9386311B2
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 17:54:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWjpI-0005Kw-62; Fri, 31 May 2019 15:52:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWjpH-0005Kr-EO
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:52:15 +0000
X-Inumbo-ID: 0c6aece4-83bc-11e9-b8a3-37cb199db616
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c6aece4-83bc-11e9-b8a3-37cb199db616;
 Fri, 31 May 2019 15:52:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 09:52:09 -0600
Message-Id: <5CF14DA40200007800234108@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 09:52:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] AMD/IOMMU: initialize IRQ tasklet only once
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgZG8gdGhpcyBvbmNlIHBlciBJT01NVSwgbm9yIGFmdGVyIHNldHRpbmcgdXAgdGhlIElP
TU1VIGludGVycnVwdAood2hpY2ggd2lsbCB3YW50IHRvIHNjaGVkdWxlIHRoaXMgdGFza2xldCku
IEluIGZhY3QgaXQgY2FuIGJlCmluaXRpYWxpemVkIGF0IGJ1aWxkIHRpbWUuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9pbml0LmMKQEAgLTMxLDcgKzMxLDggQEAKIAogc3RhdGljIGludCBfX2luaXRk
YXRhIG5yX2FtZF9pb21tdXM7CiAKLXN0YXRpYyBzdHJ1Y3QgdGFza2xldCBhbWRfaW9tbXVfaXJx
X3Rhc2tsZXQ7CitzdGF0aWMgdm9pZCBkb19hbWRfaW9tbXVfaXJxKHVuc2lnbmVkIGxvbmcgZGF0
YSk7CitzdGF0aWMgREVDTEFSRV9TT0ZUSVJRX1RBU0tMRVQoYW1kX2lvbW11X2lycV90YXNrbGV0
LCBkb19hbWRfaW9tbXVfaXJxLCAwKTsKIAogdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgaXZy
c19iZGZfZW50cmllczsKIHU4IF9fcmVhZF9tb3N0bHkgaXZoZF90eXBlOwpAQCAtMTA1Niw4ICsx
MDU3LDYgQEAgc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11X2luaXRfb25lKHN0cgogICAgIHBy
aW50aygiQU1ELVZpOiBJT01NVSAlZCBFbmFibGVkLlxuIiwgbnJfYW1kX2lvbW11cyApOwogICAg
IG5yX2FtZF9pb21tdXMrKzsKIAotICAgIHNvZnRpcnFfdGFza2xldF9pbml0KCZhbWRfaW9tbXVf
aXJxX3Rhc2tsZXQsIGRvX2FtZF9pb21tdV9pcnEsIDApOwotCiAgICAgcmV0dXJuIDA7CiAKIGVy
cm9yX291dDoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
