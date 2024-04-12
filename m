Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199C8A3179
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 16:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704738.1101267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIDM-0000mG-LX; Fri, 12 Apr 2024 14:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704738.1101267; Fri, 12 Apr 2024 14:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIDM-0000ju-J0; Fri, 12 Apr 2024 14:49:16 +0000
Received: by outflank-mailman (input) for mailman id 704738;
 Fri, 12 Apr 2024 14:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJ5u=LR=bounce.vates.tech=bounce-md_30504962.661949e7.v1-82ffa0108b494c8a9f74252d108fbd6c@srs-se1.protection.inumbo.net>)
 id 1rvIDK-0000jo-Oe
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 14:49:15 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d36ffd9a-f8db-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 16:49:13 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VGKFz5Jmxz8XRqGf
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 14:49:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 82ffa0108b494c8a9f74252d108fbd6c; Fri, 12 Apr 2024 14:49:11 +0000
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
X-Inumbo-ID: d36ffd9a-f8db-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712933351; x=1713193851;
	bh=sqDq7+1CoBYFBo9LrJqMOoBFSt4P25wqk78vmExOUmg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qD1d/tDiJgdtgiIs6XktAa7i71ALoo1EwjC/qgHiICnqCYZBi+02Tn+6shq8Zb8iS
	 us4rOSMwkeB8w+3R89xXMUjAXUBMc4YtBr7N8JP36upvPSOyEKlBAJxy4TmBg4JuXI
	 8MPYX9fsxZtK95VWOFYdbsVg57eqAWGK0UURl98Eat1HoLwv2goHoKM/t7Z/gbT1Ej
	 6cyVuRG7OVsD5qu5t4CnFOB014m/R/+b4rREJz6P1kX/wZmgup28PH5LbYawcWOdk7
	 ZrtD79jYVYx5dSs+ZPTQPgwXyq4H2A3vpzDGDxzXNFeY0nrmMhtn9BdanV2363vdit
	 PvH68wIlwgPdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr; s=mte1;
	t=1712933351; x=1713193851; i=andrei.semenov@vates.fr;
	bh=sqDq7+1CoBYFBo9LrJqMOoBFSt4P25wqk78vmExOUmg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u94EFyBEevCrPB76pMFlylPEbOX2I7tjqSXyU250jWFqoajd9oG8OXMtyHiRc/X1I
	 2ui1x4f/avd8J9OqqwUQ6yNnScmyEmV5D96aBlQhxRvw951v/3gSEwmII8XtRA4Lzh
	 2JBngqWr8US/f9kDgSzjo/UyMMF2TZqo9ZcUpdSyGlUSg9CSxVvkXl2qPbJcwlGRnD
	 j2MeMI88NljToddmXnDXXii4oTDJya5BHzbxDJxBr8q+OkfzEi+fCSw9a7beyayY63
	 BeZw3FSahmIxAvBMnUlRIWgatwDhgmgMzWvq5h42PHtfHUOLHaukJTS8MwxRS3nmpf
	 j6rLZwakBcOMA==
From: Andrei Semenov <andrei.semenov@vates.fr>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=202/2]=20Implemented=20Amd=20Secure=20Processor=20device=20driver?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712933348702
Message-Id: <be2e990c-50bc-4950-a70b-755ffebeaadd@vates.fr>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1712759753.git.andrei.semenov@vates.fr> <8c9627ef69e8d809efcb93b50fc34474f2b0ba7f.1712759753.git.andrei.semenov@vates.fr> <db0f49d5-ea9e-4c62-b7ac-c856656b1e29@citrix.com>
In-Reply-To: <db0f49d5-ea9e-4c62-b7ac-c856656b1e29@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.82ffa0108b494c8a9f74252d108fbd6c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240412:md
Date: Fri, 12 Apr 2024 14:49:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 4/11/24 20:42, Andrew Cooper wrote:
> On 10/04/2024 4:36 pm, Andrei Semenov wrote:
>> Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
>> ---
>>   xen/arch/x86/include/asm/psp-sev.h | 655 +++++++++++++++++++++++
>>   xen/drivers/Kconfig                |   2 +
>>   xen/drivers/Makefile               |   1 +
>>   xen/drivers/crypto/Kconfig         |  10 +
>>   xen/drivers/crypto/Makefile        |   1 +
>>   xen/drivers/crypto/asp.c           | 808 +++++++++++++++++++++++++++++
>>   xen/include/xen/types.h            |   2 +-
>>   7 files changed, 1478 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/x86/include/asm/psp-sev.h
>>   create mode 100644 xen/drivers/crypto/Kconfig
>>   create mode 100644 xen/drivers/crypto/Makefile
>>   create mode 100644 xen/drivers/crypto/asp.c
> I'm not going to dive into all of this, but give some high level
> feedback to start with.
>
> CCP is driver/crypto in Linux for historical reasons, but is it really
> right here?=C2=A0 We can pick whatever we think is suitable.

Yes, I only picked SEV interface (for instance) and I called the the 
directory "crypto", for

some reasons as=C2=A0 this is the name in Linux, so to "compliant" and SEV =
is 
related to crypto too.

Later we potentially will need to export some of interfaces to guest so 
will need to extend the driver.

As Marek remarked some AMD GPU may need this to load GPU firmware ...

That's beeing said, I have not very strong opinion on "crypto" name.

>
> psp-sev.h looks like it's only the MMIO protocol to the ASP, and that it
> shouldn't need including anywhere else?=C2=A0 If so, we're trying to move
> those header files to be local to the asp.c dir.

SVM operations (at least) will need this.=C2=A0 Very probably toolstack als=
o will

need a part of this, so potentially this part will move to "public" 
interface.

 =C2=A0For instance hard to say what parts (are moving), so all this in the=
 same

psp-sev.h file.

>
> Can you discuss this comment:
>>      CET shadow stack: adapt #CP handler???
> some more.=C2=A0 What's going on?

Yep. Actually CET Shadow Stack raised #21 exception=C2=A0 (near ret) on old=
er

versions of Xen (when I said older I talk about 4.19 unstable). This is 
no more

the case on staging branch. So it was fixed somehow. Sorry didn't check

- will fix.

>
>
>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>> index 449947b353..f7599845fd 100644
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
>> @@ -6,7 +6,7 @@
>>   
>>   /* Linux inherited types which are being phased out */
>>   typedef int8_t s8;
>> -typedef uint8_t u8;
>> +typedef uint8_t u8, __u8;
>>   typedef int16_t s16;
>>   typedef uint16_t u16, __u16;
>>   typedef int32_t s32;
> The comment is here for a reason, so reviewers don't accept hunks like th=
is.
>
> psp-sev.h should be written using normal C99 integer types please.
Got it. Will fix
>
> ~Andrew


