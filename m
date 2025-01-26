Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38836A1C643
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 04:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877145.1287312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbtn4-0008S0-P0; Sun, 26 Jan 2025 03:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877145.1287312; Sun, 26 Jan 2025 03:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbtn4-0008Ov-In; Sun, 26 Jan 2025 03:58:30 +0000
Received: by outflank-mailman (input) for mailman id 877145;
 Sun, 26 Jan 2025 03:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7wu=US=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1tbtn3-0008Op-1k
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 03:58:29 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb8d46b0-db99-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 04:58:26 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5E28F40E01B5; 
 Sun, 26 Jan 2025 03:58:25 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id y75T0S7EQHDo; Sun, 26 Jan 2025 03:58:22 +0000 (UTC)
Received: from [127.0.0.1] (unknown [80.149.170.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
 (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3ED3440E0184;
 Sun, 26 Jan 2025 03:58:10 +0000 (UTC)
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
X-Inumbo-ID: cb8d46b0-db99-11ef-99a4-01e77a169b0f
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1737863902; bh=woGi95NGqawPIGfJu5X+xepXMktzRhoBJFKUJXaLcng=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ISHqoIknkR9Zd/YmmJz0vN7TkQMQC9P030806gdBTm3VQnzKcptv6QTpNBSkASYKC
	 ZN468UNcsR35mnqBygK1Uuiyqs92GNhv/6CGP6T8YvrZArptVBG9l/pNb664BviboG
	 l3eAP07Jq/HQBoY2T0Zfi864B8jx17LwG3lHubtKiKBL6pih7ufFuC0sRC4BdX+PWc
	 NwE62JCg4djbuOjrIrqa2YalnxjwCDRQquPSgPpMEHyTE8rW+gfY2fmrldfyYSSIRF
	 jSBk90L2UHXmdY/8e2/u+puU6gygXj2H74a/vrThicalaBbU+gvcBWBwKXmgMxQGY2
	 AHOPXUSWW9zgSRi/DLFiGFUjzGmTDSQ4iYEzO0BVm8RX60kqpHI7ISJ7tVFFXNEFhA
	 S7z4VQ0+jhNC8WuWrmgw3ukRvJ3FgUihvLkFoLNT3+HToJpr3fPuTVZzfAtv1EClqA
	 Tem1ipCZbdSw9mz5HjrffxI9zjmD2G70sX/RsWznnP88BWf4KGYhjcJNX8mNSnZQOC
	 bWeXhqNB7R45y+7Dseq85yi1qiUODYV4QutPpdZBzBSuaRG6a4IJBH1PgsoOefXYjh
	 Wel5Vb1m1lVDqx+H2N1Ie3bel0IXQPAPqD6wCNclxd++olu8lRMNpDa15VZzJDFCg1
	 9Y/kjXp6K5PDg9h4lmNhKOF8=
Date: Sun, 26 Jan 2025 04:57:22 +0100
From: Borislav Petkov <bp@alien8.de>
To: Brian Gerst <brgerst@gmail.com>
CC: linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_04/15=5D_x86/pvh=3A_Use_fi?=
 =?US-ASCII?Q?xed=5Fpercpu=5Fdata_for_early_boot_GSBASE?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMzpN2jqOb1jC6ZYxa+1Xw-EXuDXUrGT9_7Gv0FL+XJxTXvC5g@mail.gmail.com>
References: <20250123190747.745588-1-brgerst@gmail.com> <20250123190747.745588-5-brgerst@gmail.com> <20250125150658.GAZ5T-EloWfjZAwJdU@renoirsky.local> <CAMzpN2jqOb1jC6ZYxa+1Xw-EXuDXUrGT9_7Gv0FL+XJxTXvC5g@mail.gmail.com>
Message-ID: <85E9A42F-EB78-4F82-9099-B01A18CA16D2@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 25, 2025 5:51:29 PM GMT+01:00, Brian Gerst <brgerst@gmail=2Ecom>=
 wrote:
>To be fair, this was a copy of an existing comment=2E  Is there a style
>guide where all these grammar rules are documented, so I don't have to
>keep resending these patches for trivial typos?

You don't have to keep resending them for trivial typos - you simply wait =
1-2 weeks to gather review feedback, you incorporate it and send a new vers=
ion of the set=2E Like it is usually done on lkml=2E I think you know how t=
he process works=2E=2E=2E


--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 

