Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E8E8C3D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:57:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTpU-0007rQ-Dc; Tue, 29 Oct 2019 15:54:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPTpT-0007rB-DG
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:54:43 +0000
X-Inumbo-ID: 6bb7eafc-fa64-11e9-bbab-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bb7eafc-fa64-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572364483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=aKU0KxS5FsGerTpu/Keet9AO9vers+s9VnZJYP8x/pc=;
 b=HYcqQZSBxzE7PxLj1w/OfBSrPL6M8HPx2wmqY/2IiQNS1GPQHYV1c2M3
 MNJ8Eo8Fgfz8XyL66LJMej+pYGshyFwtN4AgETd4H+JL9Ohlv+hzI1ixo
 /JkaFwc/fmAlUt7NfKDjMXO7V1gWA/v6EO172+7OXQP0ENtI9XmED1C8W Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EatLCHbg9DoCSReMVByFvOas9/4nB2ano1+rE8DdyZEy9GOW8z7eDqGvGgzgBoKdm01/5KTyvY
 6uTuRR5rLxxUyMB37Bfm2U9I6C1I8ubCZLOzffe1FCUX3IuO9r7iNDYLAajWKwImylI5Hg2ADQ
 kv1jmCnsDkI1qMMQ8po7g+GWbI++/D84ydFgbCYp+MOleLglWjqTSGJ3N6p4UyHQhgiJAK7dLU
 wqkuddj7g9lmzIJ3wjtOAEuwi1xHw5f1eI53DmgElea4rNg6fFzDDe+kGOc2w5wqkp+hxGVFgw
 nbg=
X-SBRS: 2.7
X-MesageID: 7669868
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7669868"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 29 Oct 2019 15:54:34 +0000
Message-ID: <20191029155436.14376-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <23992.24295.523533.643279@mariner.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 2/4] libxl: gentypes.py: Break
 out field_pass in ..._copy_deprecated
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

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdGhpcyBpbiBhIG1vbWVudC4KCk5vIGZ1bmN0aW9uYWwgY2hh
bmdlIHdpdGggZXhpc3RpbmcgdHlwZXM6IEMgb3V0cHV0IGlzIGlkZW50aWNhbC4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xz
L2xpYnhsL2dlbnR5cGVzLnB5IHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9nZW50eXBl
cy5weSBiL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5CmluZGV4IDE3NjkxMjE0NjguLjYyODgzYWNi
MmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5CisrKyBiL3Rvb2xzL2xpYnhs
L2dlbnR5cGVzLnB5CkBAIC0yODcsMTAgKzI4NywxMCBAQCBkZWYgbGlieGxfQ190eXBlX2NvcHlf
ZGVwcmVjYXRlZChmaWVsZCwgdiwgaW5kZW50ID0gIiAgICAiLCB2cGFyZW50ID0gTm9uZSk6CiAg
ICAgICAgIGlmIGZpZWxkLnR5cGUuY2hlY2tfZGVmYXVsdF9mbiBpcyBOb25lOgogICAgICAgICAg
ICAgcmFpc2UgRXhjZXB0aW9uKAogIkRlcHJlY2F0ZWQgZmllbGQgJXMgdHlwZSBkb2Vzbid0IGhh
dmUgYSBkZWZhdWx0IHZhbHVlIGNoZWNrZXIiICUgZmllbGQubmFtZSkKLSAgICAgICAgZmllbGRf
dmFsID0gZmllbGQudHlwZS5wYXNzX2FyZyh2LCB2cGFyZW50IGlzIE5vbmUsCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzc2J5PWlkbC5QQVNTX0JZX1ZBTFVFKQot
ICAgICAgICBmaWVsZF9wdHIgPSBmaWVsZC50eXBlLnBhc3NfYXJnKHYsIHZwYXJlbnQgaXMgTm9u
ZSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzYnk9aWRsLlBB
U1NfQllfUkVGRVJFTkNFKQorICAgICAgICBmaWVsZF9wYXNzID0gbGFtYmRhIGJ5OiBmaWVsZC50
eXBlLnBhc3NfYXJnKHYsIHZwYXJlbnQgaXMgTm9uZSwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzYnk9YnkpCisgICAgICAgIGZpZWxkX3Zh
bCA9IGZpZWxkX3Bhc3MoaWRsLlBBU1NfQllfVkFMVUUpCisgICAgICAgIGZpZWxkX3B0ciA9IGZp
ZWxkX3Bhc3MoaWRsLlBBU1NfQllfUkVGRVJFTkNFKQogICAgICAgICBzKz0gImlmICghJXMoJnAt
PiVzKSAmJiAhJXMoJXMpKVxuIiAlIChmaWVsZC50eXBlLmNoZWNrX2RlZmF1bHRfZm4sCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpZWxkLmRlcHJlY2F0
ZWRfYnksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZp
ZWxkLnR5cGUuY2hlY2tfZGVmYXVsdF9mbiwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
