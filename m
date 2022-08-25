Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134265A0FC6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 14:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393343.632232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBWc-0007JX-Ip; Thu, 25 Aug 2022 11:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393343.632232; Thu, 25 Aug 2022 11:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBWc-0007Gm-Fp; Thu, 25 Aug 2022 11:59:54 +0000
Received: by outflank-mailman (input) for mailman id 393343;
 Thu, 25 Aug 2022 11:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rn/X=Y5=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oRBWb-00077o-6i
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:59:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c47d217-246d-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 13:59:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0239761B0E;
 Thu, 25 Aug 2022 11:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F096DC433C1;
 Thu, 25 Aug 2022 11:59:48 +0000 (UTC)
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
X-Inumbo-ID: 6c47d217-246d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661428789;
	bh=Un8QnMW2xwfYHDUa3vuOblHRI1W6EfXD97D4I8mMKG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbHjAyygp05xLVbWlk4Zv9bxHJVeH0d7atxdq/XfODGtCl8HFJ4WGGTCEHk+KRL05
	 qqVWWx6nObT5+C88q65frzELhv0R/0/Bhx63UWuFWqMNusIekMm2WYasFvuEHeEWdE
	 /JtIP+P1pHdSm0eCawcVkBNFsZjiKUVdW+ulygK4=
Date: Thu, 25 Aug 2022 13:59:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Backport request
Message-ID: <YwdkMkAPC4tzsoT2@kroah.com>
References: <f02f8fb3-2e68-a405-aaef-adc769754bd3@suse.com>
 <YwYVIgnHnKUnoChu@kroah.com>
 <1199e064-3311-09cd-283f-d74d5f5c48e3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1199e064-3311-09cd-283f-d74d5f5c48e3@suse.com>

On Wed, Aug 24, 2022 at 03:52:27PM +0200, Juergen Gross wrote:
> On 24.08.22 14:10, Greg Kroah-Hartman wrote:
> > On Wed, Aug 24, 2022 at 01:20:22PM +0200, Juergen Gross wrote:
> > > Hi Greg,
> > > 
> > > stable kernels 5.18 and 5.15 seem to be missing upstream patch
> > > c64cc2802a78 ("x86/entry: Move CLD to the start of the idtentry macro").
> > > This is a prerequisite patch for 64cbd0acb582 ("x86/entry: Don't call
> > > error_entry() for XENPV"), which is included in 5.15.y and 5.18.y.
> > > 
> > > Could you please take c64cc2802a78 for 5.15 and 5.18?
> > 
> > 5.18 is end-of-life, so that's impossible to do now :(
> > 
> > For 5.15.y, the commit does not apply cleanly, can you provide a working
> > backport?
> 
> Attached.

Thanks, now queued up.

greg k-h

