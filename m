Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F126D71FA1F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 08:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542952.847429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yIx-0004QW-RI; Fri, 02 Jun 2023 06:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542952.847429; Fri, 02 Jun 2023 06:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yIx-0004Nx-Nt; Fri, 02 Jun 2023 06:30:31 +0000
Received: by outflank-mailman (input) for mailman id 542952;
 Fri, 02 Jun 2023 06:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dv8B=BW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1q4yIw-0004Nh-54
 for xen-devel@lists.xen.org; Fri, 02 Jun 2023 06:30:30 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6934f8d-010e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 08:30:28 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b0236ee816so13752875ad.1
 for <xen-devel@lists.xen.org>; Thu, 01 Jun 2023 23:30:28 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 n11-20020a170902e54b00b001aae909cfbbsm482144plf.119.2023.06.01.23.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 23:30:26 -0700 (PDT)
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
X-Inumbo-ID: f6934f8d-010e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685687426; x=1688279426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF0pyhlfZOEeF2DRc3+vWvjGlAlybF3vak/OvMaBMKc=;
        b=QaGp+6nrJpmVkHmgc+a5VaWRWGvCSPzcO6R4dWdFMxTFdLwPpmT7rB9jpc0tSHBiI2
         PIwFk7uxsQYKR9i3oFUDdFK4NJhD+gUNWraETvioK1yC233qeAVcT7NLl5RgfUwLs+2j
         u0737oBW4EkDZ9NJzoQV5VuRAsbg8HF6+7oDEfl7aBlewliXh2DVbzn7E0IdPF1jkhfa
         a5MMnHQ+n+41RLiQo8JIqK6E7E3xVEcJ4juNO5uuqv1XJVG6IJZafNeExkHLHArnNBbn
         50tiYg54Qw5qCXLWzZGpFY7UgEIf5AQnYzFG6bBKFN3bDfcy7Bk9Pv5WmzGDfCIYBYtZ
         EYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685687426; x=1688279426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF0pyhlfZOEeF2DRc3+vWvjGlAlybF3vak/OvMaBMKc=;
        b=b9qi1AXEBl35W/N5lRKU1jrlu8eNAGuipbenp9WVZoDvA0R4UfUzNUrm5FLgeQPlIL
         DdEXUJVyEU8ZcJqcKZ2fly/D8ZSJzHKfHrWjvGXUY6OoSQVjhpiSCW9LfaL6tKCHfvDj
         LPNj+7XNeDAhi8yr9ht/74V9UEIT9W34lo06SUQJwcoOyBkfsNVPhVNAPQhm3oysAYKy
         WzNliH4RltYmRYXs3maMInPntLdarxr5BfqeJsGF+kZFvoQ9UNLMzF4+zX49Akg8K/Eq
         +VlsAeF3DWtQNDR8zeeNvdNtKlobohhf+JeiDkzNPKgzgI5RT2LSvioHPtOtUS9suErk
         clOw==
X-Gm-Message-State: AC+VfDw8odlL6yHct9x5l8nxnbZDl+D7RABDmj9dCiP55mjzDG2btnxE
	PtIyUO9nxvE8cRR06jSUsisUvQ==
X-Google-Smtp-Source: ACHHUZ63LNzRwcO2abRuiOA8QrVpY3t9/W4uAlc9/tcNlz7AcmWdx6D3cmEj8dQw/VJ4YMEqw1RnVw==
X-Received: by 2002:a17:903:230e:b0:1b0:4c6c:716 with SMTP id d14-20020a170903230e00b001b04c6c0716mr1820086plh.4.1685687426668;
        Thu, 01 Jun 2023 23:30:26 -0700 (PDT)
Date: Fri, 2 Jun 2023 12:00:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V3 3/3] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <20230602063024.mku6gmztqt7sps4t@vireshk-i7>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
 <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
 <CT1Y7URMMDGV.33DMUXYONLKUT@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CT1Y7URMMDGV.33DMUXYONLKUT@fedora>

On 02-06-23, 08:25, Erik Schilling wrote:
> > diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> > index 0a203d22321f..bf846dca8ec0 100644
> > --- a/tools/golang/xenlight/helpers.gen.go
> > +++ b/tools/golang/xenlight/helpers.gen.go
> > @@ -1792,6 +1792,9 @@ func (x *DeviceVirtio) fromC(xc *C.libxl_device_virtio) error {
> >  x.BackendDomname = C.GoString(xc.backend_domname)
> >  x.Type = C.GoString(xc._type)
> >  x.Transport = VirtioTransport(xc.transport)
> > +if err := x.GrantUsage.fromC(&xc.grant_usage);err != nil {
> 
> NITPICK: space after ; seems missing.

This is an auto-generated file, perhaps the script has a bug :)

-- 
viresh

