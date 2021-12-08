Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD646CCF0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 06:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242014.418649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mupPQ-0005TD-Mh; Wed, 08 Dec 2021 05:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242014.418649; Wed, 08 Dec 2021 05:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mupPQ-0005QP-J4; Wed, 08 Dec 2021 05:22:28 +0000
Received: by outflank-mailman (input) for mailman id 242014;
 Wed, 08 Dec 2021 05:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CVwg=QZ=cimware.in=skiran@srs-se1.protection.inumbo.net>)
 id 1mupPO-0005QJ-Kb
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 05:22:26 +0000
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d214910a-57e6-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 06:22:23 +0100 (CET)
Received: by mail-io1-xd2e.google.com with SMTP id e128so1613775iof.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Dec 2021 21:22:22 -0800 (PST)
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
X-Inumbo-ID: d214910a-57e6-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cimware-in.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GykUpFrj2gtXFvfJ/e21Z3bLuFVDRCKreR4jZRRR+iM=;
        b=zzuA/zN7/QVfDxxCWZOKTysI6wxW0EAk+DslNCluLMCwOGS/0cxqs9UslOVvqn2dgt
         ytXmJ+DQuM2BX2vE/nMrVrwMv+6CItR9Mz1/qjEpv6nO3GHYRDm079mtEC+faGUJy3Oo
         d9ZXRyP7DmOaI+ko+qAlvSHH3FRTTs4lzX+HdWbQgPXeKrtl8wgDT4iWxHyWSuA8NHev
         8Siz4QhZOu6HP6ZXmy4xIUHq0oRO5nDAKzqiYvZ74ZMR4FKzfs2CQLmwb3FZB060DMeh
         FoX60pXRt5s5k1HavWfkKjkgPa02Ek98KJnGdojYsAbVbO8pdRWNo4iGIlUuT/uAhS4X
         oOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GykUpFrj2gtXFvfJ/e21Z3bLuFVDRCKreR4jZRRR+iM=;
        b=dAEXcPMbFb28QWYjFpsD8JRrGkJeVC1TgaUmKsOcJshr1YwjhkiwTE7m1WPlrf6FIF
         31BV67r/gPr8rIPHjYZ4+3EaCmPs/urEfhJgsnV2mjF+8Y1bBsRH5fzGHJ3UjcFddN8c
         k1HGUQJ1VQjY2DFEXZpEn28XPa7IOdjMVZKnDXqSVJ1to7sKsv1G74h3AK39HnlvO6O+
         xb4o+SuLw81533+HNUaZXM/lJlaa9LWE2bOPh81lMbfItIILoUO4TP+TZpMhNK8ojltF
         ALYt6QLZFwtl8WTytSDogeMaBlOmSBGvAoH8Q5Clu8cSRp+iRTxR/ydZ7itze7WQOv5E
         iAmQ==
X-Gm-Message-State: AOAM530hDSMwzx+HDhXfDEMEbFn76Je4EhV22cgYuEyWZiL+D3k1ZtUC
	fneqfWa1iI+Ln3auMBzRgpWva05zD1UwDcBs76QvaSQN5g==
X-Google-Smtp-Source: ABdhPJxBEMO3IxPO3ulzl+2bm0yMY70WVC5dck3fU83AKvTu10u3vmd9McgA4sEvtjXD+CS3LoijuhnYxoG1t44Wj/Y=
X-Received: by 2002:a05:6638:3a4:: with SMTP id z4mr57254606jap.76.1638940941611;
 Tue, 07 Dec 2021 21:22:21 -0800 (PST)
MIME-Version: 1.0
References: <CAAQMfLr_mWgdM3v=smYZbx+t8zhCP7_aCecDPJLLGRu=MH9E0A@mail.gmail.com>
 <e421fc4b-afde-8bdc-9be0-859523512b9b@suse.com> <CAAQMfLrxpc=6L_mp_EuPq-B+EydrFGaVqb_MiyjELPQYXi0e=g@mail.gmail.com>
In-Reply-To: <CAAQMfLrxpc=6L_mp_EuPq-B+EydrFGaVqb_MiyjELPQYXi0e=g@mail.gmail.com>
From: Sai Kiran Kumar Reddy <skiran@cimware.in>
Date: Wed, 8 Dec 2021 10:52:10 +0530
Message-ID: <CAAQMfLrv_nL_w-VbjSypnY1Ptbe-K_Gq71ovVf5o1nDqwM9cgg@mail.gmail.com>
Subject: Re: Xen on LFS
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a205c505d29bac05"

--000000000000a205c505d29bac05
Content-Type: text/plain; charset="UTF-8"

Hi,

I have posted my query in xen-users mailing list one week ago. I was not
able to get any response from the community. Could you please look into it
and help me out here? I am trying to install xen(from source code), on
LInux from Scratch build system. I just want to know the list of xorg
packages, to be installed for Xen.

Thanks in advance for your time and support.

Regards,
Sai Kiran.

On Tue, Nov 30, 2021 at 12:58 PM Sai Kiran Kumar Reddy <skiran@cimware.in>
wrote:

> Ok, thanks for the reply. Will do that.
>
> On Tue, Nov 30, 2021 at 12:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>
>> On 30.11.2021 07:50, Sai Kiran Kumar Reddy wrote:
>> > I am Sai Kiran. I am currently working on installing xen on Linux From
>> > Scratch(LFS) system. One of the dependencies of xen is "xorg" package.
>> This
>> > package is present in Beyond
>> > <https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html> Linux
>> From
>> > Scratch(BLFS) <
>> https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.html>
>> > manual. But, there are a lot of packages to be installed. I am not sure
>> if
>> > all these packages are required for Xen. Also, is xorg a must, to build
>> and
>> > install xen?
>> >
>> > Kindly help me out here. Thanks in advance, for the support.
>>
>> Thanks for your interest, but I'm afraid your question isn't fitting
>> xen-devel.
>> Please raise it on xen-users.
>>
>> Jan
>>
>>

--000000000000a205c505d29bac05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have =
posted my query in xen-users mailing list one week ago. I was not able to g=
et any response from the community. Could you please look into it and help =
me out here? I am trying to install xen(from source code), on LInux from Sc=
ratch build system. I just want to know the list of xorg packages, to be in=
stalled for Xen.<br></div><div><br></div><div>Thanks in advance for your ti=
me and support.</div><div><br></div><div>Regards,</div><div>Sai Kiran.<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Nov 30, 2021 at 12:58 PM Sai Kiran Kumar Reddy &lt;<a href=3D"=
mailto:skiran@cimware.in">skiran@cimware.in</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Ok, thanks for =
the reply. Will do that.<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at 12:52 PM Jan Beulich =
&lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 30.11.2021 07:50, Sai Kiran Kumar Reddy wrote:<br>
&gt; I am Sai Kiran. I am currently working on installing xen on Linux From=
<br>
&gt; Scratch(LFS) system. One of the dependencies of xen is &quot;xorg&quot=
; package. This<br>
&gt; package is present in Beyond<br>
&gt; &lt;<a href=3D"https://www.linuxfromscratch.org/blfs/view/svn/x/xorg7.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.linuxfromscratch.org=
/blfs/view/svn/x/xorg7.html</a>&gt; Linux From<br>
&gt; Scratch(BLFS) &lt;<a href=3D"https://www.linuxfromscratch.org/blfs/vie=
w/svn/x/xorg7.html" rel=3D"noreferrer" target=3D"_blank">https://www.linuxf=
romscratch.org/blfs/view/svn/x/xorg7.html</a>&gt;<br>
&gt; manual. But, there are a lot of packages to be installed. I am not sur=
e if<br>
&gt; all these packages are required for Xen. Also, is xorg a must, to buil=
d and<br>
&gt; install xen?<br>
&gt; <br>
&gt; Kindly help me out here. Thanks in advance, for the support.<br>
<br>
Thanks for your interest, but I&#39;m afraid your question isn&#39;t fittin=
g xen-devel.<br>
Please raise it on xen-users.<br>
<br>
Jan<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000a205c505d29bac05--

