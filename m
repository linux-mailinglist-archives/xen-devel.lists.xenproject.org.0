Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4DD11D3AF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 18:22:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifS6L-0000jR-L9; Thu, 12 Dec 2019 17:18:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uBeP=2C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifS6K-0000jK-GS
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 17:18:08 +0000
X-Inumbo-ID: 5d0dc2d0-1d03-11ea-8dcd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d0dc2d0-1d03-11ea-8dcd-12813bfff9fa;
 Thu, 12 Dec 2019 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576171087;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RSUPf+DkyTVUZrm5WRrSeCk3spv6k4EWZVFPuW1CH6c=;
 b=gfKYc4VxyJZN0EsK6OM8lu5NQj8AuikKVEeaKO/MR/EXsURn6u20HiF6
 8zO7J2n36s4m8dHqIF/fpRbFsi6T/OXI/cqRd/wvSU+H64FBbjEo9z9v1
 tQG0G9tUYhBuT41FCP4rtEIpKrx2oYDuibz9QBNGNwHrXCiGjP4dBwwC9 0=;
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
IronPort-SDR: HeUZwnbLY2ZfoVKqzQ24Mo+hcmjYuWB4PQQTGZO+Cb6GJomps3l4J/XLLF4w2ckcaQMhnDkPBD
 MbcL4TiwLXIf7bhwVAugbM0cF8bRaQ8S9D8RWXHoQRTsmrYYSyymPTEu8Cm+fZkCrlpnqsy38E
 bWkg3EJqKQqv+ZS0/1kezd4OS1eztZr0GUXLDUMgU9TeadxcNPSb3q/KWhdxKignGjgfOURe7L
 XrVwI2jSrScpXvwKjFmGVO1muJGqjXtfzfmIbfZZ3+Ebt7BgtPPMsdmg+yYiMmdPvV4xOeLzND
 qrQ=
X-SBRS: 2.7
X-MesageID: 9595969
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9595969"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24050.30284.331109.130374@mariner.uk.xensource.com>
Date: Thu, 12 Dec 2019 17:18:04 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-144723-mainreport@xen.org>
References: <osstest-144723-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.9-testing test] 144723: regressions -
 trouble: fail/pass/starved
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

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC45LXRlc3RpbmcgdGVzdF0gMTQ0
NzIzOiByZWdyZXNzaW9ucyAtIHRyb3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4gZmxpZ2h0
IDE0NDcyMyB4ZW4tNC45LXRlc3RpbmcgcmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ0NzIzLwo+IAo+IFJlZ3Jlc3Npb25zIDot
KAo+IAo+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICB0ZXN0LWFtZDY0LWkzODYt
eGwtcWVtdXQtd2luNy1hbWQ2NCAxNSBndWVzdC1zYXZlcmVzdG9yZS4yIGZhaWwgUkVHUi4gdnMu
IDE0NDU0NQo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXdzMTYtYW1kNjQgMTYgZ3Vlc3Qt
bG9jYWxtaWdyYXRlL3gxMCBmYWlsIFJFR1IuIHZzLiAxNDQ1NDUKClRoZXNlIHRlc3RzIGhhdmUg
YmVlbiBmbGFreSBmb3IgYSBsb25nIHRpbWUuICBHaXZlbiB0aGUgNC4xMyByZWxlYXNlCnNob3Vs
ZCBnZXQgcHJpb3JpdHkgSSBwcm9wb3NlIHRvIGZvcmNlIHB1c2ggdGhpcyByYXRoZXIgdGhhbiB3
YWl0aW5nCmZvciB0aGUgcmV0ZXN0IHRvIGNvbXBsZXRlLiAgSSB3aWxsIHRoZW4ga2lsbCB0aGUg
cmV0ZXN0IGZsaWdodCwgc2luY2UKc3RhYmxlLTQuOSB3aWxsIHRoZW4gYmUgPT0gc3RhZ2luZy00
LjkuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
