Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E020131FD1F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:32:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86973.163736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8gD-0000py-A2; Fri, 19 Feb 2021 16:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86973.163736; Fri, 19 Feb 2021 16:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8gD-0000pZ-6e; Fri, 19 Feb 2021 16:30:57 +0000
Received: by outflank-mailman (input) for mailman id 86973;
 Fri, 19 Feb 2021 16:30:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8gB-0000pU-Bh
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:30:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8gB-0004YX-AC
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:30:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD8gB-0001LB-7P
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:30:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD8g8-0001MC-1n; Fri, 19 Feb 2021 16:30:52 +0000
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
	bh=Fei5JGxqGwxzts9ixih8J+hpvtO9kql5cvdXDxjILpY=; b=JEhivi0Hg14kd3muGbKAvhIAwS
	A1HTrlYSUBHoL1POqUktwt3QEzz9KkBmLJnoOZhxterrejQVFJYTTsRDlTMpbH7YoQMqUV956pFO9
	XWtoqRYQfo2Qx4mcP0BUXMZg+/r0lL9ifo21VH56dwl9WooxRHZbHUrGTOMKd5pQ3gAU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.59323.764544.88044@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 16:30:51 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
In-Reply-To: <fbac488e-383c-c5a9-585a-6609b81e7acc@suse.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
	<24623.56913.290437.499946@mariner.uk.xensource.com>
	<381560e0-e108-c77a-7c43-ae6eb559bba9@suse.com>
	<24623.58260.98531.223090@mariner.uk.xensource.com>
	<fbac488e-383c-c5a9-585a-6609b81e7acc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> On 19.02.2021 17:13, Ian Jackson wrote:
> > Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> > I think 4-6 and 8 are good candidates for the reasons you give, and
> > because they seem low risk to me.  Have you used any automatic
> > techniques to check that there is no unintentional codegen change ?
> > (Eg, binary diffs, diffing sedderied versions, or something.)
> 
> I did some manual inspection at the time of putting together that
> work, but nothing further to be honest.

I think that something automatic might be worthwhile, but I would like
an opinion from another hypervisor maintainer about the level of risk
posed by the possibility of manual slips.  Eg, how likely it would be
for the compiler to catch them.

> > To my naive eye patch 7 looks scary because it might be moving the
> > scope of a critical section.  Am I wrong about that ?
> 
> At the source level it moves things, yes. Generated code, again as
> per manual inspection, doesn't change, due to the pieces that the
> compiler is able to eliminate. So I guess it's not as scary as it
> may look.

Oh, you eyeballed the generated code ?  Cool.

Ian.

