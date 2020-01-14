Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBC13AE61
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:06:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOfx-0001LC-4a; Tue, 14 Jan 2020 16:04:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irOfv-0001L7-Sy
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:04:15 +0000
X-Inumbo-ID: 80942b60-36e7-11ea-83eb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80942b60-36e7-11ea-83eb-12813bfff9fa;
 Tue, 14 Jan 2020 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579017851;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=pHeOAViOJieT2JJamfQxiePo6YqaRxdXYD7/+tsdduQ=;
 b=Fy7yYyb8DnTWCGQFHGTvllFRxRoB1fXOj4/4r+iGA6sQ7870B5VG8CXD
 MFMgAoB4B6nH4+G9kFPI7hiTCsiCu/qIWWB6mkEPzU8rIYofHZ9JJ7cbs
 FqB4GsAb735TiPrR9UoF672b3NJkeSrbyXFGH6dCV5WD1zEXczv3WRVJ2 s=;
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
IronPort-SDR: bUCoXnfk+XldQbsN6GBIbcsqKTYeyDomfo93f+RwJ4qZVRPa+7Wlv+p6JUpG3a2tE+pH5opuiw
 vWiy6HKLWAFvnHTbe+eR6klInaiN7NrdhJ0bQENBlhkD1LsYiTp4oIfOAy4VyhS8xRpkxMQF21
 cigg/DiiQdY5CgXhov7Yd4aNQZ4uqRzMUmWOVRKqc5mImQ7bLSaqLUOYdE+Fx2IHJ8TfS8B08A
 27JoyfVzIWM4uWrjfXoIIHWMrjza+HqRQzgq5Vq2ENUg6nse6qP11aL17wPd0uZ0UCP/tviEvy
 MCI=
X-SBRS: 2.7
X-MesageID: 11327039
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,433,1571716800"; d="scan'208";a="11327039"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.59000.77354.382545@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:04:08 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-5-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-5-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 04/12] libxc/migration: Adjust layout of
 struct xc_sr_context
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDQvMTJdIGxpYnhjL21pZ3JhdGlvbjogQWRq
dXN0IGxheW91dCBvZiBzdHJ1Y3QgeGNfc3JfY29udGV4dCIpOgo+IFdlIGFyZSBzaG9ydGx5IGdv
aW5nIHRvIHdhbnQgdG8gaW50cm9kdWNlIHNvbWUgY29tbW9uIHg4NiBmaWVsZHMsIHNvIGhhdmlu
Zwo+IHg4Nl9wdiBhbmQgeDg2X2h2bSBhcyB0aGUgdG9wIGxldmVsIG9iamVjdHMgaXMgYSBwcm9i
bGVtLiAgSW5zZXJ0IGEKPiBzdXJyb3VuZGluZyBzdHJ1Y3QgeDg2IGFuZCBkcm9wIHRoZSB4ODYg
cHJlZml4IGZyb20gdGhlIHB2L2h2bSBvYmplY3RzLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
