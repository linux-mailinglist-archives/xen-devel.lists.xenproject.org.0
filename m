Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBCB806C16
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 11:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649072.1013376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApFk-00070y-Vl; Wed, 06 Dec 2023 10:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649072.1013376; Wed, 06 Dec 2023 10:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApFk-0006zK-T5; Wed, 06 Dec 2023 10:35:40 +0000
Received: by outflank-mailman (input) for mailman id 649072;
 Wed, 06 Dec 2023 10:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mE+U=HR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rApFj-0006zE-FW
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 10:35:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25d0e15b-9423-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 11:35:17 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 06CFA4EE0739;
 Wed,  6 Dec 2023 11:35:17 +0100 (CET)
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
X-Inumbo-ID: 25d0e15b-9423-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Wed, 06 Dec 2023 11:35:17 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for MISRA
 C Rule 8.4
In-Reply-To: <alpine.DEB.2.22.394.2312041517310.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
 <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
 <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop>
 <5dae5d3e-81f3-4e78-a92f-fd1cc7eb2ea4@suse.com>
 <c7a45a0b0849cd319fb65cbd31f9f9d5@bugseng.com>
 <alpine.DEB.2.22.394.2312041517310.110490@ubuntu-linux-20-04-desktop>
Message-ID: <138593a577a339fd59ef175f097bcb7f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-05 00:18, Stefano Stabellini wrote:
> On Mon, 4 Dec 2023, Nicola Vetrini wrote:
>> On 2023-12-04 08:44, Jan Beulich wrote:
>> > On 02.12.2023 04:03, Stefano Stabellini wrote:
>> > > On Fri, 1 Dec 2023, Jan Beulich wrote:
>> > > > On 01.12.2023 03:47, Stefano Stabellini wrote:
>> > > > > On Wed, 29 Nov 2023, Nicola Vetrini wrote:
>> > > > > > No functional change.
>> > > > > >
>> > > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> > > > > > ---
>> > > > > > The preferred way to deviate is to use asmlinkage, but this
>> > > > > > modification is only
>> > > > > > the consequence of NUMA on ARM (and possibly PPC) being a work in
>> > > > > > progress.
>> > > > > > As stated in the comment above the textual deviation,
>> > > > > > first_valid_mfn will
>> > > > > > likely then become static and there would be no need for the comment
>> > > > > > anymore.
>> > > > > > This works towards having the analysis for this rule clean (i.e. no
>> > > > > > violations);
>> > > > > > the interest in having a clean rule is that then it could be used to
>> > > > > > signal
>> > > > > > newly introduced violations by making the analysis job fail.
>> > > > >
>> > > > > Please add this text as part of the commit message. It can be done on
>> > > > > commit.
>> > > >
>> > > > I assume you saw my reply on another of the patches in this series as to
>> > > > asmlinkage use on variables? IOW I think this paragraph would also need
>> > > > adjustment to account for that.
>> > >
>> > > I was going to ask you about that: reading your reply
>> > > https://marc.info/?l=xen-devel&m=170142048615336 it is not clear to me
>> > > what you are asking or suggesting as next step in regard to asmlinkage
>> > > use on variables.
>> >
>> > Either we need a separate attribute, or we need affirmation that calling
>> > convention attributes are ignored (and going to be going forward) for
>> > variables, or we need to resort to SAF-* comments. I'm not sure what's
>> > best (assuming the "affirm" wouldn't really be possible).
>> >
>> 
>> Well, gcc does warn on unsupported attributes for the entity which are 
>> being
>> dropped. This appears to be the case for calling convention 
>> attributes, as
>> they are not listed in their documentation for variable attributes, 
>> but some
>> more digging would be required to determine whether that's always the 
>> case.
> 
> Given that I don't suppose we have many variables that need deviating
> (probably only 2-3 overall?) I think it is just easier to add a SAF
> comment.

I agree, but then given what Julien wrote in the thread, I'll see what I 
can do to avoid creating a new SAF entry.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

