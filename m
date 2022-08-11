Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF775906DD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 21:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385110.620635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMDZe-0003uk-4F; Thu, 11 Aug 2022 19:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385110.620635; Thu, 11 Aug 2022 19:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMDZe-0003su-0d; Thu, 11 Aug 2022 19:10:30 +0000
Received: by outflank-mailman (input) for mailman id 385110;
 Thu, 11 Aug 2022 19:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8gOk=YP=canonical.com=mfo@srs-se1.protection.inumbo.net>)
 id 1oMDZd-0003so-7j
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 19:10:29 +0000
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41845f70-19a9-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 21:10:26 +0200 (CEST)
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8587C3FDDE
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 19:10:25 +0000 (UTC)
Received: by mail-ua1-f71.google.com with SMTP id
 k12-20020a9f30cc000000b0038cfe232fc3so1742828uab.18
 for <xen-devel@lists.xenproject.org>; Thu, 11 Aug 2022 12:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4e1:83a2:2ee9:2118:a2dc:3dd6])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a67ea07000000b00384b60a5160sm120094vso.12.2022.08.11.12.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 12:10:23 -0700 (PDT)
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
X-Inumbo-ID: 41845f70-19a9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660245025;
	bh=WI3WTcluaX9QeWSCytatte5fzBb19E+aqsA1DyfB5WM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=U48L5BMbBrnYlC9xdaXn19AsptvPl/DSo6K/nR7lpBIsRSFeqOpzeWX2In69ia4yb
	 1jmh6UyVY+oAZDGD0v/xad3P9LIc8d6zuGbRZl/9D231WRCHJn7OCSQNVcMhd7HSqt
	 Wnbk0cO0nDzHflfPdEgq0DFSkIiCz4F5MsW5Z/3SJkTJ7T7R+qcb2uSXMYMUr6+uOI
	 GCM5Kkv0ZBBMzizhxuRto84LnTGeCXJbW62E8pmDlNqa28RLwPmxUrgF2tTLg2YEe/
	 DYzeaepHLNHjyljWlVjpCkKJCPZVdzwWtCeY2nJXxy5xH6bm1e/oahRCPzKpc+aSG3
	 vcvQ/UhyTnwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=WI3WTcluaX9QeWSCytatte5fzBb19E+aqsA1DyfB5WM=;
        b=cX2xqqA1KuNU0PJ78J1X1LUlnPxQeYmAd2761XOAXXuBMlb86EEPcKOPTmS+afEnG3
         PZXkB3G9fPFirKZnTQscJ3dpluftDv23QeQ33tDiluAfls1tdYSQZv04BL7AsAKuznFR
         eWd46GSkPSQeSVH4ctDrmdc3sCK/2uuX1WUZZZ7irDehJSep6iRMlpojTgESwsaF7s+u
         DAgy38nYnhm7sNaiJwnDfU3VnPDyanNgn3N7vNy2LeFLoBzoC1dHBF7DmqNYziFFbMcA
         sHbKm4FsuO6r6rJQ/R6xteRtdqRPY19CJszsJ1+BXT0mmaA38SHA9C6QrzH2FL7wjOtm
         LJRg==
X-Gm-Message-State: ACgBeo2w8c7diH/IQsARxWDL22oNnHi0c7uYMgn6pGblyydUacwkrR8n
	tCTHrLCHFdnbzSZ1mBzybVqHiqQMmgVSuWzosB+T9RkNakbnhLbon9TYmWtwLs3hmSyujo9Mzwz
	6MrzqkTv3IsL746DJWEOPSF6QjFQm0VUX+C/I+x/h9qTa
X-Received: by 2002:a05:6102:748:b0:383:f58b:e1d1 with SMTP id v8-20020a056102074800b00383f58be1d1mr232971vsg.4.1660245024094;
        Thu, 11 Aug 2022 12:10:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7+3e6BBFtoN2+LChsymM31WoFtOxj+BrpCOK6WyVItXRq5dZIBaMclDO82NnKHtiZC3BBg2Q==
X-Received: by 2002:a05:6102:748:b0:383:f58b:e1d1 with SMTP id v8-20020a056102074800b00383f58be1d1mr232941vsg.4.1660245023802;
        Thu, 11 Aug 2022 12:10:23 -0700 (PDT)
From: Mauricio Faria de Oliveira <mfo@canonical.com>
To: xen-devel@lists.xenproject.org,
	grub-devel@gnu.org
Cc: Daniel Kiper <dkiper@net-space.pl>,
	=?UTF-8?q?Peter=20Gro=C3=9Fe?= <pegro@friiks.de>
Subject: [PATCH 0/2] templates/linux_xen: Properly handle multiple initrd files
Date: Thu, 11 Aug 2022 16:10:12 -0300
Message-Id: <20220811191014.139882-1-mfo@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the xen-devel list as requested in grub-devel [0]:

On Thu, Aug 11, 2022 at 1:51 PM Daniel Kiper <dkiper@net-space.pl> wrote:
> In general patches LGTM. However, I would prefer to hear an opinion from Xen
> folks too. So, please repost the patch set and add xen-devel@lists.xenproject.org
> to the list of recipients.

[0] https://lists.gnu.org/archive/html/grub-devel/2022-08/msg00115.html

Thanks,
Mauricio

...

The linux_xen template seems to be broken for multiple initrd files.
Linux fails to boot when it needs a real initrd but early/microcode
initrd(s) are found by grub-mkconfig.

Patch 1 allows initrd(s) other than the first early/microcode initrd
to be loaded at all, fixing an implementation error for multiboot[2].

Patch 2 allows Linux to get the real initrd as initrd (vs. an early/
microcode-only initrd), thus being able to boot if it needs a initrd.

Synthetic tests:
---

    # touch /boot/xen /boot/microcode.cpio

Original:

    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot       /boot/xen ...
            module  /boot/vmlinuz-5.4.0-122-generic ...
            module  --nounzip   /boot/microcode.cpio /boot/initrd.img-5.4.0-122-generic

Patch 1:

    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot      /boot/xen ...
            module  /boot/vmlinuz-5.4.0-122-generic ...
            module  --nounzip   /boot/microcode.cpio
            module  --nounzip   /boot/initrd.img-5.4.0-122-generic

Patch 2:

    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot      /boot/xen ...
            module  /boot/vmlinuz-5.4.0-122-generic ...
            module  --nounzip   /boot/initrd.img-5.4.0-122-generic
            module  --nounzip   /boot/microcode.cpio

    With fake multiboot2 header:

    # echo -en '\xd6\x50\x52\xe8\x00\x00\x00\x00' > /boot/xen
    # echo -en '\x00\x00\x00\x00\x2a\xaf\xad\x17' >> /boot/xen
    # echo -en '\x00\x00\x00\x00\x00\x00\x00\x00' >> /boot/xen
    # echo -en '\x00\x00\x00\x00\x00\x00\x00\x00' >> /boot/xen

    # grub-file --is-x86-multiboot2 /boot/xen; echo $?
    0
    
    # grub-mkconfig 2>/dev/null | grep -P '^\t(multiboot|module)'
            multiboot2      /boot/xen ...
            module2 /boot/vmlinuz-5.4.0-122-generic ...
            module2 --nounzip   /boot/initrd.img-5.4.0-122-generic
            module2 --nounzip   /boot/microcode.cpio

Regular tests:
---

Debug patch:

    __start_xen() @ xen.git:xen/arch/x86/setup.c
    ...
    +for (i = 0; i < mbi->mods_count; i++)
    +   printk("MODULE %d size %d string %s\n",
    +          i, mod[i].mod_end - mod[i].mod_start, (char*)__va(mod[i].string));
    +
     bitmap_fill(module_map, mbi->mods_count);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */

For /boot/microcode.cpio:

    $ sudo apt install microcode-initrd # on Ubuntu

    $ du --bytes /boot/...
    13660416 /boot/vmlinuz-5.4.0-122-generic
    33062542 /boot/initrd.img-5.4.0-122-generic
    5045248  /boot/microcode.cpio

Original:

    (XEN) MODULE 0 size 13660416 string placeholder root=UUID=74dd579c-a377-487d-b8f7-bc7c6df13ba1 ro console=ttyS0
    (XEN) MODULE 1 size 5045248 string /boot/initrd.img-5.4.0-122-generic
    ...
    [    2.505207] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Patch 1:

    (XEN) MODULE 0 size 13660416 string placeholder root=UUID=74dd579c-a377-487d-b8f7-bc7c6df13ba1 ro console=ttyS0
    (XEN) MODULE 1 size 5045248 string
    (XEN) MODULE 2 size 33062542 string
    ...
    [    1.890498] Freeing initrd memory: 4928K
    ...
    [    2.710948] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

Patch 2:

    (XEN) MODULE 0 size 13660416 string placeholder root=UUID=74dd579c-a377-487d-b8f7-bc7c6df13ba1 ro console=ttyS0
    (XEN) MODULE 1 size 33062542 string
    (XEN) MODULE 2 size 5045248 string
    ...
    [    1.968578] Freeing initrd memory: 32288K
    ...
    [    2.844889] Run /init as init process
    [    2.916532] systemd-udevd[148]: Starting version 245.4-4ubuntu3.17

Xen code:
---

Key code path for this patchset:

    @ xen.git:xen/arch/x86/setup.c:

    void __init noreturn __start_xen(unsigned long mbi_p)
    {
    ...
        unsigned int initrdidx, ...
        multiboot_info_t *mbi;
        module_t *mod;
        unsigned long ..., module_map[1];
    ...
        mbi = __va(mbi_p);
    ...
        mod = __va(mbi->mods_addr);
    ...
        bitmap_fill(module_map, mbi->mods_count);
        __clear_bit(0, module_map); /* Dom0 kernel is always first */
    ...
        microcode_grab_module(module_map, mbi);
           # ucode=number can __test_and_clear_bit(number, module_map),
           # ucode=scan can't.
    ...
        initrdidx = find_first_bit(module_map, mbi->mods_count);
        if ( bitmap_weight(module_map, mbi->mods_count) > 1 )
        printk(XENLOG_WARNING
               "Multiple initrd candidates, picking module #%u\n",
               initrdidx);
    ...
        /*
         * ... The second module, if present, is an initrd ramdisk.
         */
        dom0 = create_dom0(mod, modules_headroom,
                           initrdidx < mbi->mods_count ? mod + initrdidx : NULL,
                           kextra, loader);
    ...

Mauricio Faria de Oliveira (2):
  templates/linux_xen: Properly load multiple initrd files
  templates/linux_xen: Properly order the multiple initrd files

 util/grub.d/20_linux_xen.in | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.34.1


