Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB643C2510
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 15:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153675.283897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1qeb-0002IG-Lx; Fri, 09 Jul 2021 13:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153675.283897; Fri, 09 Jul 2021 13:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1qeb-0002GG-Hw; Fri, 09 Jul 2021 13:34:53 +0000
Received: by outflank-mailman (input) for mailman id 153675;
 Fri, 09 Jul 2021 13:34:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1qea-0002G6-Kl; Fri, 09 Jul 2021 13:34:52 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1qea-0001Cy-D2; Fri, 09 Jul 2021 13:34:52 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1m1qea-0005Ob-5z; Fri, 09 Jul 2021 13:34:52 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1m1qea-00015D-5W; Fri, 09 Jul 2021 13:34:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
	bh=hDlwfYBNUCLS2BY7TvKLueCZFNlErswVXsJEjKWfUZg=; b=V8IUylnNpWPEWVdVaZd4qdZPH+
	RFkjmDZfuayeJ64K2PaXPzkrzs2U8J/cGgoWDRm5mSPlRBs3vzEkLrRu/wuHjlXx1aVbqJt9AtSkW
	zi5euSgnMyN2EC8roE626KWkmCHZdOX6DWKcKU2n9vUolVCkK9fOeDhSaHIa1HBRnMO0=;
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-i386-qemuu-rhel6hvm-amd
Message-Id: <E1m1qea-00015D-5W@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 09 Jul 2021 13:34:52 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-i386-qemuu-rhel6hvm-amd
testid redhat-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  9aef0954195cc592e86846dbbe7f3c2c5603690a
  Bug not present: 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163473/


  commit 9aef0954195cc592e86846dbbe7f3c2c5603690a
  Merge: 9bef7ea9d9 7ca6f2ad37
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Tue Jul 6 11:24:58 2021 +0100
  
      Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging
      
      * More Meson test conversions and configure cleanups
      * Generalize XSAVE area offset so that it matches AMD processors on KVM
      * Improvements for -display and deprecation of -no-quit
      * Enable SMP configuration as a compound machine property ("-M smp.cpus=...")
      * Haiku compilation fix
      * Add icon on Darwin
      
      # gpg: Signature made Tue 06 Jul 2021 08:35:23 BST
      # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
      # gpg:                issuer "pbonzini@redhat.com"
      # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
      # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
      # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
      #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
      
      * remotes/bonzini-gitlab/tags/for-upstream: (40 commits)
        config-host.mak: remove unused compiler-related lines
        Set icon for QEMU binary on Mac OS
        qemu-option: remove now-dead code
        machine: add smp compound property
        vl: switch -M parsing to keyval
        keyval: introduce keyval_parse_into
        keyval: introduce keyval_merge
        qom: export more functions for use with non-UserCreatable objects
        configure: convert compiler tests to meson, part 6
        configure: convert compiler tests to meson, part 5
        configure: convert compiler tests to meson, part 4
        configure: convert compiler tests to meson, part 3
        configure: convert compiler tests to meson, part 2
        configure: convert compiler tests to meson, part 1
        configure: convert HAVE_BROKEN_SIZE_MAX to meson
        configure, meson: move CONFIG_IVSHMEM to meson
        meson: store dependency('threads') in a variable
        meson: sort existing compiler tests
        configure, meson: convert libxml2 detection to meson
        configure, meson: convert liburing detection to meson
        ...
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 7ca6f2ad375d32e81844788dbc2b05a04cc391b5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Jul 6 08:59:01 2021 +0200
  
      config-host.mak: remove unused compiler-related lines
      
      Most of the build is not done via Makefiles, therefore the toolchain
      variables are mostly unused.  They are still used by tests/tcg
      and pc-bios/roms, but most of them are not needed there.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3983a767e3d85008c1fb4b8618ac67bf5aee7527
  Author: John Arbuckle <programmingkidx@gmail.com>
  Date:   Mon Jul 5 15:53:28 2021 -0400
  
      Set icon for QEMU binary on Mac OS
      
      Before switching the build system over to Meson, an icon was
      added to the QEMU binary on Mac OS. This patch adds back that
      feature; it piggybacks on the existing scripts/entitlement.sh,
      which already does in-place changes to the executable on Darwin.
      
      Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
      Message-Id: <20210705195328.36442-1-programmingkidx@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 904806c69bd4e013491550d05f5c2cbdba9a9b38
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Nov 11 09:03:37 2020 -0500
  
      qemu-option: remove now-dead code
      
      -M was the sole user of qemu_opts_set and qemu_opts_set_defaults,
      remove them and the arguments that they used.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 09:03:48 2021 -0400
  
      machine: add smp compound property
      
      Make -smp syntactic sugar for a compound property "-machine
      smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
      setter for the property.
      
      numa-test will now cover the new syntax, while other tests
      still use -smp.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 11:28:34 2021 -0400
  
      vl: switch -M parsing to keyval
      
      Switch from QemuOpts to keyval.  This enables the introduction
      of non-scalar machine properties, and JSON syntax in the future.
      
      For JSON syntax to be supported right now, we would have to
      consider what would happen if string-based dictionaries (produced by
      -M key=val) were to be merged with strongly-typed dictionaries
      (produced by -M {'key': 123}).
      
      The simplest way out is to never enter the situation, and only allow one
      -M option when JSON syntax is in use.  However, we want options such as
      -smp to become syntactic sugar for -M, and this is a problem; as soon
      as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
      together with -smp.  Therefore, allowing JSON syntax right now for -M
      would be a forward-compatibility nightmare and it would be impossible
      anyway to introduce -M incrementally in tools.
      
      Instead, support for JSON syntax is delayed until after the main
      options are converted to QOM compound properties.  These include -boot,
      -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
      syntax is introduced, these options will _also_ be forbidden together
      with -M '{...}'.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c445909e1f3d5722ed26f067bbffed71cbefd711
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Mon Nov 2 07:36:48 2020 -0500
  
      keyval: introduce keyval_parse_into
      
      Allow parsing multiple keyval sequences into the same dictionary.
      This will be used to simplify the parsing of the -M command line
      option, which is currently a .merge_lists = true QemuOpts group.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9176e800dbcb2636a2f24411eafc3c800e3455bd
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Nov 12 08:40:11 2020 -0500
  
      keyval: introduce keyval_merge
      
      This patch introduces a function that merges two keyval-produced
      (or keyval-like) QDicts.  It can be used to emulate the behavior of
      .merge_lists = true QemuOpts groups, merging -readconfig sections and
      command-line options in a single QDict, and also to implement -set.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3bb6944585aa6f28b21265c88d86264e8e9f7e53
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Mon Nov 2 11:08:07 2020 -0500
  
      qom: export more functions for use with non-UserCreatable objects
      
      Machines and accelerators are not user-creatable but they are going
      to share similar command-line parsing machinery.  Export functions
      that will be used with -machine and -accel in softmmu/vl.c.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit d47a8b3b692a06852bd70fd7832bd22adfcb2431
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:02:00 2021 +0200
  
      configure: convert compiler tests to meson, part 6
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit a620fbe9ace71a89bd3d0c57a045b93a772070d5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 13:04:47 2021 +0200
  
      configure: convert compiler tests to meson, part 5
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e1fbd2c4ed8e61a3e0749f592a6d3423ec67980b
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:02:00 2021 +0200
  
      configure: convert compiler tests to meson, part 4
      
      And remove them from the summary, since now their outcome is verbosely
      included in the meson output.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit be7e89f63f97c6e745f906bdafb0a6a0b070e720
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:02:00 2021 +0200
  
      configure: convert compiler tests to meson, part 3
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ed3b3f1764b0deecc2d875ab897e5883ef42a615
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:14:48 2021 +0200
  
      configure: convert compiler tests to meson, part 2
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e66420ac6dc97e5f5afcb25a918cb5e7a5cd63f2
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:10:05 2021 +0200
  
      configure: convert compiler tests to meson, part 1
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e46bd55d9cbb45b4e6681dd91da0fca821e2ed9d
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:57:04 2021 +0200
  
      configure: convert HAVE_BROKEN_SIZE_MAX to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ccd250aa2d8e214195d5cee37c1ddc58e123b821
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:50:17 2021 +0200
  
      configure, meson: move CONFIG_IVSHMEM to meson
      
      This is a duplicate of CONFIG_EVENTFD, handle it directly in meson.build.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6d7c7c2d1d95cc6cdb56706bfa0446ad68e2b952
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 15:01:35 2021 +0200
  
      meson: store dependency('threads') in a variable
      
      It can be useful for has_function checks.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 69d8de7a2d7c3512f6f7762abd8c1c1b9b4044e4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:56:11 2021 +0200
  
      meson: sort existing compiler tests
      
      The next patches will add more compiler tests.  Sort and group the
      existing tests, keeping similar cc.has_* tests together and sorting them
      alphabetically by macro name.  This should make it easier to look for
      examples when adding new tests to meson.build.
      
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c5b36c25c2fe1110cf8646ef02083c71757d6e00
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert libxml2 detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 53c22b68e3ecd1764dfd325baefea6acd0b1dc70
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert liburing detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e36e8c70f6d3ed844f4606f3f019d2ae808f0af1
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert libpmem detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 83ef16821a41e540cec7a282374dcbfc1b2b0851
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert libdaxctl detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 587d59d6ccd0e73bfe5689d9232804339aa09bdf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert virgl detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c23d7b4e570ce7e63042a60f0747595f515c6822
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert vte detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f08b65b651bca2eac543de694f866049e48fb242
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Jun 15 17:18:42 2021 +0200
  
      configure: drop vte-2.90 check
      
      All currently supported distros have vte 0.37 or newer, which is where the
      ABI changed from 2.90 to 2.91.  So drop support for the older ABI.
      
      Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 48e5c98a38920e088a00e43cf12a4881fceeb4cb
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:32 2021 +0100
  
      target/i386: Move X86XSaveArea into TCG
      
      Given that TCG is now the only consumer of X86XSaveArea, move the
      structure definition and associated offset declarations and checks to a
      TCG specific header.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-9-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fea4500841024195ec701713e05b92ebf667f192
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:31 2021 +0100
  
      target/i386: Populate x86_ext_save_areas offsets using cpuid where possible
      
      Rather than relying on the X86XSaveArea structure definition,
      determine the offset of XSAVE state areas using CPUID leaf 0xd where
      possible (KVM and HVF).
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-8-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3568987f78faff90829ea6c885bbdd5b083dc86c
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:30 2021 +0100
  
      target/i386: Observe XSAVE state area offsets
      
      Rather than relying on the X86XSaveArea structure definition directly,
      the routines that manipulate the XSAVE state area should observe the
      offsets declared in the x86_ext_save_areas array.
      
      Currently the offsets declared in the array are derived from the
      structure definition, resulting in no functional change.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-7-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 5aa10ab1a08e4123dee214a2f854909efb07b45b
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:29 2021 +0100
  
      target/i386: Make x86_ext_save_areas visible outside cpu.c
      
      Provide visibility of the x86_ext_save_areas array and associated type
      outside of cpu.c.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-6-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c0198c5f87b6db25712672292e01ab710d6ef631
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:28 2021 +0100
  
      target/i386: Pass buffer and length to XSAVE helper
      
      In preparation for removing assumptions about XSAVE area offsets, pass
      a buffer pointer and buffer length to the XSAVE helper functions.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-5-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fde74821006472f40fee9a094e6da86cd39b5623
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:27 2021 +0100
  
      target/i386: Clarify the padding requirements of X86XSaveArea
      
      Replace the hard-coded size of offsets or structure elements with
      defined constants or sizeof().
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-4-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 436463b84b75fad6ff962e45a2220a7d1d17557e
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:26 2021 +0100
  
      target/i386: Consolidate the X86XSaveArea offset checks
      
      Rather than having similar but different checks in cpu.h and kvm.c,
      move them all to cpu.h.
      Message-Id: <20210705104632.2902400-3-david.edmondson@oracle.com>
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ac7b7cae4e8598359a2a7557899904c9563a776a
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:25 2021 +0100
  
      target/i386: Declare constants for XSAVE offsets
      
      Declare and use manifest constants for the XSAVE state component
      offsets.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-2-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit dd52af17ec947332dfe45bd5f098c94c6ec0baa3
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Aug 20 09:15:08 2020 -0400
  
      coverity-scan: switch to vpath build
      
      This is the patch that has been running on the coverity cronjob
      for a few weeks now.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit dff5f68224505926762c9609b7fb120a2adc6aee
  Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
  Date:   Sat Jun 19 11:13:41 2021 +0200
  
      coverity-scan: Remove lm32 / unicore32 targets
      
      lm32 has been removed in commit 9d49bcf6992 ("Drop the deprecated
      lm32 target"), and unicore32 in 4369223902a ("Drop the deprecated
      unicore32 target").
      
      Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
      Message-Id: <20210619091342.3660495-2-f4bug@amsat.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 95f439bd115efacb8593ca26e14303116f7ca988
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:31 2021 +0200
  
      qemu-options: Improve the documentation of the -display options
      
      The sdl and gtk display options support more parameters than currently
      documented. Also the "vnc" option got lost during a recent commit,
      add it again.
      
      Fixes: ddc717581c ("Add display suboptions to man pages")
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-5-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit b6ddc6a2b2b8c32dc2db12d5848eadde10e30136
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:30 2021 +0200
  
      ui: Mark the '-no-quit' option as deprecated
      
      It's just a wrapper around the -display ...,window-close=off parameter,
      and the name "no-quit" is rather confusing compared to "window-close"
      (since there are still other means to quit the emulator), so we should
      rather tell our users to use the "window-close" parameter instead.
      
      While we're at it, update the documentation to state that
      "-no-quit" is available for GTK, too, not only for SDL.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-4-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit bb20b86db9acb7a6f653fd40c45d46a9df6b2a75
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:29 2021 +0200
  
      ui: Fix the "-display sdl,window_close=..." parameter
      
      According to the QAPI schema, there is a "-" and not a "_" between
      "window" and "close", and we're also talking about "window-close"
      in the long parameter description in qemu-options.hx, so we should
      make sure that we rather use the variant with the "-" by default
      instead of only allowing the one with the "_" here. The old way
      still stays enabled for compatibility, but we deprecate it, so that
      we can switch to a QAPIfied parameter one day more easily.
      
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-3-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f6b560bbc1b0120d7737c0efb53f691828d82faa
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:28 2021 +0200
  
      softmmu/vl: Remove obsolete comment about the "frame" parameter
      
      The frame parameter has been removed along with the support for
      SDL 1.2.
      
      Fixes: 09bd7ba9f5 ("Remove deprecated -no-frame option")
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-2-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit bc05439334061f6adc04e4a044d490f961e7e0c3
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Mon Jul 5 10:25:42 2021 +0200
  
      Makefile: Remove /usr/bin/env wrapper from the SHELL variable
      
      The wrapper should not be needed here (it's not the shebang line of
      a shell script), and it is causing trouble on Haiku where "env"
      resides in a different directory.
      
      Reported-by: Richard Zak <richard.j.zak@gmail.com>
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Message-Id: <20210705082542.936856-1-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-i386-qemuu-rhel6hvm-amd.redhat-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-i386-qemuu-rhel6hvm-amd.redhat-install --summary-out=tmp/163473.bisection-summary --basis-template=163321 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-i386-qemuu-rhel6hvm-amd redhat-install
Searching for failure / basis pass:
 163444 fail [host=pinot1] / 163321 ok.
Failure / basis pass flights: 163444 / 163321
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#c410ad4da4b7785170d3d42a3ba190c2caac6feb-c410ad4da4b7785170d3d42a3ba190c2caac6feb git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9-9aef0954195cc592e86846dbbe7f3c2c5603690a git://xenbits.xen.org/osstest/seabios.git#54082c81d96028ba8c76fbe6784085cf1df76b20-54082c81d96028ba8c76fbe6784085cf1df76b20 git://xenbits.xen.org/xen.git#74d044d51b19bb697eac5c3deafa140f6afafec8-4473f3601098a2c3cf5ab89d5a29504772985e3a
From git://cache:9419/git://git.qemu.org/qemu
   9db3065c62..53c0123118  master     -> origin/master
   53c0123118..05de778b5b  staging    -> origin/staging
From git://cache:9419/git://xenbits.xen.org/xen
   6de3e5fce5..cf4aa8dfb2  staging    -> origin/staging
Loaded 15005 nodes in revision graph
Searching for test results:
 163321 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163327 fail irrelevant
 163369 fail irrelevant
 163420 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163457 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 74d044d51b19bb697eac5c3deafa140f6afafec8
 163444 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163459 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163462 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 d468f9522174114ab06239894b6079c0a487e408
 163463 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 33e48312cf28f6fb78c03b14514fa7718de97ef5
 163465 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 09e2cd69956fe529bfc3d53dae477b44eff217d1
 163467 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163469 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163470 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163471 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163472 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
 163473 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9aef0954195cc592e86846dbbe7f3c2c5603690a 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
Searching for interesting versions
 Result found: flight 163321 (pass), for basis pass
 Result found: flight 163420 (fail), for basis failure
 Repro found: flight 163457 (pass), for basis pass
 Repro found: flight 163459 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 c410ad4da4b7785170d3d42a3ba190c2caac6feb 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9 54082c81d96028ba8c76fbe6784085cf1df76b20 4473f3601098a2c3cf5ab89d5a29504772985e3a
No revisions left to test, checking graph state.
 Result found: flight 163467 (pass), for last pass
 Result found: flight 163469 (fail), for first failure
 Repro found: flight 163470 (pass), for last pass
 Repro found: flight 163471 (fail), for first failure
 Repro found: flight 163472 (pass), for last pass
 Repro found: flight 163473 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  9aef0954195cc592e86846dbbe7f3c2c5603690a
  Bug not present: 9bef7ea9d93ee6b6297a5be6cb5a557f7d1764c9
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/163473/


  commit 9aef0954195cc592e86846dbbe7f3c2c5603690a
  Merge: 9bef7ea9d9 7ca6f2ad37
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Tue Jul 6 11:24:58 2021 +0100
  
      Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging
      
      * More Meson test conversions and configure cleanups
      * Generalize XSAVE area offset so that it matches AMD processors on KVM
      * Improvements for -display and deprecation of -no-quit
      * Enable SMP configuration as a compound machine property ("-M smp.cpus=...")
      * Haiku compilation fix
      * Add icon on Darwin
      
      # gpg: Signature made Tue 06 Jul 2021 08:35:23 BST
      # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
      # gpg:                issuer "pbonzini@redhat.com"
      # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
      # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
      # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
      #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
      
      * remotes/bonzini-gitlab/tags/for-upstream: (40 commits)
        config-host.mak: remove unused compiler-related lines
        Set icon for QEMU binary on Mac OS
        qemu-option: remove now-dead code
        machine: add smp compound property
        vl: switch -M parsing to keyval
        keyval: introduce keyval_parse_into
        keyval: introduce keyval_merge
        qom: export more functions for use with non-UserCreatable objects
        configure: convert compiler tests to meson, part 6
        configure: convert compiler tests to meson, part 5
        configure: convert compiler tests to meson, part 4
        configure: convert compiler tests to meson, part 3
        configure: convert compiler tests to meson, part 2
        configure: convert compiler tests to meson, part 1
        configure: convert HAVE_BROKEN_SIZE_MAX to meson
        configure, meson: move CONFIG_IVSHMEM to meson
        meson: store dependency('threads') in a variable
        meson: sort existing compiler tests
        configure, meson: convert libxml2 detection to meson
        configure, meson: convert liburing detection to meson
        ...
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 7ca6f2ad375d32e81844788dbc2b05a04cc391b5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Jul 6 08:59:01 2021 +0200
  
      config-host.mak: remove unused compiler-related lines
      
      Most of the build is not done via Makefiles, therefore the toolchain
      variables are mostly unused.  They are still used by tests/tcg
      and pc-bios/roms, but most of them are not needed there.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3983a767e3d85008c1fb4b8618ac67bf5aee7527
  Author: John Arbuckle <programmingkidx@gmail.com>
  Date:   Mon Jul 5 15:53:28 2021 -0400
  
      Set icon for QEMU binary on Mac OS
      
      Before switching the build system over to Meson, an icon was
      added to the QEMU binary on Mac OS. This patch adds back that
      feature; it piggybacks on the existing scripts/entitlement.sh,
      which already does in-place changes to the executable on Darwin.
      
      Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
      Message-Id: <20210705195328.36442-1-programmingkidx@gmail.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 904806c69bd4e013491550d05f5c2cbdba9a9b38
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Nov 11 09:03:37 2020 -0500
  
      qemu-option: remove now-dead code
      
      -M was the sole user of qemu_opts_set and qemu_opts_set_defaults,
      remove them and the arguments that they used.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 09:03:48 2021 -0400
  
      machine: add smp compound property
      
      Make -smp syntactic sugar for a compound property "-machine
      smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
      setter for the property.
      
      numa-test will now cover the new syntax, while other tests
      still use -smp.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit d8fb7d0969d5c32b3d1b9e20b63ec6c0abe80be4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 11:28:34 2021 -0400
  
      vl: switch -M parsing to keyval
      
      Switch from QemuOpts to keyval.  This enables the introduction
      of non-scalar machine properties, and JSON syntax in the future.
      
      For JSON syntax to be supported right now, we would have to
      consider what would happen if string-based dictionaries (produced by
      -M key=val) were to be merged with strongly-typed dictionaries
      (produced by -M {'key': 123}).
      
      The simplest way out is to never enter the situation, and only allow one
      -M option when JSON syntax is in use.  However, we want options such as
      -smp to become syntactic sugar for -M, and this is a problem; as soon
      as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
      together with -smp.  Therefore, allowing JSON syntax right now for -M
      would be a forward-compatibility nightmare and it would be impossible
      anyway to introduce -M incrementally in tools.
      
      Instead, support for JSON syntax is delayed until after the main
      options are converted to QOM compound properties.  These include -boot,
      -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
      syntax is introduced, these options will _also_ be forbidden together
      with -M '{...}'.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c445909e1f3d5722ed26f067bbffed71cbefd711
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Mon Nov 2 07:36:48 2020 -0500
  
      keyval: introduce keyval_parse_into
      
      Allow parsing multiple keyval sequences into the same dictionary.
      This will be used to simplify the parsing of the -M command line
      option, which is currently a .merge_lists = true QemuOpts group.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9176e800dbcb2636a2f24411eafc3c800e3455bd
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Nov 12 08:40:11 2020 -0500
  
      keyval: introduce keyval_merge
      
      This patch introduces a function that merges two keyval-produced
      (or keyval-like) QDicts.  It can be used to emulate the behavior of
      .merge_lists = true QemuOpts groups, merging -readconfig sections and
      command-line options in a single QDict, and also to implement -set.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3bb6944585aa6f28b21265c88d86264e8e9f7e53
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Mon Nov 2 11:08:07 2020 -0500
  
      qom: export more functions for use with non-UserCreatable objects
      
      Machines and accelerators are not user-creatable but they are going
      to share similar command-line parsing machinery.  Export functions
      that will be used with -machine and -accel in softmmu/vl.c.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit d47a8b3b692a06852bd70fd7832bd22adfcb2431
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:02:00 2021 +0200
  
      configure: convert compiler tests to meson, part 6
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit a620fbe9ace71a89bd3d0c57a045b93a772070d5
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 13:04:47 2021 +0200
  
      configure: convert compiler tests to meson, part 5
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e1fbd2c4ed8e61a3e0749f592a6d3423ec67980b
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:02:00 2021 +0200
  
      configure: convert compiler tests to meson, part 4
      
      And remove them from the summary, since now their outcome is verbosely
      included in the meson output.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit be7e89f63f97c6e745f906bdafb0a6a0b070e720
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:02:00 2021 +0200
  
      configure: convert compiler tests to meson, part 3
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ed3b3f1764b0deecc2d875ab897e5883ef42a615
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:14:48 2021 +0200
  
      configure: convert compiler tests to meson, part 2
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e66420ac6dc97e5f5afcb25a918cb5e7a5cd63f2
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:10:05 2021 +0200
  
      configure: convert compiler tests to meson, part 1
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e46bd55d9cbb45b4e6681dd91da0fca821e2ed9d
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:57:04 2021 +0200
  
      configure: convert HAVE_BROKEN_SIZE_MAX to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ccd250aa2d8e214195d5cee37c1ddc58e123b821
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 12:50:17 2021 +0200
  
      configure, meson: move CONFIG_IVSHMEM to meson
      
      This is a duplicate of CONFIG_EVENTFD, handle it directly in meson.build.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6d7c7c2d1d95cc6cdb56706bfa0446ad68e2b952
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 15:01:35 2021 +0200
  
      meson: store dependency('threads') in a variable
      
      It can be useful for has_function checks.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 69d8de7a2d7c3512f6f7762abd8c1c1b9b4044e4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:56:11 2021 +0200
  
      meson: sort existing compiler tests
      
      The next patches will add more compiler tests.  Sort and group the
      existing tests, keeping similar cc.has_* tests together and sorting them
      alphabetically by macro name.  This should make it easier to look for
      examples when adding new tests to meson.build.
      
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c5b36c25c2fe1110cf8646ef02083c71757d6e00
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert libxml2 detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 53c22b68e3ecd1764dfd325baefea6acd0b1dc70
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert liburing detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e36e8c70f6d3ed844f4606f3f019d2ae808f0af1
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert libpmem detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 83ef16821a41e540cec7a282374dcbfc1b2b0851
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert libdaxctl detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 587d59d6ccd0e73bfe5689d9232804339aa09bdf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert virgl detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c23d7b4e570ce7e63042a60f0747595f515c6822
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jun 3 11:31:35 2021 +0200
  
      configure, meson: convert vte detection to meson
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f08b65b651bca2eac543de694f866049e48fb242
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Jun 15 17:18:42 2021 +0200
  
      configure: drop vte-2.90 check
      
      All currently supported distros have vte 0.37 or newer, which is where the
      ABI changed from 2.90 to 2.91.  So drop support for the older ABI.
      
      Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 48e5c98a38920e088a00e43cf12a4881fceeb4cb
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:32 2021 +0100
  
      target/i386: Move X86XSaveArea into TCG
      
      Given that TCG is now the only consumer of X86XSaveArea, move the
      structure definition and associated offset declarations and checks to a
      TCG specific header.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-9-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fea4500841024195ec701713e05b92ebf667f192
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:31 2021 +0100
  
      target/i386: Populate x86_ext_save_areas offsets using cpuid where possible
      
      Rather than relying on the X86XSaveArea structure definition,
      determine the offset of XSAVE state areas using CPUID leaf 0xd where
      possible (KVM and HVF).
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-8-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3568987f78faff90829ea6c885bbdd5b083dc86c
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:30 2021 +0100
  
      target/i386: Observe XSAVE state area offsets
      
      Rather than relying on the X86XSaveArea structure definition directly,
      the routines that manipulate the XSAVE state area should observe the
      offsets declared in the x86_ext_save_areas array.
      
      Currently the offsets declared in the array are derived from the
      structure definition, resulting in no functional change.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-7-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 5aa10ab1a08e4123dee214a2f854909efb07b45b
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:29 2021 +0100
  
      target/i386: Make x86_ext_save_areas visible outside cpu.c
      
      Provide visibility of the x86_ext_save_areas array and associated type
      outside of cpu.c.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-6-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c0198c5f87b6db25712672292e01ab710d6ef631
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:28 2021 +0100
  
      target/i386: Pass buffer and length to XSAVE helper
      
      In preparation for removing assumptions about XSAVE area offsets, pass
      a buffer pointer and buffer length to the XSAVE helper functions.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-5-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit fde74821006472f40fee9a094e6da86cd39b5623
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:27 2021 +0100
  
      target/i386: Clarify the padding requirements of X86XSaveArea
      
      Replace the hard-coded size of offsets or structure elements with
      defined constants or sizeof().
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-4-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 436463b84b75fad6ff962e45a2220a7d1d17557e
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:26 2021 +0100
  
      target/i386: Consolidate the X86XSaveArea offset checks
      
      Rather than having similar but different checks in cpu.h and kvm.c,
      move them all to cpu.h.
      Message-Id: <20210705104632.2902400-3-david.edmondson@oracle.com>
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ac7b7cae4e8598359a2a7557899904c9563a776a
  Author: David Edmondson <david.edmondson@oracle.com>
  Date:   Mon Jul 5 11:46:25 2021 +0100
  
      target/i386: Declare constants for XSAVE offsets
      
      Declare and use manifest constants for the XSAVE state component
      offsets.
      
      Signed-off-by: David Edmondson <david.edmondson@oracle.com>
      Message-Id: <20210705104632.2902400-2-david.edmondson@oracle.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit dd52af17ec947332dfe45bd5f098c94c6ec0baa3
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Aug 20 09:15:08 2020 -0400
  
      coverity-scan: switch to vpath build
      
      This is the patch that has been running on the coverity cronjob
      for a few weeks now.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit dff5f68224505926762c9609b7fb120a2adc6aee
  Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
  Date:   Sat Jun 19 11:13:41 2021 +0200
  
      coverity-scan: Remove lm32 / unicore32 targets
      
      lm32 has been removed in commit 9d49bcf6992 ("Drop the deprecated
      lm32 target"), and unicore32 in 4369223902a ("Drop the deprecated
      unicore32 target").
      
      Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
      Message-Id: <20210619091342.3660495-2-f4bug@amsat.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 95f439bd115efacb8593ca26e14303116f7ca988
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:31 2021 +0200
  
      qemu-options: Improve the documentation of the -display options
      
      The sdl and gtk display options support more parameters than currently
      documented. Also the "vnc" option got lost during a recent commit,
      add it again.
      
      Fixes: ddc717581c ("Add display suboptions to man pages")
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-5-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit b6ddc6a2b2b8c32dc2db12d5848eadde10e30136
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:30 2021 +0200
  
      ui: Mark the '-no-quit' option as deprecated
      
      It's just a wrapper around the -display ...,window-close=off parameter,
      and the name "no-quit" is rather confusing compared to "window-close"
      (since there are still other means to quit the emulator), so we should
      rather tell our users to use the "window-close" parameter instead.
      
      While we're at it, update the documentation to state that
      "-no-quit" is available for GTK, too, not only for SDL.
      
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-4-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit bb20b86db9acb7a6f653fd40c45d46a9df6b2a75
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:29 2021 +0200
  
      ui: Fix the "-display sdl,window_close=..." parameter
      
      According to the QAPI schema, there is a "-" and not a "_" between
      "window" and "close", and we're also talking about "window-close"
      in the long parameter description in qemu-options.hx, so we should
      make sure that we rather use the variant with the "-" by default
      instead of only allowing the one with the "_" here. The old way
      still stays enabled for compatibility, but we deprecate it, so that
      we can switch to a QAPIfied parameter one day more easily.
      
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-3-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f6b560bbc1b0120d7737c0efb53f691828d82faa
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Wed Jun 30 18:32:28 2021 +0200
  
      softmmu/vl: Remove obsolete comment about the "frame" parameter
      
      The frame parameter has been removed along with the support for
      SDL 1.2.
      
      Fixes: 09bd7ba9f5 ("Remove deprecated -no-frame option")
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Message-Id: <20210630163231.467987-2-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit bc05439334061f6adc04e4a044d490f961e7e0c3
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Mon Jul 5 10:25:42 2021 +0200
  
      Makefile: Remove /usr/bin/env wrapper from the SHELL variable
      
      The wrapper should not be needed here (it's not the shebang line of
      a shell script), and it is causing trouble on Haiku where "env"
      resides in a different directory.
      
      Reported-by: Richard Zak <richard.j.zak@gmail.com>
      Signed-off-by: Thomas Huth <thuth@redhat.com>
      Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
      Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
      Message-Id: <20210705082542.936856-1-thuth@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-i386-qemuu-rhel6hvm-amd.redhat-install.{dot,ps,png,html,svg}.
----------------------------------------
163473: tolerable ALL FAIL

flight 163473 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/163473/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-i386-qemuu-rhel6hvm-amd 12 redhat-install    fail baseline untested


jobs:
 test-amd64-i386-qemuu-rhel6hvm-amd                           fail    


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


