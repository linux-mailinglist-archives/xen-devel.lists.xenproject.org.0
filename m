Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9567F599E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639399.996734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64V1-00039B-UD; Thu, 23 Nov 2023 07:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639399.996734; Thu, 23 Nov 2023 07:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64V1-00037M-RW; Thu, 23 Nov 2023 07:51:47 +0000
Received: by outflank-mailman (input) for mailman id 639399;
 Thu, 23 Nov 2023 07:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64V0-00037G-Pj
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:51:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25922e1a-89d5-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 08:51:44 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 70AE24EE073C;
 Thu, 23 Nov 2023 08:51:44 +0100 (CET)
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
X-Inumbo-ID: 25922e1a-89d5-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 23 Nov 2023 08:51:44 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>
Subject: Re: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
In-Reply-To: <2c7d33e8-9605-4ff6-ac23-fda43ae69199@citrix.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
 <20231122142733.1818331-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2311221410400.2053963@ubuntu-linux-20-04-desktop>
 <2c7d33e8-9605-4ff6-ac23-fda43ae69199@citrix.com>
Message-ID: <44ee703814a611c6e0baa3ed55d09092@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-22 23:20, Andrew Cooper wrote:
> On 22/11/2023 10:13 pm, Stefano Stabellini wrote:
>> On Wed, 22 Nov 2023, Andrew Cooper wrote:
>>> The differences between inline, __inline and __inline__ keywords are 
>>> a
>>> vestigial remnant of older C standards, and in Xen we use inline 
>>> almost
>>> exclusively.
>>> 
>>> Replace __inline and __inline__ with regular inline, and remove their
>>> exceptions from the MISRA configuration.
>>> 
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> 
>>> diff --git a/docs/misra/C-language-toolchain.rst 
>>> b/docs/misra/C-language-toolchain.rst
>>> index 2866cb191b1a..b7c2000992ac 100644
>>> --- a/docs/misra/C-language-toolchain.rst
>>> +++ b/docs/misra/C-language-toolchain.rst
>>> @@ -84,7 +84,7 @@ The table columns are as follows:
>>>            see Sections "6.48 Alternate Keywords" and "6.47 How to 
>>> Use Inline Assembly Language in C Code" of GCC_MANUAL.
>>>         __volatile__:
>>>            see Sections "6.48 Alternate Keywords" and "6.47.2.1 
>>> Volatile" of GCC_MANUAL.
>>> -       __const__, __inline__, __inline:
>>> +       __const__:
>>>            see Section "6.48 Alternate Keywords" of GCC_MANUAL.
>>>         typeof, __typeof__:
>>>            see Section "6.7 Referring to a Type with typeof" of 
>>> GCC_MANUAL.
>> Asking the Bugseng guys as well, do we need to add to
>> C-language-toolchain.rst:
>> inline __attribute__((__always_inline__))
>> inline __attribute__((__gnu_inline__))
> 
> __attribute__ itself is in the list of permitted non-standard tokens, 
> in
> both files.
> 
> However, neither file has anything concerning the parameter(s) to the
> __attribute__, and we do use an awful lot of them.
> 
> If they want discussing, then that's going to be a lot of work.
> 

Just __attribute__ is fine, since we point to
Section "6.39 Attribute Syntax" of GCC_MANUAL.
which describes the syntax for the token and gives pointers to other 
relevant sections of the manual.

>> Given that the problem was also present before this patch:
>> 
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

