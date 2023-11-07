Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79177E3EAB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 13:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628805.980646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LMx-0007z5-Am; Tue, 07 Nov 2023 12:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628805.980646; Tue, 07 Nov 2023 12:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0LMx-0007xP-6T; Tue, 07 Nov 2023 12:39:47 +0000
Received: by outflank-mailman (input) for mailman id 628805;
 Tue, 07 Nov 2023 12:39:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0LMv-0007xG-0z
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 12:39:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0LMu-0002KQ-D9; Tue, 07 Nov 2023 12:39:44 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.15.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0LMu-0005Ee-4P; Tue, 07 Nov 2023 12:39:44 +0000
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
	bh=Qi45Vdq56ezED1OfApo8e/0KHewAEiRDSuMr7pM/Pyg=; b=y+V1bbqPY9QikOAq/VeiSZqU0j
	OSIhqCJ3dplYmUc/fNaWpftfT7Ziv3ey9q0ujbR4L2eERxrfUPbusqihBSdj2uHZiVsd73dcDtgwU
	aSUIeIuiyh3Eb6G8z+EK8NSYVsEMgKkOzNl6gfxZrGkdE824Nc9VHjucP4IVWNF46ci8=;
Message-ID: <80184dfe-c309-4c3f-aaee-e8fa32195cb8@xen.org>
Date: Tue, 7 Nov 2023 12:39:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v2] xen: replace occurrences of SAF-1-safe
 with asmlinkage attribute
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <aa7fa9b8cd40adb4eb5242deeff138cbe8b658f9.1699352946.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aa7fa9b8cd40adb4eb5242deeff138cbe8b658f9.1699352946.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 07/11/2023 10:30, Nicola Vetrini wrote:
> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
> by the asmlinkage pseudo-attribute, for the sake of uniformity.
> 
> Add missing 'xen/compiler.h' #include-s where needed.
> 
> The text in docs/misra/deviations.rst and docs/misra/safe.json
> is modified to reflect this change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

With one note below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes in v2:
> - Edit safe.json.
> - Remove mention of SAF-1-safe in deviations.rst.
> ---
>   docs/misra/deviations.rst   |  5 ++---
>   docs/misra/safe.json        |  2 +-
>   xen/arch/arm/cpuerrata.c    |  7 +++----
>   xen/arch/arm/setup.c        |  5 ++---
>   xen/arch/arm/smpboot.c      |  3 +--
>   xen/arch/arm/traps.c        | 21 +++++++--------------
>   xen/arch/x86/boot/cmdline.c |  5 +++--
>   xen/arch/x86/boot/reloc.c   |  7 ++++---
>   xen/arch/x86/extable.c      |  3 +--
>   xen/arch/x86/setup.c        |  3 +--
>   xen/arch/x86/traps.c        | 27 +++++++++------------------
>   xen/common/efi/boot.c       |  5 ++---
>   12 files changed, 36 insertions(+), 57 deletions(-)
> 
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index d468da2f5ce9..0fa0475db0eb 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -134,9 +134,8 @@ Deviations related to MISRA C:2012 Rules:
>        - Tagged as `safe` for ECLAIR.
>   
>      * - R8.4
> -     - Functions and variables used only by asm modules are either marked with
> -       the `asmlinkage` macro or with a SAF-1-safe textual deviation
> -       (see safe.json).

This will require a rebase on top 
https://lore.kernel.org/all/b914ac93-2499-4bfd-a60a-51a9f1c170ec@xen.org/ 
with the updated wording.

Also, it is a good idea to mention any dependency with any patches that 
are not yet in 'staging' (The for-next branch from Stefano doesn't 
count). This helps the committers to know which order the patches should 
be committed and also the reviewers to apply the patches for review.

Cheers,

-- 
Julien Grall

