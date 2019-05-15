Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CA1EA1B
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 10:26:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQpCR-0003FH-8N; Wed, 15 May 2019 08:23:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQpCP-0003FC-PR
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:23:41 +0000
X-Inumbo-ID: be2527ad-76ea-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id be2527ad-76ea-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 08:23:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 02:23:39 -0600
Message-Id: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 02:23:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlaXIgcHJlLUFWWDUxMiBpbmNhcm5hdGlvbnMgaGF2ZSBjbGVhcmx5IGJlZW4gb3Zlcmxvb2tl
ZCBkdXJpbmcgbXVjaAplYXJsaWVyIHdvcmsuIFRoZWlyIG1lbW9yeSBhY2Nlc3MgcGF0dGVybiBp
cyBlbnRpcmVseSBzdGFuZGFyZCwgc28gbm8Kc3BlY2lmaWMgdGVzdHMgZ2V0IGFkZGVkIHRvIHRo
ZSBoYXJuZXNzLgoKUmVwb3J0ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTY2MjQsNiArNjYyNCw4IEBA
IHg4Nl9lbXVsYXRlKAogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjMpOiAv
KiB2cHNsbHEgeG1tL20xMjgse3gseX1tbSx7eCx5fW1tICovCiAgICAgY2FzZSBYODZFTVVMX09Q
Q182NigweDBmLCAweGY0KTogICAgIC8qIHBtdWx1ZHEgeG1tL20xMjgseG1tICovCiAgICAgY2Fz
ZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhmNCk6IC8qIHZwbXVsdWRxIHt4LHl9bW0vbWVt
LHt4LHl9bW0se3gseX1tbSAqLworICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKDB4MGYsIDB4ZjUp
OiAgICAvKiBwbWFkZHdkIHsseH1tbS9tZW0seyx4fW1tICovCisgICAgY2FzZSBYODZFTVVMX09Q
Q19WRVhfNjYoMHgwZiwgMHhmNSk6IC8qIHZwbWFkZHdkIHt4LHl9bW0vbWVtLHt4LHl9bW0se3gs
eX1tbSAqLwogICAgIGNhc2UgWDg2RU1VTF9PUENfNjYoMHgwZiwgMHhmNik6ICAgICAvKiBwc2Fk
YncgeG1tL20xMjgseG1tICovCiAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZiwgMHhm
Nik6IC8qIHZwc2FkYncge3gseX1tbS9tZW0se3gseX1tbSx7eCx5fW1tICovCiAgICAgQ0FTRV9T
SU1EX1BBQ0tFRF9JTlQoMHgwZiwgMHhmOCk6ICAgIC8qIHBzdWJiIHsseH1tbS9tZW0seyx4fW1t
ICovCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
