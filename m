Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1A36630BB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 20:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474000.734893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEy57-0001aN-29; Mon, 09 Jan 2023 19:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474000.734893; Mon, 09 Jan 2023 19:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEy56-0001Wy-TS; Mon, 09 Jan 2023 19:45:16 +0000
Received: by outflank-mailman (input) for mailman id 474000;
 Mon, 09 Jan 2023 19:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pEy55-0001Wi-4a; Mon, 09 Jan 2023 19:45:15 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pEy55-0007Pt-1u; Mon, 09 Jan 2023 19:45:15 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1pEy54-0008Cz-MV; Mon, 09 Jan 2023 19:45:14 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1pEy54-0001fP-KT; Mon, 09 Jan 2023 19:45:14 +0000
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
	bh=JHXTgRpQBy4NZyEQ8cTu4SVMpHSqEwL4iBaoQdfDF2Y=; b=ZcLUMgfU6orzzydI8/kX66uwSD
	WAqBdpcWWDjzaOs74ZflTrGD4ZwE9IfLjBzclbQsZfHR+c0Xq0K/hsyQLy2a78PnibUJgzGYmoy1R
	Cso41RB/nqxvee/yO9DTj+W5SKsKJaPJ+yPbDoJ0EUbGdy2ZfZwG5uedlPmwajBTSlmk=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete build-amd64
Message-Id: <E1pEy54-0001fP-KT@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Mon, 09 Jan 2023 19:45:14 +0000

branch xen-unstable
xenbranch xen-unstable
job build-amd64
testid xen-build

Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  3d83b78285d6e96636130f7d449fd02e2d4deee0
  Bug not present: 528d9f33cad5245c1099d77084c78bb2244d5143
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175659/


  commit 3d83b78285d6e96636130f7d449fd02e2d4deee0
  Merge: 528d9f33ca fb418b51b7
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Sun Jan 8 14:27:40 2023 +0000
  
      Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging
      
      * Atomic memslot updates for KVM (Emanuele, David)
      * Always send errors to logfile when daemonized (Greg)
      * Add support for IDE CompactFlash card (Lubomir)
      * First round of build system cleanups (myself)
      * First round of feature removals (myself)
      * Reduce "qemu/accel.h" inclusion (Philippe)
      
      # gpg: Signature made Thu 05 Jan 2023 23:51:09 GMT
      # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
      # gpg:                issuer "pbonzini@redhat.com"
      # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
      # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
      # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
      #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
      
      * tag 'for-upstream' of https://gitlab.com/bonzini/qemu: (24 commits)
        i386: SGX: remove deprecated member of SGXInfo
        target/i386: Add SGX aex-notify and EDECCSSA support
        util: remove support -chardev tty and -chardev parport
        util: remove support for hex numbers with a scaling suffix
        KVM: remove support for kernel-irqchip=off
        docs: do not talk about past removal as happening in the future
        meson: accept relative symlinks in "meson introspect --installed" data
        meson: cleanup compiler detection
        meson: support meson 0.64 -Doptimization=plain
        configure: test all warnings
        tests/qapi-schema: remove Meson workaround
        meson: cleanup dummy-cpus.c rules
        meson: tweak hardening options for Windows
        configure: remove backwards-compatibility and obsolete options
        configure: preserve qemu-ga variables
        configure: cleanup $cpu tests
        configure: remove dead function
        configure: remove useless write_c_skeleton
        ide: Add "ide-cf" driver, a CompactFlash card
        ide: Add 8-bit data mode
        ...
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit fb418b51b7b43c34873f4b9af3da7031b7452115
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 11:02:48 2022 +0100
  
      i386: SGX: remove deprecated member of SGXInfo
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit d45f24fe7525d8a8aaa4ca6d9d214dc41819caa5
  Author: Kai Huang <kai.huang@intel.com>
  Date:   Wed Nov 9 15:48:34 2022 +1300
  
      target/i386: Add SGX aex-notify and EDECCSSA support
      
      The new SGX Asynchronous Exit (AEX) notification mechanism (AEX-notify)
      allows one enclave to receive a notification in the ERESUME after the
      enclave exit due to an AEX.  EDECCSSA is a new SGX user leaf function
      (ENCLU[EDECCSSA]) to facilitate the AEX notification handling.
      
      Whether the hardware supports to create enclave with AEX-notify support
      is enumerated via CPUID.(EAX=0x12,ECX=0x1):EAX[10].  The new EDECCSSA
      user leaf function is enumerated via CPUID.(EAX=0x12,ECX=0x0):EAX[11].
      
      Add support to allow to expose the new SGX AEX-notify feature and the
      new EDECCSSA user leaf function to KVM guest.
      
      Link: https://lore.kernel.org/lkml/166760360549.4906.809756297092548496.tip-bot2@tip-bot2/
      Link: https://lore.kernel.org/lkml/166760360934.4906.2427175408052308969.tip-bot2@tip-bot2/
      Reviewed-by: Yang Zhong <yang.zhong@linux.intel.com>
      Signed-off-by: Kai Huang <kai.huang@intel.com>
      Message-Id: <20221109024834.172705-1-kai.huang@intel.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6f9f630836df355b9ca3f4641e6b7be71f6af076
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 10:56:53 2022 +0100
  
      util: remove support -chardev tty and -chardev parport
      
      These were deprecated in 6.0 and can now be removed.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 8b902e3d2309595567e4957b96e971c4f3ca455e
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 10:50:05 2022 +0100
  
      util: remove support for hex numbers with a scaling suffix
      
      This was deprecated in 6.0 and can now be removed.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit eaaaf8abdc9a9f3493f2cb6a751660dff3f9db57
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 10:39:32 2022 +0100
  
      KVM: remove support for kernel-irqchip=off
      
      -machine kernel-irqchip=off is broken for many guest OSes; kernel-irqchip=split
      is the replacement that works, so remove the deprecated support for the former.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9d3f8b3247795ae8f482700bbbace04b04421d5b
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 11:05:20 2022 +0100
  
      docs: do not talk about past removal as happening in the future
      
      KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
      the sentence describing it.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f32eb0021a85efaca97f69b0e9201737562a8e4f
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Dec 14 13:25:00 2022 +0100
  
      meson: accept relative symlinks in "meson introspect --installed" data
      
      When installing shared libraries, as is the case for libvfio-user.so,
      Meson will include relative symbolic links in the output of
      "meson introspect --installed":
      
        {
          "libvfio-user.so": "/usr/local/lib64/libvfio-user.so",
          ...
        }
      
      In the case of scripts/symlink-install-tree.py, this will
      be a symbolic link to a symbolic link but, in any case, there is
      no issue in creating it.
      
      Cc: qemu-stable@nongnu.org
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e51340243687a2cd7ffcf0d6e2de030bed4b8720
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 14:15:06 2022 +0200
  
      meson: cleanup compiler detection
      
      Detect all compilers at the beginning of meson.build, and store
      the available languages in an array.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6a97f3939240977e66e90862419911666956a76a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Nov 2 13:07:23 2022 +0100
  
      meson: support meson 0.64 -Doptimization=plain
      
      In Meson 0.64, the optimization built-in option now accepts the "plain" value,
      which will not set any optimization flags.  While QEMU does not check the
      contents of the option and therefore does not suffer any ill effect
      from the new value, it uses get_option to print the optimization flags
      in the summary.  Clean the code up to remove duplication, and check for
      -Doptimization=plain at the same time.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ca9b5c2ebf1aca87677a24c208bf3d0345c0b1aa
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 14:21:22 2022 +0200
  
      configure: test all warnings
      
      Some warnings are hardcoded in QEMU_CFLAGS and not tested.  There is
      no particular reason to single out these five, as many more -W flags are
      present on all the supported compilers.  For homogeneity when moving
      the detection to meson, make them use the same warn_flags infrastructure.
      
      Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 7bef93ff064f540e24a36a31263ae3db2d06b3d2
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Dec 14 12:29:11 2022 +0100
  
      tests/qapi-schema: remove Meson workaround
      
      The referenced issue has been fixed since version 0.61, so remove the
      workaround.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9c9b85d705abdcce0b63f9182d8140dd67bd13fb
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jul 22 10:43:00 2021 +0200
  
      meson: cleanup dummy-cpus.c rules
      
      Now that qtest is available on all targets including Windows, dummy-cpus.c
      is included unconditionally in the build.  It also does not need to be
      compiled per-target.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 2d73fa74728dccde5cc29c4e56b4d781e4ead7c4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Nov 2 13:03:51 2022 +0100
  
      meson: tweak hardening options for Windows
      
      meson.build has been enabling ASLR _only_ for debug builds since
      commit d2147e04f95f ("configure: move Windows flags detection to meson",
      2022-05-07); instead it was supposed to disable it for debug builds.
      
      However, the flag has been enabled for DLLs upstream for roughly 2
      years (https://sourceware.org/bugzilla/show_bug.cgi?id=19011), and
      also by some distros including Debian for 6 years even
      (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836365).
      
      Enable it unconditionally; we can fix the reversed logic of commit
      d2147e04f95f later if there are any reports, but for now just
      enable the hardening.
      
      Also add -Wl,--high-entropy-va, which also controls ASLR.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 10229ec3b0ff77c4894cefa312c21e65a761dcde
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Oct 18 10:17:46 2022 +0200
  
      configure: remove backwards-compatibility and obsolete options
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 954ed68f9934a3e08f904acb93ce168505995e95
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 11:35:17 2022 +0200
  
      configure: preserve qemu-ga variables
      
      Ensure that qemu-ga variables set at configure time are kept
      later when the script is rerun.  For preserve_env to work,
      the variables need to be empty so move the default values
      to config-host.mak generation.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f9c77801f4992fae99392ccbb60596dfa1fcf04a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 15:27:03 2022 +0200
  
      configure: cleanup $cpu tests
      
      $cpu is derived from preprocessor defines rather than uname these days,
      so do not bother using isainfo on Solaris.  Likewise do not recognize
      BeOS's uname -m output.
      
      Keep the other, less OS-specific canonicalizations for the benefit
      of people using --cpu.
      
      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 91cd485a6dcbc8210666d19146fe73b8664f0418
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Oct 18 10:17:25 2022 +0200
  
      configure: remove dead function
      
      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c5634e822416e71e00f08f55a521362d8d21264d
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 20 14:20:06 2022 +0200
  
      configure: remove useless write_c_skeleton
      
      This is not needed ever since QEMU stopped detecting -liberty; this
      happened with the Meson switch but it is quite likely that the
      library was not really necessary years before.
      
      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit cec79db38df72ce74d0296b831e90547111bc13c
  Author: Lubomir Rintel <lkundrak@v3.sk>
  Date:   Wed Nov 30 13:03:19 2022 +0100
  
      ide: Add "ide-cf" driver, a CompactFlash card
      
      This allows attaching IDE_CFATA device to an IDE bus. Behaves like a
      CompactFlash card in True IDE mode.
      
      Tested with:
      
        qemu-system-i386 \$
          -device driver=ide-cf,drive=cf,bus=ide.0 \$
          -drive id=cf,index=0,format=raw,if=none,file=cf.img
      
      Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
      Message-Id: <20221130120319.706885-1-lkundrak@v3.sk>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 1ea17d228e582b1cfbf6f61e9da5fafef4063be8
  Author: Lubomir Rintel <lkundrak@v3.sk>
  Date:   Wed Nov 30 13:02:38 2022 +0100
  
      ide: Add 8-bit data mode
      
      CompactFlash uses features 0x01 and 0x81 to enable/disable 8-bit data
      path. Implement them.
      
      Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
      Message-Id: <20221130120238.706717-1-lkundrak@v3.sk>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9b063b7ea697d796914b3651d15c3457b7b1135c
  Author: Greg Kurz <groug@kaod.org>
  Date:   Tue Nov 8 15:00:32 2022 +0100
  
      util/log: Always send errors to logfile when daemonized
      
      When QEMU is started with `-daemonize`, all stdio descriptors get
      redirected to `/dev/null`. This basically means that anything
      printed with error_report() and friends is lost.
      
      Current logging code allows to redirect to a file with `-D` but
      this requires to enable some logging item with `-d` as well to
      be functional.
      
      Relax the check on the log flags when QEMU is daemonized, so that
      other users of stderr can benefit from the redirection, without the
      need to enable unwanted debug logs. Previous behaviour is retained
      for the non-daemonized case. The logic is unrolled as an `if` for
      better readability. The qemu_log_level and log_per_thread globals
      reflect the state we want to transition to at this point : use
      them instead of the intermediary locals for correctness.
      
      qemu_set_log_internal() is adapted to open a per-thread log file
      when '-d tid' is passed. This is done by hijacking qemu_try_lock()
      which seems simpler that refactoring the code.
      
      Signed-off-by: Greg Kurz <groug@kaod.org>
      Message-Id: <20221108140032.1460307-3-groug@kaod.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 59bde2137445b63c822720d069d91d38190c6540
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Nov 8 15:00:31 2022 +0100
  
      util/log: do not close and reopen log files when flags are turned off
      
      log_append makes sure that if you turn off the logging (which clears
      log_flags and makes need_to_open_file false) the old log is not
      overwritten.  The usecase is that if you remove or move the file
      QEMU will not keep writing to the old file.  However, this is
      not always the desited behavior, in particular having log_append==1
      after changing the file name makes little sense.
      
      When qemu_set_log_internal is called from the logfile monitor
      command, filename must be non-NULL and therefore changed_name must
      be true.  Therefore, the only case where the file is closed and
      need_to_open_file == false is indeed when log_flags becomes
      zero.  In this case, just flush the file and do not bother
      closing it, thus faking the same append behavior as previously.
      
      The behavioral change is that changing the logfile twice, for
      example log1 -> log2 -> log1, will cause log1 to be overwritten.
      This can simply be documented, since it is not a particularly
      surprising behavior.
      
      Suggested-by: Alex Bennée <alex.bennee@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      Reviewed-by: Greg Kurz <groug@kaod.org>
      Message-Id: <20221025092119.236224-1-pbonzini@redhat.com>
      [groug: nullify global_file before actually closing the file]
      Signed-off-by: Greg Kurz <groug@kaod.org>
      Message-Id: <20221108140032.1460307-2-groug@kaod.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit cc6ff741123216550997b12cdd991beeed47bd0d
  Author: Philippe Mathieu-Daudé <philmd@linaro.org>
  Date:   Wed Nov 30 14:56:41 2022 +0100
  
      hw: Reduce "qemu/accel.h" inclusion
      
      Move "qemu/accel.h" include from the heavily included
      "hw/boards.h" to hw/core/machine.c, the single file using
      the AccelState definition.
      
      Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
      Reviewed-by: Fabiano Rosas <farosas@suse.de>
      Message-Id: <20221130135641.85328-3-philmd@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3d277871f39d4de42f56b7b0cef5721e525b2d31
  Author: Philippe Mathieu-Daudé <philmd@linaro.org>
  Date:   Wed Nov 30 14:56:40 2022 +0100
  
      typedefs: Forward-declare AccelState
      
      Forward-declare AccelState in "qemu/typedefs.h" so structures
      using a reference of it (like MachineState in "hw/boards.h")
      don't have to include "qemu/accel.h".
      
      Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
      Reviewed-by: Fabiano Rosas <farosas@suse.de>
      Message-Id: <20221130135641.85328-2-philmd@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/build-amd64.xen-build.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/build-amd64.xen-build --summary-out=tmp/175659.bisection-summary --basis-template=175623 --blessings=real,real-bisect,real-retry qemu-mainline build-amd64 xen-build
Searching for failure / basis pass:
 175647 fail [host=himrod0] / 175637 [host=himrod2] 175627 ok.
Failure / basis pass flights: 175647 / 175627
(tree with no url: minios)
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://git.qemu.org/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d6271b657286de80260413684a1f2a63f44ea17b 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
Basis pass d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/osstest/ovmf.git#d8d829b89dababf763ab33b8cdd852b2830db3cf-d8d829b89dababf763ab33b8cdd852b2830db3cf git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c7437ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 git://git.qemu.org/qemu.git#528d9f33cad5245c1099d77084c78bb2244d5143-d6271b657286de80260413684a1f2a63f44ea17b git://xenbits.xen.org/osstest/seabios.git#645a64b4911d7cadf5749d7375544fc2384e70ba-645\
 a64b4911d7cadf5749d7375544fc2384e70ba git://xenbits.xen.org/xen.git#2b21cbbb339fb14414f357a6683b1df74c36fda2-2b21cbbb339fb14414f357a6683b1df74c36fda2
Loaded 5002 nodes in revision graph
Searching for test results:
 175627 pass d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175631 [host=himrod2]
 175640 [host=himrod2]
 175637 [host=himrod2]
 175643 fail d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3d83b78285d6e96636130f7d449fd02e2d4deee0 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175647 fail d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d6271b657286de80260413684a1f2a63f44ea17b 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175652 pass d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175656 fail d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d6271b657286de80260413684a1f2a63f44ea17b 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175657 fail d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3d83b78285d6e96636130f7d449fd02e2d4deee0 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175658 pass d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
 175659 fail d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3d83b78285d6e96636130f7d449fd02e2d4deee0 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
Searching for interesting versions
 Result found: flight 175627 (pass), for basis pass
 Result found: flight 175647 (fail), for basis failure
 Repro found: flight 175652 (pass), for basis pass
 Repro found: flight 175656 (fail), for basis failure
 0 revisions at d8d829b89dababf763ab33b8cdd852b2830db3cf 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 528d9f33cad5245c1099d77084c78bb2244d5143 645a64b4911d7cadf5749d7375544fc2384e70ba 2b21cbbb339fb14414f357a6683b1df74c36fda2
No revisions left to test, checking graph state.
 Result found: flight 175627 (pass), for last pass
 Result found: flight 175643 (fail), for first failure
 Repro found: flight 175652 (pass), for last pass
 Repro found: flight 175657 (fail), for first failure
 Repro found: flight 175658 (pass), for last pass
 Repro found: flight 175659 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu git://git.qemu.org/qemu.git
  Bug introduced:  3d83b78285d6e96636130f7d449fd02e2d4deee0
  Bug not present: 528d9f33cad5245c1099d77084c78bb2244d5143
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/175659/


  commit 3d83b78285d6e96636130f7d449fd02e2d4deee0
  Merge: 528d9f33ca fb418b51b7
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Sun Jan 8 14:27:40 2023 +0000
  
      Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging
      
      * Atomic memslot updates for KVM (Emanuele, David)
      * Always send errors to logfile when daemonized (Greg)
      * Add support for IDE CompactFlash card (Lubomir)
      * First round of build system cleanups (myself)
      * First round of feature removals (myself)
      * Reduce "qemu/accel.h" inclusion (Philippe)
      
      # gpg: Signature made Thu 05 Jan 2023 23:51:09 GMT
      # gpg:                using RSA key F13338574B662389866C7682BFFBD25F78C7AE83
      # gpg:                issuer "pbonzini@redhat.com"
      # gpg: Good signature from "Paolo Bonzini <bonzini@gnu.org>" [full]
      # gpg:                 aka "Paolo Bonzini <pbonzini@redhat.com>" [full]
      # Primary key fingerprint: 46F5 9FBD 57D6 12E7 BFD4  E2F7 7E15 100C CD36 69B1
      #      Subkey fingerprint: F133 3857 4B66 2389 866C  7682 BFFB D25F 78C7 AE83
      
      * tag 'for-upstream' of https://gitlab.com/bonzini/qemu: (24 commits)
        i386: SGX: remove deprecated member of SGXInfo
        target/i386: Add SGX aex-notify and EDECCSSA support
        util: remove support -chardev tty and -chardev parport
        util: remove support for hex numbers with a scaling suffix
        KVM: remove support for kernel-irqchip=off
        docs: do not talk about past removal as happening in the future
        meson: accept relative symlinks in "meson introspect --installed" data
        meson: cleanup compiler detection
        meson: support meson 0.64 -Doptimization=plain
        configure: test all warnings
        tests/qapi-schema: remove Meson workaround
        meson: cleanup dummy-cpus.c rules
        meson: tweak hardening options for Windows
        configure: remove backwards-compatibility and obsolete options
        configure: preserve qemu-ga variables
        configure: cleanup $cpu tests
        configure: remove dead function
        configure: remove useless write_c_skeleton
        ide: Add "ide-cf" driver, a CompactFlash card
        ide: Add 8-bit data mode
        ...
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit fb418b51b7b43c34873f4b9af3da7031b7452115
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 11:02:48 2022 +0100
  
      i386: SGX: remove deprecated member of SGXInfo
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit d45f24fe7525d8a8aaa4ca6d9d214dc41819caa5
  Author: Kai Huang <kai.huang@intel.com>
  Date:   Wed Nov 9 15:48:34 2022 +1300
  
      target/i386: Add SGX aex-notify and EDECCSSA support
      
      The new SGX Asynchronous Exit (AEX) notification mechanism (AEX-notify)
      allows one enclave to receive a notification in the ERESUME after the
      enclave exit due to an AEX.  EDECCSSA is a new SGX user leaf function
      (ENCLU[EDECCSSA]) to facilitate the AEX notification handling.
      
      Whether the hardware supports to create enclave with AEX-notify support
      is enumerated via CPUID.(EAX=0x12,ECX=0x1):EAX[10].  The new EDECCSSA
      user leaf function is enumerated via CPUID.(EAX=0x12,ECX=0x0):EAX[11].
      
      Add support to allow to expose the new SGX AEX-notify feature and the
      new EDECCSSA user leaf function to KVM guest.
      
      Link: https://lore.kernel.org/lkml/166760360549.4906.809756297092548496.tip-bot2@tip-bot2/
      Link: https://lore.kernel.org/lkml/166760360934.4906.2427175408052308969.tip-bot2@tip-bot2/
      Reviewed-by: Yang Zhong <yang.zhong@linux.intel.com>
      Signed-off-by: Kai Huang <kai.huang@intel.com>
      Message-Id: <20221109024834.172705-1-kai.huang@intel.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6f9f630836df355b9ca3f4641e6b7be71f6af076
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 10:56:53 2022 +0100
  
      util: remove support -chardev tty and -chardev parport
      
      These were deprecated in 6.0 and can now be removed.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 8b902e3d2309595567e4957b96e971c4f3ca455e
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 10:50:05 2022 +0100
  
      util: remove support for hex numbers with a scaling suffix
      
      This was deprecated in 6.0 and can now be removed.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit eaaaf8abdc9a9f3493f2cb6a751660dff3f9db57
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 10:39:32 2022 +0100
  
      KVM: remove support for kernel-irqchip=off
      
      -machine kernel-irqchip=off is broken for many guest OSes; kernel-irqchip=split
      is the replacement that works, so remove the deprecated support for the former.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9d3f8b3247795ae8f482700bbbace04b04421d5b
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Fri Dec 16 11:05:20 2022 +0100
  
      docs: do not talk about past removal as happening in the future
      
      KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
      the sentence describing it.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f32eb0021a85efaca97f69b0e9201737562a8e4f
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Dec 14 13:25:00 2022 +0100
  
      meson: accept relative symlinks in "meson introspect --installed" data
      
      When installing shared libraries, as is the case for libvfio-user.so,
      Meson will include relative symbolic links in the output of
      "meson introspect --installed":
      
        {
          "libvfio-user.so": "/usr/local/lib64/libvfio-user.so",
          ...
        }
      
      In the case of scripts/symlink-install-tree.py, this will
      be a symbolic link to a symbolic link but, in any case, there is
      no issue in creating it.
      
      Cc: qemu-stable@nongnu.org
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit e51340243687a2cd7ffcf0d6e2de030bed4b8720
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 14:15:06 2022 +0200
  
      meson: cleanup compiler detection
      
      Detect all compilers at the beginning of meson.build, and store
      the available languages in an array.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 6a97f3939240977e66e90862419911666956a76a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Nov 2 13:07:23 2022 +0100
  
      meson: support meson 0.64 -Doptimization=plain
      
      In Meson 0.64, the optimization built-in option now accepts the "plain" value,
      which will not set any optimization flags.  While QEMU does not check the
      contents of the option and therefore does not suffer any ill effect
      from the new value, it uses get_option to print the optimization flags
      in the summary.  Clean the code up to remove duplication, and check for
      -Doptimization=plain at the same time.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit ca9b5c2ebf1aca87677a24c208bf3d0345c0b1aa
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 14:21:22 2022 +0200
  
      configure: test all warnings
      
      Some warnings are hardcoded in QEMU_CFLAGS and not tested.  There is
      no particular reason to single out these five, as many more -W flags are
      present on all the supported compilers.  For homogeneity when moving
      the detection to meson, make them use the same warn_flags infrastructure.
      
      Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 7bef93ff064f540e24a36a31263ae3db2d06b3d2
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Dec 14 12:29:11 2022 +0100
  
      tests/qapi-schema: remove Meson workaround
      
      The referenced issue has been fixed since version 0.61, so remove the
      workaround.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9c9b85d705abdcce0b63f9182d8140dd67bd13fb
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Jul 22 10:43:00 2021 +0200
  
      meson: cleanup dummy-cpus.c rules
      
      Now that qtest is available on all targets including Windows, dummy-cpus.c
      is included unconditionally in the build.  It also does not need to be
      compiled per-target.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 2d73fa74728dccde5cc29c4e56b4d781e4ead7c4
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Nov 2 13:03:51 2022 +0100
  
      meson: tweak hardening options for Windows
      
      meson.build has been enabling ASLR _only_ for debug builds since
      commit d2147e04f95f ("configure: move Windows flags detection to meson",
      2022-05-07); instead it was supposed to disable it for debug builds.
      
      However, the flag has been enabled for DLLs upstream for roughly 2
      years (https://sourceware.org/bugzilla/show_bug.cgi?id=19011), and
      also by some distros including Debian for 6 years even
      (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=836365).
      
      Enable it unconditionally; we can fix the reversed logic of commit
      d2147e04f95f later if there are any reports, but for now just
      enable the hardening.
      
      Also add -Wl,--high-entropy-va, which also controls ASLR.
      
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 10229ec3b0ff77c4894cefa312c21e65a761dcde
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Oct 18 10:17:46 2022 +0200
  
      configure: remove backwards-compatibility and obsolete options
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 954ed68f9934a3e08f904acb93ce168505995e95
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 11:35:17 2022 +0200
  
      configure: preserve qemu-ga variables
      
      Ensure that qemu-ga variables set at configure time are kept
      later when the script is rerun.  For preserve_env to work,
      the variables need to be empty so move the default values
      to config-host.mak generation.
      
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit f9c77801f4992fae99392ccbb60596dfa1fcf04a
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Wed Oct 12 15:27:03 2022 +0200
  
      configure: cleanup $cpu tests
      
      $cpu is derived from preprocessor defines rather than uname these days,
      so do not bother using isainfo on Solaris.  Likewise do not recognize
      BeOS's uname -m output.
      
      Keep the other, less OS-specific canonicalizations for the benefit
      of people using --cpu.
      
      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 91cd485a6dcbc8210666d19146fe73b8664f0418
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Oct 18 10:17:25 2022 +0200
  
      configure: remove dead function
      
      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit c5634e822416e71e00f08f55a521362d8d21264d
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu Oct 20 14:20:06 2022 +0200
  
      configure: remove useless write_c_skeleton
      
      This is not needed ever since QEMU stopped detecting -liberty; this
      happened with the Meson switch but it is quite likely that the
      library was not really necessary years before.
      
      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit cec79db38df72ce74d0296b831e90547111bc13c
  Author: Lubomir Rintel <lkundrak@v3.sk>
  Date:   Wed Nov 30 13:03:19 2022 +0100
  
      ide: Add "ide-cf" driver, a CompactFlash card
      
      This allows attaching IDE_CFATA device to an IDE bus. Behaves like a
      CompactFlash card in True IDE mode.
      
      Tested with:
      
        qemu-system-i386 \$
          -device driver=ide-cf,drive=cf,bus=ide.0 \$
          -drive id=cf,index=0,format=raw,if=none,file=cf.img
      
      Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
      Message-Id: <20221130120319.706885-1-lkundrak@v3.sk>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 1ea17d228e582b1cfbf6f61e9da5fafef4063be8
  Author: Lubomir Rintel <lkundrak@v3.sk>
  Date:   Wed Nov 30 13:02:38 2022 +0100
  
      ide: Add 8-bit data mode
      
      CompactFlash uses features 0x01 and 0x81 to enable/disable 8-bit data
      path. Implement them.
      
      Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
      Message-Id: <20221130120238.706717-1-lkundrak@v3.sk>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 9b063b7ea697d796914b3651d15c3457b7b1135c
  Author: Greg Kurz <groug@kaod.org>
  Date:   Tue Nov 8 15:00:32 2022 +0100
  
      util/log: Always send errors to logfile when daemonized
      
      When QEMU is started with `-daemonize`, all stdio descriptors get
      redirected to `/dev/null`. This basically means that anything
      printed with error_report() and friends is lost.
      
      Current logging code allows to redirect to a file with `-D` but
      this requires to enable some logging item with `-d` as well to
      be functional.
      
      Relax the check on the log flags when QEMU is daemonized, so that
      other users of stderr can benefit from the redirection, without the
      need to enable unwanted debug logs. Previous behaviour is retained
      for the non-daemonized case. The logic is unrolled as an `if` for
      better readability. The qemu_log_level and log_per_thread globals
      reflect the state we want to transition to at this point : use
      them instead of the intermediary locals for correctness.
      
      qemu_set_log_internal() is adapted to open a per-thread log file
      when '-d tid' is passed. This is done by hijacking qemu_try_lock()
      which seems simpler that refactoring the code.
      
      Signed-off-by: Greg Kurz <groug@kaod.org>
      Message-Id: <20221108140032.1460307-3-groug@kaod.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 59bde2137445b63c822720d069d91d38190c6540
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Tue Nov 8 15:00:31 2022 +0100
  
      util/log: do not close and reopen log files when flags are turned off
      
      log_append makes sure that if you turn off the logging (which clears
      log_flags and makes need_to_open_file false) the old log is not
      overwritten.  The usecase is that if you remove or move the file
      QEMU will not keep writing to the old file.  However, this is
      not always the desited behavior, in particular having log_append==1
      after changing the file name makes little sense.
      
      When qemu_set_log_internal is called from the logfile monitor
      command, filename must be non-NULL and therefore changed_name must
      be true.  Therefore, the only case where the file is closed and
      need_to_open_file == false is indeed when log_flags becomes
      zero.  In this case, just flush the file and do not bother
      closing it, thus faking the same append behavior as previously.
      
      The behavioral change is that changing the logfile twice, for
      example log1 -> log2 -> log1, will cause log1 to be overwritten.
      This can simply be documented, since it is not a particularly
      surprising behavior.
      
      Suggested-by: Alex Bennée <alex.bennee@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
      Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
      Reviewed-by: Greg Kurz <groug@kaod.org>
      Message-Id: <20221025092119.236224-1-pbonzini@redhat.com>
      [groug: nullify global_file before actually closing the file]
      Signed-off-by: Greg Kurz <groug@kaod.org>
      Message-Id: <20221108140032.1460307-2-groug@kaod.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit cc6ff741123216550997b12cdd991beeed47bd0d
  Author: Philippe Mathieu-Daudé <philmd@linaro.org>
  Date:   Wed Nov 30 14:56:41 2022 +0100
  
      hw: Reduce "qemu/accel.h" inclusion
      
      Move "qemu/accel.h" include from the heavily included
      "hw/boards.h" to hw/core/machine.c, the single file using
      the AccelState definition.
      
      Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
      Reviewed-by: Fabiano Rosas <farosas@suse.de>
      Message-Id: <20221130135641.85328-3-philmd@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
  
  commit 3d277871f39d4de42f56b7b0cef5721e525b2d31
  Author: Philippe Mathieu-Daudé <philmd@linaro.org>
  Date:   Wed Nov 30 14:56:40 2022 +0100
  
      typedefs: Forward-declare AccelState
      
      Forward-declare AccelState in "qemu/typedefs.h" so structures
      using a reference of it (like MachineState in "hw/boards.h")
      don't have to include "qemu/accel.h".
      
      Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
      Reviewed-by: Fabiano Rosas <farosas@suse.de>
      Message-Id: <20221130135641.85328-2-philmd@linaro.org>
      Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/build-amd64.xen-build.{dot,ps,png,html,svg}.
----------------------------------------
175659: tolerable ALL FAIL

flight 175659 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/175659/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 build-amd64                   6 xen-build               fail baseline untested


jobs:
 build-amd64                                                  fail    


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


