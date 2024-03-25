Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4E88A0F9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 14:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697747.1088827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rok32-0001oc-IX; Mon, 25 Mar 2024 13:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697747.1088827; Mon, 25 Mar 2024 13:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rok32-0001m9-FQ; Mon, 25 Mar 2024 13:07:32 +0000
Received: by outflank-mailman (input) for mailman id 697747;
 Mon, 25 Mar 2024 13:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuQ0=K7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rok31-0001m3-CL
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 13:07:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1a24664-eaa8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 14:07:28 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B24894EE0739;
 Mon, 25 Mar 2024 14:07:27 +0100 (CET)
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
X-Inumbo-ID: a1a24664-eaa8-11ee-afe3-a90da7624cb6
MIME-Version: 1.0
Date: Mon, 25 Mar 2024 14:07:27 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 06/11] xen/efi: address violations of MISRA C Rule
 20.7
In-Reply-To: <afa5ab91-1ea2-4e5d-aada-7f6c64c142b1@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <2d3842a990189c37fa12672994b779ad42975235.1711118582.git.nicola.vetrini@bugseng.com>
 <afa5ab91-1ea2-4e5d-aada-7f6c64c142b1@suse.com>
Message-ID: <a94fca9c3de7af7b076e967158a19240@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-25 10:25, Jan Beulich wrote:
> On 22.03.2024 17:01, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Seeing this is again touching an imported header, we finally need to 
> settle
> on where to draw the line. The way this is going is that you're 
> proposing
> many small changes which individually all look "small enough". Yet when
> doing so for long enough, the entire header may end up different from 
> its
> original.
> 
> Jan
> 

Ok, if you feel that these (and possibly others) are too many, then I'll 
leave xen/include/efi/* alone and deviate those violations resulting 
from the use of these macros in files that are in scope. I don't think 
there are others from imported headers outside efi, but I'm not 100% 
sure.

>> --- a/xen/include/efi/efiapi.h
>> +++ b/xen/include/efi/efiapi.h
>> @@ -63,7 +63,8 @@ EFI_STATUS
>>      OUT UINT32                      *DescriptorVersion
>>      );
>> 
>> -#define NextMemoryDescriptor(Ptr,Size)  ((EFI_MEMORY_DESCRIPTOR *) 
>> (((UINT8 *) Ptr) + Size))
>> +#define NextMemoryDescriptor(Ptr,Size)  ((EFI_MEMORY_DESCRIPTOR *) \
>> +                                         ((UINT8 *)(Ptr) + (Size)))
>> 
>> 
>>  typedef

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

