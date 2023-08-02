Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D610676CA3F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 12:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574853.900475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8fo-0005l2-3p; Wed, 02 Aug 2023 10:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574853.900475; Wed, 02 Aug 2023 10:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8fo-0005i1-11; Wed, 02 Aug 2023 10:01:44 +0000
Received: by outflank-mailman (input) for mailman id 574853;
 Wed, 02 Aug 2023 10:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qR8fm-0005hv-So
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 10:01:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f766f4-311b-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 12:01:41 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C81584EE0737;
 Wed,  2 Aug 2023 12:01:40 +0200 (CEST)
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
X-Inumbo-ID: 93f766f4-311b-11ee-b25f-6b7b168915f2
MIME-Version: 1.0
Date: Wed, 02 Aug 2023 12:01:40 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_P?=
 =?UTF-8?Q?au_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] x86/cpu-policy: justify a violation of MISRA
 C:2012 Rule 1.3
In-Reply-To: <5ff38731-fed7-91eb-c933-28d191fb429b@suse.com>
References: <30fdada8b08b2060c6f1ccc2ecb06d418efd97b0.1690966632.git.nicola.vetrini@bugseng.com>
 <5ff38731-fed7-91eb-c933-28d191fb429b@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <796058860d0536799e40fc14f169efd2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2023 11:47, Jan Beulich wrote:
> On 02.08.2023 10:57, Nicola Vetrini wrote:
>> The empty feature set 'str_7c1' in 'tools/misc/xen-cpuid.c' causes the
>> struct declaration to have no named members, hence violating
>> Rule 1.3:
>> "There shall be no occurrence of undefined or critical unspecified 
>> behaviour"
>> because it is forbidden by ISO/IEC 9899:1999(E), Section 6.7.2.1.7:
>> "If the struct-declaration-list contains no named
>> members, the behavior is undefined."
>> 
>> Given that Xen is using an undocumented GCC extension that specifies 
>> the
>> behaviour upon defining a struct with no named member, this construct 
>> is
>> well-defined and thus it is marked as safe.
> 
> Especially after realizing that I was wrong here (I was under the wrong
> impression that we'd generate a struct without members, when it's one
> without named members, yet [to me at least] only the former is a known
> gcc extension we use), I've sent an alternative proposal. Let's see
> whether in particular Andrew considers this acceptable.
> 

Well, I don't know the exact discussion on this in that MISRA meeting 
(25/07 iirc),
but the outcome I'm aware of was to deviate that construct because there 
are possibly
others like that in other configurations/future patches. Anyway, this 
usage does not
fall under gcc's documented extensions (either the one you mentioned or 
the one about
unnamed fields, 6.63), but it does allow it (has a warning only on 
-pedantic afaict),
hence why I put undocumented here.

In the meantime, I can test your patch to see if it has no unintended 
impact on other code
w.r.t. Rule 1.3.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

