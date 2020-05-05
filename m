Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623581C5A0F
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:51:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyum-0006FI-Ql; Tue, 05 May 2020 14:51:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOzX=6T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jVyul-0006FD-Oq
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:51:19 +0000
X-Inumbo-ID: dfc4f380-8edf-11ea-9dc5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfc4f380-8edf-11ea-9dc5-12813bfff9fa;
 Tue, 05 May 2020 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588690277;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=TrJXnP9oN7aALC3qD7BVGxz5pYfWGDjBdXPiEkjL7fQ=;
 b=AHCmDevP4bDTLCQ6YGlwfpnaIWrHl6KYYy97J15ce4uQxmIth+SfOrem
 /k4aDeHsrSP9kn32HbEUiTjiwlDiUXeAtxirPf2mF6rUrnPlT7CJghypc
 hUGZ/Q6tFTX4wHyOts1QhzDw/t+L32plxdcsE9FEwX54EJlcIIm9v32rC Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O6GxdFOmOXxi7XSVicIvQDxDU840K6m9A/opAn05pGoAMq6iGWE4DLfw1mUPTi0eLgNJ5RA3Vk
 DseqLCYYGvHVrg8QWXAhYjMEnNXv4Wbu8Bj3x8WvonhoxnvlR9RRSDoe1saU4mtKmYaPop8a91
 gLiyGF371fFvBprXz1M0JT6+XfD54S0kkBkhK+zYGrNfiiVAwNfQAdY64SmxAvwo7Hj7PsPcZg
 pja1ikEaCDptRFeeivkPJTY8q5EUTrQlNpGJfKtoql636pbFeqBUFiuHOcREwnmFEkjjcZUIz/
 LHs=
X-SBRS: 2.7
X-MesageID: 17168958
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17168958"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24241.32091.790503.338211@mariner.uk.xensource.com>
Date: Tue, 5 May 2020 15:51:07 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: Backports to 4.13
In-Reply-To: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
References: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Backports to 4.13"):
> On the tools side of things, f50a4f6e244c aafae0e800e9 2a62c22715bf
> d79cc6bc2bac 0729830cc425 are all bugs in CPUID and/or migration.  "Fix
> HVM_PARAM_PAE_ENABLED handling" is only for 4.13, whereas all the others
> are back to 4.7 (technically speaking).

Done.

There seem to have been quite few requests, but there were a lot of
fixes tagged with Backport or Fixes.  I have now applied these (not
just to 4.13 but to all the supported trees so back to 4.10, as
applicable; plus one non-security bugfix I considered important enough
to go to the security-supported 4.9).

Ian.

