Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD54452B6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221488.383223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibXB-00047v-Ti; Thu, 04 Nov 2021 12:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221488.383223; Thu, 04 Nov 2021 12:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibXB-00044p-Oa; Thu, 04 Nov 2021 12:07:57 +0000
Received: by outflank-mailman (input) for mailman id 221488;
 Thu, 04 Nov 2021 12:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mibX9-00044Z-Ll
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:07:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mibX9-0003Fi-L1
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:07:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mibX9-0005s0-KG
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:07:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mibX5-0002eh-SU; Thu, 04 Nov 2021 12:07:52 +0000
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
	bh=6LmqJogxqnAiMsJ+A1ho8TJKw9Y5jS9iL3OhpMIYY9k=; b=4xdiZD8fL2sSzWfSp4KcaDFvQw
	FRbEOM4nGlv+Mg+yNYAsUKhddv8n5+XGPNo3/Aj8pPPr/pDcV6IsSCVJp71NbdgrV03iBdmaLfPI8
	Mg/m8tV5yqJWoPPTXJQFE/oRyijEyjbZUSV6glCo6VRoiYeYFnw1y+st60bpm9RZw8y4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24963.52503.323399.54108@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 12:07:51 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    George Dunlap <George.Dunlap@eu.citrix.com>,
    Jan Beulich <JBeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Julien Grall <julien@xen.org>,
    Christian Lindig <christian.lindig@citrix.com>,
    Edwin =?iso-8859-1?Q?T=F6r=F6k?= <edvin.torok@citrix.com>
Subject: Re: [PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities to the toolstack
In-Reply-To: <20211029173813.23002-1-andrew.cooper3@citrix.com>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
	<20211029173813.23002-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.16 2/2] xen: Report grant table v1/v2 capabilities to the toolstack"):
> In order to let the toolstack be able to set the gnttab version on a
> per-domain basis, it needs to know which ABIs Xen supports.  Introduce
> XEN_SYSCTL_PHYSCAP_gnttab_v{1,2} for the purpose, and plumb in down into
> userspace.

It's not clear to me whether there is consensus around this patch ?

Anyway, tools parts:

Reviewed-by: Ian Jackson <iwj@xenproject.org>

Ian.

