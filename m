Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D7D9B4FC3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827734.1242430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pPJ-0004ce-Pg; Tue, 29 Oct 2024 16:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827734.1242430; Tue, 29 Oct 2024 16:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5pPJ-0004aE-MD; Tue, 29 Oct 2024 16:49:25 +0000
Received: by outflank-mailman (input) for mailman id 827734;
 Tue, 29 Oct 2024 16:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/ws=RZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t5pPI-0004ZO-QH
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:49:24 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb4ea35-9615-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 17:49:21 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso832638566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 09:49:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a086f6dsm485681566b.214.2024.10.29.09.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 09:49:19 -0700 (PDT)
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
X-Inumbo-ID: beb4ea35-9615-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlYjRlYTM1LTk2MTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjIwNTYxLjE1NzgyNiwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730220560; x=1730825360; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bc3HSpZHv7wsx+J9pjxv78u2BjnmNqb0nRpUESP+2NM=;
        b=XtzGgn2oFWGDUjbRE5rrWwF3zgzKLOyDOwXeCcwn9haueVKuj5XeyJ7v/ypZDy7Ego
         R1HQb/hcGHTKmakc2mNs3J2v5Q+mdQ0GeV6tjIFgcrKr6iJ5Fp3jgg+h/C87GLpb8Jjv
         OrA/LuwClw3lGumtM88cyPfd0/xEuoGEof9UqhCazXCtKRuPmFRZwaSpGjF3Tr0mE++w
         R5Qt+XO6OkT1zX4f1+U3HnQPGK6RFuIpb8h1yb0bL9zN/CYA8hh6uc/eyE/SKrhuCTdB
         sXetHkKi2vJ910/YQgNo5zYXwdr7soV4c93hosoYg4s+2TfgYqXvDIPTIOSFTSutA6cP
         ikIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730220560; x=1730825360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bc3HSpZHv7wsx+J9pjxv78u2BjnmNqb0nRpUESP+2NM=;
        b=RXpodCPCGKKyqdD5SgPPCKE+LC8KUQupmYN4CrJx/iMspgzWRBq8/x1Rfu47RWo2wh
         XVOStrPb5fQf8nOuFBwfS9u4Cnkj9gvw5v34FcqcGcm0CFt2XYOGtALfzakZg05Flh4l
         aWLYPV56yBv2EhhumXN0TgoV9BD+f50KdZ5m4w0WUX53poIragAKCqxg6eDRCRVoven4
         DbpOc8M17Rr+UUmis0KxBTNq1LkUybeH1EG0wyPVRpH9A3hEZkmNVygziFP9ohzWVaVc
         r6ZVCi6dcqAaTkIelsbl8mCKBmvEFFXTjsH4AZAW8vbYSgt/dTtCg/3D9PvckNts9pMC
         N6WA==
X-Forwarded-Encrypted: i=1; AJvYcCXbI45IrtvrQtl9NwS+eP9uAxdbF0+BSBhraU20lKrR53n7dC3ewcp5lCJtv4zEVnxASM8UF70ZJXM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqFk9aSDTUnR6oUXeSOxx1rFm/8vjzbP/t7zbq0jtm+LPWNY+S
	uZnRJBmvSLOaDufHnLl4ajacH/iqSAExjoFc4CfyBT3+4Mc30F8X
X-Google-Smtp-Source: AGHT+IEcotjQ54a26AVC39O0zUrjvUWtKYG5pC5gefD2sxlFJKui8VSMysbdM4gXqclQKgFUmxqrpA==
X-Received: by 2002:a17:907:72ce:b0:a99:7539:2458 with SMTP id a640c23a62f3a-a9de6455bf8mr1043030966b.65.1730220560265;
        Tue, 29 Oct 2024 09:49:20 -0700 (PDT)
Message-ID: <271c0ff849d7c203399a7afc51df80a231c9e093.camel@gmail.com>
Subject: Re: [PATCH v4 2/6] xen/arm: mpu: Introduce choice between MMU and
 MPU
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ayan Kumar Halder
	 <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>, Julien
 Grall <jgrall@amazon.com>
Date: Tue, 29 Oct 2024 17:49:18 +0100
In-Reply-To: <970e36dd-bedd-405b-966b-66dde57eb118@citrix.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
	 <20241028124547.1371867-3-ayan.kumar.halder@amd.com>
	 <970e36dd-bedd-405b-966b-66dde57eb118@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-29 at 09:53 +0000, Andrew Cooper wrote:
> On 28/10/2024 12:45 pm, Ayan Kumar Halder wrote:
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index c499d12dc4..79524cc15f 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -12,6 +12,8 @@ The format is based on [Keep a
> > Changelog](https://keepachangelog.com/en/1.0.0/)
> > =C2=A0=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run tim=
e service
> > call.
> > =C2=A0
> > =C2=A0### Added
> > + - On Arm:
> > +=C2=A0=C2=A0 - Support for earlyboot of Xen on Armv8-R (experimental).
>=20
> Simply "Experimental support for Armv8-R".
>=20
> The rest of that sentence is going to go stale quite quickly.
With suggested by Andrew: Acked-by: Oleksii Kurochko
<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


