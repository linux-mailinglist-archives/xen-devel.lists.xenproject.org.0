Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE58B24CF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 17:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712143.1112587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s00nG-0006cJ-Rm; Thu, 25 Apr 2024 15:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712143.1112587; Thu, 25 Apr 2024 15:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s00nG-0006Ze-PE; Thu, 25 Apr 2024 15:13:50 +0000
Received: by outflank-mailman (input) for mailman id 712143;
 Thu, 25 Apr 2024 15:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajoc=L6=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1s00nE-0006Px-Tu
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 15:13:49 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 662818a5-0316-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 17:13:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 71275CE1A15;
 Thu, 25 Apr 2024 15:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9EEC113CC;
 Thu, 25 Apr 2024 15:13:36 +0000 (UTC)
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
X-Inumbo-ID: 662818a5-0316-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714058016;
	bh=hFpK8XSM1/HUq6bEn8zUIMT1/gjUrzh2BfkVUYpzBzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRh6ysxa9sJaAMLsvJaxwXwEf56EUsPIpJeW5jU0sbMcvvsYbA8O+dDWREIKjLk+o
	 lmVl+KF0/IL2F5H/e7uGhPSjVgjM09y+OZzdI6kO+uA/RWUYprocIhrtSz16QQ3hTI
	 djk036VoVhxFZiZfYJBBWX+LAaQ8zNfo6dp2dyso=
Date: Thu, 25 Apr 2024 08:13:28 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, wei.liu@kernel.org,
	paul@xen.org, Jakub Kicinski <kuba@kernel.org>, kirjanov@gmail.com,
	dkirjanov@suse.de, kernel-team@cloudflare.com,
	security@xenproject.org, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
Message-ID: <2024042544-jockstrap-cycle-ed93@gregkh>
References: <171154167446.2671062.9127105384591237363.stgit@firesoul>
 <CALUcmU=xOR1j9Asdv0Ny7x=o4Ckz80mDjbuEnJC0Z_Aepu0Zzw@mail.gmail.com>
 <CALUcmUkvpnq+CKSCn=cuAfxXOGU22fkBx4QD4u2nZYGM16DD6A@mail.gmail.com>
 <CALUcmUn0__izGAS-8gDL2h2Ceg9mdkFnLmdOgvAfO7sqxXK1-Q@mail.gmail.com>
 <CAFLBxZaLKGgrZRUDMQ+kCAYKD7ypzsjO55mWvkZHtMTBxdw51A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLBxZaLKGgrZRUDMQ+kCAYKD7ypzsjO55mWvkZHtMTBxdw51A@mail.gmail.com>

On Thu, Apr 25, 2024 at 02:39:38PM +0100, George Dunlap wrote:
> Greg,
> 
> We're issuing an XSA for this; can you issue a CVE?

To ask for a cve, please contact cve@kernel.org as per our
documentation.  Please provide the git id of the commit you wish to have
the cve assigned to.

thanks,

greg k-h

