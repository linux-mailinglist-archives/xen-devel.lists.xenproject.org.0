Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBABB161951
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:03:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3kgH-00048Z-TI; Mon, 17 Feb 2020 17:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCVl=4F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j3kgG-00048R-Ve
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 17:59:41 +0000
X-Inumbo-ID: 444e441f-51af-11ea-8024-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 444e441f-51af-11ea-8024-12813bfff9fa;
 Mon, 17 Feb 2020 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581962380;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ElvHMmZDyESmROQ1h4gVzqcu7emP/TFFUQQAC3GFZGU=;
 b=VsnVMFUey2c81XrkAshJ72EcFPj7sekguBQgcucSXW05NiaPxN0N7auz
 nd7Nur8EyJrU1XujFMzQ6zIFl8RckyuEOy31hCWpgxkjm3uyoXMr1zIAT
 CcfMXGUVuwFr6anH764lobifTu5ZcF7qyywYsKebPUXDZm2Z8zO5uNdZ5 o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: RGglPy82TuakltjhpNBK7ahDlnHjnobE0leq6XF3LUxMmXP3Sp3KYDPGq3II+iAYKTBIEfCrQa
 TD26YVFm7OKXy1EFlCJRP5GhxPQo17OzI9++4u6WD9nJmbfVZnv4a8hYXrETFmd994Iba6eIqy
 2wXz/sKG1La6SvDJso0MGwFwDhSvTdkQhjdddJZfkujVTJlri25JTXBUmH1lOj0towlzaYvkuy
 A+10rVyOgc2IHiz0+zsrrLXEuYd3Twt6jynpE70/aSghi3LoiU0bCYK/SLATSl3flJgYCSX2UA
 lAo=
X-SBRS: 2.7
X-MesageID: 12752024
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12752024"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24138.54403.353404.802519@mariner.uk.xensource.com>
Date: Mon, 17 Feb 2020 17:59:31 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200217175731.14828-1-andrew.cooper3@citrix.com>
References: <20200205165056.11734-6-andrew.cooper3@citrix.com>
 <20200217175731.14828-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 5/6] tools/libx[cl]: Don't use
 HVM_PARAM_PAE_ENABLED as a function parameter
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgNS82XSB0b29scy9saWJ4W2NsXTogRG9u
J3QgdXNlIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciIpOgo+
IEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBpcyBzZXQgYW5kIGNvbnN1bWVkIGJ5IHRoZSB0b29sc3Rh
Y2sgb25seS4gIEl0IGlzIGluCj4gcHJhY3RpY2UgYSBjb21wbGljYXRlZCBhbmQgbm9uLXN0YW5k
YXJkIHdheSBvZiBwYXNzaW5nIGEgYm9vbGVhbiBwYXJhbWV0ZXIKPiBpbnRvIHhjX2NwdWlkX2Fw
cGx5X3BvbGljeSgpLgo+IAo+IFRoaXMgaXMgc2lsbHkuICBQYXNzIFBBRSBhcyBhIHJlZ3VsYXIg
cGFyYW1ldGVyIGluc3RlYWQuCj4gCj4gSW4gbGlieGxfX2NwdWlkX2xlZ2FjeSgpLCBsZWF2ZSBh
IHJhdGhlciBiZXR0ZXIgZXhwbGFpbmF0aW9uIG9mIHdoeSBvbmx5IEhWTQo+IGd1ZXN0cyBoYXZl
IGEgY2hvaWNlIGluIFBBRSBzZXR0aW5nLgo+IAo+IE5vIGNoYW5nZSBpbiBob3cgYSBndWVzdCBp
cyBjb25zdHJ1Y3RlZC4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
