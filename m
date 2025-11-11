Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11588C4EFFF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 17:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159088.1487487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6G-0002AI-6j; Tue, 11 Nov 2025 16:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159088.1487487; Tue, 11 Nov 2025 16:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIr6G-00027t-3Q; Tue, 11 Nov 2025 16:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1159088;
 Tue, 11 Nov 2025 16:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vIr6E-00027n-H7
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 16:20:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 480d5dff-bf1a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 17:20:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C55521CE5;
 Tue, 11 Nov 2025 16:20:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BF0214A47;
 Tue, 11 Nov 2025 16:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tYE6ATJiE2k/DQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 11 Nov 2025 16:20:02 +0000
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
X-Inumbo-ID: 480d5dff-bf1a-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TXYSHdawEHsmAGrSuze4VfCWTtsO74yLxzbTMsz6XcM=;
	b=AU65P3BxWF54Au3Kya+Xi2n94jCp9F7Gs4l+DqAztevlIYHQY1NDYHnJTWVGLjk1b7Mz7Y
	XBJQ6Uozr/81bv56iYzTToFyP8C8VlzZzxeILcwa8i6L89jPOAWUEk7Jwrgsizdy9F/VXW
	tbhkMfWEeW+PjCrGuigAJM7X4eMxLMc=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BZAFoQz+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762878002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TXYSHdawEHsmAGrSuze4VfCWTtsO74yLxzbTMsz6XcM=;
	b=BZAFoQz+MzPpyyg+eNf7+YW91Z9S02jRb422qIbTaiD91QaM4kJHdk9+lipcl5sAVsIHuK
	w0yQX+yRkv6VrGWdatiDah/oHuvwYMFy39aZ/wXHnq5YWovy6AjE5I9DUEYkzaUS1dJ0ML
	2PCZyw/YrLl6RACMdN5OmVw+xY3GGmw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH 0/5] configure: reduce number of files created
Date: Tue, 11 Nov 2025 17:19:54 +0100
Message-ID: <20251111161959.13667-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6C55521CE5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,conf.in:url,xen-watchdog.in:url,pod.in:url,config.mk:url,xendriverdomain.in:url,ml.in:url,xendomains.in:url,launch-xenstore.in:url,vif-setup.in:url];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Instead of creating lots of files during configure, create those
files (where possible) rather at build time. This reduces the need
to run configure when e.g. changing a man page containing a path
defined by the configure run.

Juergen Gross (5):
  config: remove stale definition from Config.mk
  build: add new make pattern for making file from file.src
  docs: rename *.in files to *.src
  config: remove unused paths from config/Paths.mk.in
  tools: rename most *.in files to *.src

 .gitignore                                    |  1 +
 Config.mk                                     | 20 ++++++++++++------
 config/Paths.mk.in                            |  5 -----
 config/Tools-paths.mk.in                      | 10 +++++++++
 docs/Makefile                                 |  8 ++++++-
 docs/configure                                |  7 +------
 docs/configure.ac                             |  9 +-------
 ...pod.in => xl-disk-configuration.5.pod.src} |  0
 ....in => xl-network-configuration.5.pod.src} |  0
 docs/man/{xl.1.pod.in => xl.1.pod.src}        |  0
 .../man/{xl.cfg.5.pod.in => xl.cfg.5.pod.src} |  0
 .../{xl.conf.5.pod.in => xl.conf.5.pod.src}   |  0
 tools/configure                               | 21 ++-----------------
 tools/configure.ac                            | 19 +----------------
 tools/hotplug/FreeBSD/Makefile                |  8 ++++++-
 .../rc.d/{xencommons.in => xencommons.src}    |  0
 ...xendriverdomain.in => xendriverdomain.src} |  0
 tools/hotplug/Linux/Makefile                  | 11 +++++++++-
 ...xencommons.in => sysconfig.xencommons.src} |  0
 ...xendomains.in => sysconfig.xendomains.src} |  0
 .../{xen-watchdog.in => xen-watchdog.src}     |  0
 .../init.d/{xencommons.in => xencommons.src}  |  0
 .../init.d/{xendomains.in => xendomains.src}  |  0
 ...xendriverdomain.in => xendriverdomain.src} |  0
 ...launch-xenstore.in => launch-xenstore.src} |  0
 .../Linux/{vif-setup.in => vif-setup.src}     |  0
 ...common.sh.in => xen-hotplug-common.sh.src} |  0
 .../Linux/{xendomains.in => xendomains.src}   |  0
 tools/hotplug/NetBSD/Makefile                 |  8 ++++++-
 .../rc.d/{xencommons.in => xencommons.src}    |  0
 ...xendriverdomain.in => xendriverdomain.src} |  0
 tools/hotplug/common/Makefile                 |  5 ++++-
 .../{hotplugpath.sh.in => hotplugpath.sh.src} |  0
 tools/ocaml/libs/xs/Makefile                  |  7 +++++++
 .../libs/xs/{paths.ml.in => paths.ml.src}     |  0
 tools/ocaml/xenstored/Makefile                |  7 ++++++-
 ...oxenstored.conf.in => oxenstored.conf.src} |  0
 .../xenstored/{paths.ml.in => paths.ml.src}   |  0
 38 files changed, 78 insertions(+), 68 deletions(-)
 create mode 100644 config/Tools-paths.mk.in
 rename docs/man/{xl-disk-configuration.5.pod.in => xl-disk-configuration.5.pod.src} (100%)
 rename docs/man/{xl-network-configuration.5.pod.in => xl-network-configuration.5.pod.src} (100%)
 rename docs/man/{xl.1.pod.in => xl.1.pod.src} (100%)
 rename docs/man/{xl.cfg.5.pod.in => xl.cfg.5.pod.src} (100%)
 rename docs/man/{xl.conf.5.pod.in => xl.conf.5.pod.src} (100%)
 rename tools/hotplug/FreeBSD/rc.d/{xencommons.in => xencommons.src} (100%)
 rename tools/hotplug/FreeBSD/rc.d/{xendriverdomain.in => xendriverdomain.src} (100%)
 rename tools/hotplug/Linux/init.d/{sysconfig.xencommons.in => sysconfig.xencommons.src} (100%)
 rename tools/hotplug/Linux/init.d/{sysconfig.xendomains.in => sysconfig.xendomains.src} (100%)
 rename tools/hotplug/Linux/init.d/{xen-watchdog.in => xen-watchdog.src} (100%)
 rename tools/hotplug/Linux/init.d/{xencommons.in => xencommons.src} (100%)
 rename tools/hotplug/Linux/init.d/{xendomains.in => xendomains.src} (100%)
 rename tools/hotplug/Linux/init.d/{xendriverdomain.in => xendriverdomain.src} (100%)
 rename tools/hotplug/Linux/{launch-xenstore.in => launch-xenstore.src} (100%)
 rename tools/hotplug/Linux/{vif-setup.in => vif-setup.src} (100%)
 rename tools/hotplug/Linux/{xen-hotplug-common.sh.in => xen-hotplug-common.sh.src} (100%)
 rename tools/hotplug/Linux/{xendomains.in => xendomains.src} (100%)
 rename tools/hotplug/NetBSD/rc.d/{xencommons.in => xencommons.src} (100%)
 rename tools/hotplug/NetBSD/rc.d/{xendriverdomain.in => xendriverdomain.src} (100%)
 rename tools/hotplug/common/{hotplugpath.sh.in => hotplugpath.sh.src} (100%)
 rename tools/ocaml/libs/xs/{paths.ml.in => paths.ml.src} (100%)
 rename tools/ocaml/xenstored/{oxenstored.conf.in => oxenstored.conf.src} (100%)
 rename tools/ocaml/xenstored/{paths.ml.in => paths.ml.src} (100%)

-- 
2.51.0


