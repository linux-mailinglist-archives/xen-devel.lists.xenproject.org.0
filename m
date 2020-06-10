Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39071F55AC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 15:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj0gX-0008Rs-1R; Wed, 10 Jun 2020 13:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h/9h=7X=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jj0gV-0008Rn-JV
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 13:22:27 +0000
X-Inumbo-ID: 6cf64318-ab1d-11ea-bb8b-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cf64318-ab1d-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 13:22:26 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 7200E122804;
 Wed, 10 Jun 2020 15:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1591795345;
 bh=ISrEXEgbgbprbZHOuCt2lv8qBuL8OIAh7TmyZYfsp4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SBYEk0tOaEovxg2jVWoFcdA2JbV9kzKhP9Yv+UHaHyrIk7BSXikshszZb2dXxL+7p
 qy8BGQVlQav5uenaL9yoB/QpwTCr4Z1JHf7mFu0063f4BbjI/ldZ99qpY9GL+/q65Q
 xrZo33tDK9W4qsnlB3uoRAilgZqShGQylxXyopJv0byelFzim2phGLDRp/K9rhZ3Fv
 bGiQH+oWGOQ6Fv4Ot29GTc5x7fizb3eQQAeRfBbo+n7BRwM2MXKlXiKhcJX3FpUwIK
 dE14rwd8+oOZCbqGhlU3HmGkXHZ+mdNK1go65DDxx5psyxz3CSS45ZqZpEIsFDPlKF
 la5U3NdQ83jEg==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 2D052265E722; Wed, 10 Jun 2020 15:22:25 +0200 (CEST)
Date: Wed, 10 Jun 2020 15:22:25 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
Message-ID: <20200610132225.GA16839@nodbug.lucina.net>
Mail-Followup-To: Martin Lucina <martin@lucina.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, 09.06.2020 at 11:22, Andrew Cooper wrote:
> There is a little bit of history here...
> 
> GNTTABOP_setup_table was the original PV way of doing things (specify
> size as an input, get a list of frames as an output to map), and
> XENMAPSPACE_grant_table was the original HVM way of doing things (as
> mapping is the other way around - I specify a GFN which I'd like to turn
> into a grant table mapping).
> 
> When grant v2 came along, it was only XENMAPSPACE_grant_table updated to
> be compatible.  i.e. you have to use XENMAPSPACE_grant_table to map the
> status frames even if you used GNTTABOP_setup_table previously.
> 
> It is a mistake that GNTTABOP_setup_table was usable in HVM guests to
> being with.  Returning -1 is necessary to avoid an information leak (the
> physical address of the frames making up the grant table) which an HVM
> guest shouldn't, and has no use knowing.
> 
> An with that note, ARM is extra special because the grant API is
> specified to use host physical addresses rather than guest physical (at
> least for dom0, for reasons of there generally not being an IOMMU),
> which is why it does use the old PV way.
> 
> It is all a bit of a mess.

Thanks for explaining, this is helpful.

So, going with the grant v2 ABI, is there a modern equivalent of
GNTTABOP_get_status_frames? Reading memory.h I'm guessing that it might be
XENMEM_add_to_physmap with space=XENMAPSPACE_grant_table and
idx=(XENMAPIDX_grant_table_status + N) where N is the frame I want, but
this is not explicitly mentioned anywhere and Linux uses the GNTTABOP
mechanism.

Further to that, what is the format of the grant status frames?
grant_table.h doesn't have much to say about it.

And lastly, given that I want the v2 grant ABI exclusively, I presume it's
sufficient to call GNTTABOP_set_version (version=2) first thing and abort
if it failed? Presumably the default is always v1 at start of day?

Thanks,

-mato

