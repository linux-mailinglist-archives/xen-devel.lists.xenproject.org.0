Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B86E90E403
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743458.1150368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpOt-0000a9-TX; Wed, 19 Jun 2024 07:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743458.1150368; Wed, 19 Jun 2024 07:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJpOt-0000Yb-Qr; Wed, 19 Jun 2024 07:06:35 +0000
Received: by outflank-mailman (input) for mailman id 743458;
 Wed, 19 Jun 2024 07:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxBI=NV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJpOt-0007yJ-0f
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:06:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7589bac6-2e0a-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 09:06:33 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so3478745e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 00:06:33 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe8fb8sm257346515e9.11.2024.06.19.00.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 00:06:32 -0700 (PDT)
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
X-Inumbo-ID: 7589bac6-2e0a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718780793; x=1719385593; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r3h+a2TBSX1go0KsZFGfwtOr49kqMAbh2tBBH01hpMU=;
        b=lQ9Pc7oqFYJJfjuF0WUyxmg6MyKaNapxdoebxsOSG1SCE1A4z/whh7JjYg9pP0BMoB
         AbBnHMF7faowDLghnwXcrYgyKppJVSy50clH7JkzOm9PpGBTMbFkc9tFXZ0BvatIgbDa
         VgxpoPGzwp3QYVGRXm6kv0qvg5/FimWEHzCQzgv47f6UYCapooQI6x3NpJ+R6rbNb+2i
         8nVyCGKdNKCmUvNi9IJQYpuTHXmo0TMO1dNMNmLNY4TqfsgpeYxcWIStqo7FesB+xKPp
         HBcN2BVDc6syNSVDWtV65hdT05eSsA6J7GSKkwUNAbF6mk/svRwTqxvpOzygEXLl3BUq
         TwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718780793; x=1719385593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3h+a2TBSX1go0KsZFGfwtOr49kqMAbh2tBBH01hpMU=;
        b=RMGbkCPetsAJNB9wOIP/E08lUPxP4iGoKCTnoDoBGp+bGTr08GqP5Lhb8I+bBQ2n6I
         VwihOylrMlZUdvTx9PsPRCrjbCZFnH27n3DZR8wxACVn1B93ahimXZ16dGxE5xRklxYQ
         p75UjQh1kdoIrP3jWEJEVZW/2V7CmCnkvoQVdnlZG9EbpQ1O+Tamfi8b90KVY+d8z3Q/
         8Pv/F9RMzzu4w0xDuwqr/paDGTrMMPa7DgAcXgI4m+463/82V41XVcgwhU8cL1mxL9/b
         KCpZn1gmSDr2y6beF/UDsa6DbfTp9xtRDW75km5rqNFlznb8hP8B4eWvwwpzl65csIAy
         DcNg==
X-Forwarded-Encrypted: i=1; AJvYcCUfCqO7nDP4nSDGVpw6ll9Mgymbka8+lclV4Exp025l/8QPwOQOhAsulmY1bFDI0glLiALQycjLRF4MJXdgxBRE0i3A9UEfkxknHJKEcGU=
X-Gm-Message-State: AOJu0YyXD+Z1lhBu6YyuHpBo9i2NEEyHFLXBy+oen1wtZwmOJ+Nt9AGX
	4c/uJk8ENC9uF+Tlt8a4UWoGNV8MLTviZHOSX9BONoQboScreyBP
X-Google-Smtp-Source: AGHT+IH5u93jnq9ZgwjRl+3DlYlSjlrHAXWLnrWfScUIGDRsQuYiz7pzFseLw5ULbKpSMiRb+b1hcw==
X-Received: by 2002:a7b:c8cc:0:b0:418:2981:c70f with SMTP id 5b1f17b1804b1-4246fb8e71dmr46621715e9.19.1718780792514;
        Wed, 19 Jun 2024 00:06:32 -0700 (PDT)
Message-ID: <72d00f8df6d6682c3b9163108b340e0cdd665151.camel@gmail.com>
Subject: Re: [PATCH for-4.19] xen/irq: Address MISRA Rule 8.3 violation
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,  "consulting @ bugseng . com"
 <consulting@bugseng.com>
Date: Wed, 19 Jun 2024 09:06:31 +0200
In-Reply-To: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
References: <20240618130048.1768639-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-18 at 14:00 +0100, Andrew Cooper wrote:
> When centralising irq_ack_none(), different architectures had
> different names
> for the parameter of irq_ack_none().=C2=A0 As it's type is struct irq_des=
c
> *, it
> should be named desc.=C2=A0 Make this consistent.
>=20
> No functional change.
>=20
> Fixes: 8aeda4a241ab ("arch/irq: Make irq_ack_none() mandatory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com=C2=A0<consulting@bugseng.com>
>=20
> Request for 4.19.=C2=A0 This was an accidental regression in a recent
> cleanup
> patch, and the fix is just a rename - its no functional change.
> ---
> =C2=A0xen/arch/arm/irq.c=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0xen/include/xen/irq.h | 2 +-
> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index c60502444ccf..6b89f64fd194 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -31,9 +31,9 @@ struct irq_guest
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int virq;
> =C2=A0};
> =C2=A0
> -void irq_ack_none(struct irq_desc *irq)
> +void irq_ack_none(struct irq_desc *desc)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0 printk("unexpected IRQ trap at irq %02x\n", irq->irq)=
;
> +=C2=A0=C2=A0=C2=A0 printk("unexpected IRQ trap at irq %02x\n", desc->irq=
);
> =C2=A0}
> =C2=A0
> =C2=A0void irq_end_none(struct irq_desc *irq)
> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
> index adf33547d25f..580ae37e7428 100644
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -134,7 +134,7 @@ void cf_check irq_actor_none(struct irq_desc
> *desc);
> =C2=A0 * irq_ack_none() must be provided by the architecture.
> =C2=A0 * irq_end_none() is optional, and opted into using a define.
> =C2=A0 */
> -void cf_check irq_ack_none(struct irq_desc *irq);
> +void cf_check irq_ack_none(struct irq_desc *desc);
> =C2=A0
> =C2=A0/*
> =C2=A0 * Per-cpu interrupted context register state - the inner-most
> interrupt frame
>=20
> base-commit: 8b4243a9b560c89bb259db5a27832c253d4bebc7


