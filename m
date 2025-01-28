Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B0A211C0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 19:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878745.1288938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqXr-0004nR-5l; Tue, 28 Jan 2025 18:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878745.1288938; Tue, 28 Jan 2025 18:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqXr-0004ko-2j; Tue, 28 Jan 2025 18:42:43 +0000
Received: by outflank-mailman (input) for mailman id 878745;
 Tue, 28 Jan 2025 18:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcqXp-0004ki-P5
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 18:42:41 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a70c8864-dda7-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 19:42:40 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fdafso11424191a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 10:42:40 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6761172e2sm841486766b.177.2025.01.28.10.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 10:42:39 -0800 (PST)
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
X-Inumbo-ID: a70c8864-dda7-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738089760; x=1738694560; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOrUMY9nkj1EjHcRw20m35r29xoiXkEnufHRAN35Zas=;
        b=K2syxno6YaCiXZO+fuwf+p0ed3rt5MU/xVCdqAaPX9nJZYhWxgOIcwtUbw5Ma4F+Ja
         YxihZxql5fBiOfhdU1/zmxDDUsHR4pond1WqxTp5/Z091asqqph2Kt6WswoXSkd2DZhG
         P+dSIpkoQkFKs+cJ0TBQ44kXRgXf+pI4NtFn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738089760; x=1738694560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOrUMY9nkj1EjHcRw20m35r29xoiXkEnufHRAN35Zas=;
        b=YTASYFu4WuxxkyWQhE9sAVSWsMmtpwuPPUpcSRlMRmCbT6j8g47sRXcOViULTbO6H/
         0kWPyv3QX1Gp/py+Mgs6uK9lnInLbh9meuZPAqu9sxahXeNL1ds1odGIFBo4E39wX3lM
         PJxcMqhisVquLE3LlnuuIeW2gezXrmZcSiMiIpiyGy3cKgAshbEXuAIHdooCEEBVxkwl
         2KrZsU/SwXww14er/lL6eIVfX9XYaruk0nwv6P5CCpueUnM5FLtlA+6B0peEzx/FDSf1
         VMtRp+C4xsMQ4Yc2JbwGr54Q1TBsnqFnY4aDTB2pooXDlwKaE3XQ1VMxtRHSOszIPqY4
         S57g==
X-Gm-Message-State: AOJu0YyL4VHqF0mGePblmpzDnxzpaVGiwTLGjdjnCyFUyj9wcBvZrNzd
	1GDMgeCgKrUslhgeJ+WF+n2hLb4ZL0fKPb+924HgR0am4DCkwnIrvBeXoxLX6wI=
X-Gm-Gg: ASbGncuOcFLKgzPijQ0Etm+j2t+XCFfLaBRVPdG6AFAfuaVs8jdOzf278/yxroltl6x
	SpyCwiDthuGdFj1SqvA9Y69PpENyx1VWDdwEujbqfvwfu5gv7ZkCCwQwoLb0RRSq4TM0oGim+5s
	WjLM7D5MeyehpjXyiKAcj5Rq9SHsU0Pdmt+zC4b5vWtPM02tg8KQncSyksnGHyKk8bvKPQ8lVlo
	L30TO8RQrfAH3G34AFMVe5q22lcavj7lDeptRZpcAfSzYh4C6f3Ovo16Z9QLVpqS1ZGcH2vNK2U
	EVcoY1bVaeCDSjqLXjC4gS95
X-Google-Smtp-Source: AGHT+IGGxavokiZXpj/SGrMZv+nxTfcl0Bk3JzHFo4VdAKx+EwJemsYIVDht+oofWCIMhrbKCn9h+A==
X-Received: by 2002:a17:906:730d:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-ab6cfcc72ccmr19631066b.2.1738089759834;
        Tue, 28 Jan 2025 10:42:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jan 2025 18:42:38 +0000
Message-Id: <D7DXEC0N45CT.2JHUHP1XAVB5F@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/3] tools/hvmloader: Decouple APIC IDs from vCPU IDs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <Z5kXq2RehzyFEYqA@macbook.local>
In-Reply-To: <Z5kXq2RehzyFEYqA@macbook.local>

On Tue Jan 28, 2025 at 5:45 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 28, 2025 at 04:33:39PM +0000, Alejandro Vallejo wrote:
> > The hypervisor, hvmloader and the toolstack currently engage in a share=
d
> > assumption that for every vCPU apicid =3D=3D 2 * vcpuid. This series re=
moves such
> > assumption from hvmloader, by making it read the APIC ID of each vCPU a=
nd
> > storing it for later use.
> >=20
> > The last patch prevents writing an MP Tables should we have vCPUs that =
can not
> > be represented there. That's at the moment dead code because all vCPUs =
are
> > currently representable in 8 bits. This will inavitably stop being true=
 in the
> > future after we increase the maximum number of guest vCPUs.
>
> While I'm fine with the MP Table change, should it also come together
> with a patch that introduces the code to create x2APIC entries in
> libacpi construct_madt() helper? (and bumping the MADT revision, as
> I'm quite sure version 2 didn't have x2APIC entries in the
> specification).

That's a lot more involved though. Matt started something in that direction
last year, but testing it was (and still is) effectively impossible until
HVM_MAX_VCPUS increases.

  https://lore.kernel.org/xen-devel/cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1=
c.1710338145.git.matthew.barnes@cloud.com/

The rest of the topo series can be used to test that (with a hack to
artificially bump the width of thread_id space), I'd rather not test a patc=
h
with a long and still uncommitted series.

>
> Otherwise the MP Table change seems like a red herring, because the
> MADT created by libacpi will also be incorrect and APIC IDs will wrap in
> local APIC entries, just like it would on MP Tables.
>
> Thanks, Roger.

My take is that this is strictly better than what we have today by virtue o=
f
going down from 2 latent bugs to just 1. That said, I don't strictly need i=
t
for the topo series to advance, so it is (in a sense) optional.

A second approach is to gate things differently by preventing legacy BIOS
domains from having APs with APIC IDs >=3D 255 at all. OVMF already has MP =
and
$PIR tables disabled, from what I can see in hvmloader.

Cheers,
Alejandro

