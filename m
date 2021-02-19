Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2231FCDE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86964.163711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8P3-0007Aw-DK; Fri, 19 Feb 2021 16:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86964.163711; Fri, 19 Feb 2021 16:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8P3-0007AV-9s; Fri, 19 Feb 2021 16:13:13 +0000
Received: by outflank-mailman (input) for mailman id 86964;
 Fri, 19 Feb 2021 16:13:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8P1-0007AN-LE
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:13:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8P1-0004H2-JA
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:13:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8P1-0008PJ-Hs
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:13:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD8Oy-0001Hz-A6; Fri, 19 Feb 2021 16:13:08 +0000
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
	bh=WxeqxFuHJbqY6zzQggWwRIr+agzwPbNQklTmSllrMsc=; b=4hfFgGcARyqSy9L+C2gcTkFp/M
	4NiqSAI4qxatzMY1IqkrhPq06fm5qAMQc+njIY7nvqCKOlBsc7Akdy7nvPFJU1fbXOLYOzFuLBaZt
	a4Ah/qEKsJWEIyyGYZLFMbbJP9TQL8usp+9eaeBCVkwsDld9XY98JF7snnaNbW13JRto=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.58260.98531.223090@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:13:08 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
In-Reply-To: <381560e0-e108-c77a-7c43-ae6eb559bba9@suse.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
	<24623.56913.290437.499946@mariner.uk.xensource.com>
	<381560e0-e108-c77a-7c43-ae6eb559bba9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> On 19.02.2021 16:50, Ian Jackson wrote:
> > You say "consistency" but in practical terms, what will happen if the
> > code is not "conxistent" in this sense ?
> 
> Patches 4-6: The code is harder to understand with the mix of names.
> Backports from future versions to 4.15 may require more attention to
> get right (and then again the same level of attention when moving to
> 4.14).
> 
> Patches 7 is simply a minor improvement. Patch 8 is an equivalent
> of the one patch of the earlier version which has already gone in.
> Just like that other one it's more to avoid a latent issue than any
> active one.

Thank you for this clear explanation.

I think 4-6 and 8 are good candidates for the reasons you give, and
because they seem low risk to me.  Have you used any automatic
techniques to check that there is no unintentional codegen change ?
(Eg, binary diffs, diffing sedderied versions, or something.)

To my naive eye patch 7 looks scary because it might be moving the
scope of a critical section.  Am I wrong about that ?

Ian.

