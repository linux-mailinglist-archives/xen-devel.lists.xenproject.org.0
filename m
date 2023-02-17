Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AE69A9F1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 12:11:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497019.767946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSydm-0003KQ-L4; Fri, 17 Feb 2023 11:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497019.767946; Fri, 17 Feb 2023 11:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSydm-0003IN-I8; Fri, 17 Feb 2023 11:10:58 +0000
Received: by outflank-mailman (input) for mailman id 497019;
 Fri, 17 Feb 2023 11:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qKQD=6N=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pSydk-0003IH-TA
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 11:10:57 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be417966-aeb3-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 12:10:53 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id x4so982316lfq.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 03:10:53 -0800 (PST)
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
X-Inumbo-ID: be417966-aeb3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wpmpZLoUmhLRqdF+ixXFaxKZLHqcK6OTa0Ulfvt8tLo=;
        b=dkiWKNaeR6WLYVwIT6gqimJcgci6RB0U8ynBKLbo9jrGSCpcAybwRUwjpxUc2vWeBE
         EADMIHcU1iWVqMWdR8Tsedq5IezBvJ+j2G5aU4IWdie+z/hVWOZ6uPC2xdOraptWEaUC
         DbpQVNo2F+Wg+xB1aaOssZyIao8aeNJVMI44k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpmpZLoUmhLRqdF+ixXFaxKZLHqcK6OTa0Ulfvt8tLo=;
        b=WHPIzZhAYLXjZzHkA46DOuM5h/gD82WS/YsWO95EKxSuCC7vtLDLE8MDfinC8UK5LM
         rjo2h+9SgxVkSgNLDH6rsE10+hIJTmj2nbDDl7N3Rh6BKI//NStfn8dFD/uDtZp3fEvT
         A+eEf4FvltPXipYHoWpm5ow+7XIP+545mrEAmJTauwHyIP73gi2Vva/j4f4zwGu3JTQp
         hckdzqEchF4QK9Z0JxFLMG7TFNIuBvkbPuCYie6w6SMbiEqoMtc89YVwq58qvn0Wq0kF
         +F/kO7bROKudCeEyou7DVsT8qy5xUlg1yjZP2Cn6I1fecrj+9xI75dN5owZF7JuGxrF9
         Ai6g==
X-Gm-Message-State: AO0yUKWVCcEZl4jQmNBTVAimc2ijYCZCTjiMAJvZeqKY8ISOr5ur5PZx
	OPC4PuWozAX8aaSw/HGwWKrOnWYvaikTHKcWxFXqSw==
X-Google-Smtp-Source: AK7set/hsKn/wYSbufDtnW2LPTdQy7w9+nVRkW6tBhepuuk/F95t8MBGs8FUT6k+BWeanlgp/EyH7BKDURmd4COmHzU=
X-Received: by 2002:a19:ac01:0:b0:4db:3ab7:79ca with SMTP id
 g1-20020a19ac01000000b004db3ab779camr318306lfc.8.1676632252798; Fri, 17 Feb
 2023 03:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20230216231636.714006-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230216231636.714006-1-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 17 Feb 2023 11:10:41 +0000
Message-ID: <CA+zSX=ajuBw6GmsyiNPN3EJ5_KYafUxNX5fTpbAY=4ByE_Z25w@mail.gmail.com>
Subject: Re: [PATCH] tools: Remove the use of K&R functions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000d8ec8105f4e35d3c"

--000000000000d8ec8105f4e35d3c
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 11:16 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> Clang-15 (as seen in the FreeBSD 14 tests) complains:
>
>   xg_main.c:1248 error: a function declaration without a
>   prototype is deprecated in all versions of C
> [-Werror,-Wstrict-prototypes]
>   xg_init()
>          ^
>           void
>
> The error message is a bit confusing but appears to new as part of
> -Wdeprecated-non-prototype which is part of supporting C2x which formally
> removes K&R syntax.
>
> Either way, fix the offending functions.
>

Nit: This says "functions" (plural), but I only see one function being
modified in this patch?

Doesn't matter too much but might save an archaeologist some confusion if
someone were to fix this up on check-in. :-)

 -George

--000000000000d8ec8105f4e35d3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 16, 2023 at 11:16 PM Andr=
ew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@c=
itrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Clang-15 (as seen in the FreeBSD 14 tests) complains:<br>
<br>
=C2=A0 xg_main.c:1248 error: a function declaration without a<br>
=C2=A0 prototype is deprecated in all versions of C [-Werror,-Wstrict-proto=
types]<br>
=C2=A0 xg_init()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void<br>
<br>
The error message is a bit confusing but appears to new as part of<br>
-Wdeprecated-non-prototype which is part of supporting C2x which formally<b=
r>
removes K&amp;R syntax.<br>
<br>
Either way, fix the offending functions.<br></blockquote><div><br></div><di=
v>Nit: This says &quot;functions&quot; (plural), but I only see one functio=
n being modified in this patch?</div><div><br></div><div>Doesn&#39;t matter=
 too much but might save an archaeologist some confusion if someone were to=
 fix this up on check-in. :-)</div><div><br></div><div>=C2=A0-George</div><=
/div></div>

--000000000000d8ec8105f4e35d3c--

