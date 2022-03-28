Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B94E9C21
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 18:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295525.502947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYs7q-0007vu-H6; Mon, 28 Mar 2022 16:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295525.502947; Mon, 28 Mar 2022 16:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYs7q-0007t4-Dw; Mon, 28 Mar 2022 16:21:50 +0000
Received: by outflank-mailman (input) for mailman id 295525;
 Mon, 28 Mar 2022 16:21:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nYs7o-0007sy-WC
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 16:21:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f086d1-aeb3-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 18:21:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85ED1B80FB5;
 Mon, 28 Mar 2022 16:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A805AC004DD;
 Mon, 28 Mar 2022 16:21:44 +0000 (UTC)
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
X-Inumbo-ID: 29f086d1-aeb3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648484505;
	bh=uRYN3bBgKEd3lJ7mQSLDvJ9fEn6gxA4nHhXk5dX+5Tg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MA69E8Z+kZmWhUgwjousYekH46+YoU5pIY/gIa5kKxorQYo/FkHw14j4N89IrRGSP
	 kA9k+ROGg75WZ7HdV2s1fXEvY0f+Q7kn63btSLzFAbfURg7uEnVeGsmSllIzigH1kg
	 Bo6jxtvUEY4CgEJG5JlNSefe2xsLo2+Wq6EKzDkIyZHKmSdfYwI7XNUxi4hT6OqBkZ
	 gYpIfQUykAbvOeqafeqTnDQw3YgrPlwlh4h+dBNxde1jhLmrjTBjXNZZ/0jB9Ux0uf
	 r7gPyTmCupWYryuLuG2JT8fiigFiwjBgZUH3kJNk9v5RAF+O3+jSxLkb/k2j/lX7U/
	 HfiWclM+wfRsw==
Date: Mon, 28 Mar 2022 09:21:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v4 4/6] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <960D7451-2186-4950-80B7-B3F5C961336D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203280918270.2910984@ubuntu-linux-20-04-desktop>
References: <20220324140633.39674-1-luca.fancellu@arm.com> <20220324140633.39674-5-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2203251539510.2910984@ubuntu-linux-20-04-desktop> <960D7451-2186-4950-80B7-B3F5C961336D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-537196217-1648484505=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-537196217-1648484505=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 28 Mar 2022, Luca Fancellu wrote:
> >> +
> >> +        if ( !dt_property_read_string(phandle_node, "cpupool-sched",
> > 
> > This should be "node", not phandle_node
> 
> Hi Stefano,
> 
> Yes sorry about that, I didn’t notice it because in my last test I was creating pools
> with default scheduler, I will pay more attention next time, same applies to the
> scheduler swap. I’ll fix them in next serie

All right, thanks


> >> +                                      &scheduler_name) )
> >> +            sched_id = check_and_get_sched_id(scheduler_name);
> > 
> > It would be nice if we had XENLOG_INFO printks to print at boot for each
> > CPU:
> > - the PoolID
> > - the scheduler name
> > Not required, but I had to add them to figure out exactly what was going
> > on.
> 
> I’ve added a printk in btcpupools_get_cpupool_id, do you want me to remove from
> there and print here? 

I don't particularly mind where the printks are added as long as they
get printed once with XENLOG_INFO :-)

In this version of the series the scheduler name (or the ID) was
missing. I was asking because for testing purposes one would like to
know the combinations [CPU -- PoolID -- Scheduler].
--8323329-537196217-1648484505=:2910984--

