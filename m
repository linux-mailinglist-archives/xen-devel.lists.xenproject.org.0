Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151A94CE8E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 12:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774639.1185092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMmQ-00059Z-1t; Fri, 09 Aug 2024 10:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774639.1185092; Fri, 09 Aug 2024 10:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMmP-000585-VS; Fri, 09 Aug 2024 10:23:29 +0000
Received: by outflank-mailman (input) for mailman id 774639;
 Fri, 09 Aug 2024 10:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RF4x=PI=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1scMmO-00057z-HG
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 10:23:28 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8c4d9e-5639-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 12:23:27 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5b7b6a30454so2340325a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 03:23:27 -0700 (PDT)
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
X-Inumbo-ID: 6a8c4d9e-5639-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723199007; x=1723803807; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g3OZ6i3t+Jrt4X67Jea4ruZJY8L9jivWEm6rl2B9hLI=;
        b=Zzv7fB6zLPTKEZSZhV7gDrzpO+5vdgkPeePky1V2xVeNSEtyNwm6sjpY3EmScUc13d
         1qRld6Q+5Galf8ZMy/k8K3QPZ4nxZ75W/YD78zt3c3qEpRQ+FH0dFoH4nSkP0gA3supG
         hqpzlZ8H8BP8vGPoCGdVlGdyvjmaUeqhNpLo+QT1UQvSmyS0bMFeBNs5vAyAL2SXWl7g
         ooahUqdAW6lb404SbCfiOrEGcst4J6t9VIa2wi48BXjwFN1z1zvWC0PHO60fOq5AbzlA
         jci05l0xjzm9shJ7ec9uwJjU93SUOaXc3S3HNVl5pqcMduOKhkZW6XK/ZiBx/UbFYqhX
         3nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723199007; x=1723803807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3OZ6i3t+Jrt4X67Jea4ruZJY8L9jivWEm6rl2B9hLI=;
        b=h6CRJpHX1d9sKPAtiTYRqzWbitUYFSgITumYnNzBUA8LI3BajWTYypzCBz9y1PEmi/
         mJ+EuAxFiEhtEavwo4Z31gzImYlvYOteIkX7LjaCm1uxQbuf/OLEBF74aapE9L83r6Tj
         G8iRFOBAH3o0Y+9zU2WubTnEej/NI37uaYyndWbjOeA4rB+cbbGHN7zhZnLli76s7qkp
         2N+DCOpNL2FCJWspZQ4vrxUulx8l/IRuB1XeO9j6XO72daEM76UDN3J48ZAeQGBPr9au
         bXKVH1LG75fMeBGf7HdLTwnRy2Zj9LFzqj7dBCQ7j9tEYHN8dU8NvY7+jpGe+AzXRfM9
         q4xw==
X-Gm-Message-State: AOJu0YwZ63fTd0E4BYA1zjNvFHdMRzP5d1a08g5kVcnl/ubWM+2ekF2m
	u6JHtjLJFbzKwVND5KA5hKxLmeAI/N9rPnWHBLpcAhlPYchh/cccuwlQ1KYTl0+Cg/WZVPtnp/v
	QY8K25nY19q7Lq1d9fHAjMrATGyg=
X-Google-Smtp-Source: AGHT+IHxefxRbpMyBF4ZHZCeVerzHxDhh0qFok2KXYqAJX5pQIT9ZaQD9x6KqE5CIzDpGTxA9efclW9DEnvN6AsILB0=
X-Received: by 2002:a05:6402:2791:b0:5a2:763e:b8bf with SMTP id
 4fb4d7f45d1cf-5bd0a61181fmr1021909a12.25.1723199006291; Fri, 09 Aug 2024
 03:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
 <20240522132829.1278625-2-edgar.iglesias@gmail.com> <7AA016AF-03B0-4321-B0B9-FBDD60B24557@arm.com>
In-Reply-To: <7AA016AF-03B0-4321-B0B9-FBDD60B24557@arm.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 9 Aug 2024 12:23:14 +0200
Message-ID: <CAJy5ezqz8oHfv_an9DtoGwJK2M6d_HO_QhUVvwd7k8wdmibG4w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] xen/arm: smmuv3: Mark more init-only functions
 with __init
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, 
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
	"edgar.iglesias@amd.com" <edgar.iglesias@amd.com>
Content-Type: multipart/alternative; boundary="000000000000a5bf2e061f3d88dc"

--000000000000a5bf2e061f3d88dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 11:55=E2=80=AFAM Rahul Singh <Rahul.Singh@arm.com> w=
rote:

> Hi Edgar,
>
> > On 22 May 2024, at 2:28=E2=80=AFPM, Edgar E. Iglesias <edgar.iglesias@g=
mail.com>
> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Move more functions that are only called at init to
> > the .init.text section.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
> Acked-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>
>
> Regards,
> Rahul
>

Ping!

This still rebases cleanly on top of master but let me know if I should
resend.

Best regards,
Edgar

--000000000000a5bf2e061f3d88dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 5, 2024 at 11:55=E2=80=AFAM R=
ahul Singh &lt;<a href=3D"mailto:Rahul.Singh@arm.com">Rahul.Singh@arm.com</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Edgar,<br>
<br>
&gt; On 22 May 2024, at 2:28=E2=80=AFPM, Edgar E. Iglesias &lt;<a href=3D"m=
ailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.iglesias@gmail.com<=
/a>&gt; wrote:<br>
&gt; <br>
&gt; From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesi=
as@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt; <br>
&gt; Move more functions that are only called at init to<br>
&gt; the .init.text section.<br>
&gt; <br>
&gt; Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@=
amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
<br>
Acked-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com" target=3D"=
_blank">rahul.singh@arm.com</a>&gt;<br>
Tested-by: Rahul Singh &lt;<a href=3D"mailto:rahul.singh@arm.com" target=3D=
"_blank">rahul.singh@arm.com</a>&gt;<br>
<br>
Regards,<br>
Rahul<br></blockquote><div><br></div><div>Ping!</div><div><br></div><div>Th=
is still rebases cleanly on top of master but let me know if I should resen=
d.</div><div><br></div><div>Best regards,</div><div>Edgar</div></div></div>

--000000000000a5bf2e061f3d88dc--

