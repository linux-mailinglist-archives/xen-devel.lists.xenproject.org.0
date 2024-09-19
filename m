Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79F97C943
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800743.1210739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGN2-0004FO-VN; Thu, 19 Sep 2024 12:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800743.1210739; Thu, 19 Sep 2024 12:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGN2-0004CM-R4; Thu, 19 Sep 2024 12:34:52 +0000
Received: by outflank-mailman (input) for mailman id 800743;
 Thu, 19 Sep 2024 12:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1exg=QR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1srGN1-0004CD-6L
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:34:51 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f837f26-7683-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 14:34:50 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5e57b7cac4fso441789eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 05:34:49 -0700 (PDT)
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
X-Inumbo-ID: 8f837f26-7683-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726749289; x=1727354089; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aI1mVibnoIqNM6556rC3Df5ZS/vsFBFvC7BZYbogTyQ=;
        b=l3Op3y8Z4GioLb2lXpmg0FrYBtetbGf9aqYw3x8BzfGou13CF/F/PSsJd1jmovAcWa
         g462AA4q/f+2wO0ElYOOrFQOyZ3GTCjr7FAWOmv2p8VvwJZM+L8nEKzqfixByaZsLpyx
         JOo86NB9lGYW2QvEVRjRH0A1HrL896xL/M5L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726749289; x=1727354089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aI1mVibnoIqNM6556rC3Df5ZS/vsFBFvC7BZYbogTyQ=;
        b=oq/v8/VlDLtiMLBSGJnnPCJ1uvaf+kCml6YNstpbB3qQI5I3VFnXByBxxR778FfekS
         J4KEqhlzCQeJwQ/rLs0PkkUVTBY3c7tjMwUkJqUHCdRc6P2DkX10kH2AFO0XZypbfrpL
         ANCLlUXAnfZszHcRiZvcrE92blOyQu0dLTzSWJj5qT8Q8f63I2XUxFes8dlzi+ZbIisc
         cy5GinjSLf4tR94NI4MYIVwhRWg0PURFAFRAiOIItpDNENPgzNJ+IYI65Cije+yZXA1f
         QYYfm7ZzAyUe00QzR+Ol4iwfuFz8KbLjHKoR4AEHAkA0saq5rS6XWfFOcK6ApbliAxoH
         uH4w==
X-Gm-Message-State: AOJu0YzGmXQjmt5kqZI7WgP92XV7EByPQv+CQBebD6OfG4mhfRuEY6Nj
	dlKU9hZcUy6vvgR9hrRCjEHu4wUY15XckNQkEj0i9o9KVGEJc84Qp5+Mcae9YeYQ7K4aUCQ/jbD
	+Ydi4+C9g/xm0ptHX7QCvc4zsJxBVlYjUaWQh+w==
X-Google-Smtp-Source: AGHT+IEvxtpY7A6Hq4wvaVoE8BHhj5QBL8I4GDf8uu4OgPmkuQAMPeMWWqG9wSsw4LBxyDAqjsytuQfVJ6UwMqRTS4I=
X-Received: by 2002:a05:6820:612:b0:5e1:e87d:9e75 with SMTP id
 006d021491bc7-5e20142f4edmr13255678eaf.5.1726749288661; Thu, 19 Sep 2024
 05:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
 <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
 <CAKp59VFp8gNA6ndeK2DeE9EaRZJSup0ptYYPz4FwN4_Shx9SjA@mail.gmail.com>
In-Reply-To: <CAKp59VFp8gNA6ndeK2DeE9EaRZJSup0ptYYPz4FwN4_Shx9SjA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 19 Sep 2024 13:34:37 +0100
Message-ID: <CACHz=Zh7FB0h26zJDZnzkVRatwhTb=vWMA0TM+fpqZ=RtULTJA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/efi: Use generic PE/COFF structures
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com, 
	Nikola Jelic <nikola.jelic@rt-rk.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 11:42=E2=80=AFAM Milan =C4=90oki=C4=87 <milandjokic=
1995@gmail.com> wrote:
>
> Hello everyone,
>
> Any comments on v2 patch?
> Just checking if you missed this email or didn't have time for review.
>
> BR,
> Milan
>

Hi,
  it does look good to me.
I don't like the "#include "../../../include/efi/pe.h"" line, but I
don't exactly know how to add a -I option.

There are some spurious space changes that could be removed but okay
for the rest.

Frediano

