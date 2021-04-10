Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E5635B0BE
	for <lists+xen-devel@lfdr.de>; Sun, 11 Apr 2021 01:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108313.206755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVMgb-0004VR-Qy; Sat, 10 Apr 2021 23:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108313.206755; Sat, 10 Apr 2021 23:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVMgb-0004V4-O4; Sat, 10 Apr 2021 23:06:41 +0000
Received: by outflank-mailman (input) for mailman id 108313;
 Sat, 10 Apr 2021 22:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xeDn=JH=riomar.se=rio@srs-us1.protection.inumbo.net>)
 id 1lVLgM-0007JW-R6
 for xen-devel@lists.xenproject.org; Sat, 10 Apr 2021 22:02:23 +0000
Received: from mail2.riocities.com (unknown [185.20.14.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95b62e62-5752-45d3-9f36-e11efb81c752;
 Sat, 10 Apr 2021 22:02:20 +0000 (UTC)
Received: from mail.riomar.se (81-230-197-241-no510.tbcn.telia.com
 [81.230.197.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail2.riocities.com (Postfix) with ESMTPSA id D7B5E400B5
 for <xen-devel@lists.xenproject.org>; Sun, 11 Apr 2021 00:02:17 +0200 (CEST)
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
X-Inumbo-ID: 95b62e62-5752-45d3-9f36-e11efb81c752
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=riomar.se; s=mail;
	t=1618092137; bh=7oSfkiSpfwPyOthiX+jYRy0ge68CkN7LC5SfzMRPy1c=;
	h=Date:From:To:Subject:From;
	b=2J721FgHQnL9kPQYLVPGzw+PMV97PuXQC+9UK308HzWqoB7Ahf6YHcAl7iiRdrtwp
	 wK5AYOi35GrJ7A+mXT5WzFk3b+upHsQEyAQ3r8qKp59+67o/ZK49trAbOzJpX5opyy
	 aXXo2Kwjhdz6vEyWRXysXW/ynfmeSvokbjEn3Qpg=
Date: Sun, 11 Apr 2021 00:02:15 +0200
From: Henrik Riomar <rio@riomar.se>
To: xen-devel@lists.xenproject.org
Subject: xenstore utils dropped support for -s in 4.15
Message-Id: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

In Alpine and Debian (probably elsewhere as well), the -s flag removed in these two commits:
 * https://github.com/xen-project/xen/commit/fa06cb8c38832aafe597d719040ba1d216e367b8
 * https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036ec2862a4b4bd34ea4f
is actually used in the init scripts.

On one of the systems I tested 4.15 on things just hangs due to this:
2222  open("/lib/libxentoolcore.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
2222  open("/usr/local/lib/libxentoolcore.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
2222  open("/usr/lib/libxentoolcore.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
2222  fcntl(3, F_SETFD, FD_CLOEXEC)     = 0
2222  fstat(3, {st_mode=S_IFREG|0755, st_size=14072, ...}) = 0
2222  read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\20\0\0\0\0\0\0"..., 960) = 960
2222  mmap(NULL, 20480, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9925c02000
2222  mmap(0x7f9925c03000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x1000) = 0x7f9925c03000
2222  mmap(0x7f9925c04000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x7f9925c04000
2222  mmap(0x7f9925c05000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x7f9925c05000
2222  close(3)                          = 0
2222  mprotect(0x7f9925c0f000, 4096, PROT_READ) = 0
2222  mprotect(0x7f9925ca6000, 4096, PROT_READ) = 0
2222  mprotect(0x7f9925c05000, 4096, PROT_READ) = 0
2222  mprotect(0x5601e65dc000, 4096, PROT_READ) = 0
2222  stat("/var/run/xenstored/socket", 0x7ffd95b9f080) = -1 ENOENT (No such file or directory)
2222  access("/dev/xen/xenbus", F_OK)   = 0
2222  stat("/dev/xen/xenbus", {st_mode=S_IFCHR|0600, st_rdev=makedev(0xa, 0x3e), ...}) = 0
2222  open("/dev/xen/xenbus", O_RDWR|O_LARGEFILE) = 3
2222  rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9925c59c4b}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
2222  write(3, "\2\0\0\0\0\0\0\0\0\0\0\0\2\0\0\0", 16) = 16
2222  write(3, "/\0", 2)                = 2
2222  read(3, 

Reverting the two commits mentioned above restores a booting system.

The -s flag was introduced in 2005 or so, so I guess you can say that dropping it should
at least be mentioned in the release notices, and an alternative be described, or
-s functionally should be brought back.

Thanks,
 Henrik

How its used in Debian:
https://salsa.debian.org/xen-team/debian-xen/-/blob/master/debian/xen-utils-common.xen.init#L246

How its used in Alpine:
https://git.alpinelinux.org/aports/tree/main/xen/xenstored.initd#n25

