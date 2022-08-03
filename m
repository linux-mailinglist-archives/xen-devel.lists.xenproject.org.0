Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2DF5888D0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379663.613298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9zR-0000M6-4e; Wed, 03 Aug 2022 08:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379663.613298; Wed, 03 Aug 2022 08:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9zR-0000KE-1h; Wed, 03 Aug 2022 08:44:29 +0000
Received: by outflank-mailman (input) for mailman id 379663;
 Wed, 03 Aug 2022 08:44:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEIo=YH=kolabnow.com=brunoce@srs-se1.protection.inumbo.net>)
 id 1oJ9zP-0000K8-Ip
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:44:27 +0000
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ad146c6-1308-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 10:44:26 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id A7A2112D9;
 Wed,  3 Aug 2022 10:44:25 +0200 (CEST)
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smlid3ENe6l8; Wed,  3 Aug 2022 10:44:25 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by mx.kolabnow.com (Postfix) with ESMTPS id 84CC0DF8;
 Wed,  3 Aug 2022 10:44:24 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 14C91372B;
 Wed,  3 Aug 2022 10:44:23 +0200 (CEST)
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
X-Inumbo-ID: 7ad146c6-1308-11ed-bd2d-47488cf2e6aa
Authentication-Results: ext-mx-out002.mykolab.com (amavisd-new);
	dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
	header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	in-reply-to:references:message-id:date:date:subject:subject
	:mime-version:from:from:content-transfer-encoding:content-type
	:content-type:received:received:received; s=dkim20160331; t=
	1659516265; x=1661330666; bh=qYF1jxPeRTibyXna7FJRkpjFPCiqhUYx6GZ
	bmjAos6o=; b=bZVZ/tOPZC2xvWRhi6w+2DXJ8qh12wt4kcX+RKi71trX84IfPCp
	UkQi1ZC01jkmh3FvukOwyDC1cIQON3VT4JLFTh/J9VK/jU8LGXEo7NviiYShZUDl
	UZBhKIxzlE4aZs8GmPUkffUBZDg2WCLt7NvQb8TttBJLnE6BRIZeYvC8TPjrL0WB
	rjyN9BziKc1TL9nZC/WPkD9tK4dzP9MhCPE4hl2T+7zNmv2AIVn9hKKxyOPsXmis
	NSjH8av1TjW0PReqzFMBZkxg4Q6Ao5OF02yZTsXAgZh91BmDKpGrkk/5yyC/O5zh
	jlbyn4oJMHwDOQD6VYPRDZVrSdOT3Ap83h7j1wnDowsmwxn4m3skM1dTz6n1XmBF
	CA/BlViAYNSTqik0YeT6dZ/9YnGyLDSlO3u207KZV8QTZ8n4P2f92aC1wU+rx5yH
	zrpBf2HeusJcWXh09pTkmnHlyBClvmdyslz3WadFOqJBOQrnarW9t/0B1Zrzpdbn
	6FMgk878xB7+sSz2bOSBWmEz+k5AlCCrJZvR/gUkMn7FivECJnpg66WDn55OeNGe
	73soGx/xv5Th+XZkLKl6J2QGB4HM0iNAsd2sEUIClyHQIuBQN33+fyGoPKx05YyK
	fo5xzGgUoM3WQC5Twvd31NKRTtXTbncbMZ+0eLXigOVTFxWL/31P+CBo=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.898
X-Spam-Level:
X-Spam-Status: No, score=-1.898 tagged_above=-10 required=5
	tests=[BAYES_00=-1.9, MIME_QP_LONG_LINE=0.001, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Bruno <brunoce@kolabnow.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Date: Wed, 3 Aug 2022 09:44:22 +0100
Message-Id: <2B4EA247-D7AB-4CBB-A03F-966ADBD9A179@kolabnow.com>
References: <9ae39fa1-84f8-401c-85a2-3b6208e54d18@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <9ae39fa1-84f8-401c-85a2-3b6208e54d18@suse.com>
To: Jan Beulich <jbeulich@suse.com>

Jan, I am glad we see this now!

Should I report this on the to the linux  kernel dev group?

Thank you!

> On 3 Aug 2022, at 07:34, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> =EF=BB=BFOn 03.08.2022 08:25, Jan Beulich wrote:
>>> On 02.08.2022 18:07, Bruno wrote:
>>> On initramfs:
>>>=20
>>> - xl will give me not found - I cannot do xl info or xl dmesg
>>=20
>> As expected - you'd have to handcraft xl and ints libraries into the
>> image.
>>=20
>>> - I cannot mount any disk, therefore, exporting logs from there has been=
=20
>>> photographing and using OCR then reviewing and correcting - but I guess=20=

>>> the main difference is ACIP, as I cannot access the disks
>>=20
>> Oh, I see. I was kind of expecting (hoping) you might be able to
>> export the logs via, say, a USB key.
>>=20
>>> I have now booted on kernel 18 to get the kernel boot log for you (the=20=

>>> one on Xen-user is kernel 10).
>>=20
>> At the first glance - similar ACPI errors, and a similar issue with
>> loading sound firmware. Using two different kernels won't really
>> lend itself for direct comparison, though. At the moment I don't see
>> a good way forward here as long as not even proper logs can be
>> obtained: It may be necessary to add debugging code, the output of
>> which would also need collecting. But maybe someone else sees a
>> viable route to help you ...
>=20
> Oh, actually upon looking again I spotted something:
>=20
> nvme nvme0: pci function 10000:e1:00.0
>=20
> Note the wider-than-16-bits segment number. Which, afaict, is an effect of=

> using the Volume Management Device:
>=20
> vmd 0000:00:0e.0: PCI host bridge to bus 10000:e0
>=20
> You may want to go through firmware setup options to see whether there's a=

> way to disable it / its use. Neither Xen nor the Dom0 Linux kernel (i.e.
> when run under Xen) have been enabled so far to make this work (and, from
> inspection quite a while back, the kernel implementation, during its desig=
n,
> not having considered the possibility of running on a type-1 hypervisor wi=
ll
> likely make adding support, well, interesting).
>=20
> Jan


