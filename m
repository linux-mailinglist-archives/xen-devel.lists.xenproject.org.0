Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F0D64271B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453417.711031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29FR-0000tM-2q; Mon, 05 Dec 2022 11:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453417.711031; Mon, 05 Dec 2022 11:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29FQ-0000rT-TV; Mon, 05 Dec 2022 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 453417;
 Mon, 05 Dec 2022 11:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/ZPr=4D=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p29Ed-0000W9-5w
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:02:07 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 417e48a6-748c-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 12:02:06 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id qk9so9083567ejc.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Dec 2022 03:02:06 -0800 (PST)
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
X-Inumbo-ID: 417e48a6-748c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BEvzQObdwllKYzf1rM0gn5NgqqBSYsrZXBQG4nClVRg=;
        b=Henub+u71ZoilZJfObgvjoWnQZE/h5gVGeWW0mU+OWNgAEYdvO5kJDePgUEoUcD76r
         VHsYDHgW8cTwaa0obT8vpJk+3G1FZeXg0GNxu7IoV9ivld3W+CrwZAL9bQ3p8j7H7CMs
         Id0mnOS1b0vXAIyIEBN+pStduBH/OjTRkNEqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEvzQObdwllKYzf1rM0gn5NgqqBSYsrZXBQG4nClVRg=;
        b=dYSZYffjzbcduDZJOg1yJCjhT1YTUPwmcwI78eq4dE6IBZwtEcrruw7gsdkKCFmy/5
         5G2XtHKm1ahS/DxfjPytgIe/SNd6vCdt+8vzErkbVv0YziOVXSa3u8zeuFXo8dUoz+oO
         zPx39bM8+0qKyWdYMoUS0tC4aU1bAgJsTPYJ7sNzTUTYzm0h2nDY2H0wyuoXg2JiiYlJ
         tjwEXk4i8d8HNk80VXPobJOa7RxGg6EnkfEhSbFT2Lrxb2jurPHp46Ib0FJpT45b1xKL
         1vO+k+u0FPUFAUfDQBw/NVRU5Ssx+Ccovdh83GWWbiidSPOHmRitGLYIBSUNgIC2Nzz/
         fpnw==
X-Gm-Message-State: ANoB5plFr4MNvekNfuK7rmpUiP1TTOp15z2x5xSkqVPVMPb+1x106HPV
	+PaBIsZupTX2wHfXOG24pOTJiUMZmR/Uh/jbtdNu9jJqG9g/Iw==
X-Google-Smtp-Source: AA0mqf6PzWGm9WW7vcnADJSVzftDJAZHPVoa+o3w71Z1tlQt1jikCvfz/G46wFAsRzSEregII96NrdMS2EYMgPfC/mQ=
X-Received: by 2002:a17:906:7f16:b0:7c0:f2cf:8e09 with SMTP id
 d22-20020a1709067f1600b007c0f2cf8e09mr3583924ejr.257.1670238125623; Mon, 05
 Dec 2022 03:02:05 -0800 (PST)
MIME-Version: 1.0
References: <a7d3fc3dfe6fb8dfb75c7b35a78a299bee9685f9.1670172466.git.demi@invisiblethingslab.com>
In-Reply-To: <a7d3fc3dfe6fb8dfb75c7b35a78a299bee9685f9.1670172466.git.demi@invisiblethingslab.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 5 Dec 2022 11:01:54 +0000
Message-ID: <CA+zSX=bKN3cqCMKzR+5Xp9LOUw=38VzTp4BoN1-Qmn0-dZ7Zyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Reduce hard-coding of PAT value
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000002b316905ef129ed0"

--0000000000002b316905ef129ed0
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 4, 2022 at 5:14 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> This makes the code easier to read and more robust against any future
> changes to this value.  No change in behavior (modulo bugs).
>

Minor tweak: We generally say something like "No functional change
intended."  No need to respin just for this, but handy to keep in your
back pocket for future patches.

 -George

--0000000000002b316905ef129ed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 4, 2022 at 5:14 PM Demi M=
arie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com">demi@invisi=
blethingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">This makes the code easier to read and more robust against =
any future<br>
changes to this value.=C2=A0 No change in behavior (modulo bugs).<br></bloc=
kquote><div><br></div><div>Minor tweak: We generally say something like &qu=
ot;No functional change intended.&quot;=C2=A0 No need to respin just for th=
is, but handy to keep in your back=C2=A0pocket for future patches.</div><di=
v><br></div><div>=C2=A0-George</div></div></div>

--0000000000002b316905ef129ed0--

