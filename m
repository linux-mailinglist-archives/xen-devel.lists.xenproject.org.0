Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74132D361
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 13:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93231.175940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnGe-0002tf-Ha; Thu, 04 Mar 2021 12:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93231.175940; Thu, 04 Mar 2021 12:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnGe-0002tG-E8; Thu, 04 Mar 2021 12:39:48 +0000
Received: by outflank-mailman (input) for mailman id 93231;
 Thu, 04 Mar 2021 12:39:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnGd-0002tB-Cw
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:39:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnGd-0002dO-9k
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:39:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnGd-0004Is-7P
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:39:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHnGZ-0005CM-Lv; Thu, 04 Mar 2021 12:39:43 +0000
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
	bh=+sJ/Iqqz5CVnxk9Dgf+BePZdsK98/VHQg/Xbl4ewAGE=; b=wuikK5XfHEt6ynyc1H5LkSMjyp
	ld0/NOdoG5gWp3Fzev7b/otvM1q8x8VSh3lln9x09bBdnyhGViQC1gi2NbkiPYSD3ugFSVeWwmfiG
	RetavTma+7SOnuhqUkFk9U2iqzSsHafg+YTF6lHlCyQUJTOhSCtOQLrP7a+m/xBCR7YY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24640.54543.374794.840345@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 12:39:43 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.15] xen/dmop: Fix XEN_DMOP_nr_vcpus to actually return data
In-Reply-To: <20210304104805.27601-1-andrew.cooper3@citrix.com>
References: <20210304104805.27601-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] xen/dmop: Fix XEN_DMOP_nr_vcpus to actually return data"):
> The const_op boolean needs clobbering to cause data to be written back to the
> caller.
> 
> Fixes: c4441ab1f1 ("dmop: Add XEN_DMOP_nr_vcpus")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> If we weren't in a release freeze, I'd rewrite large chunks of this.
> 'const_op' is what we call 'copyback' everywhere else, but with inverted
> sense.  I'll guess this gets added to the pile of other unbreakage work which
> might happen in 4.16
> 
> My ad-hoc unit test appears to have had a false positive for the success case,
> which I've fixed.  However, the chances of the full test landing in 4.15 is
> getting slimmer, not to mention the fact that it curretly takes out Xen with
> reference counting error...
> 
> As for 4.15, this is a bug in a brand-newly introduced hypercall, and is of 0
> risk for other areas of the release.  If this bugfix is not taken, we should
> revert c4441ab1f1 to take the hypercall out, but this would be a bad move.

Thanks for that explanation.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

