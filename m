Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90D49B843
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260495.450069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOOC-0000SA-Lc; Tue, 25 Jan 2022 16:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260495.450069; Tue, 25 Jan 2022 16:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCOOC-0000Pm-Hk; Tue, 25 Jan 2022 16:09:48 +0000
Received: by outflank-mailman (input) for mailman id 260495;
 Tue, 25 Jan 2022 16:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOP7=SJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nCOOB-0000OW-40
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:09:47 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35cfff33-7df9-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 17:09:45 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1643126977972983.8482899495522;
 Tue, 25 Jan 2022 08:09:37 -0800 (PST)
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
X-Inumbo-ID: 35cfff33-7df9-11ec-8fa7-f31e035a9116
ARC-Seal: i=1; a=rsa-sha256; t=1643126978; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cEvlaV6AmNOSrj0uyrP61EWeF/J6iQ7XGREo2+uQkryiDCNfLB0Rx2asyw2mWkuvtLki4fZUA4NOVcEKzuJZDlPpkJ0Uuyqg+BQ5tz5CzLCXE/GnEkDJYX6LRYUeRR5+DIPk22LahzR/0HswsXTLSJz6DPQ/9D9MvGlltH3Z8po=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643126978; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fdsP6yayx+tfibHUReJFa9aucc9bG7MUjN7uDxDYoAI=; 
	b=L6XuakW9MftYEdWmR7UbayNdMB4BJdUOX7erFlowLmuDVaGtncuiqt8vSskSj4fEeqMlctGL8ZR1YBduzMbvlnE5VNYOrsMXsk6d4CbBuELnbWtq8jORUrQ7RNUqm/CI9kFgFHezDxyefQh8JZPuomCrL7abQESgv9Ds7iE4wyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643126978;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fdsP6yayx+tfibHUReJFa9aucc9bG7MUjN7uDxDYoAI=;
	b=QfRvc5wjlSPLSbMWj+mDJRjobPn75rR/pbRprhQYA2zMYLmU0q4iLZoekj36QAFU
	m25H3eG4iR7x0aJapvzeNl6yYhmptV1YS4SNbpQc1NWPrryZicV+1dsnyu9aLraiGH4
	c5ABhQR907wH4k2V1kqQD7gYcHyzsuVsOSfq1QqE=
Message-ID: <cb41a625-b3a4-3315-eafe-395d2f220f5e@apertussolutions.com>
Date: Tue, 25 Jan 2022 11:07:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 09/30] build: build everything from the root dir,
 use obj=$subdir
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-10-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220125110103.3527686-10-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/25/22 06:00, Anthony PERARD wrote:
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
>     arch/x86/x86_64/compat/mm.c
>     arch/x86/x86_64/mm.c
>     common/compat/domain.c
>     common/compat/memory.c
>     common/compat/xlat.c
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> Notes:
>     v9:
>     - reviewed
>     
>     v8:
>     - rebased
>     - move check for $(obj) in Rules.mk earlier
>     - use $(sort ) when adding directories in $(subdir-y)
>     - fix missing space between "DEPS" and ":="
>     - use -iquote when adding '.' for xen/arch/x86/usercopy.o
>     - introduce also abs_srctree and abs_objtree
>       those were in patch "build: replace $(BASEDIR) by $(objtree)"
>     - reworked cmd_objcopy_fix_sym, we don't need to do anything for old
>       version of clang, and for recent version of clang the change is the
>       same a for gcc.
>     - adjust "cloc" recipe
>     - add some more $(Q) to silent $(MAKE) $(build)=...
>     
>     v7:
>     - Spell "Makefile.build" as "Rules.mk" in the warning in Rules.mk about
>       undefined $(obj).
>     - use $(srctree) for include/xen/config.h
>     - handle $(nocov-y) and $(noubsan-y), needed to add $(obj)/
> 
>  xen/Makefile                |  36 ++++++----
>  xen/Rules.mk                | 138 ++++++++++++++++++++++++------------
>  xen/arch/arm/Makefile       |   4 +-
>  xen/arch/arm/Rules.mk       |   4 --
>  xen/arch/arm/arch.mk        |   4 +-
>  xen/arch/riscv/arch.mk      |   4 +-
>  xen/arch/x86/Makefile       |  11 +--
>  xen/arch/x86/Rules.mk       |   4 +-
>  xen/arch/x86/arch.mk        |  12 ++--
>  xen/arch/x86/boot/Makefile  |   8 +--
>  xen/build.mk                |  12 +++-
>  xen/include/Makefile        |   6 +-
>  xen/scripts/Kbuild.include  |   6 ++
>  xen/test/Makefile           |   7 +-
>  xen/test/livepatch/Makefile |   6 --
>  xen/xsm/flask/Makefile      |   2 +-
>  xen/xsm/flask/ss/Makefile   |   2 +-
>  17 files changed, 162 insertions(+), 104 deletions(-)
> 

<snip/>

> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 51fd37f6c4d5..49cf730cf098 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -40,7 +40,7 @@ $(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
>  	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
>  targets += flask-policy.S
>  
> -FLASK_BUILD_DIR := $(CURDIR)
> +FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
>  POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
>  
>  $(obj)/policy.bin: FORCE
> diff --git a/xen/xsm/flask/ss/Makefile b/xen/xsm/flask/ss/Makefile
> index d32b9e07138e..aba1339f3808 100644
> --- a/xen/xsm/flask/ss/Makefile
> +++ b/xen/xsm/flask/ss/Makefile
> @@ -8,4 +8,4 @@ obj-y += services.o
>  obj-y += conditional.o
>  obj-y += mls.o
>  
> -CFLAGS-y += -I../include
> +CFLAGS-y += -I$(srctree)/xsm/flask/include


Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

