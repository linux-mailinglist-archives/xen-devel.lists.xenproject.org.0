Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E984F649EC6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459587.717352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4i0P-0008U3-4O; Mon, 12 Dec 2022 12:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459587.717352; Mon, 12 Dec 2022 12:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4i0P-0008Rv-1F; Mon, 12 Dec 2022 12:34:01 +0000
Received: by outflank-mailman (input) for mailman id 459587;
 Mon, 12 Dec 2022 12:33:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y5Rs=4K=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p4i0N-0008Rp-Q9
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:33:59 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f4ba6a7-7a19-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 13:33:57 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id t17so27593597eju.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 04:33:57 -0800 (PST)
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
X-Inumbo-ID: 3f4ba6a7-7a19-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l55NuVvh5wfd/EVdMpDmMcr96MRNuLzDUXxPpCCbYcM=;
        b=gDZrCC8vqGRanAehh+gqUf5VsaU3A1ngvOv/EEiVdcHqdnVSnAGCZoDOXSCMkr8z5b
         8w1OM+Lma31z5JBxqZhD6PGiMX3v9TUfN0Nw+0pgule79qsy8HD6f435G9gCyZQBuqqF
         3Qt3eXctS7zoWlYmtE57y2c+EYZBQ/ZcVqtOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l55NuVvh5wfd/EVdMpDmMcr96MRNuLzDUXxPpCCbYcM=;
        b=LlQ6B+o4JvH1Ua78ccU1Mi0fMZydtG2GrXZZZStDI5vG1WnOmmU4xnzppQXayJoi6h
         vxGTMPfgGypoHrFnJu1w65dYTHv0yp4ki/s09wCu72bkLvFFGEFwcdYW7Qz5JlIx17tv
         ofpaaBSlZaPLOuEtVQpR2QggVqL+yChLKHKfXuueEPLc9ePJy/8D3Ez0/QPOW3TRGAik
         QxF3EBeHJ42YUM2AAmlJxsNbHXTj89iPXOmAEmwX5kdJdhjWcuzanDzc6YvzDmnhpyKX
         b2CHriJNBUp/J5ZKltENWVvojXDk/kVuf1eRIiIlxvFncbaABI9eKPrHCvJBjyUgU1Q9
         jYMg==
X-Gm-Message-State: ANoB5pluufnG9MqRLFepGzmCjjTR0G5x+WSE9/Yb4sQOlUJMkThTr76/
	DklNVYfwWADqvG50O9z+AqVIiaTwH7C2ddszxrKHKw==
X-Google-Smtp-Source: AA0mqf4DZ/1sy5FmlZ3wCi02k3iWP47oR1VEn58GtYR5Nxr5QR/gR7TiyvfytSbz0SpE0e1guB+0LVlUgQHBexuLtYY=
X-Received: by 2002:a17:906:4bcc:b0:7be:6ab8:4ccc with SMTP id
 x12-20020a1709064bcc00b007be6ab84cccmr44951831ejv.713.1670848436920; Mon, 12
 Dec 2022 04:33:56 -0800 (PST)
MIME-Version: 1.0
References: <20221212093410.36289-1-julien@xen.org> <20221212093410.36289-6-julien@xen.org>
In-Reply-To: <20221212093410.36289-6-julien@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 12 Dec 2022 12:33:45 +0000
Message-ID: <CA+zSX=b3rA=Jc4Au5DhpZK9HZ484sxdR3GdCD6Gjpx114aiyvg@mail.gmail.com>
Subject: Re: [PATCH 5/8] docs/process: branching-checklist: Reword the section
 about Config.mk
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, 
	Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000008e7a7705efa0b793"

--0000000000008e7a7705efa0b793
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:

> From: Julien Grall <jgrall@amazon.com>
>
> Since at least Xen 4.12, the revision for external trees don't contain
> the word "unstable". So explicitely list the *_REVISION variables that
> need to be updated as part of the branching process.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  docs/process/branching-checklist.txt | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/docs/process/branching-checklist.txt
> b/docs/process/branching-checklist.txt
> index d1550385c96e..7004f16e8311 100644
> --- a/docs/process/branching-checklist.txt
> +++ b/docs/process/branching-checklist.txt
> @@ -69,11 +69,9 @@ ov=4.0
>      git add versions
>      git commit -m "Branch for $v"
>
> -Ensure references to qemu trees in xen.git's Config.mk are updated.
> -Check this with
> -    grep unstable Config.mk
> -which should produce no output.  Replace as necessary.
> -(There may well be none.)
> +Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are
> updated.
> +The variables are QEMU_UPSTREAM_REVISION, QEMU_TRADITIONAL_REVISION and
> +MINIOS_UPSTREAM_REVISION.
>

One advantage of the previous wording was that it helped you know what the
references *weren't* supposed to look like (although it might have been
more helpful to know what the references *were* supposed to look like).
Would it make sense to add a few words about what they're supposed to look
like?

 -George

--0000000000008e7a7705efa0b793
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
Since at least Xen 4.12, the revision for external trees don&#39;t contain<=
br>
the word &quot;unstable&quot;. So explicitely list the *_REVISION variables=
 that<br>
need to be updated as part of the branching process.<br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com" target=
=3D"_blank">jgrall@amazon.com</a>&gt;<br>
---<br>
=C2=A0docs/process/branching-checklist.txt | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-=
checklist.txt<br>
index d1550385c96e..7004f16e8311 100644<br>
--- a/docs/process/branching-checklist.txt<br>
+++ b/docs/process/branching-checklist.txt<br>
@@ -69,11 +69,9 @@ ov=3D4.0<br>
=C2=A0 =C2=A0 =C2=A0git add versions<br>
=C2=A0 =C2=A0 =C2=A0git commit -m &quot;Branch for $v&quot;<br>
<br>
-Ensure references to qemu trees in xen.git&#39;s Config.mk are updated.<br=
>
-Check this with<br>
-=C2=A0 =C2=A0 grep unstable Config.mk<br>
-which should produce no output.=C2=A0 Replace as necessary.<br>
-(There may well be none.)<br>
+Ensure references to qemu trees and Mini-OS in xen.git&#39;s Config.mk are=
 updated.<br>
+The variables are QEMU_UPSTREAM_REVISION, QEMU_TRADITIONAL_REVISION and<br=
>
+MINIOS_UPSTREAM_REVISION.<br></blockquote><div><br></div><div>One advantag=
e of the previous wording was that it helped you know what the references *=
weren&#39;t* supposed to look like (although it might have been more helpfu=
l to know what the references *were* supposed to look like).=C2=A0 Would it=
 make sense to add a few words about what they&#39;re supposed to look like=
?</div><div><br></div><div>=C2=A0-George</div></div></div>

--0000000000008e7a7705efa0b793--

