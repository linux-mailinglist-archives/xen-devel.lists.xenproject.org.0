Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA0460942
	for <lists+xen-devel@lfdr.de>; Sun, 28 Nov 2021 20:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234187.406460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrPgX-0002lT-RN; Sun, 28 Nov 2021 19:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234187.406460; Sun, 28 Nov 2021 19:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrPgX-0002ib-OF; Sun, 28 Nov 2021 19:18:01 +0000
Received: by outflank-mailman (input) for mailman id 234187;
 Sun, 28 Nov 2021 19:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aI3v=QP=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mrPgV-0002iV-IT
 for xen-devel@lists.xenproject.org; Sun, 28 Nov 2021 19:17:59 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e53b3eef-507f-11ec-b941-1df2895da90e;
 Sun, 28 Nov 2021 20:17:58 +0100 (CET)
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
X-Inumbo-ID: e53b3eef-507f-11ec-b941-1df2895da90e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638127077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JUkgr1+1xpaGfU+RedPaRQmMTBII3kcX9LK2s6OBK4=;
	b=OwlJzKpXh6HUO0d3S226LkHX0VBEv/ZMGzpouZpDaknUBEWmnL8N2ToysfCkKrXjYYLOZt
	iVHuFafr0na37AQ6l9x85IxpDbPbsDoXGIi4PG8PTi0OhrcrYJoC+WaQfVt0vabA2eV+em
	Ng7psNOZAIZ6xyzx621ez74kPw534jLdfrViT1k8TelbaOpr2LqjSUYcbp1OmtUlpO8Rg4
	hfzXc9Jnehb8NHUubdd/cHrAjk8X0duzPRgkrYbGSvWuwrfUsk87VbsYQiNw3269IIlODP
	uCKRHXUM+mb3iSajZoLTXqvgYDA9blbP6Sp/JVA16AG7rVFKHfUjui+S06A1ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638127077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JUkgr1+1xpaGfU+RedPaRQmMTBII3kcX9LK2s6OBK4=;
	b=JXCAyg87l9Mmdgu7jORXkXxXfTo1i6k+92QcrgQ4LwuGTC1qebUkIJsKOUQq12BUqiQCat
	D/zS/UZaK15PW0BA==
To: Marc Zyngier <maz@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, Megha Dey
 <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Andrew Cooper <amc96@cam.ac.uk>, Juergen Gross
 <jgross@suse.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [patch 03/10] genirq/msi: Make MSI descriptor alloc/free ready
 for range allocations
In-Reply-To: <8735ngs26o.wl-maz@kernel.org>
References: <20211126233124.618283684@linutronix.de>
 <20211127000918.664542907@linutronix.de> <8735ngs26o.wl-maz@kernel.org>
Date: Sun, 28 Nov 2021 20:17:56 +0100
Message-ID: <87a6hof5sr.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Nov 28 2021 at 15:57, Marc Zyngier wrote:
> On Sat, 27 Nov 2021 01:24:34 +0000,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The issue seems to be originating in the previous patch, where the
> following line was added:
>
> +	struct msi_range range = { .first = 0, .last = UINT_MAX, .ndesc = nvec, };
>
> In that context, only 'ndesc' was used, and that was fine.
>
> However, in the current patch, ndesc use is removed, only first/last
> are considered, and UINT_MAX is... a lot of MSIs.
>
> This fixes it:
>
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index bef5b74a7268..a520bfd94a56 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -975,7 +975,7 @@ int msi_domain_alloc_irqs_descs_locked(struct irq_domain *domain, struct device
>   */
>  int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec)
>  {
> -	struct msi_range range = { .first = 0, .last = UINT_MAX, .ndesc = nvec, };
> +	struct msi_range range = { .first = 0, .last = nvec - 1, .ndesc = nvec, };
>  	int ret;
>  
>  	msi_lock_descs(dev);
>
> However, it'd be good to clarify the use of range->ndesc.

Hrm. The stupid search should terminated nevertheless. Let me stare at
it again.

>> -static int msi_add_simple_msi_descs(struct device *dev, unsigned int index, unsigned int ndesc)
>> +static int msi_add_simple_msi_descs(struct device *dev, struct msi_range *range)
>
> nit: most of the functions changed in this patch need to have their
> documentation tidied up.

Duh, yes.

Thanks,

        tglx

