Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013F20317
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDBn-0002It-UM; Thu, 16 May 2019 10:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Tc=TQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRDBm-0002Io-Kn
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:00:38 +0000
X-Inumbo-ID: 72593bd4-77c1-11e9-ae61-e7b901b2f4ea
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72593bd4-77c1-11e9-ae61-e7b901b2f4ea;
 Thu, 16 May 2019 10:00:34 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: U6Okfe0+PrdmvkyE2Kbtvdk+GEaeoA6IJHJwOc0nsoQ1iAeMXgy8LK2iPLorhhBqAMu/CAI52w
 jmw/sI2aDfDwd0zPh2FMTzlaMQO4JEW014W/mBGzHCF7f/NWYwXnTspFKQz1ITQiVZjYyTsfya
 7rzxZ4N8gQ/39vKyD9KBdAJX7s0VYd/u1K4IVJDfJNaF9rJFQ/exAHJPH+fggJpkLNU3rRBCgR
 maagUDYIfvmRjnkmgTCssmLA1521md34jtBlCPofKgC+SrE5svakaJkf3U40ml9kP4JmfKCuvw
 jLY=
X-SBRS: 2.7
X-MesageID: 505637
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="505637"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23773.13473.418042.796038@mariner.uk.xensource.com>
Date: Thu, 16 May 2019 11:00:01 +0100
To: Wei Liu <wei.liu2@citrix.com>
In-Reply-To: <20190516091153.31502-1-wei.liu2@citrix.com>
References: <20190516091153.31502-1-wei.liu2@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: fix regression introduced in
 5c883cf036cf
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBmaXggcmVncmVzc2lvbiBpbnRyb2R1Y2Vk
IGluIDVjODgzY2YwMzZjZiIpOgo+IFR3byBsaW5lcyB3ZXJlIGVycm9uZW91c2x5IGRlbGV0ZWQg
ZHVyaW5nIHJlYmFzZSB3aGljaCBjYXVzZWQgZG9tYWluCj4gZGVzdHJ1Y3Rpb24gdG8gZmFpbC4K
CkkgaGF2ZSB0YWtlbiB0aGlzIGFzIGEgc2lnbiB0aGF0IEkgc2hvdWxkIGhhdmUgcHJvcGVybHkg
cmV2aWV3ZWQgd2hhdApiZWNhbWUgNWM4ODNjZjAzNmNmLgoKSGF2aW5nIGRvbmUgc28gSSBoYXZl
IGFsc28gc3BvdHRlZCB0aGF0OgoKVGhlIG5ld2x5IGludHJvZHVjZWQgRVJST1JfRkFJTCByZXR1
cm5zIGluIGxpYnhsIHNob3VsZCBiZSBFUlJPUl9OSQooIm5vdCBpbXBsZW1lbnRlZCIpLgoKQnV0
IEkgZGlkbid0IHNlZSBhbnl0aGluZyBlbHNlLCBvdGhlciB0aGFuIHRoZSByZWJhc2UgZXJyb3Ig
dGhhdCB5b3UKYXJlIGZpeGluZyBub3cuICBTbyBmb3IgdGhpcyBwYXRjaDoKCkFja2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
