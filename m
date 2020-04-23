Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BD1B5A76
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 13:26:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZyX-0007Yd-0o; Thu, 23 Apr 2020 11:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGxR=6H=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jRZyU-0007YY-UT
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 11:24:58 +0000
X-Inumbo-ID: 101263cc-8555-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 101263cc-8555-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587641098;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=NcSlRmhEtNPJsVumN0BS4HA0FXFdXy5NSM+oQL7ceoU=;
 b=bG/1J/sWfz1tiNrqTRLxSeM1lbqS5VF+aAlZxMiuk/TaLvyhonXrQHfv
 Tr2+nrQoUyGaOXA2lmiqu6tKocfr5smcYdz/s7LY6fWCZGqh77b1IdNON
 BlT+vXGAJ1aw8OeMCmtrNawRLYAR5jBZ+F/vJdr4Lk1NpSsgL1e17aqwk c=;
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
IronPort-SDR: i0z/cqKoOLoUJarHtJRFLh0+8g9catMGzeCXBrOgcxu7axjAEzQSxe6PVFYQwR9hZl11lVGiie
 iz+xo8tNwk7AKUL4D+M9Cy87gzCgc+aXUjvhS/j2UwttEfhJwO6+gmvk/MBW5OAztO4JfQYszd
 4O5D8uFEQYMVzwz8su+w1Tv3XBOXiAW+/YOv52nM6AUF24DpcsMFV6aU1VFSQj80Lyf7bhntF0
 AodQ6IJ7lKnE5jypcCzc7BMYTrr5gjC54wPEXoM2cDBfoVLtL+XseuHh325ujB42wILlFW3Sxt
 jRM=
X-SBRS: 2.7
X-MesageID: 16522751
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208,217";a="16522751"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24225.31493.220592.722565@mariner.uk.xensource.com>
Date: Thu, 23 Apr 2020 12:24:53 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Golang Xen packages and the golang packaging  system
In-Reply-To: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Golang Xen packages and the golang packaging  system"):
> So currently, our build system will install the xenlight package into $PREFIX/share/gocode/src/golang.xenproject.org/xenlight.  However, it actually takes a bit of wrestling to get golang to use this location, and makes it difficult to use shared code.  It would be nice if people could simply add `golang.xenproject.org/xenlight` to their dependencies, and have `go get` just DTRT.
> 
> This basically involves two things:
> 
> 1. Creating a publicly-accessible suitable git repo containing the golang package(s)
> 
> 2. Causing `curl golang.xenproject.org/$PKGNAME` to return some HTML with the following rune:
> 
> <meta name="go-import" content=“golang.xenproject.org git $URL”>
> 
> Where $URL points to the tree from #1.
> 
> We should probably also have some more human-friendly content in case someone wanders there with a web browser.
> 
> “Suitable git tree” means:
> - That it contains just the bindings.  
...
> So what we’d need to do is have a process / hook somewhere which would, on push to xenbits.xenproject.org/xen.git ’s master branch:
>  - Generate the bindings from the source code
>  - Copy these bindings into the git repo, replacing the old bindings entirely (i.e., deleting files which don’t exist any more, adding new files)
>  - Running ‘git commit’, probably with information about the commit from which this code has been generated
>  - Check to see if there is a new RELEASE-X.Y.Z tag and generate an appropriate tag
>  - Push to the git repo in step #1 above

This is quite unpleasant.  In particular, it makes a git tree out of
output files.  What will we do when someone sends us patches to the
bindings ?

Can we not instead provide some metadata at the top level of xen.git
which tells golang how to run enough of our build system to build the
needed .go files ?

Ian.

