Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EABD39A3DFC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 14:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821814.1235779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1luA-0003Dz-Fx; Fri, 18 Oct 2024 12:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821814.1235779; Fri, 18 Oct 2024 12:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1luA-0003BY-Bz; Fri, 18 Oct 2024 12:16:30 +0000
Received: by outflank-mailman (input) for mailman id 821814;
 Fri, 18 Oct 2024 12:16:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1lu8-00036T-W0; Fri, 18 Oct 2024 12:16:29 +0000
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1lu8-0003as-Rg; Fri, 18 Oct 2024 12:16:28 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1t1lu8-0005is-KW; Fri, 18 Oct 2024 12:16:28 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1t1lu8-00022Q-K1; Fri, 18 Oct 2024 12:16:28 +0000
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
	bh=ReADHFE8EoY67K0UF7XC8Ykja9VJtehMY+/OXKB1sxI=; b=3gcPXhcrgUhlQNnPcrzX60r6KU
	XNIFfQ4PgopTjphIG3tqn2QX0vRJaTyjD5xtVkefm9qeuh2AYp9+FJuM2NGYkABW3b2nY8W3/ufPn
	vymuvfsBTpHxj0a++J9uEFH1ZHtTNmqIIAOZGmwQ7xfVNd3DkdERZ5TTYfYI4/NtQqkY=;
To: xen-devel@lists.xenproject.org
Subject: [qemu-mainline bisection] complete test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict
Message-Id: <E1t1lu8-00022Q-K1@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 18 Oct 2024 12:16:28 +0000

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict
testid debian-hvm-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  35152940b78e478b97051a799cb6275ced03192e
  Bug not present: aa54f5be44be786636a5d51cc1612ad208a24849
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/188250/


  commit 35152940b78e478b97051a799cb6275ced03192e
  Merge: aa54f5be44 4cd78a3db2
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Mon Oct 14 17:05:25 2024 +0100
  
      Merge tag 'ui-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging
      
      UI-related fixes & shareable 2d memory with -display dbus
      
      # -----BEGIN PGP SIGNATURE-----
      #
      # iQJQBAABCAA6FiEEh6m9kz+HxgbSdvYt2ujhCXWWnOUFAmcNHtIcHG1hcmNhbmRy
      # ZS5sdXJlYXVAcmVkaGF0LmNvbQAKCRDa6OEJdZac5SYTD/9fRNrgnZIvIbIGf0kv
      # j3LguzwEsfn8eIUbJEIxtDnoS17zX1t981kP9J9ctUM6wnb0iQNYCXeTrF8Xrq0z
      # psiPhHGwPyWMdn9SWRfj597ShPn75z340Qve5GUm7clGu2KILh7TqqACH8LzaX+5
      # 6jqoZc3kqD+PYZHnYAi6v1YFfLIYfj0n6EaO/J4RRRZSrknpgct7jpmqL4wVzTIo
      # KYlG5afdUUfhmSIv5ZDpuuEJppdG74K2H+hJKDPIOOQ8/i/IU2EQPJ00ppiOPbET
      # nA0+piLGtHQwU24u5kDdbDlGL/y1KBKvGclOtzLQxWNStch5A6hqllNsuIg+0dJW
      # MRO2WZ8C7P7LD1eGmtYVZF/NzjnlTW/hbM5i0poPqhfcwbVmlIXjDs8GUfMGfINr
      # 1MVFGNjxfgadYZ1f6Q/JU/KWPJMR4Ik3C/SmGrRBlfra5YIts0ItDeGgfQIW9JGb
      # 1CpOng6/3SvW01B6psrPL+wP+6PsK333KPIA77KafOEMyOyEyuSOUrTShXbyXBHc
      # r/nLbWw2lZs4U0kgGRQ21+R3huTyw8LnikYpCnGwTWGCpb9NDFYg7z3CRrZW0hWx
      # DIWfN7M6YymeYygPUV9Wjo6i4yq4QqWPp7/QXtkSdX3v44/D7NWytKGST+Hwjkpa
      # h6U2vrsLdep2m47bnX/dEEP61g==
      # =xdt/
      # -----END PGP SIGNATURE-----
      # gpg: Signature made Mon 14 Oct 2024 14:38:26 BST
      # gpg:                using RSA key 87A9BD933F87C606D276F62DDAE8E10975969CE5
      # gpg:                issuer "marcandre.lureau@redhat.com"
      # gpg: Good signature from "Marc-André Lureau <marcandre.lureau@redhat.com>" [full]
      # gpg:                 aka "Marc-André Lureau <marcandre.lureau@gmail.com>" [full]
      # Primary key fingerprint: 87A9 BD93 3F87 C606 D276  F62D DAE8 E109 7596 9CE5
      
      * tag 'ui-pull-request' of https://gitlab.com/marcandre.lureau/qemu:
        audio/pw: Report more accurate error when connecting to PipeWire fails
        tests: add basic -display dbus Map.Unix test
        ui: refactor using a common qemu_pixman_shareable
        virtio-gpu: allocate shareable 2d resources on !win32
        ui/dbus: implement Unix.Map
        ui/dbus: add Listener.Unix.Map interface XML
        ui/dbus: make Listener.Win32.Map win32-specific
        meson: find_program('gdbus-codegen') directly
        ui/surface: allocate shared memory on !win32
        ui/dbus: add trace for can_share_map
        ui/dbus: do not limit to one listener per connection / bus name
        ui/pixman: generalize shared_image_destroy
        util/memfd: report potential errors on free
        ui/dbus: discard pending CursorDefine on new one
        ui/dbus: discard display messages on disable
        ui/dbus: fix filtering all update messages
        ui/win32: fix potential use-after-free with dbus shared memory
        ui/dbus: fix leak on message filtering
        hw/audio/hda: fix memory leak on audio setup
        hw/audio/hda: free timer on exit
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 4cd78a3db2478d3c1527905a26c9d3fbee83ccac
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Wed Sep 18 10:17:06 2024 +0200
  
      audio/pw: Report more accurate error when connecting to PipeWire fails
      
      According to its man page [1], pw_context_connect() sets errno on
      failure:
      
        Returns a Core on success or NULL with errno set on error.
      
      It may be handy to see errno when figuring out why PipeWire
      failed to connect. That leaves us with just one possible path to
      reach 'fail_error' label which is then moved to that path and
      also its error message is adjusted slightly.
      
      1: https://docs.pipewire.org/group__pw__core.html#ga5994e3a54e4ec718094ca02a1234815b
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Message-ID: <3a78811ad5b0e87816b7616ab21d2eeef00b9c52.1726647033.git.mprivozn@redhat.com>
  
  commit ab10297a4ab1dac64baf04ed66929bef60e67d2e
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:28 2024 +0400
  
      tests: add basic -display dbus Map.Unix test
      
      Only check we eventually get a shared memory scanout.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-20-marcandre.lureau@redhat.com>
  
  commit 1ff788db9781615be745671ebdb2eb82c137c5b8
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:27 2024 +0400
  
      ui: refactor using a common qemu_pixman_shareable
      
      Use a common shareable type for win32 & unix, and helper functions.
      This simplify the code as it avoids a lot of #ifdef'ery.
      
      Note: if it helps review, commits could be reordered to introduce the
      common type before introducing shareable memory for unix.
      
      Suggested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-19-marcandre.lureau@redhat.com>
  
  commit 5f899c34af1dbb0f621287faf9bcfb60fa237543
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:26 2024 +0400
  
      virtio-gpu: allocate shareable 2d resources on !win32
      
      Similar to what was done in commit 9462ff46 ("virtio-gpu/win32: allocate
      shareable 2d resources/images") for win32, allocate resource memory with
      memfd, so the associated display surface memory can be shared with a
      different process.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-18-marcandre.lureau@redhat.com>
  
  commit 48b7ef0f0fc3c3033797b67d1554987a516488f9
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:25 2024 +0400
  
      ui/dbus: implement Unix.Map
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-17-marcandre.lureau@redhat.com>
  
  commit 4de1797ff6ceb7387cdb967ec1fa0128624ff405
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:24 2024 +0400
  
      ui/dbus: add Listener.Unix.Map interface XML
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-16-marcandre.lureau@redhat.com>
  
  commit 3a9d38d31ea7bf99c62c8d97433baa85b3bdd5c9
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:23 2024 +0400
  
      ui/dbus: make Listener.Win32.Map win32-specific
      
      There are no types specific to Windows, so the code compiles on other
      platforms, but its useless on !Windows.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-15-marcandre.lureau@redhat.com>
  
  commit c118c8eb3e63c02421e8a02e82ffab6fa8369301
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:22 2024 +0400
  
      meson: find_program('gdbus-codegen') directly
      
      gio.pc variable is a bit bogus in context of cross-compilation, since it
      contains an absolute path, relative to the sysroot directory. On Fedora, it ends
      up as:
      /usr/x86_64-w64-mingw32/sys-root/mingw/lib/pkgconfig/usr/bin/gdbus-codegen
      path which does not exist because it is not shipped by Fedora mingw
      packages.
      
      Instead, we can rely on meson find_program() behaviour to do a better
      job based on its search order and capabilities.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-14-marcandre.lureau@redhat.com>
  
  commit ec818df0005d1598d249f0cfea557226b6ad89a6
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:21 2024 +0400
  
      ui/surface: allocate shared memory on !win32
      
      Use qemu_memfd_alloc() to allocate the display surface memory, which
      will fallback on tmpfile/mmap() on systems without memfd, and allow to
      share the display with other processes.
      
      This is similar to how display memory is allocated on win32 since commit
      09b4c198 ("console/win32: allocate shareable display surface").
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-13-marcandre.lureau@redhat.com>
  
  commit 28a3ca04782c5b72b85e197ccfab287a66ce76cb
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:20 2024 +0400
  
      ui/dbus: add trace for can_share_map
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-12-marcandre.lureau@redhat.com>
  
  commit 2448ff392c46aec2835f5eb6214e73438bbecda5
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:19 2024 +0400
  
      ui/dbus: do not limit to one listener per connection / bus name
      
      This is an arbitrary limitation that doesn't concern QEMU directly and
      may make some use cases unnecessarily more complicated.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-11-marcandre.lureau@redhat.com>
  
  commit 1bfb726112ea4fda07c988f08df32d1eebb9abec
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:18 2024 +0400
  
      ui/pixman: generalize shared_image_destroy
      
      Learn to free memfd-allocated shared memory.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-10-marcandre.lureau@redhat.com>
  
  commit c90204b65400d77a918844889ad6789858406203
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:17 2024 +0400
  
      util/memfd: report potential errors on free
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-9-marcandre.lureau@redhat.com>
  
  commit dcf62fb6ce8f56709d74c9b79c15478b9f3ff266
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:16 2024 +0400
  
      ui/dbus: discard pending CursorDefine on new one
      
      Similar to scanout updates, let's discard pending cursor changes.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-8-marcandre.lureau@redhat.com>
  
  commit 6b9524dfa550e4ce66451e3bdfbe61f2a683fddc
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:15 2024 +0400
  
      ui/dbus: discard display messages on disable
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-7-marcandre.lureau@redhat.com>
  
  commit cf59889781297a5618f1735a5f31402caa806b42
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:14 2024 +0400
  
      ui/dbus: fix filtering all update messages
      
      Filtering pending messages when a new scanout is given shouldn't discard
      pending cursor changes, for example.
      
      Since filtering happens in a different thread, use atomic set/get.
      
      Fixes: fa88b85dea ("ui/dbus: filter out pending messages when scanout")
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-6-marcandre.lureau@redhat.com>
  
  commit 330ef31deb2e5461cff907488b710f5bd9cd2327
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:13 2024 +0400
  
      ui/win32: fix potential use-after-free with dbus shared memory
      
      DisplaySurface may be free before the pixman image is freed, since the
      image is refcounted and used by different objects, including pending
      dbus messages.
      
      Furthermore, setting the destroy function in
      create_displaysurface_from() isn't appropriate, as it may not be used,
      and may be overriden as in ramfb.
      
      Set the destroy function when the shared handle is set, use the HANDLE
      directly for destroy data, using a single common helper
      qemu_pixman_win32_image_destroy().
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-5-marcandre.lureau@redhat.com>
  
  commit 244d52ff736fefc3dd364ed091720aa896af306d
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:12 2024 +0400
  
      ui/dbus: fix leak on message filtering
      
      A filter function that wants to drop a message should return NULL, in
      which case it must also unref the message itself.
      
      Fixes: fa88b85de ("ui/dbus: filter out pending messages when scanout")
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-4-marcandre.lureau@redhat.com>
  
  commit 6d6e23361fc732e4fe36a8bc5873b85f264ed53a
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:11 2024 +0400
  
      hw/audio/hda: fix memory leak on audio setup
      
      When SET_STREAM_FORMAT is called, we should clear the existing setup.
      
      Factor out common function to close a stream.
      
      Direct leak of 144 byte(s) in 3 object(s) allocated from:
          #0 0x7f91d38f7350 in calloc (/lib64/libasan.so.8+0xf7350) (BuildId: a4ad7eb954b390cf00f07fa10952988a41d9fc7a)
          #1 0x7f91d2ab7871 in g_malloc0 (/lib64/libglib-2.0.so.0+0x64871) (BuildId: 36b60dbd02e796145a982d0151ce37202ec05649)
          #2 0x562fa2f447ee in timer_new_full /home/elmarco/src/qemu/include/qemu/timer.h:538
          #3 0x562fa2f4486f in timer_new /home/elmarco/src/qemu/include/qemu/timer.h:559
          #4 0x562fa2f448a9 in timer_new_ns /home/elmarco/src/qemu/include/qemu/timer.h:577
          #5 0x562fa2f47955 in hda_audio_setup ../hw/audio/hda-codec.c:490
          #6 0x562fa2f4897e in hda_audio_command ../hw/audio/hda-codec.c:605
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-3-marcandre.lureau@redhat.com>
  
  commit f27206ceedbe2efae37c8d143c5eb2db05251508
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:10 2024 +0400
  
      hw/audio/hda: free timer on exit
      
      Fixes: 280c1e1cd ("audio/hda: create millisecond timers that handle IO")
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-2-marcandre.lureau@redhat.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install --summary-out=tmp/188250.bisection-summary --basis-template=187720 --blessings=real,real-bisect,real-retry qemu-mainline test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict debian-hvm-install
Searching for failure / basis pass:
 188186 fail [host=pinot1] / 188087 [host=nobling1] 188082 [host=septiner1] 188078 [host=debina0] 188075 [host=huxelrebe1] 188070 [host=albana1] 188064 [host=fiano0] 188058 [host=italia0] 188048 [host=albana0] 188036 [host=godello1] 188019 [host=huxelrebe0] 188005 [host=sabro0] 187999 [host=godello0] 187992 [host=pinot0] 187988 [host=rimava0] 187987 [host=italia1] 187983 [host=septiner0] 187978 [host=sabro1] 187965 [host=debina1] 187953 [host=nobling0] 187943 [host=rimava1] 187938 [host=debina0]\
  187928 [host=huxelrebe1] 187913 [host=albana1] 187903 ok.
Failure / basis pass flights: 188186 / 187903
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu https://gitlab.com/qemu-project/qemu.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Latest aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e19cc32bce466fb1c175f7d44708c2ebb45802a7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 95a16ee753d6da651fce8df876333bf7fcf134d9 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
Basis pass e526b12bf9169887f8cfe5afed2b10e56bdca4c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21e1fc5400c0d916ef9023a08b62eaf708727def 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b14a767eaca3df5534a162851f04787b363670e 2424e4c04aa30d90e85073ea41d18a7845460783 457052167b4dbcda59e06300039302479cc1debf
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#e526b12bf9169887f8cfe5afed2b10e56bdca4c3-aa4cd140bba57b7064b4c7a7141bebd336d32087 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#21e1fc5400c0d916ef9023a08b62eaf708727def-e19cc32bce466fb1c175f7d44708c2ebb45802a7 git://xenbits.xen.org/qemu-xen-traditional.git#3d273dd05e51e5a1ffba3d98c74\
 37ee84e8f8764-3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 https://gitlab.com/qemu-project/qemu.git#3b14a767eaca3df5534a162851f04787b363670e-95a16ee753d6da651fce8df876333bf7fcf134d9 git://xenbits.xen.org/osstest/seabios.git#2424e4c04aa30d90e85073ea41d18a7845460783-2424e4c04aa30d90e85073ea41d18a7845460783 git://xenbits.xen.org/xen.git#457052167b4dbcda59e06300039302479cc1debf-47990ecef286606794d607d4ca8703d71c98d659
Loaded 39972 nodes in revision graph
Searching for test results:
 188233 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e19cc32bce466fb1c175f7d44708c2ebb45802a7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 95a16ee753d6da651fce8df876333bf7fcf134d9 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188237 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa54f5be44be786636a5d51cc1612ad208a24849 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188242 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 35152940b78e478b97051a799cb6275ced03192e 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188243 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa54f5be44be786636a5d51cc1612ad208a24849 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188250 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 35152940b78e478b97051a799cb6275ced03192e 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 187903 pass e526b12bf9169887f8cfe5afed2b10e56bdca4c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21e1fc5400c0d916ef9023a08b62eaf708727def 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b14a767eaca3df5534a162851f04787b363670e 2424e4c04aa30d90e85073ea41d18a7845460783 457052167b4dbcda59e06300039302479cc1debf
 187913 [host=albana1]
 187928 [host=huxelrebe1]
 187938 [host=debina0]
 187953 [host=nobling0]
 187943 [host=rimava1]
 187965 [host=debina1]
 187978 [host=sabro1]
 187983 [host=septiner0]
 187987 [host=italia1]
 187988 [host=rimava0]
 187992 [host=pinot0]
 187999 [host=godello0]
 188019 [host=huxelrebe0]
 188005 [host=sabro0]
 188036 [host=godello1]
 188048 [host=albana0]
 188058 [host=italia0]
 188064 [host=fiano0]
 188070 [host=albana1]
 188075 [host=huxelrebe1]
 188078 [host=debina0]
 188082 [host=septiner1]
 188087 [host=nobling1]
 188093 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 081cf576a226e70ce4134dda19baf977d0b8bc64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c155d13167c6ace099e351e28125f9eb3694ae27 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188100 pass e526b12bf9169887f8cfe5afed2b10e56bdca4c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21e1fc5400c0d916ef9023a08b62eaf708727def 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b14a767eaca3df5534a162851f04787b363670e 2424e4c04aa30d90e85073ea41d18a7845460783 457052167b4dbcda59e06300039302479cc1debf
 188103 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 081cf576a226e70ce4134dda19baf977d0b8bc64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c155d13167c6ace099e351e28125f9eb3694ae27 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188104 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4de1797ff6ceb7387cdb967ec1fa0128624ff405 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188105 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7e3b6d8063f245d27eecce5aabe624b5785f2a77 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188109 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91d806917fd2be763f067a58ef05fadcf43efab1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ca9275a4b11aced3074219d1712e29fce5036f72 2424e4c04aa30d90e85073ea41d18a7845460783 bcce5a6b62761c8b678aebce33c55ea66f879f66
 188111 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 91d806917fd2be763f067a58ef05fadcf43efab1 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6b7d2f6e1896fb675e8518ed61c792d4dd92e034 2424e4c04aa30d90e85073ea41d18a7845460783 bcce5a6b62761c8b678aebce33c55ea66f879f66
 188112 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f962adc8a089949ecc730ba17f08234b52e3952d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 35ba77d2fcd10efd6db8318bbd4d21fa9402143b 2424e4c04aa30d90e85073ea41d18a7845460783 444cb9350f2c1cc202b6b86176ddd8e57525e2d9
 188115 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 f962adc8a089949ecc730ba17f08234b52e3952d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8f3375434d45e56db51b5ecd4d8a929146ba5641 2424e4c04aa30d90e85073ea41d18a7845460783 444cb9350f2c1cc202b6b86176ddd8e57525e2d9
 188116 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 df884297fd57aac379d227925e27211e667974ee 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7cca79fa52128054b02ecbea249aa51e1916ba72 2424e4c04aa30d90e85073ea41d18a7845460783 1223375d8b7faf0eab642834292bf4924e40f425
 188117 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 4f4673846fc9d6fc1c10a6c025da4739d872a6a0 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 72cb4806fdb0c5d7efca181dedfd46bed2acc9e7 2424e4c04aa30d90e85073ea41d18a7845460783 66878a8b7566e9a98d20b69ab95ddaffe1130683
 188101 fail irrelevant
 188118 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2fdc39d09d49a57e8dc87022b1dedd958f8c8d6a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 423be09ab9492735924e73a2d36069784441ebc6 2424e4c04aa30d90e85073ea41d18a7845460783 d82e0e094e7a07353ba0fb35732724316c2ec2f6
 188120 pass e526b12bf9169887f8cfe5afed2b10e56bdca4c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21e1fc5400c0d916ef9023a08b62eaf708727def 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b14a767eaca3df5534a162851f04787b363670e 2424e4c04aa30d90e85073ea41d18a7845460783 457052167b4dbcda59e06300039302479cc1debf
 188121 fail irrelevant
 188123 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 0bae161fed39d8996693e586b77f31094b61b9d7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 764a6ee9feb428a9759eaa94673285fad2586f11 2424e4c04aa30d90e85073ea41d18a7845460783 b32d24bcd6b79bb9de5b92dc69642d0c863f0765
 188124 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e530581ee06573fcf48c7f7a6c3f8ec6e5809243 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188126 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 232c3a848e8b291362e29835408011025031d88b 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188127 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 330ef31deb2e5461cff907488b710f5bd9cd2327 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188130 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa54f5be44be786636a5d51cc1612ad208a24849 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188133 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dc43b18d2e1ed50e6c912427d5f7fbd2c62007bb 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188134 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 461a9252e249adab5f0bae3b9634be77dd5be17e 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188136 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e34460c8b27d4f47b4f895e06955a254c5b0ac00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188137 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1bfb726112ea4fda07c988f08df32d1eebb9abec 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188138 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4cd78a3db2478d3c1527905a26c9d3fbee83ccac 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188122 fail irrelevant
 188139 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 081cf576a226e70ce4134dda19baf977d0b8bc64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1ba399406a8fa82ad24fd5208595ca429d2927ab 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188141 pass e526b12bf9169887f8cfe5afed2b10e56bdca4c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21e1fc5400c0d916ef9023a08b62eaf708727def 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b14a767eaca3df5534a162851f04787b363670e 2424e4c04aa30d90e85073ea41d18a7845460783 457052167b4dbcda59e06300039302479cc1debf
 188143 fail irrelevant
 188145 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8105ca851246338d58ee329d8471878023650b5a 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188146 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f27206ceedbe2efae37c8d143c5eb2db05251508 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188147 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ec818df0005d1598d249f0cfea557226b6ad89a6 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188149 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4cd78a3db2478d3c1527905a26c9d3fbee83ccac 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188150 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 081cf576a226e70ce4134dda19baf977d0b8bc64 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 005b6d511f23e0c2b69b4c7353defaa48c24853d 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188154 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 474dcfc0ab093043fee9952282bcab5f1dedc43a 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188155 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188157 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6b9524dfa550e4ce66451e3bdfbe61f2a683fddc 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188159 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5f899c34af1dbb0f621287faf9bcfb60fa237543 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188160 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 35152940b78e478b97051a799cb6275ced03192e 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188163 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2b74dd918007d91f5fee94ad0034b5e7a30ed777 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188164 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6ae8c5382b2396d394e135c2c6d3742d11c6d0c2 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188166 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 872e9581f705a98a26048180c454dedabc535b86 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188144 fail irrelevant
 188170 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2351165f1b8252269a36d625823743d9f6c243b9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188174 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188177 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d6e23361fc732e4fe36a8bc5873b85f264ed53a 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188183 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dcf62fb6ce8f56709d74c9b79c15478b9f3ff266 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188185 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2448ff392c46aec2835f5eb6214e73438bbecda5 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188187 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c118c8eb3e63c02421e8a02e82ffab6fa8369301 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188191 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1ff788db9781615be745671ebdb2eb82c137c5b8 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188195 pass aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa54f5be44be786636a5d51cc1612ad208a24849 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 188198 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0f0cd5b1f7e9780753344548e17ad4df9fcf5d8 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188201 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8db4e0f92e83fd80b6609439440b303ddded7ad8 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188203 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 effb0f7724bc317c1d4c13b92040ef1a022ab1a7 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188204 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 381d2c36e1242f849a55f4622e50b9a69cb92842 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188206 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7d4da670ea7b3be1f8c3a8d6768f59c2c8d3752a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188208 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3860a2a8de56fad71db42f4ad120eb7eff03b51f 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188210 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 244d52ff736fefc3dd364ed091720aa896af306d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188212 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cf59889781297a5618f1735a5f31402caa806b42 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188216 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c90204b65400d77a918844889ad6789858406203 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188218 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 28a3ca04782c5b72b85e197ccfab287a66ce76cb 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188220 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3a9d38d31ea7bf99c62c8d97433baa85b3bdd5c9 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188221 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48b7ef0f0fc3c3033797b67d1554987a516488f9 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188224 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab10297a4ab1dac64baf04ed66929bef60e67d2e 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188226 blocked aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4cd78a3db2478d3c1527905a26c9d3fbee83ccac 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 188186 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e19cc32bce466fb1c175f7d44708c2ebb45802a7 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 95a16ee753d6da651fce8df876333bf7fcf134d9 2424e4c04aa30d90e85073ea41d18a7845460783 47990ecef286606794d607d4ca8703d71c98d659
 188231 pass e526b12bf9169887f8cfe5afed2b10e56bdca4c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21e1fc5400c0d916ef9023a08b62eaf708727def 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3b14a767eaca3df5534a162851f04787b363670e 2424e4c04aa30d90e85073ea41d18a7845460783 457052167b4dbcda59e06300039302479cc1debf
 188228 fail aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 35152940b78e478b97051a799cb6275ced03192e 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
Searching for interesting versions
 Result found: flight 187903 (pass), for basis pass
 Result found: flight 188186 (fail), for basis failure
 Repro found: flight 188231 (pass), for basis pass
 Repro found: flight 188233 (fail), for basis failure
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 aa54f5be44be786636a5d51cc1612ad208a24849 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 7e3b6d8063f245d27eecce5aabe624b5785f2a77 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 474dcfc0ab093043fee9952282bcab5f1dedc43a 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2b74dd918007d91f5fee94ad0034b5e7a30ed777 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 d0f0cd5b1f7e9780753344548e17ad4df9fcf5d8 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 461a9252e249adab5f0bae3b9634be77dd5be17e 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6ae8c5382b2396d394e135c2c6d3742d11c6d0c2 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8db4e0f92e83fd80b6609439440b303ddded7ad8 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 8105ca851246338d58ee329d8471878023650b5a 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 872e9581f705a98a26048180c454dedabc535b86 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 effb0f7724bc317c1d4c13b92040ef1a022ab1a7 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 232c3a848e8b291362e29835408011025031d88b 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 381d2c36e1242f849a55f4622e50b9a69cb92842 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d2a41d1a7a555e54336e03731c801eb93fba801d 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 2351165f1b8252269a36d625823743d9f6c243b9 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 7d4da670ea7b3be1f8c3a8d6768f59c2c8d3752a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 e34460c8b27d4f47b4f895e06955a254c5b0ac00 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 b38d263bca64bbba36d4b175ea0f5746b4c5604d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 e530581ee06573fcf48c7f7a6c3f8ec6e5809243 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3860a2a8de56fad71db42f4ad120eb7eff03b51f 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 f27206ceedbe2efae37c8d143c5eb2db05251508 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6d6e23361fc732e4fe36a8bc5873b85f264ed53a 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 244d52ff736fefc3dd364ed091720aa896af306d 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 330ef31deb2e5461cff907488b710f5bd9cd2327 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 cf59889781297a5618f1735a5f31402caa806b42 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 6b9524dfa550e4ce66451e3bdfbe61f2a683fddc 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 dcf62fb6ce8f56709d74c9b79c15478b9f3ff266 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c90204b65400d77a918844889ad6789858406203 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1bfb726112ea4fda07c988f08df32d1eebb9abec 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 2448ff392c46aec2835f5eb6214e73438bbecda5 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 28a3ca04782c5b72b85e197ccfab287a66ce76cb 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ec818df0005d1598d249f0cfea557226b6ad89a6 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 c118c8eb3e63c02421e8a02e82ffab6fa8369301 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 3a9d38d31ea7bf99c62c8d97433baa85b3bdd5c9 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4de1797ff6ceb7387cdb967ec1fa0128624ff405 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 48b7ef0f0fc3c3033797b67d1554987a516488f9 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 5f899c34af1dbb0f621287faf9bcfb60fa237543 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 1ff788db9781615be745671ebdb2eb82c137c5b8 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 ab10297a4ab1dac64baf04ed66929bef60e67d2e 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fcd9570c8d8164b42f907137a3a6e78977cc860a 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4cd78a3db2478d3c1527905a26c9d3fbee83ccac 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4cd78a3db2478d3c1527905a26c9d3fbee83ccac 2424e4c04aa30d90e85073ea41d18a7845460783 76a54badf890f56ff72644593c0fbc72138e13aa
 0 revisions at aa4cd140bba57b7064b4c7a7141bebd336d32087 c530a75c1e6a472b0eb9558310b518f0dfcd8860 21767dcf4e04ade9e679f8562513da8ceedf19ec 3d273dd05e51e5a1ffba3d98c7437ee84e8f8764 4cd78a3db2478d3c1527905a26c9d3fbee83ccac 2424e4c04aa30d90e85073ea41d18a7845460783 542ac112fc68c66cfafc577e252404c21da4f75b
No revisions left to test, checking graph state.
 Result found: flight 188195 (pass), for last pass
 Result found: flight 188228 (fail), for first failure
 Repro found: flight 188237 (pass), for last pass
 Repro found: flight 188242 (fail), for first failure
 Repro found: flight 188243 (pass), for last pass
 Repro found: flight 188250 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  qemuu https://gitlab.com/qemu-project/qemu.git
  Bug introduced:  35152940b78e478b97051a799cb6275ced03192e
  Bug not present: aa54f5be44be786636a5d51cc1612ad208a24849
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/188250/


  commit 35152940b78e478b97051a799cb6275ced03192e
  Merge: aa54f5be44 4cd78a3db2
  Author: Peter Maydell <peter.maydell@linaro.org>
  Date:   Mon Oct 14 17:05:25 2024 +0100
  
      Merge tag 'ui-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging
      
      UI-related fixes & shareable 2d memory with -display dbus
      
      # -----BEGIN PGP SIGNATURE-----
      #
      # iQJQBAABCAA6FiEEh6m9kz+HxgbSdvYt2ujhCXWWnOUFAmcNHtIcHG1hcmNhbmRy
      # ZS5sdXJlYXVAcmVkaGF0LmNvbQAKCRDa6OEJdZac5SYTD/9fRNrgnZIvIbIGf0kv
      # j3LguzwEsfn8eIUbJEIxtDnoS17zX1t981kP9J9ctUM6wnb0iQNYCXeTrF8Xrq0z
      # psiPhHGwPyWMdn9SWRfj597ShPn75z340Qve5GUm7clGu2KILh7TqqACH8LzaX+5
      # 6jqoZc3kqD+PYZHnYAi6v1YFfLIYfj0n6EaO/J4RRRZSrknpgct7jpmqL4wVzTIo
      # KYlG5afdUUfhmSIv5ZDpuuEJppdG74K2H+hJKDPIOOQ8/i/IU2EQPJ00ppiOPbET
      # nA0+piLGtHQwU24u5kDdbDlGL/y1KBKvGclOtzLQxWNStch5A6hqllNsuIg+0dJW
      # MRO2WZ8C7P7LD1eGmtYVZF/NzjnlTW/hbM5i0poPqhfcwbVmlIXjDs8GUfMGfINr
      # 1MVFGNjxfgadYZ1f6Q/JU/KWPJMR4Ik3C/SmGrRBlfra5YIts0ItDeGgfQIW9JGb
      # 1CpOng6/3SvW01B6psrPL+wP+6PsK333KPIA77KafOEMyOyEyuSOUrTShXbyXBHc
      # r/nLbWw2lZs4U0kgGRQ21+R3huTyw8LnikYpCnGwTWGCpb9NDFYg7z3CRrZW0hWx
      # DIWfN7M6YymeYygPUV9Wjo6i4yq4QqWPp7/QXtkSdX3v44/D7NWytKGST+Hwjkpa
      # h6U2vrsLdep2m47bnX/dEEP61g==
      # =xdt/
      # -----END PGP SIGNATURE-----
      # gpg: Signature made Mon 14 Oct 2024 14:38:26 BST
      # gpg:                using RSA key 87A9BD933F87C606D276F62DDAE8E10975969CE5
      # gpg:                issuer "marcandre.lureau@redhat.com"
      # gpg: Good signature from "Marc-André Lureau <marcandre.lureau@redhat.com>" [full]
      # gpg:                 aka "Marc-André Lureau <marcandre.lureau@gmail.com>" [full]
      # Primary key fingerprint: 87A9 BD93 3F87 C606 D276  F62D DAE8 E109 7596 9CE5
      
      * tag 'ui-pull-request' of https://gitlab.com/marcandre.lureau/qemu:
        audio/pw: Report more accurate error when connecting to PipeWire fails
        tests: add basic -display dbus Map.Unix test
        ui: refactor using a common qemu_pixman_shareable
        virtio-gpu: allocate shareable 2d resources on !win32
        ui/dbus: implement Unix.Map
        ui/dbus: add Listener.Unix.Map interface XML
        ui/dbus: make Listener.Win32.Map win32-specific
        meson: find_program('gdbus-codegen') directly
        ui/surface: allocate shared memory on !win32
        ui/dbus: add trace for can_share_map
        ui/dbus: do not limit to one listener per connection / bus name
        ui/pixman: generalize shared_image_destroy
        util/memfd: report potential errors on free
        ui/dbus: discard pending CursorDefine on new one
        ui/dbus: discard display messages on disable
        ui/dbus: fix filtering all update messages
        ui/win32: fix potential use-after-free with dbus shared memory
        ui/dbus: fix leak on message filtering
        hw/audio/hda: fix memory leak on audio setup
        hw/audio/hda: free timer on exit
      
      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
  
  commit 4cd78a3db2478d3c1527905a26c9d3fbee83ccac
  Author: Michal Privoznik <mprivozn@redhat.com>
  Date:   Wed Sep 18 10:17:06 2024 +0200
  
      audio/pw: Report more accurate error when connecting to PipeWire fails
      
      According to its man page [1], pw_context_connect() sets errno on
      failure:
      
        Returns a Core on success or NULL with errno set on error.
      
      It may be handy to see errno when figuring out why PipeWire
      failed to connect. That leaves us with just one possible path to
      reach 'fail_error' label which is then moved to that path and
      also its error message is adjusted slightly.
      
      1: https://docs.pipewire.org/group__pw__core.html#ga5994e3a54e4ec718094ca02a1234815b
      
      Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
      Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
      Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Message-ID: <3a78811ad5b0e87816b7616ab21d2eeef00b9c52.1726647033.git.mprivozn@redhat.com>
  
  commit ab10297a4ab1dac64baf04ed66929bef60e67d2e
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:28 2024 +0400
  
      tests: add basic -display dbus Map.Unix test
      
      Only check we eventually get a shared memory scanout.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-20-marcandre.lureau@redhat.com>
  
  commit 1ff788db9781615be745671ebdb2eb82c137c5b8
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:27 2024 +0400
  
      ui: refactor using a common qemu_pixman_shareable
      
      Use a common shareable type for win32 & unix, and helper functions.
      This simplify the code as it avoids a lot of #ifdef'ery.
      
      Note: if it helps review, commits could be reordered to introduce the
      common type before introducing shareable memory for unix.
      
      Suggested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-19-marcandre.lureau@redhat.com>
  
  commit 5f899c34af1dbb0f621287faf9bcfb60fa237543
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:26 2024 +0400
  
      virtio-gpu: allocate shareable 2d resources on !win32
      
      Similar to what was done in commit 9462ff46 ("virtio-gpu/win32: allocate
      shareable 2d resources/images") for win32, allocate resource memory with
      memfd, so the associated display surface memory can be shared with a
      different process.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-18-marcandre.lureau@redhat.com>
  
  commit 48b7ef0f0fc3c3033797b67d1554987a516488f9
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:25 2024 +0400
  
      ui/dbus: implement Unix.Map
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-17-marcandre.lureau@redhat.com>
  
  commit 4de1797ff6ceb7387cdb967ec1fa0128624ff405
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:24 2024 +0400
  
      ui/dbus: add Listener.Unix.Map interface XML
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-16-marcandre.lureau@redhat.com>
  
  commit 3a9d38d31ea7bf99c62c8d97433baa85b3bdd5c9
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:23 2024 +0400
  
      ui/dbus: make Listener.Win32.Map win32-specific
      
      There are no types specific to Windows, so the code compiles on other
      platforms, but its useless on !Windows.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-15-marcandre.lureau@redhat.com>
  
  commit c118c8eb3e63c02421e8a02e82ffab6fa8369301
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:22 2024 +0400
  
      meson: find_program('gdbus-codegen') directly
      
      gio.pc variable is a bit bogus in context of cross-compilation, since it
      contains an absolute path, relative to the sysroot directory. On Fedora, it ends
      up as:
      /usr/x86_64-w64-mingw32/sys-root/mingw/lib/pkgconfig/usr/bin/gdbus-codegen
      path which does not exist because it is not shipped by Fedora mingw
      packages.
      
      Instead, we can rely on meson find_program() behaviour to do a better
      job based on its search order and capabilities.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-14-marcandre.lureau@redhat.com>
  
  commit ec818df0005d1598d249f0cfea557226b6ad89a6
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:21 2024 +0400
  
      ui/surface: allocate shared memory on !win32
      
      Use qemu_memfd_alloc() to allocate the display surface memory, which
      will fallback on tmpfile/mmap() on systems without memfd, and allow to
      share the display with other processes.
      
      This is similar to how display memory is allocated on win32 since commit
      09b4c198 ("console/win32: allocate shareable display surface").
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-13-marcandre.lureau@redhat.com>
  
  commit 28a3ca04782c5b72b85e197ccfab287a66ce76cb
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:20 2024 +0400
  
      ui/dbus: add trace for can_share_map
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-12-marcandre.lureau@redhat.com>
  
  commit 2448ff392c46aec2835f5eb6214e73438bbecda5
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:19 2024 +0400
  
      ui/dbus: do not limit to one listener per connection / bus name
      
      This is an arbitrary limitation that doesn't concern QEMU directly and
      may make some use cases unnecessarily more complicated.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-11-marcandre.lureau@redhat.com>
  
  commit 1bfb726112ea4fda07c988f08df32d1eebb9abec
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:18 2024 +0400
  
      ui/pixman: generalize shared_image_destroy
      
      Learn to free memfd-allocated shared memory.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-10-marcandre.lureau@redhat.com>
  
  commit c90204b65400d77a918844889ad6789858406203
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:17 2024 +0400
  
      util/memfd: report potential errors on free
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-9-marcandre.lureau@redhat.com>
  
  commit dcf62fb6ce8f56709d74c9b79c15478b9f3ff266
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:16 2024 +0400
  
      ui/dbus: discard pending CursorDefine on new one
      
      Similar to scanout updates, let's discard pending cursor changes.
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-8-marcandre.lureau@redhat.com>
  
  commit 6b9524dfa550e4ce66451e3bdfbe61f2a683fddc
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:15 2024 +0400
  
      ui/dbus: discard display messages on disable
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-7-marcandre.lureau@redhat.com>
  
  commit cf59889781297a5618f1735a5f31402caa806b42
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:14 2024 +0400
  
      ui/dbus: fix filtering all update messages
      
      Filtering pending messages when a new scanout is given shouldn't discard
      pending cursor changes, for example.
      
      Since filtering happens in a different thread, use atomic set/get.
      
      Fixes: fa88b85dea ("ui/dbus: filter out pending messages when scanout")
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-6-marcandre.lureau@redhat.com>
  
  commit 330ef31deb2e5461cff907488b710f5bd9cd2327
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:13 2024 +0400
  
      ui/win32: fix potential use-after-free with dbus shared memory
      
      DisplaySurface may be free before the pixman image is freed, since the
      image is refcounted and used by different objects, including pending
      dbus messages.
      
      Furthermore, setting the destroy function in
      create_displaysurface_from() isn't appropriate, as it may not be used,
      and may be overriden as in ramfb.
      
      Set the destroy function when the shared handle is set, use the HANDLE
      directly for destroy data, using a single common helper
      qemu_pixman_win32_image_destroy().
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-5-marcandre.lureau@redhat.com>
  
  commit 244d52ff736fefc3dd364ed091720aa896af306d
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:12 2024 +0400
  
      ui/dbus: fix leak on message filtering
      
      A filter function that wants to drop a message should return NULL, in
      which case it must also unref the message itself.
      
      Fixes: fa88b85de ("ui/dbus: filter out pending messages when scanout")
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-4-marcandre.lureau@redhat.com>
  
  commit 6d6e23361fc732e4fe36a8bc5873b85f264ed53a
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:11 2024 +0400
  
      hw/audio/hda: fix memory leak on audio setup
      
      When SET_STREAM_FORMAT is called, we should clear the existing setup.
      
      Factor out common function to close a stream.
      
      Direct leak of 144 byte(s) in 3 object(s) allocated from:
          #0 0x7f91d38f7350 in calloc (/lib64/libasan.so.8+0xf7350) (BuildId: a4ad7eb954b390cf00f07fa10952988a41d9fc7a)
          #1 0x7f91d2ab7871 in g_malloc0 (/lib64/libglib-2.0.so.0+0x64871) (BuildId: 36b60dbd02e796145a982d0151ce37202ec05649)
          #2 0x562fa2f447ee in timer_new_full /home/elmarco/src/qemu/include/qemu/timer.h:538
          #3 0x562fa2f4486f in timer_new /home/elmarco/src/qemu/include/qemu/timer.h:559
          #4 0x562fa2f448a9 in timer_new_ns /home/elmarco/src/qemu/include/qemu/timer.h:577
          #5 0x562fa2f47955 in hda_audio_setup ../hw/audio/hda-codec.c:490
          #6 0x562fa2f4897e in hda_audio_command ../hw/audio/hda-codec.c:605
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-3-marcandre.lureau@redhat.com>
  
  commit f27206ceedbe2efae37c8d143c5eb2db05251508
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Tue Oct 8 16:50:10 2024 +0400
  
      hw/audio/hda: free timer on exit
      
      Fixes: 280c1e1cd ("audio/hda: create millisecond timers that handle IO")
      
      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
      Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
      Message-ID: <20241008125028.1177932-2-marcandre.lureau@redhat.com>

Revision graph left in /home/logs/results/bisect/qemu-mainline/test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict.debian-hvm-install.{dot,ps,png,html,svg}.
----------------------------------------
188250: tolerable ALL FAIL

flight 188250 qemu-mainline real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/188250/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 12 debian-hvm-install fail baseline untested


jobs:
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        fail    


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


