Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115B10907F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 15:56:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFjy-0004h8-Bh; Mon, 25 Nov 2019 14:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gqts=ZR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZFjw-0004h3-PM
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:53:24 +0000
X-Inumbo-ID: 54459b28-0f93-11ea-b08b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54459b28-0f93-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574693605;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=E04TfPkPtUcUFEq0ydhIqwS5em+KNCAb2hL2xtPnBoQ=;
 b=gltjKashwc0d5EPz040Y2MZK/FiTe8q9qZhwIU0+sayym4hSx0Odfcib
 wC5cQgWUsD0HIYTcLAyKfqUFfzYdiNhHFq29FWq013jsZLaU6XbD1bi4m
 rlHvG9KI1CF2/F05BYW35cZC9sGZ2VwgBSeYEml6vENA+4HIYD8Btbfvc Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KRp13Y6x6vcoFvGUtgIDqgBGwFYIeqJzuMgZr3j4vypQT21XAwuaYBNa+NBluj4rEGUcwrpUXh
 20rBszMzCXNYObzDxLLyL//6a1e+2khPzVty+d+RIvdUmuCHwHv7rLk1xLT2tsrI5q4EsObr80
 B3D1uxF/kkttgXqwnFDfKNVBZHZkHFme8wEh5VgBRBHc9uOOVN9e4I+XCwgyNqV0mQOon8F7hM
 N8yGd/y5+qQf8LoPgEnoNBZoOYSIkT8B9a+ro7p3kcpdaObhsp4/kPX3d+MATnYhvATiHDt9AR
 bQM=
X-SBRS: 2.7
X-MesageID: 8788516
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="8788516"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24027.60128.902798.32980@mariner.uk.xensource.com>
Date: Mon, 25 Nov 2019 14:53:20 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <2eaad38d-836f-3548-980b-6f1d3c3bc4f5@suse.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
 <1095f982-8336-0e85-8245-0d74467e2895@eikelenboom.it>
 <24009.16196.627425.877118@mariner.uk.xensource.com>
 <46208d46-a203-2a4a-824f-e4962e9c8b91@eikelenboom.it>
 <24009.27021.89542.532323@mariner.uk.xensource.com>
 <24021.32214.623974.441377@mariner.uk.xensource.com>
 <2eaad38d-836f-3548-980b-6f1d3c3bc4f5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/13] Speed up and restore host
 history
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

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggMDAv
MTNdIFNwZWVkIHVwIGFuZCByZXN0b3JlIGhvc3QgaGlzdG9yeSIpOgo+IE9uIDIwLjExLjE5IDE4
OjU0LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEhpLCBJIHByb21pc2VkIHlvdSB0byBkbyBhIHJp
c2svYmVuZWZpdCBhbmFseXNpcyBvbiB0aGlzIHNlcmllcyBhbmQKPiA+IGhlcmUgaXMgbXkgcmVw
b3J0LiAgV2l0aCB5b3VyIHBlcm1pc3Npb24gSSBwbGFuIHRvIHB1c2ggaXQgb24gU3VuZGF5Cj4g
PiBuaWdodCBvciBNb25kYXkgbW9ybmluZywgaWYgeW91IHRoaW5rIHRoYXQgaXMgYSBjb252ZW5p
ZW50IHRpbWUuCj4gCj4gVFlWTS4KPiAKPiBJJ20gZmluZSB3aXRoIHlvdXIgcGxhbi4KClRoYW5r
cy4gIEkgaGF2ZSBwdXNoZWQgdGhpcyB0byBvc3N0ZXN0IHByZXRlc3QuICBDb2luY2lkZW50YWxs
eSwgd2UKaGF2ZSB3aGF0IGxvb2tzIGxpa2UgaXQgbWlnaHQgYmUgYSBsb3ctcHJvYmFiaWxpdHkg
aGFyZHdhcmUgcHJvYmxlbQp3aXRoIGRlYmluYTAuICBPciBtYXliZSBzb21lIG90aGVyIGtpbmQg
b2YgcHJvYmxlbS4gIEhvcGVmdWxseSB0aGUKbG9uZ2VyIGxvZ3Mgd2lsbCBoZWxwIGRpYWdub3Nl
IHRoaXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
