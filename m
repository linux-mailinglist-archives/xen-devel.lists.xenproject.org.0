Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A241619E6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3lMl-0000eM-HI; Mon, 17 Feb 2020 18:43:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3lMk-0000dp-8t
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 18:43:34 +0000
X-Inumbo-ID: 65fc6f2c-51b5-11ea-8038-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65fc6f2c-51b5-11ea-8038-12813bfff9fa;
 Mon, 17 Feb 2020 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581965013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mlsmzQpsByYtImnlFzRVdve76l4HJA+N0aDn+HBAbpE=;
 b=Yq3K9tf431qqud8z4VBeCb2yBpN9TOfQHuYE45q1siyxJyLwmOfkFYVH
 oR9eBY9xu+SmKyq1BBXbCfvi+Q5bsGJ3l+m1ZYXSJuewcJQnCvJl9WiiV
 5Jzutn+6/iM3gLIWjz05vfONcPgjBX1cLumYfLbJVTU6yjHJNNpWdiMTI M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hkN+OVyLWxW8V8PMG2PhCTr+51TDu2AIczBKp2Z1AjRaHxkFHHKvQ3ZZK3rtU0ab0DalmArr1I
 iYe8LhLqP0W458qZt9pXOD0dMNYqKM//eBh5bG1xV6fisNS7tvumbRxkoE2qrxEFVGJfEhmd1B
 9ryrwbqEwf/fsSbKkjv2bk5T+btHzHZKwSFuxOea5eD7f3EFw+9yp0ExTzAcGaBoyupDmdrCsh
 QTs8kj+jjU54MR0rCDKDCY+/YWStEIEdpWNYnEZkw6Kmc+Lc/bQFs/fvM+345Hi9uASQOqWzgE
 sZQ=
X-SBRS: 2.7
X-MesageID: 13012607
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="13012607"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 19:43:19 +0100
Message-ID: <20200217184324.73762-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217184324.73762-1-roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/6] x86/smp: unify header includes in smp.h
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VW5pZnkgdGhlIHR3byBhZGphY2VudCBoZWFkZXIgaW5jbHVkZXMgdGhhdCBhcmUgYm90aCBnYXRl
ZCB3aXRoIGlmbmRlZgpfX0FTU0VNQkxZX18uCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRl
ZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oIHwgNSAr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmggYi94ZW4vaW5jbHVkZS9hc20teDg2
L3NtcC5oCmluZGV4IDFhYTU1ZDQxZTEuLjkyZDY5YTVlYTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvc21wLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaApAQCAtNSwx
MyArNSwxMCBAQAogICogV2UgbmVlZCB0aGUgQVBJQyBkZWZpbml0aW9ucyBhdXRvbWF0aWNhbGx5
IGFzIHBhcnQgb2YgJ3NtcC5oJwogICovCiAjaWZuZGVmIF9fQVNTRU1CTFlfXworI2luY2x1ZGUg
PHhlbi9iaXRvcHMuaD4KICNpbmNsdWRlIDx4ZW4va2VybmVsLmg+CiAjaW5jbHVkZSA8eGVuL2Nw
dW1hc2suaD4KICNpbmNsdWRlIDxhc20vY3VycmVudC5oPgotI2VuZGlmCi0KLSNpZm5kZWYgX19B
U1NFTUJMWV9fCi0jaW5jbHVkZSA8eGVuL2JpdG9wcy5oPgogI2luY2x1ZGUgPGFzbS9tcHNwZWMu
aD4KICNlbmRpZgogCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
