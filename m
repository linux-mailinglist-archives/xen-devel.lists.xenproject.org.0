Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840C46FC205
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 10:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532037.828004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwJ3K-0008W6-1c; Tue, 09 May 2023 08:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532037.828004; Tue, 09 May 2023 08:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwJ3J-0008UL-Uh; Tue, 09 May 2023 08:50:33 +0000
Received: by outflank-mailman (input) for mailman id 532037;
 Tue, 09 May 2023 08:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85P=A6=bounce.vates.fr=bounce-md_30504962.645a0955.v1-94f408e6aef34506a031dc1ad4551bf0@srs-se1.protection.inumbo.net>)
 id 1pwJ3I-0008UF-E9
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 08:50:32 +0000
Received: from mail145-2.atl61.mandrillapp.com
 (mail145-2.atl61.mandrillapp.com [198.2.145.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cc6b881-ee46-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 10:50:30 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-2.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4QFsLY103BzQXhVH1
 for <xen-devel@lists.xenproject.org>; Tue,  9 May 2023 08:50:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 94f408e6aef34506a031dc1ad4551bf0; Tue, 09 May 2023 08:50:29 +0000
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
X-Inumbo-ID: 8cc6b881-ee46-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1683622229; x=1683882729; i=yann.dirson@vates.fr;
	bh=XH6A9kRnaKfrtYq4xDKHmzCwIBK2FhX1ZqRruWUSQMc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OBtd2a3RMp3AR4Zbcl5JuEp474EoCJtS2oBwJYnJV14QHgWOfx1/lpnbPpyAB/g7w
	 OK9qtfb5HbZ31RhyV+4Q3YhrzgMuDvv/Q+KwO7cN56P3vNSxpGzuo767q4HXPylLu2
	 iQuBm1q4AmkFj5REA+Es+Q+pIhfplbR8NRIpmNMI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1683622229; h=From : 
 Subject : Message-Id : To : Cc : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=XH6A9kRnaKfrtYq4xDKHmzCwIBK2FhX1ZqRruWUSQMc=; 
 b=MbrYoUxC8pdOc6NtZhJ43fBb9aRZ/VORsu+B6wbw+XMV463zWpA0Vr7/MooIWjOMDKGEvY
 4k8d+aCSJsc/xEbWVbRYEygdpSRfCIrW9yHNiAyMVqgF6fkf7D6MRPI1X300MLJuDBp7+GYD
 c6szoPfn3/w75oI4ipAeYDuwAn5jU=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Re:=20xenstored:=20EACCESS=20error=20accessing=20control/feature-balloon=201?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 9664e26d-c55d-4176-ac64-680cfb7c5564
X-Bm-Transport-Timestamp: 1683622225995
Message-Id: <9a5045b8-43f3-d418-9e77-418b6db91f71@vates.fr>
To: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, =?utf-8?Q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <3065c524-07c7-6458-ff4c-ba68ff78c946@rabbit.lu> <474b531f-2067-a5d4-8b01-5b8ef1f7061d@citrix.com> <678df1ff-df18-b063-eda3-2a1aed6d40f8@vates.fr> <50bf6b82-965b-d17c-7c5a-49c703991504@rabbit.lu> <f44261a2-df39-f69a-9798-dc1d656e6dac@vates.fr> <a51e0f7e-aed0-2ec9-f451-2e750636fb78@rabbit.lu>
In-Reply-To: <a51e0f7e-aed0-2ec9-f451-2e750636fb78@rabbit.lu>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.94f408e6aef34506a031dc1ad4551bf0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230509:md
Date: Tue, 09 May 2023 08:50:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 5/4/23 20:04, zithro wrote:
> On 04 May 2023 17:59, Yann Dirson wrote:
>>
>> On 5/4/23 15:58, zithro wrote:
>>> Hi,
>>>
>>> [ snipped for brevity, report summary:
>>> XAPI daemon in domU tries to write to a non-existent xenstore node in
>>> a non-XAPI dom0 ]
>>>
>>> On 12 Apr 2023 18:41, Yann Dirson wrote:
>>>> Is there anything besides XAPI using this node, or the other data
>>>> published by xe-daemon?
>>>
>>> On my vanilla Xen (ie. non-XAPI), I have no node about "balloon"-ing
>>> in xenstore (either dom0 or domU nodes, but I'm not using ballooning
>>> in both).
>>>
>>>> Maybe the original issue is just that there is no reason to have
>>>> xe-guest-utilities installed in this setup?
>>>
>>> That's what I thought as I'm not using XAPI, so maybe the problem
>>> should only be addressed to the truenas team ? I posted on their forum
>>> but got no answer.
>>> I killed the 'xe-daemon' in both setups without loss of functionality.
>>>
>>> My wild guess is that 'xe-daemon', 'xe-update-guest-attrs' and all
>>> 'xenstore* commands' are leftovers from when Xen was working as a dom0
>>> under FreeBSD (why would a *domU* have them ?).
>>
>> That would not be correct: xenstore* are useful in guests, should you
>> want to read/write to the XenStore manually or from scripts;
>
> Didn't know that, can you give some use cases (or URLs) for which it 
> is useful, with or without XAPI ?
> I've read xenstore* man pages and could not infer a use case.
> Although I may already see some : updating ballooned memory values, or 
> as Julien Grall pointed out, updating "feature-s3/4" values ?

You can get other examples in 
https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html#domain-controlled-paths

>
> PS: small mistake in "man/xenstore-write.1.html" (from at least 4.14, 
> and onward), the synopsis reads "xenstore-read" ieof "xenstore-read".
Patch sent, thanks.
> Also, the -s option disappeared from unstable, although it may be 
> expected. I don't know it's purpose either.

See 
https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036ec2862a4b4bd34ea4f

Best regards,

-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

