Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7F8CC652
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 20:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727844.1132528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9qhL-0000wG-TZ; Wed, 22 May 2024 18:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727844.1132528; Wed, 22 May 2024 18:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9qhL-0000tI-QR; Wed, 22 May 2024 18:28:23 +0000
Received: by outflank-mailman (input) for mailman id 727844;
 Wed, 22 May 2024 18:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Goh5=MZ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s9qhJ-0000tC-Mw
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 18:28:22 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f5fe6df-1869-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 20:28:19 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1716402495482663.7254359392649;
 Wed, 22 May 2024 11:28:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-df4d60c59f7so1292030276.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 11:28:15 -0700 (PDT)
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
X-Inumbo-ID: 0f5fe6df-1869-11ef-90a0-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1716402497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YcC+xRHHlYqCrwVwr0HaZD0jjMa3VfN7cJtgIRNIBZyZAu5vow3sM9lULxBN12iMZy2B/gi7Bum+nwv2ssJDAvvq17P6/fgblTD3mpjafLFYTHAtwL/YarZNIhOI+ro2WVT5I8RLIwZ9vpn7ZWSDiT7Df9k7pZ3i1V6qMtl8fHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1716402497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=A9vs60JC2BOykRHL9q/qT34y99SvAiU/CBGf1fQR2ug=; 
	b=dqxPthekxSnHIHnhlK4W68YDnRs8TE3lGd4GIxsMK7juMFseLY/kgVWM/2lCfefRwyMDc8pKNMUtxA1rwaAubY5QV9SQrPOSS9F1nyKoeGTt4Vw3QiOsmZ24f4TdVW0pf5FUxRqKUybMlgg/cPymKzBKoAzdS5HO0/4Ukh5JU2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1716402497;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=A9vs60JC2BOykRHL9q/qT34y99SvAiU/CBGf1fQR2ug=;
	b=jDCzhutMZYFn3/cgf8eoKpKU3r2Lc6pLrtlxWzBbHTtLHQQKWAHGNH3f8bGxAJo5
	wzzxo1B/iPvh07iyAgQ+cHzcjAzCfNTeowcBugUq2AL6T0rIpZKSxtWkHPIhgd1KL/M
	qh0/k8RWH7hsmaJYtflOG66z1Xh/PEiPkhhYNyHM=
X-Gm-Message-State: AOJu0Yz/TGZKRPEZLSqnfNAW0T6yUsKlgTS7Z+kZAJ+HvnNfwmLgdFf2
	tm4s+g1SrBEY8qL73hZP7/tSYGnGmjNKOZZYz+9xeC5xPl47MN/DC7qEXkq30KnRSDL8CSMMWMF
	03+fegdwjBMvdMdacWKl9BIbRr2M=
X-Google-Smtp-Source: AGHT+IHJtee1Lbl8B6OKTqccYOCN6SKccUMGVWjaMkztUTHljNjvTA2a68eXgAkpxANicbrjwZTYIYzMjrGsaq3hq9A=
X-Received: by 2002:a25:d60a:0:b0:df4:ebd2:661c with SMTP id
 3f1490d57ef6-df4ebd26784mr1561597276.63.1716402494390; Wed, 22 May 2024
 11:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
In-Reply-To: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 May 2024 14:27:38 -0400
X-Gmail-Original-Message-ID: <CABfawh=7jZmtseCm9yaZUcKkK7i+yYiudVDvTFeF6bax_1+BjA@mail.gmail.com>
Message-ID: <CABfawh=7jZmtseCm9yaZUcKkK7i+yYiudVDvTFeF6bax_1+BjA@mail.gmail.com>
Subject: Re: [XEN PATCH v3] arm/mem_access: add conditional build of mem_access.c
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 8:32=E2=80=AFAM Alessandro Zucchelli
<alessandro.zucchelli@bugseng.com> wrote:
>
> In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
> changes are done:
> revert preprocessor conditional changes to xen/mem_access.h which
> had it build unconditionally, add conditional build for xen/mem_access.c
> as well and provide stubs in asm/mem_access.h for the users of this
> header.
>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

