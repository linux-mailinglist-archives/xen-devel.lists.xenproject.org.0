Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406F8178B3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656314.1024421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHQQ-0002EA-3G; Mon, 18 Dec 2023 17:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656314.1024421; Mon, 18 Dec 2023 17:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHQQ-0002C5-0l; Mon, 18 Dec 2023 17:29:06 +0000
Received: by outflank-mailman (input) for mailman id 656314;
 Mon, 18 Dec 2023 17:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFHQO-0002AT-TR
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:29:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f03ebf4e-9dca-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 18:29:03 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 26EBB4EE0742;
 Mon, 18 Dec 2023 18:29:03 +0100 (CET)
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
X-Inumbo-ID: f03ebf4e-9dca-11ee-98eb-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 18:29:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/5] xen/acpi: Use NULL as a null pointer constant
In-Reply-To: <80fec5de-ba29-4865-9062-490ffcf2fc60@suse.com>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
 <bb10a86a08eb36e9f9c6bda899cdc850afada403.1702553835.git.nicola.vetrini@bugseng.com>
 <80fec5de-ba29-4865-9062-490ffcf2fc60@suse.com>
Message-ID: <3f4be56f02b36567aed32bd556c3b8f7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-18 18:05, Jan Beulich wrote:
> On 14.12.2023 12:44, Nicola Vetrini wrote:
>> --- a/xen/include/acpi/acmacros.h
>> +++ b/xen/include/acpi/acmacros.h
>> @@ -111,7 +111,7 @@
>> 
>>  #define ACPI_TO_POINTER(i)              ACPI_ADD_PTR (void,(void *) 
>> NULL,(acpi_native_uint) i)
>>  #define ACPI_TO_INTEGER(p)              ACPI_PTR_DIFF (p,(void *) 
>> NULL)
>> -#define ACPI_OFFSET(d,f)                (acpi_size) ACPI_PTR_DIFF 
>> (&(((d *)0)->f),(void *) NULL)
>> +#define ACPI_OFFSET(d,f)                (acpi_size) ACPI_PTR_DIFF 
>> (&(((d *)NULL)->f),(void *) NULL)
>>  #define ACPI_PHYSADDR_TO_PTR(i)         ACPI_TO_POINTER(i)
>>  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
>> 
> 
> This again is an ACPI CA header, which I'm hesitant to see being 
> changed.
> 
> Jan

Yes, I sent this before the discussion on R11.8. I'm ok with adding all 
these files derived from ACPI CA to exclude-list.json, so in that case 
the patch can be ignored.
-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

