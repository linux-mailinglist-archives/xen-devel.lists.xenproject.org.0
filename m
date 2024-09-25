Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE59857E8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 13:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803875.1214716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stQ1T-0002RI-O3; Wed, 25 Sep 2024 11:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803875.1214716; Wed, 25 Sep 2024 11:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stQ1T-0002Om-KX; Wed, 25 Sep 2024 11:17:31 +0000
Received: by outflank-mailman (input) for mailman id 803875;
 Wed, 25 Sep 2024 11:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stQ1S-0002ND-6q
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 11:17:30 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc032c5-7b2f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 13:17:28 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so3030057e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 04:17:28 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cacffsm199858766b.139.2024.09.25.04.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:17:27 -0700 (PDT)
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
X-Inumbo-ID: bfc032c5-7b2f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727263048; x=1727867848; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wuhrpnuiKYz+ESMNs9TGMC5BUhHR+paoxuKAKKQiYKs=;
        b=A1ecR7zVnbmeC9S9nVIyDarfQTZx1d2WQEFCbuw+JjYlyUcJLVr0YZwkgdrUQ9QCnx
         Cnniqy3fLQEKpZIqfdljepAXKo9h9ek69ktEwdG+Ejnm9WkStWBn+oNBERfwE29hX9hg
         zKNl59bSo9LhDFYgtUkKHaGoQz3yQG8ugJfxosGLtZWgI9URBh6TBwQaqzfNfU2cCxB4
         rOmgAsM95F5yzdH3DuT6ZfM6d35waq4gAc1BtXzsyHibB7d0vWuXLFDz81Hgps1KMbbX
         9dOUBqfHe21tbFnlrCoXYI90bNiwuk6Y7kNVphFZsMTEzhw/RHGdGYo6w0ERAPADmNCU
         xBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727263048; x=1727867848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuhrpnuiKYz+ESMNs9TGMC5BUhHR+paoxuKAKKQiYKs=;
        b=ROCunWL9RJOiF7BPZNjLnuQmFmDoXWyqkvXl8yWiUBV6sdBfo2J6vb02mcOb2P3uwt
         yB4LpH/fKX9dgKFce7euYyMvgZYs9sOX+rCy3GmEBK2gPq38lygUelIipLQx6cB9lJZa
         uXKrvrlDjestqGQaWNU4HEQzKsyU8hvPOKryBpTEICNPA8saBgAaSKlaAVJf+A+z+zZX
         SRCUpaIB2TnHrsb/RMylb5hsryDJwz6bWmjv+qGgY7zTsZilHM8SQpx4oKcQx+s0qvRM
         ABtRFit9LM5H/tia0Wsbk9ZmYR3vgj4f3+jG3rC/PFsUxa2pNSRyX+A4f642/QrdpC7q
         l9tA==
X-Gm-Message-State: AOJu0YxrRp4JnPm8zzQGNse8CxYiwAcvCTvs4PBvHCWjVDcyoHrVpZ7w
	KmUZSZToOeAiVNxalfjEuVab99fy7Zg/2uS5iCK7mlZYQgNbcDZs
X-Google-Smtp-Source: AGHT+IEF6ms+6R2gJQ+sHZIHrxSL7CiUywtiBeYd2l6kJopboR1oXF/M5SRV2MMaQhs8Ttyg8yje0g==
X-Received: by 2002:ac2:4e0b:0:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-5387048bcb1mr1532753e87.3.1727263047442;
        Wed, 25 Sep 2024 04:17:27 -0700 (PDT)
Message-ID: <16d29580094861d8fa760711726e7e9b25e2fcb8.camel@gmail.com>
Subject: Re: [PATCH] changelog: add note about blkif protocol fixes
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Community Manager
 <community.manager@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Date: Wed, 25 Sep 2024 13:17:26 +0200
In-Reply-To: <cbb8da7d-db0e-417a-a144-e9ad2ab5f72d@suse.com>
References: <20240912132347.28756-1-roger.pau@citrix.com>
	 <ac1317a18ddc993a5fc926a8d25feb39c5349662.camel@gmail.com>
	 <ZvPlq0pb6QIGr6lj@macbook.local>
	 <cbb8da7d-db0e-417a-a144-e9ad2ab5f72d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 13:00 +0200, Jan Beulich wrote:
> On 25.09.2024 12:27, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Sep 13, 2024 at 04:19:32PM +0200,
> > oleksii.kurochko@gmail.com=C2=A0wrote:
> > > On Thu, 2024-09-12 at 15:23 +0200, Roger Pau Monne wrote:
> > > > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > LGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > Hello Oleksii,
> >=20
> > Could you formalize the tag into either a Reviewed-by or an Acked-
> > by
> > so the patch can be committed?
Sorry, it should be:
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
> Nah, I'm intending to put this in with the LGTM:.

>=20
> Jan


