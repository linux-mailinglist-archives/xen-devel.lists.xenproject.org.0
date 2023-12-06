Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CB80782D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 19:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649399.1013890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAx1o-0000qs-5E; Wed, 06 Dec 2023 18:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649399.1013890; Wed, 06 Dec 2023 18:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAx1o-0000oM-29; Wed, 06 Dec 2023 18:53:48 +0000
Received: by outflank-mailman (input) for mailman id 649399;
 Wed, 06 Dec 2023 18:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uigp=HR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rAx1m-0000oE-W4
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 18:53:47 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8925819-9468-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 19:53:45 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54c5d041c23so132045a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 10:53:45 -0800 (PST)
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
X-Inumbo-ID: c8925819-9468-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701888825; x=1702493625; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihGTYEniTkjtdxRgP7owzVf8ITuOwUCb0pPjHMeV5TE=;
        b=JHde+IdIiuleQT2tjIw0mrR+j8N9njplYLLBhOLXc4OiBKyU59JmvGXPQLa0yP9KAU
         UOZlRGQ0Mr9VzCiuhnh5S1IGnyGg+s6Lrpso05xRPYlY95ZBGJFL+4LYX8hY7hVvKpqw
         g8SAEZN2RU/T5KgQ2zTbowyj4od55Tons/3HW5NiYeXF/qeA5go15a2BxqL8Y/kEAf+P
         5CSizP6b2JyuX1U/2BbVUibFvi2PWQlorEEZ8v4ZYVvb/OLW+Qel0jrP64B8u6xCPUy2
         YtWqEzhMxiHhSzhyHYUmxIvcUtBo9zRvt70l8sXPDBffkgfCcShvV0uq8FPE7/O9kOIb
         z4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701888825; x=1702493625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihGTYEniTkjtdxRgP7owzVf8ITuOwUCb0pPjHMeV5TE=;
        b=pEz9vy5jasRwE4WzrGw715JmWJCDaYaTnG9AU9lL74oGWtTzfMJFitwkMftKiXD4qL
         lYraoNjsHnwOdp4lSIw49yRhXfEEgFU7qc83NMw9faen5tfsyGuUoe+5pAx1id7j46eV
         c/rK/nqqa7sDkIHxO4Knb6zENBpT5IpLD8G8nVDA4jASxjP/GDRrU1XQuVFIixgZqBHH
         LnOwyDcAWxh8AKAmcPhoGvS4XEtyVPXY7FMPlljoLV5UplNzYEMrgim3YofU7s4Z6CZM
         WFLOUJNl3BGXl+23k3oNQlnogCk+zKU26NQRTbdRXeg6SCmXTRUqK2PLa6hhwgVf5MQR
         TBEg==
X-Gm-Message-State: AOJu0YwDnKpn8gYc7x9HHqyotRXm9/SZlIuj8PUn4E1Dv/Qy5CwI2HVM
	Q49XmyLJmgZ8sZceYjkoIE+HkRXEIbf0s7aTs/8=
X-Google-Smtp-Source: AGHT+IG+mpBT1oISrhPaycnyi1xjaPgoHsi6s0BkvpiGUdS2fnnKTLuioIqDLqHu6GPTgTTk2xRa0NoWm3MHWcq0+24=
X-Received: by 2002:a50:9b41:0:b0:54c:e644:aa0e with SMTP id
 a1-20020a509b41000000b0054ce644aa0emr509222edj.19.1701888825224; Wed, 06 Dec
 2023 10:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-16-jgross@suse.com>
 <CAKf6xpty3ENpuPgTf7=Gk1Q-Ekn+FjOx=-ySMQF6v3kx7zntrw@mail.gmail.com> <CAEBZRSdyoCH2CFP14imC9We+sTiGn8f-DWecQ1t+ftd0+=0xwg@mail.gmail.com>
In-Reply-To: <CAEBZRSdyoCH2CFP14imC9We+sTiGn8f-DWecQ1t+ftd0+=0xwg@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Dec 2023 13:53:33 -0500
Message-ID: <CAKf6xpuamYUe_HPuw_m38PBO9cgLpq-H4f_1qjGt5C7ptSkCoA@mail.gmail.com>
Subject: Re: [PATCH v2 15/29] tools/libs/light: add backend type for 9pfs PV devices
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 12:44=E2=80=AFPM Nick Rosbrook <rosbrookn@gmail.com>=
 wrote:
>
> On Wed, Dec 6, 2023 at 9:36=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com>=
 wrote:
> > FYI, these IDL changes will require golang binding regeneration.
> > (Maybe we shouldn't have generated code checked in...)
>
> The generated code needs to be checked in for it to work as a go module.

I don't follow. The build system generates the *.gen.go binding files
if they are missing.  They can then be used, installed or packaged.
Why do they need to be checked into the git repo?  Checked in, they
have a tendency to go stale.

Regards,
Jason

