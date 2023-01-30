Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA9680C16
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486926.754359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSTD-0000WC-AV; Mon, 30 Jan 2023 11:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486926.754359; Mon, 30 Jan 2023 11:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSTD-0000UC-7Y; Mon, 30 Jan 2023 11:37:07 +0000
Received: by outflank-mailman (input) for mailman id 486926;
 Mon, 30 Jan 2023 11:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMSTB-0000TW-Pr
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:37:05 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6afa78dc-a092-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:37:04 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id m2so30362189ejb.8
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 03:37:04 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 lf16-20020a170907175000b008787134a939sm6777950ejc.18.2023.01.30.03.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:37:03 -0800 (PST)
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
X-Inumbo-ID: 6afa78dc-a092-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U4WUK8j1sqBukKnilpM/eMgOIFdvBjYmoxUwpd9tbWA=;
        b=d/5nANWUnEkRDuontsQ9lZExXIfaMDcs6xNlRlc8oRJWb6KuLu8+MOTj2jxnvvcOr8
         lkTM5NcyYR93mA7qXTAcBSbGh0dn27FQuV84v4B1Kd3TWiXLDy6qGMnQWXVxPbZDTGKS
         r2IwnaPPAF7+bpYl63AZor21CK7g/3wGRklq7XzJPlT+1UyDgxzdn/DxmPeMW/5XtSBU
         fAlAiz1rkYNddaIa8FsF7sfbnAqxJmRrUaUwct5bGoniAy7ACF4XsTx+YKqRLuYnpsV3
         N5YdmUnLx7ZLWJeCXL4RbgfWJNBqPCRveH3iJR4OX3UFIp+tFL/JSVp20GXWB8oDqynV
         WoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4WUK8j1sqBukKnilpM/eMgOIFdvBjYmoxUwpd9tbWA=;
        b=p8VgsiQvGkANzkcR0hd9Hs36v+pxla5jOKut64ZjKgkOr4woGLvdD24frVe4gnw+EQ
         0BCVBgIMu3YXUTebOgtxmKD9n+lO/W+mrND3G8C6vCpyPexmyVVC022+OucGe7oddQ1A
         9FthN6Brd0aAyvM+TfFMLx36wFPRA19ut7jHK3ZCKwQs5wtNX+gHtAznXTtiblh1J3kp
         G9NHBbX22q/PVcasDPTmu1WQDiMT+oLYIrnM57tqn7+Had2UzyYw5OtwYags4oyyxeXr
         vlYaTHBFCVEr5XB6PHKYu3xlAPg/DYHbystRhjK+nUCTMSe/VG76cEXKwtKmv67M80rl
         qq5g==
X-Gm-Message-State: AFqh2kqdC3AlgrFKDFyBuUDhp/soq4dstqVmzq+e6U0WPKEBMIwtkRpt
	6ny7RNaHQHsRwol/RwXMqDU=
X-Google-Smtp-Source: AMrXdXvYji0hm7dgAtbOj9PKxCjt2tifZXGu92y62Qad0Ny/pmzkrR70ehXVA5E4UF4dkF+wkAlRHA==
X-Received: by 2002:a17:907:8c14:b0:84c:e9c4:5751 with SMTP id ta20-20020a1709078c1400b0084ce9c45751mr54156387ejc.74.1675078623652;
        Mon, 30 Jan 2023 03:37:03 -0800 (PST)
Message-ID: <7f9c94502d78d2c226d60b92a8f949407cfb1062.camel@gmail.com>
Subject: Re: [PATCH v2 04/14] xen/riscv: add <asm/csr.h> header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Mon, 30 Jan 2023 13:37:02 +0200
In-Reply-To: <7dbda8fa-d4f3-5101-2e8f-96b4b2ff790e@suse.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <b26d981f189adad8af4560fcc10360da02df97a9.1674818705.git.oleksii.kurochko@gmail.com>
	 <7dbda8fa-d4f3-5101-2e8f-96b4b2ff790e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-27 at 15:10 +0100, Jan Beulich wrote:
> On 27.01.2023 14:59, Oleksii Kurochko wrote:
> > The following changes were made in comparison with <asm/csr.h> from
> > Linux:
> > =C2=A0 * remove all defines as they are defined in riscv_encoding.h
> > =C2=A0 * leave only csr_* macros
> >=20
> > Origin: https://github.com/torvalds/linux.git=C2=A02475bf0250de
>=20
> I'm sorry to be picky, but I think such references should be to the
> canonical
> tree, which here aiui is the one at git.kernel.org.
>=20
Thanks for clarification.
I will change it then.

> Jan
~ Oleksii

