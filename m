Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35B151F34
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:20:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz1p0-0003en-Pe; Tue, 04 Feb 2020 17:17:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iz1oz-0003ei-4j
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:17:09 +0000
X-Inumbo-ID: 2c1da58e-4772-11ea-b211-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c1da58e-4772-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580836628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/RPoxZfXd/ynRmngYsKb2/NB5O7Ucz6K4B2Dt/b70CU=;
 b=hdkBy+BCoknH0gi6iD/w2YKI/0OEXnjHd7qiED2lwDcAQUCPF4jp8ZBr
 p7Z4Tt3EqYBRRlgDhzS58Uu8kfsn85ddhYhiIx+M0nzUcSEY43M51U9d1
 knyZ/W3GCcKNB05pm6BrT41ORwHEq6NCvAsgHMqFp9ry982wDtL84JToq 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rX45Zod8MsdUqaM5pPmT5iSV49GZcDRYtjKtwDOh2pS2KMCHobdH+YrnftPLXj6MgSusJOjFTl
 VzGZ4UIjr5tg8kBFrDdwJtVofdUyiZELw8tLhgGWDNflbmVwr0EANkBg9Sixyq0X0kxNoVBaou
 YpjNK8MWhsOXN6pvp1j+FApARV7vIm/qVww/aq9kWfMOBpm99o/vE96Kc2218w5keA4FajrPHs
 IKLvzJ2ScvsXlDq4kgSyJENj88xSddc7kyGDeyFS+PyC7JGunjr5Yr/90Rs3bsr+oZJJKdn4CA
 /Ek=
X-SBRS: 2.7
X-MesageID: 12367698
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12367698"
Date: Tue, 4 Feb 2020 18:17:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200204171701.GM4679@Air-de-Roger>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
 <1580830825-18767-2-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580830825-18767-2-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/shim: suspend and resume platform
 time correctly
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDM6NDA6MjRQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gU2ltaWxhcmx5IHRvIFMzLCBwbGF0Zm9ybSB0aW1lIG5lZWRzIHRvIGJlIHNhdmVk
IG9uIGd1ZXN0IHN1c3BlbmQKPiBhbmQgcmVzdG9yZWQgb24gcmVzdW1lIHJlc3BlY3RpdmVseS4g
VGhpcyBzaG91bGQgYWNjb3VudCBmb3IgZXhwZWN0ZWQKPiBqdW1wcyBpbiBQViBjbG9jayBjb3Vu
dGVyIHZhbHVlIGFmdGVyIHJlc3VtZS4gdGltZV9zdXNwZW5kL3Jlc3VtZSgpCj4gYXJlIHNhZmUg
dG8gdXNlIGluIFBWSCBzZXR0aW5nIGFzIGlzIHNpbmNlIGFueSBleGlzdGluZyBvcGVyYXRpb25z
Cj4gd2l0aCBQSVQgdGhhdCB0aGV5IGRvIHdvdWxkIHNpbXBseSBiZSBpZ25vcmVkIHRoZXJlLgoK
VGhlcmUncyBhbHNvIGFuIGF0dGVtcHQgdG8gZmlkZGxlIHdpdGggSFBFVCwgd2hpY2ggSSB0aGlu
ayBpdCdzIGp1c3QgYQpuby1vcC4KCkp1c3QgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSBpdCBtaWdo
dCBiZSBiZXR0ZXIgdG8gcGFzcyBhIG5ldyBwYXJhbWV0ZXIKdG8gdGltZV9yZXN1bWUgaW4gb3Jk
ZXIgdG8gc2lnbmFsIHdoZXRoZXIgUElUL0hQRVQgc2hvdWxkIGV2ZW4gYmUKYXR0ZW1wdGVkIHRv
IGJlIHJlc3VtZWQ/CgpUaGUgcmVzdCBMR1RNLCB0aGFua3MgZm9yIHRyYWNraW5nIHRoaXMgZG93
bi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
