Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3C9116C6E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:42:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHOQ-0007rb-DK; Mon, 09 Dec 2019 11:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YAdq=Z7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ieHOO-0007rP-8z
 for xen-devel@lists.xen.org; Mon, 09 Dec 2019 11:39:56 +0000
X-Inumbo-ID: 9e8b5412-1a78-11ea-87bf-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e8b5412-1a78-11ea-87bf-12813bfff9fa;
 Mon, 09 Dec 2019 11:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575891594;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=IcSjaC9t1P1DKXAW61689W9PZmlv4QGzG1qPTbp3zWg=;
 b=M4YP0ov9TC2BzHvoTVR12iy7lz1u81iu6osMslzayYvzqrCrRXEQQyhu
 EvbityHRQVFYgjhTllHyYH9MmfcMOA8eA1/R5Zbh4k59Cto2GU+Npu3vo
 71cVfW8If6CC5OucJUtQ8UeolVk3PlPH6uLTRKJDOKyhVOXj56zCySuQH g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QC5FRhwd+8eRDq7YZQosWzKxM/mY+tUv6A0METRFnPq/dnTM0bmYsX1wM0gOUFoiK3Bka+6LGU
 X1UYRVKQpxMy1xPdusz1gbRhTxZ2YAZNcS+x6huhkbCzX052Bx/mb9YxbOtdS2liCOeDI0Bzb9
 2gwUh2JTHFXHq8vEVsmt2gNS9DmCrZ+ycraCTYB+JxuwUqG00xdYrH4KvYj4k4tgA6VmhWrfC7
 jeNGfEWBg5/k68wJIMLwi+LGmB+VVxkYtAFPUnVSTOPr3q01mf2scfIX3J9u6WtUdXyzG93YS4
 s+M=
X-SBRS: 2.7
X-MesageID: 9741873
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9741873"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24046.12935.596930.542875@mariner.uk.xensource.com>
Date: Mon, 9 Dec 2019 11:39:51 +0000
To: Julien Grall <julien@xen.org>
In-Reply-To: <9b0e4402-574e-4d25-c7ee-5c28fe88a448@xen.org>
References: <24042.34323.159917.173963@mariner.uk.xensource.com>
 <b199414b-dbe6-2d0d-bd97-e5bafb402c47@xen.org>
 <24042.39208.563484.2274@mariner.uk.xensource.com>
 <9b0e4402-574e-4d25-c7ee-5c28fe88a448@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] Problem booting Debian buster on arndale
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBQcm9ibGVtIGJvb3RpbmcgRGViaWFuIGJ1c3RlciBv
biBhcm5kYWxlIik6Cj4gTG9va2luZyBhdCB0aGUgY29tbWFuZCBsaW5lIGZvciBMaW51eCwgd2Ug
ZG9uJ3QgcGFzcyBjbGtfaWdub3JlX3VudXNlZC4gCj4gV2l0aG91dCBpdCwgdGhlIExpbnV4IG1h
eSBkaXNhYmxlIHRoZSBjbG9jayBvZiB0aGUgVUFSVCBpZiBpdCB3YXNuJ3QgCj4gc2hhcmVkIHdp
dGggYW5vdGhlciBkZXZpY2UuIFRoaXMgd291bGQgZXhwbGFpbiB0aGUgc3VkZGVuIGxvc3Mgb2Yg
dGhlIAo+IGNvbnNvbGUuCj4gCj4gVGhlIGZvbGxvd2luZyBsaW5lIGluIE9zc3Rlc3QvRGViaWFu
LnBtIHdvdWxkIG5lZWQgdG8gYmUgdXBkYXRlZDoKPiAKPiAgICAgICBwdXNoIEB4ZW5rb3B0LCAi
Y2xrX2lnbm9yZV91bnVzZWQiCj4gICAgICAgICAgICAgIGlmICRoby0+e1N1aXRlfSA9fiBtL3do
ZWV6eXxqZXNzaWV8c3RyZXRjaC87CgpXZWxsIHNwb3R0ZWQuICBJIHdpbGwgdHJ5IHVwZGF0aW5n
IHRoaXMuICBUaGFua3MuCgooSXMgdGhlcmUgYW55IHBvc3NpYmlsaXR5IHRoYXQgdGhpcyBidWcg
d2lsbCBiZSBmaXhlZCBhdCBzb21lIHBvaW50PykKCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
