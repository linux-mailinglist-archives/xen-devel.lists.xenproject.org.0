Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52018174BB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656117.1024106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFBW-0005VX-Ro; Mon, 18 Dec 2023 15:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656117.1024106; Mon, 18 Dec 2023 15:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFBW-0005T6-Oz; Mon, 18 Dec 2023 15:05:34 +0000
Received: by outflank-mailman (input) for mailman id 656117;
 Mon, 18 Dec 2023 15:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FT9=H5=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFFBW-0005T0-5B
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:05:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e40ce329-9db6-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 16:05:33 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 76E1C4EE0742;
 Mon, 18 Dec 2023 16:05:32 +0100 (CET)
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
X-Inumbo-ID: e40ce329-9db6-11ee-98eb-6d05b1d4d9a1
Message-ID: <e0e01e1f-bfe3-401c-b418-858aab6114b3@bugseng.com>
Date: Mon, 18 Dec 2023 16:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] ACPI: address violations of MISRA C:2012 Rule 11.8
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <44c8f94bcfe4f0e33e53a7eb8aef826e7d906196.1702555387.git.maria.celeste.cesario@bugseng.com>
 <a9b5e527-b2a8-4edb-8285-77e6be0152e3@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <a9b5e527-b2a8-4edb-8285-77e6be0152e3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/23 17:36, Jan Beulich wrote:
> On 14.12.2023 13:07, Simone Ballarin wrote:
>> --- a/xen/include/acpi/acmacros.h
>> +++ b/xen/include/acpi/acmacros.h
>> @@ -116,7 +116,7 @@
>>   #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
>>   
>>   #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
>> -#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (u32,(a)) == *ACPI_CAST_PTR (u32,(b)))
>> +#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (const u32,(a)) == *ACPI_CAST_PTR (const u32,(b)))
> 
> Hmm, I'm a little hesitant to take changes to this header. We've
> inherited it from Linux, who in turn inherited / imported it from
> ACPI CA.
> 
>>   #else
>>   #define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (char,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
>>   #endif
> 
> What about this alternative code, btw?
> 
> Jan
> 
If the file is not supposed to be changed, I would consider adding it in
docs/misra/exclude-list*.
For the moment, I think it is better to drop the change.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


