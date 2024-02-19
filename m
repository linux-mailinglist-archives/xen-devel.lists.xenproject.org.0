Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3085A2B0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 13:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682806.1061991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2JZ-0001WZ-BN; Mon, 19 Feb 2024 12:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682806.1061991; Mon, 19 Feb 2024 12:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc2JZ-0001S5-7G; Mon, 19 Feb 2024 12:00:05 +0000
Received: by outflank-mailman (input) for mailman id 682806;
 Mon, 19 Feb 2024 12:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc2JX-000181-Jr
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 12:00:03 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e94f93-cf1e-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 13:00:01 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3e72ec566aso124209266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 04:00:01 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vb7-20020a170907d04700b00a3d23a4e8fdsm2886689ejc.90.2024.02.19.03.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:00:00 -0800 (PST)
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
X-Inumbo-ID: 68e94f93-cf1e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708344001; x=1708948801; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xhtHNJqfXbioKX2uexEcvVG0q+OpT+KI4UH7iQl665g=;
        b=KQ7ypgWAUi6/HUvsB+c81GNGxf5klwyECOd44X8sDQSJagWfTZns8I5zPOn4g0FUu0
         vKw6fqkC03hSOZY/UokImuYxlSLzLr/J7t9c2IJHRi8rxkn6tH1WWdO7OZ+PYfllt25M
         qsVnh7feca4dXR5RLGdLqpeYmEUHqojQY/UV5+0qcXdQ+gfFBd4XrTgjpTS2lp4hdDlJ
         Rw05ZUttB6M8BVZaB5rnKiNZCG8Si+3ha2VzXxUv4r9q10S1vhYrQtN6Tx7xpBxhmVJD
         ZH6D92tyBs2K1w5gMt+KimuimRGiW1p/7+lotCxOtd0j4F/ltuaMr9tBD6bNZUrgrjyB
         GdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344001; x=1708948801;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhtHNJqfXbioKX2uexEcvVG0q+OpT+KI4UH7iQl665g=;
        b=SzwZ3+FY2QZFuCpMiZQC+Fx/24BUNSPEVfBLiXr0Iooc/i1OSGytc2YH1dAflnSv0E
         S1omuYYsG4wqxLEso3aP7Z5cCW0f97NLHmXhIxAFFa4AL7zOjwWhL8mQqdRhIPI9XKpd
         qZHceRpeQKtH9t7shxVeNlQbqnDvKCY4JqtrpcVnWrR1cOnPAUYg4nFbdyEl6gNK3kdf
         RLKA8ZgMnFGyIW6L2qJke4qjYXRauyRI9tsTld15A4jhWb3lsxJNPsPsmBYlh5lj9oeO
         zG1wq+TiXIrrRbXNoR+KrofUknf8WI5WoE2nm+e1LmM/kSWSS0x/ioTB8uLeAHysLUey
         4GJg==
X-Forwarded-Encrypted: i=1; AJvYcCX63LmMATWg3xWKNXJeDcBaQts7t+b3YPerok1gh79bFc8f5xJ84gOM/M1rYgK9inVvS9IjEj+BBfaCKslJCR5e6Xy+ugVjW/rHxeMSLvM=
X-Gm-Message-State: AOJu0YxdfcK5eSuFmytPMotb5qqJCnQ1tbeJyiySQMLiDvTUlklltrKA
	qdY/UVMfp7nKB9aba+L3v6ZPYiIweidWq290msCBxLb30CR1c4QR
X-Google-Smtp-Source: AGHT+IFhc5LR8DjAIVxhqrDsqPpRxH6ROeOoJSG0U4sb3I8/SzaRm/1Lg2BO8ck5b4bwV7D2H4WSXw==
X-Received: by 2002:a17:906:3b10:b0:a3d:7d05:a1b8 with SMTP id g16-20020a1709063b1000b00a3d7d05a1b8mr6506996ejf.77.1708344000611;
        Mon, 19 Feb 2024 04:00:00 -0800 (PST)
Message-ID: <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>
Date: Mon, 19 Feb 2024 12:59:59 +0100
In-Reply-To: <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
	 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-02-18 at 18:30 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> Title: Typo s/introdure/introduce/
>=20
> On 05/02/2024 15:32, Oleksii Kurochko wrote:
> > The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
> > so it has been moved to asm-generic.
>=20
> I am not 100% convinced that moving this header to asm-generic is a
> good=20
> idea. At least for Arm, those helpers ought to be non-empty, what
> about=20
> RISC-V?
For Arm, they are not taking any action, are they? There are no
specific fences or other mechanisms inside
evaluate_nospec()/block_speculation() to address speculation.

For RISC-V, it can be implemented in a similar manner, at least for
now. Since these functions are only used in the grant tables code ( for
Arm and so for RISC-V ), which is not supported by RISC-V.

>=20
> If the answer is they should be non-empty. Then I would consider to
> keep=20
> the duplication to make clear that each architecture should take
> their=20
> own decision in term of security.
>=20
> The alternative, is to have a generic implementation that is safe by=20
> default (if that's even possible).
I am not certain that we can have a generic implementation, as each
architecture may have specific speculation issues.

~ Oleksii

