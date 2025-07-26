Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B62B12C83
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 23:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059613.1426400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufm2E-0003Um-1m; Sat, 26 Jul 2025 21:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059613.1426400; Sat, 26 Jul 2025 21:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufm2D-0003Sf-UY; Sat, 26 Jul 2025 21:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1059613;
 Sat, 26 Jul 2025 21:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+vUE=2H=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ufm2C-0003SZ-7q
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 21:02:24 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d276d670-6a63-11f0-a31e-13f23c93f187;
 Sat, 26 Jul 2025 23:02:22 +0200 (CEST)
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
X-Inumbo-ID: d276d670-6a63-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753563740; x=1753822940;
	bh=2Og3BUw8esFd5v+wyc3hdPJbOVuPhdpvOGGkf+wJQ1U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=E8F+45q1nkP4Ls9k2nHUCdwjCwxM+hXM+f25e2H/kHJV7q0TsLa4bMlNBpTXsg0lF
	 tSyuoG3aPj4pczep8FQfalctcw+qT91tdcNisRfQYYs9kP3h37kL/X1yVEjLbABK5X
	 ork3pdCQGskqNrdIit1BX0iRhHxljRQRYcpxrC0hZSTydIq7dimR2pKAkIXoOeK2A6
	 7AzdLTssvruJNfUu29OL2UUOXnR4d8/2Tqfk8nhMilfFR37+/1avgQ4+5jk2QAtOQp
	 LfDizvkaO6sFmg0QPR43/7fgR/QXlJJOInzafjfIBr2nrbwnw/07FAYmyPAihy2cwP
	 dicJMrMM3A1VA==
Date: Sat, 26 Jul 2025 21:02:17 +0000
To: Mykola Kvach <xakep.amatop@gmail.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2] systemd: Add hooks to stop/start xen-watchdog on suspend/resume
Message-ID: <aIVCVTwUsTD4Y6BV@kraken>
In-Reply-To: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
References: <b44966513abc729f44795c0d5012e1c5fd106477.1752783296.git.mykola_kvach@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 82bb6ac7d02e425ac8dd2ba79bc2683662d23a02
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 11:16:58PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
>  $(XEN_SYSTEMD_MODULES):
>  =09rm -f $@.tmp
> diff --git a/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh b/tools/ho=
tplug/Linux/systemd/xen-watchdog-sleep.sh
> new file mode 100644
> index 0000000000..e9bdadc8fa
> --- /dev/null
> +++ b/tools/hotplug/Linux/systemd/xen-watchdog-sleep.sh
> @@ -0,0 +1,34 @@
> +#!/bin/sh

Is there chance to add `set -e` to harden the error path?

With that correction, please consider:

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20


