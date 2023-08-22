Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891F784503
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 17:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588577.920113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSyw-0003Xd-KQ; Tue, 22 Aug 2023 15:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588577.920113; Tue, 22 Aug 2023 15:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSyw-0003Vl-Ha; Tue, 22 Aug 2023 15:07:46 +0000
Received: by outflank-mailman (input) for mailman id 588577;
 Tue, 22 Aug 2023 15:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uya+=EH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qYSyv-0003Vf-1R
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 15:07:45 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4d1d55c-40fd-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 17:07:43 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50091b91a83so492099e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 08:07:43 -0700 (PDT)
Received: from [192.168.100.67] ([78.152.69.193])
 by smtp.gmail.com with ESMTPSA id
 l23-20020aa7c3d7000000b0052a023e9b5dsm5305482edr.47.2023.08.22.08.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 08:07:41 -0700 (PDT)
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
X-Inumbo-ID: a4d1d55c-40fd-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692716863; x=1693321663;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A+VqRrDF3jVnznhLVnJ2azEYu+VpxcRz/NmPtqT3gDs=;
        b=ccQ/8v6MvY9LXGXNHaAiloPvVoPNCcRetENSdx2NBHQtqvHn6wiHn1SBMGOAPbnIzp
         qwmoTfKODY8LDViHphwJEQgxPd043CCBQZ2hOAOHYGLoFjdCFuC9TZxM+yrKBm58XIG/
         QP2ak01pK3/mmaziO+Ihn7HxFuOptc2nAmtfk/+k42uQKsJ33QpYf9kNM3WoUR+y2p1A
         A9KC4HP5/WmaqBK4qnPTRZ26zI5EGJeMhooI2+ZM3ysFTieIoohoYfy77dvS60VilMIR
         ENuPQooZ3FrH84CGxWyvdILD6WpF8DPn5WFk1JkP/5pQ7/YCZnn9mok1N8XbJfWQuM78
         rTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692716863; x=1693321663;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+VqRrDF3jVnznhLVnJ2azEYu+VpxcRz/NmPtqT3gDs=;
        b=akUcbpFgQMt/7M3UfOdavQeMLSrn9v4klDjlPyVeH5WMr9vbeFTMIC/aamUyV6GskK
         z19ZCVqzB/BIObUbrdVJUNC3Up+KBuQ6u8uFxzyOz5srnRpktLfEwcmTr7r8mpKGWgHs
         pF73eGpKkZUn3e6JTXIOaVOyiZG/+h96LdgKdPt/Z6yay2y8hO97XtrxB9MpJ41rf4Pk
         Asuw+rwGOpn0nnGA6sAQtdM0IXa3jLRhVWDAcN0DhNRjUc4uRWN3Js1TReoogE9JAO2m
         l1GZwc+ktp35AhqT2BSKMQ8buBxgE6Eqp8mEla4KIClbG8j7N/JlG4pbfc9OMbYZeDOP
         1+Rg==
X-Gm-Message-State: AOJu0Yw0eVd1HnHWninMLq3DbIYb6vlym7KJaQ2cH5OdZ+scq11n9HUd
	ZT9gjDScZ3oyOqjhGd8nEOM=
X-Google-Smtp-Source: AGHT+IFcvHg3Cny9BaBeAFeS+F8ikAPrVWZ/C7fA3ZEcIhq80SWHWn0M5SIqfKubhho0ktNi2VS4KQ==
X-Received: by 2002:a05:6512:3085:b0:500:7fe6:793b with SMTP id z5-20020a056512308500b005007fe6793bmr5005355lfd.35.1692716862312;
        Tue, 22 Aug 2023 08:07:42 -0700 (PDT)
Message-ID: <fefda615259a0f16e09e62e6747768843e3627c1.camel@gmail.com>
Subject: Re: [PATCH v1 45/57] xen/riscv: add definition of __read_mostly
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Tue, 22 Aug 2023 18:07:41 +0300
In-Reply-To: <b7ad6a92-3c59-a33b-903a-fd0af2fb88af@suse.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
	 <e11462a0dd6e71884aa114493d75674411e26701.1692181079.git.oleksii.kurochko@gmail.com>
	 <b7ad6a92-3c59-a33b-903a-fd0af2fb88af@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-08-22 at 08:22 +0200, Jan Beulich wrote:
> I did already post a patch eliminating the need for this. It's just
> that
> Andrew doesn't like the new placement of the construct, yet neither
> suggested a reasonable alternative nor showed willingness to accept
> the
> change as an intermediate step.
Thanks for notifying me.

I'll check your patch.

~ Oleksii

