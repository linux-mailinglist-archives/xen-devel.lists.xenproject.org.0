Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2961442AEF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 10:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219874.380916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqQS-00036S-KS; Tue, 02 Nov 2021 09:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219874.380916; Tue, 02 Nov 2021 09:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqQS-00034N-HQ; Tue, 02 Nov 2021 09:49:52 +0000
Received: by outflank-mailman (input) for mailman id 219874;
 Tue, 02 Nov 2021 09:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TliJ=PV=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1mhqQR-00034H-2v
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 09:49:51 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f2cb833-dbb8-4ffb-893a-0d4e95c314df;
 Tue, 02 Nov 2021 09:49:49 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f62005f026b777d4e743c.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:6200:5f02:6b77:7d4e:743c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 77C731EC0295;
 Tue,  2 Nov 2021 10:49:48 +0100 (CET)
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
X-Inumbo-ID: 8f2cb833-dbb8-4ffb-893a-0d4e95c314df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1635846588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=8BWnG30MtY0UUhkaiHYGZzY4ggSfKaanZFstlmENNNU=;
	b=KO3JlJSf1mqxUGS6Psivk0XaGEOGXs3CQtOFr13HLmeMhhveiegwU5heaUDIdA1cYGH4CN
	vfUkBS+PpGXP40Z027J8h3H/USqcIiuKjaj850QLvpXh+LYHn9g2ukhmnObmcpVXDNRcjO
	O315g6jdka9sV7Pwm+xuEBnMyYKtT3k=
Date: Tue, 2 Nov 2021 10:49:44 +0100
From: Borislav Petkov <bp@alien8.de>
To: Lai Jiangshan <laijs@linux.alibaba.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>, Peter Anvin <hpa@zytor.com>,
	xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V4 04/50] x86/xen: Add
 xenpv_restore_regs_and_return_to_usermode()
Message-ID: <YYEJuIgQukcDzy1R@zn.tnic>
References: <20211026141420.17138-1-jiangshanlai@gmail.com>
 <20211026141420.17138-5-jiangshanlai@gmail.com>
 <YYD9ohN2Zcy4EdMb@zn.tnic>
 <d4ae23dd-377e-8316-909b-d5bdeacc0904@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4ae23dd-377e-8316-909b-d5bdeacc0904@linux.alibaba.com>

On Tue, Nov 02, 2021 at 05:19:46PM +0800, Lai Jiangshan wrote:
> It will add a 5-byte NOP at the beginning of the native
> swapgs_restore_regs_and_return_to_usermode.

So?

> I avoided adding unneeded code in the native code even if it is NOPs
> and avoided melting xenpv-one into the native one which will reduce
> the code readability.

How does this reduce code readability?!

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index e38a4cf795d9..bf1de54a1fca 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -567,6 +567,10 @@ __irqentry_text_end:
 
 SYM_CODE_START_LOCAL(common_interrupt_return)
 SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
+
+	ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", \
+                X86_FEATURE_XENPV
+
 #ifdef CONFIG_DEBUG_ENTRY
 	/* Assert that pt_regs indicates user mode. */
 	testb	$3, CS(%rsp)

> I will follow your preference since a 5-byte NOP is so negligible in the slow
> path with an iret instruction.

Yes, we do already gazillion things on those entry and exit paths.

> Or other option that adds macros to wrap the ALTERNATIVE.
> RESTORE_REGS_AND_RETURN_TO_USERMODE and
> COND_RESTORE_REGS_AND_RETURN_TO_USERMODE (test %eax before jmp in native case)

No, the main goal is to keep the asm code as readable and as simple as
possible.

If macros or whatever need to be added, there better be a good reason
for them. Saving a NOP is not one of them.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

