Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5389289DF9
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 05:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5272.13799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR5aq-0006Vv-MF; Sat, 10 Oct 2020 03:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5272.13799; Sat, 10 Oct 2020 03:30:48 +0000
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
	id 1kR5aq-0006VW-Iq; Sat, 10 Oct 2020 03:30:48 +0000
Received: by outflank-mailman (input) for mailman id 5272;
 Sat, 10 Oct 2020 03:30:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kR5ap-0006VP-GC
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 03:30:47 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de2b42cb-1db6-4083-8825-8b361d1f7268;
 Sat, 10 Oct 2020 03:30:44 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kR5am-0007Wf-46; Sat, 10 Oct 2020 03:30:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kR5al-000703-Rz; Sat, 10 Oct 2020 03:30:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kR5al-0000h4-RV; Sat, 10 Oct 2020 03:30:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cL7A=DR=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kR5ap-0006VP-GC
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 03:30:47 +0000
X-Inumbo-ID: de2b42cb-1db6-4083-8825-8b361d1f7268
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id de2b42cb-1db6-4083-8825-8b361d1f7268;
	Sat, 10 Oct 2020 03:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=QBil6nd55hbve0YywmbH/EZ30NukHKWxb7pyLskOXzA=; b=eB7OZ7i6t9xwc3vhshau0EtLQE
	jj/eG5hOx1lOIBHeDSrTHqHfwFymFcu1KMtP5ZixZ21g28CtW54uV/6RxftNCN1PyJTwPLvvy76yP
	mRgzjcvkuqJ89WARR4WNnyVxWRUOFeX/oBrREZPvrwx4yNfplMMa6nOrAGf7ak8lr96E=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kR5am-0007Wf-46; Sat, 10 Oct 2020 03:30:44 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kR5al-000703-Rz; Sat, 10 Oct 2020 03:30:43 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kR5al-0000h4-RV; Sat, 10 Oct 2020 03:30:43 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-155622-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [xen-unstable-smoke test] 155622: regressions - FAIL
X-Osstest-Failures:
    xen-unstable-smoke:test-arm64-arm64-xl-xsm:xen-boot:fail:regression
    xen-unstable-smoke:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    xen-unstable-smoke:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
X-Osstest-Versions-This:
    xen=8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
X-Osstest-Versions-That:
    xen=25849c8b16f2a5b7fcd0a823e80a5f1b590291f9
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sat, 10 Oct 2020 03:30:43 +0000

flight 155622 xen-unstable-smoke real [real]
http://logs.test-lab.xenproject.org/osstest/logs/155622/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 155584

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass

version targeted for testing:
 xen                  8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
baseline version:
 xen                  25849c8b16f2a5b7fcd0a823e80a5f1b590291f9

Last test of basis   155584  2020-10-09 02:01:25 Z    1 days
Testing same since   155612  2020-10-09 18:01:22 Z    0 days    3 attempts

------------------------------------------------------------
People who touched revisions under test:
  Andrew Cooper <andrew.cooper3@citrix.com>
  Jan Beulich <jbeulich@suse.com>
  Roger Pau Monné <roger.pau@citrix.com>
  Trammell Hudson <hudson@trmm.net>

jobs:
 build-arm64-xsm                                              pass    
 build-amd64                                                  pass    
 build-armhf                                                  pass    
 build-amd64-libvirt                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-arm64-arm64-xl-xsm                                      fail    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-amd64-libvirt                                     pass    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary


Not pushing.

------------------------------------------------------------
commit 8a62dee9ceff3056c7e0bd9632bac39bee2a51b3
Author: Jan Beulich <jbeulich@suse.com>
Date:   Fri Oct 2 12:30:34 2020 +0200

    x86/vLAPIC: don't leak regs page from vlapic_init() upon error
    
    Fixes: 8a981e0bf25e ("Make map_domain_page_global fail")
    Signed-off-by: Jan Beulich <jbeulich@suse.com>
    Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 8a71d50ed40bfa78c37722dc11995ac2563662c3
Author: Trammell Hudson <hudson@trmm.net>
Date:   Fri Oct 2 07:18:21 2020 -0400

    efi: Enable booting unified hypervisor/kernel/initrd images
    
    This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
    configuration file, the Linux kernel and initrd, as well as the XSM,
    and architectural specific files into a single "unified" EFI executable.
    This allows an administrator to update the components independently
    without requiring rebuilding xen, as well as to replace the components
    in an existing image.
    
    The resulting EFI executable can be invoked directly from the UEFI Boot
    Manager, removing the need to use a separate loader like grub as well
    as removing dependencies on local filesystem access.  And since it is
    a single file, it can be signed and validated by UEFI Secure Boot without
    requring the shim protocol.
    
    It is inspired by systemd-boot's unified kernel technique and borrows the
    function to locate PE sections from systemd's LGPL'ed code.  During EFI
    boot, Xen looks at its own loaded image to locate the PE sections for
    the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
    (`.ramdisk`), and XSM config (`.xsm`), which are included after building
    xen.efi using objcopy to add named sections for each input file.
    
    For x86, the CPU ucode can be included in a section named `.ucode`,
    which is loaded in the efi_arch_cfg_file_late() stage of the boot process.
    
    On ARM systems the Device Tree can be included in a section named
    `.dtb`, which is loaded during the efi_arch_cfg_file_early() stage of
    the boot process.
    
    Note that the system will fall back to loading files from disk if
    the named sections do not exist. This allows distributions to continue
    with the status quo if they want a signed kernel + config, while still
    allowing a user provided initrd (which is how the shim protocol currently
    works as well).
    
    This patch also adds constness to the section parameter of
    efi_arch_cfg_file_early() and efi_arch_cfg_file_late(),
    changes pe_find_section() to use a const CHAR16 section name,
    and adds pe_name_compare() to match section names.
    
    Signed-off-by: Trammell Hudson <hudson@trmm.net>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>
    [Fix ARM build by including pe.init.o]
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

commit 4dced5df761e36fa2561f6f0f6563b3580d95e7f
Author: Trammell Hudson <hudson@trmm.net>
Date:   Fri Oct 2 07:18:20 2020 -0400

    efi/boot.c: add handle_file_info()
    
    Add a separate function to display the address ranges used by
    the files and call `efi_arch_handle_module()` on the modules.
    
    Signed-off-by: Trammell Hudson <hudson@trmm.net>
    Acked-by: Jan Beulich <jbeulich@suse.com>

commit 04be2c3a067899a3860fc2c7bc7a1599502ed1c5
Author: Trammell Hudson <hudson@trmm.net>
Date:   Fri Oct 2 07:18:19 2020 -0400

    efi/boot.c: add file.need_to_free
    
    The config file, kernel, initrd, etc should only be freed if they
    are allocated with the UEFI allocator.  On x86 the ucode, and on
    ARM the dtb, are also marked as need_to_free when allocated or
    expanded.
    
    This also fixes a memory leak in ARM fdt_increase_size() if there
    is an error in building the new device tree.
    
    Signed-off-by: Trammell Hudson <hudson@trmm.net>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

commit afef39241b66df7d5fd66b07dc13350370a4991a
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Apr 1 15:51:08 2020 +0100

    x86/ucode: Trivial further cleanup
    
     * Drop unused include in private.h.
     * Used explicit width integers for Intel header fields.
     * Adjust comment to better describe the extended header.
     * Drop unnecessary __packed attribute for AMD header.
     * Fix types and style.
    
    No functional change.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Roger Pau Monné <roger.pau@citrix.com>

commit 8d255609930bed04c6436974bd895be9a405d0c1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Fri Oct 2 12:20:44 2020 +0100

    x86/hvm: Correct error message in check_segment()
    
    The error message is wrong (given AMD's older interpretation of what a NUL
    segment should contain, attribute wise), and actively unhelpful because you
    only get it in response to a hypercall where the one piece of information you
    cannot provide is the segment selector.
    
    Fix the message to talk about segment attributes, rather than the selector.
    
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Acked-by: Jan Beulich <jbeulich@suse.com>
(qemu changes not included)

