Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E9817398
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656051.1023967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEfk-00082L-Rh; Mon, 18 Dec 2023 14:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656051.1023967; Mon, 18 Dec 2023 14:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEfk-00080R-OD; Mon, 18 Dec 2023 14:32:44 +0000
Received: by outflank-mailman (input) for mailman id 656051;
 Mon, 18 Dec 2023 14:32:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FT9=H5=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFEfk-00080G-4Y
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:32:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de7d172-9db2-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:32:43 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 964E14EE0742;
 Mon, 18 Dec 2023 15:32:42 +0100 (CET)
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
X-Inumbo-ID: 4de7d172-9db2-11ee-98eb-6d05b1d4d9a1
Message-ID: <d3e4a5ae-a57d-4101-ba8a-e3a2390d9072@bugseng.com>
Date: Mon, 18 Dec 2023 15:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] xen/efi: address violations of MISRA C:2012 Rule 11.8
To: Jan Beulich <jbeulich@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
 <4540a3850dae951dd6bc4f9b001c9816bde2e49e.1702555387.git.maria.celeste.cesario@bugseng.com>
 <61867b53-648f-4bb0-b430-aa5d343cb29a@suse.com>
Content-Language: en-US
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <61867b53-648f-4bb0-b430-aa5d343cb29a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/23 17:32, Jan Beulich wrote:
> On 14.12.2023 13:07, Simone Ballarin wrote:
>> --- a/xen/common/version.c
>> +++ b/xen/common/version.c
>> @@ -178,7 +178,7 @@ void __init xen_build_init(void)
>>       if ( &n[1] >= __note_gnu_build_id_end )
>>           return;
>>   
>> -    sz = (void *)__note_gnu_build_id_end - (void *)n;
>> +    sz = (const void *)__note_gnu_build_id_end - (const void *)n;
>>   
>>       rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>>   
> 
> How does this change fit the subject? I'm also inclined to ask that these
> casts be changed to unsigned long or uintptr_t.
> 
> For the actual EFI change:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
> 

Ok, v2 will use uintptr_t.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


