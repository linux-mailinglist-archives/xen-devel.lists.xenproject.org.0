Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52D948CA0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772729.1183177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHDY-0003Tg-2v; Tue, 06 Aug 2024 10:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772729.1183177; Tue, 06 Aug 2024 10:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHDX-0003RA-Ve; Tue, 06 Aug 2024 10:14:59 +0000
Received: by outflank-mailman (input) for mailman id 772729;
 Tue, 06 Aug 2024 10:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbHDW-0003R4-R6
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:14:58 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb62401-53dc-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 12:14:58 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so63887666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 03:14:58 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d437c6sm532820866b.129.2024.08.06.03.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 03:14:56 -0700 (PDT)
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
X-Inumbo-ID: bbb62401-53dc-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722939297; x=1723544097; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nZtmgBig573h2DSlpGLZvZ9aWWXikos4tIwVudaTY9I=;
        b=NxfF+gqSvJIWcvVhhK2ZgmNz/jN1umD6Whi9TOniVghtwB8rujwVd9DBl4d0O+r5RD
         lYQ60Cgf+WYNK7BpMvl7bTTi7Fx2AEVhfiyardwE+jljb7lr/qj8ghayAjVYyciLod4m
         Wdsh+FJGQEst2bC62BZi8qo/c0j5xCZGiNZS/sv0VBmstGcSRuEyzJGT+QhSlhGjxPiw
         exsLyun6Bj6+V8SCm9OaChq366UzGMacmnuGMj66flrmMwib6zV0iShaio3hfoUSZPU1
         f85XzHeNjiSH4MQnBwf+WLHiFJJ1ZPu4S4xCXF1X/c5PYAWTl/JNajNCr3Y/Cf30o+IK
         8Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722939297; x=1723544097;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZtmgBig573h2DSlpGLZvZ9aWWXikos4tIwVudaTY9I=;
        b=mroZXVbABgXW/AZBH3sgzpHPLw6LJUQXwy6NBT1hFCLvJTU0UBD13ZzvodDnP4US1Q
         NsgPCwJcDIftTm0/BpM2ij10m4s/a7TPcs7DOmUUJjffllj1uuSIfQXPf3Q2ZmJwFFDp
         6ETCds75d9Fxt5Y1HwNqlBkFCaDzb4np1pP/Okp6MTOCuqZOE6N+DRjgQd4PbZtW6fuq
         GsFALOgEiKPIwZPoCXfXAjYACIacIBaF80PTz6gs+hOdgXhC+RJY/3ZogQBWVAARrA0u
         mdyswjC9h5BYbyuw/CJrhT8L669aoqCUw/JrdfaShCA2Eapyey4RgejL1xGQry35fN1k
         XUog==
X-Forwarded-Encrypted: i=1; AJvYcCVKa3nnC3r9Bq7OspzlqKd2GLNClBgcVMDdwlUol5rp6+woIY3fJ7gM8SCMH0kKkqgFOo7FzKHkmyMIfSoCetvYc4N1JLRWe//UXQUwdEU=
X-Gm-Message-State: AOJu0Yx9RA3rC4KTdCfZ7eQSE/nsgQmP/lcIXzNeFEDy8tDR9zBTLcYY
	EQdf82VTbok2VLf8XRUXNFGoDuNNNbQFiQcAXA7pSxkCl1iLsyRb
X-Google-Smtp-Source: AGHT+IEPx8/rH86O8Pb8tRszfj3QBvywmJ/icjae4zgynPAomDgdK0fTYthafIervJASTW1tPxazVw==
X-Received: by 2002:a17:906:d554:b0:a72:6849:cb0f with SMTP id a640c23a62f3a-a7dc5100463mr976345266b.62.1722939297178;
        Tue, 06 Aug 2024 03:14:57 -0700 (PDT)
Message-ID: <95e26b56c36354bedc05c5b437d0ef70b0a52693.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Tue, 06 Aug 2024 12:14:56 +0200
In-Reply-To: <6a945181-96e8-4816-a2a8-aac6fdd1dfbb@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
	 <887c062b02e9eae9953759275d97c1fafd608d28.camel@gmail.com>
	 <6a945181-96e8-4816-a2a8-aac6fdd1dfbb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-06 at 11:59 +0200, Jan Beulich wrote:
> On 06.08.2024 11:49, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > > > +=C2=A0=C2=A0=C2=A0 write_pte(pte, tmp);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 sfence_vma();
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 printk("(XEN) fixmap is mapped\n");
> > >=20
> > > Why the (XEN) prefix? And perhaps why the printk() in the first
> > > place?
> > printk() is available after common code started to be buildable and
> > can
> > be used here as we have already introduced early_puts() which uses
> > sbi_console_putchar(). So it doesn't matter if we use printk() or
> > early_printk() here the result will be the same the call of
> > sbi_console_putchar().
> >=20
> > Am I missing something?
>=20
> Apparently yes, as you answered neither of my questions. To put them
> differently: What value does this log message have, outside of your
> own development activities?=C2=A0
Probably there is no any value. Just show that mapping of fixmap has
been finished. I think that we can really this printk.

> What value does the explicit (XEN) have
> when printk() prepends such a prefix already anyway?
I thought that I answered on this question before that there is no any
sense in the explicit "(XEN)".

~ Oleksii

