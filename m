Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C774975DF3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 02:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796912.1206627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXcn-0004dM-Si; Thu, 12 Sep 2024 00:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796912.1206627; Thu, 12 Sep 2024 00:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soXcn-0004bL-Pf; Thu, 12 Sep 2024 00:23:53 +0000
Received: by outflank-mailman (input) for mailman id 796912;
 Thu, 12 Sep 2024 00:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1soXcm-0004bF-H7
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 00:23:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48d5ca4f-709d-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 02:23:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B0365C0516;
 Thu, 12 Sep 2024 00:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4040C4CEC0;
 Thu, 12 Sep 2024 00:23:48 +0000 (UTC)
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
X-Inumbo-ID: 48d5ca4f-709d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726100629;
	bh=lzr/992QG5dKD9nYp3gLg6pRUny6m7myukesoG+TOBE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hq4KnSxmINzM92+8cdQqgDwE/1h4Tt+ehuFywkJY48uthKGMSH5SzdT++sN/TVNFN
	 qX82vZdqnIMIUZpuKogaCqpJBj8rgCAGHSsyW+Z0JPnYyzKrXIfO4//+yiYDVgtoLX
	 gpyP5DyyL9uspr/kUqkfMQS+xf4tlpmwHwLSmJUlSyYpzgj2bWKKHmJ4Go6ex8F8NJ
	 KkNYjUYxDnQT1tXc6tuDMLeJEFHIFnDiH4VAveu7V7zVPcJ/qnMZ5chzho5i2CvlA9
	 CI3BnkNMuKDQNlY98fyWOxa6iJTB9AYEkqngMNAZCCtud8qnZxdx4WVNwq48HeBHny
	 s2l+qxP2IfLvg==
Date: Wed, 11 Sep 2024 17:23:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/3] xen/gnttab: address violations of MISRA C Rule
 13.6
In-Reply-To: <647cf7c8-7917-4f60-8a59-c7eb2e3977a5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409111719261.611587@ubuntu-linux-20-04-desktop>
References: <cover.1725994633.git.federico.serafini@bugseng.com> <6dd66745505bea8f8730da297d521e842026d40b.1725994633.git.federico.serafini@bugseng.com> <647cf7c8-7917-4f60-8a59-c7eb2e3977a5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Sep 2024, Jan Beulich wrote:
> On 10.09.2024 21:06, Federico Serafini wrote:
> > --- a/xen/common/compat/grant_table.c
> > +++ b/xen/common/compat/grant_table.c
> > @@ -78,12 +78,15 @@ int compat_grant_table_op(
> >          cmd_op = cmd;
> >      switch ( cmd_op )
> >      {
> > -#define CASE(name) \
> > -    case GNTTABOP_##name: \
> > -        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
> > -                                                           gnttab_##name##_compat_t), \
> > -                                         count)) ) \
> > -            rc = -EFAULT; \
> > +#define CASE(name)                                                      \
> > +        case GNTTABOP_ ## name:                                         \
> 
> Why the re-indentation? The earlier way was pretty intentional, to match
> what a non-macroized case label would look like in this switch.
> 
> > +        {                                                               \
> > +            XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
> > +                guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
> > +                                                                        \
> > +            if ( unlikely(!guest_handle_okay(h, count)) )               \
> > +                rc = -EFAULT;                                           \
> 
> Same question as for the earlier patch - where's the potential side
> effect?

Leaving aside the re-indentation / readability changes, I think the fix
is to move the call to guest_handle_cast out of guest_handle_okay.

Since guest_handle_okay is implemented by calling sizeof on *h.p, I am
guessing that passing guest_handle_cast() as h causes problems. I am not
sure if there is a side effect, I cannot spot one, but I can see that
the nested macros could cause issues to a static analyzer.

