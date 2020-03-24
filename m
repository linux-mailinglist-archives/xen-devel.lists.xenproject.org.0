Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E35191749
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 18:15:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGn5F-0007bu-L9; Tue, 24 Mar 2020 17:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pAsU=5J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jGn5D-0007bp-Vf
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 17:11:20 +0000
X-Inumbo-ID: 79e57052-6df2-11ea-8483-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e57052-6df2-11ea-8483-12813bfff9fa;
 Tue, 24 Mar 2020 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585069878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KeFRMcQaGZHKlODr9xUaxcB6A1NZ6/Gkgrn252nUthc=;
 b=AShKUq21xvPQZdmo1P0Vdl9SXkTzg6k1nxjc5r7T/ZB8qWJLojEV9hGw
 /MKRraWcFZVN5B98cA3u0tBGhMig4P6dmlKw8E1xdOQqsl0N9po3kTCXH
 V6o8dAGNbm46yzufPFQPuJeHDXoUfCCOoHHHRSS58HNxaFWGfZV/gipgl I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dNnK9/aZRJiMm4oMzKtIfKpz9R5lZv8kdgtuqrqn8MpMynm+I+6yQtvfwjadE5euX39jBBmGmu
 +VVXaYsHHr7k3UIOUs35I1u1b1jrC+ypUMYEYpXJ7/QZ0lSyUtxmeQn1NJeyyoQ5WT+/HIy0Ul
 agA9qnuDLtmYKsSGaOhoR96yrON8KP3oCnfc1A294OrSy8qFJeSS570fRWVodHuVtUXVFBDOO/
 fLE16LXvZ6RqbwAo5VBeC5P3X0J4gUtMpzBxvsY9DBG4E1RUAyBZEGiRbZy82OyJ87pWL7EaxG
 hpk=
X-SBRS: 2.7
X-MesageID: 14966104
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,301,1580792400"; d="scan'208";a="14966104"
Date: Tue, 24 Mar 2020 17:11:11 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200324171038.GO4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
 <20200227110504.GN24458@Air-de-Roger.citrite.net>
 <20200317180524.GA4088@perard.uk.xensource.com>
 <20200319162412.GH4088@perard.uk.xensource.com>
 <20200323151153.GD24458@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200323151153.GD24458@Air-de-Roger.citrite.net>
Subject: Re: [Xen-devel] [XEN PATCH v3 15/23] xen/build: have the root
 Makefile generates the CFLAGS
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 23, 2020 at 04:11:53PM +0100, Roger Pau Monné wrote:
> On Thu, Mar 19, 2020 at 04:24:12PM +0000, Anthony PERARD wrote:
> > So, testing for the -Wa,--strip-local-absolute flags turns out to be
> > more complicated than I though it would be.
> >  - cc-option-add doesn't work because it doesn't test with the current list
> >    of CFLAGS. And if I add the CFLAGS, clang says the option is unused,
> >    it doesn't matter if -no-integrated-as is present or not.
> 
> Oh, that seems like completely bogus clang behavior. It's my
> understanding (from reading the manual) that whatever gets appended to
> -Wa,<arg> is just passed to the assembler, in which case the compiler
> has no idea whether it's used by it or not.
> 
> Which version of clang did you use to test it?

Probably 9.0.1, I don't think I've upgraded since my tests.

-- 
Anthony PERARD

