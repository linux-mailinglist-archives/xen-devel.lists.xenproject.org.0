Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2C170329
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:52:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yvj-0003o7-S9; Wed, 26 Feb 2020 15:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XWk4=4O=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6yvi-0003o2-Q9
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:48:58 +0000
X-Inumbo-ID: 7feddb90-58af-11ea-aba8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7feddb90-58af-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582732138;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/oO0oxjLD4Jf8C5b/rIm3IMwXePoCjMz65ofYpJCCvw=;
 b=VQR8qjvYoldyF7a0J/AboFUcY1NrqHNMccKCc+UUb5Y7JkztXgTq4VHV
 KxSWsv6DTtxvkSR2dx/1OJOtSiXLU+H5tLb5HpPJVqsHt0yqWzzeW4LNd
 vOX1G1kkgJ2OMABtT7ILJIaYn58V74GCzab3aFjTAtsInRDkJ+4uv7VCu Y=;
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
IronPort-SDR: AfwsOdtciMlR/pEwyTO3sF4OXKCcyleMk2GEkqXNSACDfPNHGAXP7ZEF0wLOA7VqwtyFrTiROE
 DgljEkdMgnXlksW/Ix0Tco7vkU5iZSvpahiXeDYH3t1v1XlZh6aIPMHr1VM1xRADAaPLtt3QMR
 OkxWIH0Uz7fek/5WNGxwuVcmb6m6kjpF53xq5/hBYwmsmr6RlBlbENnJ7TQN/Soubn20Rr9rrk
 FsiaYQ31BkzSlcyt5H4gO3Wkiz/rjPMABAU1AFbUSDZuVVawt6gGVKtpPbD62nZBFsofE4KPXU
 oNQ=
X-SBRS: 2.7
X-MesageID: 13031596
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13031596"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24150.37734.588539.567057@mariner.uk.xensource.com>
Date: Wed, 26 Feb 2020 15:48:54 +0000
To: Jason Andryuk <jandryuk@gmail.com>
In-Reply-To: <20200226152013.12200-2-jandryuk@gmail.com>
References: <20200226152013.12200-1-jandryuk@gmail.com>
 <20200226152013.12200-2-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce
 cmp-fd-file-inode utility
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFzb24gQW5kcnl1ayB3cml0ZXMgKCJbUEFUQ0ggMS8yXSB0b29scy9oZWxwZXJzOiBJbnRyb2R1
Y2UgY21wLWZkLWZpbGUtaW5vZGUgdXRpbGl0eSIpOgo+IFRoaXMgaXMgYSBDIGltcGxlbWVudGF0
aW9uIG9mIHRoZSBwZXJsIGNvZGUgaW5zaWRlIG9mIGxvY2tpbmcuc2ggdG8KPiBjaGVjayB0aGF0
IHRoZSBsb2NrZWQgZmlsZSBkZXNjcmlwdG9yIGFuZCBsb2NrIGZpbGUgc2hhcmUgdGhlIHNhbWUg
aW5vZGUKPiBhbmQgdGhlcmVmb3JlIG1hdGNoLiAgT25lIGNoYW5nZSBmcm9tIHRoZSBwZXJsIHZl
cnNpb24gaXMgcmVwbGFjaW5nCj4gcHJpbnRpbmcgInkiIG9uIHN1Y2Nlc3Mgd2l0aCBleGl0IHZh
bHVlcyBvZiAwIChzaGVsbCBUcnVlKSBhbmQgMSAoc2hlbGwKPiBGYWxzZSkuCgpNYXliZSBpdCB3
b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIHN0YXQoMSkgPyAgT24gTGludXgKICAgc3RhdCAtTCAtYyVE
LiVpIC9kZXYvc3RkaW4gYmxhaC5sb2NrCm9yIHNvbWUgc3VjaCwgYW5kIHRoZW4gY29tcGFyZSB0
aGUgdHdvIG51bWJlcnMuCgpJJ20gcmVsdWN0YW50IHRvIGhvc3QgYSBnZW5lcmFsLXB1cnBvc2Ug
c2hlbGwgdXRpbGl0eSBpbiB4ZW4uZ2l0LCBubwptYXR0ZXIgaG93IHVzZWZ1bC4uLgoKVGhhbmtz
LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
