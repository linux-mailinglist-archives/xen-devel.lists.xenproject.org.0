Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D3A71B67
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928054.1330831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFU-00022T-7J; Wed, 26 Mar 2025 16:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928054.1330831; Wed, 26 Mar 2025 16:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTFU-0001zr-3a; Wed, 26 Mar 2025 16:05:00 +0000
Received: by outflank-mailman (input) for mailman id 928054;
 Wed, 26 Mar 2025 16:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Vdm=WN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txTFT-0001z3-7m
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:04:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff4ea1f-0a5c-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 17:04:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A8431F395;
 Wed, 26 Mar 2025 16:04:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 454D71374A;
 Wed, 26 Mar 2025 16:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dn9rD6gl5GcAaQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Mar 2025 16:04:56 +0000
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
X-Inumbo-ID: 0ff4ea1f-0a5c-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kp8xZi9xPjedmkaz5KFhjbrGCNGIxQLdI0SJt0CLi8k=;
	b=SI0NVfPgKLFzhwR9mN8zDpVRTjc2taoCRHpcDj3sJwrwqdw+FgNvHv7+SxS5VaEd2LGcqY
	vuXuoMoHcVqLO2F45NZfIjPnpRVoVI1EvmZx5z3CnrXdx8PssC6Dn9ApZbSuWemKhon8la
	TkH7pJofjKrcVQFHkXNkDexftiUIGKs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1743005096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kp8xZi9xPjedmkaz5KFhjbrGCNGIxQLdI0SJt0CLi8k=;
	b=SI0NVfPgKLFzhwR9mN8zDpVRTjc2taoCRHpcDj3sJwrwqdw+FgNvHv7+SxS5VaEd2LGcqY
	vuXuoMoHcVqLO2F45NZfIjPnpRVoVI1EvmZx5z3CnrXdx8PssC6Dn9ApZbSuWemKhon8la
	TkH7pJofjKrcVQFHkXNkDexftiUIGKs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/6] docs: remove qemu-traditional support from documentation
Date: Wed, 26 Mar 2025 17:04:36 +0100
Message-ID: <20250326160442.19706-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326160442.19706-1-jgross@suse.com>
References: <20250326160442.19706-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

In preparation to no longer support qemu-traditional (including
qemu-stubdom), remove it from documentation.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/man/xl-pci-configuration.5.pod           |  4 +-
 docs/man/xl.cfg.5.pod.in                      | 46 +++-------------
 docs/misc/stubdom.txt                         | 52 -------------------
 docs/misc/xenstore-paths.pandoc               |  2 +-
 docs/process/branching-checklist.txt          |  4 --
 docs/process/release-technician-checklist.txt |  3 --
 docs/process/xen-release-management.pandoc    |  2 +-
 7 files changed, 12 insertions(+), 101 deletions(-)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index ec76f590b7..0691f06ad3 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -111,8 +111,8 @@ if this parameter is not specified.
 =item Description
 
 By default pciback only allows PV guests to write "known safe" values
-into PCI configuration space, likewise QEMU (both qemu-xen and
-qemu-xen-traditional) imposes the same constraint on HVM guests.
+into PCI configuration space, likewise QEMU imposes the same constraint
+on HVM guests.
 However, many devices require writes to other areas of the configuration space
 in order to operate properly.  This option tells the backend (pciback or QEMU)
 to allow all writes to the PCI configuration space of this device by this
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7339c44efd..ccf0c58895 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -895,12 +895,6 @@ is used.
 Specifies the path to the X authority file that should be used to
 connect to the X server when the B<sdl> option is used.
 
-=item B<opengl=BOOLEAN>
-
-Enable OpenGL acceleration of the SDL display. Only effects machines
-using B<device_model_version="qemu-xen-traditional"> and only if the
-device-model was compiled with OpenGL support. The default is 0 (disabled).
-
 =item B<keymap=LANG>
 
 Configure the keymap to use for the keyboard associated with this
@@ -1215,17 +1209,14 @@ working graphics passthrough. See the XenVGAPassthroughTestedAdapters
 L<https://wiki.xenproject.org/wiki/XenVGAPassthroughTestedAdapters> wiki page
 for graphics cards currently supported by B<gfx_passthru>.
 
-B<gfx_passthru> is currently supported both with the qemu-xen-traditional
-device-model and upstream qemu-xen device-model.
+B<gfx_passthru> is currently supported with the upstream qemu-xen device-model.
 
 When given as a boolean the B<gfx_passthru> option either disables graphics
 card passthrough or enables autodetection.
 
 When given as a string the B<gfx_passthru> option describes the type
 of device to enable. Note that this behavior is only supported with the
-upstream qemu-xen device-model. With qemu-xen-traditional IGD (Intel Graphics
-Device) is always assumed and options other than autodetect or explicit IGD
-will result in an error.
+upstream qemu-xen device-model.
 
 Currently, valid values for the option are:
 
@@ -1903,10 +1894,7 @@ it may be useful to request a different one, like UEFI.
 
 =item B<rombios>
 
-Loads ROMBIOS, a 16-bit x86 compatible BIOS. This is used by default
-when B<device_model_version=qemu-xen-traditional>. This is the only BIOS
-option supported when B<device_model_version=qemu-xen-traditional>. This is
-the BIOS used by all previous Xen versions.
+Loads ROMBIOS, a 16-bit x86 compatible BIOS.
 
 =item B<seabios>
 
@@ -1926,8 +1914,7 @@ Override the path to the blob to be used as BIOS. The blob provided here MUST
 be consistent with the B<bios=> which you have specified. You should not
 normally need to specify this option.
 
-This option does not have any effect if using B<bios="rombios"> or
-B<device_model_version="qemu-xen-traditional">.
+This option does not have any effect if using B<bios="rombios">.
 
 =item B<pae=BOOLEAN>
 
@@ -2516,15 +2503,10 @@ Sets the amount of RAM which the emulated video card will contain,
 which in turn limits the resolutions and bit depths which will be
 available.
 
-When using the qemu-xen-traditional device-model, the default as well as
-minimum amount of video RAM for stdvga is 8 MB, which is sufficient for e.g.
-1600x1200 at 32bpp. For the upstream qemu-xen device-model, the default and
-minimum is 16 MB.
+When using stdvga, the default and minimum is 16 MB.
 
-When using the emulated Cirrus graphics card (B<vga="cirrus">) and the
-qemu-xen-traditional device-model, the amount of video RAM is fixed at 4 MB,
-which is sufficient for 1024x768 at 32 bpp. For the upstream qemu-xen
-device-model, the default and minimum is 8 MB.
+When using the emulated Cirrus graphics card (B<vga="cirrus">), the
+default and minimum is 8 MB.
 
 For QXL vga, both the default and minimal are 128MB.
 If B<videoram> is set less than 128MB, an error will be triggered.
@@ -2590,12 +2572,6 @@ B<qemu(1)> manpage. The default is B<en-us>.
 Specifies that the display should be presented via an X window (using
 Simple DirectMedia Layer). The default is (0) not enabled.
 
-=item B<opengl=BOOLEAN>
-
-Enable OpenGL acceleration of the SDL display. Only effects machines
-using B<device_model_version="qemu-xen-traditional"> and only if the
-device-model was compiled with OpenGL support. Default is (0) false.
-
 =item B<nographic=BOOLEAN>
 
 Enable or disable the virtual graphics device.  The default is to
@@ -2925,11 +2901,6 @@ Valid values are:
 Use the device-model merged into the upstream QEMU project.
 This device-model is the default for Linux dom0.
 
-=item B<qemu-xen-traditional>
-
-Use the device-model based upon the historical Xen fork of QEMU.
-This device-model is still the default for NetBSD dom0.
-
 =back
 
 It is recommended to accept the default value for new guests.  If
@@ -2949,8 +2920,7 @@ to specify this option.
 Override the path to the kernel image used as device-model stubdomain.
 The binary provided here MUST be consistent with the
 B<device_model_version> which you have specified.
-In case of B<qemu-xen-traditional> it is expected to be MiniOS-based stubdomain
-image, in case of B<qemu-xen> it is expected to be Linux-based stubdomain
+In case of B<qemu-xen> it is expected to be Linux-based stubdomain
 kernel.
 
 =item B<stubdomain_cmdline="STRING">
diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index 64c220db20..cfcba4ba96 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -23,58 +23,6 @@ and https://wiki.xen.org/wiki/Device_Model_Stub_Domains for more
 information on device model stub domains
 
 
-Toolstack to MiniOS ioemu stubdomain protocol
----------------------------------------------
-
-This section describe communication protocol between toolstack and
-qemu-traditional running in MiniOS stubdomain. The protocol include
-expectations of both qemu and stubdomain itself.
-
-Setup (done by toolstack, expected by stubdomain):
- - Block devices for target domain are connected as PV disks to stubdomain,
-   according to configuration order, starting with xvda
- - Network devices for target domain are connected as PV nics to stubdomain,
-   according to configuration order, starting with 0
- - if graphics output is expected, VFB and VKB devices are set for stubdomain
-   (its backend is responsible for exposing them using appropriate protocol
-   like VNC or Spice)
- - other target domain's devices are not connected at this point to stubdomain
-   (may be hot-plugged later)
- - QEMU command line (space separated arguments) is stored in
-   /vm/<target-uuid>/image/dmargs xenstore path
- - target domain id is stored in /local/domain/<stubdom-id>/target xenstore path
-?? - bios type is stored in /local/domain/<target-id>/hvmloader/bios
- - stubdomain's console 0 is connected to qemu log file
- - stubdomain's console 1 is connected to qemu save file (for saving state)
- - stubdomain's console 2 is connected to qemu save file (for restoring state)
- - next consoles are connected according to target guest's serial console configuration
-
-Startup:
-1. PV stubdomain is started with ioemu-stubdom.gz kernel and no initrd
-2. stubdomain initialize relevant devices
-3. stubdomain signal readiness by writing "running" to /local/domain/<stubdom-id>/device-model/<target-id>/state xenstore path
-4. now stubdomain is considered running
-
-Runtime control (hotplug etc):
-Toolstack can issue command through xenstore. The sequence is (from toolstack POV):
-1. Write parameter to /local/domain/<stubdom-id>/device-model/<target-id>/parameter.
-2. Write command to /local/domain/<stubdom-id>/device-model/<target-id>/command.
-3. Wait for command result in /local/domain/<stubdom-id>/device-model/<target-id>/state (command specific value).
-4. Write "running" back to /local/domain/<stubdom-id>/device-model/<target-id>/state.
-
-Defined commands:
- - "pci-ins" - PCI hot plug, results:
-   - "pci-inserted" - success
-   - "pci-insert-failed" - failure
- - "pci-rem" - PCI hot remove, results:
-   - "pci-removed" - success
-   - ??
- - "save" - save domain state to console 1, results:
-   - "paused" - success
- - "continue" - resume domain execution, after loading state from console 2 (require -loadvm command argument), results:
-   - "running" - success
-
-
 Toolstack to Linux ioemu stubdomain protocol
 --------------------------------------------
 
diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index a604f6b1c6..583e977b65 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -634,7 +634,7 @@ Path in xenstore to the backend, normally
 
 Trustworthy copy of /local/domain/$DOMID/backend/$KIND/$DEVID/$NODE.
 
-#### /libxl/$DOMID/dm-version ("qemu_xen"|"qemu_xen_traditional") = [n,INTERNAL]
+#### /libxl/$DOMID/dm-version ("qemu_xen") = [n,INTERNAL]
 
 The device model version for a domain.
 
diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 3dfa8ec257..9632888a56 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -14,8 +14,6 @@ ov=4.0
     cd ~/git/qemu-xen.git
     git branch staging-$v staging
     git branch stable-$v master
-    cd ~/git/qemu-xen-traditional.git
-    git branch stable-$v master
 
 # make branch in libvirt
     ssh xen@xenbits.xen.org
@@ -63,7 +61,6 @@ ov=4.0
     cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
     cp qemu-xen--master.patchbot-reported-heads  qemu-xen--stable-$v.patchbot-reported-heads
     cp qemu-xen--staging.patchbot-reported-heads  qemu-xen--staging-$v.patchbot-reported-heads
-    cp qemu-xen-traditional--master.patchbot-reported-heads qemu-xen-traditional--stable-$v.patchbot-reported-heads
 
     #emacs versions
     perl -i~ -pe 'next unless m/\b\Q'$ov'\E\b/; $x=$_; $x=~ s/\b\Q'$ov'\E\b/'$v'/g; print $x;' versions
@@ -74,7 +71,6 @@ ov=4.0
 Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are updated.
 The variables and there content should be:
   * QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
-  * QEMU_TRADITIONAL_REVISION: xen-X.Y.0
   * MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0
 Where X.Y is the release version (e.g. 4.17).
 
diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 7bbe7c1489..64ed9fd5b2 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -32,8 +32,6 @@ t=RELEASE-$r
   git show # should show appropriate intended commit
   git-tag -u 'Xen.org Xen tree code signing' -m "Xen $v" xen-$v
 
-  git-push xenbits.xen.org:/home/xen/git/qemu-xen-traditional.git $s:stable-$x xen-$v
-
 # consider making tag in minios, and updating xen.git Config.mk
   git checkout SOMETHING
   git show # should show appropriate intended commit
@@ -58,7 +56,6 @@ t=RELEASE-$r
 
 * change xen-unstable Config.mk
 #   QEMU_UPSTREAM_REVISION,
-#   QEMU_TRADITIONAL_REVISION
 #   MINIOS_UPSTREAM_REVISION
 #     (drop any references to the specific commits, e.g. date or title)
 * change SUPPORT.md heading version number; -unstable or -rc tag
diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
index 7826419dad..5da18f6da1 100644
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -193,7 +193,7 @@ from the last RC:
 
 1. Send out commit moratorium emails to committers@.
 
-2. Check all the trees (mini-os, qemu-trad, qemu-xen, seabios, ovmf etc).
+2. Check all the trees (mini-os, qemu-xen, seabios, ovmf etc).
 They have the correct commits and all security patches applied. There will be
 tools provided.
 
-- 
2.43.0


