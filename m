Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F29F317D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 14:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858025.1270270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNB7m-0006f4-Ol; Mon, 16 Dec 2024 13:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858025.1270270; Mon, 16 Dec 2024 13:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNB7m-0006c4-Ln; Mon, 16 Dec 2024 13:27:02 +0000
Received: by outflank-mailman (input) for mailman id 858025;
 Mon, 16 Dec 2024 13:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EuNa=TJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNB7l-0006by-66
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 13:27:01 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cbf5e51-bbb1-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 14:26:58 +0100 (CET)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a815ed5acfso14007885ab.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 05:26:58 -0800 (PST)
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
X-Inumbo-ID: 6cbf5e51-bbb1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734355617; x=1734960417; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k78SYHRlfjmw6gItq29cq+NFFn6CZCuog15ExU7ukHQ=;
        b=SWcXhsBMh8nQwmGSY/NTDhMZsYuV4rbe5Jbu2Kku2nhT2lj7uv7qYbnt6Gx5Gncibe
         Y4GJ4XsFN7RLnfIATGgPdxZNDmx+WumGeK37kunriyXJ3jQxkvBwvbMtd9OCH3WFQe58
         rO00UGbPGN/kNMrUVN3ywFYXtBuqlopegNFEQQHY6UYCqpYT7ZlHkTgZeMc/wCJGeDRp
         bMIvOiDfMiZIrFH19unWrKxrDJ/KyjKKZMYvh6LbNC/F7DQUnqyoyEUNHRR0/sIsWsrH
         Mltoh/LVc7DoXwEcAhbRMtjGbMA5MV6lz74W9hx3VTRuhxvE7QP/gFdH3P9saDNg0Bvu
         E+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355617; x=1734960417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k78SYHRlfjmw6gItq29cq+NFFn6CZCuog15ExU7ukHQ=;
        b=hBnPUx+XITPPV1Hc74OZzDA3gJLG4HzbcGwX+L2aHuZXugzPf3dqkXIIcTCCdsM9d0
         QKp4nBTAd+e7dQVQYhs5/MrGUFC5TfFndPWBXuhqe+DAujRGhfCpcKDRRDMK7W8g3fl8
         IC9ns5vela9K5OcwHEd7r3HTS7PE4qK1DuO5It15f/9aXfg0cNbY4P4Qb0EQ7Wb2AqGJ
         Ajk4rPi61UKeC9UWzftvm78v2KoAu2xRZzKsrj4hP5aCuBgnoGyNWyPyZ+ajC+XRBXtC
         wSI+UfvxUpIDOUTzwaU1iOyoceXrcLCGHaeUt+lATDE2HCw/89Q8sHnbXQn+S8lrbz31
         Cj4A==
X-Forwarded-Encrypted: i=1; AJvYcCVVpEhdzp3P48WTgs0b4f5dof7Yv/UQjf69irr3BXQyaIV0+TTleaqgagbZBqoXyCG9O9UDF90Reic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4wkQAez+JrJIs9/YRuYTmdKU85dyKNLshgH0PBPirwYMGmTva
	jefOCWPa5CR9NrDVTtUDNVQYvyaVAA+D5GrReyZGqHs4nN9ZtAXw82Ojji/EtEeyt599V7uICY4
	MeOdYTribu+GHo32uPSDQfr5L2CPyk6e/Yvb32A==
X-Gm-Gg: ASbGnctnYbxIQpP9P+F0CHzhv6cuEz3bSLPG8qmXNYMyj+UK7fc8wB8I/8MGAiQXsRx
	uZQk2Glyf/np/UtGZDlKgicYEfpE6X6QfRJtgLi0=
X-Google-Smtp-Source: AGHT+IEXCKhK6+eoE3hkWNmwiXOJQG2KLZp3TY8AISzfZ++eJFe1T7aYTE1IgBjn/InNrTNid/JVOqag5ZYryUzOSjY=
X-Received: by 2002:a05:6e02:218e:b0:3a7:e732:4713 with SMTP id
 e9e14a558f8ab-3affab6228amr103488355ab.15.1734355617498; Mon, 16 Dec 2024
 05:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-9-carlo.nonato@minervasys.tech> <9a8089db-cddb-4f86-bc14-9dd71b0bc7ba@suse.com>
In-Reply-To: <9a8089db-cddb-4f86-bc14-9dd71b0bc7ba@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 16 Dec 2024 14:26:45 +0100
Message-ID: <CAG+AhRVgzk=-StFHgBCxHrxKv=_CgUCufOdAVSpMtQyt1D3YHQ@mail.gmail.com>
Subject: Re: [PATCH v12 08/12] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Dec 16, 2024 at 1:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.12.2024 17:28, Carlo Nonato wrote:
> > PGC_static and PGC_extra need to be preserved when assigning a page.
> > Define a new macro that groups those flags and use it instead of or'ing
> > every time.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Aiui this is independent of 1-7 and hence could go in ahead of time?

Yes.

> Jan

Thanks.

- Carlo

