Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541BC20D6B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153767.1484035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUHo-0005gv-I4; Thu, 30 Oct 2025 15:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153767.1484035; Thu, 30 Oct 2025 15:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUHo-0005fT-F0; Thu, 30 Oct 2025 15:10:00 +0000
Received: by outflank-mailman (input) for mailman id 1153767;
 Thu, 30 Oct 2025 15:09:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzSz=5H=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vEUHn-0005fN-Bk
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:09:59 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75f553dc-b5a2-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 16:09:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 28B777790EFB;
 Thu, 30 Oct 2025 10:09:41 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nACI6O-AgS2V; Thu, 30 Oct 2025 10:09:40 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1D48A7791C23;
 Thu, 30 Oct 2025 10:09:40 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id McR66_uf6zkS; Thu, 30 Oct 2025 10:09:40 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ECBBA7790EFB;
 Thu, 30 Oct 2025 10:09:39 -0500 (CDT)
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
X-Inumbo-ID: 75f553dc-b5a2-11f0-980a-7dc792cee155
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1D48A7791C23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761836980; bh=Cdiha2tuCZYSrAZgMntMmoQoEl+EDTlv6kzqmBAU23o=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=o2YbYw9NEo0g4ldd/dFOSqXZkIZvO7MMMil6h7Wj9MCIOiEddVftaqGj22JlF62bz
	 +ESACAyM++5yfi4Y7mLC/I5hEBbW29W+SkXT+N8WWjpuH3R1EHSX01f7xm1pjkHEB0
	 tBhpDVbl3e5H3r3QVSI6oFmJegl6bTWpCPIvQldc=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Thu, 30 Oct 2025 10:09:37 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, shawn <shawn@anastas.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <1788041210.6163.1761836977190.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <35b2e61b-d1c1-47c0-90e2-7efa1f45243f@suse.com>
References: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com> <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop> <35b2e61b-d1c1-47c0-90e2-7efa1f45243f@suse.com>
Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer
Thread-Index: ZsBC+t7jV6QgRcwFTLhBqv+ydmQivQ==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "shawn" <shawn@anastas.=
io>, "Andrew Cooper"
> <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano St=
abellini" <sstabellini@kernel.org>, "Anthony
> PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com=
>, "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> Sent: Thursday, October 30, 2025 2:40:53 AM
> Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64 main=
tainer

> On 29.10.2025 20:38, Stefano Stabellini wrote:
>> On Wed, 29 Oct 2025, Timothy Pearson wrote:
>>> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC=
64
>>> reviewer.
>>>
>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>> ---
>>>  MAINTAINERS | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index ecd3f40df8..c8764a8c5f 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -472,7 +472,7 @@ F:=09xen/drivers/cpufreq/
>>>  F:=09xen/include/acpi/cpufreq/
>>> =20
>>>  PPC64
>>> -M:=09Shawn Anastasio <sanastasio@raptorengineering.com>
>>> +M:=09Timothy Pearson <tpearson@raptorengineering.com>
>>>  F:=09xen/arch/ppc/
>>=20
>> The "R" letter is used for reviewers. The change can be done while
>> committing.
>=20
> And with that change:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Just to mention: I can't see what you used as basis to compose the Cc lis=
t.
> George's
> email address has been out of use for quite a while, and he isn't with th=
e
> project
> anymore. Wei had turned to other activities yet longer ago. And with Shaw=
n
> having
> left Raptor (as you indicated), I expect his email address there would no=
w also
> bounce. I have, therefore, heavily edited the Cc list of this reply.
>=20
> Jan

I had pulled the CC list from the "Rest" in the MAINTAINERS file in the roo=
t of the GIT tree.  Should I have been looking elsewhere?

Thanks!

