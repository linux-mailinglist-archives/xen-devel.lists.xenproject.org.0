Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDAB482A4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 04:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114453.1461365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvRjR-00065F-NM; Mon, 08 Sep 2025 02:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114453.1461365; Mon, 08 Sep 2025 02:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvRjR-00063K-HA; Mon, 08 Sep 2025 02:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1114453;
 Mon, 08 Sep 2025 02:35:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvRjQ-00063E-4G
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 02:35:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvRjO-00D1cA-1E;
 Mon, 08 Sep 2025 02:35:46 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvRjO-0032lO-03;
 Mon, 08 Sep 2025 02:35:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=XeQFr5LJiZfsCHspSSZcJv8YjQXYLhlC4Q1QlJJdnic=; b=
	bnCF/7jKifXUMlszmRn98x2a5nJZWOkZdKpcR4acB7r3ELfZ/8Tvwa6Gv909uyO12towKbjqlISh/
	Lw4qxhS4skP0OUHw4N7Q3EF36gIUjX2+lwYXdgwtjgwHICmBxlCTP1DVBtetN5kygDL6R7ZkNFwat
	G0gsByvLmTSLh4GTw=;
From: dmukhin@xen.org
Date: Sun, 7 Sep 2025 19:35:45 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v6 08/15] emul/ns16x50: implement MCR/MSR registers
Message-ID: <aL5BAXWvwups4RI5@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-9-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2509051837410.1405870@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2509051837410.1405870@ubuntu-linux-20-04-desktop>

On Fri, Sep 05, 2025 at 06:42:23PM -0700, Stefano Stabellini wrote:
> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
[..]
> > +            /* Calculate changes in modem status */
> > +            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> > +                msr_delta |= UART_MSR_DCTS;
> > +            if ( (msr_curr & UART_MSR_DSR) ^ (msr_next & UART_MSR_DSR) )
> > +                msr_delta |= UART_MSR_DDSR;
> > +            if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
> > +                msr_delta |= UART_MSR_TERI;
> 
> Should this be:
> 
> if ( (msr_curr & UART_MSR_RI) && !(msr_next & UART_MSR_RI) )
>     msr_delta |= UART_MSR_TERI;
> 
> ?

Thanks for the catch!

TL16C550C spec (7.7.10 Modem Status Register (MSR)) says TERI is set on
RI's 0->1 transition:

   if ( !(msr_curr & UART_MSR_RI) && (msr_next & UART_MSR_RI) )

