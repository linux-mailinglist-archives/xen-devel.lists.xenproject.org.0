Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD5C80D02
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 14:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171067.1496083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWn2-00074k-Ik; Mon, 24 Nov 2025 13:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171067.1496083; Mon, 24 Nov 2025 13:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNWn2-00072p-Fu; Mon, 24 Nov 2025 13:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1171067;
 Mon, 24 Nov 2025 13:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9RL=6A=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vNWn1-00072j-9q
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 13:39:35 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 005638de-c93b-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 14:39:29 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 33F8C40E016C; 
 Mon, 24 Nov 2025 13:39:27 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dUX_2TyVOwvg; Mon, 24 Nov 2025 13:39:23 +0000 (UTC)
Received: from zn.tnic (p57969402.dip0.t-ipconnect.de [87.150.148.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 4C08F40E015B; Mon, 24 Nov 2025 13:38:59 +0000 (UTC)
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
X-Inumbo-ID: 005638de-c93b-11f0-980a-7dc792cee155
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763991561; bh=xMHHbvFeagw1OXMRREZidPFJD/S6z/TheDKCK1dG36Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifXA1bY3AIdKdV1RAnJe9hR1HoTJK2HQxoKq4XpkqyoEZF0P+j1J+7ZcN7rBWUDcm
	 oYIJpyHEwvEgbBhN4SUbwy9M3rPtz8mZ9KIHA+4XWKlZM9sJg4Netd7by8HO/WfwU+
	 izUQ49pOfE2WCVKQEme59LDaN1qKCPhLWMfPc9dqBXeYjNNbtk4PEeDe4UKe8r3jcX
	 cGgQWdXyE14McksoYKJh8aEd3dTE+0KDYzV2heqjB5matuLT2+0zE2pfxQlwvNiTjo
	 /IEVNfKmQgtVmArwa//GOT0te7zCWkVDbmmzyyFyrHqtrPyJNxOw485KFnaoXcBoHR
	 VXZDdCWu7U72JPGhB3GL4+0WjVSu5w57ooBqcfE6Y0VkGE1VlprxFjxUH5acKEERbH
	 VfQSlXVSFmv6+ISkviWPAt+y481hRdqsTVQxNnzVyAQthZpHMmlvDjFGUeDrY5OeUh
	 xgGDNbXeLdQBp+FbNXuYLrpUp9WEv6YKuJec/ShIgGMUZrIFh/N/cV3lLIrV3Kq7TW
	 2LeL5VLaje2ETKAQfBeqVSK6ALMPmXJr4dKdD/ORNUCXoOtytmAO8sJb2/JPTs9BuI
	 kYDPV8yWq0yD6+ZWREKiz8EOBe8+QAIHM8A+OVhvh+bLylBPTIo1lBQIKyu0MJXEcM
	 vakOICMeaSVGLRtHz7pTfGAY=
Date: Mon, 24 Nov 2025 14:38:58 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>, Jiri Kosina <jikos@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/21] x86/paravirt: Remove not needed includes of
 paravirt.h
Message-ID: <20251124133858.GFaSRf8rU6w3Tf3wU_@fat_crate.local>
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251006074606.1266-2-jgross@suse.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2025 at 09:45:46AM +0200, Juergen Gross wrote:
> In some places asm/paravirt.h is included without really being needed.

Except they are:

$ make allnoconfig
$ rebuild-kernel.sh
...

arch/x86/kernel/x86_init.c:90:43: error: =E2=80=98default_banner=E2=80=99=
 undeclared here (not in a function)
   90 |                 .banner                 =3D default_banner,
      |                                           ^~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:287: arch/x86/kernel/x86_init.o] Err=
or 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:556: arch/x86/kernel] Error 2
make[2]: *** [scripts/Makefile.build:556: arch/x86] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/mnt/kernel/kernel/linux/Makefile:2010: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

