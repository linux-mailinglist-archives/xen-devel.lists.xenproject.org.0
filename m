Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF1675AAE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 18:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482021.747312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIumW-0001MH-OQ; Fri, 20 Jan 2023 17:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482021.747312; Fri, 20 Jan 2023 17:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIumW-0001K4-Le; Fri, 20 Jan 2023 17:02:24 +0000
Received: by outflank-mailman (input) for mailman id 482021;
 Fri, 20 Jan 2023 17:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6CDk=5R=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pIumV-0001Jy-H3
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 17:02:23 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34bc3a7a-98e4-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 18:02:22 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id x10so7485165edd.10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 09:02:22 -0800 (PST)
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
X-Inumbo-ID: 34bc3a7a-98e4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/reDGfLQUDu+XX9ekjpDd8Mv6YCEE5/O+FBfPa46zo=;
        b=CW//LJmHlo/DnU1omjb5W5cyEhO1E67hO2RQcJljiWNblOB5PGWdkob4XYkd2MIAoR
         /Xcjhy9LU40Wnr8jeJLFvNpFSC/t5uIfhxdq+dZbg+jCVnbKlHRPEUdzarQEQFINPzfL
         qMJhXvT6AaBZr/YjWFjn7PspxsQWkXarjt4jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/reDGfLQUDu+XX9ekjpDd8Mv6YCEE5/O+FBfPa46zo=;
        b=wYr+TLVg8KQ/Mi7ISzV5IQa36zc1H3j4MXROgKM6vLoLjvSgqst+p9Qyj63b+V+OfJ
         Cxh2a6v0c9X+Pq3XCA1oYv6tclZhz2g1uUjg6ewgvZJ/Zo6Wv1OPRP3Ka/eQaHK6MHCP
         CWlBS86d42VtxgEQUH5qfL6X4WFX+1IwrpgSgFT+V1+gL18LF9OluI/u33lw94hbaLHm
         xWnNQJi9kgzJOtZJ0nNNy44GMyFEBl0cOxN3vqPwwStgxW6f9J0dAzodZ+kJC4Lp03W7
         l3TqKpoBGfcZF5yo19xlyvR0XyeFKjUji0poqfQhc1wVa22Ph8xL+SLaW8haqeWVCSxZ
         TPjA==
X-Gm-Message-State: AFqh2koop9Adh7yujLtspW5i2c2WDoGID3LjTShQnicgtdP711nZvb1e
	/3xV8AqnMcN5FY1tccZskjs+HvQbxrX7Fn8DYkKHrA==
X-Google-Smtp-Source: AMrXdXuxL2yfe5gt2d0Y/WkhfgT5bASVojcep7tLJZNOLYPZpUMZpngFWW0bn8AVQQRgWeFSEkfq7p0uB82yW8lsx6U=
X-Received: by 2002:aa7:db8b:0:b0:496:e060:44ff with SMTP id
 u11-20020aa7db8b000000b00496e06044ffmr1787457edt.226.1674234142096; Fri, 20
 Jan 2023 09:02:22 -0800 (PST)
MIME-Version: 1.0
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com> <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
In-Reply-To: <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 20 Jan 2023 17:02:11 +0000
Message-ID: <CA+zSX=ZVK_7xpgraJyC3__uORqXo8F9Atj9gCF+oO7OyfRrtYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] x86/shadow: replace sh_reset_l3_up_pointers()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000004f97b105f2b5033a"

--0000000000004f97b105f2b5033a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 1:52 PM Jan Beulich <jbeulich@suse.com> wrote:

> Rather than doing a separate hash walk (and then even using the vCPU
> variant, which is to go away), do the up-pointer-clearing right in
> sh_unpin(), as an alternative to the (now further limited) enlisting on
> a "free floating" list fragment. This utilizes the fact that such list
> fragments are traversed only for multi-page shadows (in shadow_free()).
> Furthermore sh_terminate_list() is a safe guard only anyway, which isn't
> in use in the common case (it actually does anything only for BIGMEM
> configurations).
>

One thing that seems strange about this patch is that you're essentially
adding a field to the domain shadow struct in lieu of adding another
another argument to sh_unpin() (unless the bit is referenced elsewhere in
subsequent patches, which I haven't reviewed, in part because about half of
them don't apply cleanly to the current tree).

 -George

--0000000000004f97b105f2b5033a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 11, 2023 at 1:52 PM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rather tha=
n doing a separate hash walk (and then even using the vCPU<br>
variant, which is to go away), do the up-pointer-clearing right in<br>
sh_unpin(), as an alternative to the (now further limited) enlisting on<br>
a &quot;free floating&quot; list fragment. This utilizes the fact that such=
 list<br>
fragments are traversed only for multi-page shadows (in shadow_free()).<br>
Furthermore sh_terminate_list() is a safe guard only anyway, which isn&#39;=
t<br>
in use in the common case (it actually does anything only for BIGMEM<br>
configurations).<br></blockquote><div><br></div><div>One thing that seems s=
trange about this patch is that you&#39;re essentially adding a field to th=
e domain shadow struct in lieu of adding another another argument to sh_unp=
in() (unless the bit is referenced elsewhere in subsequent patches, which I=
 haven&#39;t reviewed, in part because about half of them don&#39;t apply c=
leanly to the current tree).<br></div><div><br></div><div>=C2=A0-George<br>=
</div></div></div>

--0000000000004f97b105f2b5033a--

