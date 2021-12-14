Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42CA4748C6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246936.425897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBDf-0004RL-Hc; Tue, 14 Dec 2021 17:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246936.425897; Tue, 14 Dec 2021 17:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBDf-0004OT-Dz; Tue, 14 Dec 2021 17:04:03 +0000
Received: by outflank-mailman (input) for mailman id 246936;
 Tue, 14 Dec 2021 17:04:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBDe-0004O3-7S
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:04:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBDc-0004Yp-0r; Tue, 14 Dec 2021 17:04:00 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBDb-0004RZ-RG; Tue, 14 Dec 2021 17:03:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=cs377JxwHdAJu/wXuE4+voLmIwWBaQNxiEvBgwGbng4=; b=BzfEhWjETVX+ttE2LQE1dM9Ayi
	VAA7/pnYBLU0t4smq/c+CbNUbdwn4QWwIlqh7KHMijr/dktTbdKqhgqhwMOODWlXVabFJ9GPdw1mX
	nJmlGWzNn0Ss36E+V1eALyYw43NneaGhYqjEBv7gf4bas+5/ikW0RqsWXUPYpHtiuhhs=;
Message-ID: <b2724f38-6dcb-e7c6-40ce-783de9941e16@xen.org>
Date: Tue, 14 Dec 2021 17:03:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 12/47] build: build everything from the root dir,
 use obj=$subdir
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-13-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-13-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthonny,

On 25/11/2021 13:39, Anthony PERARD wrote:
> A subdirectory is now built by setting "$(obj)" instead of changing
> directory. "$(obj)" should always be set when using "Rules.mk" and
> thus a shortcut "$(build)" is introduced and should be used.
> 
> A new variable "$(need-builtin)" is introduce. It is to be used
> whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
> isn't the main target anymore, and thus only needs to depends on the
> objects that should be part of "built_in.o".
> 
> Introduce $(srctree) and $(objtree) to replace $(BASEDIR) in cases a
> relative path is better, and $(abs_srctree) and $(abs_objtree) which
> have an absolute path.
> 
> DEPS is updated as the existing macro to deal with it doesn't know
> about $(obj).
> 
> There's some changes in "Rules.mk" which in addition to deal with
> "$(obj)" also make it's looks more like "Makefile.build" from Linux
> v5.12.
> 
> test/Makefile doesn't need special handling in order to build
> everything under test/, Rules.mk will visit test/livepatch via
> $(subdir-y), thus "tests" "all" and "build" target are removed.
> "subtree-force-update" target isn't useful so it is removed as well.
> 
> test/livepatch/Makefile doesn't need default target anymore, Rules.mk
> will build everything in $(extra-y) and thus all *.livepatch.
> 
> Adjust cloc recipe: dependency files generated by CC will now have the
> full path to the source file, so we don't need to prepend the
> subdirectory. This fix some issue with source not been parsed by cloc
> before. Also source from tools/kconfig would be listed with changes in
> this patch so adjust the find command to stop listing the "tools"
> directory and thus kconfig. With a default build of Xen on X86, they
> are a few new files parsed by cloc:
>      arch/x86/x86_64/compat/mm.c
>      arch/x86/x86_64/mm.c
>      common/compat/domain.c
>      common/compat/memory.c
>      common/compat/xlat.c
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

