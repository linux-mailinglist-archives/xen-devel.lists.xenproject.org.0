Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF641B84DE
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 10:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSGTa-0004gg-8T; Sat, 25 Apr 2020 08:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPhZ=6J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jSGTY-0004gb-Mf
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 08:47:52 +0000
X-Inumbo-ID: 7257669a-86d1-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7257669a-86d1-11ea-b4f4-bc764e2007e4;
 Sat, 25 Apr 2020 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587804472;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6eXs67H6WfVRWswCqQZiAo7PiJtJlw0T0C3CIHgs5Do=;
 b=YjuyUhvMGk55crH7BFABiZwJ8zqeS/EOGVN/X4mOZPuvcr8xstRIxqX9
 7ouJ9mGWd4HvTuuGYwHRPygOQqlO/KM9Mi7B6NJnsSUyggY0WM5Swpz8Z
 cVF+vGK0bUOfGSbdNvEGXwIXp3i0wphBJbSci58l9JLHNzLa4+922/qd2 A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /BKjbrL1uODt6x6haPO7zjnfHMU4WKcu1Xpox4umeOeOurQUzMDX18XGkLbrKKkuaF4I/zhPyJ
 tTBko86ehNg22gMduOOn0h9+MZdVfqXIS8rloqlYDOaLGq2BovVkdooXh/SD8f7GiWi6+9d4Ol
 XqjFYH9wvWp6oNSbqJ1v3HwnNNdkLT2xg9aQmpnyC2wtCiGM1TVmiKbeyOqSVWqoEywmUBr/WV
 6v9uc6jQLdKHc9kxSMDFmFD9tD972becXOVWc7sE2ikqSC8pk45yNiW7gmLGds0TNB+q3QS0TC
 AwU=
X-SBRS: 2.7
X-MesageID: 16257269
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,315,1583211600"; d="scan'208";a="16257269"
Date: Sat, 25 Apr 2020 10:47:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [xen-unstable-smoke test] 149805: regressions - FAIL
Message-ID: <20200425084741.GJ28601@Air-de-Roger>
References: <osstest-149805-mainreport@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <osstest-149805-mainreport@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Apr 25, 2020 at 07:49:32AM +0000, osstest service owner wrote:
> flight 149805 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/149805/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 149784

This seems to fail in the qemu-trad clone:

+ /home/osstest/build.149805.build-amd64/xen/tools/../scripts/git-checkout.sh git://cache:9419/git://xenbits.xen.org/qemu-xen-traditional.git 3c659044118e34603161457db9934a34f816d78b qemu-xen-traditional-dir
Cloning into 'qemu-xen-traditional-dir-remote.tmp'...
fatal: reference is not a tree: 3c659044118e34603161457db9934a34f816d78b
Makefile:148: recipe for target 'qemu-xen-traditional-dir-find' failed
make[2]: Leaving directory '/home/osstest/build.149805.build-amd64/xen/tools'
make[2]: *** [qemu-xen-traditional-dir-find] Error 128
/home/osstest/build.149805.build-amd64/xen/tools/../tools/Rules.mk:232: recipe for target 'subdirs-all' failed
make[1]: Leaving directory '/home/osstest/build.149805.build-amd64/xen/tools'
make[1]: *** [subdirs-all] Error 2
Makefile:63: recipe for target 'build-tools' failed
make: *** [build-tools] Error 2

AFAICT qemu-xen-traditional hasn't been updated in 18 months, I think
you updated the revision in the Xen tree but didn't push the patches
to the qemu-xen-trad repo?

Roger.

