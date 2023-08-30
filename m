Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A578D6DE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593062.925965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMvl-0004CK-NC; Wed, 30 Aug 2023 15:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593062.925965; Wed, 30 Aug 2023 15:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMvl-00049u-K9; Wed, 30 Aug 2023 15:16:29 +0000
Received: by outflank-mailman (input) for mailman id 593062;
 Wed, 30 Aug 2023 15:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbMvk-00049o-HY
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:16:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3079def3-4748-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:16:27 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.38.20.102])
 by support.bugseng.com (Postfix) with ESMTPSA id 8F7E64EE0738;
 Wed, 30 Aug 2023 17:16:26 +0200 (CEST)
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
X-Inumbo-ID: 3079def3-4748-11ee-8783-cb3800f73035
Message-ID: <f06ac8ec-3fb4-ebce-9df9-5655ac3d6bc3@bugseng.com>
Date: Wed, 30 Aug 2023 17:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 06/13] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <e5d9700d6ca237aed64ad11a9025a71a6fd3e792.1693228255.git.simone.ballarin@bugseng.com>
 <5bc8dfaa-122c-e076-eb8c-5bfd9a459dad@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <5bc8dfaa-122c-e076-eb8c-5bfd9a459dad@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/23 15:27, Jan Beulich wrote:
> On 28.08.2023 15:20, Simone Ballarin wrote:
>> Add inclusion guards to address violations of
>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>> to prevent the contents of a header file being included more than
>> once").
>>
>> Mechanical change.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> ---
>>   xen/arch/x86/efi/efi-boot.h | 6 ++++++
>>   xen/arch/x86/efi/runtime.h  | 5 +++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 92f4cfe8bd..2c6be062cc 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -3,6 +3,10 @@
>>    * is intended to be included by common/efi/boot.c _only_, and
>>    * therefore can define arch specific global variables.
>>    */
>> +
>> +#ifndef __X86_EFI_EFI_BOOT_H__
>> +#define __X86_EFI_EFI_BOOT_H__
> 
> Considering the comment, I find the need for a guard here quite
> "interesting", to be honest.
> 
> Jan
I don't think a simple comment is enough to say that "precautions have 
been taken". For the moment, I will drop this change to keep this patch 
going.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


