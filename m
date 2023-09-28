Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E977B21FB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 18:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609974.949167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qltdc-0002C4-47; Thu, 28 Sep 2023 16:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609974.949167; Thu, 28 Sep 2023 16:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qltdc-00029p-0O; Thu, 28 Sep 2023 16:13:16 +0000
Received: by outflank-mailman (input) for mailman id 609974;
 Thu, 28 Sep 2023 16:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRrN=FM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qltda-00028O-TR
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 16:13:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebd9fd22-5e19-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 18:13:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7B4994EE0739;
 Thu, 28 Sep 2023 18:13:11 +0200 (CEST)
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
X-Inumbo-ID: ebd9fd22-5e19-11ee-878a-cb3800f73035
MIME-Version: 1.0
Date: Thu, 28 Sep 2023 18:13:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v2 1/3] docs/misra: add documentation skeleton for
 MISRA C:2012 Dir 4.1
In-Reply-To: <alpine.DEB.2.22.394.2309271750130.1996340@ubuntu-linux-20-04-desktop>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
 <5bb4dea2f48d0ef9a48a06c1b11c0dfcbd991aaf.1695801813.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309271750130.1996340@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <3bf90dc627f6cd68dcd535461cbbdf32@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2023 02:55, Stefano Stabellini wrote:
> On Wed, 27 Sep 2023, Nicola Vetrini wrote:
>> The aforementioned directive requires the project to supply 
>> documentation
>> on the measures taken towards the minimization of run-time failures.

>> +
>> +Documentation for MISRA C:2012 Dir 4.1: mistyped access to function
>> +___________________________________________________________________
>> +
>> +The code never uses function pointers.
> 
> You missed my previous comment on this one
> 

You're right.
This is about the usage of a function having a certain signature as 
having another.
It could happen for instance:
- with incongruent declarations
- no prototypes
- casts on function pointers
Most of these can be caught by complying with other rules, but I'm not 
sure if they
fully cover every case, and besides there are still violations on the 
rules tied to this.
I guess we can say that this is a WIP.

>> +
>> +Documentation for MISRA C:2012 Dir 4.1: invariant violation
>> +___________________________________________________________
>> +
>> +To be written.
> 
> Also this one escaped.
> 
> Overall, this is much better!
> 

I replied on v1, but maybe I missed some further reply:
It's the violation of a project invariant (e.g., an assert or 
BUILD_BUG).
Something along the lines of this could fit in the documentation:
"The extensive checks in the code ensure that any violation of a
compile-time invariant will be detected in prior to release builds, and 
failure
of run-time invariant is also extensively tested."

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

