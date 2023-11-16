Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610D7EDD6E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 10:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634052.989292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3YSn-0003lD-4R; Thu, 16 Nov 2023 09:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634052.989292; Thu, 16 Nov 2023 09:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3YSn-0003hv-1q; Thu, 16 Nov 2023 09:15:05 +0000
Received: by outflank-mailman (input) for mailman id 634052;
 Thu, 16 Nov 2023 09:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqoQ=G5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3YSl-0003hj-Rl
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 09:15:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fc231fb-8460-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 10:15:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4D2D94EE073C;
 Thu, 16 Nov 2023 10:15:02 +0100 (CET)
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
X-Inumbo-ID: 9fc231fb-8460-11ee-98db-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 16 Nov 2023 10:15:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
Message-ID: <991883873b73e644ccaf8114a80331c0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-16 10:08, Nicola Vetrini wrote:
> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> by the asmlinkage pseudo-attribute, for the sake of uniformity.
> 
> Add missing 'xen/compiler.h' #include-s where needed.
> 
> The text in docs/misra/deviations.rst and docs/misra/safe.json
> is modified to reflect this change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This patch should be applied after patch 2 of this series.
> The request made by Julien to update the wording is
> contained in the present patch.
> https://lore.kernel.org/all/9ad7f6210c15f520297aac00e8af0e64@bugseng.com/
> 
> Concerns about efi_multiboot2 will be dealt with separately.
> 
> Changes in v2:
> - Edit safe.json.
> - Remove mention of SAF-1-safe in deviations.rst.
> Changes in v3:
> - Sorted #include-s and rebased against
> 7ad0c774e474 ("x86/boot: tidy #include-s")
> ---
>  docs/misra/deviations.rst   |  5 ++---
>  docs/misra/safe.json        |  2 +-
>  xen/arch/arm/cpuerrata.c    |  7 +++----
>  xen/arch/arm/setup.c        |  5 ++---
>  xen/arch/arm/smpboot.c      |  3 +--
>  xen/arch/arm/traps.c        | 21 +++++++--------------
>  xen/arch/x86/boot/cmdline.c |  5 +++--
>  xen/arch/x86/boot/reloc.c   |  6 +++---
>  xen/arch/x86/extable.c      |  3 +--
>  xen/arch/x86/setup.c        |  3 +--
>  xen/arch/x86/traps.c        | 27 +++++++++------------------
>  xen/common/efi/boot.c       |  5 ++---
>  12 files changed, 35 insertions(+), 57 deletions(-)
> 

In hindsight I should have added an

Acked-by: Julien Grall <jgrall@amazon.com>

given that the comment has been addressed in my opinion.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

