Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7020816BCF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655860.1023710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBP7-0004yj-TD; Mon, 18 Dec 2023 11:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655860.1023710; Mon, 18 Dec 2023 11:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBP7-0004wY-Qe; Mon, 18 Dec 2023 11:03:21 +0000
Received: by outflank-mailman (input) for mailman id 655860;
 Mon, 18 Dec 2023 11:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFBP6-0004wS-6B
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:03:20 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c7f5eb4-9d95-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:03:18 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cc7087c6c4so9169551fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:03:18 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a0565123a8e00b0050e223d4b32sm736396lfu.3.2023.12.18.03.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:03:17 -0800 (PST)
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
X-Inumbo-ID: 0c7f5eb4-9d95-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897397; x=1703502197; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A/1B2P23M2dF/p23C/9AibOVYR2P7U7GZ+oXoZANPTY=;
        b=hdzIkG8yal1glX2x7QcGW4fuG5y2/QLbEHVdsAukbZU4OSgUr5TDS0h78BvR6i2Mva
         DqktXXXxw5OrlL2/ExKl2b0YpLDCv+v2wxNz2a5SNw6exaDrEtTc0CTwkzuB/XgNH12F
         1uy/sbuycMUm4TytkoeMxPsNnW/CGuHBgBcfTTgb7scQHz14ctpIqUX/rnPtWO/insWw
         Xoa/KZFWvHCq/CL6A9WwNX5iJwR0sQzfyIJfTDyTBp/0SkNjszlUNWo9/wUSi0NkBac/
         5PIeGdO09PUJSEqdW13+lC7FnKz4f3lxxKPS5a/etVCt+GZbITz+cXFOqScW7tZA0k1Q
         KiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897397; x=1703502197;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/1B2P23M2dF/p23C/9AibOVYR2P7U7GZ+oXoZANPTY=;
        b=kLD4eOeNPiKVMBbxjK7T7mqcWtUKDtlf4QbHWzCvWvP1RJesBOI3NaA9kTEt+A3XOq
         2foLQTus8dGYl+9S0q703iQgcLCjrAkZtK5aTgdIY8fUo9yITybRlHP9By3+CjrjvM/k
         lZQG4bZbqL3EgkeSqstn9Sr3m0h1AIwHix1dFOXSH/ohAaNjZOK3iRgfz/ecHrGcOwbE
         41yNLKD2uyO14B57GNsWFgG8D/mrp+Jcq6BEB5M+YpWXkSGRC83/JvzsTao2WPkmNW3l
         B/ZjRIFEgyooe0JvrbgbTNCvyN1/zmjCiJI3ScWMhmIWwRm0zCUzwtiDItVXV50pAPib
         XVGA==
X-Gm-Message-State: AOJu0YwoxU8c3HElG1VmXzXjvwORvJXJqMTqLBUx2puCZOXkkft2YLeA
	/2EFSnazYLCRI3JnTVkGo3c=
X-Google-Smtp-Source: AGHT+IGC4qdACHoXsCXNzwkF8ETpOhiDeFlVmibSF9tanh2Frx1akMXP+gjQ1JalQ0SxEITfImw9Hg==
X-Received: by 2002:a05:6512:4015:b0:50e:1d6a:48d4 with SMTP id br21-20020a056512401500b0050e1d6a48d4mr4045336lfb.122.1702897397442;
        Mon, 18 Dec 2023 03:03:17 -0800 (PST)
Message-ID: <0d0b66d6b143625c21811659afe31007ebae6f1f.camel@gmail.com>
Subject: Re: [PATCH v2 35/39] xen: add necessary headers to common to build
 full Xen for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 13:03:16 +0200
In-Reply-To: <2f79370e-ba6d-4796-a375-c4e19126fef9@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <88bab81d8412588dab82bb53193105ff4993961a.1700761381.git.oleksii.kurochko@gmail.com>
	 <2f79370e-ba6d-4796-a375-c4e19126fef9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 17:20 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> With an empty description it is hard to judge whether this is really
> needed.
> I would sincerely hope we can get away without. Note how there
> already a few
> struct xen_domctl_* forward declarations there, which - if the
> #include
> really needs adding - should be dropped in exchange.
>=20
> As a nit on the subject - it's only singular (now?) and could hence
> do with
> being more precise on what the specific change is.
It will be another one reminder for me to write proper commit messages
as I don't remember what was an issue.

I double checked what was the issue and it seems that this change isn't
needed any more... So I'll drop this patch.

~ Oleksii
>=20
> Jan
>=20
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -4,6 +4,7 @@
> > =C2=A0
> > =C2=A0#include <xen/types.h>
> > =C2=A0
> > +#include <public/domctl.h>
> > =C2=A0#include <public/xen.h>
> > =C2=A0
> > =C2=A0struct guest_area {
>=20




