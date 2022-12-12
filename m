Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600D0649EDA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459603.717374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4i1v-0001BN-MG; Mon, 12 Dec 2022 12:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459603.717374; Mon, 12 Dec 2022 12:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4i1v-000193-IT; Mon, 12 Dec 2022 12:35:35 +0000
Received: by outflank-mailman (input) for mailman id 459603;
 Mon, 12 Dec 2022 12:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5Rs=4K=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p4i1t-00018t-Ku
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:35:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 781d23ab-7a19-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 13:35:32 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id s5so12594747edc.12
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 04:35:32 -0800 (PST)
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
X-Inumbo-ID: 781d23ab-7a19-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gz7y2Rq8puYUY5t5y0Bdu7+/Oox1vtHfpSL6HUSlTDY=;
        b=BUfuKkKCDLM0Kbo0nN5qVDYM/Tvr/yhWn/uMUmL2VTEXTUnyTYKmBQUZaFvzkbUG0V
         bm2Cs+e+Jy8iQibaqo4uYxfnPRKdhSew4S4ucqnSAxGtDz0GdnVD3z5kjWjt+WMPOd8k
         3uJpZdGwP0T6Oww290/9SQM7qWkk0zUynZ5y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz7y2Rq8puYUY5t5y0Bdu7+/Oox1vtHfpSL6HUSlTDY=;
        b=gYHdU4PwQTm1vZNzC1LNQBiF8C5MSJzpx+NxOJFfi4M6ZzFTwZ7GRzr/gMjwSFqsQR
         oT2aJ27hAWekzvw58eIiAd9pi62Ugi+/itSlcYolfcW5LoLg0pLuC0lFBM20kzAnzREB
         ZbBKFjtbZ9qedd3dUbGMytCYxQXPO0jEbPcw6Ay5i1TGlnywNcDHvIYQw4f0zy/otvk9
         f8AqmxusbMkAM3JPv8MvQfJKbUXTr2r3qTe1qFM4YSXscypptJieqsGou1j/8ZH8G48K
         su8Fv7QDK21KWAAlKzIuujIzW7U9LdP3gJVh4ZpxK+sXKNW0q6xVFSw+kPT/1+iwFrUd
         SQKQ==
X-Gm-Message-State: ANoB5pkumVqnrKssR1PIeZw0w7NuHd4Hl5ItYYskRTHUoge/bp/UEBqX
	REFCohPziGKcasriEzl1qt3nUP2jA+gXGwsN94fWNA==
X-Google-Smtp-Source: AA0mqf7OBF52hUUX9HymMLlcIwQHdiahNuKGVg8hXAQHL7TPxygbKNHyY5ukErDT2gNPoOA8dLD7O4HmDqMU6VfGUIU=
X-Received: by 2002:aa7:d556:0:b0:45c:6467:94e2 with SMTP id
 u22-20020aa7d556000000b0045c646794e2mr84450803edr.295.1670848532387; Mon, 12
 Dec 2022 04:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20221212093410.36289-1-julien@xen.org> <20221212093410.36289-8-julien@xen.org>
In-Reply-To: <20221212093410.36289-8-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Dec 2022 12:35:21 +0000
Message-ID: <CA+zSX=YQJe7pkwh9v5s7_tZJdpg8sNDik_R4zeoNrgO06zxTiw@mail.gmail.com>
Subject: Re: [PATCH 7/8] docs/proces: branching-checklist: Update the section
 "add to patchbot"
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000003f2e6405efa0bdd6"

--0000000000003f2e6405efa0bdd6
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:

> From: Julien Grall <jgrall@amazon.com>
>
> Make clear the patchbot is accessible from the user "xen" on xenbits.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>

Acked-by: George Dunlap <george.dunlap@citrix.com>

--0000000000003f2e6405efa0bdd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 9:34 AM Julie=
n Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Julien Gr=
all &lt;<a href=3D"mailto:jgrall@amazon.com" target=3D"_blank">jgrall@amazo=
n.com</a>&gt;<br>
<br>
Make clear the patchbot is accessible from the user &quot;xen&quot; on xenb=
its.<br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br></blockquote><div><br></div><div>A=
cked-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.com">geor=
ge.dunlap@citrix.com</a>&gt;</div><div><br></div></div></div>

--0000000000003f2e6405efa0bdd6--

