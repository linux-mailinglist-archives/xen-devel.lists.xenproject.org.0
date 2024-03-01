Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23A86DCBE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687554.1071176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxyH-0008Cr-PU; Fri, 01 Mar 2024 08:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687554.1071176; Fri, 01 Mar 2024 08:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxyH-0008As-Mt; Fri, 01 Mar 2024 08:10:21 +0000
Received: by outflank-mailman (input) for mailman id 687554;
 Fri, 01 Mar 2024 08:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBmU=KH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfxyG-0008Am-17
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:10:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 240a96a4-d7a3-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 09:10:18 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8F5904EE0737;
 Fri,  1 Mar 2024 09:10:17 +0100 (CET)
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
X-Inumbo-ID: 240a96a4-d7a3-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Fri, 01 Mar 2024 09:10:17 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 08/10] xen/errno: address violations of MISRA C Rule
 20.7
In-Reply-To: <alpine.DEB.2.22.394.2402291454360.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <92dbcd9e5aa2ab45c50f3f567ddece59108568ad.1709219010.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402291454360.853156@ubuntu-linux-20-04-desktop>
Message-ID: <726934748a14fa5173438a3529411678@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 23:55, Stefano Stabellini wrote:
> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/include/xen/errno.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/xen/include/xen/errno.h b/xen/include/xen/errno.h
>> index 69b28dd3c6c5..506674701fae 100644
>> --- a/xen/include/xen/errno.h
>> +++ b/xen/include/xen/errno.h
>> @@ -3,7 +3,7 @@
>> 
>>  #ifndef __ASSEMBLY__
>> 
>> -#define XEN_ERRNO(name, value) name = value,
>> +#define XEN_ERRNO(name, value) name = (value),
> 
> I see this and the fact that "name" was not parenthesized and it would
> deliberate right? So I guess the left side of an assignment doesn't 
> need
> parenthesis?

Exactly. Quoting from rules.rst:
Extra parentheses are not required when macro parameters are used
as function arguments, as macro arguments, array indices, lhs in
assignments

so, as noted in earlier discussions in this series, it could either be 
said that the rhs consisting of a single expression is similarly ok, or 
have (name) = (value) for consistency.
Do note that a considerable percentage of violations are caused by these 
definitions (PERFCOUNTER, XEN_ERRNO and probably others in x86).

--
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

