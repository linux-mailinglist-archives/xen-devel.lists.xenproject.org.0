Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB173B2D9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 10:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554318.865450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCcNX-00024e-IG; Fri, 23 Jun 2023 08:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554318.865450; Fri, 23 Jun 2023 08:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCcNX-000226-EL; Fri, 23 Jun 2023 08:42:51 +0000
Received: by outflank-mailman (input) for mailman id 554318;
 Fri, 23 Jun 2023 08:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4arX=CL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qCcNW-000220-GT
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 08:42:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee11c34f-11a1-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 10:42:48 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.163.128.130])
 by support.bugseng.com (Postfix) with ESMTPSA id 6D5044EE0737;
 Fri, 23 Jun 2023 10:42:46 +0200 (CEST)
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
X-Inumbo-ID: ee11c34f-11a1-11ee-b237-6b7b168915f2
Message-ID: <05593ceb-b04c-efec-05c9-b09d4cd26c11@bugseng.com>
Date: Fri, 23 Jun 2023 10:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v2] xen/arm: fix violations of MISRA C:2012 R8.3 on
 parameter names.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <11c50030015014ff1a80dca849a4262133b2707a.1687502320.git.federico.serafini@bugseng.com>
 <9e0decef-0a56-1993-eee2-59e31a41ccdf@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <9e0decef-0a56-1993-eee2-59e31a41ccdf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/06/23 09:32, Julien Grall wrote:
> Hi,
> 
> On 23/06/2023 07:54, Federico Serafini wrote:
>> To comply with Rule 8.3 ("All declarations of an object or function
>> shall use the same names and type qualifiers") change the parameter
>> names in order to have function declarations consistent with the
>> corresponding definitions.
>>
>> Change the function identifier 'access_guest_memory_by_ipa' to
>> 'access_guest_memory_by_gpa' in accordance with modifications on its
>> formal parameters: 'gpa' is used more frequently than 'ipa' and is
>> therefore preferable.
> 
> I already hinted in the previous version, but I guess this wasn't clear 
> enough. A patch should do one similar thing because it is easier to 
> review and justify.
> 
> For instance you explain the renaming function renaming but you don't 
> really say why sometimes you updated the definition but other the 
> declarations.
> 
> I think this patch should be split in multiple parts:
>    1. Patch to rename arch_guest_memory_by_ipa() and update the 
> parameter name
>    2. Patch(s) to rename the parameter name on the definitions (e.g. 
> vcpu_vgic_init() & co). They could be bundled by file.
>    3. Patch to rename the parameter name on the declarations. This is 
> pretty much your patch v1 but without the changes in 1/2.
> 
> Cheers,
> 

Hello,

thank you for your suggestions.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

