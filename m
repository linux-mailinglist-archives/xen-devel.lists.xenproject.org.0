Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529E3F3250
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 19:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169630.309884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH8Oo-00078v-8o; Fri, 20 Aug 2021 17:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169630.309884; Fri, 20 Aug 2021 17:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH8Oo-000775-4d; Fri, 20 Aug 2021 17:33:46 +0000
Received: by outflank-mailman (input) for mailman id 169630;
 Fri, 20 Aug 2021 17:33:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ejsu=NL=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1mH8On-00076z-2a
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 17:33:45 +0000
Received: from mail-ot1-x331.google.com (unknown [2607:f8b0:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f563949-48b0-4816-aa38-8b2b48e39060;
 Fri, 20 Aug 2021 17:33:44 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 y14-20020a0568302a0e00b0051acbdb2869so8687117otu.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 10:33:44 -0700 (PDT)
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
X-Inumbo-ID: 1f563949-48b0-4816-aa38-8b2b48e39060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ozQo/O/xQTTSBaei3FXjoC5gpnxorgxOR6kM/OupHjc=;
        b=eG14DNBBYmzvmOPEi08NJQmyx13jTBS2FWExr6gi6z/GZG8TJq3NPrP0GQwkyOmXDj
         W+Lpgfv2OLXdUFEQ0HMEJ/SeW9HR8s/dDyrAlET3RXBVX23DP1Y+2jwPgZGXdeg1Aok+
         D8DT3Gei3Wq0tlkb5XR6ioYIzPaxj0WG2tFqW1hQsO4w1gxEa2nVu/oYbzHnW3bOapy1
         J+R6V9B2gQ8I1f/oGwGTCVLxt7hy5jKn1ctDSh9w2wxHYCGWjh2byjtG5n0Gbr3NKQ93
         aA2ugnD+idgTlimosvMLHMZo0AKSIscZfIaoVpCg8C81HoeliJoEUxQ0LWlCenUruy8d
         7Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ozQo/O/xQTTSBaei3FXjoC5gpnxorgxOR6kM/OupHjc=;
        b=EnodlTIJcWicLdIg0MFVw2DDGq5tZoWdieDapTPxpOOoDThvOzIMFlrYeG4G+ihrBP
         d3XMpGBHkP1UAP1UQBDRsaqFGOqqVRlvNoTAOcFVn1OfNg6D/E9AcoSo+FiYE5FoxaIt
         XPrqDPv0pbvs44HNk5sgg8WxAx3PX6W4XfJtm0kH0M4ZA5Wi7P3mYzp7TsYSl/wssCWK
         xadGZVVztd85nI3AHztiKvHvj+L7+vp0aPfENEUB+4nQ/DEDqBfVDaQ4sTw5I/at26uW
         YBZr/gQ7yxmOU8rwH17+j4pWvwkRuBL89RKk+twJkdyvXpwVzccWH4eL42FZqs696pax
         SaTw==
X-Gm-Message-State: AOAM530iNcLEgELO4A8jtRuPJ2KKZbt1owhXIdkFdWPQf5cro44flxEA
	x+F9J5uXO7aoH7m6PgD4iC2M6rcwOaFFO2+pNHY=
X-Google-Smtp-Source: ABdhPJzQu579/bW1CR9cL15BAeeczl5HeQooA/JGr1s0e/YTeDJaI3FZ8m9jLBZ9XBaS1uc0JGHRAk88W/2X2L6/LDw=
X-Received: by 2002:a05:6830:3114:: with SMTP id b20mr14636124ots.17.1629480823693;
 Fri, 20 Aug 2021 10:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210820093924.9991-1-michal.orzel@arm.com>
In-Reply-To: <20210820093924.9991-1-michal.orzel@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 20 Aug 2021 10:33:33 -0700
Message-ID: <CACMJ4Ga6DqVmX5wyheFJTnxaKEnVCs7ezDhYxO=7qmC2UEhVyg@mail.gmail.com>
Subject: Re: [PATCH] xen/public: arch-arm: Add mention of argo_op hypercall
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000aa273f05ca0111f5"

--000000000000aa273f05ca0111f5
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 2:39 AM Michal Orzel <michal.orzel@arm.com> wrote:

> Commit 1ddc0d43c20cb1c1125d4d6cefc78624b2a9ccb7 introducing
> argo_op hypercall forgot to add a mention of it in the
> comment listing supported hypercalls. Fix that.
>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>

Thanks, Michal.
Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher

---
>  xen/include/public/arch-arm.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 64a2ca30da..6b5a5f818a 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -128,6 +128,8 @@
>   *    * VCPUOP_register_vcpu_info
>   *    * VCPUOP_register_runstate_memory_area
>   *
> + *  HYPERVISOR_argo_op
> + *   All generic sub-operations
>   *
>   * Other notes on the ARM ABI:
>   *
> --
> 2.29.0
>
>

--000000000000aa273f05ca0111f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Aug 20, 2021 at 2:39 AM Michal Or=
zel &lt;<a href=3D"mailto:michal.orzel@arm.com">michal.orzel@arm.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Commit 1ddc0d43c20cb1c1125d4d6cefc78624b2a9ccb7 introdu=
cing<br>
argo_op hypercall forgot to add a mention of it in the<br>
comment listing supported hypercalls. Fix that.<br>
<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@arm.com" tar=
get=3D"_blank">michal.orzel@arm.com</a>&gt;<br></blockquote><div><br></div>=
<div>Thanks, Michal.</div><div>Reviewed-by: Christopher Clark &lt;<a href=
=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a>=
&gt;</div><div><br></div><div>Christopher</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0xen/include/public/arch-arm.h | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h<=
br>
index 64a2ca30da..6b5a5f818a 100644<br>
--- a/xen/include/public/arch-arm.h<br>
+++ b/xen/include/public/arch-arm.h<br>
@@ -128,6 +128,8 @@<br>
=C2=A0 *=C2=A0 =C2=A0 * VCPUOP_register_vcpu_info<br>
=C2=A0 *=C2=A0 =C2=A0 * VCPUOP_register_runstate_memory_area<br>
=C2=A0 *<br>
+ *=C2=A0 HYPERVISOR_argo_op<br>
+ *=C2=A0 =C2=A0All generic sub-operations<br>
=C2=A0 *<br>
=C2=A0 * Other notes on the ARM ABI:<br>
=C2=A0 *<br>
-- <br>
2.29.0<br>
<br>
</blockquote></div></div>

--000000000000aa273f05ca0111f5--

