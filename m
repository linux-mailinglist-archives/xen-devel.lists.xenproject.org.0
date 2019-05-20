Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1923C79
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:45:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkQm-0006g3-5G; Mon, 20 May 2019 15:42:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkQk-0006fx-SB
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:42:26 +0000
X-Inumbo-ID: db3cd12c-7b15-11e9-9377-8365e4cd25c6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db3cd12c-7b15-11e9-9377-8365e4cd25c6;
 Mon, 20 May 2019 15:42:21 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 0shKuc6l1uOH/cMiGc5xgZ9kJAjOUL4BnnKQGK+WzfuGr9vdWZpiFQUj/pu7zIKyxDtFg32IcI
 OFZT1Zm/o2c9ZjTCsLUBaj0nxaVlAgDap8y/WLiuHaM7HFoiLS9Q7vIMlrW1nebLlDOL300ytT
 CqJ4/y498kWuXKG3irUhiSiDsSkfOixNdKlIOH/su5cLklTVk4f9HRrjc+9uYFpb8+kaM4vCzT
 Tlq+iVlL0KecNB+qpN1kEC3be2oMhyXhE18oaOpXXixu9nvyiKUg9kkHIWjHvZdj+MIrB2lOzo
 900=
X-SBRS: 2.7
X-MesageID: 647609
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="647609"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 16:41:43 +0100
Message-ID: <20190520154147.30675-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 0/4] mg-*: easier transient autoalloc
 repro
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gKDQpOgogIG1nLXJlcHJvLXNldHVwOiBEbyBhbGwgYnVpbGRzIGluIHRoZWly
IG93biB0YXNrcywgcmVnYXJkbGVzcwogIG1nLXRyYW5zaWVudC10YXNrOiBOZXcgdXRpbGl0eQog
IG1nLXJlcHJvLXNldHVwOiBJbnRyb2R1Y2UgYHN0YXRpY3Rhc2snIHZhcmlhYmxlCiAgbWctcmVw
cm8tc2V0dXA6IE5ldyBtb2RlIC0tYXV0b2FsbG9jCgogbWctcmVwcm8tc2V0dXAgICAgfCA0NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIG1nLXRyYW5zaWVu
dC10YXNrIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA3
NTUgbWctdHJhbnNpZW50LXRhc2sKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
