Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1902100AED
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:57:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWlFc-0002QD-JB; Mon, 18 Nov 2019 17:55:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWEU=ZK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iWlFb-0002Q8-0l
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:55:47 +0000
X-Inumbo-ID: a525fe82-0a2c-11ea-a2dd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a525fe82-0a2c-11ea-a2dd-12813bfff9fa;
 Mon, 18 Nov 2019 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574099745;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DJgg8FScgllkTEyYlxuTRr4U647fstF3/X9irBjPqqE=;
 b=f0TNS90AgCB4r+a76joM66a1eZVMS2O5LG/+V0kMv0fi53rdmsgNwdLd
 lze4712oXqVcVqMMKw9ACJcrexHHVuxqXCFxpgdTZj4iXvNbP18V4111M
 LI2u7WjLCc/aeacIVh5zfg8xM+Hj6icBlOfnYM3XfCswVELYGpcUHSf+F E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mVfhFwc7VYYzB2upjd4V9vVRGPdpU+BTSTRVj1JmhOsrho/tIogBUFh1ZjIdpMj9ofqYYzOdem
 fPl3mDefiEN+8p2ZgBpks/6DvvfwYnWXXjyZJ8ZWK/5E135D+sZStmnpe+mB81qn4CVldnD96M
 izeTv5xBvb84queYWcC30+5ZGadSVSIArEXg/pFwmHFjZ2XoHuTgCGloQ1JhD4obq9Zbox6KSQ
 b/7ULVrqgcYkfH+14IUeOgPpoHYIJu+bPr11E47IKX29SbzfloMs4rWLOw6wWpxgyh//Zmi1Fg
 A8k=
X-SBRS: 2.7
X-MesageID: 9016158
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,321,1569297600"; 
   d="scan'208";a="9016158"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24018.56094.533062.819238@mariner.uk.xensource.com>
Date: Mon, 18 Nov 2019 17:55:42 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <20191008141024.10885-2-al1img@gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13 v1 1/2] libxl: introduce new
 backend type VINPUT
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Juergen Gross <jgross@suse.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxIDEvMl0gbGlieGw6IGludHJvZHVj
ZSBuZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+IEZyb206IE9sZWtzYW5kciBHcnl0c292IDxv
bGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPiAKPiBUaGVyZSBhcmUgdHdvIGtpbmQgb2YgVktC
RCBkZXZpY2VzOiB3aXRoIFFFTVUgYmFja2VuZCBhbmQgdXNlciBzcGFjZQo+IGJhY2tlbmQuIElu
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdGhleSBjYW4ndCBiZSBkaXN0aW5ndWlzaGVkIGFzIGJv
dGggdXNlCj4gVktCRCBiYWNrZW5kIHR5cGUuIEFzIHJlc3VsdCwgdXNlciBzcGFjZSBLQkQgYmFj
a2VuZCBpcyBzdGFydGVkIGFuZAo+IHN0b3BwZWQgYXMgUUVNVSBiYWNrZW5kLiBUaGlzIGNvbW1p
dCBhZGRzIG5ldyBkZXZpY2Uga2luZCBWSU5QVVQgdG8gYmUKPiB1c2VkIGFzIGJhY2tlbmQgdHlw
ZSBmb3IgdXNlciBzcGFjZSBLQkQgYmFja2VuZC4KClRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCBh
bmQgdGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb25zLgoKQWNrZWQtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSSB3YXNuJ3QgYWJsZSB0byBmaW5kIGEgcG9z
dGluZyBvZiB0aGlzIHBhdGNoIGJlZm9yZSB0aGUgbGFzdCBwb3N0aW5nCmRhdGUgZm9yIDQuMTMg
b2YgdGhlIDEzdGggb2YgU2VwdGVtYmVyLiAgSGF2ZSBJIG1pc3NlZCBpdCA/ICBXZSBtaWdodApi
ZSBhYmxlIHRvIGp1c3RpZnkgYSBmcmVlemUgZXhjZXB0aW9uIG9uIHRoZSBncm91bmRzIHRoYXQg
dGhpcyBjaGFuZ2UKYWZmZWN0cyBvbmx5IHZrYiB1c2VycyBidXQgaXQgd291bGQgYmUgYSBtYXR0
ZXIgZm9yIHRoZSBSTSAoQ0MnZCkuCgoKSSB3b3VsZCBsaWtlIHRvIGNoYW5nZSB0aGUgImxpbnV4
IiB0byAicHYiIG9yIHNvbWV0aGluZyBlbHNlLCBmb3IKNC4xMywgYXQgbGVhc3QuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
