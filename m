Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C942C08D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208416.364531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madhO-0005P7-J6; Wed, 13 Oct 2021 12:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208416.364531; Wed, 13 Oct 2021 12:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madhO-0005ME-FR; Wed, 13 Oct 2021 12:49:34 +0000
Received: by outflank-mailman (input) for mailman id 208416;
 Wed, 13 Oct 2021 12:49:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1madhN-0005M8-3O
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:49:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1madhN-0004pt-1p
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:49:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1madhN-0006Ne-0r
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:49:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1madhI-0007gi-9J; Wed, 13 Oct 2021 13:49:28 +0100
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
	bh=cczmQ1mdfK2YQZDQi5HdMefgwm5HH5ryDA437dBLUpM=; b=Z+d11hUSTD5NehwNU1B9U3LKq8
	OoRPK/YeDCSaDbvYPNle883urD+ngjgYBubb1D9bNMilkM/Sp4dR63FGFd2rNqXTyct1FgWnqYb3j
	+R3Twk9rCYjCD04MXi4Nj+bj91L0AwAftl9k/0DPihFk0O3g8yXb9HiD+nHr/h1v8Lgc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24934.54743.853232.853726@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 13:49:27 +0100
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    bertrand.marquis@arm.com
Subject: Re: [PATCH v7] xen: Expose the PMU to the guests
In-Reply-To: <20211013123352.6625-1-michal.orzel@arm.com>
References: <20211013123352.6625-1-michal.orzel@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Michal Orzel writes ("[PATCH v7] xen: Expose the PMU to the guests"):
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps(currently only for ARM).
> 
> The current status is that the PMU registers are not
> virtualized and the physical registers are directly
> accessible when this parameter is enabled. There is no
> interrupt support and Xen will not save/restore the
> register values on context switches.
> 
> According to Arm Arm, section D7.1:
> "The Performance Monitors Extension is common
> to AArch64 operation and AArch32 operation."
> That means we have an ensurance that if PMU is
> present in one exception state, it must also be
> present in the other.
> 
> Please note that this feature is experimental.
...
> Changes since v6:
> -fix missing "HVM" for vPMU entry in SUPPORT.md

The SUPPORT.md changes LGTM, thanks.

> -Virtual Performance Management Unit for HVM guests
> +Virtual Performance Management Unit
>  
> -    Status, x86: Supported, Not security supported
> +    Status, x86 HVM: Supported, Not security supported
> +    Status, ARM: Experimental
> +
> +On ARM, support for accessing PMU registers from the guests.
> +There is no interrupt support and Xen will not save/restore
> +the register values on context switches.

FTAOD ISTM that this limitation makes the feature very hard to use
successfully on ARM.  You would need to pin vcpus to dedicated
pcpus ?

I think this is fine for an experimental feature.

I think this patch needs a ARM/hypervisor acks still.

Ian.

