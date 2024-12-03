Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E812A9E3005
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 00:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848308.1263232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIcXt-0003mL-Vb; Tue, 03 Dec 2024 23:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848308.1263232; Tue, 03 Dec 2024 23:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIcXt-0003js-Sf; Tue, 03 Dec 2024 23:43:09 +0000
Received: by outflank-mailman (input) for mailman id 848308;
 Tue, 03 Dec 2024 23:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fX1Z=S4=google.com=kevinloughlin@srs-se1.protection.inumbo.net>)
 id 1tIcXr-0003jm-V7
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 23:43:08 +0000
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57a26635-b1d0-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 00:43:06 +0100 (CET)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-85b8d1fd1bbso1207939241.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 15:43:05 -0800 (PST)
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
X-Inumbo-ID: 57a26635-b1d0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733269385; x=1733874185; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efxAKMGIsYtsJH1TfFadrRu53b/jP4XGduoqdQKfUDs=;
        b=h1iS4xq+GGEd/ABvnPItonmGoWFafwlpkETSUm1gXJy87nTtI76PfKrTb7GI12tm0Z
         4whv/4CQP4AI+QTNE1LbCNEsou7PYDM/tiwc6tQTJ9waMb1Y3ta6EoB9yhyYPFOiIQ29
         y6HA5R239nUkArKuJ4vkea02QdLN3Nbg5UTGZm6qXucx+jO+bP5vPc1pXNW5kVPEXB6b
         AHIhU3HZoAwVdrhUUAFKVYJ8N/yfh5c1FhrV7EkGtNgdxUNcqCRGI6j2K1vAZWFvA+oG
         zw8XKUiKubIjkKhHcdXuz5nprF2D4DDS72BfQAACsm8SD0qXfqOavy/bU6R1jxQxm+OL
         oldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733269385; x=1733874185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efxAKMGIsYtsJH1TfFadrRu53b/jP4XGduoqdQKfUDs=;
        b=G4O9OaBJcciYOyYN2MSS80jlzuATUaIVD4/SoaCDqRPTuYUAcJH2kgWZ7PMj72+k6x
         WPQv/vpeuraQhbRPvAywcnLsps6kuyS5m+tEkzdrthGcNBj0T2vJBPpOJbbdwoTJzmd3
         HYJz5LFnwTyxr012y4SlozsCAoOlgiPN7Mn865vUBA7sv6iv39kxeh2iA98zVcfq1KBr
         I7V7E1MulLnCRMQj0fIz8mf1DDzHuB7IzoaBGk7YSm/MgU9E6U9wyXCljzRrUCQXAFqQ
         5ONZ7uZ9wcJn1eF1WxUSTZgbX8DHnpWbrCsXUj1IXkSzE5/dyfsN10vpBHRyfpKqDt7Q
         LUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4yJ5fhXrwmxNMZFy6tn6OE/x0kwSZNAUVsxUu8hBW6IB/zPIGJN7Fy2fnLyELQiYgTclgPkEVaLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbwcj/UUejHIGUlKDSGi4tAOt0D7amIKZXz2iDGwXh+ZAG+p1w
	NMHiDj7u+eNXlw26s4wPYDmWZkjT4DULbqTXstmftYJzNyisJH4JNPz1YAskcjRMrwXOfiGbwal
	bEuMS6MbO0SDkL4daN69xi2LsC10t4b3jk5pE
X-Gm-Gg: ASbGncts+e914pUl15WJwurBh43uJDJSu71Sd/oZi/OneH+s92WxrdaRkFaLjLB8l0M
	Esi6UuoYkkcJwOOb/yWU/5GLmfpEXg0u+aSiI7nkvq9fXNrbB2ZgPNuNGCeES
X-Google-Smtp-Source: AGHT+IFnoxNObCnxOJ19RTHQOfy3IS0mP97qq1D+ZXM9Cr4w6i9KeiYqycIxeXsC6V041VYgYczgtjNRhEyAzhN1RZQ=
X-Received: by 2002:a05:6102:548e:b0:4af:ab78:f383 with SMTP id
 ada2fe7eead31-4afab78f4b5mr933855137.24.1733269384628; Tue, 03 Dec 2024
 15:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20241203005921.1119116-1-kevinloughlin@google.com>
 <20241203005921.1119116-2-kevinloughlin@google.com> <a9560e97-478d-4e03-b936-cf6f663279a4@citrix.com>
 <CAGdbjmLRA5g+Rgiq-fRbWaNqXK51+naNBi0b3goKxsN-79wpaw@mail.gmail.com>
 <bc4a4095-d8bd-4d97-a623-be35ef81aad0@zytor.com> <24b80006-dcea-4a76-b5c8-e147d9191ed2@suse.com>
 <25fa8746-3b36-4d43-86cd-37aadaacdf2e@zytor.com>
In-Reply-To: <25fa8746-3b36-4d43-86cd-37aadaacdf2e@zytor.com>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 3 Dec 2024 15:42:53 -0800
Message-ID: <CAGdbjmKwMrioAq1b1v_UhhOxU6R2xPztZ9Q3ZizC9iMA84s+ag@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] x86, lib, xenpv: Add WBNOINVD helper functions
To: Xin Li <xin@zytor.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	linux-kernel@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, thomas.lendacky@amd.com, pgonda@google.com, 
	sidtelang@google.com, mizhang@google.com, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 12:11=E2=80=AFAM Xin Li <xin@zytor.com> wrote:
>
> On 12/2/2024 10:47 PM, Juergen Gross wrote:
> > P.S.: As the paravirt maintainer I would have preferred to be Cc-ed in =
the
> >        initial patch mail.
>
> Looks that Kevin didn't run './scripts/get_maintainer.pl'?

Woops, my bad. I somehow ended up with the full maintainer list for
patch 2/2 from the script but not this one (1/2). Apologies and thanks
for the heads up.

I saw Juergen's patch [0] ("x86/paravirt: remove the wbinvd hook") to
remove the WBINVD hook, so I'll do the same for WBNOINVD in the next
version (meaning I shouldn't need to update xenpv code anymore).

[0] https://lore.kernel.org/lkml/20241203071550.26487-1-jgross@suse.com/

Thanks!

Kevin

