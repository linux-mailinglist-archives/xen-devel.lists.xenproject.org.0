Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F245CCAD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 20:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230533.398517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxWQ-0003xb-Ff; Wed, 24 Nov 2021 19:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230533.398517; Wed, 24 Nov 2021 19:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxWQ-0003vW-Ch; Wed, 24 Nov 2021 19:01:34 +0000
Received: by outflank-mailman (input) for mailman id 230533;
 Wed, 24 Nov 2021 19:01:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpxWO-0003vQ-Le
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 19:01:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpxWO-0005RE-KD
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 19:01:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpxWO-0002vt-J3
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 19:01:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mpxWI-0003po-5i; Wed, 24 Nov 2021 19:01:26 +0000
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
	bh=fsuy9+dyrRJagqIIIYCSilzdckFKY0AhaGR2LBwoxn4=; b=tyB6cabl5uFi0rkKoLBrmyqj+O
	krJNznv4De+NnjN1LvLp9TCOx7OVHhcePKBZdAs4clg5CbBFUpOksHdDjgvOgVAe3VSPXbhu8reU+
	gwCEOQ+edpMDa2ncavYktsKMgnwN4yckBCr204/z4ewquDGRZbyWlhEzCTXIYduFtWco=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24990.35845.537742.58478@mariner.uk.xensource.com>
Date: Wed, 24 Nov 2021 19:01:25 +0000
To: Andrew Cooper <amc96@srcf.net>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max
 policies
In-Reply-To: <471892da-6e64-2faa-3198-3859531c4d11@srcf.net>
References: <20211124161649.83189-1-roger.pau@citrix.com>
	<24990.26451.287618.213116@mariner.uk.xensource.com>
	<9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
	<24990.32581.766301.992950@mariner.uk.xensource.com>
	<471892da-6e64-2faa-3198-3859531c4d11@srcf.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies"):
> It may revert cleanly, but it won't build because of the first hunk in
> 81da2b544cbb00.  That hunk needs reverting too, because it too breaks
> some cpuid= settings in VM config files.

Would you be able to prepare the two-patch series (?) that does the
necessary reverts ?

> In principle, the *final* thing the toolstack should do, *for brand new
> VMs only*, is a shrink of that form, but this depends on whole load more
> toolstack work before it can be done safely.  There is a plan to fix
> CPUID handling, in a safe way, and it is ongoing (subject to all the
> security interruptions), but has a long way to go yet.

For clarity: I think you are discussing future aspirations, which do
not concern us for 4.16.

Thanks,
Ian.

