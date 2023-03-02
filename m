Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CEC6A87D5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505289.777972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXmfl-0003xA-T3; Thu, 02 Mar 2023 17:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505289.777972; Thu, 02 Mar 2023 17:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXmfl-0003v9-QI; Thu, 02 Mar 2023 17:24:53 +0000
Received: by outflank-mailman (input) for mailman id 505289;
 Thu, 02 Mar 2023 17:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXmfk-0003v3-26
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:24:52 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 237c2f08-b91f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 18:24:50 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id g17so222288lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 09:24:50 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 d20-20020ac241d4000000b004d856fe5121sm2684lfi.194.2023.03.02.09.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:24:50 -0800 (PST)
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
X-Inumbo-ID: 237c2f08-b91f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677777890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8yTlx2FFxJWgC6lzHX/YP+4FDCc/l4O1IGGWnutrzmo=;
        b=gYrPbnRE9ucyW739B/EdH5c7gVSCuXKz6WwS8+LKKydKApUiQ8lz43upADIGlO1LzD
         u0KkhWRQyccgYU4XvbFy6TB2ntS0Dyqlt0zzVsejezF8JlODNlBPxG2gzKAl+PY5Tsmz
         c99FEKUdk7ywSG44Z7ylx30/67kFRLxa10xSIKCb/0evCyY7u0ThxJt8ojL4jq2zptzI
         vyc/hHh+EvaWuWSXYo2vvgmv8K4kSc4mSnDfMqP1NW9tAq8TWF0E/Blvw8oqiSVMZ8cl
         haVK3zPmw4Ivs2YhA7tREPEru2fKFhr83XhiOSQb52NUxgeHGAIqzRkUgdjbD5WveQPu
         7fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677777890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yTlx2FFxJWgC6lzHX/YP+4FDCc/l4O1IGGWnutrzmo=;
        b=CuadfzKpHboQt0BsY6eCEgMkpaKbqih+jz1YWBMrLE9XS0CFTs11VrUQk8yZeZv/Ic
         cpneg6GgH7RD35tPHFqlbPylRKrP7unyj6xNU8nJHdQ66D29UcTAJWLPDCrXYfoQ2wbM
         rY2bQAlVeEo3nIkSiJtmIKls3IpTlX8idIvZINLiqEH/Y4+meYmYYqJZHEb0emSHraSy
         M+p0VTf5cWblxU1UrDHaBtAWL5oMXyBIGSXVFsUNDdrr8vjbj7eaeDr++Q+UKlgWrx0K
         DOFtRxWAP2wpU5abiOkGti/4o0jxAZs6ZjDtUk/EiKEoehg3EZv51zqYX6dyruCB0v/v
         B7Aw==
X-Gm-Message-State: AO0yUKWyje2mUnKG3YXHm21j5x5vqb18MG+cepadTQ/L6eYgGZE6EKqY
	KRHv2NxMHhwJ+VAaWVlNhmw=
X-Google-Smtp-Source: AK7set/pRhLjmkX3kZ0e7iIkoh876+2/zx2Pie+Qc1BDWwd0vC0JSuB2EqQqHcLpmfkdzBwmHImS1g==
X-Received: by 2002:a19:c219:0:b0:4b5:7096:23ff with SMTP id l25-20020a19c219000000b004b5709623ffmr2907533lfc.66.1677777890248;
        Thu, 02 Mar 2023 09:24:50 -0800 (PST)
Message-ID: <e1cebd6338d9161708267eeac422d77eb768ea4b.camel@gmail.com>
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Thu, 02 Mar 2023 19:24:48 +0200
In-Reply-To: <ab953ad7-0345-ce60-610d-02b6f4b26398@xen.org>
References: 
	<74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
	 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
	 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
	 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
	 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
	 <472fee066070db9cb3c662bf5cc6f8cb681aeb1b.camel@gmail.com>
	 <ab953ad7-0345-ce60-610d-02b6f4b26398@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 14:50 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 02/03/2023 07:34, Oleksii wrote:
> > Hi Julien,
> > > > > On Wed, 2023-03-01 at 16:21 +0000, Julien Grall wrote:
> > > > > > Hi Oleksii,
> > > > > >=20
> > > > > > On 01/03/2023 16:14, Oleksii Kurochko wrote:
> > > > > > > During testing of bug.h's macros generic implementation
> > > > > > > yocto-
> > > > > > > qemuarm
> > > > > > > job crashed with data abort:
> > > > > >=20
> > > > > > The commit message is lacking some information. You are
> > > > > > telling
> > > > > > us
> > > > > > that
> > > > > > there is an error when building with your series, but this
> > > > > > doesn't
> > > > > > tell
> > > > > > me why this is the correct fix.
> > > > > >=20
> > > > > > This is also why I asked to have the xen binary because I
> > > > > > want
> > > > > > to
> > > > > > check
> > > > > > whether this was a latent bug in Xen or your series
> > > > > > effectively
> > > > > > introduce a bug.
> > > > > >=20
> > > > > > Note that regardless what I just wrote this is a good idea
> > > > > > to
> > > > > > align
> > > > > > __proc_info_start. I will try to have a closer look later
> > > > > > and
> > > > > > propose
> > > > > > a
> > > > > > commit message and/or any action for your other series.
> > > > > Regarding binaries please take a look here:
> > > > > https://lore.kernel.org/xen-devel/aa2862eacccfb0574859bf4cda8f499=
2baa5d2e1.camel@gmail.com/
> > > > >=20
> > > > > I am not sure if you get my answer as I had the message from
> > > > > delivery
> > > > > server that it was blocked for some reason.
> > > >=20
> > > > I got the answer. The problem now is gitlab only keep the
> > > > artifact
> > > > for
> > > > the latest build and it only provide a zImage (having the ELF
> > > > would
> > > > be
> > > > easier).
> > > >=20
> > > > I will try to reproduce the error on my end.
> > >=20
> > > I managed to reproduce it. It looks like that after your bug
> > > patch,
> > > *(.rodata.*) will not be end on a 4-byte boundary. Before your
> > > patch,
> > > all the messages will be in .rodata.str. Now they are in
> > > .bug_frames.*,
> > > so there some difference in .rodata.*.
> > >=20
> > > That said, it is not entirely clear why we never seen the issue
> > > before
> > > because my guessing there are no guarantee that .rodata.* will be
> > > suitably aligned.
> > >=20
> > > Anyway, here a proposal for the commit message:
> > >=20
> > > "
> > > xen/arm: Ensure the start *(.proc.info) of is 4-byte aligned
> > >=20
> > > The entries in *(.proc.info) are expected to be 4-byte aligned
> > > and
> > > the
> > > compiler will access them using 4-byte load instructions. On
> > > Arm32,
> > > the
> > > alignment is strictly enforced by the processor and will result
> > > to a
> > > data abort if it is not correct.
> > >=20
> > > However, the linker script doesn't encode this requirement. So we
> > > are
> > > at
> > > the mercy of the compiler/linker to have aligned the previous
> > > sections
> > > suitably.
> > >=20
> > > This was spotted when trying to use the upcoming generic bug
> > > infrastructure with the compiler provided by Yocto.
> > >=20
> > > Link:
> > > https://lore.kernel.org/xen-devel/6735859208c6dcb7320f89664ae298005f7=
0827b.camel@gmail.com/
> > > "
> > >=20
> > > If you are happy with the proposed commit message, then I can
> > > update
> > > it
> > > while committing.
> > I am happy with the proposed commit message.
>=20
> Thanks. With that:
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
> I have addressed Jan's comment and committed the patch.
>=20
Thanks a lot.

Not generic bug feature is unblock.
I'll wait for comments till tomorrow.
If it won't be any that will sent new patch series.

~ Oleksii

