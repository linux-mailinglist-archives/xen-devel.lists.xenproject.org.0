Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8D87EB37
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694761.1083851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEBm-0003T8-9U; Mon, 18 Mar 2024 14:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694761.1083851; Mon, 18 Mar 2024 14:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEBm-0003RX-6D; Mon, 18 Mar 2024 14:42:10 +0000
Received: by outflank-mailman (input) for mailman id 694761;
 Mon, 18 Mar 2024 14:42:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=839M=KY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rmEBk-0003RP-RI
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:42:08 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b144c240-e535-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 15:42:06 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d288bac3caso55351151fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:42:06 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a2e8706000000b002d46c4b5be5sm1580896lji.120.2024.03.18.07.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 07:42:05 -0700 (PDT)
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
X-Inumbo-ID: b144c240-e535-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710772926; x=1711377726; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0zs9FORdCVqjbN8HHPmhE3X+WIfBMifp4yNn8VM6DPw=;
        b=A0TvXpLXcSi65kjzvLEnfH9wWgEaSwV3QpeHscwwyNrOV1qjEhbGhgGh8Dx/5don+7
         KTdekKlEOGA7zSlm6tQcCfm5JrVr4PxCUluhV1aIqvqyB35fnM6vv4qEi3aNroUpQUU7
         P437mYj6dRcJHFOc5VG7VsL2BE1UMNQyS+fANhUzOPk8yspfwi8bDwNNEGA0J0NZt8ZW
         rfWNSH1tla7NAcMBrelyA6+Mygs4WbofMJsiXxO9DfjEd95SFsx/lLuN8o5Ft8EUDHIw
         eyJ+0S2cvtuOUdBPhybHaSsSS9bCyDIQBQW6C4tROUyLBkZH1RM8JVPoJMWTuRyC4iPN
         isvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710772926; x=1711377726;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zs9FORdCVqjbN8HHPmhE3X+WIfBMifp4yNn8VM6DPw=;
        b=W6jF+QRtVV2NMgoJaxJB9thVL3C+2LnO/NsyJWFq334JpQmqxdJ+FKFOG4BEa0iDSF
         bK47SWOm12GrDinIkiE+PCVUyYYqkvMjUwbaAjUJnvv4ciD8scxzAl/altCZQRCu++i+
         kCHvID/jeqxqhFF2H5YRgX4tS1pVVcrbMOaNIpwWZzqWg/MH6fDWMGDmarT859e8IQxH
         6uWqsKGWs2zEgPEB1DKvODAvQO5mZV+GX3wJ17uz3DdRVUkyGGovQYLlRfikemkUKS3x
         ODNyieU+aB0IgSBVCPAvaK3U/OpN8kGffWjW1ijPpoo+FBHfUKOb4/RjfwLb9sjhzcvb
         c9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZZsKeaf3Mbj7nKJ0I4QzFNoFB6QQzh5dIs6XB9ZgHB3x09i9GnSugTMcIWrmmT2KDW8jdo/L5YC9XCKlQ4YjDVUOX2e8YBI5pfUkiXcg=
X-Gm-Message-State: AOJu0Yxrv0jZqwAmr6+enkFyRqo8j0UYKAQfIrcnfX6J84ADc8z7ECIQ
	kj96LTtGA2WVABsV9xw7lVTcPI0welgvCmhWHR5c5LKNwwQjayTolGP3+OscO18=
X-Google-Smtp-Source: AGHT+IHWuKFDIFNjQO25vSdws2rjPdOas2ZNWE2GLB2C6AUfexi5FaAV0jgPgH9HUr2XfT9vA7p03w==
X-Received: by 2002:a2e:9c8e:0:b0:2d4:9201:d505 with SMTP id x14-20020a2e9c8e000000b002d49201d505mr4456143lji.51.1710772925761;
        Mon, 18 Mar 2024 07:42:05 -0700 (PDT)
Message-ID: <8fedc1b62712a8f9e64b06ae24be9359fbfb1947.camel@gmail.com>
Subject: Re: [PATCH v6 02/20] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Mon, 18 Mar 2024 15:42:04 +0100
In-Reply-To: <9ec42fc6-efc3-499b-b066-e582563cfc9c@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <5a1b905601db481a1a625dafbbf9b28dbe12876c.1710517542.git.oleksii.kurochko@gmail.com>
	 <9ec42fc6-efc3-499b-b066-e582563cfc9c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-03-18 at 08:54 +0100, Jan Beulich wrote:
> On 15.03.2024 19:05, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/configs/tiny64_defconfig
> > +++ b/xen/arch/riscv/configs/tiny64_defconfig
> > @@ -7,6 +7,23 @@
> > =C2=A0# CONFIG_GRANT_TABLE is not set
> > =C2=A0# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
> > =C2=A0# CONFIG_MEM_ACCESS is not set
> > +# CONFIG_ARGO is not set
> > +# CONFIG_HYPFS_CONFIG is not set
>=20
> What exactly is wrong with permitting this?
Nothing wrong, I just chose the wrong approach about which configs
should be disabled.

Considering your comment below, I'll limit overrides to what is
minimally necessary.

~ Oleksii
>=20
> > +# CONFIG_CORE_PARKING is not set
>=20
> At the example of this: It cannot be enabled by a user (or
> randconfig),
> it needs to be selected by an arch. Which RISC-V doesn't. Hence why
> specify (and not really override) the value here? This may apply to
> others as well, at the very least ...
>=20
> > +# CONFIG_DEBUG_TRACE is not set
> > +# CONFIG_IOREQ_SERVER is not set
> > +# CONFIG_CRASH_DEBUG is not setz
> > +# CONFIG_KEXEC is not set
> > +# CONFIG_LIVEPATCH is not set
> > +# CONFIG_NUMA is not set
> > +# CONFIG_PERF_COUNTERS is not set
> > +# CONFIG_HAS_PMAP is not set
>=20
> ... anything CONFIG_HAS_*.
>=20
> In summary - please limit overrides to what is minimally necessary.
>=20
> Jan
>=20
> > +# CONFIG_TRACEBUFFER is not set
> > +# CONFIG_XENOPROF is not set
> > +# CONFIG_COMPAT is not set
> > +# CONFIG_COVERAGE is not set
> > +# CONFIG_UBSAN is not set
> > +# CONFIG_NEEDS_LIBELF is not set
> > =C2=A0
> > =C2=A0CONFIG_RISCV_64=3Dy
> > =C2=A0CONFIG_DEBUG=3Dy
>=20


