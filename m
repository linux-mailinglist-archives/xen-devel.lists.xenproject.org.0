Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF4406946
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 11:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184198.332762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOd5z-0008DC-DD; Fri, 10 Sep 2021 09:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184198.332762; Fri, 10 Sep 2021 09:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOd5z-0008A8-9s; Fri, 10 Sep 2021 09:45:19 +0000
Received: by outflank-mailman (input) for mailman id 184198;
 Fri, 10 Sep 2021 09:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6wo=OA=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1mOd5x-0008A2-SH
 for xen-devel@lists.xen.org; Fri, 10 Sep 2021 09:45:17 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b72956e5-a275-42c7-a525-f0065cfe5a4e;
 Fri, 10 Sep 2021 09:45:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so978485wms.5
 for <xen-devel@lists.xen.org>; Fri, 10 Sep 2021 02:45:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o2sm4476233wrh.13.2021.09.10.02.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 02:45:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88D361FF96;
 Fri, 10 Sep 2021 10:45:13 +0100 (BST)
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
X-Inumbo-ID: b72956e5-a275-42c7-a525-f0065cfe5a4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=tdlZIRZ4LUXk5hXsKmMnfmEHeHorw3simqIdNCqbaxI=;
        b=jR6p+yz2FoXpA8HUJmOWuxRpfnVCKoHfuGCdBrsN0SyVmQJzoGqIOroWJI5il33Hg1
         QJFKBvetQfZS5D2nfd5x+M+MYUNd+/im3OALF+77BFenByFCrH8SB21h6b/ewcfZZRxp
         DJH5aRimkU+/Oh39oULZAsiAR1zqZvioU73pm76d8Znve9sVc9MXdd/n1D7fdf5MlKG5
         RRmgw5oPM5k0sJ6RpNXQQeg9OmE9ay2sYVv61teqWLBbB6yuBljxbtHZP3837x2BlWuQ
         r74BU/1AEdqXcwrCty2iCX7tcW9kOABMLEEEJgGByIqdSttI2nlYIr+bIwmtKKgYu9+o
         PtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=tdlZIRZ4LUXk5hXsKmMnfmEHeHorw3simqIdNCqbaxI=;
        b=WTqiRRivuvARSa6yDrwrc15Ls6t6u84AkHVcynmvDPY7mKgOVXrnGOkL+kFQL/lD4z
         xh3NGQaTNP8PImGMqc0RWl29EJ1x6dzPUCuv2WPowuS2f2Drl75rlNBq1tXWSYIDfPjm
         I5J//7o2pZvbFA7Ax1MWfe0aioNsb1Xs0mSHWMxLCkindqiCyYQ9AObJl4Ds5ACdDSNf
         s/XlLLBc96yQUUZDXKcelX4UiUpe6LpkVw9fJ6FrJwMU3cgX1RDYcqjFwcxZbyVe+SEY
         YNo4kROXsKzaFg2HtolSSYHMOO0VVWsQe3uoQlPiubHICv0jVnZgP/oSWGn8Hq/S+5aj
         yQDw==
X-Gm-Message-State: AOAM533J63bqGaFa7pQ8outB+f+z7Dg1KSQravsIXJ1KxZoUMKoeXbP9
	5sMfOoG2dhmQAleKMIv1vj1ntw==
X-Google-Smtp-Source: ABdhPJwjpuFNSXiF9a/KjwI4ZM9kqVvk3d/Ut+zQ7ShetXeWPEEts2okaL73vNcnh0ZVbxhLKuAC0Q==
X-Received: by 2002:a05:600c:19cb:: with SMTP id u11mr7060905wmq.16.1631267115491;
        Fri, 10 Sep 2021 02:45:15 -0700 (PDT)
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain> <875yvkh1p1.fsf@linaro.org>
 <20210903080609.GD47953@laputa> <87czpqq9qu.fsf@linaro.org>
 <20210906022356.GD40187@laputa>
 <CACMJ4GaJyAnguzAEH87DSNN_+GhEa5jRbw11hVj-yWMAXx8V7w@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>, Wei Chen
 <Wei.Chen@arm.com>, Paul Durrant <paul@xen.org>, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, virtio-dev@lists.oasis-open.org,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Kiszka
 <jan.kiszka@siemens.com>, Arnd Bergmann <arnd.bergmann@linaro.org>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Carl van
 Schaik <cvanscha@qti.qualcomm.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefan Hajnoczi <stefanha@redhat.com>, Artem
 Mygaiev <Artem_Mygaiev@epam.com>, Xen-devel <xen-devel@lists.xen.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Oleksandr Tyshchenko
 <Oleksandr_Tyshchenko@epam.com>, Elena Afanasova <eafanasova@gmail.com>,
 James McKenzie <james@bromium.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Rich Persaud <persaur@gmail.com>, Daniel
 Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>,
 eric chanudet <eric.chanudet@gmail.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [Stratos-dev] Enabling hypervisor agnosticism for VirtIO backends
Date: Fri, 10 Sep 2021 10:35:52 +0100
In-reply-to: <CACMJ4GaJyAnguzAEH87DSNN_+GhEa5jRbw11hVj-yWMAXx8V7w@mail.gmail.com>
Message-ID: <87o890wyqe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Christopher Clark <christopher.w.clark@gmail.com> writes:

> On Sun, Sep 5, 2021 at 7:24 PM AKASHI Takahiro via Stratos-dev <stratos-d=
ev@op-lists.linaro.org> wrote:
>
>  Alex,
>
>  On Fri, Sep 03, 2021 at 10:28:06AM +0100, Alex Benn??e wrote:
<snip>
>
>  In configuration phase of virtio device, the latency won't be a big matt=
er.
>  In device operations (i.e. read/write to block devices), if we can
>  resolve 'mmap' issue, as Oleksandr is proposing right now, the only issu=
e is
>  how efficiently we can deliver notification to the opposite side. Right?
>  And this is a very common problem whatever approach we would take.
>
>  Anyhow, if we do care the latency in my approach, most of virtio-proxy-
>  related code can be re-implemented just as a stub (or shim?) library
>  since the protocols are defined as RPCs.
>  In this case, however, we would lose the benefit of providing "single bi=
nary"
>  BE.
>  (I know this is is an arguable requirement, though.)

The proposal for a single binary would always require something to shim
between hypervisors. This is still an area of discussion though. Having
a compile time selectable approach is practically unavoidable for "bare
metal" backends though because there are no other processes/layers that
communication with the hypervisor can be delegated to.

>
>  # Would we better discuss what "hypervisor-agnosticism" means?
>
> Is there a call that you could recommend that we join to discuss this and=
 the topics of this thread?
> There is definitely interest in pursuing a new interface for Argo that ca=
n be implemented in other hypervisors and enable guest binary
> portability between them, at least on the same hardware architecture,
> with VirtIO transport as a primary use case.

There is indeed ;-)

We have a regular open call every two week for the Stratos project which
you are welcome to attend. You can find the details on the project
overview page:

  https://linaro.atlassian.net/wiki/spaces/STR/overview

we regularly have teams from outside the project present their work as well.

> The notes from the Xen Summit Design Session on VirtIO Cross-Project BoF =
for Xen and Guest OS, which include context about the
> several separate approaches to VirtIO on Xen, have now been posted here:
> https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg00472.html

Thanks for the link - looks like a very detailed summary.

>
> Christopher
>
>=20=20
>  -Takahiro Akashi


--=20
Alex Benn=C3=A9e

