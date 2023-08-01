Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30AA76B641
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 15:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574230.899495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQplp-0001c9-Jk; Tue, 01 Aug 2023 13:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574230.899495; Tue, 01 Aug 2023 13:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQplp-0001a9-GO; Tue, 01 Aug 2023 13:50:41 +0000
Received: by outflank-mailman (input) for mailman id 574230;
 Tue, 01 Aug 2023 13:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQpln-0001H0-Pf
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 13:50:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bcb690-3072-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 15:50:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 58C894EE0737;
 Tue,  1 Aug 2023 15:50:38 +0200 (CEST)
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
X-Inumbo-ID: 65bcb690-3072-11ee-b25c-6b7b168915f2
MIME-Version: 1.0
Date: Tue, 01 Aug 2023 15:50:38 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_P?=
 =?UTF-8?Q?au_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/cpu-policy: justify a violation of MISRA C:2012
 Rule 1.3
In-Reply-To: <e2d88673-c4dc-1151-182b-07cbd40e924f@suse.com>
References: <9ec42e01258968d2dc71d59c5ad41da448a7112e.1690895099.git.nicola.vetrini@bugseng.com>
 <e2d88673-c4dc-1151-182b-07cbd40e924f@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <3f9c68649fa1e5ca4151a46a110a8b8c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2023 15:40, Jan Beulich wrote:
> On 01.08.2023 15:06, Nicola Vetrini wrote:
>> The empty feature set 'str_7c1' in 'tools/misc/xen-cpuid.c' causes the
>> struct declaration to have no named members, hence violating
>> Rule 1.3:
>> "There shall be no occurrence of undefined or critical unspecified 
>> behaviour"
>> because it is forbidden by ISO/IEC 9899:1999(E), Section 6.7.2.1.7:
>> "If the struct-declaration-list contains no named
>> members, the behavior is undefined."
>> 
>> It has been assessed that the feature set declaration is intentionally 
>> empty,
>> and that no risk of undesired behaviour stems from it, hence the 
>> struct
>> declaration is marked safe.
>> 
>> No functional changes.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> As agreed during the MISRA C group meetings, this violation is dealt
>> with by means of a comment deviation, as future changes may eliminate 
>> the
>> root cause, which is the empty feature set.
>> My justification for the claim and the commit message may need some 
>> adjusting.
> 
> A reference to the compiler extension would be nice; the use of 
> extensions
> (which generally are well-defined, even if not always well-documented)
> should eliminate the UB that the standard specifies.
> 

It sure is a good idea to specify this. Since the use of this compiler 
extension is already
documented in 'docs/misra/C-language-toolchain.rst' I can just add a 
reference to that
in the justification.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

