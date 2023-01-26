Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1567C7D3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 10:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484905.751774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyzt-0003tX-2h; Thu, 26 Jan 2023 09:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484905.751774; Thu, 26 Jan 2023 09:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyzs-0003qM-Ve; Thu, 26 Jan 2023 09:56:44 +0000
Received: by outflank-mailman (input) for mailman id 484905;
 Thu, 26 Jan 2023 09:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YROu=5X=gmail.com=dunlapg@srs-se1.protection.inumbo.net>)
 id 1pKyzr-0003qG-Ho
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 09:56:43 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb0c107d-9d5f-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 10:56:40 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id m15so743167wms.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 01:56:40 -0800 (PST)
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
X-Inumbo-ID: bb0c107d-9d5f-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gkNyTWKvIHUCpmNo3/mf7YggFUlwg6d1JADIsZE/58Y=;
        b=immGmLZwBSlsuaHB6Qca30hwHjIrgXaxL25dChDEV5PFmPCSqrvE8N19U1r0ui9AuH
         PeQa9lXb09lHZAWosrEuzXgC8yUl6X/PYE9TLDd0p6X6y5z6nJ6Xoj0iRumKnXJtQR9g
         PvXc8PV39YDMQTwVhTDfDfQuDNQ4xgaD8djgl0q1n5/Ayu91aMTzryFDYGGYSFFY75SA
         eYCH8oNTlMWwWEXbOmL92eUdIERWMdbfzelz26V9e/fH3NSlTr992hUdgOMUVg8EAR0G
         Bzs7WO2AVXV0NcOKS1NMy5AKf3dOMvVIVk/G0b9ySIbCxZY7oDJX4mupcV45NV3R78K2
         CthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkNyTWKvIHUCpmNo3/mf7YggFUlwg6d1JADIsZE/58Y=;
        b=q2eH+wYxd0uquxZVqYkcor3DFunfVuRw8a+FI0zmaPonkYePYRAQJ9AfJkZMWSb6m1
         jKIRUVaO+23E9WhtAOAlZqL5e8hzyHZLFQ9wOsgEOkWtpMCNPce+ayDJgwvhcFkwJUuQ
         b8jsCFkdEhdGO7xLolUgRTtdz2qC+l/qQN7O8Rnm7yEe6Ys1t19tYawz+tUzFPPkHcq+
         rsm2CRK3Nc+a9Q3hKM9Ai+9Dmhjvj2Wfk9tB4CX4Ir6KQfy1nv/iRMVNKFbMl7ywZm9p
         4y+8pkkhenI6wAm3bRtTeaabX+VsO3K9dZhb7B0onnUrZ9drJSHCMTaI58QofF/f6twY
         LJ4w==
X-Gm-Message-State: AFqh2kqeJAz0XwQAJ9iM+hxkxAXdsl4bDnQfHzOJ0+snYhWP/xdm4lHN
	vd00zSXypGJe43SJb2KxSM9YnFxIur+iQNmLLpAaWUKZ
X-Google-Smtp-Source: AMrXdXt5TBLGY/xIqXxyqjIu1sRpcSiyvx1fR6dzBW0Dfu83KHXKTyyaDan7puFT/ReZNquokhx5QZ++dEcEqa1Xtwg=
X-Received: by 2002:a05:600c:825:b0:3db:23:37e9 with SMTP id
 k37-20020a05600c082500b003db002337e9mr1947064wmp.46.1674727000136; Thu, 26
 Jan 2023 01:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20230125165308.22897-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230125165308.22897-1-andrew.cooper3@citrix.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 26 Jan 2023 09:56:29 +0000
Message-ID: <CAFLBxZaMj9k+gPFOxr-f=7TJxWoE4nb4=_Vn+ZR_rqAaBzuLGw@mail.gmail.com>
Subject: Re: [PATCH] x86/shadow: Fix PV32 shadowing in !HVM builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Tim Deegan <tim@xen.org>
Content-Type: multipart/alternative; boundary="000000000000f0633905f327c3fc"

--000000000000f0633905f327c3fc
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 4:53 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> The OSSTest bisector identified an issue with c/s 1894049fa283
> ("x86/shadow:
> L2H shadow type is PV32-only") in !HVM builds.
>
> The bug is ultimately caused by sh_type_to_size[] not actually being
> specific
> to HVM guests, and it's position in shadow/hvm.c mislead the reasoning.
>
> To fix the issue that OSSTest identified, SH_type_l2h_64_shadow must still
> have the value 1 in any CONFIG_PV32 build.  But simply adjusting this
> leaves
> us with misleading logic, and a reasonable chance of making a related error
> again in the future.
>
> In hindsight, moving sh_type_to_size[] out of common.c in the first place a
> mistake.  Therefore, move sh_type_to_size[] back to living in common.c,
> leaving a comment explaining why it happens to be inside an HVM
> conditional.
>
> This effectively reverts the second half of 4fec945409fc ("x86/shadow:
> adjust
> and move sh_type_to_size[]") while retaining the other improvements from
> the
> same changeset.
>
> While making this change, also adjust the sh_type_to_size[] declaration to
> match its definition.
>
> Fixes: 4fec945409fc ("x86/shadow: adjust and move sh_type_to_size[]")
> Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>

I don't have super-strong opinions here; I'd be OK with any of the
patches.  But I tend to sympathize with Andrew's arguments re communicating
what's going on.

Acked-by: George Dunlap <george.dunlap@cloud.com>

--000000000000f0633905f327c3fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 25, 2023 at 4:53 PM Andre=
w Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@ci=
trix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">The OSSTest bisector identified an issue with c/s 1894049fa283 (&qu=
ot;x86/shadow:<br>
L2H shadow type is PV32-only&quot;) in !HVM builds.<br>
<br>
The bug is ultimately caused by sh_type_to_size[] not actually being specif=
ic<br>
to HVM guests, and it&#39;s position in shadow/hvm.c mislead the reasoning.=
<br>
<br>
To fix the issue that OSSTest identified, SH_type_l2h_64_shadow must still<=
br>
have the value 1 in any CONFIG_PV32 build.=C2=A0 But simply adjusting this =
leaves<br>
us with misleading logic, and a reasonable chance of making a related error=
<br>
again in the future.<br>
<br>
In hindsight, moving sh_type_to_size[] out of common.c in the first place a=
<br>
mistake.=C2=A0 Therefore, move sh_type_to_size[] back to living in common.c=
,<br>
leaving a comment explaining why it happens to be inside an HVM conditional=
.<br>
<br>
This effectively reverts the second half of 4fec945409fc (&quot;x86/shadow:=
 adjust<br>
and move sh_type_to_size[]&quot;) while retaining the other improvements fr=
om the<br>
same changeset.<br>
<br>
While making this change, also adjust the sh_type_to_size[] declaration to<=
br>
match its definition.<br>
<br>
Fixes: 4fec945409fc (&quot;x86/shadow: adjust and move sh_type_to_size[]&qu=
ot;)<br>
Fixes: 1894049fa283 (&quot;x86/shadow: L2H shadow type is PV32-only&quot;)<=
br>
Signed-off-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.co=
m" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br></blockquote><div=
><br></div><div>I don&#39;t have super-strong opinions here; I&#39;d be OK =
with any of the patches.=C2=A0 But I tend to sympathize with Andrew&#39;s a=
rguments re communicating what&#39;s going on.</div><div><br></div><div>Ack=
ed-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">george.=
dunlap@cloud.com</a>&gt;</div></div></div>

--000000000000f0633905f327c3fc--

