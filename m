Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F24F0CF0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 01:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298077.507684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nb9al-0007uq-2s; Sun, 03 Apr 2022 23:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298077.507684; Sun, 03 Apr 2022 23:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nb9ak-0007sJ-Vc; Sun, 03 Apr 2022 23:25:06 +0000
Received: by outflank-mailman (input) for mailman id 298077;
 Sun, 03 Apr 2022 23:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FyL=UN=protonmail.ch=mati7337@srs-se1.protection.inumbo.net>)
 id 1nb9aj-0007sD-B1
 for xen-devel@lists.xenproject.org; Sun, 03 Apr 2022 23:25:05 +0000
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49c3b75d-b3a5-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 01:25:03 +0200 (CEST)
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
X-Inumbo-ID: 49c3b75d-b3a5-11ec-8fbc-03012f2f19d4
Date: Sun, 03 Apr 2022 23:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail2; t=1649028302;
	bh=mS02nT2yAqJk/ND+iRkA4kPWNMDk+RpZ4FRHyQjDBAU=;
	h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID;
	b=ZSTw1cCTIPWSYF98H/OMBKgridMh0i4or5az7aH5uv5HT7V5vv0m1fzFmdZnvr7dc
	 k0rTt756+ebOA9VEfehO0VQdhJ/GpsmvLpYnvqMGlSoig6jMMQvCU0y/WnUpeRH+x4
	 Ys4v9bppST3PmtSuOPrIQVc/2a7eHk5mws5p6iuEpo3t3ClujBeQNxT/vTIUiccyw8
	 pLd2EmdTS+srPJq1EVURLGI2K3xEzqCP8hHw5hHeCs4ICZYwn0SBczj5CzXxGnETTS
	 4M45rYX7tTGYW0HxR787pyW8Nd4VJgFfSDCAibt6kNj18HxTVLoYbK+hSw8wt2iEqs
	 XEA5ta96MyJuA==
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Mateusz <mati7337@protonmail.ch>
Reply-To: Mateusz <mati7337@protonmail.ch>
Subject: PCI passthrough: possible bug in memory relocation
Message-ID: <l3LThLG8tkJBvD-3WTxzw6TRrj7GPAN9uWh-AWqzelw75qpdP1ZLXzBV7599MWrjrHH-lRKof3b0jm1DEGrUXLJszgh5hjW25oNtHoTI9Ts=@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello,
I'm working on resolving a bug in Qubes OS. The problem is that
when someone gives a VM too much RAM the GPU passthrough doesn't
work as intended. I think it's because in these cases RAM overlaps
with PCI addresses and memory relocation doesn't work in Xen.

Here are the memory BARs of the GPU I've tried to passthrough:
Memory at f3000000 (32-bit, non-prefetchable) [size=3D16M]
Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
Memory at f0000000 (64-bit, prefetchable) [size=3D32M]

The interesting thing is that in xl dmesg hvmloader prints these
lines:
(d1) Relocating 0xffff pages from 0e0001000 to 187000000 for lowmem MMIO ho=
le
(d1) Relocating 0x1 pages from 0e0000000 to 196fff000 for lowmem MMIO hole
so it looks like it tries to move these pages to a different address
to make space for PCI memory, but for some reason it doesn't work.
Changing TOLUD to 3.5G solves the problem.
I tested it on xen 4.14.3
Here's the issue on github regarding this problem:
https://github.com/QubesOS/qubes-issues/issues/4321

Is it a bug in Xen and fixing it would fix the problem or is there
something I'm missing?
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE0RoD3+S7b5zXZ6lW6IGQZRJEAKsFAmJKKjwACgkQ6IGQZRJE
AKtoDQ/+MQmH72WfmkCzbvpfmzsMW4xWpsx9Q6yZg58eEVv/pT06CC1KD8KUnyN3
ChqBNUQ3W2CZtJG0pJ1eON2wlByFuwnnl67MX0D0oKQQDfEf/oVEUspcXvfdgzR9
vOSqkZTKmZRjKOujrbiyO0Ooyrx7ED8IJE9UcfGzi8OYsYCbRg6vZtMghYoep6c4
w2ho7XLFO0pRjzzO+ZMIWzWJq2yp4H7/8F7QXv57tcszoWCrm/THkM8AGE51ilus
N8S3mlVJM+h2hWpZus9BTxnSULNby80nK3MfWAo6XSTPc/uRo3+NegBhFOFBNkJq
YDC+sbLj9Nr4/4uOKl+lLvg0HBSr/b0qebwE1EAwlj3k9byfFjBHCrf63as7AtO0
AuCE9hFqVE+vM8HPghhvcwzuUywwAljD8kxtvKT73JP/+F7v7PfKr6zMatfGcIMP
LYX7X64dMDsi9ySbjRyWWQFPEYlDKYGFA+88qJQZISQXSykO7QqKxeGpMKL/VUhX
BTLNLa568UReIhOzR5jvzDSl6c2kSxZluKpIuQIRE1iqShnUQPbbykA5zI6NzZOk
L5k/RJuRBYoKh/BWbqZsnLOrkYOltaWmFnHb3PPWNo3bVsQVl0ifkcaEoko6KJ0r
nhbpoieuL7Yn/o3aVLPOI7PP4Qy9LqC47L7h1BsojA75JfeFak8=3D
=3DeUPS
-----END PGP SIGNATURE-----

