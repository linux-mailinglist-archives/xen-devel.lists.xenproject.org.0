Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AB331C2E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 02:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95181.179575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJQzi-0007Xs-Uk; Tue, 09 Mar 2021 01:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95181.179575; Tue, 09 Mar 2021 01:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJQzi-0007XT-RV; Tue, 09 Mar 2021 01:17:06 +0000
Received: by outflank-mailman (input) for mailman id 95181;
 Tue, 09 Mar 2021 01:17:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJQzh-0007XO-C3
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 01:17:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bb105dc-6752-4625-8336-2ce7fd1cb130;
 Tue, 09 Mar 2021 01:17:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD0906527E;
 Tue,  9 Mar 2021 01:17:03 +0000 (UTC)
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
X-Inumbo-ID: 7bb105dc-6752-4625-8336-2ce7fd1cb130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615252624;
	bh=VOWuOz+niWM+avW6mk/WnMfZ1yU1jZ60SouMAt9TLg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lf3elhTmzedELxGEeRNx7Ty16Tk9Z0i1Ymw4Ya5DjL1eCPMtahoj+GJ8aaHZD6dI+
	 FmuC/UHhOavSFXIjpU02Gv9DgsA0dJdPbaadh0xKLWMVX8sHg74jj7dDr/YrvfnhK4
	 MdP/f+QKSwHYlt4TneimalYyBBtk81m3X9meimj9Q856Np8/40j4sjwNKtJc5biAIj
	 eUJ5NRKf8DWqMpm7+/nqbM19OSW4WU+XiTQ0kJoVE4X7MwuY9zUENpSI9cG+KmL1Bz
	 rEamJz4euuNCy7TWWfDokZKMSOyOJfHCU4UQkoCGFzmessuTYZZ1TH47cDOlI1Lt3m
	 d4aPLaSyWilgQ==
Date: Mon, 8 Mar 2021 17:17:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
In-Reply-To: <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
Message-ID: <alpine.DEB.2.21.2103081716470.16374@sstabellini-ThinkPad-T480s>
References: <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com> <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Mar 2021, Julien Grall wrote:
> Hi Bertrand,
> 
> On 08/03/2021 17:18, Bertrand Marquis wrote:
> > All cpu identification registers that we store in the cpuinfo structure
> > are 64bit on arm64 and 32bit on arm32 so storing the values in 32bit on
> > arm64 is removing the higher bits which might contain information in the
> > future.
> > 
> > This patch is changing the types in cpuinfo to register_t (which is
> > 32bit on arm32 and 64bit on arm64) and adding the necessary paddings
> > inside the unions.
> 
> I read this as we would replace uint32_t with register_t. However, there are a
> few instances where you, validly, replace uint64_t with register_t. I would
> suggest to clarify it in the commit message.
> 
> > diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> > index cae2179126..ea0dd3451e 100644
> > --- a/xen/arch/arm/smpboot.c
> > +++ b/xen/arch/arm/smpboot.c
> > @@ -321,7 +321,8 @@ void start_secondary(void)
> >       if ( !opt_hmp_unsafe &&
> >            current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
> >       {
> > -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU MIDR
> > (0x%x),\n"
> > +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not match
> > boot "
> > +               "CPU MIDR (0x%"PRIregister"),\n"
> 
> For printk messages, we don't tend to split it like that (even for more than
> 80 characters one). Instead, the preferred approach is:
> 
> printk(XENLOG_ERR
>        "line 1\n"
>        "line 2\n")
> 
> 
> The rest of the code looks good to me:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Aside from these minor issues:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

