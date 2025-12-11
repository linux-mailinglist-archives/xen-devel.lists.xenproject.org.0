Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E818CB6540
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184257.1506756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiX5-0007Xi-4H; Thu, 11 Dec 2025 15:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184257.1506756; Thu, 11 Dec 2025 15:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiX5-0007UI-0R; Thu, 11 Dec 2025 15:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1184257;
 Thu, 11 Dec 2025 15:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTiX3-0007A2-EC
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:24:41 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82a6665c-d6a5-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 16:24:40 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-34aa62f9e74so237768a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:24:40 -0800 (PST)
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
X-Inumbo-ID: 82a6665c-d6a5-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765466679; x=1766071479; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rK+gF8ppzKcbsXv9Sn0J7iylIKfNWdUjRIPtDm19rk=;
        b=KQ+4nAIYdy9151dNQACQCD+XW3d28KcoCcQ3/zZFZmzHOX/RsqWpz5+HM4rqXutFwe
         UqCi90TpMojxYA/wy+ZR4Tx84kSDTh9tp+iZZqb2vZa9N49fqqY0LIImvZOOLwSFSbJ4
         nfZl0OIZgMTxwhkBDoW22go/Ptlokx8buaqs3ESa/5HjHImqnDAzH/2eAfd8rRFScI8/
         r8XMYqlt1HOBVvrhawz0JWNoaNW1nWUUTauBDl/G+cu4QuUQr5HqkgxZNmhLdhEa+V2V
         UEtYdaw8KLjF55gctwMBw7xRR4v0dkWakf8HkGrBsd20EF7I2Wk/wLJYaXCR0z6QU009
         Z8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765466679; x=1766071479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rK+gF8ppzKcbsXv9Sn0J7iylIKfNWdUjRIPtDm19rk=;
        b=gqi0rwRhSwWtry3f7QKxhuCUCA3a9kpOpiHh6KkmDfvWC+jcmOeneBV+XufcNUb56D
         75CqGFGkcYGhnlNQPmLUNz7JyLypd4Ch2CnMbthrYoaQLYEye+OoA+4qBbW6EYvwTs7s
         H6BWw2gxPsnr5iis1lj6lui3MILortF+reaU03mbO0+CYdbYLMoihsSdtL9I7WdhjYph
         JcQPA7fl+roUJh0zWB3rKmSXm+h1q/g/Zpe1OaWOVJYaDCTpTZcC4XkKr1RCsgVEBi01
         DKnPDSKZXPlqcOs09d9DzWb8KxmzpBU2a4qF3NY+Doou2j2fSgfe+Vl42MuEMuHd/rj8
         7qjA==
X-Gm-Message-State: AOJu0Yygx6zEFb7avwGmEVPXIdORqsgqmdJ0A3Rk9+dJNsm8dGrnfR1F
	WaJgYJRav8RwjCEB5Q5hkylryCwjdonJ6TbnkH8kscbb0i2c/qmT/X03tbPIlVpDknTsKWBMC2V
	/xQhXWzp8ZZy4zu4T4+2H4Nn1jytULQ==
X-Gm-Gg: AY/fxX6qABY/5/cIhPPIMHRCNrQAQpWCXEdhq+q3Z+XM6yob4dtNqCAyOnlDkWnbBkG
	gOejKKPwihQJjekdDfNx7A4gefb9/qQz6g7sxYl9F15jZ9zl1tpOC71yRpoYdjJODNwB+0pn/iB
	udCp2wpnPvR1Z4A+Xcp6iIkNrtccaloB7NcQ50rgbx7Pgc3zQl8IKm76PIZNJ2IV+vWd93Lxd6N
	AQGdWFYJ8RNYtosB2DYT/NZbHD45djCmvwc6IPwu2VB5qO3rQO8Rc1njIDlyAsBbGmz+U4fIXFD
	N5r8DFqj5can/dfnGbUANlMeVQhSDkr+Puc=
X-Google-Smtp-Source: AGHT+IENJuLgGi/WJ4SgdXhBsxmIGQEPOCrEDDZFslbBA9aaZdKvvu1R17SCLvhJPzKMZzeyttJ11dbW/zBJl82YSpk=
X-Received: by 2002:a17:90b:2e08:b0:33f:ebc2:645 with SMTP id
 98e67ed59e1d1-34a7285cd0bmr6955657a91.20.1765466678971; Thu, 11 Dec 2025
 07:24:38 -0800 (PST)
MIME-Version: 1.0
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
 <f49dd123-32ca-46b2-a00e-751267667bd2@xen.org> <CAHFNDNgUNg2zTvxweZndgWwZ9EJjFJr3YB7Ouk-4x3RqcKRnPA@mail.gmail.com>
 <0350292a-c955-4ce9-9f04-59540e84a8da@xen.org>
In-Reply-To: <0350292a-c955-4ce9-9f04-59540e84a8da@xen.org>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Thu, 11 Dec 2025 09:24:28 -0600
X-Gm-Features: AQt7F2pPw489SG45usGsani7h5aTrA-CKR3362cr66sV7v5CM_HB4Ja_Nl6Z6RY
Message-ID: <CAHFNDNgn9m-Jpf33k+=jwA9ENTs+77Kj-JK_2V_SeGFMbo+YmA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm64: Add support Clang build on arm64
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 9:06=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 11/12/2025 12:49, Saman Dehghan wrote:
> >> And OOI, how did you chose Clang 11?
> >
> > Hi Julien,
> >
> > To be consistent with minimum requirements for Clang/LLVM on x86.
>
> To double check did you try the version and confirm every works?

Hi Julien,

I compiled and booted Xen with Clang-{11 - 20} on both native and
CROSS_COMPILE=3Daarch64-linux-gnu-.

~Saman

>
> Cheers,
>
> --
> Julien Grall
>

