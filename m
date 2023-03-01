Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4476A6993
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:13:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503900.776292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIWA-000787-8K; Wed, 01 Mar 2023 09:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503900.776292; Wed, 01 Mar 2023 09:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIWA-00075E-5Y; Wed, 01 Mar 2023 09:12:58 +0000
Received: by outflank-mailman (input) for mailman id 503900;
 Wed, 01 Mar 2023 09:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SDc4=6Z=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pXIW9-000758-9F
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:12:57 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40fbf6db-b811-11ed-96a0-2f268f93b82a;
 Wed, 01 Mar 2023 10:12:56 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id m7so16715509lfj.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 01:12:56 -0800 (PST)
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
X-Inumbo-ID: 40fbf6db-b811-11ed-96a0-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1677661975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LRNkbhtb0PbLtFlBRvd0QfcIMwYRxszFBP1H3Dy86ko=;
        b=Xv/Z2SpkA0xzm3I7EJc4Q8IwyvzZ611sdIZUoMVECnzhoPWhDkhBKAaC4kAYnxvA73
         np2iH79Mu1AxxuRlPzSNv4YFzhXaYdCzfYB929v8ZhdJUG6df1ftCYb8giSrrTa23Wro
         NuxUuNYVmXPy1zNzydP16EmMq6muvuvmO6kaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRNkbhtb0PbLtFlBRvd0QfcIMwYRxszFBP1H3Dy86ko=;
        b=ua544jUAThIJNtRgvT/AntbF6/kmF0tgvXniMIR7DxZdVW+ERs88nU5iq6yz+BXPGy
         6fDVuVoi13qcwBlByZ2DY5+wNi8aevMRm8qK/TNZ4jRUtOMe2rC5Lj15RRuYYq0Xrp36
         zHbzsGv0EuuaGE1jdAK0F697330kYUwLsVWBnsmNzxqk/jf+ce9P/LxcyUgY/7ANrvzq
         RBAu51C3PyS2y/jUI0D+jchcSKqckLgWdQo16/3bFG+EgBWWf/yy4uL9c3lC4bCr7OtT
         ffQoNlqwSUSAQ5A1UZhHoq6R4lLT7OC03ydbmoBgcafB1jJw1xfHkQWOf1qgJ8O910Cs
         2IjA==
X-Gm-Message-State: AO0yUKW3ymbjzeHvH12eTuxAPFZ1KutzqaqmkMV5vHVgbnvqLumZUdcR
	64/VfhfmmFr3bNOd9TWKy9OkGvERV3i+xWddwLv6rWZ2OQOeZQ==
X-Google-Smtp-Source: AK7set/FOoZiofTE1uKE2R31rI0H+R3TTPcXvDSil9wFKfxr0ZvUd7jEReN1SKcgN5xNJLw9u3Jt1rqaEr0mj5i15ZY=
X-Received: by 2002:a05:6512:146:b0:4db:1a8b:1b87 with SMTP id
 m6-20020a056512014600b004db1a8b1b87mr1597016lfo.8.1677661975625; Wed, 01 Mar
 2023 01:12:55 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=bwfZnssbjB=4=_r+a=w-=8i7+i8yZ5bgOrjAox0PR7pQ@mail.gmail.com>
 <ae0b11d5-2294-7b96-c244-3fd85be92b9b@suse.com>
In-Reply-To: <ae0b11d5-2294-7b96-c244-3fd85be92b9b@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 1 Mar 2023 09:12:44 +0000
Message-ID: <CA+zSX=ZPAXchsqL6YZNkLO+rYMVyb77nOiRB12sPpJ6ep685dA@mail.gmail.com>
Subject: Re: [ANNOUNCE] Call for agenda items for [EDIT] 2 March Community
 Call @ 1600 UTC
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000001c594c05f5d31e0b"

--0000000000001c594c05f5d31e0b
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 28, 2023 at 7:16 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 27.02.2023 22:41, George Dunlap wrote:
> > Note the following administrative conventions for the call:
> > * Unless, agreed in the previous meeting otherwise, the call is on the
> 1st
> > Thursday of each month at 1600 British Time (either GMT or BST)
>
> Since nothing else was said, I suppose the title is off by one and it's
> Thursday March 2nd?
>

Indeed, that should be Thursday, 2 March.  (The timeanddate link, as well
as the title of the cryptpad agenda, both say 2 March.). Sorry for the
confusion.

 -George

--0000000000001c594c05f5d31e0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 28, 2023 at 7:16 AM Jan B=
eulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 27.02.2=
023 22:41, George Dunlap wrote:<br>
&gt; Note the following administrative conventions for the call:<br>
&gt; * Unless, agreed in the previous meeting otherwise, the call is on the=
 1st<br>
&gt; Thursday of each month at 1600 British Time (either GMT or BST)<br>
<br>
Since nothing else was said, I suppose the title is off by one and it&#39;s=
<br>
Thursday March 2nd?<br></blockquote><div><br></div><div>Indeed, that should=
 be Thursday, 2 March.=C2=A0 (The timeanddate link, as well as the title of=
 the cryptpad agenda, both say 2 March.). Sorry for the confusion.</div><di=
v><br></div><div>=C2=A0-George=C2=A0</div></div></div>

--0000000000001c594c05f5d31e0b--

