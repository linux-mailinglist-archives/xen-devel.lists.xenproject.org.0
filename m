Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27CA73409
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929395.1332032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnzI-0001ug-G8; Thu, 27 Mar 2025 14:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929395.1332032; Thu, 27 Mar 2025 14:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnzI-0001rb-DX; Thu, 27 Mar 2025 14:13:40 +0000
Received: by outflank-mailman (input) for mailman id 929395;
 Thu, 27 Mar 2025 14:13:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRC/=WO=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1txnzH-0001rV-Aa
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:13:39 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad5bea3a-0b15-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 15:13:38 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7064A40E0219; 
 Thu, 27 Mar 2025 14:13:36 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JzESrgo2KtC2; Thu, 27 Mar 2025 14:13:32 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4A83340E021F;
 Thu, 27 Mar 2025 14:13:23 +0000 (UTC)
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
X-Inumbo-ID: ad5bea3a-0b15-11f0-9ea3-5ba50f476ded
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743084811; bh=woRVz5b4vp99dk/fbV1QOQUcl24nf2AjIPWa1aaxd0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2BwqpaAefmKroUo0u/yYcpl3m6+7C/LtS8QAzwOw8jzvwtGaKStmmuY4dZT0fhMl
	 gT4wSODMdukb0m7c/VpcQPbIs0LnC/19oeSaNyh2f3Il/nFt7tF5HeehZeiR5/3UJz
	 BcoMZ1+93ftyZv3PRa0Z/f1qccHgoaNHHBuCG3Tf+zsasYCsM+t7BHPQXHw6zbhlC5
	 rE4jpNDdCl00L6mo0busdZc5mz4yUgvYdaH3jWKAcrbBh/yShm3nzgg8GmDH3dzUi4
	 KnkNAg2fbTNgHGG/Yv6kJB5YtICDIMAb17jnJmcfuJ1F5E21NCd3b4x+BXQ89QpWxa
	 y6crmGTCZ4NNSOZY3F9q4CKUEfmemIbsFwcPeag47tcxem+YfQE0DpZQtCdHW8HS9J
	 AAakGcdqooI8IiEdjZyzwxKFuwOgGvLAJst7oAEF8iLl37xPr/5q0amYmN/25xHQhX
	 liEeI0CdkLFrFHuHZoYuoHSwAyDdGVoMGyF5hNqerDgqsDsRb72iKMbDYHkQImUC3U
	 S5E9wFIy2sMlRrfHbNXUab+CZ590OH7QTDysrsndYqS1U8u+ANHv57qWCY+K/bGBif
	 dHkM04vfrj2+KXO3H25RM2xNew27ZAFRZ9p0rkHA6Lqod609xvvuQLyEn31WRxtXsw
	 rl9577ZmzLF6CJHNfppnSZQg=
Date: Thu, 27 Mar 2025 15:13:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	kernel test robot <lkp@intel.com>, x86-ml <x86@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
Message-ID: <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 11:55:39AM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> I'd prefer a general way to handle this problem, like e.g. some kind of
> __refdata tagging for percpu variables.

Any reason for not doing the trivial thing?

diff --git a/arch/x86/xen/multicalls.c b/arch/x86/xen/multicalls.c
index 10c660fae8b3..100bfaba3f4d 100644
--- a/arch/x86/xen/multicalls.c
+++ b/arch/x86/xen/multicalls.c
@@ -53,7 +53,7 @@ struct mc_debug_data {
 };
=20
 static DEFINE_PER_CPU(struct mc_buffer, mc_buffer);
-static struct mc_debug_data mc_debug_data_early __initdata;
+static struct mc_debug_data mc_debug_data_early;
 static DEFINE_PER_CPU(struct mc_debug_data *, mc_debug_data) =3D
 	&mc_debug_data_early;
 static struct mc_debug_data __percpu *mc_debug_data_ptr;

---

since this breaks randbuilds:

WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0=
x0 (section: .data) -> mc_debug_data_early (section: .init.data)
ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy to allow them.
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[2]: *** Deleting file 'Module.symvers'
make[1]: *** [/mnt/kernel/kernel/linux/Makefile:1947: modpost] Error 2
make: *** [Makefile:251: __sub-make] Error 2

?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

