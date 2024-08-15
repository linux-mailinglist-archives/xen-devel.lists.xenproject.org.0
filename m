Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FED953E19
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 01:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778309.1188374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sekHA-0001HL-UM; Thu, 15 Aug 2024 23:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778309.1188374; Thu, 15 Aug 2024 23:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sekHA-0001Ex-RE; Thu, 15 Aug 2024 23:53:04 +0000
Received: by outflank-mailman (input) for mailman id 778309;
 Thu, 15 Aug 2024 23:53:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0f6=PO=hack.org=omni@srs-se1.protection.inumbo.net>)
 id 1sekHA-0001EY-3x
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 23:53:04 +0000
Received: from mail.hack.org (mail.hack.org [2a03:1b20:1:f203::2:3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81fdb4ca-5b61-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 01:53:02 +0200 (CEST)
Received: from authenticated user by mail.hack.org 
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 23:53:01 +0000
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
X-Inumbo-ID: 81fdb4ca-5b61-11ef-a505-bb4a2ccca743
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Aug 2024 23:53:00 +0000
Message-Id: <D3GW1J7SK5O4.2RRN5IZG3B3M5@hack.org>
Subject: issues building qemu-xen (8.0.4) with musl 1.2.5 and gcc 14
From: "omni" <omni+xen-devel@hack.org>
To: <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2

Hi list!

Trying to apply patches to our xen aport I found issues building
tools/qemu-xen (qemu 8.0.4) with musl 1.2.5 and gcc 14 for the
alpinelinux rolling release branch "edge".

The insignificantly different build for our latest stable release,
3.20-stable with musl 1.2.5 but gcc 13.2.1_git20240309, seems to work
fine.

I also tried a rebuild of our separate qemu aport, at version 9.0.2, in
edge, as that had had no rebuild since the gcc upgrade, and it went
fine.


Please see my build attempts and CI pipeline outputs in our gitlab,

  https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/70515

Patching tools/qemu-xen/hw/vfio/pci.c with #include <libgen.h> made
builds succeed for aarch64 & armv7 but x86_64 ran into other issues.


Issue referenced in above MR,

  https://gitlab.alpinelinux.org/alpine/aports/-/issues/16106

musl change referenced in above issue,

  https://git.musl-libc.org/cgit/musl/commit/?id=3D725e17ed6dff4d0cd22487bb=
64470881e86a92e7

The latest qemu releases are 8.2.6 and 9.0.2, both released 240716,

  https://www.qemu.org/download/


cheers
--=20
omni

