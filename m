Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F8744822
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jul 2023 11:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557834.871519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFWaE-0008O9-PY; Sat, 01 Jul 2023 09:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557834.871519; Sat, 01 Jul 2023 09:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFWaE-0008Lo-M4; Sat, 01 Jul 2023 09:07:58 +0000
Received: by outflank-mailman (input) for mailman id 557834;
 Sat, 01 Jul 2023 09:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XVz2=CT=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1qFWaC-0008Lg-TS
 for xen-devel@lists.xenproject.org; Sat, 01 Jul 2023 09:07:56 +0000
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [2607:f8b0:4864:20::d31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c35dc7f8-17ee-11ee-b237-6b7b168915f2;
 Sat, 01 Jul 2023 11:07:55 +0200 (CEST)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7835c92c373so66351839f.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jul 2023 02:07:54 -0700 (PDT)
Received: from smtpclient.apple ([87.249.134.26])
 by smtp.gmail.com with ESMTPSA id
 eh4-20020a056638298400b00426eea9f398sm3190051jab.134.2023.07.01.02.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 02:07:53 -0700 (PDT)
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
X-Inumbo-ID: c35dc7f8-17ee-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688202474; x=1690794474;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WIn68E2vval0WhdulTmqLoUBV2XXLtEL49qn7WzQQ8=;
        b=JAbxYHYQHSo7S0Eb/Qx26DGEoUP+NBx5aj9kcE2KCoXFHohUwcE93VxSn6lZaz5RRJ
         AyYqBngN59MeMUl625KQ00EmEZa7e4fp6sVUIvUAQnGd283Rw8QViLzZuzZYKG6maTuy
         XOVEJk8Fj+RJa4g1uOvXzCkBvl4CGhQSJk2LuK8DO74QporRbo9kfguBtUSRdtp6vvgW
         MIQsXJEI+kvAKcjgiWxliX8uzF1yYH/nZP2BGiF5gVCTITtri4XqR1nxa9bOwerMCMwO
         y01jMcAGad0jdcGVRcohEmWDNuYnIUU6+0z78xZk11SeuQo1GUy0ciQPahScbKQJt+Dz
         mO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688202474; x=1690794474;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WIn68E2vval0WhdulTmqLoUBV2XXLtEL49qn7WzQQ8=;
        b=Zn/+gm+/xVlvapzhPgex1Xo/9OW+4qH0sZJqAUnhrl/m7ATdKp8338PBLomKYT1fOZ
         PDBe/qVxbeGOakGMWyVZiGle4BCJRivt05cylxuupgIsAONS2uXK41UGPhThkm7sZQt9
         v5d0eQT3JUFSlOqbGQmo2W/CMPNQ/bnPAVdt9VkRnqCEUbQropQKfoLAQLvvUJUWrEEY
         VGVIMcJKotvvmcs2xmVahYUcNgph1iILXgqAHwtFrMU14ctGv54W6h2hyQpLw1t2ODZX
         0kZ8G7LtxI5NMtF5y1ZbzAOK44QSnOJnf5lT3C8zYEwiW9zpXrMZUMP6dViR79XbDQEA
         nqDw==
X-Gm-Message-State: AC+VfDxKaVTS8YqlH6B74+fP0wGJzk3/DZI7auh6SqtB6/eqLtXZv/My
	vt94X6TX2CfN2Ou55oTe5ZA=
X-Google-Smtp-Source: ACHHUZ6FgkLFVHEymiyx3HTQ1q+w+/eZPl3RiaL5/0E6R1BBXxADuY90PlZRMkDZXt18oLnCh+7eUw==
X-Received: by 2002:a05:6e02:c68:b0:342:558c:d88e with SMTP id f8-20020a056e020c6800b00342558cd88emr6329062ilj.11.1688202473581;
        Sat, 01 Jul 2023 02:07:53 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-1F9216F4-6F5A-4AFF-85F5-BE841D0E68EE
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Date: Sat, 1 Jul 2023 05:07:41 -0400
Message-Id: <B954806C-5D31-483C-964B-17F1EFDB20BD@gmail.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Daniel DeGraaf <dgdegra@tycho.nsa.gov>, openxt@googlegroups.com,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 =?utf-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
In-Reply-To: <20230630091210.3742121-1-luca.fancellu@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
X-Mailer: iPad Mail (20F75)


--Apple-Mail-1F9216F4-6F5A-4AFF-85F5-BE841D0E68EE
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Jun 30, 2023, at 05:12, Luca Fancellu <luca.fancellu@arm.com> wrote:
>=20
> =EF=BB=BFThe "dom0less" feature was intended to be the feature where a dom=
U
> domain could be launched without the control domain (Dom0)
> intervention, however the name seems to suggest that Dom0 cannot
> be part of the configuration, while instead it's a possible use case.

Thanks for your interest in Xen boot integrity. Please see the 2018 domB RFC=
:
https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg01306.html

At Xen Summit 2018 (Nanjing) and Xen Summit 2019 (Chicago), OpenXT contribut=
ors made a case to Xen-on-Arm contributors for the architectural unification=
 of incumbent dom0less (Arm) and the domB (x86) proposal for improving Xen b=
oot integrity.

> To avoid that, rename the "dom0less" configuration with the name
> "hyperlaunch", that is less misleading.

2018-2022 work on Xen launch integrity, thanks to Apertus and Star Lab:=20
https://wiki.xenproject.org/wiki/Hyperlaunch
https://www.theregister.com/2022/12/16/xen_4_17_hyperlaunch/

2023 Hyperlaunch design session last week, thanks to Apertus and AMD:
https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01870.html

> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

If Arm is now ready to invest engineering resources into new Xen launch inte=
grity features for security and safety-critical use cases, that is exciting n=
ews, 5 years into the on-again-off-again bootstrapped Hyperlaunch project! T=
he roadmap would benefit from new funding.

Would you like to attend the next Xen working group call for Hyperlaunch?

Rich=

--Apple-Mail-1F9216F4-6F5A-4AFF-85F5-BE841D0E68EE
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">Hi L=
uca,</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">On Jun 30, 2023, at 05=
:12, Luca Fancellu &lt;luca.fancellu@arm.com&gt; wrote:</div><div dir=3D"ltr=
"><blockquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"=
><div dir=3D"ltr">=EF=BB=BF<span>The "dom0less" feature was intended to be t=
he feature where a domU</span><br><span>domain could be launched without the=
 control domain (Dom0)</span><br><span>intervention, however the name seems t=
o suggest that Dom0 cannot</span><br><span>be part of the configuration, whi=
le instead it's a possible use case.</span><br></div></blockquote><div><br><=
/div><div>Thanks for your interest in Xen boot integrity. Please see the 201=
8 domB RFC:</div><div><a href=3D"https://lists.xenproject.org/archives/html/=
xen-devel/2018-06/msg01306.html">https://lists.xenproject.org/archives/html/=
xen-devel/2018-06/msg01306.html</a></div><div><br></div><div><div>At Xen Sum=
mit 2018 (Nanjing) and Xen Summit 2019 (Chicago), OpenXT contributors made a=
 case to Xen-on-Arm contributors for the architectural unification of incumb=
ent dom0less (Arm) and the domB (x86) proposal for improving Xen boot integr=
ity.</div><div><br></div></div><blockquote type=3D"cite"><div dir=3D"ltr"><s=
pan></span><span>To avoid that, rename the "dom0less" configuration with the=
 name</span><br><span>"hyperlaunch", that is less misleading.</span><br></di=
v></blockquote><div><br></div><div>2018-2022 work on Xen launch integrity, t=
hanks to Apertus and Star Lab:&nbsp;</div><div><a href=3D"https://wiki.xenpr=
oject.org/wiki/Hyperlaunch">https://wiki.xenproject.org/wiki/Hyperlaunch</a>=
</div><div><a href=3D"https://www.theregister.com/2022/12/16/xen_4_17_hyperl=
aunch/">https://www.theregister.com/2022/12/16/xen_4_17_hyperlaunch/</a></di=
v><div><br></div><div>2023 Hyperlaunch design session last week, thanks to A=
pertus and AMD:</div><div><a href=3D"https://lists.xenproject.org/archives/h=
tml/xen-devel/2023-06/msg01870.html">https://lists.xenproject.org/archives/h=
tml/xen-devel/2023-06/msg01870.html</a></div><div><br></div><blockquote type=
=3D"cite"><div dir=3D"ltr"><span></span><span>Signed-off-by: Luca Fancellu &=
lt;luca.fancellu@arm.com&gt;</span><br></div></blockquote><div><br></div>If A=
rm is now ready to invest engineering resources into new Xen launch integrit=
y features for security and safety-critical use cases, that is exciting news=
, 5 years into the on-again-off-again bootstrapped Hyperlaunch project! The r=
oadmap would benefit from new funding.<div><br></div><div>Would you like to a=
ttend the next Xen working group call for Hyperlaunch?<div><br></div><div>Ri=
ch</div></div></body></html>=

--Apple-Mail-1F9216F4-6F5A-4AFF-85F5-BE841D0E68EE--

