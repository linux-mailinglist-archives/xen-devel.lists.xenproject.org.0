Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10649CEA78F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 19:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194443.1512867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaeSi-0007Gi-DK; Tue, 30 Dec 2025 18:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194443.1512867; Tue, 30 Dec 2025 18:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaeSi-0007EI-Ak; Tue, 30 Dec 2025 18:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1194443;
 Tue, 30 Dec 2025 18:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdC4=7E=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vaeSg-0007EC-Vq
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 18:28:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aecaef3-e5ad-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 19:28:36 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E4BB74EE073F;
 Tue, 30 Dec 2025 19:28:35 +0100 (CET)
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
X-Inumbo-ID: 5aecaef3-e5ad-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767119316;
	b=GxnHOKuasmqw6k/s2o3tXGGo1Y0JjEDaZskhwGHZBYdzpXKSGRNmbVbGHFeTA7JGx8zf
	 A/i4LqJEeA0TXFJSiNFWdqJqtLK40C5chHrScv09Ioxvc8Rbkx+oykW8sSYz1g3EkKUa0
	 o6Qo3ewjIhcp+9Ap9PXJO8fZDnb+GJJabc/aam7+DRjQ6YQs4e7BiPlMCJIi07ezlHnzC
	 kMuTUM6YLYUQyFpVd0QXu4oPhd92JiQ07RkEP7v1jLGILNJo9S/flrtOWIi3VojDJ8Fvb
	 xbFDEn9kDEJx44uRIX9TIGUtsMzZGK18PVvFy5xbrfy5YOKX0O8aC0tDqGxfIPH+svM47
	 xvPdua8326DOC4qCA+qp9q5FbWlp2gpAiMvcCihDqiAKqefsLDKbASSBGRGoaGGwhhuqo
	 RnKjUtURHALVWSg9Z8NhZvDLnwdNq9KLk3D9cpKxR9zcxMAL9z847TZ4YihNpVdoqZ/vJ
	 kdufloj+umLtgATC2K/W3LsGcQF+dQiEa9L4gBIfpBsIHvTmYHK8QmTnj2qKD3en4VWJ9
	 W0K9DTt7mPhm5542D6efj93MW2pAgJiFow1q6PgwOqScT9pOT2nd6nBGVMoM7hRZN5/Ym
	 e/Yd0sHkUqZh4E0wuvXuLzsbe51RbMCczGmop9O9v28Vpbgl0bTdFaeCVbzJAUQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767119316;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=qMAYbliFMkDTGZvSMeybrph5kn01G3GXrtbFc+mgyVA=;
	b=TFkjFcM/utBAK6V7jQzOhEZdbsQ/8xe8u4rq4xuknF4W7GiMUJLd2KDq46VUyDv+jI7f
	 IZPhHW2XMKsiFQzSATwcEsN5l6myOBDFu8+Fi3+6XKKDfSFJ+CPJQd/0xYmZE4PJJR98D
	 o2Q/GyDrdRoYxlI+i4RIdniIvcCPqfHy0GVGehp+Y6wcfshkXMjw5M2Vp93JKojHsb3BJ
	 d4KJLPmNCKbUCOQKngyTBpNZGTMCEyNZXkDEUb7WPNAIVGHACiW1msA45tVs3fnX7Zcuk
	 h6+bb8Ls1yhA8wX356o/Wd+wTT/rri+V7/ph8hxQeSIAe5jHX8WvDdepFNUBayjJuXcI6
	 xvyN9Nh16Iei5w0PmohbDQmj2UgJFsLvIuQsqC8n2wC/O4JWfHF+chSXiPhWg9ofVEdoR
	 Ngf/4rWdfvKCwthvUkhskjBUmo9IFjyBSu+v3bdAc3qALaMybNBr/gKE9fnWnRgfk2JBP
	 1jkqe+5vTQ325WgCn+U1zrfewCBr90CsrUGVKytTI+h/8FCPlaZH2CrpTqEt7MzYRvB73
	 GJp+VIIe4t4Z4Exs0vHzyAbOCU5OElVEW1GKqe5uyDl7jMHjPyAsVXbSIiWWmwuq+FMAs
	 kLbGgYeqis79R/ts8BfY2mMPNAPslu66Hx2cciz9UwYueskmXsoL0eqPO3qL7o8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1767119316; bh=trMlDX9SjUoJohccGDMI00PEPdisa8sZUUeR+hAfsxU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gqAsHdnZL6aVqnaMvaY5ej2pd0+DaAmyvyI+Y2avqKgAK1imM7LIwl/ECAhdyeIyH
	 9OIhj8vd2ILWFKQF0KLrMRqVZ+gh1GEH68jZ8Wewq9t6QcD1UAxyz4iVJIePtTYeNd
	 y1cszqzAJZJsXEcyLyaNHFs/l9CUtlIr7x4VQyVZJl2tdCuWvJ6yW/0Adjbd2euEFD
	 93kSDm2OnyabJDlUAbVL+h34jEkaW3uaVOiAbct5DqBITOTJnGNww6IENNvNidxZC9
	 ZNxlLuCUp6oHGMBdpE3drHHGtao6xKoClI+ri07+Yb7qzvurLMO1BXSKcZVBiC7VYq
	 qzCz/e142POhQ==
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 19:28:35 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: Misra R17.1 in Xen
In-Reply-To: <d87f8fc638192656fa2a44eb9eff7801@bugseng.com>
References: <191589a4-cb8c-4e92-866e-03d9a194db5f@citrix.com>
 <d87f8fc638192656fa2a44eb9eff7801@bugseng.com>
Message-ID: <6d065af376df5527dc6a8f0a47054d85@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-30 18:34, Nicola Vetrini wrote:
> On 2025-12-30 18:05, Andrew Cooper wrote:
>> Hello,
>> 
>> The x86_64-allcode run highlights one new violation of R17.1,
>> vmcoreinfo_append_str().  In writing this email, I've found another in
>> debugtrace_printk() meaning that we're missing some options in the
>> -allcode configuration.
>> 
>> In deviations.ecl we have:
>> 
>> -doc_begin="printf()-like functions are allowed to use the variadic 
>> features provided by stdarg.h."
>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>> -config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>> -config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>> -doc_end
>> 
>> 
>> First, we have no printf() so that row should be removed.
>> 
> 
> I think it was for other variants of printf that are present in Xen 
> (e.g. vsnprintf). Perhaps it could be restricted a bit to be more 
> explicit.
> 
>> But, more importantly this is safe if and only if the function
>> declaration uses __attribute__((__format__(printf, ...))) to cause the
>> compiler to perform format typechecking.
>> 
>> Is it possible to encode this attribute requirement in the Eclair
>> expression, so that e.g. accidentally dropping the attribute causes a
>> violation to be reported?  This would also be rather safer than 
>> assuming
>> that any prefix on printk() is safe.
>> 
> 
> Well, the UBs associated to that rule (to varargs in general) go beyond 
> the formatting issues, but checking that the function decl has the 
> attribute is a good suggestion to harden these deviations. I'll make 
> some experiments and report back on this thread.

Currently it is possible to match on the presence of the attribute 
"format", not on its arguments. Since "printf" is the only archetype 
used with "format" I don't think this is a big issue currently, but I'll 
let you be the judge on that.

> 
>> Thanks,
>> 
>> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

