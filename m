Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 620918C8F08
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 03:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724557.1129829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88dI-0007D8-9a; Sat, 18 May 2024 01:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724557.1129829; Sat, 18 May 2024 01:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88dI-0007B3-6j; Sat, 18 May 2024 01:13:08 +0000
Received: by outflank-mailman (input) for mailman id 724557;
 Sat, 18 May 2024 01:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clH7=MV=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s88dG-0007Av-SK
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 01:13:06 +0000
Received: from sender3-op-o19.zoho.com (sender3-op-o19.zoho.com
 [136.143.184.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c63eb351-14b3-11ef-b4bb-af5377834399;
 Sat, 18 May 2024 03:13:04 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715994780280138.69004225141668;
 Fri, 17 May 2024 18:13:00 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so887655276.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 18:13:00 -0700 (PDT)
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
X-Inumbo-ID: c63eb351-14b3-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1715994780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NvDjzQUWpbm/0e6GYrnb35cNeS+KNN1f7UsJpezvg3SKRPJQg1N0mFuwE01OyTx1CGzHQib08kJdtCSBQc+BqZkvKH6fI9L6+fo9kol4NHvWDTxMUsRDS0Fg7ECaIbPWdcDZRXm98xTKsUE6iIguhu+BH6kvWr7Qt8YpENF4uJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715994780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H9DuXgbTdtu+6poQIgNvq5HDYC+0Cz6HDnPJImUWZ8I=; 
	b=G8ZzAlaovf7YDmr/stUpWKdJf8PRCXdHR39bG+IgSCuWuc/f/d0Hh0CPDjNsSMwpeDtJ8GZoKVy4TVH5bSQWcU9/BF9ch/r2XerGLseUO4B/tetgH2cXxyd6g07Uhz6h1MJI9HGIgYkSSSmJ9L10ZKalsgf0xX65ix/4kYcXRLs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715994780;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H9DuXgbTdtu+6poQIgNvq5HDYC+0Cz6HDnPJImUWZ8I=;
	b=EZM4glpB42MtXDBBOVh+xHthmOWMqkKXKogUgGUQsMx2a+o8tBNZ/TqiXmzor9Eq
	W8uVS0SK5T3x5lQ08WpIyIkZJknsCyXItZQQLYHSPRqMRss4yp5R4NRv8a2HLrWBZ9+
	c+hxqMkHK8QvjvSzDF21N/XlvSXmErO6Kn4Le02g=
X-Gm-Message-State: AOJu0YxCAxCDbLH94MRzQxikMQEY9ae7rXWeJNWjWEPcEF4+bsO9TJRz
	e/z/8hqyCgQ/+yXVar9J162oxAQyqD7E8wL1YMXRCLE/H/yOxLpK4b6Sj/1jaorHOL4jfywrTWD
	NEw+p5VVJHbqLctDtSrABnWxBXh4=
X-Google-Smtp-Source: AGHT+IFD77zm8A7spUf4++zueAy+CMjlNTF2jnf7ZxaQRc9L+vcmVBwIP1OhWBHrKGzrjYn58FGuiWqSNqagjgIJAik=
X-Received: by 2002:a25:b101:0:b0:df1:cdfa:8e46 with SMTP id
 3f1490d57ef6-df1cdfa9222mr10006736276.41.1715994779365; Fri, 17 May 2024
 18:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715952103.git.oleksii.kurochko@gmail.com> <050567a35805361edc0e222f4ddebfa91403cfb6.1715952103.git.oleksii.kurochko@gmail.com>
In-Reply-To: <050567a35805361edc0e222f4ddebfa91403cfb6.1715952103.git.oleksii.kurochko@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 May 2024 21:12:23 -0400
X-Gmail-Original-Message-ID: <CABfawhmGmn-bSpfL81-yxmt0EMDw73bsibND0nGpAPecJjBc_g@mail.gmail.com>
Message-ID: <CABfawhmGmn-bSpfL81-yxmt0EMDw73bsibND0nGpAPecJjBc_g@mail.gmail.com>
Subject: Re: [PATCH v10 11/14] xen/riscv: introduce vm_event_*() functions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 9:55=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

