Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD7899269
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701037.1095061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsX4t-0007gv-2Y; Fri, 05 Apr 2024 00:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701037.1095061; Fri, 05 Apr 2024 00:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsX4s-0007er-UE; Fri, 05 Apr 2024 00:05:06 +0000
Received: by outflank-mailman (input) for mailman id 701037;
 Fri, 05 Apr 2024 00:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsX4q-0007el-MD
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:05:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d79156-f2e0-11ee-afe5-a90da7624cb6;
 Fri, 05 Apr 2024 02:05:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 68C94CE314D;
 Fri,  5 Apr 2024 00:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D58C433F1;
 Fri,  5 Apr 2024 00:04:58 +0000 (UTC)
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
X-Inumbo-ID: 25d79156-f2e0-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712275499;
	bh=hlPLl9kOrj1bnGQiJPT9p/7QCXrhaKFXx+yK0bGFZsw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gdjTLogAe1t3RtdgrjvvjlXK6jjHKOwb4tE7xWDO2FhqwteLtBtDzdvTDtEN0GZyb
	 FQKUoH8EzVv991msLxrIBpX+06ilP2d794sBqEpw9QJDN4sQB56mXIwBGImxEXVwpB
	 wYqwSWS+q5Z99Ro6MYdGWxiDs1bELEXqAgGzSnUy1u1SkpIr4F1snymf5bOA7W7Kem
	 Aks3j6Ik1EMt42V0nWF9zMYnuuhNpmEi20+vFW7hReXuB1RlvwlQWYxUgBDyh9B2UK
	 pC0QVVuyHtHDQPNPCj6zgJTJtu0azmpyMtF4mEDmJASSAJHFCMi8Gyq0SZcaopdOfi
	 J1mEzmPEDKBPw==
Date: Thu, 4 Apr 2024 17:04:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automaton/eclair: add deviations for MISRA C:2012
 Rule 13.6
In-Reply-To: <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404041701530.2245130@ubuntu-linux-20-04-desktop>
References: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com> <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Apr 2024, Jan Beulich wrote:
> Further, according to the discussion on the matter: alternative_call() is
> quite similar in this regard, just that it uses typeof(). Imo it should be
> deviated here as well right away, no matter whether Eclair can actually be
> configured to also check typeof() and alignof().

On this specific point regarding typeof, I agree but it should be done
as a separate rule (not 13.6), to make sure it matches the scanner
results. It looks like the new rule will be called B.MISLEFF. 

