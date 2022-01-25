Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE149B84C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 17:13:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260508.450123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCORI-0004AD-96; Tue, 25 Jan 2022 16:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260508.450123; Tue, 25 Jan 2022 16:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCORI-00047P-5z; Tue, 25 Jan 2022 16:13:00 +0000
Received: by outflank-mailman (input) for mailman id 260508;
 Tue, 25 Jan 2022 16:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOP7=SJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nCORH-0003vA-1n
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 16:12:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a86640dc-7df9-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 17:12:58 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1643127172405858.2065986568729;
 Tue, 25 Jan 2022 08:12:52 -0800 (PST)
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
X-Inumbo-ID: a86640dc-7df9-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; t=1643127173; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X6xTd/niuIN1JcKseQPILFiisriTJNTl/TYZpUe3AZsHWlt9oCw6SsBpTuXfpzF4U6kju8y2pokIlAT9AJKPsbBqQh+rtkz+BmbGQNEKnQboO3T7rEolBbz7ZXb6lSDCAONIL8qpJAcXKgWwGOQYiwHBr68kyvxUqMQ3Ug6I54k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1643127173; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pPZRNV0m7y7c3a034eSHWgGJxOgL+6s6flA0w3TLrLc=; 
	b=fL6v7Cqcgc0ApcZxfxn1OnBy7wKTrbaedMoaoE7uZSpSKE89nh59ofWoAiE5aBlJmjk0PBv+g6h9gBLPEZxw3I3aLGP/70NKeys5o/r3ptITmsckxvqB1QotDeNXw+nyXjaKuQRAJZ4dOp92c8F5r8ItF5RPEBadi4TY6g2iuUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1643127173;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pPZRNV0m7y7c3a034eSHWgGJxOgL+6s6flA0w3TLrLc=;
	b=NKKo47JvTBFSjwwR0dtv4uIfSDC7hvxgXtvhP1Q84n1mo7SBUhnekEA3rJModHjr
	mKB0gFmCwT+eFRw+hjSX8pBD+b/uMg77AVdpuATZBOsHGz4qxWSngoHK2HYOeeLH/2G
	BtStNoGL5f7zxVYVuC+zqFa42B7JfGtz/g6A3aTs=
Message-ID: <bcf36a84-4ef8-76f3-be16-a54715c099e3@apertussolutions.com>
Date: Tue, 25 Jan 2022 11:11:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 30/30] build: adding out-of-tree support to the xen
 build
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-31-anthony.perard@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20220125110103.3527686-31-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/25/22 06:01, Anthony PERARD wrote:
> This implement out-of-tree support, there's two ways to create an
> out-of-tree build tree (after that, `make` in that new directory
> works):
>     make O=build
>     mkdir build; cd build; make -f ../Makefile
> also works with an absolute path for both.
> 
> This implementation only works if the source tree is clean, as we use
> VPATH.
> 
> This patch copies most new code with handling out-of-tree build from
> Linux v5.12.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> Notes:
>     v9:
>     - acked
>     - add "source -> ." symlink in the in-tree build as well. This allow to
>       make relative symlink to the "common/efi/*.c" sources.
>     - also now, the "source" symlink is removed on `distclean`, add added to
>       .gitignore.
>     
>     v8:
>     - replace script/mkmakefile by cmd_makefile like it's been done in Linux
>       5.13.
>     - fix GNU Make version, replace few 0.81 by 3.81.
>     - reorder include header path in CFLAGS ( -I ), to have the $(objtree)
>       paths listed before the $(srctree) paths. This will be usefull later
>       if we allow to build out-of-tree from a dirty source tree.
>     - make use of -iquote
>     - sometime, add -iquote path even when not necessary when building in-tree.
>     - extract code movement into a separate patch
>     - make use of the new "$(srcdir)" shortcut
>     - split command line in headers*.chk target into more lines
> 
>  .gitignore                   |   1 +
>  xen/Makefile                 | 143 +++++++++++++++++++++++++++++++----
>  xen/Rules.mk                 |  11 ++-
>  xen/arch/x86/arch.mk         |   5 +-
>  xen/arch/x86/boot/Makefile   |   6 ++
>  xen/common/efi/efi-common.mk |   3 +-
>  xen/include/Makefile         |  11 ++-
>  xen/test/livepatch/Makefile  |   2 +
>  xen/xsm/flask/Makefile       |   3 +-
>  xen/xsm/flask/ss/Makefile    |   1 +
>  10 files changed, 164 insertions(+), 22 deletions(-)
> 

<snip/>

> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index a99038cb5722..d25312f4fa1c 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -4,7 +4,8 @@ obj-y += flask_op.o
>  
>  obj-y += ss/
>  
> -CFLAGS-y += -I$(obj)/include
> +CFLAGS-y += -iquote $(obj)/include
> +CFLAGS-y += -I$(srcdir)/include
>  
>  AWK = awk
>  
> diff --git a/xen/xsm/flask/ss/Makefile b/xen/xsm/flask/ss/Makefile
> index aba1339f3808..ffe92ec19ed6 100644
> --- a/xen/xsm/flask/ss/Makefile
> +++ b/xen/xsm/flask/ss/Makefile
> @@ -8,4 +8,5 @@ obj-y += services.o
>  obj-y += conditional.o
>  obj-y += mls.o
>  
> +CFLAGS-y += -iquote $(objtree)/xsm/flask/include
>  CFLAGS-y += -I$(srctree)/xsm/flask/include

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

V/r,
Daniel P. Smith
Apertus Solutions, LLC

