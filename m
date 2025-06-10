Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A41AD33C6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 12:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010677.1388848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOwLt-0005XR-Vs; Tue, 10 Jun 2025 10:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010677.1388848; Tue, 10 Jun 2025 10:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOwLt-0005Vw-SO; Tue, 10 Jun 2025 10:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1010677;
 Tue, 10 Jun 2025 10:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tqcb=YZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uOwLs-0005EK-8h
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 10:37:08 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2bafe8-45e6-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 12:37:07 +0200 (CEST)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2ea34731c5dso1400854fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 03:37:07 -0700 (PDT)
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
X-Inumbo-ID: db2bafe8-45e6-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749551826; x=1750156626; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQllWdWvQ6GyUrcNbIKWc6GTA25rlnnJsfpyeRJ6bq8=;
        b=IaglCuio0JrWyAvqLKdWCczeC1hHCPhLgjBoJiTPNXOx8Upj7wCRuHUVVrbdxuTmQV
         XqZmU+CpPtGZ6tIH0jaYU+upO2y6h3r2dy64d/uOkzAErkQfuCqh3bYksqDGL9cm6SiJ
         mJAJhYlN7ZOLppGt4T1cGzdksxx0zlDVcKNJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551826; x=1750156626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQllWdWvQ6GyUrcNbIKWc6GTA25rlnnJsfpyeRJ6bq8=;
        b=rtz+UUtZV5wVZtzsj8L7JUxVnLBXk6yFRd8BZ8ft2rplDEW0yNVvwMU2K48P8xvPqq
         V0inIZbMTlhOum4h7NQjsOMmL1Z8L0wWHgCn88j0xc92ExceMQvIopW4aCcCFZefBPfP
         RsPnf2CdII548VUDq7wQOUe59nOaVQPkrCeQqoz2Oo8j6N/zEDoZ9uRAUoPbSfsi2msO
         +cejsgUo5yrYdVTrgI1B6kTrTeiPkQs/dOtgjAZITkG+Ojqfb3fSDbYrrAhlBMOOiNjS
         wroAfwI42YCab2IFRa7bJaeUHHzf98CENT43xQkJyBRZrdCzT6Ej9/Q4rpPSQig3UERF
         oNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiT40dVrM5hS/i/+IOi17p1EWVKhwUHh2E09q/SIKJPYyD8HTOEQsvHqMv0DHVlwFes2va+pydHmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZL+NVGn4PPACvdCUx/wCT/+2m64bKBifVj5is3AeEh+2TIXlK
	wmTSnQcNybSf/GVhXwmhPJcWczP9V9iDF0J3IdG/7iOxBqD6AnLN1NA01jkFwdKiKNKa198/zbD
	NBNdkUUrMce2WNTqRyG/aaN6f2NeVcYw+jjYRHv8ALQ==
X-Gm-Gg: ASbGnctGOpXafAMXTUzO40cXA/XZkMm5v8tu52Kl8BVYsFltQq3TDR8ydBbiTnvbJxP
	kPyf6qRZuuJcY9+clVUGGxCADxhJ4egms7wnDDRCPU62qJQRMrV46eLRdsjA6WLYOjtOWJf2CcF
	OsWVdf3LmB83Z2e41Xuz8eUTLEIlnB4RXMbHlZX3VX3Vg8pdFBx4TF
X-Google-Smtp-Source: AGHT+IEEI00uC9sZ7cAalAOoYq0t2BJVjAL/TiVQetB5KAFmU1n4zeIdDfGSt67mkbD818/2aVj8c81KOCgEW67UCcI=
X-Received: by 2002:a05:6871:4b06:b0:2c2:bd31:cf37 with SMTP id
 586e51a60fabf-2ea00679c87mr10431002fac.4.1749551826473; Tue, 10 Jun 2025
 03:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250610101228.24460-1-freddy77@gmail.com> <d89d5d6d-c366-4511-8ffd-5aa83c0fc034@citrix.com>
In-Reply-To: <d89d5d6d-c366-4511-8ffd-5aa83c0fc034@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 10 Jun 2025 11:36:55 +0100
X-Gm-Features: AX0GCFurVAGi2D5Izvq0V7p4mEjR4f-o3SFD-pkM8FCxB3B1vDF2pbxYzRrrNRc
Message-ID: <CACHz=ZjRTa0R-oytF7HPNbao7SFzAwKvccmemGOPqgejF3PTyA@mail.gmail.com>
Subject: Re: [PATCH] xen: Strip xen.efi by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:17=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 10/06/2025 11:12 am, Frediano Ziglio wrote:
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen.efi.elf can be used for debugging.
>
> Agreed.  What Xen previous had violates the principle of lease surprise.
>
> > Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
>
> Did you intend to send this patch personally?
>

I noted. No, it was developed as part of CSG work. I think some
configuration left from the time we had issues with the email.
Still me, so the signed off should be okay. Should I update and send it aga=
in?

> ~Andrew
>
Frediano

