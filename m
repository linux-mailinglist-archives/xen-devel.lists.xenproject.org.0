Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CD71FA1D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 08:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542947.847419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yHo-00032W-Gk; Fri, 02 Jun 2023 06:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542947.847419; Fri, 02 Jun 2023 06:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yHo-00030T-Dz; Fri, 02 Jun 2023 06:29:20 +0000
Received: by outflank-mailman (input) for mailman id 542947;
 Fri, 02 Jun 2023 06:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lrop=BW=linaro.org=erik.schilling@srs-se1.protection.inumbo.net>)
 id 1q4yEE-0002xb-8J
 for xen-devel@lists.xen.org; Fri, 02 Jun 2023 06:25:38 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48bc32ed-010e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 08:25:35 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30af159b433so1650699f8f.3
 for <xen-devel@lists.xen.org>; Thu, 01 Jun 2023 23:25:35 -0700 (PDT)
Received: from localhost (i5C7416B4.versanet.de. [92.116.22.180])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b002fda1b12a0bsm680309wrt.2.2023.06.01.23.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 23:25:34 -0700 (PDT)
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
X-Inumbo-ID: 48bc32ed-010e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685687135; x=1688279135;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58IFbC3rmymPwKUDuCiKppnQO9rXalByrp299fjIUgI=;
        b=DKz/ZAsjlmHbi94x/tVKo2Sp2yjV5EOxf4cbxC9/pheLlRv/Sx2rNJHc2jgtTwoAPb
         5u0HbBOX71UNo+OTxtZcS8sYpTAg1TOyvJjS8MPhwP6PFO5JwCuB7YT4eMx+6qiYkS48
         kr4UqKsHhwPBVJXei7lwYlh7xsBjkKplSv+PSqDUA1JEn8Ppsq3qBy58ZGSMRfpV4rwK
         RvSuW22IWoDU67zKWpP3/T6f32IG+ZU9270YBwrUBojsq9uPfvBBo8sfXvAKl2nrduHt
         m9dgjQHEfGNx5G2bo3xYxKuebaXv0qikHH2628d+a/ZekVcErOgOsbwvj3tM71cS1yrN
         wZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685687135; x=1688279135;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58IFbC3rmymPwKUDuCiKppnQO9rXalByrp299fjIUgI=;
        b=WoO7GoE2WG1iXiruMrYetUtWWYeuxqVUeieG6ERYtpVB6Fx01HcYS8CMZkOWTreoyB
         eiTwgKcmC7QmLhmyA1JdBnqL3p6GbJyqXwQUos8RfrNNqE/lU1XLBf27Sp8mtYjkRRGD
         06F1KncloLnp+wygEdFXG7TfvrSHQJvdI4zhdkRNjUwnT/Gb77sw6CMNhvMGwm4/gPKo
         tRCQ81w5ks0DxyzZHXgx6EYErhccBS1pwGe1uMbDYVRCXLaFdceAZBfEoexh0vSZiXHG
         ArVaOcrw6G/pDoDcMvxcGEyx68/KTSGNtoZsvE9EbeW/PAmh/Aguqh9cLiXjK9UIR8af
         8ZSg==
X-Gm-Message-State: AC+VfDzg2YhZrBoyRK5mcFEcJP9wNPVWymlFVApeUXntCjY8UB9vUCDG
	z+KXmXVs/bXmIy2BU9vKzQEcpw==
X-Google-Smtp-Source: ACHHUZ7Dz5svt06tw7VP0rFLJ2p16Ivfru7W5kxXVEovFpZzm03uv4pBzr7nvIQo+juncjgCJSHI/A==
X-Received: by 2002:a05:6000:cc:b0:30a:dd26:63cd with SMTP id q12-20020a05600000cc00b0030add2663cdmr4318792wrx.5.1685687135259;
        Thu, 01 Jun 2023 23:25:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jun 2023 08:25:34 +0200
Message-Id: <CT1Y7URMMDGV.33DMUXYONLKUT@fedora>
Subject: Re: [PATCH V3 3/3] libxl: arm: Add grant_usage parameter for virtio
 devices
Cc: "Vincent Guittot" <vincent.guittot@linaro.org>,
 <stratos-dev@op-lists.linaro.org>, =?utf-8?q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "Mathieu Poirier" <mathieu.poirier@linaro.com>,
 "Oleksandr Tyshchenko" <olekstysh@gmail.com>
To: "Viresh Kumar" <viresh.kumar@linaro.org>, <xen-devel@lists.xen.org>,
 "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>,
 "Anthony PERARD" <anthony.perard@citrix.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.14.0
References: <cover.1685684586.git.viresh.kumar@linaro.org>
 <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
In-Reply-To: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>

> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index 0a203d22321f..bf846dca8ec0 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1792,6 +1792,9 @@ func (x *DeviceVirtio) fromC(xc *C.libxl_device_vir=
tio) error {
>  x.BackendDomname =3D C.GoString(xc.backend_domname)
>  x.Type =3D C.GoString(xc._type)
>  x.Transport =3D VirtioTransport(xc.transport)
> +if err :=3D x.GrantUsage.fromC(&xc.grant_usage);err !=3D nil {

NITPICK: space after ; seems missing.

> +return fmt.Errorf("converting field GrantUsage: %v", err)
> +}
>  x.Devid =3D Devid(xc.devid)
>  x.Irq =3D uint32(xc.irq)
>  x.Base =3D uint64(xc.base)
> @@ -1809,6 +1812,9 @@ xc.backend_domname =3D C.CString(x.BackendDomname)}
>  if x.Type !=3D "" {
>  xc._type =3D C.CString(x.Type)}
>  xc.transport =3D C.libxl_virtio_transport(x.Transport)
> +if err :=3D x.GrantUsage.toC(&xc.grant_usage); err !=3D nil {

Here it exists.

- Erik

