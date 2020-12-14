Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6D2D9498
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51990.90949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojrZ-00014x-JL; Mon, 14 Dec 2020 09:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51990.90949; Mon, 14 Dec 2020 09:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojrZ-00014f-Au; Mon, 14 Dec 2020 09:09:49 +0000
Received: by outflank-mailman (input) for mailman id 51990;
 Mon, 14 Dec 2020 09:09:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kojrY-00014a-7b
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:09:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cc5a363-7e46-404b-80da-ccf278866996;
 Mon, 14 Dec 2020 09:09:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D642AAC10;
 Mon, 14 Dec 2020 09:09:45 +0000 (UTC)
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
X-Inumbo-ID: 7cc5a363-7e46-404b-80da-ccf278866996
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607936986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slZrT1atWRvMCFjihXwUTflP2Ple2Ww37AqLliJnGWc=;
	b=uOPmyjFd++NixAg8Oklvu+Unr9Lu7u5C9X9OQG9FU1A9FjC7lmF2WCLNeM9x/bLhImk1G2
	b+f54qzGG48SpVggDPOtOwqDEmWPLQQH2f08x5lnDtRcE3DbaUYbiCfaZwl7J4WW1hP6gs
	0pb89zN6/aqflOcrxVHt6W9N5xdhs7Q=
Subject: Re: [PATCH v4 0/3] xen: add support for automatic debug key actions
 in case of crash
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <247d9c9c-5ab1-c733-6960-e406040c28ac@suse.com>
Date: Mon, 14 Dec 2020 10:09:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214075615.25038-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.12.2020 08:56, Juergen Gross wrote:
> Patch 2 opens up more potential for simplification: in theory there is
> no need any more to call any key handler with the regs parameter,
> allowing to use the same prototype for all handlers. The downside would
> be to have an additional irq frame on the stack for the dump_registers()
> and the do_debug_key() handlers.

This isn't the only downside, is it? We'd then also need to be able
to (sufficiently cleanly) unwind through the new frame to reach the
prior one, in order to avoid logging less reliable information. Plus
decompose the prior frame as well to avoid logging less easy to
consume data.

Jan

