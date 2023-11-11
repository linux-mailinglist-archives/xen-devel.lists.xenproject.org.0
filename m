Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB177E8A33
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 11:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630923.984070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1lA4-0002XQ-JY; Sat, 11 Nov 2023 10:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630923.984070; Sat, 11 Nov 2023 10:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1lA4-0002Vi-DP; Sat, 11 Nov 2023 10:24:20 +0000
Received: by outflank-mailman (input) for mailman id 630923;
 Sat, 11 Nov 2023 10:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myXE=GY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1lA2-0002Vc-8d
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 10:24:18 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76938952-807c-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 11:24:15 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so40110261fa.1
 for <xen-devel@lists.xenproject.org>; Sat, 11 Nov 2023 02:24:15 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a2ea0d3000000b002c02b36d381sm199200ljm.88.2023.11.11.02.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:24:13 -0800 (PST)
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
X-Inumbo-ID: 76938952-807c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699698254; x=1700303054; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0j1YaKmChFRAui/cTzs4ZoVM2GRQ3YXnysM1v4SVVf4=;
        b=kcr5wX7sPSixAGvdtnP1NDCZz5wQ9h/23hZmQ60/+gjVWaERlp3+csX3lZHwlRI8ts
         fDzEpNg1pjplh3qCO5jl0h6BjvKyDSE/tjqbjRb5EFe/6arSSS3p6CoCqpW4AhmBTuF1
         zoKr9SY7A3SRYg9dhb+AzZ7oONsxI2Q7dAkOMaoKZDUlsmsSK21SkUgTWyLvMlK6sJwK
         SeUV6tFGr1gry3TqhhE3cF5gnLuYWvy20BqwgFumvHCodAJ3C/5jlHch6S3ehNa51gJz
         8ada6Ie0EeRV683QNtWS5sE0js8nFO2YxsoFgJDChBW7QYJbuHGK9Bzy/5eCqGI7L5sM
         tI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699698254; x=1700303054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j1YaKmChFRAui/cTzs4ZoVM2GRQ3YXnysM1v4SVVf4=;
        b=pNiyC7thPVJg43nHujw5XrajmPaTVxOSDOzjZ1FhOdMBOHm/jiyPgV1xmWi9ujCYAE
         asYW0Nh+hoOvQ0ymkeY/d3W4u39rTWaugjsYNAqYAvcqyb9yVmh07pGyjZFLy/jT+1s5
         phazmgpzvBHZp2PlVDJI4Op7c8dkSMhhy0cnj5zaRqHqlCpyHpYjdLoUKStUqVF542L8
         5Nl/xtK0NrLSO1NBP5jcJO2DWLgBtSYVLGLUbEgLX9az3/40n6QqcnxCAXQWg0fBK0n1
         yjkf0HerFUdNitJBCc0yq/lv/3kRBJvjzEZa0W0OcOvswISE6PI7Ybn7OBiJESGHCEk5
         Ww2w==
X-Gm-Message-State: AOJu0Yyy/j/bPWDI0+sThhOW00HksvJtULGLsAnw9sto2RKKMslEqRb7
	rZMRj2+pmoVQY6CO2ZgY5YnpeREKZIs=
X-Google-Smtp-Source: AGHT+IF9dshkylQMPY1fIyIRnH6ZJmvXsbIoOcS4MQlSzE3ZOVNAREK3q0i4c0bScfjA6G5B4rKG2g==
X-Received: by 2002:a2e:8681:0:b0:2c5:1b01:b67f with SMTP id l1-20020a2e8681000000b002c51b01b67fmr1311772lji.52.1699698253935;
        Sat, 11 Nov 2023 02:24:13 -0800 (PST)
Message-ID: <e66e60744fe517c09ea16efc69cc329443025ef1.camel@gmail.com>
Subject: Re: [PATCH v2 06/15] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jan Beulich <jbeulich@suse.com>
Date: Sat, 11 Nov 2023 12:24:12 +0200
In-Reply-To: <7ab8ce9ca633a5a7e5212d0acc62d6e1d4688ca0.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <7ab8ce9ca633a5a7e5212d0acc62d6e1d4688ca0.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

This patch should be reworked as it fails Arm builds:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1068867920

It looks like it is not possible just to #ifdef CONFIG_MEM_ACCESS.

An empty asm-generic mem_access.h will be better solution.

Could you please share your opinion?

~ Oleksii

On Fri, 2023-11-10 at 18:30 +0200, Oleksii Kurochko wrote:
> ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
> allows to avoid generation of empty <asm/mem_access.h> header
> for the case when !CONFIG_MEM_ACCESS.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- add Suggested-by: Jan B=
eulich <jbeulich@suse.com>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the commit messa=
ge
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- remove <asm-generic/mem=
_access.h>
> ---
> =C2=A0xen/include/xen/mem_access.h | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/xen/include/xen/mem_access.h
> b/xen/include/xen/mem_access.h
> index 4e4811680d..87d93b31f6 100644
> --- a/xen/include/xen/mem_access.h
> +++ b/xen/include/xen/mem_access.h
> @@ -33,7 +33,9 @@
> =C2=A0 */
> =C2=A0struct vm_event_st;
> =C2=A0
> +#ifdef CONFIG_MEM_ACCESS
> =C2=A0#include <asm/mem_access.h>
> +#endif
> =C2=A0
> =C2=A0/*
> =C2=A0 * Additional access types, which are used to further restrict


