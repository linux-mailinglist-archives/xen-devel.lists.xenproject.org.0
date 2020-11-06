Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68B2A8C5C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 02:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20315.46099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kar10-0008DX-VH; Fri, 06 Nov 2020 01:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20315.46099; Fri, 06 Nov 2020 01:58:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kar10-0008DF-PP; Fri, 06 Nov 2020 01:58:10 +0000
Received: by outflank-mailman (input) for mailman id 20315;
 Fri, 06 Nov 2020 01:58:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6QlO=EM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kar0z-0008DA-Ef
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 01:58:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aedff8b-8078-4eaa-b6fc-0d3864a6d986;
 Fri, 06 Nov 2020 01:58:08 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82474206FB;
 Fri,  6 Nov 2020 01:58:07 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6QlO=EM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kar0z-0008DA-Ef
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 01:58:09 +0000
X-Inumbo-ID: 0aedff8b-8078-4eaa-b6fc-0d3864a6d986
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0aedff8b-8078-4eaa-b6fc-0d3864a6d986;
	Fri, 06 Nov 2020 01:58:08 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 82474206FB;
	Fri,  6 Nov 2020 01:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604627888;
	bh=p2AqvGg5ZhzQEJT67RSt8noNjzmsIyRs4D95c2t8J50=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zi/2enwiCdNc8zBEE86t/rJ9ap0GIp1AaHdJZFJh19G7IxMOnvge51/hRRKUZ6eIo
	 F28jZ/NQpbcnr0/VMglUx3gPIKtvtDzA0/OWiCnrVadY4aaJHYIQbaahS9W5KQSDVN
	 ighSDJAuELPYHdMCtYBa2NTeEJfZ1M9kP1HplzgU=
Date: Thu, 5 Nov 2020 17:58:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.14.1
In-Reply-To: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
Message-ID: <alpine.DEB.2.21.2011051753580.2323@sstabellini-ThinkPad-T480s>
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Nov 2020, Jan Beulich wrote:
> All,
> 
> the release is due in a couple of weeks time. Please point out
> backports you find missing from the respective staging branch,
> but which you consider relevant. (Ian: Please double check
> there are indeed no tools side backports needed here.)
> 
> Julien, Stefano, on the Arm side I'd like to ask for
> 
> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
> 
> just like I did when sending the respective 4.13.2 / 4.12.4
> mail. Is there a particular reason it wasn't put in?

No, I have just backported 5d45ecabe3c0 and a couple of other fixes.

Jan, do you think we should backport the following also?

8856a914b build: also check for empty .bss.* in .o -> .init.o conversion

