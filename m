Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABB8CC218
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727655.1132238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9m0A-0005Fi-2r; Wed, 22 May 2024 13:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727655.1132238; Wed, 22 May 2024 13:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9m0A-0005DI-02; Wed, 22 May 2024 13:27:30 +0000
Received: by outflank-mailman (input) for mailman id 727655;
 Wed, 22 May 2024 13:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KudH=MZ=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1s9m08-0005DA-QU
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:27:28 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 077a223c-183f-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:27:26 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1eeb1a4c10aso9670035ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 06:27:26 -0700 (PDT)
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
X-Inumbo-ID: 077a223c-183f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716384445; x=1716989245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwB3RcBisi76IVmLC/UT43L475zdqnUfkVo4QkSZkpc=;
        b=OxRqsVrvqPmZHfR2nRAUvCbiwtWx2soi5UYEI7cNW7aWKPjbuO2DBEWIZLAqXIMnOm
         HQUAQI/2KhNbA65S5P3VRRWkjJlqVxfauKWH7rIrcIOLRaQjwtIbfsCdS/H8scaxd1Ki
         tPJgxF2+5MPa8FNIj8IRq8Z/BVUJJVLQTHeiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384445; x=1716989245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwB3RcBisi76IVmLC/UT43L475zdqnUfkVo4QkSZkpc=;
        b=BoVfj7KSfoliz56Xsk7RJu+Bu1q259Awrww7+zFGLJJZsbbzVyejiypmZ0/WZcMEl6
         V8OBJJICvZauoZPlR6ChOfwe/wR07/FH4T9h3+wR89Ok9aFNkWN4ogXAm4fZ4uvHZrEs
         xQZAFkJBy9Q94lD8+UDK9C1/iRZUcQjCMR6TZ4MrG1aQ06M872Ahu4Y/MvGz8kJhrnGs
         0AVt9ZFwKHzQ/p5DBFkbLOtOL7wstHcu6EDSIvcUEmY+LTu2GkIj+Qiog/BvKF+eHTUd
         EuxtOQBTrOisfxj3P9ffxJZSDLfDYemRd0dTZJDxu2+IF7GsUuTt+Trc6QuZwwGvvN3c
         RcUw==
X-Gm-Message-State: AOJu0YxHNqp5wcAhHJR5vz99rxzU/GuIxrq4O2NY3DmLfbWIvvBhda05
	l2OwxWWEudxcq7dE/YqlYH5n+FMSMFKi0B41kc8R6AhGqfNTt2khdZFWGl7deJlFUKOS9rGRyHO
	kWuRKv1mHu1FSzCIOmFgWbpDZiQrN5qEZ8X8A
X-Google-Smtp-Source: AGHT+IEPsZO4wTSTvCCWbqkQjo3rpj0QNpwikohXeENbBm/GcVY3/qwcND9IKst8HidOA5jp2xgin3nRz3GJRNuLlko=
X-Received: by 2002:a17:902:e54e:b0:1f2:f9de:c9e8 with SMTP id
 d9443c01a7336-1f31c95d498mr21594415ad.2.1716384445238; Wed, 22 May 2024
 06:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231201101641.51198-1-roger.pau@citrix.com>
In-Reply-To: <20231201101641.51198-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 22 May 2024 14:27:14 +0100
Message-ID: <CAG7k0EoQDXiK4TL4Ew3RxE8s=tM5zvSVPZ3_TBmfn=6w-GBqpg@mail.gmail.com>
Subject: Re: [PATCH] xen/livepatch: make .livepatch.funcs read-only for
 in-tree tests
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:16=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> This matches the flags of the .livepatch.funcs section when generated usi=
ng
> livepatch-build-tools, which only sets the SHT_ALLOC flag.
>
> Also constify the definitions of the livepatch_func variables in the test=
s
> themselves, in order to better match the resulting output.  Note that jus=
t
> making those variables constant is not enough to force the generated sect=
ions
> to be read-only.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

