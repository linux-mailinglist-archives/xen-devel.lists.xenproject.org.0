Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCCA32674
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 14:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886450.1296097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiCN2-0006c8-5j; Wed, 12 Feb 2025 13:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886450.1296097; Wed, 12 Feb 2025 13:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiCN2-0006ag-2r; Wed, 12 Feb 2025 13:01:40 +0000
Received: by outflank-mailman (input) for mailman id 886450;
 Wed, 12 Feb 2025 13:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YVo3=VD=bounce.vates.tech=bounce-md_30504962.67ac9bae.v1-13bb57b742854ec2be1d703d0dff5ce6@srs-se1.protection.inumbo.net>)
 id 1tiCN0-0006aY-0k
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 13:01:38 +0000
Received: from mail180-4.suw31.mandrillapp.com
 (mail180-4.suw31.mandrillapp.com [198.2.180.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cd8df16-e941-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 14:01:35 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-4.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4YtJNZ132rzlfq6m
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 13:01:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 13bb57b742854ec2be1d703d0dff5ce6; Wed, 12 Feb 2025 13:01:34 +0000
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
X-Inumbo-ID: 7cd8df16-e941-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739365294; x=1739635294;
	bh=rbr7B/D3HYLY+1GjmivtuL4307pH7nNxAI0LWUhgo5I=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1vWCjVw5SeV/bACUXHR59mdvdW5GARouPU10pI5+RvGLI4Vgw31kqOpMOTCUVzfom
	 dpeyeMHjGaGnCZRph1tJkQzRzKlsj9qysqUF9aSOMoJ80jr9z/vuYg8PlGIZtAVMNx
	 yCqoDBAqO5q19QwkkqOvWDUd0s/d1b2szCWnaF/FQmVvsTKcMt8Ryk0FJn5e4cs03s
	 N4CbLEzb9xGPONn/Iw4KlhhvoDJ6k6iXB0kQ9T6uVJxUBJF2bt+A6hbPoKwWnOD+Zg
	 YodOIyjY5IghiIo9QDUV+lgPGG4TycC2TezMI+eb6YAIHcpE5xqqp6GegxvWMN0P8Y
	 xIgE55az7CMqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739365294; x=1739625794; i=samuel.verschelde@vates.tech;
	bh=rbr7B/D3HYLY+1GjmivtuL4307pH7nNxAI0LWUhgo5I=;
	h=From:Subject:To:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=GntrCc/20Tkhlx5E45L1BZWkqu+b34Qss+cvANUEizGpf2xHFzTp/kglnWYN3DCLb
	 1CR+4tTWDm4FiEpc/lOqR4I6zVA9KDGXZwlnFja+BXuRNx3mfGsDTTrBqJgLsJ7D4p
	 RpeqOOOkhFgbIUeovD+3gIxYZJ8K2qjBRRKsLDf25HG0JOvej6b/3IrNPW9f9RCapQ
	 6eX2uaRANq/uoVWmS+tlT2zf5DsvwYUiVo7db/YaarcZEF4SarP9AOhksWXuKt3128
	 qdkncc2/iCILekfd4f87VBagToVwiMWgD3IBqVh7g1qi6/K0M7yKTlU68u7rQ3kC1J
	 8rFRh3Uls4nQg==
From: "Samuel Verschelde" <samuel.verschelde@vates.tech>
Subject: =?utf-8?Q?Xen=20Winter=20Meetup=202025=20design=20session=20notes:=20Nested=20Virt?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739365293592
To: xen-devel@lists.xenproject.org
Message-Id: <87477722-899c-5e6d-b1f0-b4099546817b@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.13bb57b742854ec2be1d703d0dff5ce6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250212:md
Date: Wed, 12 Feb 2025 13:01:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Description: this session will focus on discussing the current state and 
key challenges of Nested Virtualization in Xen.

---

I'm going to reference this message to the mailing list in the related 
Gitlab epic:
https://gitlab.com/groups/xen-project/-/epics/25

References: George Dunlap's two part talk in the previous Xen Summit:
- https://www.youtube.com/watch?v=8jKGYY1Bi_o
- https://www.youtube.com/watch?v=3MxWvVTmY1s&t=1564s

Andrew Cooper reminded us of the nested virtualization challenges,

What is needed to make nested virt work again?

Andrew:
Xen does have some nested virt implementation
from 2009/2010, bitrotting since then and weren't production quality 
since day one.
Intel took care to virtualize everything relevant => confusing aspects 
that are not documented enough
AMD took a more simpler route, but things don't quite work right.
VMX/SVM are different pieces of work.
Interrupt shadows : disabling interrupt is different for VMX/SVM
Important to reduce the scope of the problem.
Both Intel and AMD dropped support for 32bits virtualization.
Bunch of features can be dropped for limiting the scope
Still need to trap them but can say not implemented.
Depend on the L2 guests: Windows with VBS is expecting different features
Missing non-nested features for VBS that need to be implemented first 
before nested one.

VM configuration is hard to change during run time because the 
configuration set was static
Xen has a model where it expects one model set of what it expect a guest 
to run.

First task: Change implementation of Xen to have one configuration per 
VM of the configuration instead of a global
Meaning having different configuration to other VM.

HW only has root and non-root mode (strictly x86)

Nested virt need to implement L2 guest in non-root mode of L0
Xen usually has one VMCS/VMCB per vCPU
L1 HV will have one VMCS/VMCB per L2 vCPU

VMCS are a bunch of configuration, some exposed to guests others to 
control guests behavior.
VMCS for L2 guests are merged from Xen, from L1 info called VMCS02.
Drop host state from the L1 guests and use Xen host state.
Features can be mutually exclusive.

L2 guest will trap to Xen (L0) and Xen then needs to know if the VMEXIT 
is for it, L1 or both.
Virtual VM entry, need to merge VMCS from exit and merge info about host 
part of L1.
If it is correctly implemented, it can scale infinitely. L>3 guests.

Alain Tchana: VMCS shadowing, is it needed?
Andrew: It's complicated, it's a giant security hole since you can audit 
guest state

VMCS (Intel) opaque memory needed a special instruction to READ/WRITE
VMCB (AMD) a page of memory you can write/read to directly
Easier for AMD to copy in/out large amount of memory.

Yann: What is the current state in Xen implementation?
Andrew: There is some, with known security issues and unknown ones.

Marek: If you run KVM in a Xen guests, you have an instant crash.

Yann: What are the plans to fix it?
Andrew: The L1 VMCS configuration can be completely different from the 
one Xen will use, and need to modify this so Xen can have multiple 
guests configuration.

See paper called Turtle for nested virtualization with VMCS merging.

Need to store VMCS/VMCB state somewhere (easy with VMCB since it's just 
a mapped page)

A bit of work from Andrew and Roger is needed before it can worked on by 
multiple people in parallel.

Next course of action:

- Wait for Andrew and Roger to fix MSR configuration from the toolstack. 
They're halfway through. According to them, that's sadly not a task we 
can really parallelize.
- When it is ready more people can then participate by implementing 
missing features one by one (with unit tests) (There will be a suggested 
order of things that need to be implemented) Can't predict when features 
will intersect with existing bugs.


A big thanks to Damien Thenot and Benjamin Reis for all the note taking, 
and of course to Andrew Cooper for most of the explaining.


Samuel Verschelde | Vates XCP-ng Lead Maintainer / Release Manager / Technical Product Manager

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

