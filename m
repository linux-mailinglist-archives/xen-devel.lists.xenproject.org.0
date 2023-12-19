Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B27B818AC2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656958.1025494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbd6-0003H2-7i; Tue, 19 Dec 2023 15:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656958.1025494; Tue, 19 Dec 2023 15:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbd6-0003FN-4i; Tue, 19 Dec 2023 15:03:32 +0000
Received: by outflank-mailman (input) for mailman id 656958;
 Tue, 19 Dec 2023 15:03:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNFb=H6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFbd4-0003F8-Eb
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 15:03:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f05767-9e7f-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 16:03:28 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A27AB4EE0738;
 Tue, 19 Dec 2023 16:03:27 +0100 (CET)
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
X-Inumbo-ID: c3f05767-9e7f-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 16:03:27 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/6] xen: add SAF deviation for safe cast removal
In-Reply-To: <7dfb364e-e144-4a92-825a-71394610b931@suse.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <dff9e788e04aa04970cfbb70d09f4d1baf725506.1702982442.git.maria.celeste.cesario@bugseng.com>
 <7dfb364e-e144-4a92-825a-71394610b931@suse.com>
Message-ID: <8251c32b9af3da9e69538285d0e1c25c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-19 12:28, Jan Beulich wrote:
> On 19.12.2023 12:05, Simone Ballarin wrote:
>> --- a/xen/arch/arm/guestcopy.c
>> +++ b/xen/arch/arm/guestcopy.c
>> @@ -109,6 +109,7 @@ static unsigned long copy_guest(void *buf, 
>> uint64_t addr, unsigned int len,
>> 
>>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned 
>> int len)
>>  {
>> +    /* SAF-3-safe COPY_to_guest doesn't modify from */
>>      return copy_guest((void *)from, (vaddr_t)to, len,
>>                        GVA_INFO(current), COPY_to_guest | 
>> COPY_linear);
>>  }
>> @@ -116,6 +117,7 @@ unsigned long raw_copy_to_guest(void *to, const 
>> void *from, unsigned int len)
>>  unsigned long raw_copy_to_guest_flush_dcache(void *to, const void 
>> *from,
>>                                               unsigned int len)
>>  {
>> +    /* SAF-3-safe COPY_to_guest doesn't modify from */
>>      return copy_guest((void *)from, (vaddr_t)to, len, 
>> GVA_INFO(current),
>>                        COPY_to_guest | COPY_flush_dcache | 
>> COPY_linear);
>>  }
> 
> Unlike below for x86, here in both cases the comment cover more than
> just the one function argument they are intended to cover. I think we
> want to limit the scope of such comments as much as possible (and
> hence have as little as possible on the immediately following line).
> 
> Jan

Ok, noted for v3.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

