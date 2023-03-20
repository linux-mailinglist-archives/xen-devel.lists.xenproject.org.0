Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C76C2064
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 19:52:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512085.791730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKbn-0000iD-G6; Mon, 20 Mar 2023 18:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512085.791730; Mon, 20 Mar 2023 18:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peKbn-0000f7-DJ; Mon, 20 Mar 2023 18:51:51 +0000
Received: by outflank-mailman (input) for mailman id 512085;
 Mon, 20 Mar 2023 18:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4LM=7M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1peKbl-0000f1-RK
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 18:51:49 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id 42bec707-c750-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 19:51:48 +0100 (CET)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176]) by
 bf63b0cb016b with SMTP id 6418ab3f85ccd20ed5e02b59 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 20 Mar 2023 18:51:43 GMT
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-541a05e4124so240895617b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 11:51:43 -0700 (PDT)
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
X-Inumbo-ID: 42bec707-c750-11ed-87f5-c1b5be75604c
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1679338303; x=1679345503; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=Vx9rvlCpMmPqNkWDhSmWbEotSXnq3MI9J8H6DNWuZv8=;
 b=yC5v8aa6DtnV7/d/frbd4LHKhl5skxvrczzzUK4+aGIVXQzpGPm3pjPLQhV7MFrMevbrvtGv7yazVBquUANjI/e6wksbaIo6OM6rDLNl0plcH/1MGaaTGPRW2/5gPphZvRYBKklGy/SmnMzkgjHd4Z2I/C5h5M9eVxnCrgYQV7SAxk60pFZBcLSaBR0YQ3Tu0nh30PTsMBd8PUImHbAtU/4rslFWbO6561b2S6VqCq6h7ASqkCsBERtLJzVbdys4cG4VzoKCuonNQ5+w3wUIxHXnfCyQcohpzXGx22Ehk4mhaGBARHRPbZ2Yqop7HLMIOk2o7JDO2GXkAxjCNvRyjA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AO0yUKVJFevaFCH98WdNRS6DWSq9qzupeve0SGai/QWMmAAKH1xmtjmE
	ZwFEJ4kXjtGxHptRCDbAG9owIiqRBIa7vEpB7/U=
X-Google-Smtp-Source: AK7set88vnkr4x/+KCSzP3U/mlHYM4D2UP4wt5zk9HLSIoW7JELoZKPLsVakG+r+g4xLZMHjrlRaWWumeS6ztPP5m7M=
X-Received: by 2002:a81:b649:0:b0:541:8995:5334 with SMTP id
 h9-20020a81b649000000b0054189955334mr10726914ywk.3.1679338303187; Mon, 20 Mar
 2023 11:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
In-Reply-To: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Mar 2023 18:51:06 -0400
X-Gmail-Original-Message-ID: <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
Message-ID: <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Content-Type: multipart/alternative; boundary="00000000000004f28205f7596b04"

--00000000000004f28205f7596b04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=
=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru> wrote:
>
> gva_to_gfn command used for fast address translation in LibVMI project.
> With such a command it is possible to perform address translation in
> single call instead of series of queries to get every page table.

You have a couple assumptions here:
 - Xen will always have a direct map of the entire guest memory - there are
already plans to move away from that. Without that this approach won't have
any advantage over doing the same mapping by LibVMI
 - LibVMI has to map every page for each page table for every lookup - you
have to do that only for the first, afterwards the pages on which the
pagetable is are kept in a cache and subsequent lookups would be actually
faster then having to do this domctl since you can keep being in the same
process instead of having to jump to Xen.

With these perspectives in mind I don't think this would be a useful
addition. Please prove me wrong with performance numbers and a specific
use-case that warrants adding this and how you plan to introduce it into
LibVMI without causing performance regression to all other use-cases.

Tamas

--00000000000004f28205f7596b04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=
=BE=D0=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 &lt;=
<a href=3D"mailto:valor@list.ru">valor@list.ru</a>&gt; wrote:<br>&gt;<br>&g=
t; gva_to_gfn command used for fast address translation in LibVMI project.<=
br>&gt; With such a command it is possible to perform address translation i=
n<br>&gt; single call instead of series of queries to get every page table.=
<br><div><br></div><div>You have a couple assumptions here:</div><div>=C2=
=A0- Xen will always have a direct map of the entire guest memory - there a=
re already plans to move away from that. Without that this approach won&#39=
;t have any advantage over doing the same mapping by LibVMI<br></div><div>=
=C2=A0- LibVMI has to map every page for each page table for every lookup -=
 you have to do that only for the first, afterwards the pages on which the =
pagetable is are kept in a cache and subsequent lookups would be actually f=
aster then having to do this domctl since you can keep being in the same pr=
ocess instead of having to jump to Xen.<br></div><div><br></div><div>With t=
hese perspectives in mind I don&#39;t think this would be a useful addition=
. Please prove me wrong with performance numbers and a specific use-case th=
at warrants adding this and how you plan to introduce it into LibVMI withou=
t causing performance regression to all other use-cases.<br></div><div><br>=
</div><div>Tamas<br></div></div>

--00000000000004f28205f7596b04--

