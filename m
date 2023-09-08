Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94667798488
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 11:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597879.932282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXNl-00056p-Vf; Fri, 08 Sep 2023 09:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597879.932282; Fri, 08 Sep 2023 09:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeXNl-00053r-So; Fri, 08 Sep 2023 09:02:29 +0000
Received: by outflank-mailman (input) for mailman id 597879;
 Fri, 08 Sep 2023 09:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lCyG=EY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qeXNk-00053l-H5
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 09:02:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e76499a-4e26-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 11:02:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 035464EE0738;
 Fri,  8 Sep 2023 11:02:26 +0200 (CEST)
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
X-Inumbo-ID: 6e76499a-4e26-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Fri, 08 Sep 2023 11:02:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, Stefano Stabellini
 <stefano.stabellini@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add 14.3
In-Reply-To: <alpine.DEB.2.22.394.2309071441400.6458@ubuntu-linux-20-04-desktop>
References: <20230907012203.1238090-1-sstabellini@kernel.org>
 <36b888b2-e7e3-bf70-f599-d22ca34e2dfe@suse.com>
 <alpine.DEB.2.22.394.2309071441400.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <fd3a487fc4a24a16262bd510c6cd835d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2023 23:45, Stefano Stabellini wrote:
> On Thu, 7 Sep 2023, Jan Beulich wrote:
>> On 07.09.2023 03:22, Stefano Stabellini wrote:
>> > @@ -385,6 +386,17 @@ maintainers if you want to suggest a change.
>> >       - A loop counter shall not have essentially floating type
>> >       -
>> >
>> > +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
>> > +     - Required
>> > +     - Controlling expressions shall not be invariant
>> > +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
>> > +       checks, and other constructs that are detected as errors by MISRA
>> > +       C scanners, managing the configuration of a MISRA C scanner for
>> > +       this rule would be unmanageable. Thus, this rule is adopted with
>> > +       a project-wide deviation on if ?: and switch statements.
>> 
>> Do we want to go as far as permitting this uniformly for all switch()? 
>> In
>> my earlier reply I had included sizeof() for a reason.
> 
> I agree with you that it would be better to restrict it to only some
> switch uses, rather than all of them.
> 
> But if we are going to restrict the deviation to switch(sizeof()), 
> which
> I think is a good idea and I am in favor, wouldn't it be better to
> handle these cases as individual deviations? E.g. docs/misra/safe.json?
> I am assuming there are only few cases like that and adding it here
> makes the rule more complicated.
> 
> I am happy either way but I wanted to provide that as an option.
> 
> 

It's also worth considering the magnitude of required SAF comments when 
making this choice.
In this case, from a cursory glance at the present violations, it seems 
that there are maybe a
handful of switches inside macros, so they shouldn't be problematic to 
deal with.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

