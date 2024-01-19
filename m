Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC83832E26
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 18:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669118.1041752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQsfJ-0008B0-57; Fri, 19 Jan 2024 17:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669118.1041752; Fri, 19 Jan 2024 17:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQsfJ-00088a-1k; Fri, 19 Jan 2024 17:28:25 +0000
Received: by outflank-mailman (input) for mailman id 669118;
 Fri, 19 Jan 2024 17:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePSo=I5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQsfI-00088U-5Y
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 17:28:24 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25631ecd-b6f0-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 18:28:23 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so1286456a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 09:28:23 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i24-20020aa7c718000000b0055a414021absm1668420edq.32.2024.01.19.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 09:28:22 -0800 (PST)
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
X-Inumbo-ID: 25631ecd-b6f0-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705685303; x=1706290103; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m9qwSdcMbCLPL+YyNdetw0pXkkS/yDvUKfYSCu8HI40=;
        b=Qm+6hWG7qi4W561cbosWjg3cDnd/yl13+VWFdxRe68o20yG6gs+FO1CFxktl4qlyez
         R2grDNhfpY3T6p5hNVC8tRLvGhHZ0Hbhq4irB3sjROSr9ECUjMnq4RbqDPAAww1wFr9p
         iHLJTDLyq21Kr+HO0w5roIXb7lv9j1iFpn09Mb+5Y9LzCyUvTBGjgl3PYRuYrFZAsBaa
         x5cT1ORG42xgopXrEjpAVhlsQBL5xlhHLOVqVfNX/vjTPVJ4/iV/y1MLlsfFIfdLfPAX
         pcTTea+CEwj3tETYNrHSWcOMlvY+zFGq9gSmuIrqAkBaVdwmerAldGbFGHfm4Pu/N1Kn
         WlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705685303; x=1706290103;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9qwSdcMbCLPL+YyNdetw0pXkkS/yDvUKfYSCu8HI40=;
        b=NxSzltkjf49C1++dPNee9P6Eqa6dUdoXbef4RDW1Vx6KQlJUq8yPP4uMbj+O5ryT2O
         avbsYCVlP/uZBQ7kp7Fldwq1k0IPuVxYGdgvOMxyd1ljrWRtz7VH1SEtiwHSbQlYKBDm
         JjiH2ww3YrMxzP+/N+cwSmoEq2O4Mb9TUgRjIurnjBiwibdMkbyF+maaoF89GASePTlt
         bYL2fpxwVcPe/LMc5KnycK94T+oo/qXud/gkPSN3+oS10ygz0Pj06gSn5NZuBG6I5YC6
         xHqr1Q5K7EuFNY3l1xWc4zwTSkJCgGQSTgukCyvm7rwm/mtASa/R1gqtTj18k0PKYsbc
         sA/A==
X-Gm-Message-State: AOJu0Yy+9uaeKcLIERYifDmrYggoThbyM3+mYSRk/RyAxzAFEBkiGFen
	KkkXKQUmRDvulnMfMMvdXMxWWdUY3Fc8u8ya97PDjjL6Gxp0uKf1qVUaiY9q
X-Google-Smtp-Source: AGHT+IEAWSQkgouh4ZCPp8oxQ061qlo9ISiJASAVSxcLIxrM8o+jL+z+NcIeO9BgzJP+eZBiF3ABwg==
X-Received: by 2002:a05:6402:1750:b0:55a:4895:b0ec with SMTP id v16-20020a056402175000b0055a4895b0ecmr45200edx.48.1705685302528;
        Fri, 19 Jan 2024 09:28:22 -0800 (PST)
Message-ID: <363e1543a2777577b31c635495da11d09e139013.camel@gmail.com>
Subject: Re: Xen 4.19 release management plan
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Date: Fri, 19 Jan 2024 19:28:21 +0200
In-Reply-To: <5e74a501-2824-42af-804b-47b515aa9bcf@suse.com>
References: <08a2f9bdd7ba1f9e1e8e67fdb48420ee89223b01.camel@gmail.com>
	 <5e74a501-2824-42af-804b-47b515aa9bcf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-16 at 17:48 +0100, Jan Beulich wrote:
> (reducing Cc list)
>=20
> On 16.01.2024 17:32, Oleksii wrote:
> > Please reply with items you would like to see in 4.19 so that
> > people
> > know what is happening and prioritize accordingly.
> > You're welcome to provide a description and use cases of the
> > feature
> > you're working on.
>=20
> The "annotate entry points with type and size" series including as
> many
> as possible follow-ups on the x86 and Arm side, ideally bringing both
> architectures fully in shape for the new model.
>=20
> On x86,
> - among smaller scope ISA extension work we probably want to make
> =C2=A0 sure AVX10.1 is going to be usable by guests (patches already
> posted),
> - "x86: memcpy() / memset() (non-)ERMS flavors plus fallout"
>=20
> There's likely more, but let's go with this for now.
Thanks for sharing your items.

I would suggest that we also pay attention to the following:
 * NUMA: no need for asm/numa.h when !NUMA
 * move __read_mostly to xen/cache.h

At least, I am really interested in them as they are dependencies for
RISC-V patches.


Best regards,
 Oleksii

