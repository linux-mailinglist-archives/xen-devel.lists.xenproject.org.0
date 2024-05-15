Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD708C681E
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722395.1126301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FAi-0002Pb-R0; Wed, 15 May 2024 13:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722395.1126301; Wed, 15 May 2024 13:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FAi-0002NM-OJ; Wed, 15 May 2024 13:59:56 +0000
Received: by outflank-mailman (input) for mailman id 722395;
 Wed, 15 May 2024 13:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ly6O=MS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7FAh-000270-Jp
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:59:55 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68668cfa-12c3-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:59:55 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51f174e316eso8399808e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:59:55 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52399dcb951sm221027e87.268.2024.05.15.06.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 06:59:54 -0700 (PDT)
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
X-Inumbo-ID: 68668cfa-12c3-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715781595; x=1716386395; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5sUAN4xsv0QPdY4uy80pJLa1Lng9pvUAPqZnicw+mI=;
        b=EWqqrV0Kggb9snwiVrpsZXiToKH7Jb00pGR8IVs7PhnfJ0TSbahjs2S9uUeRoSIopd
         W7iK53D/mng2xqARkEKeWYf7bhuhACftvCSrNRrLkJPZfmXqtT/lGeyVuhKzosbqz+1G
         NG+DZHiKdyLWc5LqdOPgr7trtXHFSe2jk11Y0OnVB3cpZAiFX/e+eXgoKcRDcFPDG2Sz
         XVCLuixe2re5brRyYvLkB8twmQiafyQd3R8vjMxzZO/fEnFriD14Nr9AjC71mWR6M7bP
         Z3hO4p3YlBHWFwxqk5ztj8m+DpvSkVt0mwdGzU901I31juG25TMtHtLDKurAk+/lozEk
         AkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781595; x=1716386395;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5sUAN4xsv0QPdY4uy80pJLa1Lng9pvUAPqZnicw+mI=;
        b=e+LeMZ3jVOhNXfH3lSziu3Hn9OvgpQiln82xTShPAh2qAV0LR6AZfsMfe5dV6BPlUb
         IVDZXjc8EAHK6EnmBg5mnNzcZ4awWggg1dcAf2OkRQL80B+8WUyiCRrnEt/eFXtGwsjm
         dkh9EKmLXOoIGPhaxF47ECIyNxdMy2csI8tIIBmQ4vxtoFwg60LfDlVZGQaSwSQO47d6
         2geRfZ9jeGFwtYoUKLJeTpWhM8CM3uSnSDZCg6Fe4hwA+mGa45nfJt1Gf5GqSphXBACS
         nnxOiPN0n4HySPgXR1xNqsXEaYXUQWb8Fagx+nkDmRHKhZdRuL9lTwRbe8ILcbdtpmDW
         gVuA==
X-Forwarded-Encrypted: i=1; AJvYcCUfmUpZKNlwYG/2bDrZYGOrtYS1aPVr5+sb6yw3/nQBllUu3HU2LurtPDBotjL1MUP2QYNssj2uk+iTlKUdnihnGmnYi6tb0MiINiDM8UQ=
X-Gm-Message-State: AOJu0YygitlQP+ifSbSzd5Hxs6BDN3Ui/sORMKN8U0iOE/u+rTOk31cT
	6nqrOMvy36XHJFJaV9Xecop+DQYZsyZebmKB0TPsCpEfYC4fhGew
X-Google-Smtp-Source: AGHT+IG81bAVXSpuO/CY87+IFx6HU5uWaNCUuEjB8fcZx1dazynChwJpD7rVU3H1XzbHLN8d2/PZmQ==
X-Received: by 2002:a05:6512:3e0e:b0:522:2edc:c858 with SMTP id 2adb3069b0e04-5224b73a706mr9054704e87.34.1715781594542;
        Wed, 15 May 2024 06:59:54 -0700 (PDT)
Message-ID: <47858beea78e165ac0675b696f78f0301cf107d3.camel@gmail.com>
Subject: Re: [PATCH v9 07/15] xen/riscv: introduce atomic.h
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 15 May 2024 15:59:53 +0200
In-Reply-To: <7a4e4b99-bedc-4742-9119-2bad9bf468de@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <1b8d0d3e665adc10222a9e07cedab7bcb40d88f2.1714988096.git.oleksii.kurochko@gmail.com>
	 <7a4e4b99-bedc-4742-9119-2bad9bf468de@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 11:49 +0200, Jan Beulich wrote:
> On 06.05.2024 12:15, Oleksii Kurochko wrote:
> > Changes in V9:
> > =C2=A0- update the defintion of write_atomic macros:
> > =C2=A0=C2=A0 drop the return value as this macros isn't expeceted to re=
turn
> > something
> > =C2=A0=C2=A0 drop unnessary parentheses around p.
>=20
> Yet then what about add_sized()? With that also tidied
> Acked-by: Jan Beulich <jbeulich@suse.com>
Sure, parentheses around p in add_sized() should be dropped too.
I will update the patch in the next version of the patch series.

~ Oleksii

