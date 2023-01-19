Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D500C6739D3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481034.745714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUoq-0000KZ-TP; Thu, 19 Jan 2023 13:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481034.745714; Thu, 19 Jan 2023 13:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUoq-0000Io-Ot; Thu, 19 Jan 2023 13:19:04 +0000
Received: by outflank-mailman (input) for mailman id 481034;
 Thu, 19 Jan 2023 13:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qhaF=5Q=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pIUol-0008EL-6B
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:19:03 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d20eb649-97fb-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 14:18:56 +0100 (CET)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E2B871EC0691;
 Thu, 19 Jan 2023 14:18:52 +0100 (CET)
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
X-Inumbo-ID: d20eb649-97fb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1674134333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=KQnyLQfK7qJC86oYK37cAQ7hek4siDxOAmRxTyQrFa0=;
	b=PZtimvQkqlW/cJilj6IlzV376vPd6z0Ph1rqtUb3ByHCk/BeQkmicHqrBF+DY+kYjExKTd
	WSM2lsHs//3WaJrIcjFy2fnI+Sc3ZkLWm9cCgQBuq1ytKkWulN3q2Fnry/oCuZunWxvxgd
	HNIOXbeTbVZCwhjTV29fcAxtjneo6X0=
Date: Thu, 19 Jan 2023 14:18:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Peter Zijlstra <peterz@infradead.org>,
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 2/7] x86/boot: Delay sev_verify_cbit() a bit
Message-ID: <Y8lDN73cNOmNuciV@zn.tnic>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.649204101@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230116143645.649204101@infradead.org>

On Mon, Jan 16, 2023 at 03:25:35PM +0100, Peter Zijlstra wrote:
> Per the comment it is important to call sev_verify_cbit() before the
> first RET instruction, this means we can delay calling this until more

Make that "... this means that this can be delayed until... "

And I believe this is not about the first RET insn but about the *next* RET
which will pop poisoned crap from the unencrypted stack and do shits with it.

Also, there's this over sev_verify_cbit():

 * sev_verify_cbit() is called before switching to a new long-mode page-table
 * at boot.

so you can't move it under the

	movq    %rax, %cr3

Looking at this more, there's a sme_enable() call on the BSP which is already in
C.

So, can we do that C-bit verification once on the BSP, *in C* which would be a
lot easier, and be done with it?

Once it is verified there, the bit is the same on all APs so all good.

Right?

joro?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

