Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54F2625F3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 05:44:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFr1U-0007hb-F7; Wed, 09 Sep 2020 03:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLKP=CS=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kFr1S-0007hW-9o
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 03:43:50 +0000
X-Inumbo-ID: 8b1eabe6-5ec1-484c-9612-e575a71cae87
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b1eabe6-5ec1-484c-9612-e575a71cae87;
 Wed, 09 Sep 2020 03:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=wynrh4ejSnUmACYWvokbEFARkFauzfwdDtWYi7w0jlU=; b=elJFUjIgnX48c1XXopfN0I2tNR
 R4ThuW/CErrljyYZrsLyTt4BG5rsDbcDWimNjbWoEWOl8EbDjzS8SIkhfgYGilSXxQkolYpirieiG
 YKkgUE80F2CPVQhVWPbZQnQRPA3s9yLBwMQb9QpBi32nvL1PM7vDU3GDN1QdSCA5LPFk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFr1P-0003yd-Ap; Wed, 09 Sep 2020 03:43:47 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kFr1P-0007HS-3f; Wed, 09 Sep 2020 03:43:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kFr1P-00011M-3B; Wed, 09 Sep 2020 03:43:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-unstable bisection] complete test-xtf-amd64-amd64-1
Message-Id: <E1kFr1P-00011M-3B@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Wed, 09 Sep 2020 03:43:47 +0000
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-unstable
xenbranch xen-unstable
job test-xtf-amd64-amd64-1
testid leak-check/check

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ad0fd291c5e79191c2e3c70e43dded569f11a450
  Bug not present: a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153986/


  commit ad0fd291c5e79191c2e3c70e43dded569f11a450
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Aug 11 16:05:06 2020 +0100
  
      x86/pv: Rewrite segment context switching from scratch
      
      There are multiple bugs with the existing implementation.
      
      On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
      segment base, which is a problem for 64bit code which typically expects to use
      a NUL %fs/%gs selector.
      
      On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
      selector which faults, the fixup logic loads NUL, and the guest is entered at
      the failsafe callback with the stale base.
      
      Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
      32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
      with a stale base.
      
      Both of these corner cases manifest as state corruption in the final vcpu.
      However, damage is limited to to 64bit code expecting to use Thread Local
      Storage with a base pointer of 0, which doesn't occur by default.
      
      The context switch logic is extremely complicated, and is attempting to
      optimise away loading a NUL selector (which is fast), or writing a 64bit base
      of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
      userspace, which manifests as userspace state corruption as far as Linux is
      concerned.
      
      Always restore all selector and base state, in all cases.
      
      Leave a large comment explaining hardware behaviour, and the new ABI
      expectations.  Update the comments in the public headers.
      
      Drop all "segment preloading" to handle the AMD corner case.  It was never
      anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
      bases are unconditionally written for 64bit PV guests.  In load_segments(),
      store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
      and not used in a way which impacts speculative safety.
      
      Reported-by: Andy Lutomirski <luto@kernel.org>
      Reported-by: Sarah Newman <srn@prgmr.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-xtf-amd64-amd64-1.leak-check--check.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-1.leak-check--check --summary-out=tmp/153995.bisection-summary --basis-template=152877 --blessings=real,real-bisect --flight=153995 xen-unstable test-xtf-amd64-amd64-1 leak-check/check
Searching for failure / basis pass:
 153957 fail [host=rimava1] / 153882 [host=godello0] 153845 [host=elbling0] 153813 [host=chardonnay1] 153788 [host=huxelrebe1] 153770 [host=elbling1] 153758 [host=fiano1] 153653 [host=albana0] 153619 [host=chardonnay0] 153602 [host=elbling0] 153591 [host=albana1] 153551 [host=chardonnay1] 153526 [host=huxelrebe1] 153494 [host=godello0] 153468 [host=huxelrebe0] 153437 [host=godello1] 153400 [host=fiano1] 153363 [host=pinot1] 153321 [host=albana1] 153280 [host=albana0] 153109 [host=fiano0] 153065 \
 [host=pinot0] 153028 [host=elbling1] 153004 ok.
Failure / basis pass flights: 153957 / 153004
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://xenbits.xen.org/qemu-xen.git#ea6d3cd1ed79d824e605a70c3626bc4\
 37c386260-ea6d3cd1ed79d824e605a70c3626bc437c386260 git://xenbits.xen.org/xen.git#d400dc5729e4e132d61c2e7df57d81aaed762044-b11910082d90bb1597f6679524eb726a33306672 git://xenbits.xen.org/xtf.git#17d372b763cb0b2e2e6b5a637c11f3997d2533fa-17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Loaded 5001 nodes in revision graph
Searching for test results:
 152985 []
 153004 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153028 [host=elbling1]
 153065 [host=pinot0]
 153109 [host=fiano0]
 153280 [host=albana0]
 153321 [host=albana1]
 153363 [host=pinot1]
 153400 [host=fiano1]
 153437 [host=godello1]
 153468 [host=huxelrebe0]
 153494 [host=godello0]
 153526 [host=huxelrebe1]
 153551 [host=chardonnay1]
 153591 [host=albana1]
 153602 [host=elbling0]
 153619 [host=chardonnay0]
 153653 [host=albana0]
 153758 [host=fiano1]
 153770 [host=elbling1]
 153788 [host=huxelrebe1]
 153813 [host=chardonnay1]
 153845 [host=elbling0]
 153882 [host=godello0]
 153906 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153931 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153955 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153958 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153960 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 2c8fabb2232d34d6d20a9ce6989e2e6cbee07d52 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153965 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 e52716154da04967f9b9d7cf9a1655ea4bcd9e93 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153967 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153969 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 1be24cd17741192d1e18f24e6cf92f0ae9324e62 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153972 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 ad0fd291c5e79191c2e3c70e43dded569f11a450 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153976 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153979 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 ad0fd291c5e79191c2e3c70e43dded569f11a450 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153957 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 b11910082d90bb1597f6679524eb726a33306672 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153982 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 153986 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 ad0fd291c5e79191c2e3c70e43dded569f11a450 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Searching for interesting versions
 Result found: flight 153004 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55eb0e1fe640) HASH(0x55eb0dc6bf48) HASH(0x55eb0e1db288) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05\
 e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 e52716154da04967f9b9d7cf9a1655ea4bcd9e93 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55eb0e1da688) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 2c8fabb2232d34d6d20a9ce6989e2e6cbee07d52 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55eb0e1f\
 6178) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 d400dc5729e4e132d61c2e7df57d81aaed762044 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x55eb0e1e4378) HASH(0x55eb0e1d6c78) Result found: flight 153906 (fail), for basis failure (at ancestor ~257)
 Repro found: flight 153955 (pass), for basis pass
 Repro found: flight 153957 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ea6d3cd1ed79d824e605a70c3626bc437c386260 a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
No revisions left to test, checking graph state.
 Result found: flight 153967 (pass), for last pass
 Result found: flight 153972 (fail), for first failure
 Repro found: flight 153976 (pass), for last pass
 Repro found: flight 153979 (fail), for first failure
 Repro found: flight 153982 (pass), for last pass
 Repro found: flight 153986 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  ad0fd291c5e79191c2e3c70e43dded569f11a450
  Bug not present: a5eaac9245f4f382a3cd0e9710e9d1cba7db20e4
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/153986/


  commit ad0fd291c5e79191c2e3c70e43dded569f11a450
  Author: Andrew Cooper <andrew.cooper3@citrix.com>
  Date:   Tue Aug 11 16:05:06 2020 +0100
  
      x86/pv: Rewrite segment context switching from scratch
      
      There are multiple bugs with the existing implementation.
      
      On AMD CPUs prior to Zen2, loading a NUL segment selector doesn't clear the
      segment base, which is a problem for 64bit code which typically expects to use
      a NUL %fs/%gs selector.
      
      On a context switch from any PV vcpu, to a 64bit PV vcpu with an %fs/%gs
      selector which faults, the fixup logic loads NUL, and the guest is entered at
      the failsafe callback with the stale base.
      
      Alternatively, a PV context switch sequence of 64 (NUL, non-zero base) =>
      32 (NUL) => 64 (NUL, zero base) will similarly cause Xen to enter the guest
      with a stale base.
      
      Both of these corner cases manifest as state corruption in the final vcpu.
      However, damage is limited to to 64bit code expecting to use Thread Local
      Storage with a base pointer of 0, which doesn't occur by default.
      
      The context switch logic is extremely complicated, and is attempting to
      optimise away loading a NUL selector (which is fast), or writing a 64bit base
      of 0 (which is rare).  Furthermore, it fails to respect Linux's ABI with
      userspace, which manifests as userspace state corruption as far as Linux is
      concerned.
      
      Always restore all selector and base state, in all cases.
      
      Leave a large comment explaining hardware behaviour, and the new ABI
      expectations.  Update the comments in the public headers.
      
      Drop all "segment preloading" to handle the AMD corner case.  It was never
      anything but a waste of time for %ds/%es, and isn't needed now that %fs/%gs
      bases are unconditionally written for 64bit PV guests.  In load_segments(),
      store the result of is_pv_32bit_vcpu() as it is an expensive predicate now,
      and not used in a way which impacts speculative safety.
      
      Reported-by: Andy Lutomirski <luto@kernel.org>
      Reported-by: Sarah Newman <srn@prgmr.com>
      Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
      Reviewed-by: Jan Beulich <jbeulich@suse.com>

Revision graph left in /home/logs/results/bisect/xen-unstable/test-xtf-amd64-amd64-1.leak-check--check.{dot,ps,png,html,svg}.
No revision to test.

