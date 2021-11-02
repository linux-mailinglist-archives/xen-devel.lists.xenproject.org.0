Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AA443066
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220301.381509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhul9-0006Pw-Nt; Tue, 02 Nov 2021 14:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220301.381509; Tue, 02 Nov 2021 14:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhul9-0006NX-KX; Tue, 02 Nov 2021 14:27:31 +0000
Received: by outflank-mailman (input) for mailman id 220301;
 Tue, 02 Nov 2021 14:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TliJ=PV=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1mhul8-0006NR-EG
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:27:30 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 236ee236-975f-4364-b407-668c73e2e32f;
 Tue, 02 Nov 2021 14:27:28 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f6200d878d07ae9750fe9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:6200:d878:d07a:e975:fe9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BA7D51EC051F;
 Tue,  2 Nov 2021 15:27:27 +0100 (CET)
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
X-Inumbo-ID: 236ee236-975f-4364-b407-668c73e2e32f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1635863247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=MgzXun1sGyXAbI3k6Dnpky/GrLb5A5Lop9Rxzlg7jwI=;
	b=ASq4jAIHpy8E52FTr9weFP+TD8+l23LFSQga5+c0Ujj0WHMNuHy63r+r6XIpWsN2BjO1X0
	difW7wdNKyKN4Pj4p5VCD9cD6QYFn9S9ppe/ssR/HFWhzMEAIQ3NCKNfXqa/O6mG6GI7A9
	60zcPcQEi0MF14FxGjMVXSPvt121WE4=
Date: Tue, 2 Nov 2021 15:27:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Lai Jiangshan <laijs@linux.alibaba.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V4 04/50] x86/xen: Add
 xenpv_restore_regs_and_return_to_usermode()
Message-ID: <YYFKy/KM7wRUg5mq@zn.tnic>
References: <20211026141420.17138-1-jiangshanlai@gmail.com>
 <20211026141420.17138-5-jiangshanlai@gmail.com>
 <YYD9ohN2Zcy4EdMb@zn.tnic>
 <d4ae23dd-377e-8316-909b-d5bdeacc0904@linux.alibaba.com>
 <YYEJuIgQukcDzy1R@zn.tnic>
 <6F6D3FEC-9AF1-40E1-A7C2-394D21C40114@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6F6D3FEC-9AF1-40E1-A7C2-394D21C40114@zytor.com>

On Tue, Nov 02, 2021 at 12:22:50PM +0100, H. Peter Anvin wrote:
> It would be interesting to have an "override function with jmp"
> alternatives macro. It doesn't require any changes to the alternatives
> mechanism proper (but possibly to objtool): it would just insert an
> alternatives entry without adding any code including nops to the main
> path. It would of course only be applicable to a jmp, so a syntax like
> OVERRIDE_JMP feature, target rather than open-coding the instruction
> would probably be a good idea.

I think you wanna say ALTERNATIVE_JMP here seeing how we have
ALTERNATIVE_CALL already :)

As to marking it properly, we can finally add that struct
alt_instr.flags thing we have been trying to add for years now.

/me adds it to his evergrowing todo.

If anyone beats /me to it, /me will gladly have a look at it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

