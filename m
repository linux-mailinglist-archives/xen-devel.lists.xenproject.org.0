Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8445C9F3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 17:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230469.398397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpv5A-0000Kd-GT; Wed, 24 Nov 2021 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230469.398397; Wed, 24 Nov 2021 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpv5A-0000Hl-C9; Wed, 24 Nov 2021 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 230469;
 Wed, 24 Nov 2021 16:25:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpv59-0000Hf-5C
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 16:25:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpv58-0002iH-Vt
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 16:25:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpv58-0003KN-Uk
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 16:25:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mpv4v-0003J0-JQ; Wed, 24 Nov 2021 16:25:01 +0000
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
	bh=eg5zGldfT2FiQyNxzPJlqUmijkyQ5fWzi+aq3jBZArw=; b=F4ue7nxjWQaYu+B2WGQqWbwlUr
	+oaf8D8KCs0AtQShIcfXWR+gLwlvJAZ+9QOh66XUAgxvxOB8QgRC9JoFfQ+Gioy+IeSWRYq7F0EVh
	3zYKNUlDUZipD7MsRuxLs/xBl7dDaep5bk32NTsEPQPd3SvczWWbv95cOb1qgHRb3pls=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24990.26451.287618.213116@mariner.uk.xensource.com>
Date: Wed, 24 Nov 2021 16:24:51 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies
In-Reply-To: <20211124161649.83189-1-roger.pau@citrix.com>
References: <20211124161649.83189-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies"):
> Shrinking max policies can lead to failures in migration as previous
> versions of Xen didn't shrink the number of leaves in any case, so
> it's possible for a guest created on previous versions of Xen that
> pass CPUID data on the migration stream to contain a max leaf number
> greatest than the one present on the max policies in versions of Xen
> containing 540d911c28.
> 
> Such failure was seen by osstest when doing a migration from Xen
> 4.15 to Xen 4.16-rc on a pair of equal boxes, the noceras.
> 
> Fix this by preventing any shrinking of the max CPUID policies, so
> that previously built guest CPUID policies are compatible.
> 
> Fixes: 540d911c28 ('x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
...
> This is a regression from Xen 4.15, so should be considered for Xen
> 4.16. The main risks would be to mess up with the CPUID policy in a
> different way, that would also lead to brokenness. Strictly speaking
> the change here removes the shrinking of max leaves and restores the
> previous behavior, but it's obviously not completely risk free.
> 
> It has proven to fix the regression seen on the noceras.

Ouch.

Questions from my RM hat:

Is there a workaround ?
What proportion of machines do we think this might affect ?

Jan, Andy, do you have an opinion ?

Ian.

