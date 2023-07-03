Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5781746488
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 22:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558145.871987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGQZY-0006rr-IE; Mon, 03 Jul 2023 20:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558145.871987; Mon, 03 Jul 2023 20:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGQZY-0006q2-Ev; Mon, 03 Jul 2023 20:55:00 +0000
Received: by outflank-mailman (input) for mailman id 558145;
 Mon, 03 Jul 2023 20:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOBy=CV=gmail.com=pairspace@srs-se1.protection.inumbo.net>)
 id 1qGQZW-0006pd-Mp
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 20:54:58 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc140d6f-19e3-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 22:54:54 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3a04e5baffcso3751235b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jul 2023 13:54:54 -0700 (PDT)
Received: from smtpclient.apple ([37.19.200.149])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a056808188500b003a1ae2d2638sm4219671oib.7.2023.07.03.13.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 13:54:52 -0700 (PDT)
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
X-Inumbo-ID: dc140d6f-19e3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688417693; x=1691009693;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCbYV9OYll7/BSeuQPWCb5VB0AODorr/L/dKrHXMxBo=;
        b=KvyiQaJGJuxei8mlgbVL3xmpT/3hB51D4Biveo8Y2ILXzYXE4sMB/IejdFnEbskoVq
         T0xFsB45yq2dAfCCAE9IvC2NC28XsyYw19YDRaj9poC9bQv59LIN3FJxXaOakmyy7A4g
         0G1h935BB64aCrTUiNJq0jATI+WTO0NcIC/eHaN2tqNzC0h8Czjxk87cDINcX7//rfbE
         kwQmyaF6e/cPDkbbDvkCpcJWJQzRYtotNJOmlva5eA5J29Te9m7PFBRJ4c/exzblsh4i
         OlGKGadvTjYVCcwjvOTim3n+TtQPfBC+S7A2II/ylpRpC7xKy3yj3FJyuomq8025RbKW
         gV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688417693; x=1691009693;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCbYV9OYll7/BSeuQPWCb5VB0AODorr/L/dKrHXMxBo=;
        b=HgL06hh4GXZ88Q8hHzvVUU91jvh4gynBKuPRpN7HTa5BRHeAeo+OAV5t6CZ9d/oZqF
         a5Kh7wjbW/yQf+MqOkIvbZD3oZGvi6EAltwGeqUDzOaYSFM97J12ZkPkSGHJZkIE5dra
         tQ8p1YQVMetFeJGhAHsRfiU7z4ZLd3834LWyQ2dguj1ROCXWUXeXd/ZToHXzKAHvgaLh
         duBIciMKBAalHskT8EnDkZ6FmHtbxwLr0rQUDF/nmPJMpQ04v0PW0W83SBCgHe9mCP0H
         pPrDlk6Y04lXnuQ33//SaWagJBV+SS5xO3bxb4UJCea8z/jwLjGfGZB27hpg6g/MvKpM
         1B/Q==
X-Gm-Message-State: AC+VfDwIvZnmur4WHa7JRTEDRs/J5iu7XK5GCGURkoj3GZlMNnFtvxZt
	p5gpYZwX67ppRUq5O5yj/KY=
X-Google-Smtp-Source: ACHHUZ4TYuQerqjI+UQq0Oy5ny1hAlVQJoSkzLtwefRxwRQcHOV6O/WXlhGjet9++7yben+jyawQVw==
X-Received: by 2002:a54:4414:0:b0:3a3:6f53:e0f6 with SMTP id k20-20020a544414000000b003a36f53e0f6mr10055795oiw.45.1688417692977;
        Mon, 03 Jul 2023 13:54:52 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: P S <pairspace@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Date: Mon, 3 Jul 2023 16:54:40 -0400
Message-Id: <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
X-Mailer: iPad Mail (20F75)



> On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
> =EF=BB=BF
>=20
>> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>>=20
>>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
>>> On 7/1/23 11:13, Luca Fancellu wrote:
>>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>>>>=20
>>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>>>>>> The "dom0less" feature was intended to be the feature where a domU
>>>>>> domain could be launched without the control domain (Dom0)
>>>>>> intervention, however the name seems to suggest that Dom0 cannot
>>>>>> be part of the configuration, while instead it's a possible use case.=

>>>>>>=20
>>>>>> To avoid that, rename the "dom0less" configuration with the name
>>>>>> "hyperlaunch", that is less misleading.
>>>>>>=20
>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>> ---
>>>>>> This is an RFC to get the feeling of the community about the name
>>>>>> change, for now it's everything in one patch just to see how it
>>>>>> will look like, if there is interest on proceeding into it, I can
>>>>>> split in more commit.
>>>>>=20
>>>>> Have you discussed this with Dan and Chris at all?  You haven't even
>>>>> CC'd them.
>>>>=20
>>>> No, this rename idea started from a chat during the summit, anyway Juli=
en
>>>> promptly add them to the CC, because I forgot.
>>>=20
>>> No worries and thank you for considering and taking the time to do this R=
FC.
>>> It is greatly appreciated that there is a strong willingness to have dom=
0less
>>> and hyperlaunch merged.
>>>=20
>>>>>=20
>>>>> While there is a lot of end-goal in common between the dom0less and
>>>>> hyperlaunch, and that the name dom0less is deeply misleading,
>>>>> hyperlaunch is specifically not this.
>>>>=20
>>>> Yes Hyperlaunch is more than this, however as I said, with this RFC I w=
ould
>>>> like
>>>> to ear opinions, @Daniel @Christopher could it be a proper name for the=

>>>> dom0less
>>>> feature?
>>>=20
>>> As Andy has alluded, hyperlaunch is meant to provide a flexible means to=

>>> handle domain construction at boot to meet a wide range of possible use c=
ases.
>>> One of those use cases is dom0less, so yes, ultimately what dom0less doe=
s
>>> today will be achievable under hyperlaunch. Our intended approach to ali=
gn the
>>> two implementations is one that is meant to be minimally disruptive, sin=
ce
>>> dom0less is considered a supported (SUPPORT.md) capability. As mentioned=
, we
>>> are greatly appreciative to the openness to adopt the name,
>>=20
>> Thanks Daniel!
>>=20
>>=20
>>> but a big concern
>>> I personally have is the confusion it could cause a general user. A blan=
ket
>>> rename would end up with two documents in the docs tree that provide two=

>>> different explanations of hyperlaunch and two different device tree
>>> definitions. So I think a more measured approach should be considered he=
re.
>>>=20
>>>> If this patch makes things more difficult for the Hyperlunch serie, I=E2=
=80=99m ok
>>>> to drop it,
>>>> my only aim was just to find a less misleading name for the feature.
>>>=20
>>> What I would like to suggest as a good first step would be an update to t=
he
>>> dom0less document. Provide a note at the beginning that points to the
>>> hyperlaunch design doc as a more general approach that will eventually s=
ubsume
>>> dom0less. This would provide a gentler transition for exist users of dom=
0less.
>>>=20
>>> If it is not too much, I would also ask, please have a look at the desig=
n for
>>> boot modules in the series Christopher just posted. The design pulls fro=
m the
>>> work done by dom0less and expanded upon it. I major step into merging th=
e two
>>> capabilities will be to have a common set of structures. Once those are i=
n
>>> place, we can move to a common device tree representation, and at that p=
oint
>>> we would be fairly close, if not at the point of a formal merger of betw=
een
>>> the two.
>>=20
>> At the moment we have a concrete problem with explaining dom0less and
>> hyperlaunch to potential new users. Using two different names for a
>> similar feature on arm and x86 causes confusion. It is hurting Xen as a
>> solution. Personally I already had to switch to use the word
>> "hyperlaunch" for everything in my users-facing presentations.
>>=20
>> At the summit, we discussed that it would be a good idea to use a single
>> name to refer to both features on arm and x86. Given that "dom0less"
>> causes additional issues because it makes people think that there is no
>> Dom0, the suggestion was to use "hyperlaunch" to refer to both features.
>>=20
>> We don't need to 100% align the two implementations and data structures.
>> This is not for engineers that are going to look at the specifications
>> and improve them. This is for users/customers of Xen that are trying to
>> understand what the hypervisor enables them to do. We need to be able to
>> show users architecture slides with the same name and explanation on
>> both ARM and x86.
>>=20
>> I am sure that Daniel and Christopher remember, but for the others on
>> this email thread, the name "hyperlaunch" was born exactly to be that:
>> the one name to cover both features on ARM and x86 even if they have a
>> different implementation. Appended an old email for reference.
>>=20
>> Also I agree with Daniel that we need to be careful about the two docs
>> under docs/. I think he is right we need to add a paragraph explaining
>> the history and a pointer to the other document. Something like:
>>=20
>> "Dom0less is the name that was used when initially introducing the
>> feature on ARM. Then, the "dom0less" name was retired in favor of
>> "hyperlaunch" to avoid confusion (a Dom0 might still be present) and to
>> align with x86 (where a similar feature was called hyperlaunch from the
>> start)."
>=20
> I=E2=80=99m fully ok to add a section like this pointing to the Hyperlaunc=
h design.

_If_ this text is added, please include links/references to the Hyperlaunch w=
iki page and Hyperlaunch design docs.

> @Daniel and @Christopher would it be ok for you or the changes in the seri=
e
> are going to be problematic for your future work? In the end it=E2=80=99s j=
ust a mechanical
> rename, so I guess we just need to agree on naming conventions.

Please see the history of trademark litigation about the use of symbolic nam=
es to reference similar-but-different artifacts.  It is much easier to use t=
he same name to refer to entirely different objects. Historically, confusion=
 arises when a name is used in similar contexts.

There is also versioning.  Could we refer to dom0less as "Hyperlaunch Versio=
n -1"?=20

How about renaming dom0less to "Hyperlaunch Lite"?

Rich

> Cheers,
> Luca
>=20
>>=20
>>=20
>> ---
>>=20
>> Subject: [RFP] Overarching name for dom0less and DomB
>>=20
>> Greetings,
>>=20
>> At the DeviceTree/DomB meeting it was proposed that a new, larger
>> overarching name under which DomB and dom0less would be covered. There
>> was a general openness to the idea. As such, since Christopher and
>> myself are in the midst of finalizing the design document for DomB we
>> felt it might be better to see if a name could be selected which we
>> could use in the design doc in lieu of DomB. As always naming things is
>> hard, but after some brainstorming we believe we have arrived at a
>> decent name, =CE=BCLaunch (micro-Launch or uLaunch).
>>=20
>> ---
>>=20
>> =CE=BCLaunch became hyperlaunch few days after, and the rest was history :=
-)
>=20
>=20

