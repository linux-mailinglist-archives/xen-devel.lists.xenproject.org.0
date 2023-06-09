Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1D87292BB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 10:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545656.852151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7XJm-0006mk-Mi; Fri, 09 Jun 2023 08:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545656.852151; Fri, 09 Jun 2023 08:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7XJm-0006ku-JO; Fri, 09 Jun 2023 08:17:58 +0000
Received: by outflank-mailman (input) for mailman id 545656;
 Fri, 09 Jun 2023 08:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HcUh=B5=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1q7XJk-0006kl-Vt
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 08:17:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 224ff57c-069e-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 10:17:54 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f7e7fc9fe6so14344445e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jun 2023 01:17:54 -0700 (PDT)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w18-20020a05600018d200b0030af54c5f33sm3727039wrq.113.2023.06.09.01.17.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Jun 2023 01:17:53 -0700 (PDT)
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
X-Inumbo-ID: 224ff57c-069e-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686298674; x=1688890674;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0673QD8w4Nwt++U7Gvm+SP1CQSpzK2BtO+u5FWqFJRM=;
        b=AbdYJPBOinh96qZoLGVeocPM1AfOwyJ+up/8Nlg/Fi/MA9/s0M/Zsxbl4xMbtETfxL
         690+yGX9/+3R6K4N7lEE3fEoTU33k/MnlkbKhR8jd8Yh/c1Pj8x0PBg/dbiIV8LOKJeF
         HnrFzrJgvlUtBuLIDp1LQzKyml6xGaCbyv2zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298674; x=1688890674;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0673QD8w4Nwt++U7Gvm+SP1CQSpzK2BtO+u5FWqFJRM=;
        b=AF0UViulyu37a4qdnjBHAfGI6wBPTwpdHo/wXY2NFm0e3kTQThhxxHitubWkd0BmfN
         Ya5ca+UxJWPFtCmW+RIyK8kzZNvnxo7x7hILFbIABrn7Q48FdSQ4U92v604WuhaySMug
         tIlMG2MwLCQrGMa957IVWHbzJw63Iq4KCRud1naIKSimmkfsSriMjvMAcLOwqXut3xAH
         Ptuj5oK67kVuONMFGgCYmS0ONsVzcfnZZHybU5kHLEwoO1KBcriPrSazg6qwCm8GolVr
         ZVRgA1UBh7BEeJoqNx7b9MRrUL+JEGWbXX0knJfUOcg+DP5fIM+5v3A5aTIQlH2Hd4Hc
         FAAw==
X-Gm-Message-State: AC+VfDxou037HqBFBMwj0eKMAnxQEIW9iBhzIT2WHHq1gwD8VmyAg5MT
	2VMTVaoyCQ3p2wCc9kqKhIcspA==
X-Google-Smtp-Source: ACHHUZ4AEsxoEqReEOrGEvhZ+fFDP+hvuePU10jewFIC8Vn/d7UjAm8aZtwnjX1r1i4al44TkOlL2w==
X-Received: by 2002:a1c:7203:0:b0:3f5:146a:c79d with SMTP id n3-20020a1c7203000000b003f5146ac79dmr550970wmc.15.1686298674075;
        Fri, 09 Jun 2023 01:17:54 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] tools/ocaml/xc: Fix xc_physinfo() bindings
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
Date: Fri, 9 Jun 2023 09:17:52 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D41CF6C4-7912-4837-B5DA-2E94D13F3799@cloud.com>
References: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)



> On 8 Jun 2023, at 20:33, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> +type arm_physinfo_caps =3D
> +  {
> +    sve_vl: int;
> +  }
> +


Does the OCaml side need to know about the structure of this value or is =
it enough to pass it around as an abstract value because all logic is on =
the C side? I assume the OCaml side needs at least a way to persist the =
value and hence needs to know some representation.=20

> 	Store_field(arch_obj, 0,
> +		    Val_int(MASK_EXTR(info->arch_capabilities,
> +				      XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK) * =
128));
> +

What is the =E2=80=9C* 128=E2=80=9D achieving as part of this encoding?

=E2=80=94 C=

