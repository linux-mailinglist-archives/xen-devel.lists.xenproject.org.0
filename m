Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237743CDD1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 17:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217082.376927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfl2A-0002rd-1c; Wed, 27 Oct 2021 15:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217082.376927; Wed, 27 Oct 2021 15:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfl29-0002q5-U3; Wed, 27 Oct 2021 15:40:09 +0000
Received: by outflank-mailman (input) for mailman id 217082;
 Wed, 27 Oct 2021 15:40:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfl28-0002pE-OC
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 15:40:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfl28-0006bC-LK
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 15:40:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mfl28-0007lx-KN
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 15:40:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mfl1v-0007ml-8b; Wed, 27 Oct 2021 16:39:55 +0100
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
	bh=vz66shXEZb+9ivv9wFPjwWjuGbdx0hkL6b04z5V0o/4=; b=tBKOaeGZkcOtLncMrjFRORXwjm
	rUUR3475BhWIv87y6LoaVqt1EmDe0iGpufRwyz//AWkZBpnM6IiNXUlRkkrKQ4u8WyODEBDKPVfl/
	e9sdmXEekEnIyd8zjH9JkQzh3DWTbjIjKdKAPzQnbc6Tp5lteOeU8DEomaY2jsRY1+mE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24953.29377.25284.598334@mariner.uk.xensource.com>
Date: Wed, 27 Oct 2021 16:39:45 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] x86/cpuid: prevent decreasing of hypervisor max leaf on migration
In-Reply-To: <20211027140050.67509-1-roger.pau@citrix.com>
References: <20211027140050.67509-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH] x86/cpuid: prevent decreasing of hypervisor max leaf on migration"):
> In order to be compatible with previous Xen versions, and not change
> max hypervisor leaf as a result of a migration, keep the clamping of
> the maximum leaf value provided to XEN_CPUID_MAX_NUM_LEAVES, instead
> of doing it based on the domain type. Also set the default maximum
> leaf without taking the domain type into account. The maximum
> hypervisor leaf is not migrated, so we need the default to not regress
> beyond what might already be reported to a guest by existing Xen
> versions.
> 
> This is a partial revert of 540d911c28 and restores the previous
> behaviour and assures that HVM guests won't see it's maximum
> hypervisor leaf reduced from 5 to 4 as a result of a migration.
> 
> Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> ---
> Regarding release risks:
> 
> This is a partial revert of a commit.  The main issues could be that a
> partial revert could break the build or leave the remaining code in a
> non-working condition.
> 
> Breaking the build will be easily discovered by our automated testing,
> while leaving the remaining code in a broken state is unlikely, as the
> chunks reverted are isolated from the rest of the change in
> 540d911c28.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks

