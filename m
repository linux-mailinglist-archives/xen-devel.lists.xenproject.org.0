Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB17E49F4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629022.981059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SoU-0007PA-DF; Tue, 07 Nov 2023 20:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629022.981059; Tue, 07 Nov 2023 20:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0SoU-0007Mq-AR; Tue, 07 Nov 2023 20:36:42 +0000
Received: by outflank-mailman (input) for mailman id 629022;
 Tue, 07 Nov 2023 20:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0SoT-0007Mk-RV
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:36:41 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b4f5620-7dad-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:36:41 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507975d34e8so8830414e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 12:36:41 -0800 (PST)
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
X-Inumbo-ID: 5b4f5620-7dad-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699389400; x=1699994200; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UtFnh89Bh8lRzcK4cEy8IYfEXdp9w6zh3nW5sRUOYo=;
        b=TVWydbTz7v+PCp5p58MUsuwurxyn/OO9anULcseAAOD7RE6fMiueZCqPlsYsds0kpC
         tmjuyunT15/rvhcHdHoPsRE1UM10Berx0XTd7VZRwXsdCzaWu3r89vNE81+moTxa5/E/
         VGdQ49cWksiDwObAMdz3+4phNv7zJtkBTM0dehOJLunq1QrD5nV46jLaLhGNVUbnpjU2
         O4t8KU43moFfXH5RyeaUxAXBPFZiUHmbNS0KS593hlgdSsE8n1/jt5cxn6luKg7IIUKs
         AdAoVccxG4czY3mKJLXBKgxUsdI6MiTMZ6gdfD8WC5SRt2hji02lCt09rnoAkIhvAqTB
         Egbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699389400; x=1699994200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UtFnh89Bh8lRzcK4cEy8IYfEXdp9w6zh3nW5sRUOYo=;
        b=pEBBHi3rYB+a5prAPucTguweMUVZIbe/DNgGpk9AvVesOELQOsWOMdkIm1zEMzdgID
         DdI+PBjovHZy2awLRT4OxGdpc3YTuh1cCe6B3/xb2Jk7VRP/JpiiYgUhV+5H8Tw2PKN0
         LCZteZm6ja3vzdgy8DpftSapeIcsbb6TqegLHTdi8+42Szk0Js/ihMaQHczgEXJ5A6Nv
         YYx7D6qdqDO1IFNVUmu+y0MJ/iCrvU7wRy0JDz1hlo9i9gsIntSZC/nL3xuN/e+H1OTA
         ruyqeBZTAePgVEq5NEfKglqzGEUdNXx10rzonKWc5Lz+asw9OqQc072oXaczHHAyDYMq
         jwoA==
X-Gm-Message-State: AOJu0YyJ0/F0cYXumFVwF+UEO72mI1MsuqaYmBdZlZt/QNQpeiuz2NH7
	MxdlgIYqha+AIfh56JwZtiwNq2LrSqcSvdgg8pUsaUdc
X-Google-Smtp-Source: AGHT+IFEYjVjfcduufFFz41gcB3ymcFkZUd0UAGkgTpu+LRxIvZG2Xa9hji74oD9G3P2eLzC9vP/FUqFYseOj6ExIek=
X-Received: by 2002:a05:6512:3e12:b0:509:488b:4de4 with SMTP id
 i18-20020a0565123e1200b00509488b4de4mr17264333lfv.1.1699389400198; Tue, 07
 Nov 2023 12:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-29-jgross@suse.com>
In-Reply-To: <20231101093325.30302-29-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 15:36:28 -0500
Message-ID: <CAKf6xpt05idfAWFHBfjxMYWq=W8v_54c2z_DUM5AraofCC3b4A@mail.gmail.com>
Subject: Re: [PATCH 28/29] tools/xenstored: support complete log capabilities
 in stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 6:49=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> With 9pfs being fully available in Xenstore-stubdom now, there is no
> reason to not fully support all logging capabilities in stubdom.
>
> Open the logfile on stubdom only after the 9pfs file system has been
> mounted.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

