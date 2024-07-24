Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6993B055
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 13:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764125.1174458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWaEV-00088U-Dh; Wed, 24 Jul 2024 11:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764125.1174458; Wed, 24 Jul 2024 11:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWaEV-00086U-B8; Wed, 24 Jul 2024 11:32:35 +0000
Received: by outflank-mailman (input) for mailman id 764125;
 Wed, 24 Jul 2024 11:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9b6=OY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sWaEU-00086O-Gu
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 11:32:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b26e532-49b0-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 13:32:33 +0200 (CEST)
Received: from [10.176.0.4] (unknown [160.78.253.149])
 by support.bugseng.com (Postfix) with ESMTPSA id 44BF94EE0738;
 Wed, 24 Jul 2024 13:32:32 +0200 (CEST)
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
X-Inumbo-ID: 6b26e532-49b0-11ef-bbfe-fd08da9f4363
Message-ID: <efb0d95f-2feb-419f-92fb-ff2d1c199cb9@bugseng.com>
Date: Wed, 24 Jul 2024 13:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/9] automation/eclair: fix deviation of MISRA C
 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <490e1a84b1b4b8d983dc41af147191f79506cdbd.1721050709.git.federico.serafini@bugseng.com>
 <d39e4fd8-ce54-48b2-8b20-b22b5c70fe73@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <d39e4fd8-ce54-48b2-8b20-b22b5c70fe73@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/07/24 11:45, Jan Beulich wrote:
> On 15.07.2024 18:48, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -499,7 +499,7 @@ safe."
>>   -doc_end
>>   
>>   -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
>> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
>>   -doc_end
>>   
>>   -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
> 
> This patch doesn't apply. There's a somewhat similar entry, but its doc_begin
> line is sufficiently different. I have no idea what's going on here; there's
> no dependency stated anywhere.

Right, this patch depends on [1] which has not been committed yet.

[1]
https://lists.xenproject.org/archives/html/xen-devel/2024-06/msg01347.html

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

