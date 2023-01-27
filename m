Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F21667ED9E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485868.753295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTbD-0003ho-Tb; Fri, 27 Jan 2023 18:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485868.753295; Fri, 27 Jan 2023 18:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTbD-0003fS-Qp; Fri, 27 Jan 2023 18:37:19 +0000
Received: by outflank-mailman (input) for mailman id 485868;
 Fri, 27 Jan 2023 18:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in7c=5Y=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pLTbC-0003ey-FT
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:37:18 +0000
Received: from hedgehog.birch.relay.mailchannels.net
 (hedgehog.birch.relay.mailchannels.net [23.83.209.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e668548-9e71-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 19:37:16 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 0CCE1821481
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 18:37:14 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 6B8838210A4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 18:37:13 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.109.196.237 (trex/6.7.1); Fri, 27 Jan 2023 18:37:13 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4P3RBc6yQ7zRW
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 10:37:12 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00cb by kmjvbox (DragonFly Mail Agent v0.12);
 Fri, 27 Jan 2023 10:37:10 -0800
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
X-Inumbo-ID: 9e668548-9e71-11ed-a5d9-ddcf98b90cbd
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674844633; a=rsa-sha256;
	cv=none;
	b=4LFIQX4S3tZOfDEp+xy33gVo7jaLUXDb6wet+ASLjAPV261Zy61B5oNRM5WO3f38Mv4Cwh
	kWCYXPe4G/NV2JsOZIKd2D/0QYiTpixH3dwMHJvS8Epo+CRktRJ5BIKedNQ/1lrWzhRZHz
	4B5SgdQrkx9t/bDlKK/BGDxY7glJeowCCNXBeVjxtCqfs+thsPdqIkVYAjeF3kCDCRmArl
	vAE/IhN9Y/6DOdnP9Ju7fHfYh5MJhh7sFen4muBlkc/+UP9+PuOukJ5qxueAgFaSWkrcp0
	DYj8fMag+5MC4fFE7aSdqYhzfl4Yi5zrLuJ+ReFl5qwKPQDXYAzITEdwFXK4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674844633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=vC3M/mfIsIhsrlC/2752bkkfLE5eFiFR7/YgAX2CWkQ=;
	b=yl6L32KYOt6vAiden3mXGMIuOW4QJGmIyvYbS4QACsve5R6toAG8wKPXp3JPI3LHF6t9Y3
	2O8Xt0n7CngQl3ckXltPxZ96u/0S+/BiKZhElUpX9d6A0VU9TQ1A9fxve7L5zZFQImeFv0
	jp8YOtj+kq66VKuR6QbG8PA6NzA7lZF/iD0TM3qjUMM+PC7Ep6bMEys300k6itNDTY9aFD
	MSl9v2LMjA+2MGPrT22/QilrhXUn0fDhA3tipI1PmuIt5/n7yY+oCyoRp45zLZp1CbktGO
	rIP0qlUy9fFwFLhC8mHcGa94YtAcD6vm7TSe0W85Auu1Uifq87XIxo7IHUrnhg==
ARC-Authentication-Results: i=1;
	rspamd-5fb8f68d88-ns49n;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Cellar-Desert: 69ec801c50ba458a_1674844633707_1631481390
X-MC-Loop-Signature: 1674844633707:3962874044
X-MC-Ingress-Time: 1674844633707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674844633;
	bh=vC3M/mfIsIhsrlC/2752bkkfLE5eFiFR7/YgAX2CWkQ=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=LQDyrquGMufpYTWZcxE/lTdolWwj4LkVZJr7xMOWeniv+6FbHxPDpGUL3frJDSNnm
	 3yD9p80QhCepSzi+Ft5o8pkZuF9AfftmEGiNxNFiS1sP45KPX7Bq6VZ7CJIcpZgIYh
	 H3z+JMWbZ8Wb2fEx5regjVx3GyxlQpBI56EoMqG0=
Date: Fri, 27 Jan 2023 10:37:10 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230127183710.GA1955@templeofstupid.com>
References: <20230125184506.GE1963@templeofstupid.com>
 <77576aab-93bf-5f6a-9b04-17eaf1d84ffb@suse.com>
 <20230126180244.GB1959@templeofstupid.com>
 <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c4eb4ba-4314-02c7-62d5-b08a3573fcc2@suse.com>

On Fri, Jan 27, 2023 at 08:16:18AM +0100, Jan Beulich wrote:
> On 26.01.2023 19:02, Krister Johansen wrote:
> > On Thu, Jan 26, 2023 at 10:57:01AM +0100, Jan Beulich wrote:
> >> On 25.01.2023 19:45, Krister Johansen wrote:
> >>> --- a/xen/include/public/arch-x86/cpuid.h
> >>> +++ b/xen/include/public/arch-x86/cpuid.h
> >>> @@ -72,6 +72,14 @@
> >>>   * Sub-leaf 2: EAX: host tsc frequency in kHz
> >>>   */
> >>>  
> >>> +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
> >>> +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
> >>> +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
> >>> +#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
> >>> +#define XEN_CPUID_TSC_MODE_EMULATE           (1u)
> >>> +#define XEN_CPUID_TSC_MODE_NOEMULATE         (2u)
> >>> +#define XEN_CPUID_TSC_MODE_NOEMULATE_TSC_AUX (3u)
> >>
> >> Actually I think we'd better stick to the names found in asm/time.h
> >> (and then replace their uses, dropping the #define-s there). If you
> >> agree, I'd be happy to make the adjustment while committing.
> > 
> > Just to confirm, this would be moving these:
> > 
> >    #define TSC_MODE_DEFAULT          0
> >    #define TSC_MODE_ALWAYS_EMULATE   1
> >    #define TSC_MODE_NEVER_EMULATE    2
> >    
> > To cpuid.h?  I'm generally fine with this.  I don't see anything in
> > Linux that's using these names.  The only question I have is whether
> > we'd still want to prefix the names with XEN so that if they're pulled
> > in to Linux it's clear that the define is Xen specific?  E.g. something
> > like this perhaps?
> > 
> >    #define XEN_TSC_MODE_DEFAULT          0
> >    #define XEN_TSC_MODE_ALWAYS_EMULATE   1
> >    #define XEN_TSC_MODE_NEVER_EMULATE    2
> > 
> > That does increase the number of files we'd need to touch to make the
> > change, though. (And the other defines in that file all start with
> > XEN_CPUID).
> > 
> > Though, if you mean doing it this way:
> > 
> >    #define XEN_CPUID_TSC_MODE_DEFAULT          0
> >    #define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE   1
> >    #define XEN_CPUID_TSC_MODE_NEVER_EMULATE    2
> >  
> > then no objection to that at all.  Apologies for overlooking the naming
> > overlap when I put this together the first time.
> 
> Yes, it's the last variant you list that I was after. And I'd be okay to
> leave dropping the so far private constants to a separate follow-on patch.

Ok, thanks. I'll send you a v3 that makes these changes, unless you've
already fixed this up and committed the v2.  In that case, feel free to
disregard.

-K

