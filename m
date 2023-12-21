Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A64381B3B0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658794.1028162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGNX-0001OF-U0; Thu, 21 Dec 2023 10:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658794.1028162; Thu, 21 Dec 2023 10:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGNX-0001KI-RM; Thu, 21 Dec 2023 10:34:11 +0000
Received: by outflank-mailman (input) for mailman id 658794;
 Thu, 21 Dec 2023 10:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+O=IA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rGGNW-0001JA-JX
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:34:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78e7e281-9fec-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:34:08 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 553C74EE0742;
 Thu, 21 Dec 2023 11:34:08 +0100 (CET)
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
X-Inumbo-ID: 78e7e281-9fec-11ee-9b0f-b553b5be7939
Message-ID: <ce1068ce-5537-4322-9316-d2260d9a9378@bugseng.com>
Date: Thu, 21 Dec 2023 11:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/7] xen/arm: address violations of MISRA C:2012 Rule
 16.3
Content-Language: en-US, it
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <d847830f-7071-4141-bab7-8b8c55ec3ae8@citrix.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <d847830f-7071-4141-bab7-8b8c55ec3ae8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/12/23 22:35, Andrew Cooper wrote:
> On 20/12/2023 11:03 am, Federico Serafini wrote:
>> This patch series addresses violations of MISRA C:2012 Rule 16.3 on the Arm
>> code. No fucntional changes are introduced.
>>
>> Federico Serafini (7):
>>    xen/arm: gic-v3: address violations of MISRA C:2012 Rule 16.3
>>    xen/arm: traps: address violations of MISRA C:2012 Rule 16.3
>>    xen/arm: guest_walk: address violations of MISRA C:2012 Rule 16.3
>>    xen/arm: mem_access: address violations of MISRA C:2012 Rule 16.3
>>    xen/arm: v{cp,sys}reg: address violations of MISRA C:2012 Rule 16.3
>>    xen/arm: mmu: address a violations of MISRA C:2012 Rule 16.3
>>    xen/arm: smmu-v3: address violations of MISRA C:2012 Rule 16.3
>>
>>   xen/arch/arm/arm64/vsysreg.c          |  4 ++--
>>   xen/arch/arm/gic-v3.c                 | 30 +++++++++++++++++++++++++++
>>   xen/arch/arm/guest_walk.c             |  4 ++++
>>   xen/arch/arm/mem_access.c             | 12 +++++------
>>   xen/arch/arm/mmu/p2m.c                |  1 +
>>   xen/arch/arm/traps.c                  | 18 ++++++++++++----
>>   xen/arch/arm/vcpreg.c                 |  4 ++--
>>   xen/drivers/passthrough/arm/smmu-v3.c |  2 ++
>>   8 files changed, 61 insertions(+), 14 deletions(-)
>>
> 
> Just a couple of notes on style.  This isn't a request to change
> anything in this series, particularly as most is already committed, but
> bear it in mind for what I expect will be similar patches in other areas.
> 
> We explicitly permit tabulation when it aids readibility, so patch 2
> could have been written:
> 
>          switch ( hypercall_args[*nr] ) {
>          case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEFU; fallthrough;
>          case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEFU; fallthrough;
>          case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEFU; fallthrough;
>          case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEFU; fallthrough;
>          case 1: /* Don't clobber x0/r0 -- it's the return value */
>          case 0: /* -ENOSYS case */
>              break;
>          default: BUG();
>          }
> 
> (give or take the brace placement other style issue)  We also have cases
> where a break before a new case statement is preferred, i.e.:
> 
>          ...
>          break;
> 
>      case ...:
> 
> This is to prevent larger switch statements from being a straight wall
> of text.
> 
> If in doubt, match the style around it.  Please don't de-tabulate
> examples which are already tabulated.  (i.e. don't de-tabulate the x86
> versions of patch 2.)
> 
> ~Andrew

Understood, thank you.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

