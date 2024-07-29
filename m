Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871DD93F4B0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 13:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766673.1177183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOzw-0006eu-3o; Mon, 29 Jul 2024 11:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766673.1177183; Mon, 29 Jul 2024 11:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYOzv-0006cZ-WC; Mon, 29 Jul 2024 11:57:04 +0000
Received: by outflank-mailman (input) for mailman id 766673;
 Mon, 29 Jul 2024 11:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYOzv-0006cR-FI
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 11:57:03 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab017910-4da1-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 13:57:02 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a167b9df7eso5624252a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 04:57:02 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acada29f2sm498746666b.162.2024.07.29.04.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 04:57:01 -0700 (PDT)
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
X-Inumbo-ID: ab017910-4da1-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722254222; x=1722859022; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qfOXd6cP3YykFyXTBB9swP+NqTvtV+wj3UofHyFvHK4=;
        b=fX072Cr58j5j2d1s58GtgSu8tCZG5P9ZNIC3yeHxM/I2GiiaifLIjUPed+If4vG+kl
         EMpSSIpdtWlSSAj8Pvk252Q4uiVB5+uD8WdAs4Hl+2wmXUzM/X/qRyB0vzBpexJcYD3U
         3qHDtbFLwU/b3AoAUKDs2WT8Uc8Ycow5kw0UThUEC5EmW1mZGS3MTxx6nl8YWvq0vMzx
         kpOxwB+Kb65mFBI/gkMO39qh9AlBiYDBZFfaWkNLU5TzcWeV6vRuZahIUsm6akP0xvjq
         YjY7xFvxTf3C81GW4Ifx2AVKRwpWxyjbqVfKXwZ88LqqPowwTQwQEJEiy9F6VHgl/7Z4
         98dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254222; x=1722859022;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qfOXd6cP3YykFyXTBB9swP+NqTvtV+wj3UofHyFvHK4=;
        b=wBpXMJRTDUA33vA8J5XSoVxvt63IwB3ep5V8FT6IOREqFys3HDGSm4bC40XmaeNSMD
         p7rNGve5eQjoMMCYAnFvK9tvva1eh3lP7swprG+G7//Ozj/NrFLGmkgLryZQq93+Rws9
         QPknLJkTjRgXSnUHcYXKYmkCGBixZEqKnIcMW6l40UG26TJ9nVMTaBAPcQzslRyxHZOZ
         Wm7b+JbH1L3fd2lrZinLyJy+2/4HPvqOguYHztYGKqz1zdEUY3X/eeH+L94GQhbSUkUK
         496UUNz9w7uNHI2MrcTH3WrYhT+FG99+oMfgz4DsgXoC68hzgKumCPiRL2EtZ7F2D1sM
         MTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXgql0bof6o5ZB+rqPbgKsRn5cnL+KHEOGDfhtGznC9IvRQ/Yl53MYwQ5H6L5IwiNhds3C1mLoE2JiRAET41rIiFRzKO/dFEZH1QY4LtI=
X-Gm-Message-State: AOJu0YzO2CWyjHoE1hEea60kC9/C/l2fVeDENx3OgzlB1n0t5nTJztr7
	hsOHxlu5RrJH3RVz3hiCy0vtZ0qJCbj37vHQQqNAfgWqRkaKLxvh
X-Google-Smtp-Source: AGHT+IE76GUviERtMc1eKLGkxYTEHwxR9SVwaA/ldZNz7OAcy8+SuR/SIP81TckiAsyFP4jFoj+06Q==
X-Received: by 2002:a17:907:1c19:b0:a77:cf9d:f49b with SMTP id a640c23a62f3a-a7d4016584fmr536299466b.54.1722254221922;
        Mon, 29 Jul 2024 04:57:01 -0700 (PDT)
Message-ID: <c2972009af443751195ce6406c33cd6f682d8bc9.camel@gmail.com>
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.19 release cycle
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Stefano Stabellini <sstabellini@kernel.org>, Community
 Manager <community.manager@xenproject.org>, "committers @ xenproject . org"
 <committers@xenproject.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2024 13:57:00 +0200
In-Reply-To: <fd95fd5c-844c-4a4b-8242-98293f63faa4@suse.com>
References: 
	<32f773f72abbe114574980a8e99260ba96bd32e8.1722253791.git.oleksii.kurochko@gmail.com>
	 <fd95fd5c-844c-4a4b-8242-98293f63faa4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 13:56 +0200, Jan Beulich wrote:
> On 29.07.2024 13:52, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> (for whatever that's worth)
>=20
Thanks.

~ Oleksii


