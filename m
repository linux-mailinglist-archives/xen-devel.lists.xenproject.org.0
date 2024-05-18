Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551608C8F0D
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 03:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724563.1129840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88if-0007qf-TH; Sat, 18 May 2024 01:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724563.1129840; Sat, 18 May 2024 01:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88if-0007nl-Px; Sat, 18 May 2024 01:18:41 +0000
Received: by outflank-mailman (input) for mailman id 724563;
 Sat, 18 May 2024 01:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clH7=MV=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s88id-0007nf-ST
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 01:18:39 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cf7975e-14b4-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 03:18:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715995113574541.5799814820792;
 Fri, 17 May 2024 18:18:33 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-de462979e00so810350276.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 18:18:33 -0700 (PDT)
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
X-Inumbo-ID: 8cf7975e-14b4-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1715995114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KrTXJ/6x92WjMR1IqMfMy2vfgaZSFnrgdKyKzL6lXhHUQe6Gr4oDWLpMqAubaEi79u2I2ig29BOCorKUFJmvV47HUJDj/KKVm9Ctv1O/s23CFNP9dj89Z/u9CBJ5Ug6wJCQuLQICC71w+D7MZ9yC3+91xZ93W47HDGmUfo4uqMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715995114; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RvRG5y7QgTMlvDcAZl1+oKr+gk4YK/iWfKJdCgb0dc0=; 
	b=EXotpwKtAHEbYoU+AWlL0z6vVjNbgdfmU0R3xif4zV6jAO7dL2STThQu1UXOnbnsIfYs06VZuaB+Aqumxt6jtMG2d+XTajenGp/2kcb+y/mXjyrHpgZSM7J5ocA3u+zB6tadioHmTAj5rs+JcVnrK98ImaDpCQl5Ut1CSzcSM00=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715995114;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=RvRG5y7QgTMlvDcAZl1+oKr+gk4YK/iWfKJdCgb0dc0=;
	b=I0/FmhNXxCnFoi4eLCzbZRmurDaubzCb3d4EV+ZdM9YxJgOcJOZez4SC/7Gff20p
	bLeomvHDy/kcE9Yw27VdQtftcdYh0glXYfJBscEqIr7ldi3jNA6V1dAPiH7dbgh8udW
	THn5xqIBN48UGOuGa2N4V/YfZHa8Lwpchzc14X24=
X-Gm-Message-State: AOJu0YztKK7C0jQ8Y8xakCgqa33MRNegKa6fZ1IPALNqdO//EuYJJryU
	Fvlw/FDgCUEJN/Bj6UHZ6oSdkP+TRgdgVZ42DHXP4XFry7ZjffQv4pCaCayiavcK7H6/wVxrisg
	DnWaNp1ETwqsJ3u2Z7IfP672BmjQ=
X-Google-Smtp-Source: AGHT+IGwtRcwnGqskymcoQCIk/2RbEkK0LJy5Pg5+ApPvd1YKrzkvW5fi1Ny0CNN7Bt7byX1JosHKTXDkp6XZlhTdqk=
X-Received: by 2002:a25:8c86:0:b0:dee:797e:a325 with SMTP id
 3f1490d57ef6-dee797ea442mr16388088276.10.1715995112787; Fri, 17 May 2024
 18:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715858136.git.w1benny@gmail.com> <b6bf7e5ba0deab4550b9d15c327015fe7d94d463.1715858136.git.w1benny@gmail.com>
In-Reply-To: <b6bf7e5ba0deab4550b9d15c327015fe7d94d463.1715858136.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 May 2024 21:17:56 -0400
X-Gmail-Original-Message-ID: <CABfawhmB+XND75WPJ_MjORyjUiV_h_NNmJQx2BaZ5WRmzkX79A@mail.gmail.com>
Message-ID: <CABfawhmB+XND75WPJ_MjORyjUiV_h_NNmJQx2BaZ5WRmzkX79A@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v3 4/6] x86: Make the maximum number of altp2m
 views configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"

> -        ap2m = array_access_nospec(d->arch.altp2m_p2m, altp2m_idx);
> +        ap2m = d->arch.altp2m_p2m[altp2m_idx];

Why is it no longer necessary to use array_access_nospec?

Tamas

