Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02683214D3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87970.165250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE97e-0006YB-RL; Mon, 22 Feb 2021 11:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87970.165250; Mon, 22 Feb 2021 11:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE97e-0006Xm-Ny; Mon, 22 Feb 2021 11:11:26 +0000
Received: by outflank-mailman (input) for mailman id 87970;
 Mon, 22 Feb 2021 11:11:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE97d-0006Xe-2U
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:11:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE97d-0006gn-1l
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:11:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE97d-0005pJ-0w
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:11:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lE97Z-0000jK-Ry; Mon, 22 Feb 2021 11:11:21 +0000
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
	bh=BVRupZ+BKF0UTFHVG43HCdjtn0mdRZqluv+w+RTUfEg=; b=E92PbpzkupX5oWQ0MghIif0oh3
	oAMXH1coIfl5Os/d901oN6nb2/exR1WvczhxDspVYHntw6Eylc89hkcDy4MggoDgrGwRsCAXP0PFP
	3qzlhfN7FSxNAUNwhxwJ+Pol9GLLYfUQ1H6saRBaypF9juFo9ST385atIe9qlTPjG/eo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24627.37209.655443.911873@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 11:11:21 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    jbeulich@suse.com,
    sstabellini@kernel.org,
    ash.j.wilding@gmail.com,
    Julien Grall <jgrall@amazon.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in vcpu_block()
In-Reply-To: <20210220194701.24202-1-julien@xen.org>
References: <20210220194701.24202-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] xen/sched: Add missing memory barrier in vcpu_block()"):
> From: Julien Grall <jgrall@amazon.com>
> 
> The comment in vcpu_block() states that the events should be checked
> /after/ blocking to avoids wakeup waiting race. However, from a generic
> perspective, set_bit() doesn't prevent re-ordering. So the following
> could happen:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

