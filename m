Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3134675EE3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 21:27:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482155.747523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxyG-0006x2-0y; Fri, 20 Jan 2023 20:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482155.747523; Fri, 20 Jan 2023 20:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxyF-0006uY-UY; Fri, 20 Jan 2023 20:26:43 +0000
Received: by outflank-mailman (input) for mailman id 482155;
 Fri, 20 Jan 2023 20:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gv2=5R=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pIxyC-0006uS-I4
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 20:26:41 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd89bfe9-9900-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 21:26:38 +0100 (CET)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2B8211EC01B5;
 Fri, 20 Jan 2023 21:26:37 +0100 (CET)
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
X-Inumbo-ID: bd89bfe9-9900-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1674246397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=jZ8OaYf/GRQ2TxOV4jZT6AQpjda327cLvF6ttVfQQ4M=;
	b=hY3Ue4LBiep4MKn0VfEK59kgm/TZU3IId3CkHJzgOPb2oe1rF413+UpKZyQsIjVBZB2msy
	bWKdxt58uFQKPOrYTy9O9GkcwBi00bTrasWZhTAnS0a9/FEbZyn4txvKuaEno0yjdo0TBL
	bmOudVDBdGPkTzoyY1zvwnydDd/qamM=
Date: Fri, 20 Jan 2023 21:26:33 +0100
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
Subject: Re: [PATCH v2 3/7] x86/power: De-paravirt restore_processor_state()
Message-ID: <Y8r4+V4Y42Y09WMw@zn.tnic>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.708895882@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230116143645.708895882@infradead.org>

On Mon, Jan 16, 2023 at 03:25:36PM +0100, Peter Zijlstra wrote:
> Since Xen PV doesn't use restore_processor_state(), and we're going to
> have to avoid CALL/RET until at least GS is restored,

Drop the "we":

"..., and CALL/RET cannot happen before GS has been restored, ..."

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

