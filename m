Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC298C7A9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 23:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808523.1220442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svkWn-0001Fh-IK; Tue, 01 Oct 2024 21:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808523.1220442; Tue, 01 Oct 2024 21:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svkWn-0001DF-FS; Tue, 01 Oct 2024 21:35:29 +0000
Received: by outflank-mailman (input) for mailman id 808523;
 Tue, 01 Oct 2024 21:35:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O0ff=Q5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svkWm-0001D9-0L
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 21:35:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12282c20-803d-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 23:35:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18F4E5C0252;
 Tue,  1 Oct 2024 21:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EACC4CEC6;
 Tue,  1 Oct 2024 21:35:23 +0000 (UTC)
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
X-Inumbo-ID: 12282c20-803d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727818524;
	bh=6I4dXHMTxzj/LFVucix2L+nSq/dLwqUZqHSBO22muLk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FBy807igMdBHqxSng0+wlZn0bkltRg9xi3XBzf8TkqioEd538jXs0XUNfsGzyBX5N
	 sF4TEBywDfCjiIq9dVIx09qbTBsbpi8ghs1Gal47MqVG5VuQa1U1dgeqNWrPJjUkJV
	 w6QqNu0qT8duX38A5YfrHOtGV/mZKoYYEqo+kq6PS5LZiLf2oIyFpsFnIzR4FHYoRV
	 PUecn93GVKffB9qb4vQctDzPAB9AUKu+VdhzLRhkX9HpuXedCr+3kem9KZnIL0WsF1
	 n2c+giaL+hw1TViqK+6wKm6HyrvczCDSkeBIZGT8hy2PjYpijH4GVue+ym8rsKbMu0
	 hb4pJ/OVQR1ng==
Date: Tue, 1 Oct 2024 14:35:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [XEN PATCH v2 2/3] xen/gnttab: address a violation of MISRA C
 Rule 13.6
In-Reply-To: <f54ffc9e-3721-412e-be52-c93a1a801cca@suse.com>
Message-ID: <alpine.DEB.2.22.394.2410011433361.451631@ubuntu-linux-20-04-desktop>
References: <cover.1727690180.git.federico.serafini@bugseng.com> <cfd2873eb69707ec3f33ea888951ae5676c43bab.1727690180.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2409301549100.451631@ubuntu-linux-20-04-desktop>
 <f54ffc9e-3721-412e-be52-c93a1a801cca@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Oct 2024, Jan Beulich wrote:
> On 01.10.2024 00:53, Stefano Stabellini wrote:
> > On Mon, 30 Sep 2024, Federico Serafini wrote:
> >> --- a/xen/common/compat/grant_table.c
> >> +++ b/xen/common/compat/grant_table.c
> >> @@ -78,12 +78,15 @@ int compat_grant_table_op(
> >>          cmd_op = cmd;
> >>      switch ( cmd_op )
> >>      {
> >> -#define CASE(name) \
> >> -    case GNTTABOP_##name: \
> >> -        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
> >> -                                                           gnttab_##name##_compat_t), \
> >> -                                         count)) ) \
> >> -            rc = -EFAULT; \
> >> +#define CASE(name)                                                  \
> >> +    case GNTTABOP_ ## name:                                         \
> >> +    {                                                               \
> >> +        XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
> >> +            guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
> >> +                                                                    \
> >> +        if ( unlikely(!guest_handle_okay(h, count)) )               \
> >> +            rc = -EFAULT;                                           \
> >> +    }                                                               \
> >>          break
> > 
> > We would typically put the break within the case { }
> 
> That won't work very well with the break not having a semicolon, for the
> semicolon to actually be used when invoking the macro. Moving the break
> (while adding a semicolon there) as you suggest would then mean the use
> site semicolon to end up being an unreachable statement.

I didn't think of the extra semicolon posing a problem. In that case, it
is better as it is in this patch

