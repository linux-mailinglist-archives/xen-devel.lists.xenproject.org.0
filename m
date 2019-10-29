Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39423E8C35
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:57:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTpU-0007rK-5L; Tue, 29 Oct 2019 15:54:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTpT-0007rA-AG
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:54:43 +0000
X-Inumbo-ID: 6b767946-fa64-11e9-9515-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b767946-fa64-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572364482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=gxr/idp7VvxFjvbAVO9iRz55yPBmFDQKszkpU+hIRsE=;
 b=VB0Bo6yElroT/eAO2YmqOMWxJfNEupY5S3UP07+aN0Gf4CZEYQPaJKx4
 6dwDlSGsUS43o5zcbc7yjVd/gpqtHfWI16lNkBFd8734a62OS25sy2xRR
 qMAVjpQF1A0weObiDUXmEo93iHg3EnSPzUiamaC1fdxr1BnPT4rNQLKla w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ju3QcWiEd95+M+1L5z6vr0sPJfrSkKaBVA+f2vv6pAEnRKnIRj/eI77cxhiacDzE6yZW0TDD0c
 jxh2bIoIPrg43peEmfs0oTvGB5xfRk1sMmT0/4xrmWFCSwyFmwlL8DYaoqN5mY0rdEN+SVNgr8
 ZBzqE4VNmkK6UHWZZWh+JXRbUPLh2EBCctpRhmq5BuUzejRlw4EhRxWp/bZGxfx/z0qbP9PKtF
 /6kt8Z2+EwUf5ppfY8Viu8T6Teq+EYiGNaarLcFehEGglMWP/IyQznj6/JSbGIIVYrKeLf3gYh
 z2A=
X-SBRS: 2.7
X-MesageID: 7568981
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7568981"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 29 Oct 2019 15:54:32 +0000
Message-ID: <20191029155436.14376-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <23992.24295.523533.643279@mariner.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 0/4] libxl: gentypes: initialise
 array elements in json
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3YgZGlzY292ZXJlZCB0aGF0IHRoZSBsaWJ4bCBqc29uIGlkbCBwYXJz
aW5nIGZhaWxzIHRvCnByb3Blcmx5IGluaXRpYWxpc2UgYXJyYXkgZWxlbWVudHMuCgpGaXhpbmcg
dGhpcyBpcyBub3QgZW50aXJlbHkgc3RyYWlnaHRmb3J3YXJkLCBiZWNhdXNlIHRoZSBjb2RlIHRv
IGRvCnRoZSBpbml0aWFsaXNhdGlvbiBpcyBub3QgY29udmVuaWVudGx5IGF2YWlsYWJsZSBhcyBh
IHNlcGFyYXRlCmZ1bmN0aW9uLgoKVG8gZWFzZSBkZWJ1Z2dpbmcgYW5kIHJldmlldywgSSBoYXZl
IGJyb2tlbiB0aGlzIHBhdGNoIHVwIGludG8gNCB2ZXJ5CnNtYWxsIHJlZmFjdG9yaW5ncyB3aGlj
aCBkbyBub3QgY2hhbmdlIHRoZSBvdXRwdXQsIHBsdXMgdGhlIG9uZSBwYXRjaAp0byBjYWxsIHRo
ZSBuZXdseS1wcm92aWRlZCBpbml0aWFsaXNlci4KCkkgdGhpbmsgdGhpcyB2ZXJzaW9uIGFkZHJl
c3NlcyBjb21tZW50cyBmcm9tIEp1bGllbiBHcmFsbCBvbiBlYXJsaWVyCnZlcnNpb25zLiAgSU1P
IGl0IGlzIGEgY2FuZGlhdGUgZm9yIDQuMTMsIGFuZCBhbHNvIGJhY2twb3J0aW5nLgoKSWFuIEph
Y2tzb24gKDMpOgogIHRvb2xzL2xpYnhsOiBnZW50eXBlcy5weTogUHJlZmVyIGluaXRfdmFsIHRv
IGluaXRfZm4KICBsaWJ4bDogZ2VudHlwZXMucHk6IEJyZWFrIG91dCBmaWVsZF9wYXNzIGluIC4u
Ll9jb3B5X2RlcHJlY2F0ZWQKICBsaWJ4bDogZ2VudHlwZXMucHk6IEJyZWFrIG91dCBsaWJ4bF9D
X3R5cGVfZG9faW5pdAoKT2xla3NhbmRyIEdyeXRzb3YgKDEpOgogIGxpYnhsOiBnZW50eXBlczog
aW5pdGlhbGlzZSBhcnJheSBlbGVtZW50cyBpbiBqc29uCgogdG9vbHMvbGlieGwvZ2VudHlwZXMu
cHkgfCAzNSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
