Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1E809321
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 22:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650179.1015446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBLcU-0006Wb-C0; Thu, 07 Dec 2023 21:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650179.1015446; Thu, 07 Dec 2023 21:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBLcU-0006U3-8h; Thu, 07 Dec 2023 21:09:18 +0000
Received: by outflank-mailman (input) for mailman id 650179;
 Thu, 07 Dec 2023 21:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y0Pn=HS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBLcS-0006Tv-Vf
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 21:09:16 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e04eccb9-9544-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 22:09:15 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54c64316a22so1907588a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 13:09:15 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a50aa9a000000b0054c6261d245sm226228edc.37.2023.12.07.13.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:09:14 -0800 (PST)
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
X-Inumbo-ID: e04eccb9-9544-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701983354; x=1702588154; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8NlpV8GXsUnxiuXF/T0qU6VIMdCTQtGxDGh5FukiAwA=;
        b=T3h1erGhzwuHkaCrnEU0NtBDlYkzC3HQWeguwGfa0ujGDycsjXgYqh2j0WojQPs3iJ
         wT6oAxDHMmi+pNDaco9Jfbk3IVV9A7yaozpvkAvTbv1a+ZtUvvFgzbYjxSC6LDUsc70+
         JpWkL8pZtzEAK6GMqBBh3tlg641nVmveY5GItebmE5gtPMoUaZLsw3MeIxn6LbWsGOhi
         KzbJVDdsnJCzTvcWte8RKUE+XV6e9HaHg01k6z+u8F2GyOpfekgxiFjbvIOKXzjCC2eW
         9aBw53W2vHXAf87ylikzRNkWLQzHh3K5xsIysokOTI3X4bbKq6FVpOc6mXTElQJk3rus
         fBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701983354; x=1702588154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NlpV8GXsUnxiuXF/T0qU6VIMdCTQtGxDGh5FukiAwA=;
        b=GKtMu+swbefPqZ9ju/xp5T3xgoeKpxkApKKhUlFRjcOCjCUgLOs7PaESdwPBYLlxt8
         t/XHjmQO7yyatswNtAFx0p3y54jvfY4gMUurPxmX6mPBSQ80oPXpM54Rb0KaT4GMTMNQ
         oIQzCMsz1wmW+ZRlLNdMco8R+zZChcU7jZBF8Qxoy/YwkSO5ar8dyabgCOpMWzvgAmuC
         K2ljaAV8l0FVP5T75y4jcjuS8K9aDh7sIymCEjzRGE+CNUSgwdcYbUAaiIaKLU+G5CNP
         hO81xOcRjRVYLGQrdQ12xKaL1bhFapMj7X4WJ3GqiEPqGqsSSMiOTNPKabJj59ZrUKPp
         7kSQ==
X-Gm-Message-State: AOJu0YzBuvQh5HZREBBRIoRCbw1VHeT8MUM5UV4iQxqTNaGw9fGp1JGV
	+PgsbMw+LBcDDGn6I2C2Sb0=
X-Google-Smtp-Source: AGHT+IFTZc84Ll26roVpg4N/HrOcF3IDPVQBegk3QSIqGoj9DenXh/axT4t8+5L0rZUsMdkt+79njA==
X-Received: by 2002:a50:baae:0:b0:54c:4837:75a5 with SMTP id x43-20020a50baae000000b0054c483775a5mr1621181ede.81.1701983354316;
        Thu, 07 Dec 2023 13:09:14 -0800 (PST)
Message-ID: <38ed531570ef67b6b1f95ba5fa44bb37821bca9e.camel@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 07 Dec 2023 23:09:12 +0200
In-Reply-To: <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
	 <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hi Julien and Henry,

On Thu, 2023-12-07 at 18:46 +0000, Julien Grall wrote:
> Hi,
>=20
> On 07/12/2023 16:20, Henry Wang wrote:
> > I've finished the opportunity to do two releases (4.17 and 4.18)
> > and Oleksii Kurochko has volunteered to be the next release
> > manager.
>=20
> Henry, thanks for your time as release manager.
> Oleksii, thanks for stepping up and good luck for the role!
Thank you very much.

Just one question: Is it necessary to provide my ACK?

>=20
> > Hand over the role to him by changing the maintainership of the
> > CHANGELOG.md.
> >=20
> > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> I didn't hear any objection during the community call. But I will
> give=20
> until Tuesday morning (UK time) just in case. If there are none, then
> I=20
> will commit it.
>=20
> Cheers,
>=20

~ Oleksii

