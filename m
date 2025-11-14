Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39710C5B632
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 06:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162250.1489966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJmMd-0001tS-R1; Fri, 14 Nov 2025 05:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162250.1489966; Fri, 14 Nov 2025 05:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJmMd-0001ri-O0; Fri, 14 Nov 2025 05:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1162250;
 Fri, 14 Nov 2025 05:28:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vJmMb-0001rc-Qj
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 05:28:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vJmMa-006cLd-1r;
 Fri, 14 Nov 2025 05:28:48 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vJmMa-00BKr8-0M;
 Fri, 14 Nov 2025 05:28:48 +0000
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
	:Subject:Cc:To:Date:From; bh=vxNJy7MkJ6d7LxT0937y6yDKSFpnnsf4IHgaPtz8594=; b=
	JILh3frBLAN1GO7Vt991hq8/DneD3lFYop1Guqi+8OzbvxRiZP2IxUAYcbNI4EqU/9YkpyBJb8QQy
	FycIj1mVx9IDM+gml5FewHh6f/BfX2ZAorTzAAsMaA8FlDXd/E8BzF/694D3e4qSrKNsr7nQncbu4
	e5kw1pYdr3gkZWLMM=;
From: dmukhin@xen.org
Date: Thu, 13 Nov 2025 21:28:47 -0800
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v7 03/16] emul/ns16x50: implement emulator stub
Message-ID: <aRa+D3ryprzT5qE6@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-4-dmukhin@ford.com>
 <CAGeoDV_dKAvQy0j_jCune660ByqV368-O5anFjLjer0MAVx+Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGeoDV_dKAvQy0j_jCune660ByqV368-O5anFjLjer0MAVx+Bg@mail.gmail.com>

On Mon, Sep 15, 2025 at 01:16:26PM +0300, Mykola Kvach wrote:
> > +/*
> > + * Virtual ns16x50 device state.
> > + */
> > +struct vuart_ns16x50 {
> > +    uint8_t regs[NS16X50_EMU_REGS_NUM]; /* Emulated registers */
> 
> I think it would be better to add an init procedure for the registers.
> At least not all bits in all registers should be initialized to zero.
> Or will this be handled in some way during I/O reads?

I can do it, something like ns16x50_reset() should work I think.
Thanks for suggestion!

