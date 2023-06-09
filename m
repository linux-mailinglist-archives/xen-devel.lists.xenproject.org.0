Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1164729DB2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546106.852723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7dcY-0002vy-9V; Fri, 09 Jun 2023 15:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546106.852723; Fri, 09 Jun 2023 15:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7dcY-0002ta-6V; Fri, 09 Jun 2023 15:01:46 +0000
Received: by outflank-mailman (input) for mailman id 546106;
 Fri, 09 Jun 2023 15:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NPzv=B5=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q7dcW-0002tU-Pt
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:01:44 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a8cbb38-06d6-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 17:01:42 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 3D6E73F08F;
 Fri,  9 Jun 2023 08:01:39 -0700 (PDT)
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
X-Inumbo-ID: 8a8cbb38-06d6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686322900; bh=gGf3xBZw1bq2aiF9uzm2Kn4g3gEGfeF8irHjU0jGdSs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=A6j/9LZfHyL2/ii4lCGSPrQziw7yLVfU/3RvOgFhzHtVBcCTuwGNkF6KXWx4qdl29
	 U1pjYsoahzKiSjGbmcbe/RR7leXpObM2mmRkpxyaIjN+XxM8+HTwe3mSRr7mVyZ3Bk
	 ai80yifsK9XwV88qiHLc05Kz6uHudB70mI2iaiT/R3mIp3hZO2N9tmLDmkEeHzF3C9
	 4emEQ9jSvr4ihbaZyBM6K0+LutvjYokE+fasXmCLGyUjWkXzsurbwhIll16DWomjmU
	 w+z1oKKRDL1D8OguHR0Egs6aVZamfC6ezQTGnZ5bmdQk36SPe8e0sM6/VFnJ5r7suw
	 KqYIZVZPb7Ecw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 10:01:38 -0500
Message-Id: <CT87KSPVSBUG.2C4SWW2EDTA5Z@Shawns-Mac-mini.lan>
Cc: <tpearson@raptorengineering.com>, "George Dunlap"
 <george.dunlap@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Wei Liu" <wl@xen.org>, "Shawn Anastasio"
 <shawnanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Julien Grall" <julien@xen.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
 <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
 <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org>
In-Reply-To: <bcbab76d-ca8c-0772-3a9f-59fef3a2b5f5@xen.org>

On Fri Jun 9, 2023 at 5:12 AM CDT, Julien Grall wrote:
> Strictly speaking we can refuse any code. That count for license as=20
> well. Anyway, I didn't request a change here. I merely pointed out that=
=20
> any use of GPLv2+ should be justified because on Arm most of the people=
=20
> don't pay attention on the license and pick the one from an existing file=
.

Hi Julien,

The choice of GPLv2+ for many of the files in this patchset was indeed
inherited from old IBM-written Xen code that the files in question were
derived from. I did not realize it was permissible or even desirable to
relicense those to GPLv2-only.

As for the new files, GPLv2+ was chosen to remain consistent and to open
the door for future derivations from GPLv2+ licensed code, either from
the older Xen tree or from the Linux ppc tree, much of which is also
licensed as GPLv2+. If it would reduce friction, these files could be
relicensed to GPLv2-only.

Thanks,
Shawn

