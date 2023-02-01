Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512136862B9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 10:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488219.756200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN9K9-0003T0-Iq; Wed, 01 Feb 2023 09:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488219.756200; Wed, 01 Feb 2023 09:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN9K9-0003Pd-Fr; Wed, 01 Feb 2023 09:22:37 +0000
Received: by outflank-mailman (input) for mailman id 488219;
 Wed, 01 Feb 2023 09:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0kk=55=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pN99P-00026F-9t
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 09:11:31 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69c06197-a210-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 10:11:30 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id cw4so11827043edb.13
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 01:11:29 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k27-20020a05600c081b00b003de77597f16sm1072830wmp.21.2023.02.01.01.04.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Feb 2023 01:04:43 -0800 (PST)
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
X-Inumbo-ID: 69c06197-a210-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuOMiMCaIb4W5xDLrZ5AT/uU/AgC110LiidElfA2tjQ=;
        b=l++JAFYn28aYNtbNWPcV4jSY0b8Lq7PTBPkz7oSquxQloMwiaOVlS0v5Xv93vPXbRJ
         RshAJLcKR/QAFJWXEPvxvy0mN18MWMARvi6gLaidufuNzkH7tEQ6xzlE3T7HzS0lRIxm
         oOW9L8IAFd+kwGBP4rPwFguA3C3hyjmypzBQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuOMiMCaIb4W5xDLrZ5AT/uU/AgC110LiidElfA2tjQ=;
        b=Jpposja9EUKxK8i0CpGzSvQgUrZ0kb47e9pMkXqmNIn0YaGXWXWS4QCeIwdXWplJk/
         WTkNjMrpinEqWkD6vCtTmL+Cli9olNYQxkhGvAEjsdbnW4A975suXHWymHRnV4Npz6eR
         Jv64PInIgxAgKpi1DKfTIfL+7NzDgcL35S96CIMFHAPfbldcXDUreZ5jqu1iuOQxcX5X
         y9rXs4Px8AFUtupiUtDn57ZkOvQkcNCcNmoIXz8gPK8F6Yx/vOFjMmmHAAjuolINXShU
         FB8hI2Zrgdtul8kje8C3hSdTkkAZn+QzjueAYnfoMQP+q3rOodnQoliIWACWTJ6ffgGD
         9hwQ==
X-Gm-Message-State: AO0yUKXw2u5Wy/0REmaKlngodkUMNYL+mRgcHJCM1+7hWVvIi0fJ+wyR
	T5ZBhOjqq9Yccw52mGmSwwOusahHK4AwPFLQwiH2cw==
X-Google-Smtp-Source: AK7set/6/CR8MPQ4iWHTfaKeGWi8T0K3tIKOSg+YA6OZuFVgUy2pCSK3EwDOtWBiMKtP9gvWI2zNeg==
X-Received: by 2002:a05:600c:1546:b0:3dc:58d5:3a80 with SMTP id f6-20020a05600c154600b003dc58d53a80mr6591921wmg.24.1675242284043;
        Wed, 01 Feb 2023 01:04:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 0/7] tools/ocaml: Memory corruption fixes in bindings
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
Date: Wed, 1 Feb 2023 09:04:42 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0962AEC0-72C5-4A03-BF97-AFB3455B9EDE@cloud.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 31 Jan 2023, at 21:29, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> It turns out there have been some latent memory corruption bugs and =
other
> errors in the bindings since they were first introduced.
>=20
> These were discovered after realising that we'd introduced other =
memory
> corruption bugs as part of the Ocaml 5 fixes, and in the case of the =
evtchn
> bindings, backported this as part of the oxenstored-lu fixes.
>=20
> This series addresses all the memory corrupution issues we're aware of =
that
> can occur in an entirely well-formed program.
>=20
> Deferred for now are the (hopefully latent) memory corruption errors =
which
> happen due to bad parameter passing, and a substantial pile of related =
cleanup.
>=20
> Andrew Cooper (3):
>  tools/ocaml/libs: Allocate the correct amount of memory for =
Abstract_tag
>  tools/ocaml/evtchn: Misc cleanup
>  tools/ocaml/xc: Don't reference Abstract_Tag objects with the GC lock =
released
>=20
> Edwin T=C3=B6r=C3=B6k (4):
>  tools/ocaml/libs: Don't declare stubs as taking void
>  tools/ocaml/evtchn: Don't reference Custom objects with the GC lock =
released
>  tools/ocaml/xc: Fix binding for xc_domain_assign_device()
>  tools/ocaml/xc: Don't reference Custom objects with the GC lock =
released
>=20
> tools/ocaml/libs/eventchn/xeneventchn_stubs.c |  89 ++---
> tools/ocaml/libs/mmap/Makefile                |   2 +
> tools/ocaml/libs/mmap/xenmmap_stubs.c         |   6 +-
> tools/ocaml/libs/xb/xenbus_stubs.c            |   5 +-
> tools/ocaml/libs/xc/xenctrl_stubs.c           | 494 =
++++++++++++++------------
> 5 files changed, 323 insertions(+), 273 deletions(-)
>=20
> --=20
> 2.11.0
>=20

Really pleased with the attention to this.

Acked-by: Christian Lindig <christian.lindig@citrix.com>


