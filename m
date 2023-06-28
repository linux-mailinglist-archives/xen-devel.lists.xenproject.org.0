Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE9874100A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 13:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556438.868980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETLS-0001xs-HU; Wed, 28 Jun 2023 11:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556438.868980; Wed, 28 Jun 2023 11:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qETLS-0001vC-E6; Wed, 28 Jun 2023 11:28:22 +0000
Received: by outflank-mailman (input) for mailman id 556438;
 Wed, 28 Jun 2023 11:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Co9n=CQ=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qETLQ-0001uu-NH
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 11:28:20 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1f621c4-15a6-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 13:28:19 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51d9865b7bdso3659927a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jun 2023 04:28:19 -0700 (PDT)
Received: from [127.0.0.1] ([90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 v21-20020a170906565500b00991bba473e1sm3565236ejr.3.2023.06.28.04.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 04:28:18 -0700 (PDT)
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
X-Inumbo-ID: e1f621c4-15a6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687951699; x=1690543699;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m71/o/G171aVR8A+7xTRHGvVpEgwswY5zKXzBViWocU=;
        b=k2isNveHKZxBtTLEMMulb1S/ua0NYPqk6AAPGIdZM9KMdHYEE12hHA2gjCRoRw7aA+
         x2tsDVYe5yDuitLP7uap7gIacGYdTbX8+i9EkkUfpueft2TdeK+gOloOhLRBnx9SGijj
         jEyD4gtyuMiCaMzm7Wp2388t1qZwzcM32xZpALDH4H4EPyc9KYDoBJW7do2kIEYyTvL/
         8RqYCVPMxsmVgLkdbKXhDa9+Eqb8lYxYXFIxNM+PUNuF8WB+d0lYHAH2eIrwQsfWNf0/
         ErT9Zyf1fOzle7Z5AZIh4TalyZh/jS/3/2eZYKvPslexdtZIK42o9i0e4w7XjdZzkUZ3
         luvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687951699; x=1690543699;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m71/o/G171aVR8A+7xTRHGvVpEgwswY5zKXzBViWocU=;
        b=KMMegILRhSsq7Psu25+dFpF/AFlnuIf/zqJJbsWYmvpaQDMVmcqsymXgNihEyIo8Ko
         1dMDTr8qJ2CT5/Sy6O4Bab5XfMccsgUixuurBHlynjwJUAlRWZmw0Iht9lPTqQsPtOAk
         Mjqw83Zy/1JJqGISJ7Vk1aTdSFp3gxAFGM83ZRHnrgIX8Wk7B387GnwhOc/WoxEflOuG
         Cp/qRw4TS0cEtu7QJLjTWVH9/C/g+Mx7XWA7bpKv/OBq4YZIjNOtBqjh1s6pSUMpJuUA
         7t5SobAfuIcL+Z0o9+S14VTLxW6Q5hg86qBmbHaPyZde0PRI/lUIBSoSvC06jcWzW7el
         Vb8g==
X-Gm-Message-State: AC+VfDydyCH73UcbYuNl80krDd5G/1mbaHQQWHA6Xe5eA422ExVAbwg6
	mG6U6rW3NES1yXWRxDnyD40=
X-Google-Smtp-Source: ACHHUZ53bBhM+ZFnfkclLsOB3uAYk8E4AwmHM6NQwKQFrXZxP0QjGSDsDw12FR2s8QmYxIHZThdZnQ==
X-Received: by 2002:a17:907:1c9c:b0:960:d9d:ffb5 with SMTP id nb28-20020a1709071c9c00b009600d9dffb5mr34137625ejc.41.1687951698870;
        Wed, 28 Jun 2023 04:28:18 -0700 (PDT)
Date: Wed, 28 Jun 2023 09:27:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Olaf Hering <olaf@aepfle.de>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <20230627140740.2736f6e8.olaf@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de> <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com> <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com> <20230627140740.2736f6e8.olaf@aepfle.de>
Message-ID: <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 27=2E Juni 2023 12:07:40 UTC schrieb Olaf Hering <olaf@aepfle=2Ede>:
>Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow <shentey@gmail=2Ecom>:
>
>> The BAR is a 32 bit register whose default value is 0x00000001=2E I thi=
nk what's supposed to happen here is a pci_set_long() rather than a pci_set=
_byte()=2E
>
>Indeed, the u32 at that address changes from c121 to c101 with the curren=
t code=2E

Neat! Would you mind sending a patch fixing the BMIBA register to be reset=
 as 32 bit?

Best regards,
Bernhard
>
>Olaf

