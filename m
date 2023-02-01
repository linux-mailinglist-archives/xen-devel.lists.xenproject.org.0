Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066D16864FB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 12:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488256.756265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNAtt-0002co-99; Wed, 01 Feb 2023 11:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488256.756265; Wed, 01 Feb 2023 11:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNAtt-0002b1-4X; Wed, 01 Feb 2023 11:03:37 +0000
Received: by outflank-mailman (input) for mailman id 488256;
 Wed, 01 Feb 2023 11:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ya+c=55=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pNAtr-0002am-Tk
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 11:03:35 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 123e4fa7-a220-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 12:03:34 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id x7so14040140edr.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 03:03:34 -0800 (PST)
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
X-Inumbo-ID: 123e4fa7-a220-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=63E4bZcnjXxPCZ2oFpyFmXycec1XlTZ7Jkl0VBk2Mvs=;
        b=FPRx/DtSNYaBlMl7IXslAF1yMzYdZ2mGwF7+5h3DkaIZgsPGJV3C57+ey/YSc5LI0W
         5aZ/VK6iDxbgmLjZ1IG609Wg3Ox3Y+52OeLljlw28/ssH7qukoHkfYzbzANbYDE6FTkP
         dx0w6r2+k2b+Bn5czhBtPFb+oVKaYLnLGZOSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63E4bZcnjXxPCZ2oFpyFmXycec1XlTZ7Jkl0VBk2Mvs=;
        b=fQMfvIs8F4g3TNyHGTK7duTBYnrOj/aGN2CMMaw9O0wEDeNU1Abx0MOIR9cS4JIoHw
         1xCChfbQ8brdsGfY7hHduuE+Q1NJRtckXpLoQAz0u0yGcmJCr5HBC9d0A4EUV5zgWR2o
         8xqAI44ydxgidTF/3xtP+37uLgb2FEv1sFXC3LQx6Rqf84hC0mFpg+ZFaLhozKdEXZ8R
         4qk9RW9GpyVXqQwFUiyebW6se2ozNv3BVEWazTpyRBO9cR6OM+zwFSJNR82N98/B2JuH
         zsjt1b8xR2E3qhLnGvlT+9nepWBAq7uuos5QoCej8Wyb8wRaJB8LgVGF56LZ0RGVW3NU
         X9wQ==
X-Gm-Message-State: AO0yUKWl2cUxBf69rgo6zz4/JHUTyeLKKyTW8mp22PBLuI/G7u/mwb2E
	oECq/PEQRHh9/4YMsNNTLLkWo3EfLpQW4OSxJ6mOLw==
X-Google-Smtp-Source: AK7set8EZ4UFaQcUzeYpafO5v2NyXKToIe7pKGbheHfCHGvrOM/seow1TIFQbDVmvF87VXYyK/PEvibLmW2tFIt4t00=
X-Received: by 2002:a05:6402:43c7:b0:4a2:5b0:264 with SMTP id
 p7-20020a05640243c700b004a205b00264mr468915edc.55.1675249414274; Wed, 01 Feb
 2023 03:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20230120220004.7456-1-andrew.cooper3@citrix.com>
 <AS8PR08MB79918B0D0329A2B722B773EB92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9abcfc06-1401-cdb7-a1f1-670cd307a593@srcf.net>
In-Reply-To: <9abcfc06-1401-cdb7-a1f1-670cd307a593@srcf.net>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 1 Feb 2023 11:03:23 +0000
Message-ID: <CA+zSX=ZdQi5RsSUPRTKyY63=--GoXwea-MXyN7xbovKeo9jRug@mail.gmail.com>
Subject: Re: [PATCH] Changelog: Add details about new features for SPR
To: Andrew Cooper <amc96@srcf.net>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="0000000000003f938d05f3a166d1"

--0000000000003f938d05f3a166d1
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 30, 2023 at 3:54 PM Andrew Cooper <amc96@srcf.net> wrote:

> On 27/01/2023 11:40 am, Henry Wang wrote:
> > Hi Andrew,
> >
> >> -----Original Message-----
> >> From: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Subject: [PATCH] Changelog: Add details about new features for SPR
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Thanks for remembering this :)
> >
> > Acked-by: Henry Wang <Henry.Wang@arm.com>
>
> Thanks.
>
> I'll commit this when OSSTest has become unblocked.
>
> >
> >> ---
> >> A reminder to everyone, write the changelog as it happens, rather than
> >> scrambling to remember 8 months of development just as the release is
> >> happening.
> > I wonder if there is a way to automate this in our CI so we can avoid
> > forgetting this. But currently I am not really sure if the solution in
> my mind
> > is simple enough... I will try to keep this issue in my mind so that
> probably I
> > can come back with some solutions.
>
> The automated version is `git log $PREV_RELEASE > changelog.log`, and
> this is very deliberately not that.
>
> It needs the maintainers / committers to keep "interesting user visible
> changes" in mind at some point after the patches have gone in, are
> logically complete, and have been around long enough that major
> catastrophes (i.e. those liable to incur a full revert) are likely to
> have happened.
>
> But I would like to stress.  While it is the Release Maintainer's job to
> make sure this gets done, it is not the Release Maintainers job to write
> it.  That is an unreasonable burden.
>

One approach would be to have someone / something (either the release
manager, or an automated script) periodically (monthly?  Bi-weekly?) email
each maintainer a list of the commits under their remit, with an
encouragement to consider what entries could be added to CHANGELOG.md.
i.e., something like this:

8<---
Dear $MAINTAINER_NAME,

During the last $TIME_PERIOD, the commits below have been checked into the
tree which modify code under your maintainership.  Please ensure that
necessary changes to CHANGELOG.md have also been comitted.

Thanks,
 $SENDER

$GIT_LOG
---->8

Ideally this would prompt maintainers to get into the habit of always
asking for CHANGELOG entries to be added during review (which would also
get developers into the habit of always including them); at which point the
maintainers could just skim the commits in the email and only add he odd
CHANGELOG that they may have forgotten.

Thoughts?

 -George

--0000000000003f938d05f3a166d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 30, 2023 at 3:54 PM Andre=
w Cooper &lt;<a href=3D"mailto:amc96@srcf.net">amc96@srcf.net</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 27/01/2023 =
11:40 am, Henry Wang wrote:<br>
&gt; Hi Andrew,<br>
&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
&gt;&gt; Subject: [PATCH] Changelog: Add details about new features for SPR=
<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@=
citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
&gt; Thanks for remembering this :)<br>
&gt;<br>
&gt; Acked-by: Henry Wang &lt;<a href=3D"mailto:Henry.Wang@arm.com" target=
=3D"_blank">Henry.Wang@arm.com</a>&gt;<br>
<br>
Thanks.<br>
<br>
I&#39;ll commit this when OSSTest has become unblocked.<br>
<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; A reminder to everyone, write the changelog as it happens, rather =
than<br>
&gt;&gt; scrambling to remember 8 months of development just as the release=
 is<br>
&gt;&gt; happening.<br>
&gt; I wonder if there is a way to automate this in our CI so we can avoid<=
br>
&gt; forgetting this. But currently I am not really sure if the solution in=
 my mind<br>
&gt; is simple enough... I will try to keep this issue in my mind so that p=
robably I<br>
&gt; can come back with some solutions.<br>
<br>
The automated version is `git log $PREV_RELEASE &gt; changelog.log`, and<br=
>
this is very deliberately not that.<br>
<br>
It needs the maintainers / committers to keep &quot;interesting user visibl=
e<br>
changes&quot; in mind at some point after the patches have gone in, are<br>
logically complete, and have been around long enough that major<br>
catastrophes (i.e. those liable to incur a full revert) are likely to<br>
have happened.<br>
<br>
But I would like to stress.=C2=A0 While it is the Release Maintainer&#39;s =
job to<br>
make sure this gets done, it is not the Release Maintainers job to write<br=
>
it.=C2=A0 That is an unreasonable burden.<br></blockquote><div><br></div><d=
iv>One approach would be to have someone / something (either the release ma=
nager, or an automated script) periodically (monthly?=C2=A0 Bi-weekly?) ema=
il each maintainer a list of the commits under their remit, with an encoura=
gement to consider what entries could be added to CHANGELOG.md.=C2=A0 i.e.,=
 something like this:</div><div><br></div><div>8&lt;---</div><div>Dear $MAI=
NTAINER_NAME,</div><div><br></div><div>During the last $TIME_PERIOD, the co=
mmits below have been checked into the tree which modify code under your ma=
intainership.=C2=A0 Please ensure that necessary changes to CHANGELOG.md ha=
ve also been comitted.</div><div><br></div><div>Thanks,</div><div>=C2=A0$SE=
NDER</div><div><br></div><div>$GIT_LOG</div><div>----&gt;8</div><div><br></=
div><div>Ideally this would prompt maintainers to get into the habit of alw=
ays asking for CHANGELOG entries to be added during review (which would als=
o get developers into the habit of always including them); at which point t=
he maintainers could just skim the commits in the email and only add he odd=
 CHANGELOG that they may have forgotten.</div><div><br></div><div>Thoughts?=
</div><div><br></div><div>=C2=A0-George</div></div></div>

--0000000000003f938d05f3a166d1--

