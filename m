Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78C4A34393
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887756.1297211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaZW-00066K-Jk; Thu, 13 Feb 2025 14:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887756.1297211; Thu, 13 Feb 2025 14:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaZW-00064s-Gz; Thu, 13 Feb 2025 14:52:10 +0000
Received: by outflank-mailman (input) for mailman id 887756;
 Thu, 13 Feb 2025 14:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKD7=VE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tiaZT-00064m-SX
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:52:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 173e506a-ea1a-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 15:52:05 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7A7764EF512A;
 Thu, 13 Feb 2025 15:52:04 +0100 (CET)
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
X-Inumbo-ID: 173e506a-ea1a-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739458324; bh=Y47wEjY+y+zSYZazpotpyKsB9xyjR+QAvO4hGpgPq2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tjOH9rRkgJNyxReNlQBk4mlnybvGPDIbnhirGpTqgOo+T4vMp86BWL5M4dRGvPxEZ
	 tuaSbx9SQ+Pwbnq0qNRIxLLDr9SX93V/b74z6WX0QWCC0g8uT94gh+cmOVNPTNLlqs
	 XzMeG1sFy/1bth/TXkYxnb6txy8DhFYCnSlBdpYRMLVhRHgdXyzfR3iucQGo52PR96
	 YpJpH/BqodKglb/IWw3TVfSISRut7C+8wWskqKW7QJLG7PXC7Qu21O9PnCBUqhheay
	 RfCp6981XEuhFxEQgotGh56ELbIR6x4je+c6j28SL3c2inA3xyaWVUGbdGs1vsVtKh
	 F4xFK7iy0qnOA==
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 15:52:04 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
In-Reply-To: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
Message-ID: <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-13 15:22, Jan Beulich wrote:
> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
> left shifting negative values is UB. Use an unsigned intermediate type,
> reducing the impact to implementation defined behavior (for the
> unsigned->signed conversion).
> 
> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric 
> 'l'
> tag.
> 
> No difference in generated code, at least on x86.
> 
> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions) 
> radix_tree_int_to_ptr()")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
>          tagging.ecl the codebase is clean for this rule, aiui.
> 

radix-tree.{c,h} is out of scope:

automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
docs/misra/exclude-list.json:153:            "rel_path": 
"common/radix-tree.c",

We are in the process of setting up a wider analysis (i.e. with a 
different exclusion set) with a broader configuration that may catch 
these issues.

> --- a/xen/include/xen/radix-tree.h
> +++ b/xen/include/xen/radix-tree.h
> @@ -172,7 +172,7 @@ static inline void radix_tree_replace_sl
>   */
>  static inline void *radix_tree_int_to_ptr(int val)
>  {
> -    long _ptr = ((long)val << 2) | 0x2l;
> +    long _ptr = ((unsigned long)val << 2) | 2;
>      ASSERT((_ptr >> 2) == val);
>      return (void *)_ptr;
>  }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

