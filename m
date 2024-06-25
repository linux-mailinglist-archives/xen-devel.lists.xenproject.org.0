Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB29160AE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747407.1154800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1GX-000498-Aa; Tue, 25 Jun 2024 08:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747407.1154800; Tue, 25 Jun 2024 08:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1GX-00047Z-7m; Tue, 25 Jun 2024 08:11:01 +0000
Received: by outflank-mailman (input) for mailman id 747407;
 Tue, 25 Jun 2024 08:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM1GU-00046D-VG
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:10:58 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7332bbd9-32ca-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 10:10:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57d044aa5beso5914155a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:10:57 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d66b04378sm1281480a12.38.2024.06.25.01.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:10:55 -0700 (PDT)
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
X-Inumbo-ID: 7332bbd9-32ca-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719303056; x=1719907856; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QRMBm69W9F8XoMVsajW1fMZ8CQvRzo5sxW0tT6q426Y=;
        b=QPadIMaYDZXE4StCGHg0n0x5acEqj9mBISwsZaT4qZ013Qo/Szn5WeFwojbe4VnDpu
         iqYkR1qu2Edf4Auwg+cSDmZNKGRCBrm10UQ8nmt6FBBxm5qsQLBTMPyU+D2I0ucWdTAC
         /+DVwIWPb8YYur8YxF8qA2poX4WHafCw3M21GrJO7SuIWCFch15illbJvDLMwCTqyEpK
         S3SKzGX5EVk2+utPKEpsLWRnpWZqsJPgfwnG1ktrpRRgXcFK4bNrClB/1jz5rub9uHld
         ED8vdSsyN7OUjkuthgEeuRgrMS5OxV+allevOWVYcAOSsBuoksX8fxGQXXXTSpZusWWz
         X6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303056; x=1719907856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRMBm69W9F8XoMVsajW1fMZ8CQvRzo5sxW0tT6q426Y=;
        b=IqaDNikn1WttyrPRfhGmodp3nk4rlbFrVkzFM4VNU6Mvb4kFgOwwBqQ2vY4yx616gA
         Wtu83GKDLUlFrhy77YgMWyIiN3Co7tuUAymsRmyJBf4oIhMtCiflB0hBfpBd5kJHkciK
         MZTlpK/C97YbsvY4k+vesRTqhy8FlJXBcKZoNMeK/RaCeA5f4n5A2ZrIu4Nh+Mw49jtH
         Oab90qDApxQgryS8bu08Of+wKE6I54503+0wf8Y9bFUgKHE9BkmWt9f7l9+3E7HwzMAq
         YtxQrgaumAXfQDZIzCMe8n1zXe2mqsYbXLN20k5iMR4Tb9GtmzG0HqBCvBFtJu7mIOW+
         B5ng==
X-Forwarded-Encrypted: i=1; AJvYcCXT3/nWNuGEvN+oE2LprcVbz26yVEiBX/KJphMoWFKDGr3rfxKYbeufqRPQ2G6c/DO0r8OScX/ON3i132EaOIJRqpKIr/aC85zoMcwKMJM=
X-Gm-Message-State: AOJu0YzcgilYCR2w/ClBl4jpXuB4ak9OpWHa1wZkfIQyG+kFMmDhAc8H
	mcmnoB0riDZU8WUxwI+hvXTAF3QIKOfJ7ab/c1OIh68hj23a3SOV
X-Google-Smtp-Source: AGHT+IHK6wzrGBlC7a+6h22K1UOH9H2Urfa5LtPwGxFu/S8QbrnAFoE2McI1CPlvbv/703KBA2/rMw==
X-Received: by 2002:a50:8e54:0:b0:57c:745d:110b with SMTP id 4fb4d7f45d1cf-57d4bd56bd6mr4623580a12.3.1719303056141;
        Tue, 25 Jun 2024 01:10:56 -0700 (PDT)
Message-ID: <52373e0cea119ff04ebb997f3d0aea6bd3c9dc41.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] Config.mk: update MiniOS commit
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Juergen Gross <jgross@suse.com>
Date: Tue, 25 Jun 2024 10:10:55 +0200
In-Reply-To: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
References: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 09:57 +0200, Jan Beulich wrote:
> Pull in the gcc14 build fix there.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Probably nice to reference a gcc14-clean MiniOS tree from what is
> going
> to be 4.19.
I would like to ask what do you mean by gcc14-clean here?

~ Oleksii

>=20
> --- a/Config.mk
> +++ b/Config.mk
> @@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?=3D https://xenbits.xen
> =C2=A0QEMU_UPSTREAM_REVISION ?=3D master
> =C2=A0
> =C2=A0MINIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-http/mini-os.g=
it
> -MINIOS_UPSTREAM_REVISION ?=3D b6a5b4d72b88e5c4faed01f5a44505de022860fc
> +MINIOS_UPSTREAM_REVISION ?=3D 8b038c7411ae7e823eaf6d15d5efbe037a07197a
> =C2=A0
> =C2=A0SEABIOS_UPSTREAM_URL ?=3D https://xenbits.xen.org/git-http/seabios.=
git
> =C2=A0SEABIOS_UPSTREAM_REVISION ?=3D rel-1.16.3


