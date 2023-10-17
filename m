Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947107CBE39
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 10:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618145.961440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfqR-0007lR-OW; Tue, 17 Oct 2023 08:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618145.961440; Tue, 17 Oct 2023 08:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfqR-0007j9-Lh; Tue, 17 Oct 2023 08:54:31 +0000
Received: by outflank-mailman (input) for mailman id 618145;
 Tue, 17 Oct 2023 08:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHSl=F7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsfqQ-0007j3-Mr
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 08:54:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7b10304-6cca-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 10:54:28 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1CE9A4EE0737;
 Tue, 17 Oct 2023 10:54:28 +0200 (CEST)
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
X-Inumbo-ID: c7b10304-6cca-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 10:54:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2 7/8] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
In-Reply-To: <8c0a4331-4a89-4cb2-02ed-70cad3ad2116@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <f94b0c9411937a4003b86b5850b6d4ad91dff5d5.1697123806.git.nicola.vetrini@bugseng.com>
 <8c0a4331-4a89-4cb2-02ed-70cad3ad2116@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <89bd9f429c4a5e455956ca6be44da754@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 17:49, Jan Beulich wrote:
> On 12.10.2023 17:28, Nicola Vetrini wrote:
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
>> @@ -22,6 +22,14 @@ typedef signed long ssize_t;
>> 
>>  typedef __PTRDIFF_TYPE__ ptrdiff_t;
>> 
>> +/*
>> + * Users of this macro are expected to pass a positive value.
> 
> Is passing 0 going to cause any issues?
> 

I don't think so, even if that wouldn't make much sense. Given that the 
usage of the
zero lenght array extension is documented, that shouldn't be a concern 
either.

>> + * Eventually, this should become an unsigned quantity, but this
>> + * requires fixing various uses of this macro and BITS_PER_LONG in 
>> signed
>> + * contexts, such as type-safe 'min' macro uses, which give rise to 
>> build errors
>> + * when the arguments have differing signedness, due to the build 
>> flags used.
>> + */
> 
> I'm not convinced of the usefulness of this part of the comment.
> 
> Jan
> 

Isn't it useful to record why it was left as-is, and what should be done 
about it?
If it's not, this can be dropped on commit, in my opinion.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

