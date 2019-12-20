Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F670127B41
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 13:50:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiHhO-0001pl-MQ; Fri, 20 Dec 2019 12:48:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiHhN-0001pg-B3
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:48:05 +0000
X-Inumbo-ID: f6719a0e-2326-11ea-934c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6719a0e-2326-11ea-934c-12813bfff9fa;
 Fri, 20 Dec 2019 12:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576846084;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+eeCGVGpXRm6a1hwWSDinQL2H0Rc+sTvPmXBArFhN9Y=;
 b=MiiIZatywsquUupZam9i6DqnD64ETV4Rk9ba2gILDEkzmOPBcJ+TUKsW
 xOx03xKiv4rozep48y3U45SjHqy7cfr2q9UGTfSrKF5aHtgFgQn6zPfod
 ZHy4SEfPTgLnDMN9Ri9SPMmN2ee5vSUVU9+Xf/vKFbcFmh3QrCSaiShyr 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Sdjnx/4B48PXHHPuF78UYMJfD/CXMn6pUw82b2xkdHQnPWkWryDjYGfdB5niYlQf7zrG/EHv2y
 T0dX0Vj4eUvbZTtSMYrPkLGSz1hFIom0R7eRVwJ1HTmhCtU/o3A/KbpBohw9+XKWZ+tDFUDG5M
 e0uHJWcxOucrnIxIGcbjp36JmAGzlUqKqZASf7vP4+vDIeZl9F5aWQL5VAfwr/iHZa5lZClxOK
 8VS60RilsQytW82EulUTQ7H/L4m6RuVOYNCKlaf7zjDRGIukYzmXLBBgNi87TMZYdBeIMRSaD8
 B4I=
X-SBRS: 2.7
X-MesageID: 10407115
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,335,1571716800"; d="scan'208";a="10407115"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24060.49921.171923.210173@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 12:48:01 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191219182115.1432-1-andrew.cooper3@citrix.com>
References: <20191219182115.1432-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/libxc: Drop unused xc_compression_*()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIHRvb2xzL2xpYnhjOiBEcm9wIHVudXNlZCB4
Y19jb21wcmVzc2lvbl8qKCkiKToKPiBUaGVyZSBoYXZlIGJlZW4gbm8gdXNlcnMgb2YgdGhlIHhj
X2NvbXByZXNzaW9uXyooKSBpbnRlcmZhY2Ugc2luY2UgTWlncmF0aW9uCj4gdjIgcmVwbGFjZWQg
bGVnYWN5IG1pZ3JhdGlvbiAoMjAxNiwgYy9zIGIxNWJjNDM0NSkuCgpBY2tlZC1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUYWtpbmcgeW91IGF0IHlvdXIgd29y
ZCB0aGF0IHRoaXMgaXMgdW51c2VkIC0gSSBoYXZlbid0IGNoZWNrZWQKbXlzZWxmLgoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
