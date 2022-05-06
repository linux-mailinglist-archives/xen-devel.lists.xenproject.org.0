Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D011E51E1BA
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 01:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323462.545108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn7Mr-0003gh-95; Fri, 06 May 2022 23:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323462.545108; Fri, 06 May 2022 23:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn7Mr-0003dx-6J; Fri, 06 May 2022 23:28:13 +0000
Received: by outflank-mailman (input) for mailman id 323462;
 Fri, 06 May 2022 23:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uW0u=VO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn7Mp-0003dr-U9
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 23:28:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30cc2703-cd94-11ec-a406-831a346695d4;
 Sat, 07 May 2022 01:28:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45231B82164;
 Fri,  6 May 2022 23:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB3EC385A8;
 Fri,  6 May 2022 23:28:07 +0000 (UTC)
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
X-Inumbo-ID: 30cc2703-cd94-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651879688;
	bh=KCQPANVlV8BdVwg187fEpKXPCJ98yJE+CsBSs6LdDZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TURlB6bsCpMNjJhJYFYtVqjtnzh2DzazZYVfE1okJfksVF27tDCPwx+FGAmh7NsaD
	 AlJ4js28JDet2tjAEs8EDZ04aHZM57f5oM+Pi9mpdFVavNJUOuKeEMZh0wmKD/sZ8S
	 URjcRNBe89t3ivOiebDY4nhSoRBUUZtX3vKxHPzgma7kVnWGRPTGLjMcowqWrnzVOI
	 kJ/ieQgPhkQaVN62XynJeUBLsMXOayZd0+s/FOl+/sU7fYk7ylxMNNONEo9v4MMOX2
	 EkYNW096rhmgfyvnaZeodFH9vvp0oqJ2vJng7y8OA4b8jBAcXw02cKVF6BTj48zyvm
	 Cmnxhtaz9z7ww==
Date: Fri, 6 May 2022 16:28:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ECLAIR Xen x86 results and progress
In-Reply-To: <659c5058-1404-01b5-63d7-48c33159dc48@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2205061548111.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205060919400.43560@ubuntu-linux-20-04-desktop> <659c5058-1404-01b5-63d7-48c33159dc48@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-821358349-1651877477=:43560"
Content-ID: <alpine.DEB.2.22.394.2205061551190.43560@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-821358349-1651877477=:43560
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2205061551191.43560@ubuntu-linux-20-04-desktop>

On Fri, 6 May 2022, Andrew Cooper wrote:
> On 06/05/2022 17:31, Stefano Stabellini wrote:
> > Hi all,
> >
> > Roberto kindly provided the ECLAIR x86 results:
> >
> > https://eclairit.com:8443/job/XEN/Target=X86_64,agent=public/lastSuccessfulBuild/eclair/
> >
> > Click on "See ECLAIR in action", then you can select "Show 100 entries"
> > and see all the results in one page. As an example MC3R1.R1.3
> > corresponds to Rule 1.3 in the spreadsheet.
> 
> Thanks.  Some observations:
> 
> 1) D4.10 "use header guards to prevent multiple inclusion"
> 
> asm/p2m.h lacks header guards at all.  asm/softirq.h has some decidedly
> dodgy looking logic.  These should obviously be fixed, and there are
> probably more too in the 57 violations.
> 
> However, we have files like public/errno.h which are explicitly designed
> to be included multiple times, and are not going to change unless we
> have a fundamental shift in opinion on the utility of trying to make a
> single set of header files for all environments.
> 
> Also, Eclair really doesn't like how we include C files.  TBH, I don't
> much either, but some of the hypercall compat logic explicitly depends
> on including itself, to avoid coding the hypercall logic twice.  There
> is an argument to say that this is differently-less-bad than other
> options, but it certainly doesn't help with general comprehensibility of
> the code.

I think we should accept this rule because in general we would want new
headers to follow the rule. We should fix things like asm/p2m.h, and we
should deviate (not fix, but document) any of the existing cases we
don't want to fix (e.g. errno.h.)


> 2) R6.2 "don't use signed bitfields"
> 
> We have one single violation, and it's only used as a regular boolean. 
> It doesn't even need to be a bitfield at all, because there's 63 bits of
> padding at the end of sh_emulate_ctxt.

This is an easy rule to follow


> (In the time that I've been browsing, someone has apparently done
> another build with in particular CONFIG_SHADOW_PAGING disabled, so this
> has fallen off the list of violations.)
>
> 3) R8.10 "inline functions shall be static".
> 
> We have 3 violations.  One is a legitimate complaint in spinlock.c.
> 
> The other two violations are from extern inline.  Given that extern
> inline explicitly gives the compiler the choice to inline, or use a
> single common out-of-line implementation, I think extern inline also
> meets the spirit of what MISRA is trying to do here, insofar as it
> prevents there being dead functions emitted into the final binary.

As we only have 3 violations, it is another easy rule to follow.

The reason for the rule seems to be to avoid undefined behavior which
can happen if the inline function (not static) is defined with external
linkage but it is not defined in the same translation unit. Looking at
the code, we are using extern gnu_inline which actually has a defined
behavior, so it looks like we are meeting the spirit of the MISRA rule.

In any case, the details on those 2 violations don't matter too much. I
think we should accept the rule because if someone submitted a patch
with an inline function (non static) we would definitely ask them why,
and we would want ECLAIR to highlight the issue.
--8323329-821358349-1651877477=:43560--

