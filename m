Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97537AD4EF4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 10:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011378.1389755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPHG1-0006Yg-5s; Wed, 11 Jun 2025 08:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011378.1389755; Wed, 11 Jun 2025 08:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPHG1-0006Wb-2Z; Wed, 11 Jun 2025 08:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1011378;
 Wed, 11 Jun 2025 08:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CElX=Y2=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uPHFz-0006WV-FO
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 08:56:27 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a4951f-46a1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 10:56:26 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3135f3511bcso3572795a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 01:56:26 -0700 (PDT)
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
X-Inumbo-ID: f4a4951f-46a1-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749632185; x=1750236985; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpRmrZjm92wzlk1LNU9s2Flj79soB6iBqe6IagrbYkc=;
        b=dsh4NjAjsvITs0qgzHhpH751KDySRo4f+aPmukt45qJzPNOrdi2abr11sbohgITXTe
         KifL6X0+D2cJitoPm0ASZqDIf+O+WkB8SRerIlYL+EGLJTrSYOqysit8q5xp8r6IOMuM
         +Bqjnxx15Hbd9H3wGWnml4G9ikTtuItfHYtr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632185; x=1750236985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpRmrZjm92wzlk1LNU9s2Flj79soB6iBqe6IagrbYkc=;
        b=u/vBm5BAlrG2JfpW9+D35kvfhIzF2TFAW/Nq7Eb9nlMV2iTgMHzI3n+Ovld+SKy1Ps
         +/+r0iPqNgq8A8f+NlMAZrgQ6lK2kOL2mzVXBP5vaEvxJNdu43TjeNjAzLN52qEa313t
         G9L7nH1U5xYVVtcCC/I3j6elpxJDMXKBT7c2c7FrxgacmUsZ7/GBZ6J1919Rro6esV2K
         KENv1D/Upmp3O5b53mzFX4sV62vDMrr7dBti0YizlL9h8wyO/OHuE/4gBvbdx5yUE5bR
         J/5Xyx09CPqChfGAnAksCuTwqcGqPk/4eQwhGiqz6290WxgnFxdbrXysXYhD7pyTmp8p
         PKrA==
X-Forwarded-Encrypted: i=1; AJvYcCX0S78is7GBHMWDj7GU68NUun+qpyxYgVkELoJzgkpMrRTwHtExj34pX55dZrfzky/XD0UfTjj5704=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygpvuB6Evx2covDsuczALZrGKHTKQn/9mb2IBYRFcr8NEVwPNU
	sjDKJFtKReJesltnoIO7EVVq0PYahexbJb5+pEW/CyGdaD/ImxmcLoF7oNZAOL6jp0NJUOj4FSs
	aMvp2DH6EhACXApl26YjcDc5tYojwK07K2oaPSH+o/w==
X-Gm-Gg: ASbGncvIsgD+7rPmtvlXxQ+UPuAwlO+JOXns0iusfom2TZRfoh0wA+sXA8vkWSjnfkk
	gwnuy1cY+IWpvbUUQQyXJU9nH9AdYBUzqTDSnQjdJyn3MbY6K5RnfXnf2Yxp0R5BXDlLVg1V9PO
	NYyEeZpVgNVMAvrbYiG5UesR06M4LAR+EtIZ+hIV/vEJo=
X-Google-Smtp-Source: AGHT+IGkXgitF8c1f1rqntDGnQf67ykDMpJpwFtPP+fTb2UBVI4KufYDMoCJ7aYKntA6iNLCoF8eJ2SBlYnnFQ3rJWQ=
X-Received: by 2002:a17:90b:1b51:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-313b1ff11b2mr2138706a91.23.1749632184927; Wed, 11 Jun 2025
 01:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-4-kevin.lampis@cloud.com> <d1da1803-ad9e-4666-ac10-97f40d27aae9@suse.com>
In-Reply-To: <d1da1803-ad9e-4666-ac10-97f40d27aae9@suse.com>
From: Kevin Lampis <kevin.lampis@cloud.com>
Date: Wed, 11 Jun 2025 09:56:10 +0100
X-Gm-Features: AX0GCFs6ePJBIxx9JFLajcEYXauuzdeEV8tdfxi0BZ6fYSLqHjo6npOqBUgqMyQ
Message-ID: <CAHaoHxZ=N_sjf3riiDv76kZYDjw7yywjTZL8Hgb7R2Q3FLCyow@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Disallow most command-line options when lockdown
 mode is enabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
>It's still being left entirely unclear what the criteria are by which an
>option can / cannot be marked "safe".

The purpose of lockdown mode is to protect Xen from unauthorized code execu=
tion
in Secure Boot mode. Xen especially needs protection from dom0 userland whi=
ch
I understand has traditionally been considered fully trusted.

>... why's this being marked such, when already by its name its use is goin=
g
>to render the system unsafe.
>Similarly I don't think it's a good idea to allow turning off MCE.

I believe these are both denial of service issues which is out of scope for
lockdown mode / Secure Boot.

>I won't go any further until clarification on the criteria was written
>down.
I understand your feedback. Picking safe comandline options and explaining =
why
they are safe requires more work here.

