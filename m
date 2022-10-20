Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3167605F18
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426648.675234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTtQ-0006wD-Q8; Thu, 20 Oct 2022 11:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426648.675234; Thu, 20 Oct 2022 11:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTtQ-0006tW-NB; Thu, 20 Oct 2022 11:39:20 +0000
Received: by outflank-mailman (input) for mailman id 426648;
 Thu, 20 Oct 2022 11:39:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuCN=2V=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1olTtM-0006HM-3B
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:39:19 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d24ed6b5-506b-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 13:39:14 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e710329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e710:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 59C931EC0567;
 Thu, 20 Oct 2022 13:39:09 +0200 (CEST)
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
X-Inumbo-ID: d24ed6b5-506b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1666265949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Vt+wMbRFE0rG1uXDujJFiYR0joB4irWLNz9Ee1QgEPY=;
	b=Lo2rYQRz7A01KADbSuyKRxc1XILdeTNVtSfBHQ6PVOriFyIbeFkH76vI40g1wbm5m7rGlR
	TMyHEwGgv0LOWkHvZL3E1HTzoJhM7nJazREkCHOqRC+ROyKYNxA00cJXwKIXbr/IrRJqTn
	z8gXYkwQKD48/lE+L7Ml+vSO/8iqZPk=
Date: Thu, 20 Oct 2022 13:39:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/xen: simplify sysenter and syscall setup
Message-ID: <Y1EzXQP3/Pn3bme+@zn.tnic>
References: <20221020113619.17204-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221020113619.17204-1-jgross@suse.com>

On Thu, Oct 20, 2022 at 01:36:19PM +0200, Juergen Gross wrote:
> xen_enable_sysenter() and xen_enable_syscall() can be simplified a lot.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/setup.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
> index cfa99e8f054b..0f33ed6d3a7b 100644
> --- a/arch/x86/xen/setup.c
> +++ b/arch/x86/xen/setup.c
> @@ -910,17 +910,9 @@ static int register_callback(unsigned type, const void *func)
>  
>  void xen_enable_sysenter(void)
>  {
> -	int ret;
> -	unsigned sysenter_feature;
> -
> -	sysenter_feature = X86_FEATURE_SYSENTER32;
> -
> -	if (!boot_cpu_has(sysenter_feature))
> -		return;
> -
> -	ret = register_callback(CALLBACKTYPE_sysenter, xen_entry_SYSENTER_compat);
> -	if(ret != 0)
> -		setup_clear_cpu_cap(sysenter_feature);
> +	if (boot_cpu_has(X86_FEATURE_SYSENTER32) &&

Can you switch that and below to cpu_feature_enabled() while at it, pls?

> +	if (boot_cpu_has(X86_FEATURE_SYSCALL32) &&
	^^^^^^^^^^^^^^^^^^

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

