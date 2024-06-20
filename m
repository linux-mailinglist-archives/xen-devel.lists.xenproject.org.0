Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3DD9100B9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744345.1151373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKENd-0001Wt-67; Thu, 20 Jun 2024 09:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744345.1151373; Thu, 20 Jun 2024 09:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKENd-0001UR-20; Thu, 20 Jun 2024 09:46:57 +0000
Received: by outflank-mailman (input) for mailman id 744345;
 Thu, 20 Jun 2024 09:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TjK6=NW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKENb-0001UL-DU
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:46:55 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06949549-2eea-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 11:46:54 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso634782e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 02:46:54 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825691sm1974044e87.38.2024.06.20.02.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 02:46:53 -0700 (PDT)
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
X-Inumbo-ID: 06949549-2eea-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876813; x=1719481613; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IVmOJAJmhlZfiLEh6c/Zy5kvqzQCEEcbE7PFhfaHutA=;
        b=CajdyX/aG7nWI5bdu7ESnIxAbqZ3eYRJcx2fFy1zEuLj2xpg4BcRSYbKPFZAev2kA0
         SsaHYpze6ThRpenOFEXd1ecSj0LD33IfUpn20b2G2QS/gTvjYMokiJSbSIBaih6ZZwzm
         fIL0gVyXiDlI4o+NGIXxZwikFTPuLA/zltSY7pBC7D9gbeJYaP0+c8362bzOf5WPIgGL
         Z8qUXNls8UCV3P0c9BKrp6C60mAwrmpuDjuC2GTiFP6QN0ES/8idX9M2U/ZrRWtyER1N
         jXULhDVWm/9TtOTOWVuVQlRisc9tbFCswf3bDPs0TxAzff6EbmzSylQGtE8QdlqnQKei
         TSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876813; x=1719481613;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVmOJAJmhlZfiLEh6c/Zy5kvqzQCEEcbE7PFhfaHutA=;
        b=B2QJ8SSykeQLjejytY79CVwZxKALrmtxPk0yJ/oveG7j4g+MXme7olCSUV0VZAWKRZ
         UGWJ+5AayM1k9fwYMolT2cTzTREkupqL7Re+rme85mJZOMF6xF92GJCNgmzXU8YapAmE
         O3+gTg/LLZAu+kPZyGcYCXzw2J5aTe54QRovlaHWtwqtDUA9ZxLoCCAOPXLeICd1WRPu
         hQ9j8RVU874dvykeA+V03KaGXctlqoPZiKFXJakzzuGSrwsaSpbZdqfPP/Wy/LnoZY6X
         s/VmUAWvhZyqt+wGEKwBTxfFKwk00p6f72yqUhltpUcLy4Ikm71AmZzo+RRyf9dE6vcR
         ej7Q==
X-Gm-Message-State: AOJu0YwqQpAWnFhVuqHOenyA4eKUmEmaPavf1rGetgO5ZOja8hSPHPYU
	bZW9wkSIZSa/o5FQWn5A1YpQKuzDUWMaF9UPOHIolEshlasu3jaJ
X-Google-Smtp-Source: AGHT+IE4mnsB4r42pO+MWOUEopECXY+51GQ6m/hDpFQDF8SZUpNOkuFoNm88259EKINTBNc2VcQnXw==
X-Received: by 2002:a05:6512:280e:b0:52c:8b69:e039 with SMTP id 2adb3069b0e04-52ccaa2a937mr4288878e87.4.1718876813295;
        Thu, 20 Jun 2024 02:46:53 -0700 (PDT)
Message-ID: <e1da057746fe4724659b094cf4cd0bc0cc95c48c.camel@gmail.com>
Subject: Re: [PATCH for-4.19] livepatch: use appropriate type for buffer
 offset variables
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 20 Jun 2024 11:46:52 +0200
In-Reply-To: <CAG7k0ErGHynwYmxWuftUT=yFF0Zrttx0JEAjh3bDzPVzM_MgzA@mail.gmail.com>
References: <a4d780fd-90c2-405e-be21-c323a22a78c6@suse.com>
	 <CAG7k0ErGHynwYmxWuftUT=yFF0Zrttx0JEAjh3bDzPVzM_MgzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-06-20 at 09:04 +0100, Ross Lagerwall wrote:
> On Thu, Jun 20, 2024 at 8:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com>
> wrote:
> >=20
> > As was made noticeable by the last of the commits referenced below,
> > using a fixed-size type for such purposes is not only against
> > ./CODING_STYLE, but can lead to actual issues. Switch to using
> > size_t
> > instead, thus also allowing calculations to be lighter-weight in
> > 32-bit
> > builds.
> >=20
> > No functional change for 64-bit builds.
> >=20
> > Link: https://gitlab.com/xen-project/xen/-/jobs/7136417308
> > Fixes: b145b4a39c13 ("livepatch: Handle arbitrary size names with
> > the list operation")
> > Fixes: 5083e0ff939d ("livepatch: Add metadata runtime retrieval
> > mechanism")
> > Fixes: 43d5c5d5f70b ("xen: avoid UB in guest handle arithmetic")
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >=20
>=20
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

