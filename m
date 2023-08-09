Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F397776235
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581164.909741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjzx-0005Nl-Vw; Wed, 09 Aug 2023 14:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581164.909741; Wed, 09 Aug 2023 14:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjzx-0005M6-Ss; Wed, 09 Aug 2023 14:17:17 +0000
Received: by outflank-mailman (input) for mailman id 581164;
 Wed, 09 Aug 2023 14:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTjzw-0005Lw-1i
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:17:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ff732a7-36bf-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 16:17:14 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id DBD0D4EE073F;
 Wed,  9 Aug 2023 16:17:13 +0200 (CEST)
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
X-Inumbo-ID: 6ff732a7-36bf-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 16:17:13 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 7/8] x86/i8259: address MISRA C:2012 Rule 8.4
In-Reply-To: <d752a7b5-4b8b-8394-8e72-bcdffce1fb82@suse.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com>
 <d752a7b5-4b8b-8394-8e72-bcdffce1fb82@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1cfa92d52d89b2013218cef1c518ab4d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2023 14:52, Jan Beulich wrote:
> On 09.08.2023 13:02, Nicola Vetrini wrote:
>> The additional header file makes the declaration for the function
>> 'init_IRQ', defined in this file visible, thereby resolving the
>> violation of Rule 8.4.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/i8259.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
>> index 6b35be10f0..9b02a3a0ae 100644
>> --- a/xen/arch/x86/i8259.c
>> +++ b/xen/arch/x86/i8259.c
>> @@ -19,6 +19,7 @@
>>  #include <xen/delay.h>
>>  #include <asm/apic.h>
>>  #include <asm/asm_defns.h>
>> +#include <asm/setup.h>
>>  #include <io_ports.h>
>>  #include <irq_vectors.h>
> 
> A patch adding this #include has been pending for almost 3 months:
> https://lists.xen.org/archives/html/xen-devel/2023-05/msg00896.html
> 
> Jan

So do you prefer going forward with that patch or this one (mentioning 
it
in the additional commit context of course)?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

