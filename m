Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A2155440
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 10:04:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izzVe-0008Au-D9; Fri, 07 Feb 2020 09:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJ3N=33=amazon.de=prvs=29956ded7=vrd@srs-us1.protection.inumbo.net>)
 id 1izzVc-0008Ap-TS
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 09:01:09 +0000
X-Inumbo-ID: 60bd8648-4988-11ea-b110-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60bd8648-4988-11ea-b110-12813bfff9fa;
 Fri, 07 Feb 2020 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1581066068; x=1612602068;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=fd9LUaLCdVcDB2rQf6iWGal3f2opkubKnd3P8La6qvk=;
 b=AYfJCBq+dFKRNUjzyfS0B37HEv6sKkRQ7FLVn3d3p6MsRXgLyEBWv/0m
 OGuRmeC1plwPnXlFSsplkWmcfQ4jWgd19platS6P6oKpsu1vXk28mqEbA
 gqHhPBv7OD5yiuKIGh1uCxS+g63wLFkNxAA1nm59q5EMKeX5zKbbCBm+V E=;
IronPort-SDR: G56RWXpJXDWBJfKijqHiXPNHjt2/r8rWOSvqCgxMJsr9VaQ/6Dcx0Zl7Q3yEX9Nk347X5wBNmZ
 2xmRQu4l/eig==
X-IronPort-AV: E=Sophos;i="5.70,412,1574121600"; d="scan'208";a="23635444"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Feb 2020 09:00:56 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 74FD1A2794
 for <xen-devel@lists.xenproject.org>; Fri,  7 Feb 2020 09:00:56 +0000 (UTC)
Received: from EX13D08UEB004.ant.amazon.com (10.43.60.142) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 7 Feb 2020 09:00:55 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB004.ant.amazon.com (10.43.60.142) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 7 Feb 2020 09:00:55 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.33) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 7 Feb 2020 09:00:54 +0000
From: Varad Gautam <vrd@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 7 Feb 2020 10:00:52 +0100
Message-ID: <1581066052-25269-1-git-send-email-vrd@amazon.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] kimage: Allow load/exec for images with
 KEXEC_TYPE_LIVE_UPDATE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Varad Gautam <vrd@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG8gbm90IC1FSU5WQUwgb24gbG9hZGluZy9leGVjaW5nIGFuIGltYWdlIGlmIGtleGVjIHR5cGUg
aXMKS0VYRUNfVFlQRV9MSVZFX1VQREFURS4KClNpZ25lZC1vZmYtYnk6IFZhcmFkIEdhdXRhbSA8
dnJkQGFtYXpvbi5kZT4KQ0M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0t
LQogeGVuL2NvbW1vbi9raW1hZ2UuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9raW1hZ2UuYyBiL3hlbi9jb21tb24va2lt
YWdlLmMKaW5kZXggODZkMjc5Ny4uNTk5YWE3NCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9raW1h
Z2UuYworKysgYi94ZW4vY29tbW9uL2tpbWFnZS5jCkBAIC00MjEsNiArNDIxLDcgQEAgc3RydWN0
IHBhZ2VfaW5mbyAqa2ltYWdlX2FsbG9jX2NvbnRyb2xfcGFnZShzdHJ1Y3Qga2V4ZWNfaW1hZ2Ug
KmltYWdlLAogICAgIHN3aXRjaCAoIGltYWdlLT50eXBlICkKICAgICB7CiAgICAgY2FzZSBLRVhF
Q19UWVBFX0RFRkFVTFQ6CisgICAgY2FzZSBLRVhFQ19UWVBFX0xJVkVfVVBEQVRFOgogICAgICAg
ICBwYWdlcyA9IGtpbWFnZV9hbGxvY19ub3JtYWxfY29udHJvbF9wYWdlKGltYWdlLCBtZW1mbGFn
cyk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgS0VYRUNfVFlQRV9DUkFTSDoKQEAgLTc3NSw2
ICs3NzYsNyBAQCBzdGF0aWMgaW50IGtpbWFnZV9sb2FkX3NlZ21lbnQoc3RydWN0IGtleGVjX2lt
YWdlICppbWFnZSwgeGVuX2tleGVjX3NlZ21lbnRfdCAqcwogICAgICAgICBzd2l0Y2ggKCBpbWFn
ZS0+dHlwZSApCiAgICAgICAgIHsKICAgICAgICAgY2FzZSBLRVhFQ19UWVBFX0RFRkFVTFQ6Cisg
ICAgICAgIGNhc2UgS0VYRUNfVFlQRV9MSVZFX1VQREFURToKICAgICAgICAgICAgIHJlc3VsdCA9
IGtpbWFnZV9sb2FkX25vcm1hbF9zZWdtZW50KGltYWdlLCBzZWdtZW50KTsKICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICBjYXNlIEtFWEVDX1RZUEVfQ1JBU0g6CkBAIC04MDMsNiArODA1LDcg
QEAgaW50IGtpbWFnZV9hbGxvYyhzdHJ1Y3Qga2V4ZWNfaW1hZ2UgKipyaW1hZ2UsIHVpbnQ4X3Qg
dHlwZSwgdWludDE2X3QgYXJjaCwKICAgICBzd2l0Y2goIHR5cGUgKQogICAgIHsKICAgICBjYXNl
IEtFWEVDX1RZUEVfREVGQVVMVDoKKyAgICBjYXNlIEtFWEVDX1RZUEVfTElWRV9VUERBVEU6CiAg
ICAgICAgIHJlc3VsdCA9IGtpbWFnZV9ub3JtYWxfYWxsb2MocmltYWdlLCBlbnRyeV9tYWRkciwg
bnJfc2VnbWVudHMsIHNlZ21lbnQpOwogICAgICAgICBicmVhazsKICAgICBjYXNlIEtFWEVDX1RZ
UEVfQ1JBU0g6Ci0tIAoyLjcuNAoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55
IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hy
aXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmlj
aHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6
IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
