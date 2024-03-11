Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D0877F9C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 13:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691440.1077418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjeQr-0002Ws-II; Mon, 11 Mar 2024 12:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691440.1077418; Mon, 11 Mar 2024 12:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjeQr-0002Uv-Fi; Mon, 11 Mar 2024 12:07:05 +0000
Received: by outflank-mailman (input) for mailman id 691440;
 Mon, 11 Mar 2024 12:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjeQq-0002Up-30
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 12:07:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df1fe9bf-df9f-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 13:07:03 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 6CACA4EE0C90;
 Mon, 11 Mar 2024 13:07:02 +0100 (CET)
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
X-Inumbo-ID: df1fe9bf-df9f-11ee-afdc-a90da7624cb6
Message-ID: <a8bb254d-c441-477e-902f-06e8327bf112@bugseng.com>
Date: Mon, 11 Mar 2024 13:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 04/16] xen/arm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <868ede5a23489e018e272188edfbee572d1ad393.1710145041.git.simone.ballarin@bugseng.com>
 <332ebf49-9aa4-42fd-99be-bda16580c92f@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <332ebf49-9aa4-42fd-99be-bda16580c92f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/24 11:10, Jan Beulich wrote:
> On 11.03.2024 09:59, Simone Ballarin wrote:
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -3,6 +3,10 @@
>>    * is intended to be included by common/efi/boot.c _only_, and
>>    * therefore can define arch specific global variables.
>>    */
>> +
>> +#ifndef XEN_ARCH_ARM_EFI_EFI_BOOT_H
>> +#define XEN_ARCH_ARM_EFI_EFI_BOOT_H
> 
> Related to my question raised against the cover letter, what does the
> XEN_ prefix gain us here? All building of the hypervisor binaries
> happens inside the xen/ subtree.
> 
> Jan

what do you thing about adding this rule:
arch/<arch>/<subdir>/<filename> -> <ARCH>_<subdir>_<filename>_H
?

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


