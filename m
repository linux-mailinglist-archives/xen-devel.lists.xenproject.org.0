Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB1580266
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 18:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374697.606845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0ag-0006j2-Im; Mon, 25 Jul 2022 16:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374697.606845; Mon, 25 Jul 2022 16:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0ag-0006fv-FT; Mon, 25 Jul 2022 16:05:54 +0000
Received: by outflank-mailman (input) for mailman id 374697;
 Mon, 25 Jul 2022 16:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=svdg=X6=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1oG0ae-0006fn-OI
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 16:05:52 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d788a6-0c33-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 18:05:51 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id b16so6292283lfb.7
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jul 2022 09:05:51 -0700 (PDT)
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
X-Inumbo-ID: a7d788a6-0c33-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VkJA++WE/02NU2MuNrToVC9RuJySznakYDIVUGMzJ8c=;
        b=GqAiOLzPey8s2s02fNpSCV4tPxWaYnJeMaWUyT9lnMC+W2hL5ZNvTxXPevJQr0WN8K
         zoAUyJeZ+oF+ZZl22SI3qKmfAro3LhWqDhh7b0f/Qfeikd/0FNvI6/a/67SQVeFI8EIo
         qYkP0x/G9wAhyvpq2Cp0ZTKYaIesuob7GSp+Fynkih1/xHk3GNEvcLajQ8bQuWE+4cZu
         t9fsjlecpm2TJypgg9YXfwSqB8i75hwS76XOqkHfnmEgCF3O4uvFhD2ZsUqNr6p3+iQH
         FhTjf+PtR/wAE+HQvb6v8IpFrGnGnPih9mN4hxDBejmR9zqPlN0m+ij63oZygPmIACE0
         b+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VkJA++WE/02NU2MuNrToVC9RuJySznakYDIVUGMzJ8c=;
        b=N0q02z7PiWiFp4XBGgy3tQoekC6sbkwu9oVy8o2KoLetq2Bnzso31TGhCS5SWlzagJ
         uFuAikz2olBVpGihFvO7iMBOGahE02FhpjVTDrsQ9JVOzq+zbOG5cxE9j6nvmAbZAiWp
         Wr6LTVtt7l3zWLOtJODk1cHk/umJoxRgdM282uAtEpyAVoT0IKTC1uN9o4Z/iTPP6g9o
         W6nUqijd/kZbzvimIFdLlI0vy4ls13bnU0vv7VKdH6EwklIXv7zcqRK0IobsVph8Ilim
         XmiawfChlW6vpy+cMC9aRKZc6FpjSSXNOGVsDnYQ75/CMrt+j6du2ps0nF6ROEBMqF+O
         ZC/A==
X-Gm-Message-State: AJIora9+BisZX5mvadFmILFqRrQFVoXA78/Tlbb8QA7b1MKz+9ohQXSI
	3/23DFHHdcpJHD9ddydEJc2vrCvdJ0VXm3tXBZM=
X-Google-Smtp-Source: AGRyM1srxNwmrAx6+NLMXFU5XzOsb1J0xzhxbTIyo4jOXP3eyDXX+54k5L0aPYjKb3pspkaanXYlzZwL7JSqGIlzVSI=
X-Received: by 2002:a05:6512:1085:b0:48a:710:6a7b with SMTP id
 j5-20020a056512108500b0048a07106a7bmr4626920lfg.417.1658765151224; Mon, 25
 Jul 2022 09:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
In-Reply-To: <473c82d9-0f81-b4f4-70a3-8dfc3beb2be2@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 25 Jul 2022 17:05:37 +0100
Message-ID: <CAJ=z9a2MsEzLwMStTY-1Nxy0y5QZA=CaUsF84q1e_pjqL2n3qw@mail.gmail.com>
Subject: Re: [PATCH] page-alloc: fix initialization of cross-node regions
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"Xia, Hongyan" <hongyxia@amazon.com>
Content-Type: multipart/alternative; boundary="0000000000009ac62d05e4a35b15"

--0000000000009ac62d05e4a35b15
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

(Sorry for the formatting)


On Mon, 25 Jul 2022, 14:10 Jan Beulich, <jbeulich@suse.com> wrote:

> Quite obviously to determine the split condition successive pages'
> attributes need to be evaluated, not always those of the initial page.
>
> Fixes: 72b02bc75b47 ("xen/heap: pass order to free_heap_pages() in heap
> init")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Part of the problem was already introduced in 24a53060bd37 ("xen/heap:
> Split init_heap_pages() in two"), but there it was still benign.
>

Is this because range will never cross numa node? How about the fake NUMA
node?


> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1885,11 +1885,11 @@ static void init_heap_pages(
>               * range to cross zones.
>               */
>  #ifdef CONFIG_SEPARATE_XENHEAP
> -            if ( zone != page_to_zone(pg) )
> +            if ( zone != page_to_zone(pg + contig_pages) )
>                  break;
>  #endif
>
> -            if ( nid != (phys_to_nid(page_to_maddr(pg))) )
> +            if ( nid != (phys_to_nid(page_to_maddr(pg + contig_pages))) )
>                  break;
>          }
>

Hmmm I am not sure why I didn't spot this issue during my testing. It looks
like this was introduced in v2, sorry for that.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheets,


>

--0000000000009ac62d05e4a35b15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Jan,<div dir=3D"auto"><br></div><div dir=3D"auto"=
>(Sorry for the formatting)</div><br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 25 Jul 2022, 14:10 Jan Beulich, &lt;=
<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Quite obviously to determine the split c=
ondition successive pages&#39;<br>
attributes need to be evaluated, not always those of the initial page.<br>
<br>
Fixes: 72b02bc75b47 (&quot;xen/heap: pass order to free_heap_pages() in hea=
p init&quot;)<br>
Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&gt;<br>
---<br>
Part of the problem was already introduced in 24a53060bd37 (&quot;xen/heap:=
<br>
Split init_heap_pages() in two&quot;), but there it was still benign.<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Is thi=
s because range will never cross numa node? How about the fake NUMA node?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
--- a/xen/common/page_alloc.c<br>
+++ b/xen/common/page_alloc.c<br>
@@ -1885,11 +1885,11 @@ static void init_heap_pages(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * range to cross zones.<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0#ifdef CONFIG_SEPARATE_XENHEAP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( zone !=3D page_to_zone(pg) =
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( zone !=3D page_to_zone(pg +=
 contig_pages) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( nid !=3D (phys_to_nid(page_=
to_maddr(pg))) )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( nid !=3D (phys_to_nid(page_=
to_maddr(pg + contig_pages))) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Hmmm I am not sure why I didn&#39;t spot=
 this issue during my testing. It looks like this was introduced in v2, sor=
ry for that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by=
: Julien Grall &lt;<a href=3D"mailto:jgrall@amazon.com">jgrall@amazon.com</=
a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheets,</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--0000000000009ac62d05e4a35b15--

