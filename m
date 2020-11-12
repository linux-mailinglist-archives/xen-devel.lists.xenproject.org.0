Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B042B1082
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 22:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26065.54195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdKIG-0007aO-F5; Thu, 12 Nov 2020 21:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26065.54195; Thu, 12 Nov 2020 21:38:12 +0000
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
	id 1kdKIG-0007Zz-BX; Thu, 12 Nov 2020 21:38:12 +0000
Received: by outflank-mailman (input) for mailman id 26065;
 Thu, 12 Nov 2020 21:38:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1igI=ES=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kdKIE-0007Zg-HS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 21:38:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cafa734-3faf-44f4-be33-9c070fd303d5;
 Thu, 12 Nov 2020 21:38:09 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DE8D216C4;
 Thu, 12 Nov 2020 21:38:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1igI=ES=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kdKIE-0007Zg-HS
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 21:38:10 +0000
X-Inumbo-ID: 6cafa734-3faf-44f4-be33-9c070fd303d5
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6cafa734-3faf-44f4-be33-9c070fd303d5;
	Thu, 12 Nov 2020 21:38:09 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7DE8D216C4;
	Thu, 12 Nov 2020 21:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605217089;
	bh=dfJxq46eCc0l3PfXO9PBMR/wkbnzqvQdLA8B2ZWFB9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gZjjb3z8Sdt5eQ3VDjtVH8ty5RABlE6uraJj/rvTc3zpdACaG0uwOuRDUntzBHItI
	 SBqXgx+x52QCStGlLiqd+fFeT971j0k83acVCroB7XppyZ4m1LSsuqtDUstxlRn3BJ
	 DSAcwkhNmNYMdmlh20K3RMeUvjGNc42abtBSLtWQ=
Date: Thu, 12 Nov 2020 13:38:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
In-Reply-To: <3e2132c9-2ab3-7bfb-656b-2cab58a53342@suse.com>
Message-ID: <alpine.DEB.2.21.2011121332250.20906@sstabellini-ThinkPad-T480s>
References: <20201022143905.11032-1-jgross@suse.com> <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com> <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com> <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com> <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
 <3e2132c9-2ab3-7bfb-656b-2cab58a53342@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-782297277-1605216774=:20906"
Content-ID: <alpine.DEB.2.21.2011121333080.20906@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-782297277-1605216774=:20906
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2011121333081.20906@sstabellini-ThinkPad-T480s>

On Thu, 12 Nov 2020, Jan Beulich wrote:
> On 12.11.2020 13:50, Jürgen Groß wrote:
> > Any further comments, or even better, Acks?
> 
> To be honest I'd prefer to have at least one of the people Cc-ed
> minimally indicate they consider this a good idea. No need for a
> close review or such, just a basic opinion. Anyone?

I see Jan's point that it is not clear how much this is going to help in
production. However, it is not going to hurt either, and I have been
told a few times recently that debugging Xen is not easy. Anything that
helps in that regard would be good. So I think this patch would be an
improvement.
--8323329-782297277-1605216774=:20906--

