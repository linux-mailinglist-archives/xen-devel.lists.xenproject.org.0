Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB78310D34
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 16:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81807.151231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l839V-0007r8-CT; Fri, 05 Feb 2021 15:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81807.151231; Fri, 05 Feb 2021 15:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l839V-0007qj-9B; Fri, 05 Feb 2021 15:36:09 +0000
Received: by outflank-mailman (input) for mailman id 81807;
 Fri, 05 Feb 2021 15:36:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l839T-0007qe-Lx
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:36:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l839T-0000Xh-Jn
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:36:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l839T-0002Qy-Gj
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:36:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l839Q-0002yP-3v; Fri, 05 Feb 2021 15:36:04 +0000
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
	bh=T6yOPSS0BQ1BHig02gmxg61Rp3kdqQeTr9C2cHW8R8Q=; b=U4j8YNWpVBPD4aI+0D8jF/m8Iv
	mp5G2pZ7FwulNggxblqepUWT+dExfIbq9K77l6lDtfjaICBn7qu6E9MUTw98WpDZ/WF3HGdi4paUF
	XXqqNiWxHvGgvBtl/tLeJCa8SP8JFJ7i8LUnsXTDp+6jfB/FEJi10Ra1nzHro8QuDu78=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24605.26083.900493.802201@mariner.uk.xensource.com>
Date: Fri, 5 Feb 2021 15:36:03 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jun  Nakajima <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Tamas  K Lengyel <tamas@tklengyel.com>,
    George Dunlap <George.Dunlap@eu.citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Paul Durrant <paul@xen.org>,
    Hubert  Jasudowicz <hubert.jasudowicz@cert.pl>
Subject: Re: [PATCH v9 00/11] acquire_resource size and external IPT
 monitoring [and 1 more messages]
In-Reply-To: <e2cecfe6-2cd0-0d92-8f17-0283bc1f8503@citrix.com>,
	<86f9845f-f0a5-93c7-0703-c3a51d50febc@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
	<20210201232703.29275-2-andrew.cooper3@citrix.com>
	<86f9845f-f0a5-93c7-0703-c3a51d50febc@citrix.com>
	<24601.17287.280124.602809@mariner.uk.xensource.com>
	<e2cecfe6-2cd0-0d92-8f17-0283bc1f8503@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Thanks, Andy, for those writeups.  I still have substantial misgivings
I don't feel confident.  However, I don't think continuing attempts to
try to understand and/or mitigate this risk will be helpful.  I need
to make a decision now.

I think there are significant downsides to either choice here.  At
this stage of the freeze I am going to err on the side of saying
"yes", so, for the whole series:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Provied this is committed by the end of Monday at the very latest.  I
would appreciate it if it could be committed today.

Thanks,
Ian.

