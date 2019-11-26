Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3CB10A229
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:32:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdij-0005aO-GN; Tue, 26 Nov 2019 16:29:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtMf=ZS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZdii-0005aJ-2T
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:29:44 +0000
X-Inumbo-ID: f35251bc-1069-11ea-a55d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f35251bc-1069-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574785783;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=aWfhMTERlZmPhJ9Q50opbK9JnERfQgPrkjuuuNKDRPw=;
 b=D5bO+h9d/44o0uDkKSEYch/9v+6y5D4jOW8WuNGsl4qRRDE6aCcfkejs
 VP2hyPy6gcxFgDl/bRvbWUKh9KlFu7KKHcRF/eHwbuXB3F2wud3oQzT/j
 Elxq7qPQvGhAEOTAFwAr/OodJnb2HGJ3H/3OQTlNqmO8wjsLZt0Kj8OYE A=;
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
IronPort-SDR: tlLghyzArX6nxdAoYdvRIc27JNbkBcD3UtsYJI22w9bxfaos5L2+Apd04CCH1E2onQnDRBjB/P
 fzXOYFtMXxFBC/KNRgXtVIXYAgaiuqBb5E/20rtUFtMvNkenEEwaiEoY1V318YSVzbxXtQ1KCi
 1jNQ3ce48l8mX2kPk48YB+TLaZUWE2PA1Nmi6Tj8ygAgylH8I3bPFQEQeAYc8mEkMxKborqVge
 VXa3v0cAtNYADhT5oY46Lc9JbTLAUUvhRmo2NswRsKko5kEsYtUJGl1Lgi/vTSxSbkzUi9402q
 iug=
X-SBRS: 2.7
X-MesageID: 9218471
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9218471"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24029.21235.895281.730480@mariner.uk.xensource.com>
Date: Tue, 26 Nov 2019 16:29:39 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20191126154920.2950420-1-george.dunlap@citrix.com>
References: <20191126154920.2950420-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] docs/xl: Document
 pci-assignable state
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTMgdjJdIGRvY3MveGw6IERvY3Vt
ZW50IHBjaS1hc3NpZ25hYmxlIHN0YXRlIik6Cj4gQ2hhbmdlc2V0cyAzMTlmOWEwYmE5ICgicGFz
c3Rocm91Z2g6IHF1YXJhbnRpbmUgUENJIGRldmljZXMiKSBhbmQKPiBiYTJhYjAwYmJiICgiSU9N
TVU6IGRlZmF1bHQgdG8gYWx3YXlzIHF1YXJhbnRpbmluZyBQQ0kgZGV2aWNlcyIpCj4gaW50cm9k
dWNlZCBQQ0kgZGV2aWNlICJxdWFyYW50aW5lIiBiZWhhdmlvciwgYnV0IGRpZCBub3QgZG9jdW1l
bnQgaG93Cj4gdGhlIHBjaS1hc3NpZ25hYmxlLWFkZCBhbmQgLXJlbW92ZSBmdW5jdGlvbnMgYWN0
IGluIHJlZ2FyZCB0byB0aGlzLgo+IFJlY3RpZnkgdGhpcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQWNrZWQtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
