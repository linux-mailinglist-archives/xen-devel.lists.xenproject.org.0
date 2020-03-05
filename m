Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280F217A440
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:29:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oem-00019j-TM; Thu, 05 Mar 2020 11:27:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ek+B=4W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j9oem-00019d-5B
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:27:12 +0000
X-Inumbo-ID: 4168e8b2-5ed4-11ea-a56d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4168e8b2-5ed4-11ea-a56d-12813bfff9fa;
 Thu, 05 Mar 2020 11:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583407632;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=erFfjKVj52JU8eI9OAQxhYac1cjpVgd46EvcV/tbRXo=;
 b=iiwaVvsAXgezZdwHpajlXuJJ1o2n4xf72EcoqWP1UNIN8AVklZbyt9Z7
 MEpemMFG3s5rnTTuS7+pxnaXQ/7cqI7hOwosZJN+OKPk9aZ10VeHhthzV
 4vDnBgz98l7zlyhMc3/XER9/wpJpEG358v3T06k6MKrGIRt8LPyl1ZMUN g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g15oKeurBlAA3otosgOWzBQTO5alLCfNQNGRtKJXKRiujyuLGKUDkp7q5gY7Q0BjIj7D+mwt6S
 Uqc82cJTYk0qj3kuk8qUienl4ZowuZzRVM6KvucEp38tTRr9YKoMciqoGbDcLWS1w9BYSWDbID
 MUdk+LL2/h7xW+S0tHC6izQ2vVIKiEityPEokOSQzwXmL6bclizSaR8L+Woxfi9chx/RCPyr8p
 PB3QQ4U7EUqTuvfMbQ4YGfrXS5lW6roKiLxH78FGQABSXM3NA4g1MbYHOVWhWiIRy7+REA98HK
 FA0=
X-SBRS: 2.7
X-MesageID: 13462538
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,517,1574139600"; d="scan'208";a="13462538"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24160.57868.547389.991174@mariner.uk.xensource.com>
Date: Thu, 5 Mar 2020 11:27:08 +0000
To: Dario Faggioli <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
In-Reply-To: <24160.57771.145327.230573@mariner.uk.xensource.com>
References: <E1j9RHW-0007Ya-1K@osstest.test-lab.xenproject.org>
 <ae66ce58d2548deaab15d1f430e2aa7a41448ce1.camel@suse.com>
 <24160.57771.145327.230573@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-xl-credit2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtsaW51eC1saW51cyBiaXNlY3Rp
b25dIGNvbXBsZXRlIHRlc3QtYW1kNjQtYW1kNjQteGwtY3JlZGl0MiIpOgo+IEhlcmUgaXMgaXRz
IGNvbnNvbGUgbG9nOgo+IAo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncy8xNDgwNTMvdGVzdC1hbWQ2NC1hbWQ2NC14bC1jcmVkaXQyL2NoYXJkb25uYXkx
LS0tdmFyLWxvZy14ZW4tY29uc29sZS1ndWVzdC1kZWJpYW4uZ3Vlc3Qub3NzdGVzdC5sb2cxCgpJ
IG1lYW4KCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8x
NDgwNTMvdGVzdC1hbWQ2NC1hbWQ2NC14bC1jcmVkaXQyL2NoYXJkb25uYXkxLS0tdmFyLWxvZy14
ZW4tY29uc29sZS1ndWVzdC1kZWJpYW4uZ3Vlc3Qub3NzdGVzdC5sb2cKClNvcnJ5IGZvciB0aGUg
bWlzcGFzdGUuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
