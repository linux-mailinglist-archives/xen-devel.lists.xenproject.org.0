Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5F2F2E2F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 12:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65641.116329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzI3m-0007qb-L2; Tue, 12 Jan 2021 11:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65641.116329; Tue, 12 Jan 2021 11:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzI3m-0007qC-HK; Tue, 12 Jan 2021 11:42:02 +0000
Received: by outflank-mailman (input) for mailman id 65641;
 Tue, 12 Jan 2021 11:42:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzI3k-0007q7-3x
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 11:42:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba0bf594-928e-4140-a12c-47b521d0e383;
 Tue, 12 Jan 2021 11:41:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78ED1AFA0;
 Tue, 12 Jan 2021 11:41:58 +0000 (UTC)
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
X-Inumbo-ID: ba0bf594-928e-4140-a12c-47b521d0e383
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610451718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJEwHCFfDkbCePONnitGPierf2RfjEn6421gh2g560c=;
	b=ESd5AdYcQgOqpBC3Vwg85HZyzkSmzzKCHwGWBiiLLbJbl65MiQexT+X58pgmTl/kQOiDoy
	O6VYRqH/Y0DTAFXY7O/vf1AzSpAOeNIoPoaesbJkJfz/TymtC3ZBu58BWo90NbfBvZCwx/
	1UDlELlPw4oh7jD6PkQ6q8tMZaVS3eA=
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1610115608.git.rahul.singh@arm.com>
 <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com>
Date: Tue, 12 Jan 2021 12:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 15:46, Rahul Singh wrote:
> -Wimplicit-fallthrough warns when a switch case falls through. Warning
> can be suppress by either adding a /* fallthrough */ comment, or by
> using a null statement: __attribute__ ((fallthrough))

Why is the comment variant (which we use in many places already,
albeit with varying wording) not the route of choice?

> Define the pseudo keyword 'fallthrough' for the ability to convert the
> various case block /* fallthrough */ style comments to null statement
> "__attribute__((__fallthrough__))"
> 
> In C mode, GCC supports the __fallthrough__ attribute since 7.1,
> the same time the warning and the comment parsing were introduced.
> 
> fallthrough devolves to an empty "do {} while (0)" if the compiler
> version (any version less than gcc 7) does not support the attribute.

What about Coverity? It would be nice if we wouldn't need to add
two separate constructs everywhere to make both compiler and static
code checker happy.

Jan


