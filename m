Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B4303E68
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74998.134903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OER-0007FP-RC; Tue, 26 Jan 2021 13:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74998.134903; Tue, 26 Jan 2021 13:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OER-0007Ex-NN; Tue, 26 Jan 2021 13:18:07 +0000
Received: by outflank-mailman (input) for mailman id 74998;
 Tue, 26 Jan 2021 13:18:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OEQ-0007Es-6t
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:18:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OEQ-0006au-41
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:18:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4OEQ-00078Y-36
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:18:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4OEC-0006jT-DW; Tue, 26 Jan 2021 13:17:52 +0000
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
	bh=cOlchwuek1rD/9khh1JsTYn9c0tHbNumrpczgQAdh5k=; b=zEDaC0c4bEsAs7nhxLhbxCJzjw
	S9zCLgpVTcnDR2NLKziEZEVsTIlj6AIHeLvHv4xBH1bBlvtLv0BJv+ukPHcBW4VXjaOA6qBgXz+Bk
	liRJAYqE9P5F3pYDk6WYAlwM6+B9xMZklbFmmwEbftKU7VMMA8P0GGAz7Wo6lYkiFeBg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24592.5760.197643.853055@mariner.uk.xensource.com>
Date: Tue, 26 Jan 2021 13:17:52 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Stefano Stabellini <stefano.stabellini@xilinx.com>,
    "andrew.cooper3\@citrix.com" <andrew.cooper3@citrix.com>,
    "george.dunlap\@citrix.com" <george.dunlap@citrix.com>,
    "julien\@xen.org"  <julien@xen.org>,
    "wl\@xen.org" <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
	<20210125212747.26676-1-sstabellini@kernel.org>
	<bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
	<8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
	<01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
	<5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
	<1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED"):
> On 26.01.2021 12:17, Bertrand Marquis wrote:
> > Maybe something we could explain more clearly in the UNSUPPORTED/EXPERT
> > config parameters instead ?
> > We could also make that more clear in the help of such parameters directly.
> > 
> > I do not see how we could make that more clear directly in the prompt (as
> > making it too long is not a good solution).
> 
> My main request is that such tags be added only if there's
> absolutely no ambiguity. Anything else (requiring longer
> explanations in many cases) should be expressed in the help
> text of the option, or in yet other ways (a referral to
> SUPPORT.md comes to mind).

Is

>>>>> +	bool "Harden the branch predictor against aliasing attacks (disabling UNSUPPORTED)" if UNSUPPORTED

too long ?

Ian.

