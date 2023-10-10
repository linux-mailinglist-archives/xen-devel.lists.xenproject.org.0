Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E17BF517
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 09:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614584.955779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq7dJ-0005Rg-7d; Tue, 10 Oct 2023 07:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614584.955779; Tue, 10 Oct 2023 07:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq7dJ-0005Pb-4s; Tue, 10 Oct 2023 07:58:25 +0000
Received: by outflank-mailman (input) for mailman id 614584;
 Tue, 10 Oct 2023 07:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSWa=FY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qq7dI-0005PV-Iz
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 07:58:24 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c87c9c01-6742-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 09:58:22 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-503056c8195so6946717e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 00:58:22 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a195201000000b005047bf13b6fsm1698236lfb.134.2023.10.10.00.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 00:58:21 -0700 (PDT)
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
X-Inumbo-ID: c87c9c01-6742-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696924702; x=1697529502; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IaHW21ryWxl8j9O4P2OixRwJOf8Bj0ldVSLRlSfoDjA=;
        b=HXelOGoxMUIfnirn4fdoFp303FoqiTA1FEkZr7N2IGrqv0vVdnLdPOnLNyXF+MAkfI
         Fh+XjRmxJb7qiOMS3BykH4GbyUoUpUmuqH3UTQ9od90H5SNFnxGcOFA2hNiWEZPzcj7N
         SnXdiakvpEtBX+KYWb2I3o3F0Rkr81oXA5jVCFWfhwRJN8n1UzQ6D52sNOQnBCuAldqE
         h8AlIjIXswN2Fz/Ji1/xvIGMFMWE+d2faoZzZ4zGgWV8mrFuL6I9/i6X2YkVFdBNPmE4
         VN2JA9uS3LixK81T/BJnJ3MyPvRZLi+szZShivqTp/Vl53FJQlkw2kkWce8KCyc4jGFe
         B2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924702; x=1697529502;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IaHW21ryWxl8j9O4P2OixRwJOf8Bj0ldVSLRlSfoDjA=;
        b=PW+MZCaxKZISW3mJOgusYsMa4C3wO1aLI0WqE7lT5y5JiAOJlqnPvsaul8wRmrdZVF
         yxLw96ZsAWxK+n56bMUf7MjR6uehvu2fI8lpppXwo2b3Axl16zfQjzbX3MchF21xe6uh
         DvAF4mu76zgp0rFi7ESAqI3BfOYF0ldchwBNOe/TR++P4G36gkWBJXIima0y4u7KjGSo
         2jnC2bJJ+n14rPuw8uhqfC44gJy6e0wXwJEd+Vt4kVPqrMMTmJTH7PLrVKnp2e+h+JpD
         7/hgv703Mk82FY4tvhtuSNgyxTu3Uo3Zo9baAsp6aBjB7kbICK7IPBl8GHb9/BLLaiXr
         IIRw==
X-Gm-Message-State: AOJu0YzapUSlnYbU9PNFtvY+l6PO4rkv7EdLhp5071m+CsMzmM7xha3G
	/KOl9LvoFhETeVSgsB4xC6k=
X-Google-Smtp-Source: AGHT+IGW/AHHBkB2kNlRoRNBLFifyke3RxX17haB8cFpF1J6tfYHymnYc+LWgrAqA6yWxKx1ECgqtQ==
X-Received: by 2002:a05:6512:3495:b0:503:3398:9d3b with SMTP id v21-20020a056512349500b0050333989d3bmr12684529lfr.10.1696924701688;
        Tue, 10 Oct 2023 00:58:21 -0700 (PDT)
Message-ID: <45df1c3a44fcd4ebf87a30ada34141d6ebd9ccab.camel@gmail.com>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a
 common Kconfig option
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Julien Grall
 <jgrall@amazon.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>, Henry Wang <Henry.Wang@arm.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien
 Grall <julien@xen.org>
Date: Tue, 10 Oct 2023 10:58:19 +0300
In-Reply-To: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

>=20
> Oleksii: I've not touched RISCV yet, because I don't know how the
> platforms
> typically look.=C2=A0 I'm happy to default it active in RISCV too if
> that's the
> right thing to do.
We are still waiting for a platform with hypervisor extension support
but I am using PDX in my Xen's repo.

~ Oleksii

