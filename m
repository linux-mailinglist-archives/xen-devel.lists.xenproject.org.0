Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D07C20F04
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153805.1484074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUcR-0002ht-Tf; Thu, 30 Oct 2025 15:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153805.1484074; Thu, 30 Oct 2025 15:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUcR-0002g5-Qb; Thu, 30 Oct 2025 15:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1153805;
 Thu, 30 Oct 2025 15:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzSz=5H=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vEUcP-0002DF-Jv
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:31:17 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 798db97a-b5a5-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 16:31:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C2A807790720;
 Thu, 30 Oct 2025 10:31:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KH7UNZKx-TSS; Thu, 30 Oct 2025 10:31:13 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 806B077907D5;
 Thu, 30 Oct 2025 10:31:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8J74aGl5Q6-o; Thu, 30 Oct 2025 10:31:13 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 596C37790720;
 Thu, 30 Oct 2025 10:31:13 -0500 (CDT)
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
X-Inumbo-ID: 798db97a-b5a5-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 806B077907D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761838273; bh=Mv+eQteLoXb0EZbjhQUqhdX/VBBMfAJH1MxbFydzKjw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Y1R3ESkvh33YSFMPaJ+abnog32Hcin9MiFxlxIKA3oDNs+HmnzzmmvAr0Jom0hPw5
	 Sq5JIqk5rup+JWtb6NLHCb2H5fHox9LVet8/SggtWwE4i4GN3Wd3lmfYtannqfkphO
	 ZIB8iL468w9rQKDjD94eOHX6Q8LQ+BvHF4pkqBmY=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Thu, 30 Oct 2025 10:31:10 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, shawn <shawn@anastas.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, 
	Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <927229739.6325.1761838270637.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <8b4b5561-af7f-4917-aea1-4ed65a0f3023@suse.com>
References: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com> <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop> <35b2e61b-d1c1-47c0-90e2-7efa1f45243f@suse.com> <1788041210.6163.1761836977190.JavaMail.zimbra@raptorengineeringinc.com> <8b4b5561-af7f-4917-aea1-4ed65a0f3023@suse.com>
Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer
Thread-Index: tvOsLyDRQl/a3ABQf6kbLEICsniX1Q==



----- Original Message -----
> From: "Jan Beulich" <jbeulich@suse.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "shawn" <shawn@anastas.=
io>, "Andrew Cooper"
> <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano St=
abellini" <sstabellini@kernel.org>, "Anthony
> PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com=
>, "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> Sent: Thursday, October 30, 2025 10:28:57 AM
> Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64 main=
tainer

> On 30.10.2025 16:09, Timothy Pearson wrote:
>> ----- Original Message -----
>>> From: "Jan Beulich" <jbeulich@suse.com>
>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>=20
>>> On 29.10.2025 20:38, Stefano Stabellini wrote:
>>>> On Wed, 29 Oct 2025, Timothy Pearson wrote:
>>>>> Shawn is no longer with Raptor Engineering.  For now, add myself as P=
PC64
>>>>> reviewer.
>>>>>
>>>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>>> ---
>>>>>  MAINTAINERS | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index ecd3f40df8..c8764a8c5f 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -472,7 +472,7 @@ F:=09xen/drivers/cpufreq/
>>>>>  F:=09xen/include/acpi/cpufreq/
>>>>> =20
>>>>>  PPC64
>>>>> -M:=09Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>> +M:=09Timothy Pearson <tpearson@raptorengineering.com>
>>>>>  F:=09xen/arch/ppc/
>>>>
>>>> The "R" letter is used for reviewers. The change can be done while
>>>> committing.
>>>
>>> And with that change:
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Just to mention: I can't see what you used as basis to compose the Cc l=
ist.
>>> George's
>>> email address has been out of use for quite a while, and he isn't with =
the
>>> project
>>> anymore. Wei had turned to other activities yet longer ago. And with Sh=
awn
>>> having
>>> left Raptor (as you indicated), I expect his email address there would =
now also
>>> bounce. I have, therefore, heavily edited the Cc list of this reply.
>>=20
>> I had pulled the CC list from the "Rest" in the MAINTAINERS file in the =
root of
>> the GIT tree.  Should I have been looking elsewhere?
>=20
> That's the right place, but did you perhaps look at a (very) stale versio=
n?

Not that I know of...

commit 9db10d89c41e0272066a8547ec5ee2a642663baa
Author: Jason Andryuk <jason.andryuk@amd.com>
Date:   Mon Oct 13 10:41:01 2025 +0200

    MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer

    Split out AMD SVM and AMD IOMMU, and add myself as a reviewer.  Jan,
    Andrew and Roger are set as maintainers as they were for the X86 entry.

    Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
    Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

commit ac58e34a0960bcc71583edfc6b4d6baa5e81c7d0
Author: Stewart Hildebrand <stewart.hildebrand@amd.com>
Date:   Thu Sep 25 09:19:21 2025 +0200

    MAINTAINERS: add myself as vPCI reviewer

    I'd like to take a more active role in reviewing vPCI bits.

    Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
    Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Ends with:


THE REST
M:      Andrew Cooper <andrew.cooper3@citrix.com>
M:      Anthony PERARD <anthony.perard@vates.tech>
M:      Michal Orzel <michal.orzel@amd.com>
M:      Jan Beulich <jbeulich@suse.com>
M:      Julien Grall <julien@xen.org>
M:      Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
M:      Stefano Stabellini <sstabellini@kernel.org>
L:      xen-devel@lists.xenproject.org
S:      Supported
F:      *
F:      */
V:      xen-maintainers-1

