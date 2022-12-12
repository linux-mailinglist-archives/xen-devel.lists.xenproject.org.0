Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E97649E2C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 12:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459532.717286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hMn-0000Yg-Ue; Mon, 12 Dec 2022 11:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459532.717286; Mon, 12 Dec 2022 11:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hMn-0000Vd-Rq; Mon, 12 Dec 2022 11:53:05 +0000
Received: by outflank-mailman (input) for mailman id 459532;
 Mon, 12 Dec 2022 11:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5Rs=4K=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p4hMm-0000VX-Ud
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 11:53:05 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80cb4f4a-7a13-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 12:52:50 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id r26so12434754edc.10
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 03:53:03 -0800 (PST)
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
X-Inumbo-ID: 80cb4f4a-7a13-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K8+7SWgDUdIYdXH7wP4fQOoSRFSmJNCY+ssG4Sx/v3I=;
        b=f5ybUyyYKc5TotvPODMjLvj5Dn5w4nJ/f2DvlLbCfndbjFTXhkUi2tCAZg6Ji5r6Pj
         9wTE+8MLdY8+6PO81pUKLgOzquBxPpeN7aa6/KLr6ZhGYp4UxT2ZjNRe9vtP5BQyqh4h
         cQ2NaBE50mASgdeEW8LduqboUkJtJJAWD33s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8+7SWgDUdIYdXH7wP4fQOoSRFSmJNCY+ssG4Sx/v3I=;
        b=ckRKrBWGnahVkPubzAQFWO7a6mFG9avoDHecUZ+GtBZCoXmGN5lZzcFQ+HYiT/jEKG
         t3+7qojgdiVmqdKgDx8vLNU3jPIzry93MUcrlcPIla/+BC/OviRhPjadpwEeluI151VQ
         SFx3eZkeGzxs4Cdnp/c1BMtoNfKPleKMASfAdiCYYEtvMo8xyTYsSMnmKnm+KXk6fL8q
         VsWRV4RR8vXg9yln0f9l3Prac2G9WUYBZgqEJZhzvTQghcwcgZKY3clIp5M4+yto4aW/
         KOrrP9KnKhzlIdo1+yWzhw9b/TFnw7cj5nEUR7kAnw8Iu52ovL+W4Iihihlj3tktIdvr
         2iGQ==
X-Gm-Message-State: ANoB5pmtnxDs6cinzl6ss551OxAMvt9gqZL0dN77vhCobHVHEkrv/E6o
	9ph1gtNP3vzcY7mmt2B81b+/1leeExMB9JSBwW88gg==
X-Google-Smtp-Source: AA0mqf7MMw2TUv0u+JRJ/MHBdmrKyZHxB7zsZqlrOhgMqW8h6dT+Vz2nhPzJ45cmBJ0IO4Y8G5a46sUY4/QBZ6uL7h0=
X-Received: by 2002:aa7:d556:0:b0:45c:6467:94e2 with SMTP id
 u22-20020aa7d556000000b0045c646794e2mr84439781edr.295.1670845983431; Mon, 12
 Dec 2022 03:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20221212093410.36289-1-julien@xen.org> <20221212093410.36289-2-julien@xen.org>
In-Reply-To: <20221212093410.36289-2-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Dec 2022 11:52:52 +0000
Message-ID: <CA+zSX=b+cBotrKA4PGTjDPwzHdEECNHMJjbbzo3BYhd4_Ssh1w@mail.gmail.com>
Subject: Re: [PATCH 1/8] docs/process: branching-checklist: Use consistent indentation
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000005135c205efa02576"

--0000000000005135c205efa02576
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:

> From: Julien Grall <jgrall@amazon.com>
>
> At the moment, branch-checklist.txt is using a mix of soft and hard
> tab. They are both meant to be represented using 8 characters.
>
> In Xen we tend to use 4-space softtab represented with 4 characters. So
> to avoid  having to use a different editor configuration, switch all
> the indentation to 4-space softtab.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>

Acked-by: George Dunlap <george.dunlap@cloud.com>

--0000000000005135c205efa02576
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 9:34 AM Julien Gr=
all &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Julien Grall =
&lt;<a href=3D"mailto:jgrall@amazon.com" target=3D"_blank">jgrall@amazon.co=
m</a>&gt;<br>
<br>
At the moment, branch-checklist.txt is using a mix of soft and hard<br>
tab. They are both meant to be represented using 8 characters.<br>
<br>
In Xen we tend to use 4-space softtab represented with 4 characters. So<br>
to avoid=C2=A0 having to use a different editor configuration, switch all<b=
r>
the indentation to 4-space softtab.<br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br></blockquote><div><br></div><div>A=
cked-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud.com">georg=
e.dunlap@cloud.com</a>&gt;</div></div></div>

--0000000000005135c205efa02576--

