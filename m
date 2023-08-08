Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E9773936
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579480.907465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIcu-0005i5-FY; Tue, 08 Aug 2023 09:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579480.907465; Tue, 08 Aug 2023 09:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIcu-0005fu-CI; Tue, 08 Aug 2023 09:03:40 +0000
Received: by outflank-mailman (input) for mailman id 579480;
 Tue, 08 Aug 2023 09:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTIcs-0005fo-Gd
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:03:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 759aa5e8-35ca-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 11:03:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7A1C64EE0737;
 Tue,  8 Aug 2023 11:03:36 +0200 (CEST)
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
X-Inumbo-ID: 759aa5e8-35ca-11ee-b280-6b7b168915f2
MIME-Version: 1.0
Date: Tue, 08 Aug 2023 11:03:36 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
In-Reply-To: <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
 <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
 <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
 <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b0581f49ac01c923809c0e15c1a1dfed@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2023 08:42, Jan Beulich wrote:
> On 04.08.2023 01:50, Stefano Stabellini wrote:
>> On Thu, 3 Aug 2023, Jan Beulich wrote:
>>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>>> Rule 2.1 states: "A project shall not contain unreachable code".
>>>> 
>>>> The functions
>>>> - machine_halt
>>>> - maybe_reboot
>>>> - machine_restart
>>>> are not supposed to return, hence the following break statement
>>>> is marked as intentionally unreachable with the ASSERT_UNREACHABLE()
>>>> macro to justify the violation of the rule.
>>> 
>>> During the discussion it was mentioned that this won't help with
>>> release builds, where right now ASSERT_UNREACHABLE() expands to
>>> effectively nothing. You want to clarify here how release builds
>>> are to be taken care of, as those are what eventual certification
>>> will be run against.
>> 
>> Something along these lines:
>> 
>> ASSERT_UNREACHABLE(), not only is used in non-release builds to 
>> actually
>> assert and detect errors, but it is also used as a marker to tag
>> unreachable code. In release builds ASSERT_UNREACHABLE() doesn't 
>> resolve
>> into an assert, but retains its role of a code marker.
>> 
>> Does it work?
> 
> Well, it states what is happening, but I'm not convinced it satisfies
> rule 2.1. There's then still code there which isn't reachable, and
> which a scanner will spot and report.
> 
> Jan

It's not clear to me whether you dislike the patch itself or the commit
message. If it's the latter, how about:
"ASSERT_UNREACHABLE() is used as a marker for intentionally unreachable 
code, which
constitutes a motivated deviation from Rule 2.1. Additionally, in 
non-release
builds, this macro performs a failing assertion to detect errors."

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

