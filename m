Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52C973F2C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795927.1205412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4a2-0004BK-5j; Tue, 10 Sep 2024 17:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795927.1205412; Tue, 10 Sep 2024 17:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4a2-00048p-33; Tue, 10 Sep 2024 17:23:06 +0000
Received: by outflank-mailman (input) for mailman id 795927;
 Tue, 10 Sep 2024 17:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=it18=QI=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1so4a1-00042p-1Z
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:23:05 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54a487c2-6f99-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 19:23:02 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1725988976585774.5923399277873;
 Tue, 10 Sep 2024 10:22:56 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e0b7efa1c1bso5851671276.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 10:22:56 -0700 (PDT)
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
X-Inumbo-ID: 54a487c2-6f99-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1725988978; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NkBglrBlF1AUO4iTMWDY2HcUaEM4CUGTRzVY4NZnsEMCeYYPgz8zTZaVVJA/saudQdiihBwZFUQRPxM3Hk/xlvAtdHCA6ZYAB3z7WLOcvoSmyadepz9zJJUcuVI6sQj5WzKQj12vEI7Q3DeS2zdXtUOCeYL5gTanznUpVZ26XZQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725988978; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jlHE7YednL4hbzSvbQIcLfF6pIs6MzU887/4NW7gZf8=; 
	b=H07g8MxmsrMCnkQY2/qNDzhi7VX8G4NgCdZy4MBHh6Z1N02K3GcY3qVq/zOQzEBbZI9K1wMn4rFkLsfUmi2R2vvbw6avodBL8SpsAJWF4L0trRiGxZ8/qjgAuIORQyzU5Y4DVH7cBNsV7471kugGx4mDBCwYBEl5tSKxxhc3b2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725988978;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jlHE7YednL4hbzSvbQIcLfF6pIs6MzU887/4NW7gZf8=;
	b=D+bqatNFzVKAvrj6Tyi38zEyC05uQ864gvF8DwANfLpCj9MQsdcdyvw+BeJFy9Le
	KfsFS3SAyzm/Ty16XQH9iOdY1v6cQfSd+ROJYRCmGFpqPJ/IpkI10DSp1MoXndKv1/7
	4e6wLhOzrMiDxraCJlGYybmjdp2Qj+yY+3jVseBI=
X-Gm-Message-State: AOJu0YxF/c4nvzhqNQ5o2rDalAuadjcd/ASM2CL/+qVSx9hWf28JNCPn
	zn9x7sRu37LRm7lHM2t+R3505/f8SFW4jDOAi1oiEWCWVb3YNnYuq4xSv1GACuIA9CJuVHhMFuk
	rG7kk3ofVOhZbujtIV34/AsIR0HE=
X-Google-Smtp-Source: AGHT+IFYqxb+G391HHGiz3pdlarQOJswp6se3jw7DOJsiRWgUFQnrw6KoZQlcTsPr2HEI+yyEIGANEPktw1o4kgLFHk=
X-Received: by 2002:a05:6902:1b09:b0:e0b:fa84:5839 with SMTP id
 3f1490d57ef6-e1d34867c66mr14451576276.8.1725988975808; Tue, 10 Sep 2024
 10:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725958416.git.federico.serafini@bugseng.com> <d45ca82c321f74fa320472e3309d4c30bdfb32b9.1725958416.git.federico.serafini@bugseng.com>
In-Reply-To: <d45ca82c321f74fa320472e3309d4c30bdfb32b9.1725958416.git.federico.serafini@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 10 Sep 2024 13:22:19 -0400
X-Gmail-Original-Message-ID: <CABfawhnLHnx9zsD3iC-D0t-E_DnWf9npbU1r2b4WsKVVDrLafw@mail.gmail.com>
Message-ID: <CABfawhnLHnx9zsD3iC-D0t-E_DnWf9npbU1r2b4WsKVVDrLafw@mail.gmail.com>
Subject: Re: [XEN PATCH 03/12] x86/vm_event: address violation of MISRA C Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 6:09=E2=80=AFAM Federico Serafini
<federico.serafini@bugseng.com> wrote:
>
> Address a violation of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

