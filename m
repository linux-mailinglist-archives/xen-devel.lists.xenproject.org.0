Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898A23CA45
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 13:30:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Hbd-0003vV-IC; Wed, 05 Aug 2020 11:29:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CKEr=BP=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k3Hbc-0003vQ-AJ
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 11:29:12 +0000
X-Inumbo-ID: dd690e3c-6293-47a5-b888-18ed8a6e535b
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd690e3c-6293-47a5-b888-18ed8a6e535b;
 Wed, 05 Aug 2020 11:29:10 +0000 (UTC)
Date: Wed, 05 Aug 2020 11:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596626949;
 bh=dgDV22qnACp8c/A+YHwl5V7sEd5nX62SR1yvllPcpcA=;
 h=Date:To:From:Reply-To:Subject:From;
 b=GQ/x7t88fw7zTil4ppLRAfUD2ZQSbuu/5Sx/jIYg2a3R2Xa5N11jDrl5o7dLfHWrd
 fL7zlK/k9Kh3ZNgMxCDAVv1/HsFrYAfHJd76JV7qU8jvmSvmaBLhnkMOX+ssmIVUTg
 pyveEDdNzeze+oJ4CHk7c8QyRdyULQBLLW3ENAaE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: Unified Xen executable for UEFI Secure Boot support
Message-ID: <mFb-G5X8XaNz-i_kdJKwVPYaZxrnQJj52XN6TiXVR_Y02k-6ozrOhVqBePpiev8UNy6Koe-aXWxAvzcnQq2Ur_0LsIqhgYBR4qupMhnN5GY=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I have preliminary patches to support bundling the Xen hypervisor, xen.cfg,=
 the Linux kernel, initrd and XSM into a single "unified" EFI executable th=
at can be signed by sbsigntool for verification by UEFI Secure Boot.  It is=
 inspired by systemd-boot's unified kernel technique and borrows the functi=
on to locate PE sections from systemd's LGPL'ed code.

The configuration, kernel, etc are added after building using objcopy to ad=
d named sections for each input file.  This allows an administrator to upda=
te the components independently without requiring rebuilding xen. During EF=
I boot, Xen looks at its own loaded image to locate the PE sections and, if=
 secure boot is enabled, only allows use of the unified components.

The resulting EFI executable can be invoked directly from the UEFI Boot Man=
ager, removing the need to use a separate loader like grub. Unlike the shim=
 based verification, the signature covers the entire Xen+config+kernel+init=
rd unified file. This also ensures that properly configured platforms will =
measure the entire runtime into the TPM for unsealing secrets or remote att=
estation.

I've tested it on qemu OVMF with Secure Boot enabled, as well as on real Th=
inkpad hardware.  The EFI console is very slow, although it works and is ab=
le to boot into dom0.

The current patch set is here, and I'd appreciate suggestions on the techni=
que or cleanup for submission:
https://github.com/osresearch/xen/tree/secureboot

--
Trammell

