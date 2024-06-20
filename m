Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98848910D4E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 18:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744847.1151972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKKpb-0002Gj-Py; Thu, 20 Jun 2024 16:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744847.1151972; Thu, 20 Jun 2024 16:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKKpb-0002Dz-N0; Thu, 20 Jun 2024 16:40:15 +0000
Received: by outflank-mailman (input) for mailman id 744847;
 Thu, 20 Jun 2024 16:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rnTP=NW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sKKpZ-0002Dt-NH
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 16:40:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c35c52c2-2f23-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 18:40:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8ABCA4EE0738;
 Thu, 20 Jun 2024 18:40:11 +0200 (CEST)
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
X-Inumbo-ID: c35c52c2-2f23-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Thu, 20 Jun 2024 18:40:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Simone Ballarin
 <simone.ballarin@bugseng.com>, Andrew Cooper3 <andrew.cooper3@citrix.com>,
 Roger Pau <roger.pau@citrix.com>, Consulting <consulting@bugseng.com>, Xen
 Devel <xen-devel@lists.xenproject.org>
Subject: Re: MISRA C Rule 5.3 violation - shadowing in mctelem.c
In-Reply-To: <f14f15ad-7d16-4bec-9edc-82956ccc7bb4@suse.com>
References: <f351f904fab43f88396b3ae1b5d64e95@bugseng.com>
 <f14f15ad-7d16-4bec-9edc-82956ccc7bb4@suse.com>
Message-ID: <93cfbed5db97faf7953a9a79461b669a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-19 15:42, Jan Beulich wrote:
> On 19.06.2024 15:23, Nicola Vetrini wrote:
>> I was looking at the shadowing due to the struct identifier and the
>> local variables "mctctl" in x86/cpu/mcheck/mctelem.c (see [1], the
>> second report). This kind of shadowing seems very intentional, and the
>> initial naive approach I devised was to simply rename the local
>> variables.
>> This, however, results in build breakages, as sometimes the shadowed
>> name seems to be used for accessing the global struct (unless I'm
>> missing something), and as a result changing the name of the locals is
>> not possible, at least not without further modifications to this file,
>> which aren't obvious to me.
>> 
>> It would be really helpful if you could point me to either:
>> - avoid the shadowing in some way that does not occur to me at the
>> moment;
> 
> Could you please be more specific about the issues you encountered? I
> hope you don't expect everyone reading this request of yours to (try 
> to)
> redo what you did. The only thing I could vaguely guess is that maybe
> you went a little too far with the renaming. Plus, just from looking at
> the grep output, did you try to simply move down the file scope 
> variable?
> It looks like all shadowing instances are ahead of any uses of the
> variable (but I may easily be overlooking an important line 
> contradicting
> that pattern).
> 

I think I found a way to refactor it without breaking the build, though 
I'm not sure whether it preserves the semantics of the code. I will send 
an RFC patch. Sorry for the noise.

>> - deviate this file, as many similar files in x86/cpu are already
>> deviated.
> 
> I question the presence of these in those files. They were apparently 
> all
> added when the files were introduced, and said commit - from Simone, 
> acked
> by Stefano - came with no justification at all.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

