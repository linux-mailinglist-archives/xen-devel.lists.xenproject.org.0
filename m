Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206991F7B85
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 18:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjmN7-00014Y-0G; Fri, 12 Jun 2020 16:17:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjmN5-00014T-Al
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 16:17:35 +0000
X-Inumbo-ID: 39378760-acc8-11ea-b5ee-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39378760-acc8-11ea-b5ee-12813bfff9fa;
 Fri, 12 Jun 2020 16:17:34 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0ptANPNdamrB2YqqU3B9qUCxi2hPq/pKSD1d4fb7k5D24/x1cEw516lweQnGA2sRHVLymi8Vza
 JQMGRk4o5cjnzUr+gHOx5ulfWEEfoTw/p0Pw1mRD7DvujqqAZzrcT8hnWwuUQM5jdWZKyoTQ9F
 lUkQfUpsL/ybS3xgzVoI4BQHRMZo+dpbhB5tvUUql/UXd8iWDW0PQ2ZHsgSyPePQDo+zVKMPio
 TJ4iz6fJvvYfTYX3F4cWKCICJh4lXURy3ZsusLbGyBBLmuRGJBREzXDavQ3HWl45VK+we8uk20
 14o=
X-SBRS: 2.7
X-MesageID: 20267819
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20267819"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.43673.301735.439410@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 17:17:29 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.10 breakage with buster (was Re: [xen-4.10-testing test]
 151033: regressions - trouble: blocked/fail/pass/starved)
In-Reply-To: <osstest-151033-mainreport@xen.org>
References: <osstest-151033-mainreport@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

osstest service owner writes ("[xen-4.10-testing test] 151033: regressions - trouble: blocked/fail/pass/starved"):
> flight 151033 xen-4.10-testing real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/151033/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64-libvirt           6 libvirt-build            fail REGR. vs. 150039
>  build-armhf-libvirt           6 libvirt-build            fail REGR. vs. 150039
>  build-i386-libvirt            6 libvirt-build            fail REGR. vs. 150039
>  build-amd64-libvirt           6 libvirt-build            fail REGR. vs. 150039

  ../../../gnulib/lib/fseeko.c: In function 'rpl_fseeko':
  ../../../gnulib/lib/fseeko.c:110:4: error: #error "Please port gnulib fseeko.c to your platform! Look at the code in fseeko.c, then report this to bug-gnulib."
     #error "Please port gnulib fseeko.c to your platform! Look at the code in fseeko.c, then report this to bug-gnulib."
      ^~~~~
  make[3]: *** [Makefile:2473: fseeko.lo] Error 1

http://logs.test-lab.xenproject.org/osstest/logs/151033/build-amd64-libvirt/6.ts-libvirt-build.log

In principle maybe we could fix this by generating a private libvirt
branch with the build fixes ?  Or maybe we should simply try plucking
a new version of libvirt ?  We could update the pinned version in Xen
4.10 to the one from 4.11 ?  We might have to do the same for 4.9
then.

>  test-amd64-amd64-xl-qcow2    10 debian-di-install        fail REGR. vs. 150039
>  test-amd64-amd64-pygrub      10 debian-di-install        fail REGR. vs. 150039
>  test-amd64-i386-xl-raw       10 debian-di-install        fail REGR. vs. 150039

  domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ... 
  domainbuilder: detail: XZ: Saw data stream end
  domainbuilder: detail: _xc_try_lzma_decode: XZ decompress OK, 0x4cd8f0 -> 0x1a7779c
  domainbuilder: detail: loader probe OK
  ...
  domainbuilder: detail: xc_dom_alloc_segment:   module0      : 0xffffffff82c00000 -> 0xffffffff82c02000  (pfn 0x2c00 + 0x2 pages)
  xc: error: panic: xc_dom_core.c:387: xc_dom_do_gunzip: inflate failed (rc=-5): Internal error
  libxl: error: libxl_dom.c:744:libxl__build_dom: xc_dom_build_image failed: No such file or directory

http://logs.test-lab.xenproject.org/osstest/logs/151033/test-amd64-amd64-pygrub/10.ts-debian-di-install.log

????  Anyone have any ideas ?  I would have guessed that this was an
incompatibility between pygrub and the boot config made by the new
pygrub but
   git-log origin/staging-4.10..origin/stable-4.11 tools/pygrub/
suggests not.


As an alternative to trying to fix these, I could arrange for Xen 4.10
and earlier to use stretch rather than buster.  4.10 is end of
security support in December and probably stretch will not break too
badly for us before then.

Ian.

