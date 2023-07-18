Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17975804A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565349.883448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmCE-0003rW-LZ; Tue, 18 Jul 2023 15:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565349.883448; Tue, 18 Jul 2023 15:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmCE-0003os-IK; Tue, 18 Jul 2023 15:01:02 +0000
Received: by outflank-mailman (input) for mailman id 565349;
 Tue, 18 Jul 2023 15:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPt9=DE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLmCC-0003om-Qm
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:01:00 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7388278-257b-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 17:00:58 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b74209fb60so86881931fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 08:00:58 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a2e9183000000b002b6d576a257sm523768ljg.96.2023.07.18.08.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 08:00:57 -0700 (PDT)
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
X-Inumbo-ID: e7388278-257b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689692458; x=1692284458;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ekq5+ly99K9g2OqDH2apliH8ruyp0evpLql2eBptRYw=;
        b=FTuBGhGc4sqMyU07fG3u4RyvKl1PT5SYKmStaEI1Hncn0NSHxBF1hBtiXo/eENTbFZ
         KxEPC80h0VdSy+O/4Y594n53zRXV3Dy3LHrymEt6LF52ePyDH7/9h/+IlE9Uzc/PjloI
         PIISVY6tYUEh38nFxP7E8yY0/TtkG6wQGoEEYqYz9CZbFYAg4gmHguNGBWlSB+DaTmbm
         bbb6Zh7cToGwuic4+tQ889RPnnoycpnPgh6LtwzwUJ7df7B2GeBIkc6uBpPZf79Rs+2b
         uHcA2TE/BYVB8bj4qjQuJOWVWXM/25ho13xpXVYwrMu4hUrs2MO87DGK9W/uxDO0ReIK
         /5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689692458; x=1692284458;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ekq5+ly99K9g2OqDH2apliH8ruyp0evpLql2eBptRYw=;
        b=gb7Jktv5NCMQiyvkABRA8fhWm3BuiD64yZoW2c5JkMZNli73qZyk+Xm8xNui4uE4c5
         rrjmMMehini18WuzuHuXImSMKvKO8wpf/YdIyfugqFluu+9EjfIWXiaXXvSGnUI97uBL
         1nPjs29/MAp9q9IT1ZDY2J6mCXmLRbATmBNiCLqwGtW4Qpoiii6cdx06H4BzSTnr+Llj
         i4iTL6GBk1nUtpD2uTKZiteCtnxTRGnx/NcGrU1rtbGs8eP3pPMls0mPPiC2XwDO9vNK
         PynJm/FrK0kHAPcjyAcrqQrYOJy3bSrwphGZzallD/TcyJ0UNLtD+DV88Gd66xH+vphH
         xTWw==
X-Gm-Message-State: ABy/qLYaZAZbvcoYRll+FL3z/Ko18W/6n85N8nQqiBJ9jTz6ws1zQmwk
	rJMz4QXU/t3nN4dLTL4IfE1qYz0BNjY=
X-Google-Smtp-Source: APBJJlHx5DtZ6CJqBgGxoPE481/e8kNEPj/bVmtbLSYo1V2koapm5c3HGz2HFISg1/LusEe2H/AhsA==
X-Received: by 2002:a2e:9e89:0:b0:2b6:efcf:1463 with SMTP id f9-20020a2e9e89000000b002b6efcf1463mr10923596ljk.6.1689692457768;
        Tue, 18 Jul 2023 08:00:57 -0700 (PDT)
Message-ID: <346bea980c63d3e56429c63566513c535d04d32b.camel@gmail.com>
Subject: Re: [PATCH v2] ns16550: add support for polling mode when device
 tree is used
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Tue, 18 Jul 2023 18:00:56 +0300
In-Reply-To: <b37b15c6-d7f7-df9d-83c1-337f434a713b@xen.org>
References: 
	<ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
	 <b37b15c6-d7f7-df9d-83c1-337f434a713b@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-07-18 at 15:23 +0100, Julien Grall wrote:
>=20
>=20
> On 18/07/2023 15:13, Oleksii Kurochko wrote:
> > RISC-V doesn't support interrupts for the time being, so it would
> > be nice to
> > have polling mode.
> >=20
> > The patch assumes that polling mode will be used if there is no
> > interrupt
> > property=20
>=20
> As I asked in v1, please explain that this is allowed by the binding
> and=20
> provide a link for others to verify.
According to 4.2.2 National Semiconductor 16450/16550 Compatible UART
Requirements from The Devicetree Specification v0.4
(=C2=A0https://www.devicetree.org/specifications/ ) interrupts property
should always present.

So if interrupt property doesn't present in serial node then it should
return -EINVAL:
    res =3D platform_get_irq(dev, 0);
    if ( res < 0 )
    {
        printk("ns16550: Unable to retrieve the IRQ\n");
        return -EINVAL;
    }

>=20
> > or the interrupt is equal to some unused UART interrupt number (
> > look
> > at the definition of NO_IRQ_POLL in ns16550.c ).
>=20
> Nack. If you want to use polling mode and yet have an interrupts=20
> property then you should provide the information differently. This
> would=20
> either be via the command line or an extra property in the DT node.
>=20
> If the latter, it would need to be standardized first.
What does it mean 'standardized'? Do you mean that it should updated
The Devicetree Specification?

I am not sure that I know the process of standardization of such stuff
could you please give me any pointers?

It looks like it will be faster to pass it via the command line as
standardization can consume some time...

~ Oleksii

