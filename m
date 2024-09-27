Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9D988746
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 16:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806331.1217657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suC86-000300-76; Fri, 27 Sep 2024 14:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806331.1217657; Fri, 27 Sep 2024 14:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suC86-0002xs-4N; Fri, 27 Sep 2024 14:39:34 +0000
Received: by outflank-mailman (input) for mailman id 806331;
 Fri, 27 Sep 2024 14:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwNM=QZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1suC84-0002xm-5R
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 14:39:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e37d96b-7cde-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 16:39:31 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so308043166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 07:39:31 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2948029sm140410566b.127.2024.09.27.07.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 07:39:30 -0700 (PDT)
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
X-Inumbo-ID: 4e37d96b-7cde-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727447970; x=1728052770; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyuQw+vijcV2whKMRin/KI8PM7e8zVbY6EqGkrFNYBg=;
        b=etOTm9FPkTRZxh+CNGao8JbXg5+Er+Ky2rd07pNp35Yd6bzQFkxjXJoKyVrHcoH1JP
         FnoUZZHJFBO9PjgzVBIsdUb68dgT6TIZgDZVfRnBBRXdSdt9rePoFXg+KAx1+Hx3ELb5
         3tRTSWytl/UwonjRd5/nTQCLPlYZsyZa4cGNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727447970; x=1728052770;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dyuQw+vijcV2whKMRin/KI8PM7e8zVbY6EqGkrFNYBg=;
        b=kGZKEaBDBjYzZ6XfV3I9MalNKJVPOg+DXerkVi5lEao5ULw3J76Mf44Cz4yIhmRM1L
         mk+jja3CUzhZVrLSFO7/8fyx1cxD6mgs102rNfgRS17oqP3odOYNbFa1DwSQyAfvI8Pk
         fto3IOE/mGRfU2MpokBLRaVH58cwkNDWlpbuaOF6P87373+NT7H55dcCdeMiwcGbOMtT
         hMdpJ8579hU/aKXZNQzCAq3kPC2MiipsEa/ov6EJYFK059dapNJB9EJewPkqF7Tlq3Mv
         GWgKGdfNtRB5ika0nfDFg6frIwIrQU2ToiS4sqjJgKVHxMEaLk2ijftUrR28Gr7dWETq
         kmgg==
X-Forwarded-Encrypted: i=1; AJvYcCUrxx4twRsz0D7aAksAZV5qhfSjb136Gc+uzbyHyUSZpdSrBk5FuZbtvLWVIHWLRX8uxsqNWN1TJ3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGe84Ywk8/lOsxtYREz2zUCS6mvCHaJ/HOdSNjiBlFlO16MkEr
	DYiZX7/SDUu1f5FcUBuf4ZQyOxcfcaBjdytGb6aBy4/56xTWkHV6YSPq5IZKA8Q=
X-Google-Smtp-Source: AGHT+IGzizp8EOfC0BnISsaB7keW8S+SeN3laG4JqjVqcwv1shvwq2PM9hEA++5cndHdi2ifwEkx0g==
X-Received: by 2002:a17:907:742:b0:a86:7fc3:8620 with SMTP id a640c23a62f3a-a93c492a261mr297466166b.31.1727447970456;
        Fri, 27 Sep 2024 07:39:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Sep 2024 15:39:29 +0100
Message-Id: <D4H575Q7NIO1.155E12B37CBAQ@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v3] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20240927142305.299841-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20240927142305.299841-1-alejandro.vallejo@cloud.com>

On Fri Sep 27, 2024 at 3:23 PM BST, Alejandro Vallejo wrote:
> Hitting a page fault clobbers %cr2, so if a page fault is handled while
> handling a previous page fault then %cr2 will hold the address of the
> latter fault rather than the former. This patch makes the page fault
> path delay re-enabling IRQs until %cr2 has been read in order to ensure
> it stays consistent.
>
> A similar argument holds in additional cases, but they happen to be safe:
>
>   * %dr6 inside #DB: Safe because IST exceptions don't re-enable IRQs.
>   * MSR_XFD_ERR inside #NM: Safe because AMX isn't used in #NM handler.
>
> While in the area, remove redundant q suffix to a movq in entry.S and
> add space after the comma.
>
> Fixes: a4cd20a19073 ("[XEN] 'd' key dumps both host and guest state.")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> v3:
>   * s/dispatch_handlers/dispatch_exceptions/
>   * Updated commit message, spelling out the state of #DB and #NM, and
>     state an existing race with debug keys.

Bah, I didn't refresh the patch with the latest commit message. It was mean=
t to
be:

  x86/traps: Re-enable interrupts after reading cr2 in the #PF handler

  Hitting a page fault clobbers %cr2, so if a page fault is handled while
  handling a previous page fault then %cr2 will hold the address of the lat=
ter
  fault rather than the former. In particular, if a debug key handler happe=
ns
  to trigger during #PF and before %cr2 is read, and that handler itself
  encounters a #PF, then %cr2 will be corrupt for the outer #PF handler.

  This patch makes the page fault path delay re-enabling IRQs until %cr2 ha=
s
  been read in order to ensure it stays consistent.

  A similar argument holds in additional cases, but they happen to be safe:

    * %dr6 inside #DB: Safe because IST exceptions don't re-enable IRQs.
    * MSR_XFD_ERR inside #NM: Safe because AMX isn't used in #NM handler.

  While in the area, remove redundant q suffix to a movq in entry.S and
  add space after the comma.

  Fixes: a4cd20a19073 ("[XEN] 'd' key dumps both host and guest state.")
  Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
  Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Would whoever planned to commit this mind replacing the commit msg on commi=
t?
Otherwise I'll just resend.

Cheers,
Alejandro

