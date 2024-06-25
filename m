Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F77916DE0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 18:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747961.1155491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8su-0006bU-5z; Tue, 25 Jun 2024 16:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747961.1155491; Tue, 25 Jun 2024 16:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8su-0006Yd-2z; Tue, 25 Jun 2024 16:19:08 +0000
Received: by outflank-mailman (input) for mailman id 747961;
 Tue, 25 Jun 2024 16:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM8ss-0006YX-Bg
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 16:19:06 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3d5fed0-330e-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 18:19:04 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso473007166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 09:19:04 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf5490d9sm523337766b.115.2024.06.25.09.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 09:19:03 -0700 (PDT)
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
X-Inumbo-ID: a3d5fed0-330e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719332344; x=1719937144; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/gyvLVsUvwdFZoRqoPZx464kZFivE4+/zIbIpiWr4OQ=;
        b=MRV/GMX9PaaH0TxbC+g1e20s+7GhqQUT/fqMR7DOXXNNlojNzCwbH1XoxEwMDM4U2f
         CoatEZA+ngJmSq/F5WXV1Ho+Orv8gnVIRoSMNNET5tzBYpT4KsKNNqGhX3EI1D3SqmaJ
         8J/oVGHONS0EasxYEkviAN0taWNgHf7igIfqaKugAAw4TIlYoCPRxOKxA/sJcV2G2I92
         MfoLJdbwcwRmKYzfmbdzkK9p+usTmUxNwGnZ4/Tu4Sy3IvNmSdAgnLkmChsTcuynMJgo
         s9SyRDZ86hV2JVRql+FUK09ydfTsGJDvRiaaMRXRHfRJISk27euwc83rWsuEEF6mdnuj
         E7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719332344; x=1719937144;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/gyvLVsUvwdFZoRqoPZx464kZFivE4+/zIbIpiWr4OQ=;
        b=KkPq94d5RLvFhHTMxVaAzzQydJEWhA90wHcqrUKCIeRXS5qtmzom7xB+rNxXsv04f7
         FqGzUh/Z07CsQFf1fR93gNM9b2Ok4P4EPpw3TGd6s8+TVPVzDlWgHVwNhHoENWB5lPk0
         YeK5iEb7BMYwb7knCxJH+Vz18EUxeNAPYtHGKaAB97yK2JecgNzRd1xK6Wm3p5e4Xg0M
         2nUEeHwN1oWe2/5lp90wkvirlmYikRoB00eBWryoOGUW29OdIdr+Pi+IcOztzQGPqqUD
         sbSkhzqTi72Gnnusbf5pKmejiKfvYpe8bcd+E0gpuW7ERwvHX4NqJIbfANKQW6cs5H/B
         0ldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRgJmpMAyzQ84TrVDFkUjih/te1wiz3bzf2PBaWMGTz3mLXllyVoafAewliVklej5ycr1iHgUyqFj7pIG4Raz73CHcicDEpuELmRnEekg=
X-Gm-Message-State: AOJu0YytDkux1Ryv+kpoUxFbrhNin5XPopdww0itdkhgr8SXoic60M8h
	PYfo3dEfvC46TqB2rFUCOTs1IWqFciUqLkF6HC0v8vs04Guh4bWL
X-Google-Smtp-Source: AGHT+IHL1WudS5oFr66DSRGHjgzi9fR9ipckG/dR0Ybh60xUo7VUbDxX7uGZ0spt7lqQwQST0Sl2XQ==
X-Received: by 2002:a17:906:714c:b0:a6f:13fe:75d1 with SMTP id a640c23a62f3a-a7245c648a2mr505025066b.64.1719332343545;
        Tue, 25 Jun 2024 09:19:03 -0700 (PDT)
Message-ID: <eceae0bb1a55370d5c6a5baf52b28fb6187f7cff.camel@gmail.com>
Subject: Re: [PATCH v13 05/10] xen/riscv: enable full Xen build
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jun 2024 18:19:02 +0200
In-Reply-To: <10d1f56c-6b27-47ab-bd5e-208a0938c3eb@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <b47a278c89eb436a7b88dc5c0b18a6be09c76472.1719319093.git.oleksii.kurochko@gmail.com>
	 <10d1f56c-6b27-47ab-bd5e-208a0938c3eb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 16:24 +0200, Jan Beulich wrote:
> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > =C2=A0Changes in V13:
> > =C2=A0 - implement get_upper_mfn_bound() as BUG_ON("unimplemented")
>=20
> Odd, patch 4 also says this and also does so.
It should me mentioned only in patch 4. I will drop this line in the
next patch version if this patch won't be merged.

~ Oleksii

