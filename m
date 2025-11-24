Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B7C80FE4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171172.1496198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXWv-0004Nu-RO; Mon, 24 Nov 2025 14:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171172.1496198; Mon, 24 Nov 2025 14:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXWv-0004M6-OS; Mon, 24 Nov 2025 14:27:01 +0000
Received: by outflank-mailman (input) for mailman id 1171172;
 Mon, 24 Nov 2025 14:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9RL=6A=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1vNXWu-0004Lh-Mi
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:27:00 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c210e6-c941-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 15:26:59 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F0B2B40E015B; 
 Mon, 24 Nov 2025 14:26:56 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6hd_SPf9teGA; Mon, 24 Nov 2025 14:26:53 +0000 (UTC)
Received: from zn.tnic (p57969402.dip0.t-ipconnect.de [87.150.148.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 3E11C40E0219; Mon, 24 Nov 2025 14:26:29 +0000 (UTC)
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
X-Inumbo-ID: a2c210e6-c941-11f0-9d18-b5c5bf9af7f9
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763994411; bh=K73tGsspNcQNjXp1GDxJaedqiCyrMTjCuAwDj5AV9xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSuvSCTQfki/FSMspTsX0cMA9GJXD7sTek76M8Wwmc3KWHpbfqx0UlPkS4wDDKo3N
	 R627iwOmt/Rq8lnHcBbOup2sF9kyGk/Ft0/Sh/Qes6knQK2EJJDY9flgKZkzH+0WAA
	 o1BTyaYuXffcOHtuFlhtEq+t/nfdgCO323IGpyn4yDsNU8MASjLow4jU9YVvbjq/Qa
	 x3b1t35iN78Od62FRf3PKY7kbNuGVkZU7HINQhBXVnDlDZ3TSKy7l3P/BvX3yDFDh9
	 HzEeFAPhZWk3YTwJbgmz0lyV1OFJox5DVj+uHX274tBrj7HRDDV3LZbXn0H6iUQ0qL
	 I24O1YeKhmcW/pVTn1DTg8KPy5ToVyzf/6FhD8m0DcQ8QRHNYcD1dIKOmKFUiO1wGg
	 Eo+If8ImIJzCrOwQaNulcgK6dYS4/b3FSnrXBOgklacMcQlTdNJ6DvGONFjPaP/71G
	 9s6Wn+RKxqyRlNWwG+qldoaQsNH/RZMxB4xs+KJ2cJ0sqxn2CbIIglgqXLHOu+fLF/
	 wXlUwsTlr6/x6fefNVKq2IeIdXOvfpN3qpo8asYqm9ryZ2jL1LJYTZII/L4y8upkIg
	 Z/YHai85Sp8DD7JdNa55F1/faAJW5EmujlKyyDijIsymtxaexgztuX7WIKQ2cDio5F
	 8XvbZiwJinmT2xvUxk6YpJ3Y=
Date: Mon, 24 Nov 2025 15:26:23 +0100
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
Message-ID: <20251124142623.GGaSRrD-N15vnJY0DJ@fat_crate.local>
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-2-jgross@suse.com>
 <20251124133858.GFaSRf8rU6w3Tf3wU_@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251124133858.GFaSRf8rU6w3Tf3wU_@fat_crate.local>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 02:38:58PM +0100, Borislav Petkov wrote:
> On Mon, Oct 06, 2025 at 09:45:46AM +0200, Juergen Gross wrote:
> > In some places asm/paravirt.h is included without really being needed=
.
>=20
> Except they are:
>=20
> $ make allnoconfig
> $ rebuild-kernel.sh
> ...
>=20
> arch/x86/kernel/x86_init.c:90:43: error: =E2=80=98default_banner=E2=80=99=
 undeclared here (not in a function)
>    90 |                 .banner                 =3D default_banner,
>       |                                           ^~~~~~~~~~~~~~
> make[4]: *** [scripts/Makefile.build:287: arch/x86/kernel/x86_init.o] E=
rror 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:556: arch/x86/kernel] Error 2
> make[2]: *** [scripts/Makefile.build:556: arch/x86] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/mnt/kernel/kernel/linux/Makefile:2010: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2

Before you submit the first 12 next time, please build-test each patch wi=
th:

SMOKE_CONFIGS=3D("allnoconfig" "defconfig" "allmodconfig" "allyesconfig")

and those architectures:

ARCHES=3D('x86_64' 'i386')

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

