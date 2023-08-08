Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D846773A86
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579911.908107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMuk-0001T3-7I; Tue, 08 Aug 2023 13:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579911.908107; Tue, 08 Aug 2023 13:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMuk-0001R4-4h; Tue, 08 Aug 2023 13:38:22 +0000
Received: by outflank-mailman (input) for mailman id 579911;
 Tue, 08 Aug 2023 13:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTMuj-0001Qy-A9
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:38:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d584da4c-35f0-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:38:18 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3442E4EE0737;
 Tue,  8 Aug 2023 15:38:18 +0200 (CEST)
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
X-Inumbo-ID: d584da4c-35f0-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 15:38:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 1/2] x86/vmsi: rename variables to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <9e5f208e-7419-b16d-c705-592959dc0ea1@suse.com>
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
 <605687eff99db7181ef6c05bce671e20f194b46b.1691488505.git.nicola.vetrini@bugseng.com>
 <9e5f208e-7419-b16d-c705-592959dc0ea1@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e86dc812f4e365d8f23a14f9edcc2852@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2023 15:22, Jan Beulich wrote:
> On 08.08.2023 14:22, Nicola Vetrini wrote:
>> The local variables 'irq_desc' shadow the homonymous global variable,
>> declared in 'xen/arch/x86/include/asm/irq.h', therefore they are 
>> renamed
>> 'irqd' for consistency with ARM code. Other variables of the same type
>> in the file are also renamed 'irqd' for consistency.
> 
> I'm pretty sure I pointed out that Arm uses a mix of "desc" and "irqd".
> So "consistency with ARM code" doesn't ...
> 
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -281,7 +281,7 @@ static int msixtbl_write(struct vcpu *v, unsigned 
>> long address,
>>      unsigned int nr_entry, index;
>>      int r = X86EMUL_UNHANDLEABLE;
>>      unsigned long flags;
>> -    struct irq_desc *desc;
>> +    struct irq_desc *irqd;
> 
> ... require e.g. this rename. As mentioned before: Let's limit code
> churn where possible, and where going beyond what's strictly necessary
> isn't otherwise useful; there's already enough of it with all these not
> really helpful Misra changes.
> 
>> @@ -462,7 +462,7 @@ static void del_msixtbl_entry(struct msixtbl_entry 
>> *entry)
>> 
>>  int msixtbl_pt_register(struct domain *d, struct pirq *pirq, uint64_t 
>> gtable)
>>  {
>> -    struct irq_desc *irq_desc;
>> +    struct irq_desc *irqd;
> 
> This one indeed wants renaming, but then - consistent within the file -
> to "desc". At least that's my view.
> 
> Jan

Well, but having

struct irq_desc *desc;
struct msi_desc *msi_desc;

and then using them both within the function doesn't seem that readable, 
but if you
prefer "desc" I have no objection (just two local variables that need to 
be changed).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

