Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F577C4C41
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 09:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615244.956541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqTwI-0008BQ-WB; Wed, 11 Oct 2023 07:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615244.956541; Wed, 11 Oct 2023 07:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqTwI-00088f-TM; Wed, 11 Oct 2023 07:47:30 +0000
Received: by outflank-mailman (input) for mailman id 615244;
 Wed, 11 Oct 2023 07:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqTwH-00088G-OL
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 07:47:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d38a07b-680a-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 09:47:28 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4D5204EE0743;
 Wed, 11 Oct 2023 09:47:28 +0200 (CEST)
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
X-Inumbo-ID: 6d38a07b-680a-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 09:47:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: MISRA C:2012 D4.11 caution on staging
In-Reply-To: <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/2023 02:15, Andrew Cooper wrote:
> On 10/10/2023 5:31 pm, Nicola Vetrini wrote:
>> Hi,
>> 
>> as you can see from [1], there's a MISRA C guideline, D4.11, that is
>> supposed to be clean
>> (i.e., have no reports), but has a caution on an argument to memcpy
>> (the second argument might be null according to the checker, given a
>> set of assumptions on
>> the control flow). To access the report just click on the second link
>> in the log, which should take you to a webpage with a list of
>> MISRA guidelines. Click on D4.11 and you'll see the full report, which
>> I pasted below for convenience.
>> 
>> If the finding is genuine, then some countermeasure needs to be taken
>> against this
>> possible bug, otherwise it needs to be motivated why the field
>> config->handle can't
>> be null at that point.
>> The finding is likely the result of an improvement made to the
>> checker, because the first
>> analysis I can see that spots it happened when rc1 has been tagged,
>> but that commit does not
>> touch the involved files.
>> 
>> [1] https://gitlab.com/xen-project/xen/-/jobs/5251222578
> 
> That's a false positive, but I'm not entirely surprised that the 
> checker
> struggled to see it.
> 
> First,
> 
> ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
> 
> All system domains (domid >= 0x7ff0, inc IDLE) pass a NULL config.  All
> other domains pass a real config.
> 
> Next,
> 
> /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. 
> */
> if ( is_system_domain(d) && !is_idle_domain(d) )
>     return d;
> 
> So at this point we only have the IDLE domain and real domains.
> 
> And finally, the complained-about construct is inside an:
> 
> if ( !is_idle_domain(d) )
>     ...
> 
> hence config cannot be NULL, but only because of the way in which
> is_{system,idle}_domain() interact.
> 
> ~Andrew

Ok. I think this should be documented as a false positive using the 
comment deviation mechanism
in the false-positive-eclair.json file (once a name for the prefix is 
settled on in the
other thread).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

