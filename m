Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17EA675EE7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 21:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482160.747533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIy0g-0007WY-Ep; Fri, 20 Jan 2023 20:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482160.747533; Fri, 20 Jan 2023 20:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIy0g-0007U3-Al; Fri, 20 Jan 2023 20:29:14 +0000
Received: by outflank-mailman (input) for mailman id 482160;
 Fri, 20 Jan 2023 20:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gv2=5R=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pIy0e-0007Tt-Rq
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 20:29:12 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17249863-9901-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 21:29:08 +0100 (CET)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CBC1F1EC01B5;
 Fri, 20 Jan 2023 21:29:07 +0100 (CET)
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
X-Inumbo-ID: 17249863-9901-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1674246547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=pTbCQUN+YnCBIkbYMuXNpavHR0UNLh0FRHrM358v2lc=;
	b=YeKvLhTytdDvp85ARvQJilNzdAlZFXRXXj90lclYwv60YSNWo/Ncb+BZUGEQiyXLMfLqGP
	/Lp7BmpOw3m+sdfvUebkRTj5wotQF8kAECpCPx7wZ99jtAlrgRmIkx1u/y6Sy2hDh4oNdP
	8LRI4/T1Rd9BJXKtfCRjmXVGCLWjAGM=
Date: Fri, 20 Jan 2023 21:29:07 +0100
From: Borislav Petkov <bp@alien8.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 4/7] x86/power: Inline write_cr[04]()
Message-ID: <Y8r5k+IW6jAJJTSm@zn.tnic>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.768035056@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230116143645.768035056@infradead.org>

On Mon, Jan 16, 2023 at 03:25:37PM +0100, Peter Zijlstra wrote:
> Since we can't do CALL/RET until GS is restored and CR[04] pinning is
	^^

Ditto like for the previous one.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

