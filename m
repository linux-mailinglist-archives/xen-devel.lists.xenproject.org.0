Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE0658A14
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 08:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469634.729023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAnbQ-0006Og-D0; Thu, 29 Dec 2022 07:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469634.729023; Thu, 29 Dec 2022 07:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAnbQ-0006Me-AD; Thu, 29 Dec 2022 07:45:24 +0000
Received: by outflank-mailman (input) for mailman id 469634;
 Thu, 29 Dec 2022 07:45:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHg=43=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAnbP-0006MY-Gv
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 07:45:23 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb56056-874c-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 08:45:22 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id ay40so12641297wmb.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Dec 2022 23:45:20 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003a3442f1229sm31815915wmb.29.2022.12.28.23.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 23:45:19 -0800 (PST)
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
X-Inumbo-ID: beb56056-874c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XAy9BQkkT1cQqUyqIPw6VFfoAZJBebfAsbWVQqU50ps=;
        b=kItfTiEOq7iHWO9um9ENw8XLkWBUtwd+jcCMZaMDv6xWj5yXWpWuwXtYOn8E923U5f
         FI4X+SPlBNpAclDLzZNIhaVCHAl5RP8JN+uhR9uqFHqzWfbeo7r3Axbkuq4+Kukd42er
         XFZDXDNDm2XN06AJt4v0aXILQorn6h9iWrRo33MBSen2ub9/HsCDB8H4eFhSPXT7nCVk
         N6KZ2rZ4u9mP7eVTunOs4ARIVFwArvA5ZERjNwCGSeYNRtYerYfOtnZ0hq68wQk33uQ5
         KFqjcQlxW6MtxnSus3mLoH9e8oohnXr2gbDchrgRFcaPbNbCi/QbSlM4cfCJ0pF/98mW
         qLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAy9BQkkT1cQqUyqIPw6VFfoAZJBebfAsbWVQqU50ps=;
        b=FwEKRq9XJTJoyPOhOEQ+KtGFAy/HkYva5/SxCt9sM3A36Y38b2MfJtuwHz9qcX/Lmd
         H6lbusjMPiKvRQfcnN8tKmZNBi4+JtGiaPPL1fKfvlI7+ILR72rPxtGhw3WRU3ptrVZ5
         ArZEc9iyyto0sOuGyeCoaENgkDveLZ23brAvHpUzrjGRfP3b9tpTesjmjAZNsEOiQ+vs
         9t50QlC88fVhqYjD0gtYJ9Ch4PuSVgNnY/el3xu4I4lWvqVolH3yMOBe4+v+DwrqSQoj
         BldJYiqSBLQd1R1KKJ99s096ROfHRbjM8UNbtd5YIxfDXy4gudrE6oYs333bILHn/XVW
         vJzQ==
X-Gm-Message-State: AFqh2konR5sklkErx69iAcbAmtIcW486C+CEUw4AMmwj1f8hUsEayJ6U
	ytj2V5+hUJbCqSjhUps6/Uc=
X-Google-Smtp-Source: AMrXdXvzdokX5yl7fjDNb3mzgOvmGIxkNuSYAz9l5jr37Lu3dlryIt7vg8PDLJiB9ZdF88H/zXQ9Lw==
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id y4-20020a1c4b04000000b003c6f0b874e6mr19952354wma.4.1672299920299;
        Wed, 28 Dec 2022 23:45:20 -0800 (PST)
Message-ID: <b84bd12cdc343abf317a25476713b236a2403cba.camel@gmail.com>
Subject: Re: [XEN PATCH v1 3/4] automation: add python3 package for
 riscv64.dockerfile
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Date: Thu, 29 Dec 2022 09:45:18 +0200
In-Reply-To: <24efc48f-5149-b055-7178-d21dae999f02@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <55e2c865a0c2ab3ef405c427c0b1bcaf0abff2ab.1671789736.git.oleksii.kurochko@gmail.com>
	 <24efc48f-5149-b055-7178-d21dae999f02@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2022-12-28 at 23:26 +0000, Andrew Cooper wrote:
> On 23/12/2022 11:16 am, Oleksii Kurochko wrote:
> > Pyhton3 package is requited by automation/scripts/build
> > script so it shoud be installed to riscv64 docker image
>=20
> Is it?=C2=A0 This series runs fine without it.
>=20

It is used by automation/scripts/build here:
https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/automation/s=
cripts/build#L63

It looks like this patch can be skipped for now as it doesn't affect
results of RISC-V cross-build test.

> When we get around to compiling userspace, then we do need a python
> interpreter for the build, but we need a load of other things too.
>=20
> ~Andrew

~Oleksii


