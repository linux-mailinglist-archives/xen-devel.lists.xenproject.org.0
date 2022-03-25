Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9064E7214
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 12:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294671.501147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhvW-0004sr-6K; Fri, 25 Mar 2022 11:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294671.501147; Fri, 25 Mar 2022 11:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhvW-0004r1-2r; Fri, 25 Mar 2022 11:16:18 +0000
Received: by outflank-mailman (input) for mailman id 294671;
 Fri, 25 Mar 2022 11:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ci4N=UE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nXhvV-0004qv-5y
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 11:16:17 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faee84b0-ac2c-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 12:16:15 +0100 (CET)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id 69C5418000AD
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 07:16:12 -0400 (EDT)
Received: from mail-oa1-f46.google.com (unknown [10.20.151.173])
 by mta-09.privateemail.com (Postfix) with ESMTPA id 441A418000A8
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 07:16:12 -0400 (EDT)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso7834721fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 04:16:12 -0700 (PDT)
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
X-Inumbo-ID: faee84b0-ac2c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648206972;
	bh=ulXEKnSQrOQUY7+s3N9paGkubHNA0yFhq/yYAGK5miw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UsR9c5/CUi6giYWUuhPsJd+1MEUda1W7GqR24UPD0/OySRL6gZJDZTRLeOqNM4+Hl
	 G9Kf4En26fRq0FksUf4L+tRzqXNt0sD8L4kF5fDJwoP6eBmiDh8xYaWBMll0fqMxSH
	 bp9pZu1aihqLwKsSYZ3icCHJlrYWj8BD47c2ji1/T0dMkXro4nd5RnbuusSU8zBL4M
	 8GL9t4rUL+Z074UAierCmlxcdDAHC+WF1crgdT8TMuBccHGgz0afCvfwoAeUywNyz5
	 Zw+4HAIzVw11rvMHJBSpZ4Gd1hX0jm6tk0jxRajdpipgNz3QLifaWU2ubLveEEPds2
	 VZ4xxPW786Ccw==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648206972;
	bh=ulXEKnSQrOQUY7+s3N9paGkubHNA0yFhq/yYAGK5miw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UsR9c5/CUi6giYWUuhPsJd+1MEUda1W7GqR24UPD0/OySRL6gZJDZTRLeOqNM4+Hl
	 G9Kf4En26fRq0FksUf4L+tRzqXNt0sD8L4kF5fDJwoP6eBmiDh8xYaWBMll0fqMxSH
	 bp9pZu1aihqLwKsSYZ3icCHJlrYWj8BD47c2ji1/T0dMkXro4nd5RnbuusSU8zBL4M
	 8GL9t4rUL+Z074UAierCmlxcdDAHC+WF1crgdT8TMuBccHGgz0afCvfwoAeUywNyz5
	 Zw+4HAIzVw11rvMHJBSpZ4Gd1hX0jm6tk0jxRajdpipgNz3QLifaWU2ubLveEEPds2
	 VZ4xxPW786Ccw==
X-Gm-Message-State: AOAM532gHeuqq+1zSsq9jiXCYsZCFAOSOjgIq5ouHv7bfTbbclmhUBKA
	+TLuUPUsLYT/AUY7plafhQv1S+RQIQqpXXZ2VPo=
X-Google-Smtp-Source: ABdhPJwaYWE5jGstPkv5sS9ahD1gC2WIvIuFcmzF6Hn49hBy5mdwQ5AEWAbQgUa4C9yhWXQh9fw3Mt3egf4+8G9s+hA=
X-Received: by 2002:a05:6870:b250:b0:de:afd3:e1c4 with SMTP id
 b16-20020a056870b25000b000deafd3e1c4mr859405oam.128.1648206971685; Fri, 25
 Mar 2022 04:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <Yj2ggiWlxvYdh1dJ@Air-de-Roger>
In-Reply-To: <Yj2ggiWlxvYdh1dJ@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 25 Mar 2022 07:15:59 -0400
X-Gmail-Original-Message-ID: <CABfawhkeRENvEJHtXCxME08eMjjAGNVdcBK8ExxgcXY=SzXStA@mail.gmail.com>
Message-ID: <CABfawhkeRENvEJHtXCxME08eMjjAGNVdcBK8ExxgcXY=SzXStA@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000104eb905db0917ec"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000104eb905db0917ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022, 6:59 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:

> On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> > Add option to the fork memop to skip populating the fork with special
> pages.
> > These special pages are only necessary when setting up forks to be full=
y
> > functional with a toolstack. For short-lived forks where no toolstack i=
s
> active
> > these pages are uneccesary.
>
> Replying here because there's no cover letter AFAICT.
>
> For this kind of performance related changes it would be better if you
> could provide some figures about the performance impact. It would help
> if we knew whether avoiding mapping the vAPIC page means you can
> create 0.1% more forks per-minute or 20%.
>
> If you really want to speed up the forking path it might be good to start
> by perf sampling Xen in order to find the bottlenecks?
>

Sure but for experiment systems I don't think its necessary to collect that
data.

There is also a non-performance reason why we want to keep special pages
from being populated, in cases we really want the forks physmap to start
empty for better control over its state. There was already a case where
having special pages mapped in ended up triggering unexpected Xen behaviors
leading to chain of events not easy to follow. For example if page 0 gets
brought in while the vCPU is being created it ends up as a misconfigured
ept entry if nested virtualization is enabled. That leads to ept
misconfiguration exits instead of epf faults. Simply enforcing no entry in
the physmap until forking is complete eliminates the chance of something
like that happening again and makes reasoning about the VM's behavior from
the start easier.

Tamas

>

--000000000000104eb905db0917ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Mar 25, 2022, 6:59 AM Roger Pau Monn=C3=A9 &lt=
;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, Mar 22, 2022 at 01:41:37P=
M -0400, Tamas K Lengyel wrote:<br>
&gt; Add option to the fork memop to skip populating the fork with special =
pages.<br>
&gt; These special pages are only necessary when setting up forks to be ful=
ly<br>
&gt; functional with a toolstack. For short-lived forks where no toolstack =
is active<br>
&gt; these pages are uneccesary.<br>
<br>
Replying here because there&#39;s no cover letter AFAICT.<br>
<br>
For this kind of performance related changes it would be better if you<br>
could provide some figures about the performance impact. It would help<br>
if we knew whether avoiding mapping the vAPIC page means you can<br>
create 0.1% more forks per-minute or 20%.<br>
<br>
If you really want to speed up the forking path it might be good to start<b=
r>
by perf sampling Xen in order to find the bottlenecks?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure but for experime=
nt systems I don&#39;t think its necessary to collect that data.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">There is also a non-performance re=
ason why we want to keep special pages from being populated, in cases we re=
ally want the forks physmap to start empty for better control over its stat=
e. There was already a case where having special pages mapped in ended up t=
riggering unexpected Xen behaviors leading to chain of events not easy to f=
ollow. For example if page 0 gets brought in while the vCPU is being create=
d it ends up as a misconfigured ept entry if nested virtualization is enabl=
ed. That leads to ept misconfiguration exits instead of epf faults. Simply =
enforcing no entry in the physmap until forking is complete eliminates the =
chance of something like that happening again and makes reasoning about the=
 VM&#39;s behavior from the start easier.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Tamas</div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000104eb905db0917ec--

