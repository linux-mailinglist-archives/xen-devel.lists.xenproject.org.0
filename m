Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCD9F55C4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 19:14:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859812.1271911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNc5E-0008Kc-Ii; Tue, 17 Dec 2024 18:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859812.1271911; Tue, 17 Dec 2024 18:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNc5E-0008J6-Eb; Tue, 17 Dec 2024 18:14:12 +0000
Received: by outflank-mailman (input) for mailman id 859812;
 Tue, 17 Dec 2024 18:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAop=TK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tNc5C-0008Iz-Gp
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 18:14:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b50da9af-bca2-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 19:14:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 53D2F4EE0738;
 Tue, 17 Dec 2024 19:14:07 +0100 (CET)
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
X-Inumbo-ID: b50da9af-bca2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734459247; bh=peixyu20lZBiwBYOV4bETS5+n2nZxrmOd3LMgofoid4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AUfAuyKyVREcOd3Vw6IuoFN1YxcjcTGM894F9k0dJEblnnlK0KoQAbJa2ypm3vO67
	 jJShSUBDnyprCk0rVPetLeUG+JL8WnlRocpja3ig0Vsxk46sXmQPxxUhRHo38+tdeh
	 FJDuNPh63/6n91WtN5DefuYp+sQ4RVjrpBss/BcLYtJqT5x17jNKtwuKinjEtH/Y2K
	 9DmaD0UG+NwkQlgdeQQDd0EYsgWkPjA7XN0UNmjaVzfkTwJhAV1mcWlyI5Y42Um9um
	 /8mcNlFUspErCcRzcrGqNddg2ro6pxKy68nDiQlD4ztnFk5QO5WyjWvvL18tubpird
	 4nyDc6+ldkLVw==
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 19:14:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] eclair-analysis: Add usage of varargs extension for
 C99
In-Reply-To: <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
References: <bb0e1f3d0d4067b597c7cdae5ed9fc3e059d17ae.1734452569.git.nicola.vetrini@bugseng.com>
 <e85cb340-828a-4966-b5ca-09fca04e23ec@citrix.com>
Message-ID: <47ecd470ebcb26ae13d3eafcde4fa618@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-12-17 17:40, Andrew Cooper wrote:
> On 17/12/2024 4:24 pm, Nicola Vetrini wrote:
>> This extension name is missing from the current list of extension used
>> by Xen, therefore is must be added to that configuration in order to
>> avoid violations for MISRA C Rule 1.1.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Given CI is broken, I've put this in for testing:
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1592826906
> 
> But, a question:
> 
>> ---
>>  automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl 
>> b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> index 86e9a79b5231..9b419e562afa 100644
>> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> @@ -100,8 +100,8 @@
>>      ext_enum_value_not_int: non-documented GCC extension.
>>      ext_gnu_array_range: see Section \"6.29 Designated Initializers\" 
>> of "GCC_MANUAL".
>>  "
>> --config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
>> --config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
>> +-config=STD.diag,behavior+={c99,GCC_ARM64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_forward_ref_enum_def|ext_gnu_array_range)$"}
>> +-config=STD.diag,behavior+={c99,GCC_X86_64,"^(ext_paste_comma|ext_c_missing_varargs_arg|ext_missing_varargs_arg|ext_named_variadic_macro|ext_return_has_void_expr|ext_gnu_statement_expr_macro|ext_sizeof_alignof_void_type|ext_flexible_array_in_struct|ext_flexible_array_in_array|ext_enum_value_not_int|ext_gnu_array_range)$"}
>>  -doc_end
> 
> We're adding ext_c_missing_varargs_arg to the list.  But there's also
> ext_missing_varargs_arg.
> 
> What's the difference between the two?
> 

Actually on a closer look the second name can be dropped, so only 
"ext_c_missing_varargs_arg" is needed (and it's the same extension). 
I'll adjust the patch.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

