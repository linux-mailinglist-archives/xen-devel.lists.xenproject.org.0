Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F0207129
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 12:30:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo2ez-0003vM-25; Wed, 24 Jun 2020 10:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mms=AF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jo2ex-0003vH-Q0
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 10:29:39 +0000
X-Inumbo-ID: 9b4ff9dc-b605-11ea-8496-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b4ff9dc-b605-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 10:29:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v3so1755993wrc.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=L/M44pw6Sj0jQWJNPY8bz6QSJKszKrTbkOfiJgdRQek=;
 b=hyMZa9g2LwQq2bNyRHjHVcBMtvyxaNClreQTHyu0tZWF91VEgE6oZmacss4GjgSkY+
 u39aWTKO7HGT8igc6iob4PPqflkB54QBBF9iS9fWfM4UJsUFIXzGARc/wQOfR+UEFLTP
 ljNLB0/A+sRqJQui5OcDuXf1tRGz5vg0r6lK01qiZAzfbBB2YivPRYCTsbyx/79sE4/+
 PKOa9KfLumpomoYN7ciSDWHpasR8L/AA+3eX0I9dt48zAyyiKGn+/v0IDINHy0blMIhg
 bPE6UMiNocQBNzwsZpVfqq6GwIxFBYGGI2tTgC6KlxQ1nxyE1e/d1emwEVWhqBiuTDEr
 BGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=L/M44pw6Sj0jQWJNPY8bz6QSJKszKrTbkOfiJgdRQek=;
 b=hmD9nnYzqnESplQ99REDZtWFMhCKWK6w9KmUR96qAtQotZTRMW6P7x664pthUzrTdo
 +PgrwEg8+9G/1HIWDR3fCDGch534gLIzbFf1w61QCtESO9YL0jcHKy3udsdJ8phyaZsM
 OyTfHcZNJWHmAy9YbF3CFu555nkfIe0fYaJkv2QPhCxSXn0+kUFYlxq2y0tguWqyzZ/1
 8oa2F8t0L2Gqfcih98ju/PqJNvPyFWf7Oe34IABP3f320eirdkuK6UBc+OhoZpAl/8Is
 WgGss/Xw1ovPfOG/7by72h5sSL5PX40iCLMc2eDfP6U5PwYzYqZedZCNdQqsqzUHSYM0
 LW/A==
X-Gm-Message-State: AOAM533pmr3WuFM7tPlho+sL3NHezjw5wrowt7vmDw4bjsnKLYxre0ew
 SL21T6ck+FYjiMeIqGOrWv0=
X-Google-Smtp-Source: ABdhPJxE9feSwol6Kklwvh3VZkAguHITTU8sBNe2WESkl417qGR/iAhk29Jn3pdBYy/8JQSBkI1htg==
X-Received: by 2002:adf:f350:: with SMTP id e16mr27815906wrp.43.1592994578119; 
 Wed, 24 Jun 2020 03:29:38 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id e5sm24855173wrs.33.2020.06.24.03.29.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 03:29:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jason Andryuk'" <jandryuk@gmail.com>
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
 <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 <87k0zykwdl.fsf@dusky.pond.sub.org> <000001d64953$f67a1f00$e36e5d00$@xen.org>
 <CAKf6xpt02SndxVkhqy52z7ZPCHtOhX1R5d7JQbeC8tVauBRm4Q@mail.gmail.com>
In-Reply-To: <CAKf6xpt02SndxVkhqy52z7ZPCHtOhX1R5d7JQbeC8tVauBRm4Q@mail.gmail.com>
Subject: RE: sysbus failed assert for xen_sysdev
Date: Wed, 24 Jun 2020 11:29:36 +0100
Message-ID: <000801d64a12$5c7c11f0$157435d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIJfv1jP4fCJU6d0eNUL65zTb1lhAKJjZPCAZLY/IEByWeHdwFU8pWtAkUeRcOoNSQ3UA==
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
Reply-To: paul@xen.org
Cc: 'Anthony PERARD' <anthony.perard@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Markus Armbruster' <armbru@redhat.com>, 'QEMU' <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jason Andryuk <jandryuk@gmail.com>
> Sent: 24 June 2020 04:24
> To: Paul Durrant <paul@xen.org>
> Cc: Markus Armbruster <armbru@redhat.com>; Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony
> PERARD <anthony.perard@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>; QEMU <qemu-
> devel@nongnu.org>
> Subject: Re: sysbus failed assert for xen_sysdev
> 
> On Tue, Jun 23, 2020 at 7:46 AM Paul Durrant <xadimgnik@gmail.com> wrote:
> >
> > > -----Original Message-----
> > > From: Markus Armbruster <armbru@redhat.com>
> > > Sent: 23 June 2020 09:41
> > > To: Jason Andryuk <jandryuk@gmail.com>
> > > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony PERARD <anthony.perard@citrix.com>;
> xen-
> > > devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>; QEMU <qemu-devel@nongnu.org>
> > > Subject: Re: sysbus failed assert for xen_sysdev
> > >
> > > Jason Andryuk <jandryuk@gmail.com> writes:
> > > > Then it gets farther... until
> > > > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > > > Assertion `dev->realized' failed.
> > > >
> > > > dev->id is NULL. The failing device is:
> > > > (gdb) p *dev.parent_obj.class.type
> > > > $12 = {name = 0x555556207770 "cfi.pflash01",
> > > >
> >
> > Having commented out the call to xen_be_init() entirely (and xen_bus_init() for good measure) I also
> get this assertion failure, so
> > I don't think is related.
> 
> Yes, this is something different.  pc_pflash_create() calls
> qdev_new(TYPE_PFLASH_CFI01), but it is only realized in
> pc_system_flash_map()...  and pc_system_flash_map() isn't called for
> Xen.
> 
> Removing the call to pc_system_flash_create() from pc_machine_initfn()
> lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
> there since accelerators have not been initialized yes, I guess?

Looks like it can be worked round by the following:

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1497d0e4ae..977d40afb8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
                        rom_memory, &ram_memory);
-    } else if (machine->kernel_filename != NULL) {
-        /* For xen HVM direct kernel boot, load linux here */
-        xen_load_linux(pcms);
+    } else {
+        pc_system_flash_cleanup_unused(pcms);
+        if (machine->kernel_filename != NULL) {
+            /* For xen HVM direct kernel boot, load linux here */
+            xen_load_linux(pcms);
+        }
     }

     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index ec2a3b3e7e..0ff47a4b59 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState *pcms)
     }
 }

-static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
+void pc_system_flash_cleanup_unused(PCMachineState *pcms)
 {
     char *prop_name;
     int i;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index e6135c34d6..497f2b7ab7 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);

 /* pc_sysfw.c */
 void pc_system_flash_create(PCMachineState *pcms);
+void pc_system_flash_cleanup_unused(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);

 /* acpi-build.c */


> 
> Regards,
> Jason


