Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B017283A2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 17:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545339.851719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7HQi-0004k3-IW; Thu, 08 Jun 2023 15:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545339.851719; Thu, 08 Jun 2023 15:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7HQi-0004hZ-Eq; Thu, 08 Jun 2023 15:20:04 +0000
Received: by outflank-mailman (input) for mailman id 545339;
 Thu, 08 Jun 2023 15:20:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pbGh=B4=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q7HQh-0004Ma-9i
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 15:20:03 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee79bcee-060f-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 17:20:00 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4234C3F08A;
 Thu,  8 Jun 2023 08:19:57 -0700 (PDT)
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
X-Inumbo-ID: ee79bcee-060f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686237597; bh=MEdMrtrEbaXEOTDN5wW9v1iuRb0aqWvv9PeE0L9i3GI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=aPsNXl0gLpgW6RkF5gqseAhubFsHeUdRpP1oHDCByZb/0TFTNN0trc6pub/Ti8+7T
	 Hm5nh3M2WrWoOWQ8D4kS0Z/it/umuiUPFsbJNB/VVvFmSDPcxOafd4yWXhMQ7VZz1q
	 I/BvxkXi7CRildBUDXMNMgKLp7eJeSv76SyxuTInb9AE1RsvzD188Ush6JvDD6/2/k
	 VxyjwZZ1HRT7ViMR5rzOPphtp3N0rf/R6dacV6/9UECnH9iRohNxgtRxLb/U3lmnSR
	 ie1+uMrd8cxLd3zNv0f1vpB37OXQVBYxZoGjvtnoEb9KaYxyUMe6owC2ik0AzVyWmA
	 KRrEaFU3FDRgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jun 2023 10:19:56 -0500
Message-Id: <CT7DC9RIBX68.2VXNC5E8U08TC@Shawns-Mac-mini.lan>
Subject: Re: [PATCH 0/3] Initial support for Power
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: <tpearson@raptorengineering.com>, "George Dunlap"
 <george.dunlap@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Wei Liu" <wl@xen.org>
References: <cover.1686148363.git.shawn@anastas.io>
 <c1e75aaf-407d-6163-b382-b0c984e9db4c@citrix.com>
 <CT6NFAE37O7K.215IO8HD8PTWU@Shawns-Mac-mini.lan>
 <704339f1-4103-62ad-49f8-b7df1fc8b7de@citrix.com>
In-Reply-To: <704339f1-4103-62ad-49f8-b7df1fc8b7de@citrix.com>

On Wed Jun 7, 2023 at 2:30 PM CDT, Andrew Cooper wrote:
> Ok, in which case you probably want a first patch series doing:
>
> 1) New docker container (only - this wants to be taken early and set up
> in CI)
> 2) one-or-more initial build system + head.S infinite loop patch.=C2=A0
> Probably the maintainer patch too.
> 3) Wiring the build(s) into build.yaml
>
> You'll want to join the https://gitlab.com/xen-project/ and I can set
> you up with a place to run the full CI (we have a reasonably custom
> setup which the communal runners don't like).=C2=A0 You may also want to =
hang
> out on oftc.org #xendevel=C2=A0 and/or the matrix bridge thereof.
>
> Then a second patch series doing early printk, and adding the smoke test
> script and wiring it into test.yaml.

Sounds good. I've gone ahead and requested access to that GitLab
organization and will get to work on a series doing the things you've
requested.

P.S. It seems mail from my server is getting rejected by your server, so
I'm unable to respond to you directly. Once I have access to my
corporate email this should be resolved, but until then I'll reach out
to you from a personal email address.

Thanks.

