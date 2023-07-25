Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180EC76224B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 21:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569898.891054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONlq-0002Yf-45; Tue, 25 Jul 2023 19:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569898.891054; Tue, 25 Jul 2023 19:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONlq-0002WN-1H; Tue, 25 Jul 2023 19:32:34 +0000
Received: by outflank-mailman (input) for mailman id 569898;
 Tue, 25 Jul 2023 19:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qONlo-0002WH-9n
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 19:32:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feac5d9a-2b21-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 21:32:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B452961888;
 Tue, 25 Jul 2023 19:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140F0C433C8;
 Tue, 25 Jul 2023 19:32:27 +0000 (UTC)
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
X-Inumbo-ID: feac5d9a-2b21-11ee-b240-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690313549;
	bh=A+a/6l+yUXC1DJZe/ZrvK0q+y5Xy7Ic9XFzcSzhYAcQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rairky3HqFZE9ol3iftLMrEmeJFgHBnIP9du3wwKkqWQMU/yxmpuwOVVvG2DqqKqi
	 36AY5J5jGJOyhToFWNM/ro3AWXqxqU0lZQYIEzL571EOuUT3eMWMhkkxCxxUaqhTj0
	 iJqMXYcWotv46cM4qXrfA0HXqDUhHjZoHcw5iyuuk4V4Ti5ON5MT0nyCWq1dcmjz5Z
	 olufCcQ4K/eYdNMZ7vhXMOwIIr/Wdm8lpNSWrn055fotFQC8EOX9k5ySMV1Ralo/1I
	 gtOmPMueq9yibCL0jr4VNw2ihqRD/KqTNa3EK2cYDxK/GdJxauES1XasJL0Gm4PV2P
	 ewHw87bGrtgHQ==
Date: Tue, 25 Jul 2023 12:32:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C:
 2012 Rules 8.2 and 8.3
In-Reply-To: <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307251226180.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690217195.git.federico.serafini@bugseng.com> <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com> <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Jan Beulich wrote:
> On 24.07.2023 19:50, Federico Serafini wrote:
> > @@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
> >  }
> >  
> >  int request_irq(unsigned int irq, unsigned int irqflags,
> > -                void (*handler)(int, void *, struct cpu_user_regs *),
> > +                void (*handler)(int irq, void *dev_id,
> > +                                struct cpu_user_regs *regs),
> >                  const char *devname, void *dev_id)
> >  {
> 
> Before we accept patches, don't we need to first settle on whether to
> apply the rule(s) also to function type declarations (and not just
> ordinary prototypes)?

Yes, in retrospect we should have found agreement on this issue this
morning but I forgot to bring it up :-(  Ooops.

(I think the agreement was to change the function type declarations too,
that's why docs/misra/rules.rst doesn't have a note about this, but I
don't want to make assumptions as I am not certain.)

