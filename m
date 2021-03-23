Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A418E34661C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 18:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100760.192180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOke1-0005mN-N2; Tue, 23 Mar 2021 17:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100760.192180; Tue, 23 Mar 2021 17:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOke1-0005ly-Jz; Tue, 23 Mar 2021 17:16:41 +0000
Received: by outflank-mailman (input) for mailman id 100760;
 Tue, 23 Mar 2021 17:16:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOkdz-0005lt-IW
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:16:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOkdz-00032R-GN
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:16:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOkdz-0003QM-Ep
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:16:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOkdw-0002fD-AZ; Tue, 23 Mar 2021 17:16:36 +0000
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
	bh=bI4NZf2HAHio7uKY4yrlR7vk5oRj71r1YR8NmdUHHQw=; b=EuASxdNu70SwbUgRsaB0xACwHi
	7G63xG0lagjZeNAj2Dv+Y+MTwMWp+i1bOiUkVS80EmLZd2P2+OlnmC45LpIW80g0TxRsB0JtetTCg
	8gjNIQtAgy/UZ58K9Yu1OnSeVD9SwZ1T/jHHHgotN68H5yt+NRRGY41LGF+p+MSzu0FA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24666.8820.146895.73948@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 17:16:36 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    community.manager@xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    committers@xenproject.org,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
In-Reply-To: <f0c1df6d-2fcc-11b7-1a90-9a0aa2019686@suse.com>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
	<0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com>
	<24666.7414.232768.961456@mariner.uk.xensource.com>
	<f0c1df6d-2fcc-11b7-1a90-9a0aa2019686@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow"):
> On 23.03.2021 17:53, Ian Jackson wrote:
> >> One option of course is, like was just done for 4.13.3, to revert.
> >> Iirc Andrew had some thoughts towards making the new piece of code
> >> conditional upon the original issue actually hitting.
> > 
> > I would be very happy to consider a revert it someone would give me
> > references and explain to me the implications in words of one
> > syllable.
> 
> Reference: e1de4c196a2e "x86/timer: Fix boot on Intel systems using
> ITSSPRC static PIT clock gating"
> 
> Reverting would unbreak Xen on the Ryzen 1800X system where the
> breakage was reported for, and likely a few others. It would at the
> same time re-introduce Xen failing to boot on at least some Icelake
> (and yet newer) systems.

Thanks.  That explanation and the reference makes everything clear for
me.

> >> Another
> >> (somewhat similar) option might be to hide the new piece of code
> >> behind a default-off command line option.
> > 
> > Likewise.
> 
> Well, not sure what to say here. Introducing a command line option
> to allow making Icelake systems boot (by use of the option) while
> keeping things working by default on older hardware is about as
> simple as an explanation here can get, I guess.

Right.

The revert seems unattractive.  Your suggested command line option
sounds like a good workaround to me.  Under the circumstances it seems
like it should default to the old behaviour, as I think you are
suggesting.

So I am be inclined to ask if you, Jan, would prepare a patch
implementing such an option.  Anyone else have any opinions ?

Thanks,
Ian.

