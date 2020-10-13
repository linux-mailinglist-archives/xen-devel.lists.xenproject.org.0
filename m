Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AE28D432
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 21:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6366.16942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSPbp-0002vX-Mr; Tue, 13 Oct 2020 19:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6366.16942; Tue, 13 Oct 2020 19:05:17 +0000
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
	id 1kSPbp-0002v8-Ji; Tue, 13 Oct 2020 19:05:17 +0000
Received: by outflank-mailman (input) for mailman id 6366;
 Tue, 13 Oct 2020 19:05:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+FY=DU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSPbn-0002v3-Hl
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 19:05:15 +0000
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a94aba4d-f3f0-41af-8bb7-70789d6a06c1;
 Tue, 13 Oct 2020 19:05:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q25so913729ioh.4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 12:05:14 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:2d14:a347:ac28:26f2])
 by smtp.gmail.com with ESMTPSA id s23sm653518iol.23.2020.10.13.12.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 12:05:12 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=M+FY=DU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSPbn-0002v3-Hl
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 19:05:15 +0000
X-Inumbo-ID: a94aba4d-f3f0-41af-8bb7-70789d6a06c1
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a94aba4d-f3f0-41af-8bb7-70789d6a06c1;
	Tue, 13 Oct 2020 19:05:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q25so913729ioh.4
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NlAURjkMShpO6CROxGAWX/5rLBekEJFkEIs/xx5Bfko=;
        b=TT46lMBgHTOXGcVlM3V/MO0l6ssKdR4I26NDwURKfAxnQzoGUwXnGhN5I1Ely1aW8t
         W+jsoej02F9xCAXi4L8lsRrv6ucl9PXNI7o4GJqFR/FBEh9agkzS7wo7PIeOJE6bUpfh
         wKuIJW5659FDPaVI++tDqjVY0T612XRtJBEbY+YWOUhZXmwf+htFB36qhxlqqJhxcq2/
         piyPTKJnmnIlrII20x4rRbBPQM2IHBomwVPlBSoxvfIBgtpxLksPLN8vPRaDGyl23cTG
         3BFDTnINYIDTxvGIcSsh02UGydv5T/X7zmADnYh3Zjux4NBXwdr2lfytcZXjb6RcLKJ1
         vl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NlAURjkMShpO6CROxGAWX/5rLBekEJFkEIs/xx5Bfko=;
        b=LslgwLQ9q8bQ5o0NikR/H5+067mqrJ8P/7GEWEEFdgtOnWtthzRU1EZEoqINLhiNsw
         I9CnF1C4bVvka/cbqXa0peoClUK4bSJDu2+UegVcBxJAys22j2jte0n/vPTv7Wg6WPNs
         fELFimCDpLi1WAFHXuIZt4ePUeEo06oGDLeOhi5BtfDdaEwpsPeJdP98IWU+f6knYMeZ
         r1xA3y7VMNxKkbpcusVI3/Ju0GK3ZZTNoihVuSnV8NmTvfYftQh5EijrsM/dCFCeIxfG
         HCHp46SWdD4vWnxt2jWo+HN00okSF53p0UT70QoMk78f0Rpe6G3BJliUlyBNkqXGTK2j
         YNew==
X-Gm-Message-State: AOAM533q8YPGcTr3hCIZBp1o/B+JyeAcVPMT9yMLGWb/5naboPQgxzlC
	cE8qlZVLmoyvM+I16RgGols=
X-Google-Smtp-Source: ABdhPJxb4KRaKlOzqd6+8N5whHfIAxDnwNVcj+ARqU7kD7qL4UzCUhJs8it/CfhVVefdCuTSH6zT5Q==
X-Received: by 2002:a6b:d214:: with SMTP id q20mr237841iob.23.1602615913834;
        Tue, 13 Oct 2020 12:05:13 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:2d14:a347:ac28:26f2])
        by smtp.gmail.com with ESMTPSA id s23sm653518iol.23.2020.10.13.12.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 12:05:12 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com,
	xen-devel@lists.xenproject.org,
	paul@xen.org,
	anthony.perard@citrix.com,
	sstabellini@kernel.org,
	Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] hw/xen: Set suppress-vmdesc for Xen machines
Date: Tue, 13 Oct 2020 15:05:06 -0400
Message-Id: <20201013190506.3325-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen-save-devices-state doesn't currently generate a vmdesc, so restore
always triggers "Expected vmdescription section, but got 0".  This is
not a problem when restore comes from a file.  However, when QEMU runs
in a linux stubdom and comes over a console, EOF is not received.  This
causes a delay restoring - though it does restore.

Setting suppress-vmdesc skips looking for the vmdesc during restore and
avoids the wait.

The other approach would be generate a vmdesc in qemu_save_device_state.
Since COLO shared that function, and the vmdesc is just discarded on
restore, we choose to skip it.

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/i386/pc_piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3c2ae0612b..0cf22a57ad 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -987,7 +987,7 @@ static void xenfv_4_2_machine_options(MachineClass *m)
     pc_i440fx_4_2_machine_options(m);
     m->desc = "Xen Fully-virtualized PC";
     m->max_cpus = HVM_MAX_VCPUS;
-    m->default_machine_opts = "accel=xen";
+    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
 }
 
 DEFINE_PC_MACHINE(xenfv_4_2, "xenfv-4.2", pc_xen_hvm_init,
@@ -999,7 +999,7 @@ static void xenfv_3_1_machine_options(MachineClass *m)
     m->desc = "Xen Fully-virtualized PC";
     m->alias = "xenfv";
     m->max_cpus = HVM_MAX_VCPUS;
-    m->default_machine_opts = "accel=xen";
+    m->default_machine_opts = "accel=xen,suppress-vmdesc=on";
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv-3.1", pc_xen_hvm_init,
-- 
2.25.1


