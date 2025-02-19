Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6AA3C0F7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 15:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892979.1301914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkdi-00047O-C7; Wed, 19 Feb 2025 14:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892979.1301914; Wed, 19 Feb 2025 14:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkdi-00045D-9W; Wed, 19 Feb 2025 14:01:26 +0000
Received: by outflank-mailman (input) for mailman id 892979;
 Wed, 19 Feb 2025 14:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOrE=VK=bounce.vates.tech=bounce-md_30504962.67b5e431.v1-6433945120d447b1bc1cfa3182a95913@srs-se1.protection.inumbo.net>)
 id 1tkkdg-000457-Hg
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 14:01:24 +0000
Received: from mail178-27.suw51.mandrillapp.com
 (mail178-27.suw51.mandrillapp.com [198.2.178.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffee8b6a-eec9-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 15:01:23 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-27.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YydNK4L59z6CPyVm
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 14:01:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6433945120d447b1bc1cfa3182a95913; Wed, 19 Feb 2025 14:01:21 +0000
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
X-Inumbo-ID: ffee8b6a-eec9-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739973681; x=1740243681;
	bh=kT45SCe2FoTTd6YI47cWSy7YjQDFdYlLX/a6oHhUEeQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0WToSI/SlJmqTqJ+802rhZQY92lOJicvlMNj96yUN1TJq20MpfV2eZTABv0BgyRQ5
	 8WkS4XAl9KQOhanZuEXcMYCuWoIPP0M78JC6klaSSaxpXXD1PxtiwNSO2zrtl1pIn9
	 ZJcqNEWZhM/F1RPpetUqGQLFdpdoRWSszhaXBoL3WKv9mrXUuRwOrUO8QQdsXsP4oF
	 hVKB635TIMzfzq8VvUSQF7K9+n/rCe7uMXoYgbiOj3kNXMYcwl8sReHEF9A/jT69A6
	 kCHViq8ysr15QP8RD8VTtqVi1C0AgOlpO3QWidg138rwPmRZ8UmmJ86TG5/Arwu044
	 Sk7ygTM3aZotg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739973681; x=1740234181; i=teddy.astie@vates.tech;
	bh=kT45SCe2FoTTd6YI47cWSy7YjQDFdYlLX/a6oHhUEeQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KMzIi6T2MdQqwK8Z4m6UuFuTms/H302a2Ph2yX1lwdRZHNrLHR9bTLCxGApBtp69O
	 pFjBO5vnrhJFKUizdsqe5aNz0O/Ib///z3fLFUXRwGyrVBLoZ6AYaj8hWWpDOq5T4k
	 L7Nl+VuLUcVyZwzJM72SAEe21ChYmRNrohFr6Y6aI8dqJy1rKz5ov741Pc3FfoaYYG
	 uDQNkzU5+6YNj44WZ1gMnfk1qvDWgvSEttiJLVjiYY7XwAiWdLLnMmdgJySH6dN8bV
	 8sGtTc5lal9hMaCLhFW2UecPogehzNUqFDDMSPtk+U+uKhsaYacSIek3UyQf3LBSKb
	 pt9UHOPABqMjQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v6=2002/11]=20docs/designs:=20Add=20a=20design=20document=20for=20PV-IOMMU?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739973680122
Message-Id: <a870af77-cf61-488f-8ad4-4313dbd5ba91@vates.tech>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <cover.1739785339.git.teddy.astie@vates.tech> <ddffc703f6919e8d8004cd58a682682e1e86ec80.1739785339.git.teddy.astie@vates.tech> <67d00fac-5d10-49a9-bd15-035c6bb3db12@cloud.com>
In-Reply-To: <67d00fac-5d10-49a9-bd15-035c6bb3db12@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6433945120d447b1bc1cfa3182a95913?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250219:md
Date: Wed, 19 Feb 2025 14:01:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Frediano,

Ok for typos fixes

Le 19/02/2025 =C3=A0 13:02, Frediano Ziglio a =C3=A9crit=C2=A0:
> On 17/02/2025 10:18, Teddy Astie wrote:
>> +Each IOMMU context within a Xen domain is identified using a domain- 
>> specific
>> +context number that is used in the Xen IOMMU subsystem and the hypercal=
l
>> +interface.
>> +
>> +The number of IOMMU context a domain is specified by either the 
>> toolstack or
>> +the domain itself.
> 
> I don't understand what you want express with the above sentence.
> Maybe it's just me.
> 
>> +
>> +# IOMMU operations
>> +
>> +## Initialize PV-IOMMU
>> +
>> +Initialize PV-IOMMU for the domain.
>> +It can only be called once.
>> +
> 
> Could this operation be done automatically on first context allocation ?
> 

For initializing PV-IOMMU, you need to pass some additional parameters 
(memory/context limits). To avoid a guest from initializing with 
arbitrary limits, it can also be done by the toolstack (e.g domain 
builder) to enforce some specific limitations as this initialization can 
only be done once.

>> +## Alloc context
>> +
>> +Create a new IOMMU context for the guest and return the context 
>> number to the
>> +guest.
>> +Fail if the IOMMU context limit of the guest is reached.
>> +
>> +A flag can be specified to create a identity mapping.
>> +
>> +## Free context
>> +
>> +Destroy a IOMMU context created previously.
>> +It is not possible to free the default context.
>> +
>> +Reattach context devices to default context if specified by the guest.
>> +
>> +Fail if there is a device in the context and reattach-to-default flag 
>> is not
>> +specified.
>> +
>> +## Reattach device
>> +
>> +Reattach a device to another IOMMU context (including the default one).
>> +The target IOMMU context number must be valid and the context allocated=
.
>> +
>> +The guest needs to specify a PCI SBDF of a device he has access to.
>> +
>> +## Map/unmap page
>> +
>> +Map/unmap a page on a context.
>> +The guest needs to specify a gfn and target dfn to map.
>> +
>> +Refuse to create the mapping if one already exist for the same dfn.
>> +
>> +## Lookup page
>> +
>> +Get the gfn mapped by a specific dfn.
>> +
>> +## Remote command
>> +
>> +Make a PV-IOMMU operation on behalf of another domain.
>> +Especially useful for implementing IOMMU emulation (e.g using QEMU)
>> +or initializing PV-IOMMU with enforced limits.
>> +
>> +# Implementation considerations
>> +
>> +## Hypercall batching
>> +
>> +In order to prevent unneeded hypercalls and IOMMU flushing, it is 
>> advisable to
>> +be able to batch some critical IOMMU operations (e.g map/unmap 
>> multiple pages).
>> +
> 
> I suppose that batching also implies preemption.
> 

Yes, the current implementation does it, but I haven't updated to doc on 
that aspect.

>> +## Hardware without IOMMU support
>> +
>> +Operating system needs to be aware on PV-IOMMU capability, and 
>> whether it is
>> +able to make contexts. However, some operating system may critically 
>> fail in
>> +case they are able to make a new IOMMU context. Which is supposed to 
>> happen
>> +if no IOMMU hardware is available.
>> +
>> +The hypercall interface needs a interface to advertise the ability to 
>> create
>> +and manage IOMMU contexts including the amount of context the guest 
>> is able
>> +to use. Using these informations, the Dom0 may decide whether to use 
>> or not
>> +the PV-IOMMU interface.
>> +
>> +## Page pool for contexts
>> +
>> +In order to prevent unexpected starving on the hypervisor memory with a
>> +buggy Dom0. We can preallocate the pages the contexts will use and make
>> +map/unmap use these pages instead of allocating them dynamically.
>> +
> 
> Regards,
>  =C2=A0 Frediano
> 

Thanks
Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


