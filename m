Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163F8CBC15
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727242.1131657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gRV-0001Xk-VH; Wed, 22 May 2024 07:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727242.1131657; Wed, 22 May 2024 07:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gRV-0001VM-SS; Wed, 22 May 2024 07:31:21 +0000
Received: by outflank-mailman (input) for mailman id 727242;
 Wed, 22 May 2024 07:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+y9w=MZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s9gRU-0001VB-73
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:31:20 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a55c8a-180d-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 09:31:18 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso91434301fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 00:31:19 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3113sm39310941fa.36.2024.05.22.00.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:31:18 -0700 (PDT)
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
X-Inumbo-ID: 47a55c8a-180d-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716363078; x=1716967878; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w4KNNMhufpSW6ROKgnE3tNTc24uwhMZ97GXhgr5wGvU=;
        b=mh0sOFeY/6jgfy6F7bW8i/hAU9HNzqgfT9RagvTV7oGBjkcqHENiHsl2aAnmybwfEc
         UESKhVZeRl1MbJaYw5ylRM4fZL2q0AKxisPj+qWXzZYBbrC9/k5jCIdi+/2DHwn++pIH
         obUC3+w0mtG/Rraj22udRwmeAHPy+Hiz8tWeMRsVcn5yinLDm5rprbDUIgOoAtOcdsWU
         9+jrcffJNK5dlhri17K3Yikut+HUYrzBT0qZljQjwrS6cynJVDuDsTRoPpANb+tBsMae
         atwK7/CZf0UIu6d0IeFeqC0EDsp76DNeKu8RIVu8u6CUr70vpYTQiweb7HusAleO3z6Q
         IXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363078; x=1716967878;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4KNNMhufpSW6ROKgnE3tNTc24uwhMZ97GXhgr5wGvU=;
        b=N/aRWjLFO+SROhXF9IurazN7y4GLFPdGD4wFIwJkFNVW/JXVvzyrpPbAgPoOIWthbG
         QNRz9vhVS4dz9CJt9dp4pNtcWbcqyQgHeq6rmp4CIT1KakIAKFJN0xFsfZJ2BP1sa48w
         Q4uNQn9q5O3z4ePSE5eIDKm9qEkL6dTvPyamS8gjPJISGHhMuujxWasiVRUPenbScHbk
         oPUnyijJ07D41KSe85sfFWuAmF3jj4B/Njl1WlWhBhe9EvL+S4TOc16Jkuo1L4pt/Iaz
         oHnS4FZLCUNY+UogNxF8+3pbK6Np4YpIN6+4OT8OUiEeE6scyXcTGogloQnsdDnjaZKX
         y6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyG1XmPryQBgCA3rZzg2jYQCsfrjLG+mTuHO3WQxKnVNSlROZPQB9t75Z929WIzQNYxSx8DbohNIAopbj/X3QUjtYh4pjJtfyxMd0agDg=
X-Gm-Message-State: AOJu0YyNKF58KHvmAnKyTA32pAuOXcRobidD2pbZyKzzWQ0kdscTg7Ck
	rdKaFMu2aFHThkqXbJDoqAUFapbkQHJLlPM1bNeMlfiZJU+x1her
X-Google-Smtp-Source: AGHT+IEXEYRZuxEhaQS/WwajAfA+BStnLuNtBHjiIr9Aw9ncr/sAMCJ7HxvcTmMO1oiX4hbRQyExoA==
X-Received: by 2002:a2e:b70e:0:b0:2e5:6957:187a with SMTP id 38308e7fff4ca-2e949431ec5mr8658581fa.4.1716363078258;
        Wed, 22 May 2024 00:31:18 -0700 (PDT)
Message-ID: <d5e5b0dbae9270a1dcbb45b87c33a58bbbbfffe4.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/3] xen: Misc MISRA changes
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>, 
 "consulting @ bugseng . com" <consulting@bugseng.com>
Date: Wed, 22 May 2024 09:31:17 +0200
In-Reply-To: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hi Andrew,

We can consider this patch series to be in Xen 4.19:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
On Tue, 2024-05-21 at 18:15 +0100, Andrew Cooper wrote:
> Misc fixes collected during today's call.
>=20
> Andrew Cooper (3):
> =C2=A0 xen/lzo: Implement COPY{4,8} using memcpy()
> =C2=A0 xen/x86: Drop useless non-Kconfig CONFIG_* variables
> =C2=A0 xen/x86: Address two misc MISRA 17.7 violations
>=20
> =C2=A0xen/arch/x86/alternative.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0xen/arch/x86/include/asm/config.h |=C2=A0 4 ----
> =C2=A0xen/arch/x86/nmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++---
> =C2=A0xen/common/lzo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++---------
> =C2=A0xen/include/xen/acpi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ---------
> =C2=A0xen/include/xen/watchdog.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 13 +------------
> =C2=A06 files changed, 7 insertions(+), 39 deletions(-)
>=20
>=20
> base-commit: 26b122e3bf8f3921d87312fbf5e7e13872ae92b0


