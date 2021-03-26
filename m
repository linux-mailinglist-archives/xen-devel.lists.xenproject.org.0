Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89734AB2E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 16:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101900.195207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPo9w-0003cb-U8; Fri, 26 Mar 2021 15:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101900.195207; Fri, 26 Mar 2021 15:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPo9w-0003cA-Qa; Fri, 26 Mar 2021 15:14:00 +0000
Received: by outflank-mailman (input) for mailman id 101900;
 Fri, 26 Mar 2021 15:13:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPo9v-0003c5-Jn
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:13:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPo9v-00011c-Fv
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:13:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPo9v-0007l5-Dp
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:13:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPo9r-000314-Vw; Fri, 26 Mar 2021 15:13:56 +0000
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
	bh=mfXmjG6WhD53JA7nEtCeld2rk+rBamrcvPIh3FyzIJA=; b=FtAkZ2RvoOSx7yRhp6njht/3KI
	u69BPnGelnlQ4hoynznbpgCC3IIX024/GZdbrc/Hq7shzwLClKZ9ZsobCQjtpcvtBhqtPbBVQ4wty
	wkRSB5L+PZ8LmXx2G9ET9KRqdgudIhCq2a4dRl54tZ69JPjT6Tri+gOmfMQY+SzgQasI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.64051.783683.771246@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 15:13:55 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15 v1.1 1/3] Revert "x86/msr: drop compatibility #GP
 handling in guest_{rd,wr}msr()"
In-Reply-To: <b5858e08-627e-742a-055e-84d6768d93f5@suse.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
	<b5858e08-627e-742a-055e-84d6768d93f5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH for-4.15 v1.1 1/3] Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()""):
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> In hindsight, this was a poor move.  Some of these MSRs require probing for,
> cause unhelpful spew into xl dmesg, or cause spew from unit tests explicitly
> checking behaviour.
> 
> This restores behaviour close to that of Xen 4.14, meaning in particular
> that for all of the MSRs getting re-added explicitly a #GP fault will get
> raised irrespective of the new "msr_relaxed" setting.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> ---
> v1.1: Fold in suggested description adjustments.
> ---
> For 4.15.  Restoring behaviour closer to 4.14, and prereq for a bugfix needing
> backporting.

Thank you, and thanks for the helpful irc discussion.

Acked-by: Ian Jackson <iwj@xenproject.org>

I will commit this shortly.

For the record, we concluded on irc that we weren't sure that 2/ and
3/ of this series were right, so we are not going to include them in
4.15, pending further consideration/investigation.

Ian.

