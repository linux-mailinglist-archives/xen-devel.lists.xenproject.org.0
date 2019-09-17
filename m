Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BDB533F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:43:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGYS-00061a-C0; Tue, 17 Sep 2019 16:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGYQ-00061L-Sj
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:42:14 +0000
X-Inumbo-ID: 197c1bfe-d96a-11e9-961b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 197c1bfe-d96a-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738535;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=HRX5dN7gWdoVmtmWZVxCpAvLtDbpa6NJyUyzrF3onXc=;
 b=J5IrLECKdV/dnGhMNW2jVr/yxtpxeFb83Vw84VWfWb1ZoMbq296rzU0C
 IrLOk6zj9/IdoaUrKT/KRtLUS3FXlxuvH7mRxHSQ/tUrWVKdlzr3YluYB
 tARU1Jjt09w4obTyIOZBxI7T5kLRsg3I00TeiKlLa0orhT14aO1nDd9xm Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IVDB1dtz2JeoYjp2nhSCSVRMrjdYvqXLwOyZegiImLJeXphnjY9Pkf7H6ZcEMlotqWJUkUKEU9
 P1O+ycStkrZ6BeE1GShp9RP6SejWHIlbVVCPRcdcSYLy+tUjNq4p1msOzG/NHfO6od1vWADgFf
 tmKLFcfw/U8PxGkTRkssnRZOk8voQ4XOWKp0MslahTWxZ6YkkeBWzE67KbdNFrjzTyG3jbvCp1
 17Vi87EfJlDAJ8NKNCJYMVo7qAx9CLRXb2Tt67xYT/BadHyXFGTOvU2jLzJi1SkgliXrlymLsO
 w8c=
X-SBRS: 2.7
X-MesageID: 5684222
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5684222"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3298.916081.351956@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:42:10 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-8-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-8-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 07/15] libxl_dm: Fix initialisation of
 libxl__stub_dm_spawn_state
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA3LzE1XSBsaWJ4bF9kbTogRml4IGluaXRp
YWxpc2F0aW9uIG9mIGxpYnhsX19zdHViX2RtX3NwYXduX3N0YXRlIik6Cj4gc2Rzcy0+cHZxZW11
IHdhc24ndCBpbml0aWFsaWFzZWQgYW5kIGRpc3Bvc2VkIG9mIHByb3Blcmx5Lgo+IEFsc28sIG1v
dmUgdGhlIGluaXRpYWxpc2F0aW9uIG9mIHNkc3MtPnhzd2FpdCB3aXRoIHRoZSByZXN0IG9mIHRo
ZQo+IGluaXRpYWxpc2F0aW9uIG9mIHNkc3MuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
