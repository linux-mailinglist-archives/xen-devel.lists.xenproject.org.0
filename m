Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8917E4832
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 19:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628969.980949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Qji-0008BB-Q6; Tue, 07 Nov 2023 18:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628969.980949; Tue, 07 Nov 2023 18:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Qji-000890-N5; Tue, 07 Nov 2023 18:23:38 +0000
Received: by outflank-mailman (input) for mailman id 628969;
 Tue, 07 Nov 2023 18:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0Qjh-00087c-JF
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 18:23:37 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3005f89-7d9a-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 19:23:34 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9becde9ea7bso1410815566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 10:23:34 -0800 (PST)
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
X-Inumbo-ID: c3005f89-7d9a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699381414; x=1699986214; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4awz8xlu5gQqeS3oMKh08Lwa8/xNPSu437k7l92JKk=;
        b=LloKpgpfi/aEH4pTjbbzFgKp9gqTMA3u++NEwY3UjyZgfcEkhW6M2qZJjE+lAu7lbB
         qDfv7UINCfbjTDrqlRCo3fgA5vyt4+7kqDucCnAHJgQN3VPkearfjPzqDyYS3MfMCD+q
         /xfGvnuhhhYJIieB+DJOkznoRgQkyej9O3VWWRAQXU+38mlfY7MRwET8oyIu6rvqd4pO
         D2MI9FvZA4aRZBTeFTzXwAxO9O1o4kzux9SUOp1LDkUpSXMrSqfVrMOEfjumMQZsnFH6
         pYcdEVr9zoJJh5wx+C0VtxtK24w93Be+J9iiq+4NquKgfA9sUB982F/yM3X8vviBsfbv
         nGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699381414; x=1699986214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4awz8xlu5gQqeS3oMKh08Lwa8/xNPSu437k7l92JKk=;
        b=MCodCZUwT1iukDLXd5leosdCFA3v9AfodRlzA7jyfyt2Ww1Rud1XulqXb9WYRotlHr
         zTg59jAbo7d8/3L8g/LB4ii6DWAkcVgD8UTDM+loQyI2gE+/SoAQcc8wdNGU3i650zIL
         /M8TP0sdoXByI5yQufAtI3AzmMmHfELQFi8Oyeq3stA9kNoY8l2Vl62kkvJ0KRDFKg6Q
         7lw0xeOIj7YbVBveuSUu4RqK0fFK4flHqhLAMY21ZzwF+NUYF3P7XYs5Am3KcunXUHJY
         n0D0fgM9KobuBKub1SVTQMMBIhUQfqGE8VGOxU8La/AbT6wsm0rGxEuh1ZplhG9+KN0Y
         SgOQ==
X-Gm-Message-State: AOJu0YzgOJT62kKvUzIzx5bJLPk/Q5ar5PZda3jwNeSwyCI7L0db5Z4+
	Kcj3XZnaf+DHO7yYhc0GkTHLGV1L+e7zUtGiI74=
X-Google-Smtp-Source: AGHT+IEkI1b8Pu7uqla+BuVaP8GwIMagAk2epVkyUrJcrHvrgqztN5jxaYLmd9KxHtl3t8BHw07HdjoG7mpzbQ3VnbM=
X-Received: by 2002:a17:906:3582:b0:9ae:50ec:bd81 with SMTP id
 o2-20020a170906358200b009ae50ecbd81mr2858949ejb.21.1699381414013; Tue, 07 Nov
 2023 10:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-18-jgross@suse.com>
In-Reply-To: <20231101093325.30302-18-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 13:23:22 -0500
Message-ID: <CAKf6xpvbHWwfDOef9GZEg-WEmb+1fZN+Y_BT379UW1Oa8r0dTA@mail.gmail.com>
Subject: Re: [PATCH 17/29] tools/helpers: allocate xenstore event channel for
 xenstore stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 5:53=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> In order to prepare support of PV frontends in xenstore-stubdom, add
> allocation of a Xenstore event channel to init-xenstore-domain.c.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

