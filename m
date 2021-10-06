Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DCB423CDC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202851.357879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY5Am-0005B3-MV; Wed, 06 Oct 2021 11:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202851.357879; Wed, 06 Oct 2021 11:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY5Am-00058c-JS; Wed, 06 Oct 2021 11:33:20 +0000
Received: by outflank-mailman (input) for mailman id 202851;
 Wed, 06 Oct 2021 11:33:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY5Al-00058W-Gs
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:33:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY5Al-0002AJ-FP
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:33:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mY5Al-0001eQ-EY
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:33:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mY5Ag-0003Gx-MT; Wed, 06 Oct 2021 12:33:14 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=VpVaj3h60dMQC3FdBiyqTjlopXEX9ICvPgSoVwczmxM=; b=4MgZAkPRoFsmvCH2h/f1DBGySo
	pHuLkLO7NHyfUrNPuf/DAyyAXAUJ3R+9div5xNuzBT2q1D06l3SdfrwIH6H3wFzNCnnUtNA12/tvq
	/q4gGwAVZMQ8j904H6uEFl0ejZwwXvBexQKpYm/JzaWJQIT1iDVELlo/fQPY2NhlesiY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-16
Content-Transfer-Encoding: 8bit
Message-ID: <24925.35194.369692.94259@mariner.uk.xensource.com>
Date: Wed, 6 Oct 2021 12:33:14 +0100
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
	<3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
	<alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
	<11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
	<alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
	<8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
	<24925.33634.554859.2131@mariner.uk.xensource.com>
	<BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Rahul Singh writes ("Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in libxl"):
> Hi Ian	
> > What is wrong with putting it in
> > libxl__arch_domain_build_info_setdefault
> > which I think exists precisely for this kind of thing ?
> 
> As we have to set the arch_arm.vpci to false for x86 and ARM I
> thought it is right to move the code to common code to avoid
> duplication.
> 
> Are you suggesting to put "
> libxl_defbool_setdefault(&b_info->arch_arm.vpci, false)µin
> libxl__arch_domain_build_info_setdefault() for x86 and ARM
> differently.

I've gone back and reread the whole thread, which I probably should
have done to start with....

So:

> >> #if defined(__arm__) || defined(__aarch64__)                  
> >>    /*                                    
> >>     * Enable VPCI support for ARM. VPCI support for DOMU guests is not    
> >>     * supported for x86.                          
> >>     */                                   
> >>    if (d_config->num_pcidevs)                        
> >>      libxl_defbool_set(&b_info->arch_arm.vpci, true);           
> >> #endif 

I think this logic probably ought to be in libxl, not in xl.  We try
to make the libxl API "do the right thing" by default.  In this case I
think that means to enable VPCI (i) on platforms where it's available
(ii) if the guest has PCI passthrough devices.  Is that right ?

Sorry to ask these question now, and please forgive my ignorance:

Is VPCI inherently an ARM-specific ABI or protocol ?  When might an
admin want to turn it on explicitly ?

How does this all relate to the (non-arch-specific) "passthrough"
option ?

Ian.

