Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BC28F5FE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7507.19634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5M3-0004cX-Lf; Thu, 15 Oct 2020 15:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7507.19634; Thu, 15 Oct 2020 15:39:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5M3-0004c7-HO; Thu, 15 Oct 2020 15:39:47 +0000
Received: by outflank-mailman (input) for mailman id 7507;
 Thu, 15 Oct 2020 15:39:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT5M1-0004c2-OW
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:39:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb0f99f8-a78a-4c64-8be7-f0808dc7d3ef;
 Thu, 15 Oct 2020 15:39:43 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT5M1-0004c2-OW
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:39:45 +0000
X-Inumbo-ID: eb0f99f8-a78a-4c64-8be7-f0808dc7d3ef
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb0f99f8-a78a-4c64-8be7-f0808dc7d3ef;
	Thu, 15 Oct 2020 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602776384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3t2AkRnvDXjMkreXCytT8+QZNU+r1mf6kfh8YJb7X30=;
  b=LYjl2wlolBBvhIvD4UvI+0S6fuOD2bobyICQgT6ErLNzoqvwx6y0cJgv
   crhmryhUyVE8avOnY+JGGBgxhKUigpYMQg7MDGrM5jL8psawAK6xk+jw3
   PveJR8Q915sjEQ3mDTTCP/KaIAsbrQHjaB8usrjtbkqXW2pE5pN2EsnjE
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r4ZRRl8ye/Gofoo68jYCOU4cj6UhnZYJVCFwpuSzcx5TVHXscHypqr0tsrMERfbwM7XTcEAenv
 cceWHYo+0cYrGKAO+9Zq678jLk24DFD6PIzneeHNiGdT7cN2X7oVTngcT7oK+1hJB3mJiJXH+o
 CmF7aLfoXWijJDjcAc+BCGdd7y95yT4ew5MnHM/2Rm7huOVzo76Ls+bA7b0J5+9voEKBgvzJwt
 PFyC/TYhi3AGuIW3EJe96fpIzADAkKmyHgpVaFFl6GMifQWWXDa/G58ifHfdlhLlJ1wANr4k6+
 9Eo=
X-SBRS: 2.5
X-MesageID: 29095576
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="29095576"
Date: Thu, 15 Oct 2020 17:39:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <iwj@xenproject.org>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [linux-linus test] 155829: regressions - FAIL
Message-ID: <20201015153928.GG68032@Air-de-Roger>
References: <osstest-155829-mainreport@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <osstest-155829-mainreport@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Thu, Oct 15, 2020 at 03:24:34PM +0000, osstest service owner wrote:
> flight 155829 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/155829/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-i386-xl-qemuu-ws16-amd64  7 xen-install       fail REGR. vs. 152332
>  test-amd64-i386-qemut-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
>  test-amd64-i386-xl-qemut-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
>  test-amd64-i386-xl-xsm        7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 7 xen-install fail REGR. vs. 152332
>  test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow 7 xen-install fail REGR. vs. 152332
>  test-amd64-i386-qemuu-rhel6hvm-intel  7 xen-install      fail REGR. vs. 152332
>  test-amd64-i386-examine       6 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
>  test-amd64-i386-libvirt       7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-pair         10 xen-install/src_host     fail REGR. vs. 152332
>  test-amd64-i386-pair         11 xen-install/dst_host     fail REGR. vs. 152332
>  test-amd64-i386-qemut-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
>  test-amd64-coresched-i386-xl  7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install        fail REGR. vs. 152332
>  test-amd64-i386-xl-qemuu-debianhvm-amd64  7 xen-install  fail REGR. vs. 152332
>  test-amd64-i386-xl            7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-libvirt-xsm   7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-xl-qemut-ws16-amd64  7 xen-install       fail REGR. vs. 152332
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
>  test-amd64-i386-xl-pvshim     7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-xl-raw        7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm 7 xen-install fail REGR. vs. 152332
>  test-amd64-i386-freebsd10-amd64  7 xen-install           fail REGR. vs. 152332
>  test-amd64-i386-freebsd10-i386  7 xen-install            fail REGR. vs. 152332
>  test-amd64-i386-xl-qemuu-win7-amd64  7 xen-install       fail REGR. vs. 152332
>  test-amd64-i386-xl-shadow     7 xen-install              fail REGR. vs. 152332
>  test-amd64-i386-xl-qemut-win7-amd64  7 xen-install       fail REGR. vs. 152332
>  test-amd64-i386-xl-qemuu-ovmf-amd64  7 xen-install       fail REGR. vs. 152332
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 7 xen-install fail REGR. vs. 152332
>  test-amd64-i386-libvirt-pair 10 xen-install/src_host     fail REGR. vs. 152332
>  test-amd64-i386-libvirt-pair 11 xen-install/dst_host     fail REGR. vs. 152332

All the above is likely fallout from the removal of i386 PV support?

I'm not sure how to deal with this, should the jobs be gated on the
kernel version under test? Would that cause issues to osstest, as
different Linux kernel hashes would generate different test
matrices?

Roger.

