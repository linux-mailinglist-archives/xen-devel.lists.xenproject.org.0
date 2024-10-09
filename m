Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE79972FE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815047.1228779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaRm-0005YY-Hf; Wed, 09 Oct 2024 17:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815047.1228779; Wed, 09 Oct 2024 17:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaRm-0005VP-EO; Wed, 09 Oct 2024 17:26:02 +0000
Received: by outflank-mailman (input) for mailman id 815047;
 Wed, 09 Oct 2024 17:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syaRk-0005V5-PV
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:26:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb18a18-8663-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 19:25:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172849475297787.8002255667119;
 Wed, 9 Oct 2024 10:25:52 -0700 (PDT)
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
X-Inumbo-ID: 8bb18a18-8663-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728494753; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ak3PigJZhRURLXwiJRboIg5D8obTxghR0aSF1bnovAGmnvPFdfSS1c1mMsePtEJVM7UTC1xIHBoH3wYH/uWaKdQINGQAC1LDfuaDN3DUOUjlHepzRwauJUEnbMFroXQUQdGSAT+H2Kk4Si47+uwHeblMt7g61Cf/qDIwCHUAFg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728494753; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EK16H3fZfvQe0l1mL1qw8lvkCUbzkANqSSbabxoAHfQ=; 
	b=Z7kWdGCFGctsORokotuCFNX5S9wjpNMBNfXxyA6KxEGqJsrhiMX8f+bKSfUxMl/bRUygRf8UEPQ1B38BEcMi/5AZcbeWQNrbllVBq6e2QtatwpcslBBvQjEOE7z+yDTz8g+vbSamh4gv0uAqg4dopqPg4QERgEipJECsvHVI+CM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728494753;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EK16H3fZfvQe0l1mL1qw8lvkCUbzkANqSSbabxoAHfQ=;
	b=sXBpv0KSuWfITE0IiMaWz6o5b75eClz/pEBztbq3J/3dM9oTYjzZCiDJCyMTnbz0
	3WIYF2K9jHz6s6SWPqPNBmCB6N53Xa886pdnZ+lbSwMuRBPkN8UGXj/q+6QCCJHlnJn
	cHGdZR5aQJUrffmuGUOxzWODVu8FRZawRUFCE11g=
Message-ID: <065a3496-5db5-413e-9999-56987625ff86@apertussolutions.com>
Date: Wed, 9 Oct 2024 13:25:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/44] x86/boot: remove module_map usage from xsm
 policy loading
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-24-dpsmith@apertussolutions.com>
 <fc316f55-4f4e-4292-9b3f-90f4b0750b2b@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <fc316f55-4f4e-4292-9b3f-90f4b0750b2b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 12:36, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/setup.c  | 2 +-
>>   xen/include/xsm/xsm.h | 9 +++------
>>   xen/xsm/xsm_core.c    | 6 ++----
>>   xen/xsm/xsm_policy.c  | 5 +----
>>   4 files changed, 7 insertions(+), 15 deletions(-)
>>
> 
>> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
>> index 921bb254b9d1..a22367a62e93 100644
>> --- a/xen/xsm/xsm_policy.c
>> +++ b/xen/xsm/xsm_policy.c
> 
>> @@ -42,7 +41,6 @@ int __init xsm_multiboot_policy_init(
>>       /*
>>        * Try all modules and see whichever could be the binary policy.
>> -     * Adjust module_map for the module that is the binary policy.
>>        */
> 
> You can collapse to a single line comment /* ... */

Ack.

> With that:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thank you.

v/r,
dps

