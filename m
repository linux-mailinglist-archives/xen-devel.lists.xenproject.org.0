Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E00677A89
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482801.748509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvaO-0007oJ-Uj; Mon, 23 Jan 2023 12:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482801.748509; Mon, 23 Jan 2023 12:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJvaO-0007lE-RW; Mon, 23 Jan 2023 12:06:04 +0000
Received: by outflank-mailman (input) for mailman id 482801;
 Mon, 23 Jan 2023 12:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJvaM-0007l8-Ng
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:06:02 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cec20a5-9b16-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 13:06:00 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id h16so10554388wrz.12
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 04:06:00 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 g12-20020a5d554c000000b00275970a85f4sm4410911wrw.74.2023.01.23.04.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:05:59 -0800 (PST)
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
X-Inumbo-ID: 4cec20a5-9b16-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jx8yhtLhUxbPyqeo5BHexpyRBPbyotw5yVBZSoQ0OeQ=;
        b=fE8bOZ8noGR5zAz0LtaTxzcXftdLnYqw6bpRhwJ2MUEV2J1UbL12h2L//4GST+GSj7
         y8KR1OCx5yE+4ajqaFcNe/MzlwOTEWk8EDB7fVfzyVNjZHNH3qmLCfZAgHm5qQZGUDGM
         Kap+N21gw26HSD1ep23rArwU4Bj6e2dtRHlQGDGY+lZNuAiqcVXqh4sbziNdgdfIjnjL
         7cHpHhLQyr9p9cGmv/13DXSm/UpychwOTL+hfPUDTNuCO1DdPsNB9qYRgKn1gzQ1oYJu
         nN7h7KJVjl1YFBZFoDyZOba7LDZ+HTmfspH258zHZwJdww4R8usBcO3L1JedMuF8/b2b
         GK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jx8yhtLhUxbPyqeo5BHexpyRBPbyotw5yVBZSoQ0OeQ=;
        b=TFq6cIgKjF3DY5M67Ij+RO8629ejMD+RdWRrDsr5rZTzJWhnfSPcE/+z8hVVzLPnBg
         gcR1UFcZq/2z2Z262kNjzJxGLOBrI0HWZZRDiagsDUN8gfgYuExBGcW+SnrBKp+9ByQK
         IxDVR3xHkgnLeoyTMhc7Nx+cbzRGaoyzZDOO9/N5Qrtk9QVJ3M6hxQX51dLlEI7BGgF2
         AftOWnAvJh69H07Z3/N00y8CzbYumCS53Chp2/5Dmr3J/LRZ8YlbkAbII47Z9pkTxSr3
         ygi7vXBM6nlA3ZNAq8WMj1bB3N4e9W025yU0dzNaEuhqLMiUXODZEdh7sxXnVp0ZdF8L
         VDcg==
X-Gm-Message-State: AFqh2kovkhCzfbT5uuBuvbuIJGX0CWVmtnl02eUf0/g4roS5TavhPY7M
	S/oQNfZ/Qqfe9zSZcpFk51mgCJg2XksXYg==
X-Google-Smtp-Source: AMrXdXtKxxmI7uoLoAtk7ZMl1C10DR5Z6Suwl5eMPh/3ZR/dzwg1U4GPMX3QOEWsxWF168ZSfea9kw==
X-Received: by 2002:adf:f005:0:b0:2bd:e55a:1e1d with SMTP id j5-20020adff005000000b002bde55a1e1dmr15099670wro.12.1674475560322;
        Mon, 23 Jan 2023 04:06:00 -0800 (PST)
Message-ID: <bd87af0043ea58247b762d8d96a13f50e4eb262b.camel@gmail.com>
Subject: Re: [PATCH v1 05/14] xen/riscv: add early_printk_hnum() function
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 23 Jan 2023 14:05:59 +0200
In-Reply-To: <53b7651a-4274-1e2f-fb97-d30f3ddbac1d@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <633ced21788a3abf5079c9a191794616bb1ad351.1674226563.git.oleksii.kurochko@gmail.com>
	 <53b7651a-4274-1e2f-fb97-d30f3ddbac1d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-20 at 15:39 +0000, Andrew Cooper wrote:
> On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
> > Add ability to print hex number.
> > It might be useful to print register value as debug information
> > in BUG(), WARN(), etc...
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> I think it would be better to get s(n)printf() working than to take
> these.=C2=A0 We're going to need to get it working soon anyway, and will
> be
> much easier than doing the full printk() infrastructure.
>=20
Agree here.

I re-watched the patch and I do not use this function now at all.
(it looks like it was needed only for my personal debug stuff)

This patch can be dropped now.
> ~Andrew


