Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CABF48E21B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 02:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257516.442558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8BH5-0001cp-0V; Fri, 14 Jan 2022 01:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257516.442558; Fri, 14 Jan 2022 01:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8BH4-0001ZO-Rv; Fri, 14 Jan 2022 01:21:02 +0000
Received: by outflank-mailman (input) for mailman id 257516;
 Fri, 14 Jan 2022 01:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chGx=R6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n8BH2-0001ZI-Lw
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 01:21:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ab5b4c9-74d8-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 02:20:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 372CFB82348;
 Fri, 14 Jan 2022 01:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3588C36AE3;
 Fri, 14 Jan 2022 01:20:56 +0000 (UTC)
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
X-Inumbo-ID: 3ab5b4c9-74d8-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642123257;
	bh=7jKtizpYET/VQJSbteT3EIo6byYqvsli87vaL3mMhJQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bgiGW8t+PJS7ChFQi0dMnQ8GoGvFsW+0mdyGgnRultLkMhnl66frgYX3hnUlEkbCn
	 Q+3NhoLmQFmdkcqBK9LoFcycXugnu4s8evNvD1zHlZwQrbkf7jx9EVP1TAG41sm7Od
	 03vHKxDMd9k+OEI8sWNFv4RBrXBKW8UPggs9xwxTZXZSmxc8WUuXZQ8N50Cxj03J9Q
	 QpjiUCp4f6AjtxRA0rW4tnEk2NaHwyUaCog9OG2WfSSbF9yylpb8oL4o6FIFEpsRG8
	 /Oo/wPOTtDHXvKPr+Pgkgavsa3nTEsggII4jXAvnUyVD3Npt7uV2VVXQzedWILm9A+
	 NeWLYSdGmA/gA==
Date: Thu, 13 Jan 2022 17:20:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    Bertrand.Marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
In-Reply-To: <4ac4cdbe-a3bf-2be1-1e1b-789ac5de067f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2201131713140.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-2-sstabellini@kernel.org> <4ac4cdbe-a3bf-2be1-1e1b-789ac5de067f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Jan 2022, Jan Beulich wrote:
> On 13.01.2022 01:58, Stefano Stabellini wrote:
> > --- a/xen/common/event_channel.c
> > +++ b/xen/common/event_channel.c
> > @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
> >      return 0;
> >  }
> >  
> > -static int get_free_port(struct domain *d)
> > +int get_free_port(struct domain *d)
> 
> The name of the function isn't really suitable for being non-static.
> Can't we fold its functionality back into evtchn_allocate_port() (or
> the other way around, depending on the perspective you want to take)
> in case the caller passes in port 0? (Btw., it is imo wrong for the
> loop over ports to start at 0, when it is part of the ABI that port
> 0 is always invalid. evtchn_init() also better wouldn't depend on it
> being the only party to successfully invoke the function getting back
> port 0.)

I agree that "get_free_port" is not a great name for a non-static
function. Also, it should be noted that for the sake of this patch
series I could just call evtchn_allocate_port(d, 1) given that it is the
first evtchn to be allocated. So maybe, that's the best way forward?


To address your specific suggestion, in my opinion it would be best to
have two different functions to allocate a new port:
- one with a specific evtchn_port_t port parameter
- one without it (meaning: "I don't care about the number")

Folding the functionality of "give me any number" when 0 is passed to
evtchn_allocate_port() doesn't seem to be an improvement to the API to
me.

That said, I am still OK with making the suggested change if that's what
you prefer.

Another alternative is simply to rename "get_free_port" to
"evtchn_allocate" (or something else to distinguish it from
evtchn_allocate_port).

