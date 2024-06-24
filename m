Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456B91444E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746242.1153232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLenh-0004HD-3x; Mon, 24 Jun 2024 08:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746242.1153232; Mon, 24 Jun 2024 08:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLenh-0004Fd-1I; Mon, 24 Jun 2024 08:11:45 +0000
Received: by outflank-mailman (input) for mailman id 746242;
 Mon, 24 Jun 2024 08:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLenf-0004FX-Oo
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:11:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 638c9644-3201-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 10:11:41 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52ce12707d9so1145563e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:11:41 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b4bcesm925373e87.38.2024.06.24.01.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 01:11:41 -0700 (PDT)
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
X-Inumbo-ID: 638c9644-3201-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216701; x=1719821501; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aoVVDL74Dizr9qB2FPuqwlUc4PuxccFDS7mtLIrj7ag=;
        b=Qdqy6x3w5fsVCVdUTdh7WS5GX6X0gpbJT202knR0lOvz5VlVueyx5MZaLUShsgdf/r
         difoSPPCyfy3dg6/7ELe8eHqJODIV1gWasnEICIci2iN/QuvA0WHmcDfeoS1qvpGOKci
         0jqLc87GaoDr/31PnBM7H8iyyvUK2ugmE5U34MNcn3jwlFOGLuTWDDdJG2W+Pl7XWVzZ
         noBO3HBw1qKAjiwwwXkii1HhJHYC442qZuSq7ZMOz7mD0o+MKaXE1dFuxVnWstRAab2h
         rnwFC6VuMEMk7KazFyzcAWWvCa/5xK9t0ZWeQ3UgwWUOKcnzji/oGWnqc0dswUKm5JM8
         zWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216701; x=1719821501;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aoVVDL74Dizr9qB2FPuqwlUc4PuxccFDS7mtLIrj7ag=;
        b=f3+YR0teN1jD3LBymZPMAnEEmv2rYudypu54tMWZbK4rS6ZLC6YaSma15Utw5dbhMt
         ucP85Xbp5KGEudQL/Z2e/RlG3VLLRW7FRSkcfzIMSDaSpFhpz8zpizw2YgZjnt9Vc1ej
         tnqW4fCw/91vl9lrdy8EiaSX47B5dZvuMQqzQE3n35iaFJcu1Axsyc0g8pAoJa2p6fE9
         YVUXfEYmWA/YQhsS+yLQ7X/OjqfUAfYMhtpPEOS8RcDGa+Du0vMTq7kQQraR9KXvw6WO
         yjFQU24ZxsIcxdWNPpqWSFq9EP0jt7vJPaLBO7+5w091Zy95+cTMvrJEN3wnrcxXk9vX
         2TNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlYL3o21yoOLYUUq3Btzlan1Vn1sTTSR02NaSu+1OQw4sCP/gpY336WwKZ8nu5+qT6WaFWo4sfMTnWtlexBmd7WBzFxLXrbhJ9BUauvdQ=
X-Gm-Message-State: AOJu0Yx8vL7ISX1GDu2uUH7/AiPwOLlFLbo8Nugoz1CSWEG+JXL88fct
	GLhu8cZqgzP/v7k4MVn0aWCiEFze71F9ueIC45/Zd2YFq7BuzEM500Q0WlXb
X-Google-Smtp-Source: AGHT+IFtjB7OG/l6HOvzdDW6/xw2YijO2PqkoXd4Yqar83gdYxcMqLFV15N8TMBi5EZ1pkwgYJpqxA==
X-Received: by 2002:a05:6512:239a:b0:52c:892e:2b26 with SMTP id 2adb3069b0e04-52ce063e3fdmr2932202e87.2.1719216701219;
        Mon, 24 Jun 2024 01:11:41 -0700 (PDT)
Message-ID: <f3cf0ea29f85d13a2d351b8ff1a50fd56e6253c1.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v3 0/4] x86/shadow: Trace fixes and cleanup
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Date: Mon, 24 Jun 2024 10:11:40 +0200
In-Reply-To: <20240621180658.92831-1-andrew.cooper3@citrix.com>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 19:06 +0100, Andrew Cooper wrote:
> Patches 1-3 were my review feedback to Jan's patch 4.
>=20
> For 4.19.=C2=A0 Patch 4 (the bugfix) was Release-Acked after I posted the
> series
> (cleanup and rebased bugfix), which suggests your happy for it in
> principle,
> but I can't treat that as an implict release ack on the whole series.
>=20
> It's a tracing fix, so is minimal risk to the 4.19 release.
Sorry for confusion, first patches don't provide any functional
changes, so it is okay to me to have it in Release 4.19.

So for the whole patch series:
 Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> v3:
> =C2=A0* Retain __packed attribute.
>=20
> Andrew Cooper (3):
> =C2=A0 x86/shadow: Rework trace_shadow_gen() into sh_trace_va()
> =C2=A0 x86/shadow: Introduce sh_trace_gl1e_va()
> =C2=A0 x86/shadow: Rework trace_shadow_emulate_other() as
> sh_trace_gfn_va()
>=20
> Jan Beulich (1):
> =C2=A0 x86/shadow: Don't leave trace record field uninitialized
>=20
> =C2=A0xen/arch/x86/mm/shadow/multi.c | 144 ++++++++++++++----------------=
-
> --
> =C2=A01 file changed, 60 insertions(+), 84 deletions(-)
>=20
>=20
> base-commit: 9e7c26ad8532c3efda174dee5ab8bdbeef1e4f6d


