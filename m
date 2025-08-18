Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0472B29C41
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085616.1443923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvGk-0001IP-9h; Mon, 18 Aug 2025 08:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085616.1443923; Mon, 18 Aug 2025 08:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvGk-0001GS-78; Mon, 18 Aug 2025 08:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1085616;
 Mon, 18 Aug 2025 08:31:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wfwg=26=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1unvE0-0007PU-9M
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:28:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48ad16fd-7c0d-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:28:14 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9dc52c430so1805744f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:28:14 -0700 (PDT)
Received: from smtpclient.apple ([46.149.103.15])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb676c971bsm11774347f8f.32.2025.08.18.01.28.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:28:13 -0700 (PDT)
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
X-Inumbo-ID: 48ad16fd-7c0d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755505694; x=1756110494; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS6PQPad+qJTxoHm41QxOqqPQHlC8QY6Sq3VU7PA8xE=;
        b=g0WROmyEujTZsYTcbg6tg6wc+UMwPMHFYXbm0l/DbEoAh7vbdC1ObwcqDhhUceHioA
         Nn4ifVTqVQdai0qBmIOVx8y35hf1dCcsUn6dWgDgFAOLflSMhtgMZnQBgbDs9Lm4EdAI
         m/Zd4WMN3laXWVqlkQqpZ/pSTvXcQvbEW5tuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505694; x=1756110494;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS6PQPad+qJTxoHm41QxOqqPQHlC8QY6Sq3VU7PA8xE=;
        b=kIfuuLUaDG2UgEq3bkBtn8inac2BCFI8aQemR9hwqKLiTcoHVscNbVy8omLNyVsk+T
         hMMvdxzD2gCZ1IOU9e7y7RxFCO+LOTES09C6D4lQuWt1Gkz3UT9hRxJKJ0CYrYI0KI0/
         +Rk1rvkIdd4sARPmxTtTseoJ9KaWHsBFevy5/q+CCGsdFN9m7I4go9SVhFmZDPb15PFe
         lyWAgsXBox/zyJsaVYmstXNO50TfJi28vjIj/Ygf2Fh4vQfrVfUHu3hkkQ8nG6VFerTa
         BwTwmBzOj/YnC53Jn0AC92Fke4RqNuHUo8kv6DIMt1sgS+eR6x6HXV8wNzku4gZVHRHg
         kekw==
X-Gm-Message-State: AOJu0YxSghRtVeyBgp5U7tXf902VYstN4IfwstnIni6Yyih3sxpsgyIw
	mNXjwf67UEMfXIz8j7b2VEcxFxO0kwKayQweu9SmGq999ltDYf5hTFuo7yWVaGn69cQ=
X-Gm-Gg: ASbGncuHT9lQd9EhzCcHwXvK1VRpr/yU5wAkXkoopeGeewwrziyJX8fhGWl6mmiRXZw
	QIzcJP+zQPSeQP7+0rTGQivPk3stzbrjb/x9Xa8wEigSoJ5SlrV0JtRucxKDt9Ac2Fwf5p2QUOw
	TI3+s3ukGYUQfjILqR6WHHsutlwoAANuwxEW51d8xGTssEUOzPDcVOs6YGiBiYZbjf4RrVQu9jc
	XrnAZf2FnSefkfVfW0N+z4WEVbJsm+UnGNDb+Cr1zF+AAgImiGkVj0gskeLhLdyeb7uTFK2Z08o
	5lEbf6g3VmCpXXphToFLIzmK8bcBEJBw7XlZ/AMPBcCM75ahFT1+cOQc1HOPSXlJfPp57/3Kqtp
	t97ky+FBHLKYNCQPtdE29nG97BNtkf8oG+gedDbHRkHGEbjg=
X-Google-Smtp-Source: AGHT+IFXnJ4pGa0CUa7tQNI5bN+73fIC/JfHYWuoqHfsx7UimU1ob495QUyM4/dzZ1E5TFYmcE0/Zw==
X-Received: by 2002:a05:6000:430e:b0:3ba:d257:b662 with SMTP id ffacd0b85a97d-3bb6710022cmr7114124f8f.18.1755505693899;
        Mon, 18 Aug 2025 01:28:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v2 7/7] xen: New API to claim memory for a domain using
 XEN_DOMCTL_claim_memory
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <cc9119869fb87f02b287250d9bb33962a6d35961.1755341947.git.bernhard.kaindl@cloud.com>
Date: Mon, 18 Aug 2025 09:28:02 +0100
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D25EB8BD-B7DF-4102-90C6-89637362E722@cloud.com>
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
 <cc9119869fb87f02b287250d9bb33962a6d35961.1755341947.git.bernhard.kaindl@cloud.com>
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

Acked-by: Christian Lindig <christian.lindig@cloud.com>


> On 16 Aug 2025, at 12:19, Bernhard Kaindl <bernhard.kaindl@cloud.com> =
wrote:
>=20
> Add the new hypercall requested during the review of the v1 series
> do not require changing the API for multi-node claims.
>=20
> The hypercall receives a number of claims, intented to be one claim =
per
> NUMA node, and limited to one claim for now. The changes to update the
> NUMA claims management to handle updating the claims for multiple
> NUMA nodes of a domain at once are deferred to the next series.
>=20
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> tools/flask/policy/modules/dom0.te  |  1 +
> tools/flask/policy/modules/xen.if   |  1 +
> tools/include/xenctrl.h             |  4 +++
> tools/libs/ctrl/xc_domain.c         | 42 +++++++++++++++++++++++++++++
> tools/ocaml/libs/xc/xenctrl.ml      |  9 +++++++
> tools/ocaml/libs/xc/xenctrl.mli     |  9 +++++++
> tools/ocaml/libs/xc/xenctrl_stubs.c | 21 +++++++++++++++
> xen/common/domain.c                 | 30 +++++++++++++++++++++
> xen/common/domctl.c                 |  8 ++++++
> xen/include/public/domctl.h         | 17 ++++++++++++
> xen/include/xen/domain.h            |  2 ++
> xen/xsm/flask/hooks.c               |  3 +++
> xen/xsm/flask/policy/access_vectors |  2 ++
> 13 files changed, 149 insertions(+)

> +
> +    /* Use an array to not need changes for multi-node claims in the =
future */
> +    if ( nr_claims )
> +    {
> +        size_t bytes =3D sizeof(memory_claim_t) * nr_claims;
> +
> +        buffer =3D xc_hypercall_buffer_alloc(xch, buffer, bytes);
> +        if ( buffer =3D=3D NULL )
> +        {
> +            PERROR("Could not allocate memory for =
xc_domain_claim_memory");
> +            return -1;
> +        }
> +        memcpy(buffer, claims, bytes);
> +        set_xen_guest_handle(domctl.u.claim_memory.claims, buffer);
> +    }
> +
> +    ret =3D do_domctl(xch, &domctl);
> +    xc_hypercall_buffer_free(xch, buffer);
> +    return ret;
> +}

Should this be "if (nr_claims > 0)=E2=80=9D or have an assertion against =
negative values?

=E2=80=94 C


