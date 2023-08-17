Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E577F0C5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 08:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585157.916182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWvv-0008AJ-Tt; Thu, 17 Aug 2023 06:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585157.916182; Thu, 17 Aug 2023 06:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWWvv-00087u-R7; Thu, 17 Aug 2023 06:56:39 +0000
Received: by outflank-mailman (input) for mailman id 585157;
 Thu, 17 Aug 2023 06:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0n1I=EC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWWvt-00087o-Mj
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 06:56:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34514e87-3ccb-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 08:56:35 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 98E414EE0737;
 Thu, 17 Aug 2023 08:56:34 +0200 (CEST)
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
X-Inumbo-ID: 34514e87-3ccb-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Thu, 17 Aug 2023 08:56:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
 <michal.orzel@amd.com>, xenia.ragiadakou@amd.com, Ayan Kumar Halder
 <ayankuma@amd.com>, consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com, Julien
 Grall <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: Placing of the documentation for MISRA C:2012 Directive 4.1
In-Reply-To: <alpine.DEB.2.22.394.2308161232300.6458@ubuntu-linux-20-04-desktop>
References: <95a86d69e97eb127a26f65cceb87e3bf@bugseng.com>
 <alpine.DEB.2.22.394.2308161232300.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6b10919e702eb0a6b63b831e16e31127@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/2023 21:41, Stefano Stabellini wrote:
> On Wed, 16 Aug 2023, Nicola Vetrini wrote:
>> Hi,
>> 
>> it has been agreed during past MISRA meetings that Directive 4.1
>> ("Run-time failures shall be minimized") shall be dealt with by 
>> documenting
>> how in Xen such runtime failures are prevented, so by preparing a 
>> document
>> analogous to
>> docs/misra/C-language-toolchain.rst.
>> 
>> A common way to deal with this in ECLAIR is to create an header file
>> and include it in at least one file that is part of the analyzed 
>> build, so
>> that the
>> checker can see it.
> 
> I am not following: why does ECLAIR need to see the documentation of 
> how
> we minimize runtimes failures in Xen?
> 

This is needed so that it can check that the document(s) supplied has 
the expected format.
For instance, the default configuration will check headings such as the 
ones in the document
linked in my original message:
"Documentation for MISRA C:2012 Dir 4.1: overflow"

and e.g. complain if an expected heading is not present (which one are 
expected and
their format is of course configurable).

> 
>> One obvious candidate for this is having a .h file inside docs/misra 
>> that is
>> included
>> either by a dummy .c file inside the same directory (and then build 
>> the docs
>> in the analyzed
>> configuration) or somewhere else (I came up with no
>> good places where to include it).
>> It could also be a standalone .c file somewhere else, but I don't 
>> think this
>> would be the preferred way.
> 
> ECLAIR aside, I think the primary use of this document is to be read by
> people: community members and assessors. So I think it would be best to
> write it in a human-readable format and convert it to a .h file if 
> that's
> required for ECLAIR.
> 
> For instance, we could write it as RST file under docs/misra (RST is 
> our
> preferred file format for documents as it can be easily converted to
> HTML and PDF), and then convert it into a .h file as part of the Xen
> build system ("make xen" takes the RST file, adds #ifndef and #endif
> arounds it, and creates a .h header out of it.)
> 
> If it is too difficult to convert RST to .h, then also a very basic 
> text
> document would suffice.

That's a good suggestion. The RST source can be put inside a comment, so 
there's
almost no restriction on what it contains.

> 
> 
>> You can see a possible draft of the structure of this file here [1], 
>> but
>> providing the content
>> here would require a substantial amount of collaboration with people 
>> having a
>> broader
>> knowledge about Xen and its practices to prevent the runtime errors 
>> delineated
>> here, so
>> a possibility is making an RFC patch to gather some inputs to fill the
>> sections appropriately.
> 
> That makes sense
> 
> 
>> As a side note, the directive should be added to docs/misra/rules.rst. 
>> It can
>> be part of
>> the patch addressing the violations, tough.
>> 
>> [1] 
>> https://github.com/BUGSENG/eclair_demo/blob/main/ECLAIR/MISRA_C_2012_doc.h

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

