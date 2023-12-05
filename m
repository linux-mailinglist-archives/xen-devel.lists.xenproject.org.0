Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF6804DBC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 10:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647494.1010663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rARhH-0003Jn-BR; Tue, 05 Dec 2023 09:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647494.1010663; Tue, 05 Dec 2023 09:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rARhH-0003He-7R; Tue, 05 Dec 2023 09:26:31 +0000
Received: by outflank-mailman (input) for mailman id 647494;
 Tue, 05 Dec 2023 09:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WXV=HQ=gmail.com=euidzero@srs-se1.protection.inumbo.net>)
 id 1rARhF-0003FZ-5Y
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 09:26:29 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c8b8772-9350-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 10:26:26 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cfabcbda7bso28050745ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 01:26:27 -0800 (PST)
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
X-Inumbo-ID: 5c8b8772-9350-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701768385; x=1702373185; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voHcd0iBeVOiIUr12oMDfA/1qeN2WgYey00aesmGlW0=;
        b=PcIz0EDvjywn4ueO2owHWhcl7dqsG98gJ3Ucw0F7Au3M5UM578M694TWCB0cyedb0U
         tRkbQmLyFW5BggPD185P4Ut4rK5M54t6HklZLhRZqy7zbbQ4hVe36V6+ED1K5qks4HrZ
         CYgT/UE8Y9u0gnISpffogYZVGbJrikhsNKP2mMy/5E6a6zCMWnoNmU8TxFSFrCbq0qnE
         ksr5rjvnQPQlQ295ck3OruDZcl1cOpXMvs39xY5m7ZoLQ59Uy78c3NhmbOSV6C6ZHgAc
         VAF8CzAeeztlOB3OoZI+8W4TVysI3N1zM3J+RqToAMhebofpe5QRoXMv+xHyaxD7Epb/
         7x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768385; x=1702373185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voHcd0iBeVOiIUr12oMDfA/1qeN2WgYey00aesmGlW0=;
        b=Daa6FC7pSlVjGN50pHGw9ISIxA3feSBOJaqsihSHfGjDHNVOxl7uQkR0aQO1Qxz5FG
         ET4GzvfKEpBKno/3ELfSxyEoVdGf9Yit8x76oGW1GD5Ifg8CIV76r6EkMjozPk7s9Otd
         VZr7dVMO76sOpQKqEKS6ePs358/vk8d1oYAxLW12KAiUDj6Bd/jNejIZxtLnpPIrStVl
         b4xdTFBLwTm86eptbrS9r5S9NAKybnYBl1bN579elr83f+pi79C8OcxeeXku5sNokgwT
         9IqgX9bvvAnfpsqa2FiepOrcPvUq4wDX4fhvyw7x4+K/AKOD3iIbVrG9MfiJBw1GHsD8
         RhDQ==
X-Gm-Message-State: AOJu0YxhJ4bVEQbYOpbWwGP+mptQwRyAs41ZxqI7hK8FdJOaVuXJEPUP
	CHhMz4AzYEUYYsHUH9tEoI47GeEuOHD6nxpLgIIVS0hYjhU=
X-Google-Smtp-Source: AGHT+IGja+HfhBZE/j6ZG6VZCOUd9/fczlAB4bfibiPwIeu5E/nj7NXbE1lToWpSUYRTSaM2k6m+msSCbN8IdXBFykI=
X-Received: by 2002:a17:90a:2a0a:b0:286:b6c0:e0ea with SMTP id
 i10-20020a17090a2a0a00b00286b6c0e0eamr1115349pjd.24.1701768385398; Tue, 05
 Dec 2023 01:26:25 -0800 (PST)
MIME-Version: 1.0
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <7f34d258-97fa-43e8-8d67-ac9dc93213af@suse.com> <CAKm-UmYGTLY0fTh4zvj-xrA3Tp+Oj+ES61pncG7ze0QnP4o=FQ@mail.gmail.com>
 <52bd8702-cf7d-4f5b-883d-be6214ba31c0@suse.com> <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
In-Reply-To: <CAKm-UmadRsc7GEYDqMDTBaoozT5Bj3nwK+=uDs1LkTZVG8tgdQ@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Date: Tue, 5 Dec 2023 10:26:14 +0100
Message-ID: <CAKm-UmZnPtH_Fxou3OV0BbpP+tBpSe1z8Qet4Q5=zDD7UGZy6Q@mail.gmail.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 5 d=C3=A9c. 2023 =C3=A0 09:50, S=C3=A9bastien Chaumat <euidzero@gma=
il.com> a =C3=A9crit :
>
> Any direction on how I can enchance the debugging at the kernel level ?
>
> There was an old issue with amd_gpio there : https://bugs.launchpad.net/u=
buntu/+source/linux/+bug/1971597
> Coud the kernel be confused by IRQ/GSI mapping ? Any way to test this hyp=
othesis?
>

Interestingly only one result when searching for the amg_gpio " failed
to enable wake-up interrupt" message :

in the dmesg attached to thread about Ryzen 6000 :
 https://lists.xenproject.org/archives/html/xen-devel/2022-08/msg00927.html

