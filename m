Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B67FBDA9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 16:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643271.1003283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zdn-0000Cw-3H; Tue, 28 Nov 2023 15:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643271.1003283; Tue, 28 Nov 2023 15:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7zdm-0000A2-Vs; Tue, 28 Nov 2023 15:04:46 +0000
Received: by outflank-mailman (input) for mailman id 643271;
 Tue, 28 Nov 2023 15:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r7zdl-00009L-Sk
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 15:04:45 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75aff0ec-8dff-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 16:04:42 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bbb4de875so923102e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 07:04:42 -0800 (PST)
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
X-Inumbo-ID: 75aff0ec-8dff-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701183882; x=1701788682; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6RasPRjqLekPaCWTZWVwoaNF9xE1LG4BiV0oARaPgY=;
        b=Bv9BUMTITZ985d9l093sm4ZJpCfng5EeCIqXOZ6TbDGwVJ0C+nzCwi3BQJEJcNA4Qc
         e73tguVao1ws+/NqO0GAUFzwhJOaT4J2qe/8c4IuKTWqLdqqTUcHrBDYmFAIrHDi1mu9
         Z6odYzMKJipCVlBLNtQaJQCavpMqfMVQ/nJepS33yMMuEJNiN9Q+sGbNKC5fDjvJN0Ml
         R2ennBjYAqhcrzu1ierdfs/xF05wR3AOw9/QgN/4VlcB1hZBMMCkL4CaSuTKmQvYgW6n
         yHDYpSuVprey7CTrl4aTVpEFlBHV+9wdp3qQTdR2jc5AmI/tA/Bg+dXL8iehXFqThgOM
         m4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183882; x=1701788682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6RasPRjqLekPaCWTZWVwoaNF9xE1LG4BiV0oARaPgY=;
        b=fduIFRyRLOdeZq/guwexo36t6FxqjM/2xvtFWlkBQ2oum14qcMslykmR0TE4O9QhD+
         sM7srBIYnXXRR54IlXxWa+Lp45Sw5f1HKMBS8Yzf/aplJallCiYrEPthxGgultyVs9BS
         jUe0KeQaWaIu924izo1kv/kTTP6yYGdzwOnJzDJ14ePVz4QmmBhNOtQAyu78lqIfb1Ur
         fSo795Cm1s9iuCKZ/IbpFFlBcEkRayBx0Lze+pBRMnKPwNVjpNEJryDoh2rkcz/IHqn8
         aKR3Qpw3I58miz8eVbKYwcuCtTCJdAC/5/TlcgfwWxNeNSXfYIzG51LCoAwdVC17wj7e
         dMHw==
X-Gm-Message-State: AOJu0YwuR8cS7C39oUbyOUmos61BqDjIlxr7buc7/s7O1DbGFD8rLlI6
	THTvWdPslTUnjYZjpo9dLK7yTsZFtHK/HaOz6So=
X-Google-Smtp-Source: AGHT+IHeNh40yWCjaLBVfoCGZ/wk7inbvg6pxaMLvvP+/1Laqq3LLIWKV/gVTn4t5u1zwB+MqumSTwR+W6xd4Eaeubw=
X-Received: by 2002:a05:6512:68:b0:50b:ad95:7a44 with SMTP id
 i8-20020a056512006800b0050bad957a44mr5432234lfo.46.1701183881686; Tue, 28 Nov
 2023 07:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-9-jgross@suse.com>
In-Reply-To: <20231110160804.29021-9-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 10:04:29 -0500
Message-ID: <CAKf6xptdYwcS+Jhj2jbyB-CX3kRwUL4vXXceuF3+dDxLA6QOrQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/29] tools/xenlogd: add 9pfs walk request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:16=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add the walk request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

9P2000.u has support for symlinks which you're explicitly not
supporting.  A symlink would only be present if someone on the backend
side created one.  So there could be some corner case that is
disallowed, but it is probably better to just disallow them.

Regards,
Jason

