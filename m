Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620A737EFA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 11:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552579.862730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBu8M-00017E-AS; Wed, 21 Jun 2023 09:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552579.862730; Wed, 21 Jun 2023 09:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBu8M-00015V-7E; Wed, 21 Jun 2023 09:28:14 +0000
Received: by outflank-mailman (input) for mailman id 552579;
 Wed, 21 Jun 2023 09:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2n=CJ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBu8K-00015O-4U
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 09:28:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efb3319a-1015-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 11:28:09 +0200 (CEST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 9A3BC4EE0743
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 11:28:09 +0200 (CEST)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-4714e9f070bso1781648e0c.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 02:28:09 -0700 (PDT)
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
X-Inumbo-ID: efb3319a-1015-11ee-8611-37d641c3527e
X-Gm-Message-State: AC+VfDyyuE4hp6quSUgs+5+p4eYZ/2xeylaApHk0kVKUpL0FyKKMpV0P
	e6yeazvnijUmbBHQp9gKR30KEvrAdnFJB12uNM4=
X-Google-Smtp-Source: ACHHUZ4kliDfAvsM8ueGz91gI7mIFjQG0yEdJKlux3xhFeoS6+hAT4BqWb3bifcRgXQ3rHIRPthyMD9aTVyaxpNE5QE=
X-Received: by 2002:a1f:db42:0:b0:46e:7558:a45c with SMTP id
 s63-20020a1fdb42000000b0046e7558a45cmr4866734vkg.8.1687339688358; Wed, 21 Jun
 2023 02:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com>
 <6d6708de-7afb-963c-65ae-3656fc755ad6@suse.com> <alpine.DEB.2.22.394.2306201354010.897208@ubuntu-linux-20-04-desktop>
 <23a79e33-ac20-6b76-335f-102479a4db91@suse.com>
In-Reply-To: <23a79e33-ac20-6b76-335f-102479a4db91@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 21 Jun 2023 11:27:57 +0200
X-Gmail-Original-Message-ID: <CAFHJcJvESw96m6FtCbRg2KUtiXfkvDeKmcJdzRpBbnc48ybTvA@mail.gmail.com>
Message-ID: <CAFHJcJvESw96m6FtCbRg2KUtiXfkvDeKmcJdzRpBbnc48ybTvA@mail.gmail.com>
Subject: Re: [XEN PATCH 06/13] xen/efi: fixed violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
	Gianluca Luparini <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000bd7be605fea0626d"

--000000000000bd7be605fea0626d
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 21 giu 2023 alle ore 09:06 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 20.06.2023 22:56, Stefano Stabellini wrote:
> > On Tue, 20 Jun 2023, Jan Beulich wrote:
> >> On 20.06.2023 12:34, Simone Ballarin wrote:
> >>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> >>>
> >>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> >>> "A "u" or "U" suffix shall be applied to all integer constants that
> are represented in an unsigned type".
> >>>
> >>> I propose to use "U" as a suffix to explicitly state when an integer
> constant is represented in an unsigned type.
> >>> For homogeneity, I also added the "U" suffix in some cases that the
> tool didn't report as violations.
> >>>
> >>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> >>> ---
> >>>  xen/arch/x86/include/asm/x86_64/efibind.h | 10 +++++-----
> >>
> >> This file as well as ...
> >>
> >>>  xen/common/efi/boot.c                     |  8 ++++----
> >>>  xen/common/efi/runtime.c                  |  2 +-
> >>>  xen/include/efi/efiapi.h                  | 10 +++++-----
> >>>  xen/include/efi/efidef.h                  |  2 +-
> >>>  xen/include/efi/efiprot.h                 | 22 +++++++++++-----------
> >>
> >> ... the last three here are imported from the gnu-efi package. I'm wary
> >> of touching them, and thus getting them more out of sync with their
> >> original than strictly necessary. To allow the other changes to go in
> >> no matter what, I'd like to suggest splitting the patch.
> >
> > Should we add either those files individually or the directory
> > xen/include/efi (plus xen/arch/x86/include/asm/x86_64/efibind.h) to
> > docs/misra/exclude-list.json ?
>
> Probably, and in the former case imo the entire directory.
>
> Jan
>

Ok, I will remove all the changes in the "xen/include/efi" directory and
"xen/arch/x86/include/asm/x86_64/efibind.h".
-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000bd7be605fea0626d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 21 giu 2023 alle ore 09=
:06 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com<=
/a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 20.06.2023 22:56, Stefano Stabellini wrote:<br>
&gt; On Tue, 20 Jun 2023, Jan Beulich wrote:<br>
&gt;&gt; On 20.06.2023 12:34, Simone Ballarin wrote:<br>
&gt;&gt;&gt; From: Gianluca Luparini &lt;<a href=3D"mailto:gianluca.luparin=
i@bugseng.com" target=3D"_blank">gianluca.luparini@bugseng.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The xen sources contains violations of MISRA C:2012 Rule 7.2 w=
hose headline states:<br>
&gt;&gt;&gt; &quot;A &quot;u&quot; or &quot;U&quot; suffix shall be applied=
 to all integer constants that are represented in an unsigned type&quot;.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I propose to use &quot;U&quot; as a suffix to explicitly state=
 when an integer constant is represented in an unsigned type.<br>
&gt;&gt;&gt; For homogeneity, I also added the &quot;U&quot; suffix in some=
 cases that the tool didn&#39;t report as violations.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Simone Ballarin &lt;<a href=3D"mailto:simone.ba=
llarin@bugseng.com" target=3D"_blank">simone.ballarin@bugseng.com</a>&gt;<b=
r>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 xen/arch/x86/include/asm/x86_64/efibind.h | 10 +++++----=
-<br>
&gt;&gt;<br>
&gt;&gt; This file as well as ...<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 xen/common/efi/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt;&gt;&gt;=C2=A0 xen/common/efi/runtime.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt;&gt;=C2=A0 xen/include/efi/efiapi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;&gt;&gt;=C2=A0 xen/include/efi/efidef.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt;&gt;=C2=A0 xen/include/efi/efiprot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++-----------<br>
&gt;&gt;<br>
&gt;&gt; ... the last three here are imported from the gnu-efi package. I&#=
39;m wary<br>
&gt;&gt; of touching them, and thus getting them more out of sync with thei=
r<br>
&gt;&gt; original than strictly necessary. To allow the other changes to go=
 in<br>
&gt;&gt; no matter what, I&#39;d like to suggest splitting the patch.<br>
&gt; <br>
&gt; Should we add either those files individually or the directory<br>
&gt; xen/include/efi (plus xen/arch/x86/include/asm/x86_64/efibind.h) to<br=
>
&gt; docs/misra/exclude-list.json ?<br>
<br>
Probably, and in the former case imo the entire directory.<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all">Ok, I will remove all the changes in t=
he &quot;xen/include/efi&quot; directory and &quot;xen/arch/x86/include/asm=
/x86_64/efibind.h&quot;.<br><span class=3D"gmail_signature_prefix">-- </spa=
n><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Simone Ba=
llarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG (<a href=3D"h=
ttp://bugseng.com" target=3D"_blank">https://bugseng.com</a>)</div></div></=
div></div>

--000000000000bd7be605fea0626d--

