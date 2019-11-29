Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39F10D55F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:04:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaexv-0002Zb-2p; Fri, 29 Nov 2019 12:01:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iaexu-0002ZU-1x
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:01:38 +0000
X-Inumbo-ID: f290f715-129f-11ea-a3e3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f290f715-129f-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575028877;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2+AnupolVnhbZ3K+ntPzZXhF4PWUH8cFkwt6jcBXDTk=;
 b=bKHeQd4DkLsoZvBVY+O78Q3H03/jokB2QDeptZx3qNOGfcvvNNqCMLZW
 WGdTrxSnhQ7B9iyD0rYbwUsp7KWV+fD3fR751qMn/wB6+Iiy0d8Rp1Z/X
 3j27pkvLdx2wMsP2jrAhBaXrWzlONYtXp5t4Yd0KbZcF8ngZe1S/y1x+y A=;
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
IronPort-SDR: 7Y/bxdRCEC7md6mJ5jhIVkNXTVk0HfFjqu2cd3euLEiEab9q4YCswaOGwY4fmuBdChw96mNy1N
 hvc6HVGkSEv6x4weJw062XeuB8Fl3Zwc37ywW1nmuJ82xLYkief/X9N26kNsfaFAIJiJJ5gSnm
 PwPLTXVOffgmMOTVBjqpW7oZaQnXobKqsKWxKHqEXXRJX2eHkHoiadTbomD6O1GwOM38Jwz93D
 S+OLUZxR90pO0HWv86k1p+zhghfGFTBBkowFi49/c8+4a5SIe7+XZiT5nxqEI4PTtzGg6ZWbj5
 DQ8=
X-SBRS: 2.7
X-MesageID: 9338846
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9338846"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24033.2185.509756.178278@mariner.uk.xensource.com>
Date: Fri, 29 Nov 2019 12:01:13 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>, George
 Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSF0gY29uc29sZTogYXZvaWQgYnVmZmVyIG92
ZXJmbG93IGluIGd1ZXN0X2NvbnNvbGVfd3JpdGUoKSIpOgo+IE9uIDI5LjExLjIwMTkgMTE6MjIs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiBJcyBzaXplb2YoYXJyYXlbMF0pIGFsd2F5cyAwLCBv
ciBpcyB0aGlzIGp1c3QgYSBHQ0MtaXNtID/CoCBHb2Rib2x0Cj4gPiBzdWdnZXN0cyBpcyAwIG9u
IGFsbCBjb21waWxlciB3ZSBzdXBwb3J0Lgo+ID4gCj4gPiBFaXRoZXIgd2F5LCBpc24ndCB0aGUg
bW9yZSBjb21tb24gaWRpb20gKyAwdWwgP8KgIFBlcnNvbmFsbHksIEkgZmVlbCB0aGF0Cj4gPiBp
cyBjbGVhcmVyIHRvIGZvbGxvdy4KPiAKPiBJIGRlY2lkZWQgYWdhaW5zdCArIDB1bCBvciBhbGlr
ZSBiZWNhdXNlIGluIHByaW5jaXBsZSBzaXplX3QKPiBhbmQgdW5zaWduZWQgbG9uZyBhcmUgZGlm
ZmVyZW50IHR5cGVzLiBJbiBwYXJ0aWN1bGFyIDMyLWJpdAo+IHg4NiBnY2MgdXNlcyB1bnNpZ25l
ZCBpbnQgZm9yIHNpemVfdCwgYW5kIGhlbmNlIG1pbigpJ3MKPiB0eXBlIHNhZmV0eSBjaGVjayB3
b3VsZCBjYXVzZSB0aGUgYnVpbGQgdG8gZmFpbCB0aGVyZS4gVGhlCj4gc2FtZSByaXNrIG9idmlv
dXNseSBleGlzdHMgZm9yIGFueSAzMi1iaXQgYXJjaCAoZS5nLiBBcm0zMiwKPiBidXQgSSBoYXZl
bid0IGNoZWNrZWQgd2hhdCB0eXBlIGl0IGFjdHVhbGx5IHVzZXMpLgoKSSBkb24ndCBrbm93IHdo
YXQgaSB3cm9uZyB3aXRoCiAgIChzaXplX3QpMAp3aGljaCBpcyBzaG9ydGVyLCBldmVuICEKCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
