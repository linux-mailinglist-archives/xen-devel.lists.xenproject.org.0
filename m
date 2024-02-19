Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCDE85AD6B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 21:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683103.1062438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcAUA-0000VA-RM; Mon, 19 Feb 2024 20:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683103.1062438; Mon, 19 Feb 2024 20:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcAUA-0000S1-Om; Mon, 19 Feb 2024 20:43:34 +0000
Received: by outflank-mailman (input) for mailman id 683103;
 Mon, 19 Feb 2024 20:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rUMX=J4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rcAU9-0000Rv-AV
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 20:43:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 898f104b-cf67-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 21:43:30 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 52C5FCE13D5;
 Mon, 19 Feb 2024 20:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761A7C433F1;
 Mon, 19 Feb 2024 20:43:24 +0000 (UTC)
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
X-Inumbo-ID: 898f104b-cf67-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708375405;
	bh=etgfJdMjjdz4/PTBfMtqsev8L5RcYHGrkiaTddoYzQg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VH9YRttP2wW8bM7gCwQbVEhQXuBzQmbxIPcM/9OOTNmefTkvrmTw9iE3RklPQkwlM
	 Vjqr1mGOVPwJB6DoUJe119Rqy2Xbkl+uKjagrHbfUauGgu49NUnhn2MYfg+Y9hVnDk
	 iqcoixTSqysrkHL/8RV9Nv8rNCSfdDQ/ECjF+piz45S/njvzLbNZZkS1QvyvDWcNsk
	 cHR/kDa49XIcFM2RIrS/mWGhCCG6KHeWY72C3iYjupH+7lkInEA93NUmGBCpDlGEv+
	 yx9PvrWAm3TZujXXWUbOAZampJCeiG0XWKmhdZK1AbS1b4svxWWAWoDHo94tD09p5g
	 P0IwNhDwAjrmg==
Date: Mon, 19 Feb 2024 12:43:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
In-Reply-To: <56b4a4bb-d3e8-4a21-8c0d-d4ee10c8f9b3@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402191243090.155645@ubuntu-linux-20-04-desktop>
References: <cover.1706259490.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop> <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com> <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com> <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com> <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com> <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com> <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com> <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com> <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com> <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com> <35249e32-9eb2-4c51-868d-de2cd2d8230b@bugseng.com>
 <45c19a87-5833-4350-a374-3a70fd3aa9ae@suse.com> <d735e980-c5a5-46b1-a511-cc2d666dac23@bugseng.com> <123c446c-e56f-457e-9cf4-58a43a3b069a@suse.com> <56b4a4bb-d3e8-4a21-8c0d-d4ee10c8f9b3@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Feb 2024, Federico Serafini wrote:
> On 15/02/24 11:32, Jan Beulich wrote:
> > The important difference is: Here we're told that there was a use of
> > __put_user_bad, which is easy to grep for, and thus see how the
> > supplied function / file / line(?) relate to the ultimate problem.
> > 
> > I'm afraid I'm meanwhile confused enough by the various replies
> > containing results of experimentation that I can't really tell
> > anymore what case is best. Hence I can only restate my expectation for
> > an eventual v3: Diagnosing what the issue is, no matter whether the new
> > macro is used in another macro or in an inline function, should not
> > become meaningfully more difficult. In how far this is the case wants
> > clarifying in the description of the change.
> 
> I think the best thing at the moment is to deviate
> __{get,put}_user_bad() for Rule 16.3.
> I'll let maintainers further explore the possibility of having a
> compile-time assertion based on the assembler error.

OK. I hope Jan is OK to deviate by in-code comment.

