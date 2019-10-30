Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3383FE9A5E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 11:51:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPlXi-00087a-6x; Wed, 30 Oct 2019 10:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPlXh-00087V-1F
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 10:49:33 +0000
X-Inumbo-ID: f4235d60-fb02-11e9-9521-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4235d60-fb02-11e9-9521-12813bfff9fa;
 Wed, 30 Oct 2019 10:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572432572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=53kv1hzVh1syBPovd4irk44PeF0e3PMSxWVja4mim/M=;
 b=fABV9g0Hw7sL9oGDQf2niWD6f9a/3v4GYfDR62hq7aeLlFegJ9kCs6+q
 8+47WAWnT5Ad3ekVp7k3CRKEUW5f4bmksePBHvq0wnk5gcjgZCk0Hl7gx
 vIz/pteFcJl2iwhgGp/Ngu4tMeV9p5mcK4aDaB1t6tbevgEpDrD9qAZg/ s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FdMDM8Ey6gwHQtx7TP1m6PiB4wWxNHSsyy9qIKVPNSmzYtP7VNQHom3ZDZOxv6NBkY9gytAHDa
 /KurKGS9LVcMPp6De8BLBqhtYBOGzdou8ko6LGdTUG7yI0/QKHgGj1jfKMexqtdAIwMkdi99ku
 4JWTWY6PUmdjAPVkCIk7lcvVc7xhKrxmkqTDg4I6uQHKHLChhwET2tfES5OI1IO2VUOFmB0FZ6
 mPBuxtAPwa8snyVCXpHVmdDTlYi4Q6UXCzLbUfV7b0mPUiigEavThl6aywIXTCCzNWOv0mB1V4
 dgg=
X-SBRS: 2.7
X-MesageID: 7611445
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="7611445"
Date: Wed, 30 Oct 2019 10:49:24 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191030104924.GC2381@perard.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
 <20191029155436.14376-3-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029155436.14376-3-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 2/4] libxl: gentypes.py:
 Break out field_pass in ..._copy_deprecated
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDM6NTQ6MzRQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2UgYXJlIGdvaW5nIHRvIHdhbnQgdGhpcyBpbiBhIG1vbWVudC4KPiAKPiBObyBmdW5j
dGlvbmFsIGNoYW5nZSB3aXRoIGV4aXN0aW5nIHR5cGVzOiBDIG91dHB1dCBpcyBpZGVudGljYWwu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
