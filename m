Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0199072962B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 12:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545798.852378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yuj-0004zY-Rh; Fri, 09 Jun 2023 10:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545798.852378; Fri, 09 Jun 2023 10:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yuj-0004xk-ON; Fri, 09 Jun 2023 10:00:13 +0000
Received: by outflank-mailman (input) for mailman id 545798;
 Fri, 09 Jun 2023 10:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HcUh=B5=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1q7Yuh-0004xe-Sg
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 10:00:11 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6abf8080-06ac-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 12:00:09 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so15347555e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jun 2023 03:00:09 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f735d6fa74sm2185509wml.9.2023.06.09.03.00.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Jun 2023 03:00:08 -0700 (PDT)
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
X-Inumbo-ID: 6abf8080-06ac-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686304809; x=1688896809;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLgQ0rVnQakpGZ8A3oVfU/k9TYTJbZaybJm7RhzWVrk=;
        b=CqxeXY5dxewp6GI2klkHgjlrKQ42m1Z2rYkkObhm+suuUKi38olmKW9OnTbccQz1Xw
         AHTZcHShW8hMNAPkhXw2avCwZlHexN76dOGwaLczKJRjBtgWtUuYh3+MvUgU7yR5ilOU
         71QySvZs5ZqRApU3uFyh0Wq610zF5N1K8SbTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304809; x=1688896809;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLgQ0rVnQakpGZ8A3oVfU/k9TYTJbZaybJm7RhzWVrk=;
        b=UHz4cdT8vFmYTdhGiWlp5qdiuN0HwYwC3IVh8lEQjI7Pu2y9QM8usNaor60u3AfcwU
         50u1vJWSUS68tvZXF0B8C9P83vTW0z1nCKws5LjpT6gP0sNij60v/m95g8MgiQlDGuNi
         iSkQ7liZL+NOBzTx7IaKkqAjgDF6HobRykJjbzSzGWCR799FgD2yxlQeptoyiJJfTkA/
         xXymMkpqkfbTQW3PHG6hkHTjvRjPCfO1DMrQ5je9WiCb3oNa6hSJEg2wpTmJNVWiG9t5
         LhOU+rEyfNfBi1kfgbzzHS3KMY2Fi5ux4C/lBQIjzXhnCt74VX7FNiBRUi6fdgtz8Pik
         50DQ==
X-Gm-Message-State: AC+VfDw37ob8u9VIj3R1M6VCNExObp/YDRq9ndUysQ4K1xzaIqUza743
	lgGwBCZxkeVRBX0TQyVUun6NAA==
X-Google-Smtp-Source: ACHHUZ4jBqshVAdUCBKmalHygp/lyfhdI4fXgcyAXrh3Fcx+go5paSfqtidOqJLD7+BSVqQERlnCTA==
X-Received: by 2002:a1c:7c1a:0:b0:3f7:e7a5:5bc5 with SMTP id x26-20020a1c7c1a000000b003f7e7a55bc5mr698883wmc.24.1686304809153;
        Fri, 09 Jun 2023 03:00:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] tools/ocaml/xc: Fix xc_physinfo() bindings
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cae2b894-7ff9-7873-9709-ffc5f74dded2@citrix.com>
Date: Fri, 9 Jun 2023 11:00:08 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C784BBFF-2DC0-4F0D-B89A-BC8B99A361F1@cloud.com>
References: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
 <D41CF6C4-7912-4837-B5DA-2E94D13F3799@cloud.com>
 <cae2b894-7ff9-7873-9709-ffc5f74dded2@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)



> On 9 Jun 2023, at 10:37, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 09/06/2023 9:17 am, Christian Lindig wrote:
>>> On 8 Jun 2023, at 20:33, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>>>=20
>>> +type arm_physinfo_caps =3D
>>> +  {
>>> +    sve_vl: int;
>>> +  }
>>> +
>>=20
>> Does the OCaml side need to know about the structure of this value or =
is it enough to pass it around as an abstract value because all logic is =
on the C side? I assume the OCaml side needs at least a way to persist =
the value and hence needs to know some representation.
>=20
> Yes, Ocaml does need to know about the structure.
>=20
> [..]
>=20
> The vector length is a multiple of 128.  This value is more amenable =
to
> being understood in a log file by a human.


Acked-by: Christian Lindig <christian.lindig@cloud.com>


