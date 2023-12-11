Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A780CEAF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652270.1018024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChdm-0006ur-II; Mon, 11 Dec 2023 14:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652270.1018024; Mon, 11 Dec 2023 14:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChdm-0006s8-E5; Mon, 11 Dec 2023 14:52:14 +0000
Received: by outflank-mailman (input) for mailman id 652270;
 Mon, 11 Dec 2023 14:52:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtsV=HW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rChdk-0006rd-OD
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:52:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd7eb910-9834-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 15:52:11 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7A9CA4EE073E;
 Mon, 11 Dec 2023 15:52:11 +0100 (CET)
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
X-Inumbo-ID: dd7eb910-9834-11ee-98e8-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 11 Dec 2023 15:52:11 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 3/7] xen/arm: address MISRA C:2012 Rule 2.1
In-Reply-To: <731ed3e1-bbf5-4309-90ec-e9f8e7be6620@xen.org>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <4c0d38f2b707afa9aed1853a99d286fa2424fb9d.1702283415.git.nicola.vetrini@bugseng.com>
 <e86f46bd-b404-4feb-82f5-90c52837e169@xen.org>
 <0f554dea-60fe-409a-935d-87f3eac30a87@amd.com>
 <731ed3e1-bbf5-4309-90ec-e9f8e7be6620@xen.org>
Message-ID: <cf641b4a6bc31b802d6c1fe92e184a75@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-11 15:14, Julien Grall wrote:
> On 11/12/2023 13:06, Michal Orzel wrote:
>> 
>> 
>> On 11/12/2023 13:29, Julien Grall wrote:
>>> 
>>> 
>>> Hi,
>>> 
>>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>>> The "return 1;" statements at the end of some cases in the switch
>>>> of function 'vgic_v3_its_mmio_write' in 'vcig-v3-its.c' cause the
>>>> unreachability of the "return 1;" statement after the switch, thus
>>>> violating MISRA C:2012 Rule 2.1:
>>>> "A project shall not contain unreachable code".
>>>> 
>>>> The same is true for the switch in 'arch_memory_op' from
>>>> 'xen/arch/arm/mm.c'.
>>> 
>>> For both cases, I actually much prefer the "return" version in the
>>> cases. In particular for the vGIC emulation the switch is quite large
>>> and it would not be trivial to know what happens after the break.
>> Because of this...
>> 
>>> 
>>> IOW, I would much prefer if we remove the "return ..." outside of the
>>> switch.
>> wouldn't it be better to add ASSERT_UNREACHABLE() before this return 
>> instead of removing it?
>> This is what we have in e.g. vpl011 and it prevents mistakes.
> 
> I am ok with that. But I am not sure if this would make ECLAIR unhappy.
> 
> Cheers,

Should be okay. I'll test and report back

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

