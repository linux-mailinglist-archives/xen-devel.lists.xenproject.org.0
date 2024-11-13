Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1279C74A9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 15:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835779.1251636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEbG-00029n-Hn; Wed, 13 Nov 2024 14:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835779.1251636; Wed, 13 Nov 2024 14:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBEbG-000288-Et; Wed, 13 Nov 2024 14:44:06 +0000
Received: by outflank-mailman (input) for mailman id 835779;
 Wed, 13 Nov 2024 14:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lrmv=SI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBEbF-000280-CO
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 14:44:05 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8defdd4-a1cd-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 15:44:01 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9ed49ec0f1so1171245566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 06:44:01 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4c3f5sm879865266b.76.2024.11.13.06.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 06:44:00 -0800 (PST)
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
X-Inumbo-ID: b8defdd4-a1cd-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI4ZGVmZGQ0LWExY2QtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTA5MDQxLjU2MTg4Niwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731509041; x=1732113841; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jLUSd68AIhBf7PmjokCFVD+jf3f3kIvlqj1vTs3kmV8=;
        b=ZDEGhn6pVNRBC8mrMGxm4tKwG+cuBzRllzXQvdded3p9IjG7ea1aEwrPOXm1VgIFWl
         PvG96NcRVl+VpZO5OofiapX/iX8NO5c9pS7kTqACC98Q0pXFs/QACBnp07fFjfTUeP/e
         5AWRV61oK9eo4IOe5kZS7dBcOLoR8fL/X8pbCY5mamp0fMRq6QXP4t0H1bXtcKZCugow
         rFYQ8WMRC4kaPFqM3obE8zkpQcHhIjboBoZdDkqyWFVpVIKaUPTRnumGoq6zPUDx6kwy
         izuOvrmkLn4L8UyP3CaWtH6qnQYeAOyBsKZJrVm8HQvCviQufp5GhZm2zewJl0D4qYtD
         4diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731509041; x=1732113841;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLUSd68AIhBf7PmjokCFVD+jf3f3kIvlqj1vTs3kmV8=;
        b=imhA7IEoEyJ5/olmw+K+Z4ln3JYsN5p+ctlFahjxWUA4gIt6IxWy+bkdUwvE+dQWgH
         fceBjc5qofw6HkQ2kwqqkwa4QQEQzHIJXXbP44mlUl+QWMVj98Z3nykLt8Jb54+1pvKO
         8JVv9nDt82NvsIeu/B/wrDNJlUvVLULoAv1UwAD+XG+qrJPvAxJNEH7gQzPW7MQj5d0+
         qo73ZeWahhCL2INjrfsXEc/37HUkmYBcRzxej/paFr9hVUr6lkxNThaAsQCVojoZeOH5
         6SKH+U1gFRWZv8/0rbJgtgQer5KBEcZGgm1voL9xo318UurACb/hyJwtJ58/iED10Z1t
         Boqw==
X-Forwarded-Encrypted: i=1; AJvYcCUUw063MgYZ9VFFD5SOiyFCeX5q7hVf9RPUNN3QXkLd7HTUEvjN4QoPR6QD0dFlUN4URydMuWov0sw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiC3dB9NStC3EFjWFcGzQ6oOOKT8lfXzuN9cmsdfSw8SrgqsHK
	AiDuGR6I3c9i81YBLhqQzXtm4CV6vVEiVXkFqfQm+QteAXbte0lv
X-Google-Smtp-Source: AGHT+IE6s5/YNnZT43pmJ8hGF/CG6UPUChcd77pSvfeb7PqnrO5xw1Q/SakPsVGifrTa6gn35MsxWQ==
X-Received: by 2002:a17:907:36c5:b0:a9e:441c:f729 with SMTP id a640c23a62f3a-aa1afd3ed3cmr761609566b.0.1731509040622;
        Wed, 13 Nov 2024 06:44:00 -0800 (PST)
Message-ID: <814c2168603cd48e32fde6fff0cad2ca58fc2c9d.camel@gmail.com>
Subject: Re: Xen 4.20 Development Update [August-October]
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Kelly Choi <kelly.choi@cloud.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2024 15:43:59 +0100
In-Reply-To: <14df2192-9736-4c1c-8aac-2853467ea330@suse.com>
References: 
	<CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
	 <14df2192-9736-4c1c-8aac-2853467ea330@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Wed, 2024-11-13 at 10:48 +0100, Jan Beulich wrote:
> On 12.11.2024 17:16, Oleksii Kurochko wrote:
> > =3D=3D=3D x86 =3D=3D=3D
> >=20
> > *=C2=A0 Expose consistent topology to guests (v7)
> > =C2=A0 -=C2=A0 Alejandro Vallejo
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/20241021154600.11745-1-alejandro.vall=
ejo@cloud.com/T/#m6033f95c660675039d7789d3af1ba2f292a3a69b
> >=20
> > *=C2=A0 Boot modules for Hyperlaunch (v8)
> > =C2=A0 -=C2=A0 Daniel P. Smith
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/20241102172551.17233-1-dpsmith@apertu=
ssolutions.com/T/#m94a2f6b9d410c6d624aaebd7c2bf85584c74383e
> >=20
> > *=C2=A0 x86/mm: miscellaneous fixes (v2)
> > =C2=A0 -=C2=A0 Roger Pau Monne
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/Zyyo8qMobqQT-rA5@macbook/T/#m2df34239=
b793501c6246c85c4b00e52f9c439ac0
> >=20
> > *=C2=A0 x86/ucode: Simplify/fix loading paths further (v1)
> > =C2=A0 -=C2=A0 Andrew Cooper
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/20241107122117.4073266-1-andrew.coope=
r3@citrix.com/T/#m76304334081e6b4b0976c6c474f1f0772e0625d1
> >=20
> > *=C2=A0 Address Space Isolation FPU preparations (v2)
> > =C2=A0 -=C2=A0 Alejandro Vallejo
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vall=
ejo@cloud.com/T/#mbca5192d7e5636ef5ea005a083e5ff28ebe6317d
> >=20
> > *=C2=A0 Fix module-handling use-after-free's (v2)
> > =C2=A0 -=C2=A0 Andrew Cooper
>=20
> Wasn't this committed already?
Double-checked, it has been committed, thanks. I will move it to
completed section.

>=20
> > https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.coope=
r3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
> >=20
> > *=C2=A0 Reuse 32 bit C code more safely (v4)
> > =C2=A0 -=C2=A0 Frediano Ziglio
>=20
> Same question here.
For this patch series my script found to patches which are not in
staging:
$ git log --grep=3D"x86/boot: create a C bundle for 32 bit boot code and
use it"
$ git log --grep=3D"x86/boot: Clarify comment"

>=20
> > https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.zig=
lio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
> >=20
> > *=C2=A0 x86/alternatives: Adjust all insn-relative fields (v2)
> > =C2=A0 -=C2=A0 Andrew Cooper
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.coope=
r3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
> >=20
> > *=C2=A0 x86: address violations of MISRA C Rule 16.3 (v1)
> > =C2=A0 -=C2=A0 Federico Serafini
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/cover.1725958416.git.federico.serafin=
i@bugseng.com/T/#m46c991ed7ea7a6fe505056facddfcc684be01ab6
> >=20
> > *=C2=A0 Support device passthrough when dom0 is PVH on Xen (v16)
> > =C2=A0 -=C2=A0 Jiqian Chen
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@=
amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
> >=20
> > *=C2=A0 x86emul: misc additions (v5)
> > =C2=A0 -=C2=A0 Jan Beulich
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/0b9a0ae8-a39c-49d8-b4e7-f2a463128058@=
suse.com/T/#m5aae1045eb07d85fb029bdef12a78cdb6bfe780e
> >=20
> > *=C2=A0 x86/HVM: drop stdvga caching mode (v2)
> > =C2=A0 -=C2=A0 Jan Beulich
>=20
> This, after having been committed, even became the subject of an XSA
> that
> was published earlier this week.
I saw XSA but thought that this patch series wassn't fully commited as
my  script told that some patches aren't in staging but the real reason
is that it has an issue with quotes ( now it is fixed, thanks ) for
cases like:
```
$ git log --grep=3D"drop stdvga's "gr[]" struct member"
fatal: command line, 'drop stdvga's gr[] struct member': Unmatched [,
[^, [:, [., or [=3D
```

I will put it to completed.


>=20
> > https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@=
suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
> >=20
> > *=C2=A0 x86/HVM: emulation (MMIO) improvements (v1)
> > =C2=A0 -=C2=A0 Jan Beulich
> > =C2=A0 -
> > https://lore.kernel.org/xen-devel/31906cba-8646-4cf9-ab31-1d23654df8d1@=
suse.com/T/#mdae2f21b929170d60a8640e82857700c940e65c7
>=20
> More stuff missing that was already intended for 4.19: AMX, AVX10,
> and
> use of ERMS in Xen, to name just a few.
I will add it back. ( for the case someone would like to look at it
now:
https://lore.kernel.org/xen-devel/32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.=
camel@gmail.com/
)

Thanks!

~ Oleksii


