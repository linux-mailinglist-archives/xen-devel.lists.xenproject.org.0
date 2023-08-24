Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E478686F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 09:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589790.921825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ4sf-0005UB-Bv; Thu, 24 Aug 2023 07:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589790.921825; Thu, 24 Aug 2023 07:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ4sf-0005RS-9L; Thu, 24 Aug 2023 07:35:49 +0000
Received: by outflank-mailman (input) for mailman id 589790;
 Thu, 24 Aug 2023 07:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EWrD=EJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZ4sd-0005RM-TE
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 07:35:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5ec62ad-4250-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 09:35:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 838CD4EE0737;
 Thu, 24 Aug 2023 09:35:44 +0200 (CEST)
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
X-Inumbo-ID: d5ec62ad-4250-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 09:35:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] arm64/vfp: address MISRA C:2012 Dir 4.3
In-Reply-To: <alpine.DEB.2.22.394.2308231327570.6458@ubuntu-linux-20-04-desktop>
References: <998ecebdda92f1704fa35e8692b1f7e37b674d16.1692800477.git.nicola.vetrini@bugseng.com>
 <a0a4a13a-3ada-4586-81cf-86a9e583fc60@xen.org>
 <3b4d895999ad4fc51f280c8f7e854cab@bugseng.com>
 <59fad669-afc2-45e2-b647-8a0878774ba8@xen.org>
 <alpine.DEB.2.22.394.2308231327570.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <cda5d3116f4218a42c26fbe8b2b026c4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/2023 22:30, Stefano Stabellini wrote:
> On Wed, 23 Aug 2023, Julien Grall wrote:
>> Hi Nicola,
>> 
>> On 23/08/2023 17:09, Nicola Vetrini wrote:
>> > On 23/08/2023 16:59, Julien Grall wrote:
>> > > Hi,
>> > >
>> > > On 23/08/2023 15:27, Nicola Vetrini wrote:
>> > > > Directive 4.3 prescribes the following:
>> > > > "Assembly language shall be encapsulated and isolated",
>> > > > on the grounds of improved readability and ease of maintenance.
>> > > > The Directive is violated in this case by asm code in between C code.
>> > > >
>> > > > A macro is the chosen encapsulation mechanism.
>> > >
>> > > I would rather prefer if we use a static inline.
>> >
>> > Just to prevent an possible back and forth on a similar patch:
>> > is it ok to adopt the same approach with the inline asm in
>> > xen/arch/arm/arm64/lib/bitops.c in the definition of the macros
>> > 'bitop' and 'testop'?
>> 
>> So, in the VFP I agree that moving the assembly part outside of 
>> vfp_*_state()
>> makes sense even without MISRA. But I don't agree with moving the 
>> assembly
>> code out as the C function is tightly coupled with the assembly code.
>> 
>> So this would please MISRA but IHMO would make the code more difficult 
>> to
>> understand. So I think we should deviate for the bitops.
>> 
>> Bertrand, Stefano, what do you think?
> 
> I agree. I think bitops.c is already encapsulated and introducing
> additional macros or functions is likely to make the code worse. testop
> and bitop are the encapsulating functions, as you can see there is very
> little else other than the asm volatile and a do/while loop.

Ok, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

