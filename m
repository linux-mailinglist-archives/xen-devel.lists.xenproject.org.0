Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47EC773A95
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579950.908178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNBk-00072M-5w; Tue, 08 Aug 2023 13:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579950.908178; Tue, 08 Aug 2023 13:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNBk-0006zX-1S; Tue, 08 Aug 2023 13:55:56 +0000
Received: by outflank-mailman (input) for mailman id 579950;
 Tue, 08 Aug 2023 13:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTNBi-0006yO-4z
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:55:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49a4c9fc-35f3-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:55:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3313E4EE0737;
 Tue,  8 Aug 2023 15:55:52 +0200 (CEST)
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
X-Inumbo-ID: 49a4c9fc-35f3-11ee-b280-6b7b168915f2
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 15:55:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 1/2] x86/vmsi: rename variables to address MISRA
 C:2012 Rule 5.3
In-Reply-To: <250d3d77-9668-eac3-172d-5a0e50d33070@suse.com>
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
 <605687eff99db7181ef6c05bce671e20f194b46b.1691488505.git.nicola.vetrini@bugseng.com>
 <9e5f208e-7419-b16d-c705-592959dc0ea1@suse.com>
 <e86dc812f4e365d8f23a14f9edcc2852@bugseng.com>
 <250d3d77-9668-eac3-172d-5a0e50d33070@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <3ce445c4628b28b3aa0869ab2250c9b2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>>> 
>>>> @@ -462,7 +462,7 @@ static void del_msixtbl_entry(struct 
>>>> msixtbl_entry
>>>> *entry)
>>>> 
>>>>  int msixtbl_pt_register(struct domain *d, struct pirq *pirq, 
>>>> uint64_t
>>>> gtable)
>>>>  {
>>>> -    struct irq_desc *irq_desc;
>>>> +    struct irq_desc *irqd;
>>> 
>>> This one indeed wants renaming, but then - consistent within the file 
>>> -
>>> to "desc". At least that's my view.
>> 
>> Well, but having
>> 
>> struct irq_desc *desc;
>> struct msi_desc *msi_desc;
>> 
>> and then using them both within the function doesn't seem that 
>> readable,
> 
> You have a point there, yes. Still I'd then probably follow up with a
> change to rename msi_desc -> msi (and I say this despite seeing that
> farther down in the file "msi" is also used for another pointer type
> variables/parameters). But with what you say in mind I'd also be okay
> with you renaming to irqd where renaming is needed, but leaving "desc"
> alone.
> 
> Jan

I'll go for the latter (it's quicker) as a separate patch, since 
hopefully the other patch
in the series can go in unmodified.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

