Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAFE7D3A63
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 17:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621535.968090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quwZo-0001Vd-Oi; Mon, 23 Oct 2023 15:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621535.968090; Mon, 23 Oct 2023 15:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quwZo-0001T1-Kw; Mon, 23 Oct 2023 15:10:44 +0000
Received: by outflank-mailman (input) for mailman id 621535;
 Mon, 23 Oct 2023 15:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4wXt=GF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1quwZn-0001Sv-Fo
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 15:10:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5478fb0d-71b6-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 17:10:41 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 76E364EE0747;
 Mon, 23 Oct 2023 17:10:40 +0200 (CEST)
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
X-Inumbo-ID: 5478fb0d-71b6-11ee-9b0e-b553b5be7939
Message-ID: <177e5404-bb86-466e-a23a-60098a477c5b@bugseng.com>
Date: Mon, 23 Oct 2023 17:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
 <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
 <3de5e340-30bb-44aa-affd-89f343ed1fa1@bugseng.com>
 <7066a646-711c-4dce-f3c0-effb6ae91a39@xen.org>
 <67782815-7803-4ef5-80f4-db6181f7a6e2@bugseng.com>
 <15923aaf-c005-45fb-8bb4-50d2e0995f18@xen.org>
 <8734535a-0c00-44b4-8257-64155807b052@bugseng.com>
 <edc5d2b1-a3bd-44c4-83ea-6ff436fe7346@xen.org>
 <d6af702c-9945-4eea-a102-96910be334dc@bugseng.com>
 <alpine.DEB.2.22.394.2310191128560.2099202@ubuntu-linux-20-04-desktop>
 <fe61e283-93f7-4718-bc8d-d1df160f753c@xen.org>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <fe61e283-93f7-4718-bc8d-d1df160f753c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/23 10:28, Julien Grall wrote:
> Hi Stefano,
> 
> On 19/10/2023 19:30, Stefano Stabellini wrote:
>>>> We usually use this trick when 'current' is used multiple time to save
>>>> process (using 'current' is not cost free). But in this case, this is
>>>> renaming without any apparent benefits.
>>>>
>>>> If we wanted to go down this route, then this would likely want a 
>>>> comment.
>>>> At which point we should just deviate.
>>>>
>>>> I will have a think if there are something else we can do. Could we 
>>>> consider
>>>> to not address it for now?
>>>>
>>>
>>> I totally agree.
>>
>> I am wondering if we could deviate "current" because even with the
>> implementation using volatile we know it doesn't have "side effects" in
>> the sense of changing things for other code outside the function.
> 
> I will let Simone to confirm whether it is possible to do it from a 
> technical point of view.

Yes, it is possible.
> 
> Leaving the technical part aside, is the only violations are the one in 
> this patch? If so, I don't think it makes sense to deviate 'current' 
> globally. It would be better to have local deviations.
> 
> Cheers,
> 
For this specific case I agree in using a local deviation.
In the next version of the patch, I will use a SAF comment.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


