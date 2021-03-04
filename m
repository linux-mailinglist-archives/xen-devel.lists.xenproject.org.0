Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3AA32D366
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 13:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93234.175952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnIS-0003kF-Ux; Thu, 04 Mar 2021 12:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93234.175952; Thu, 04 Mar 2021 12:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnIS-0003jo-RD; Thu, 04 Mar 2021 12:41:40 +0000
Received: by outflank-mailman (input) for mailman id 93234;
 Thu, 04 Mar 2021 12:41:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnIR-0003jj-TO
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:41:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnIR-0002fC-Sl
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:41:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnIR-0004Rv-Ru
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:41:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHnIE-0005De-V5; Thu, 04 Mar 2021 12:41:27 +0000
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
	bh=qT6MKAvCPuhlFO5GVRsNEpCfK44QKnwV0Q2oMXtFXWA=; b=SjKVusWWbtbyUVcFDBn/oAPt4g
	wIm2alwTXPVHH4fKuXlKnHGir5vr3cenxuIaXXAaPRQdSf9e4Ss0bGgJTkkV6BVI4UUjJytQbGL00
	r4SiuELd6NGMq7VqMjme89By0DOVcEF3YTx8qlGvgfS8C2Fs1G6awkl6WOgCLSHCssvA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.54646.699914.490087@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 12:41:26 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    Charles Arnold <CARNOLD@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
In-Reply-To: <027e1854-1500-306a-eac8-8571e09df71c@xen.org>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
	<7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
	<1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
	<24640.49856.639416.385729@mariner.uk.xensource.com>
	<027e1854-1500-306a-eac8-8571e09df71c@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
> On 04/03/2021 11:21, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
...
> > It has been idiomatic in some codebases for a long time to write
> >      const unsigned char[]
> > as a formal parameter for an array (of whatever size).
>
> AFAICT, this is not what GCC is trying to warn about. It is complaining 
> that the prototype and the declaration doesn't use the same signature.

Oh!  I would have to check whether that is legal (I would guess
probably it is UB because the C authors hate us all) but I agree that
the warning is justified and the code should be changed.

Sorry for the misunderstanding.

Ian.

