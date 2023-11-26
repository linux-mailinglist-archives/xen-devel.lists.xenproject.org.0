Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF27A7F969F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 00:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641521.1000093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Opt-0005yZ-9v; Sun, 26 Nov 2023 23:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641521.1000093; Sun, 26 Nov 2023 23:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Opt-0005vH-6j; Sun, 26 Nov 2023 23:46:49 +0000
Received: by outflank-mailman (input) for mailman id 641521;
 Sun, 26 Nov 2023 23:46:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+N0s=HH=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1r7Opr-0005sP-PA
 for xen-devel@lists.xenproject.org; Sun, 26 Nov 2023 23:46:47 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d37903b-8cb6-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 00:46:46 +0100 (CET)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177]) by mx.zohomail.com
 with SMTPS id 1701042399444835.4044586813383;
 Sun, 26 Nov 2023 15:46:39 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5cf57a493d0so9216517b3.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Nov 2023 15:46:39 -0800 (PST)
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
X-Inumbo-ID: 0d37903b-8cb6-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1701042401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bC8cNsOJY27Jj4FhIFy5jm9N2of9qbo5nFxmT1mmThDr94eROvA4ZDHju1SH+6bbXbdMLovUue3Jv+dC9xR3vlt1rRKibs3UyOZTJj7iPWqEO/PbCKSKprKE1aCcj0kHCIHyEh4cn3mXuQuc+za9zmN+l943XtUPnggBxZy/q0U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1701042401; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uz2eRhp6iKugdEeT5lsnYhFwH8XzKH0UxT+wL1pXRDg=; 
	b=gq4UMMcZGCLRnXevVqqsGm9dMTdkn4pY0wWebNGsXHilP8CkT7Ej0Rlx0Xg8kqmTid0VyN/TYhZueHExjpkdt95s/ZFNzNuGizN9rHDLisjJCptbgkoNGYEdVrL8Bq2QTbfDybmCeoKYAuPaLDZY4nDuiG9Hgfs1CKeH0JLJ1dk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1701042401;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Uz2eRhp6iKugdEeT5lsnYhFwH8XzKH0UxT+wL1pXRDg=;
	b=KHpC9uwYb7pVoI8JPfzC7QBXxR9K1hjPmFV4bKnH2uPyshjoxbp+LJG5P4Sg97cs
	VyYMlnrK5c892V35HgVFBUYIFSQTqm/Q5mD19gmi5nZFg39rAFjF/NCU0MWDdvi5Xgt
	czKmgrsdx3I+bhZEsSkMPjfpnso8yYIzhJWe+rI0=
X-Gm-Message-State: AOJu0YxdNAS3xFA2RwIxBQWG5vR7Nmnm8cZptjlL5q19yaB5C1HwVCWI
	yjJXnk/+nIdtOpvIunH+gG3Xwh32yTAQfp2Xs0s=
X-Google-Smtp-Source: AGHT+IF06cIj/noODB+LOaJuKzXjuqm+DaeNuwHP91kAe0XnwDuWPDrzITYorjOjfWtFA+p41KDYM7/TSS3YDAlWO0w=
X-Received: by 2002:a0d:fc05:0:b0:5cb:332e:ab68 with SMTP id
 m5-20020a0dfc05000000b005cb332eab68mr9842957ywf.5.1701042398943; Sun, 26 Nov
 2023 15:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20231122162620.4354-1-frediano.ziglio@cloud.com> <55fb9f8d-8834-414a-b789-7fcff76950c5@citrix.com>
In-Reply-To: <55fb9f8d-8834-414a-b789-7fcff76950c5@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sun, 26 Nov 2023 18:46:02 -0500
X-Gmail-Original-Message-ID: <CABfawhmbTfRQbMMqerPrOnPDqCKvqTncDWCF+a-izFJm3PP3Sw@mail.gmail.com>
Message-ID: <CABfawhmbTfRQbMMqerPrOnPDqCKvqTncDWCF+a-izFJm3PP3Sw@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: Fix typo in comment
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org, 
	Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:27=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 22/11/2023 4:26 pm, Frediano Ziglio wrote:
> > ambigious -> ambiguous
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Not sure if it's still needed but either case:

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

