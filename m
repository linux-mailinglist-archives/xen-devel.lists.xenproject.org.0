Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5B44C056
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 12:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224263.387469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkm61-0000Tb-UC; Wed, 10 Nov 2021 11:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224263.387469; Wed, 10 Nov 2021 11:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkm61-0000Qt-Qm; Wed, 10 Nov 2021 11:48:53 +0000
Received: by outflank-mailman (input) for mailman id 224263;
 Wed, 10 Nov 2021 11:48:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkm60-0000Qn-58
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:48:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkm60-0000ue-3S
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:48:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mkm60-00008O-2N
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:48:52 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mkm5w-0000sw-Fd; Wed, 10 Nov 2021 11:48:48 +0000
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
	bh=8R9wvjzn9PtZ9DCKmc8OQAy+iYJllvODel0SLWR5msA=; b=1yR6MA21ItN21Oc9lbBL1adRD/
	RJiCX0xdbUnZwDPIFzCbJ/1u3956waHyIxzn1s0ak02JvAbMPh3tW2YhGyigyMczSFrWoM4FljvQJ
	hDxOdK4ala7sp6/QHQfYYrn+aBSjFQoHW3DLaxMTUdT0ghAWWpEhVXEw6ESLij4yhCg4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24971.45471.990917.651108@mariner.uk.xensource.com>
Date: Wed, 10 Nov 2021 11:48:47 +0000
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo status
In-Reply-To: <20211110091935.16906-1-jane.malalane@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jane Malalane writes ("[PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo status"):
> Before, user would change turbo status but this had no effect: boolean
> was set but policy wasn't reevaluated.  Policy must be reevaluated so
> that CPU frequency is chosen according to the turbo status and the
> current governor.
> 
> Therefore, add __cpufreq_governor() in cpufreq_update_turbo().
...
> Not taking this patch means that turbo status is misleading.
> 
> Taking this patch is low-risk as it only uses a function that already
> exists and is already used for setting the chosen scaling governor.
> Essentially, this change is equivalent to running 'xenpm
> en/disable-turbo-mode' and, subsequently, running 'xenpm
> set-scaling-governor <current governor>'.

Thanks.  I am positively inclined.  But I have one query about this
rationale.  Adding a new call to an existing function is OK if calling
__cpufreq_governor is permitted here.  Are there locking or reentrancy
hazards ?  Perhaps these issue have been considered but I would like
to see something explicit about that.

Thanks,
Ian.

