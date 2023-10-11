Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68BA7C4BFA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 09:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615239.956532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqTjG-0005u6-RD; Wed, 11 Oct 2023 07:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615239.956532; Wed, 11 Oct 2023 07:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqTjG-0005rG-O6; Wed, 11 Oct 2023 07:34:02 +0000
Received: by outflank-mailman (input) for mailman id 615239;
 Wed, 11 Oct 2023 07:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJaT=FZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqTjE-0005qq-QQ
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 07:34:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a2aca85-6808-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 09:33:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CCCC54EE0743;
 Wed, 11 Oct 2023 09:33:57 +0200 (CEST)
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
X-Inumbo-ID: 8a2aca85-6808-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 11 Oct 2023 09:33:57 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 consulting@bugseng.com, roger.pau@citrix.com, dfaggioli@suse.com
Subject: Re: Rule 10.1 violations in perfc_incra and PERFCOUNTER_ARRAY
In-Reply-To: <alpine.DEB.2.22.394.2310101515070.3431292@ubuntu-linux-20-04-desktop>
References: <5cfaaaceb163af3244981b020ed55f3f@bugseng.com>
 <alpine.DEB.2.22.394.2310091838510.3431292@ubuntu-linux-20-04-desktop>
 <771624f5199fe76ce266a00d0c649428@bugseng.com>
 <alpine.DEB.2.22.394.2310101515070.3431292@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6a909c948a7faa3fe1ec2069e5dc649d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


>> > > 3. use an unnamed enum, effectively considering the enumerated values as
>> > > plain
>> > > integers.
>> > >    This does not violate the Rule.
>> >
>> > What do you mean by unname enum?
>> 
>> e.g.
>> 
>> enum {
>> #include <xen/perfc_defn.h>
>> 	NUM_PERFCOUNTERS
>> };
>> 
>> instead of
>> 
>> enum perfcounter {
>> #include <xen/perfc_defn.h>
>> 	NUM_PERFCOUNTERS
>> };
> 
> 
> I think this should be easy to do in this case. I gave it a quick try
> and it seems to still build successfully. It could be the best way
> forward for this instance.
> 
> 
> However in general I am confused why unnamed enum can do comparisons
> between members and named enums cannot. What is the reason? In any 
> case,
> I think we should clarify this detail in the notes section of
> docs/misra/rules.rst, because I don't think it was clear to anyone that
> there is a difference in behavior between named and unnamed enums.

MISRA regards unnamed enums as nothing more than bags of constants that 
may or may not
be related. Such enumeration constants always have a signed essential 
type and also the
anonymous enum type cannot be used, for instance, in the definition of 
new types, as
opposed to a named "enum x {}" that introduces an essential type 
"enum<x>".
I'll send a patch and document the difference.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

