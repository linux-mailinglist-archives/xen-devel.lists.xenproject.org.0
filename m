Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24804321506
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87983.165296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9Kt-0007vg-L3; Mon, 22 Feb 2021 11:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87983.165296; Mon, 22 Feb 2021 11:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9Kt-0007vH-Ho; Mon, 22 Feb 2021 11:25:07 +0000
Received: by outflank-mailman (input) for mailman id 87983;
 Mon, 22 Feb 2021 11:25:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9Ks-0007vC-Js
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:25:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9Ks-0006wH-IL
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:25:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9Ks-0006x6-HN
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:25:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lE9Kp-0000oO-C0; Mon, 22 Feb 2021 11:25:03 +0000
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
	bh=qyTCpkoizKoayMH2qHnn7AaZQLQeUl7oU96NRKebpI4=; b=z9OGhHTc8sDlAn3eyJKwJW0IB2
	t415WjLF0+VZpYSMp3lfJI2ouhcj/onJZua9GwtoaEQHKdIZraTv/NXMvVysHQS4lF6XrTelM/B2I
	7ObUueIep7PVgfMFPZm2gncGc8Z+BbETjhxtvEUyLA5P5S1WVDvl26x6d/swA+j20bZ8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24627.38031.77928.536108@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 11:25:03 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
In-Reply-To: <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
	<90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page"):
> Inserting the mapping at domain creation time leads to a memory leak
> when the creation fails later on and the domain uses separate CPU and
> IOMMU page tables - the latter requires intermediate page tables to be
> allocated, but there's no freeing of them at present in this case. Since
> we don't need the p2m insertion to happen this early, avoid the problem
> altogether by deferring it until the last possible point.

Thanks.

>   This comes at
> the price of not being able to handle an error other than by crashing
> the domain.

How worried should I be about this ?

Ian.

