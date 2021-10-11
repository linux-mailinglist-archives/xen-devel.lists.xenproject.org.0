Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BA428BBD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205769.361160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZt51-0004mj-Qu; Mon, 11 Oct 2021 11:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205769.361160; Mon, 11 Oct 2021 11:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZt51-0004kC-NE; Mon, 11 Oct 2021 11:02:51 +0000
Received: by outflank-mailman (input) for mailman id 205769;
 Mon, 11 Oct 2021 11:02:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZt4z-0004k6-D6
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:02:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZt4z-0003QN-AO
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:02:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mZt4z-0002G0-9A
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:02:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mZt4v-0000qU-Rw; Mon, 11 Oct 2021 12:02:45 +0100
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
	bh=2pqDyHmkr52dBjVlsWdmGy0jYD7lEi0k7mq0Ni2avYw=; b=JQFeX/g0tvYBD1NBhMJmM4xX0n
	/9UUinxtt4BknjgHwGOa54V7VResd3iy/popj9GBZbgWIijoU1crTvH8FiG+jq2Wt6hrdEqPUcfgs
	MQ/z9tSL4xtBi4aV6nz3zYPPIulAyWHrzUDkbVsmm5esKNUXn+6pd3vBYBQnk5pfPXtA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24932.6613.466204.983513@mariner.uk.xensource.com>
Date: Mon, 11 Oct 2021 12:02:45 +0100
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
    George Dunlap <george.dunlap@citrix.com>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    bertrand.marquis@arm.com
Subject: Re: [PATCH v4 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
In-Reply-To: <20211011090047.8878-2-michal.orzel@arm.com>
References: <20211011090047.8878-1-michal.orzel@arm.com>
	<20211011090047.8878-2-michal.orzel@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Michal Orzel writes ("[PATCH v4 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu"):
> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
> indicates whether the platform supports vPMU
> functionality. Modify Xen and tools accordingly.
> 
> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
> definition in sysctl.h which wrongly use (1 << 6)
> instead of (1u << 6).
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Tools:

Acked-by: Ian Jackson <iwj@xenproject.org>

