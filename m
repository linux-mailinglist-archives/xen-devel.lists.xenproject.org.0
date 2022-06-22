Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5B554A11
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 14:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353839.580835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zZv-0001tC-1F; Wed, 22 Jun 2022 12:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353839.580835; Wed, 22 Jun 2022 12:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3zZu-0001qw-Uh; Wed, 22 Jun 2022 12:35:26 +0000
Received: by outflank-mailman (input) for mailman id 353839;
 Wed, 22 Jun 2022 12:35:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/ZK=W5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3zZt-0001qo-6V
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 12:35:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c9076705-f227-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 14:35:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C27413D5;
 Wed, 22 Jun 2022 05:35:23 -0700 (PDT)
Received: from [10.57.38.102] (unknown [10.57.38.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7065A3F534;
 Wed, 22 Jun 2022 05:35:21 -0700 (PDT)
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
X-Inumbo-ID: c9076705-f227-11ec-b725-ed86ccbb4733
Message-ID: <e264e3bf-b436-684a-13a1-be0aa0f6bfbb@arm.com>
Date: Wed, 22 Jun 2022 14:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [XEN PATCH v2.1 1/4] build,include: rework shell script for
 headers++.chk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220621101128.50543-1-anthony.perard@citrix.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220621101128.50543-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 21.06.2022 12:11, Anthony PERARD wrote:
> The command line generated for headers++.chk by make is quite long,
> and in some environment it is too long. This issue have been seen in
> Yocto build environment.
> 
> Error messages:
>     make[9]: execvp: /bin/sh: Argument list too long
>     make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
> 
> Rework so that we do the foreach loop in shell rather that make to
> reduce the command line size by a lot. We also need a way to get
> headers prerequisite for some public headers so we use a switch "case"
> in shell to be able to do some simple pattern matching. Variables
> alone in POSIX shell don't allow to work with associative array or
> variables with "/".
> 
> Also rework headers99.chk as it has a similar implementation, even if
> with only two headers to check the command line isn't too long at the
> moment.
> 
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Michal Orzel <michal.orzel@arm.com>
Tested-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

