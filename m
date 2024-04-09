Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B43589D1AF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 07:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702133.1096994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3aF-00072b-QN; Tue, 09 Apr 2024 04:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702133.1096994; Tue, 09 Apr 2024 04:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3aF-000708-NM; Tue, 09 Apr 2024 04:59:47 +0000
Received: by outflank-mailman (input) for mailman id 702133;
 Tue, 09 Apr 2024 04:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xQG8=LO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ru3aE-000702-65
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:59:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faf11f4c-f62d-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 06:59:44 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 874924EE0739;
 Tue,  9 Apr 2024 06:59:43 +0200 (CEST)
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
X-Inumbo-ID: faf11f4c-f62d-11ee-843a-3f19d20e7db6
MIME-Version: 1.0
Date: Tue, 09 Apr 2024 06:59:43 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 3/9] x86/irq: tidy switch statement and address
 MISRA violation
In-Reply-To: <alpine.DEB.2.22.394.2404081712520.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <d1bdd54b6751a047626b0271fff882484f98ea1a.1712305581.git.nicola.vetrini@bugseng.com>
 <dfa9e320-266a-49aa-8d90-5e0c63ab1db6@suse.com>
 <alpine.DEB.2.22.394.2404081712520.2245130@ubuntu-linux-20-04-desktop>
Message-ID: <a5dacef22c839d344f04e31819cbfcb8@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-09 02:14, Stefano Stabellini wrote:
> On Mon, 8 Apr 2024, Jan Beulich wrote:
>> On 05.04.2024 11:14, Nicola Vetrini wrote:
>> > Remove unneded blank lines between switch clauses.
>> 
>> NAK for this part again.
>> 
>> > --- a/xen/arch/x86/irq.c
>> > +++ b/xen/arch/x86/irq.c
>> > @@ -2882,7 +2882,7 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p)
>> >  int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>> >                                int type, struct msi_info *msi)
>> >  {
>> > -    int irq, pirq, ret;
>> > +    int irq = -1, pirq, ret;
>> >
>> >      ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
>> >
>> > @@ -2892,12 +2892,10 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>> >          if ( !msi->table_base )
>> >              msi->entry_nr = 1;
>> >          irq = index;
>> > -        if ( irq == -1 )
>> > -        {
>> > +        fallthrough;
>> >      case MAP_PIRQ_TYPE_MULTI_MSI:
>> > +        if( type == MAP_PIRQ_TYPE_MULTI_MSI || irq == -1 )
>> >              irq = create_irq(NUMA_NO_NODE, true);
>> 
>> It may seem small, but this extra comparison already is duplication 
>> I'd rather
>> see avoided. At the very least though you want to clarify in the 
>> description
>> whether the compiler manages to eliminate it again.
> 
> It could just be:
> 
>     if ( irq == -1 )
> 
> because in the MAP_PIRQ_TYPE_MULTI_MSI case we know the irq will be -1.
> No duplication needed.

Ok then. Didn't know whether I could avoid the check to get this 
structuring.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

