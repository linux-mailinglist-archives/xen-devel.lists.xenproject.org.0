Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF70FD6B8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 08:06:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVVeV-0008Ou-Qk; Fri, 15 Nov 2019 07:04:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVVeV-0008Op-0k
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 07:04:19 +0000
X-Inumbo-ID: 22f0072d-0776-11ea-a25f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22f0072d-0776-11ea-a25f-12813bfff9fa;
 Fri, 15 Nov 2019 07:04:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBF64AD77;
 Fri, 15 Nov 2019 07:04:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 08:04:14 +0100
Message-Id: <20191115070414.3862-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH for-4.13] libxl: fix device model timeout in
 libxl__dm_resume()
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
Cc: Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfX2RtX3Jlc3VtZSgpIGlzIHVzaW5nIGEgd3JvbmcgdGltZW91dCBmb3IgdGhlIHN0YXJ0
IG9mIHRoZQpkZXZpY2UgbW9kZWwuIEluc3RlYWQgb2YgNjAgc2Vjb25kcyB0aGUgdGltZW91dCBp
cyBzZXQgdG8gNjAKbWlsbGlzZWNvbmRzLgoKUmVwb3J0ZWQtYnk6IFJvbWFuIFNoYXBvc2huaWsg
PHJvbWFuQHplZGVkYS5jb20+CkZpeGVzOiA2Mjk4ZjBlYjhmNDQzNyAoImxpYnhsOiBSZS1pbnRy
b2R1Y2UgbGlieGxfX2RvbWFpbl9yZXN1bWUiKQpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tX3N1c3BlbmQuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9kb21fc3VzcGVuZC5jCmluZGV4IDI0OGRiYzMzZTMuLjM1YWUzMzcyNjEgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmMKKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfZG9tX3N1c3BlbmQuYwpAQCAtNTE1LDcgKzUxNSw3IEBAIHZvaWQgbGlieGxfX2RtX3Jlc3Vt
ZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgcmMgPSBsaWJ4bF9fZXZfdGltZV9yZWdpc3Rlcl9yZWwo
ZG1ycy0+YW8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRtcnMtPnRp
bWUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1fcmVzdW1lX3RpbWVv
dXQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTElCWExfREVWSUNFX01P
REVMX1NUQVJUX1RJTUVPVVQpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IExJQlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMCk7CiAgICAgaWYgKHJjKSBn
b3RvIG91dDsKIAogICAgIHN3aXRjaCAobGlieGxfX2RldmljZV9tb2RlbF92ZXJzaW9uX3J1bm5p
bmcoZ2MsIGRvbWlkKSkgewotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
