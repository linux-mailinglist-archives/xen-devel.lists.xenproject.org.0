Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8473A75F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553868.864683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOGM-0005cn-6P; Thu, 22 Jun 2023 17:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553868.864683; Thu, 22 Jun 2023 17:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOGM-0005Zc-3O; Thu, 22 Jun 2023 17:38:30 +0000
Received: by outflank-mailman (input) for mailman id 553868;
 Thu, 22 Jun 2023 17:38:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euOG=CK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qCOGL-0005ZV-2O
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:38:29 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98c5a82e-1123-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 19:38:28 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-989d03eae11so331604966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:38:28 -0700 (PDT)
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
X-Inumbo-ID: 98c5a82e-1123-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687455507; x=1690047507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xp+vt1ovAZICS1UzaUwHNLj8+Q77UspV0UwBQhdIcvc=;
        b=nCb/3K/fhDJ4lzQgMUNUVETA77hvdy9DvEwuuqU51GkzON19sAsIz+Cz7Czmpfd/YA
         VhPRb3so2FKX9Lf0mX0gBG/Z07n3wo1a27h+S/XDIkYXgweJ6HZ1grJdcWtvMDhEILDL
         /AZfaPsO0WJIgWhAwetB8oUNzF/A57Toaq/fOefbtCtlHVfnPnCtKdPEbVcJVf4cC42s
         okWopVUYRGOzA/QlkelhbdLranCb+ZcVcCSAeWsWA557GHqhh2WFvwbdd0h28EFohJyf
         A1hP3klpuxoL5IqN5t5xGd5EWpVqXcFUh831842dCqaxAsWiXEnfZdc9QaaUcax5IpEr
         08qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687455507; x=1690047507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xp+vt1ovAZICS1UzaUwHNLj8+Q77UspV0UwBQhdIcvc=;
        b=Z/mJIZc2inpoo7dpiUUcv+nbeJKLxrT04eEisbzrqiUlQEzR+K6Egrgud30ajxRZst
         a9tR5DN2doy8Xwmb7xg0Bnbi9JGy/eb/wjKQthTyLEMq+b6M6nXA7Pc4LGv4Og3Bd2o2
         zZKsNxY3/gBtZykXeACYoKyFpwukZ+LsK3s5WiuiRO4adm8H3G/Say4vsxR7oqM3o9MF
         9K3NeUaRy6j1DkQtHt+cKl9Wo6lZJ/n+JnSu9mAbGutDDN2tzjeHrre9lQfvJg74Fucm
         P/7s9uhBjmlzkYKCwW0MClAXW80i2wp/VFsSTCmerJSYhgtRJuLPv3Az8/vWvJEaj0Hi
         aMQA==
X-Gm-Message-State: AC+VfDxL+V0pTxjYsneQbZylxaBckXmFyPjVKe0oL8mxqLjjh2T5xGVc
	ZjYjmumkD4g8Kkl4FNfP4PD4sZE0zonYM9BqchQ=
X-Google-Smtp-Source: ACHHUZ56yCqVx50z6ZU+TUUha+UjdIOcmJvWBJb6n1OqtnY3/ru4rjDupy1/HOxtFE0MNzwwnTxJYf24RKIQD0bgiaE=
X-Received: by 2002:a17:907:1c96:b0:977:cad5:1580 with SMTP id
 nb22-20020a1709071c9600b00977cad51580mr20349056ejc.40.1687455507315; Thu, 22
 Jun 2023 10:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230622153005.31604-1-anthony.perard@citrix.com>
In-Reply-To: <20230622153005.31604-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 22 Jun 2023 13:38:14 -0400
Message-ID: <CAKf6xptXkB7b1uOoe5cuVLLE5y3QAZL_R82NDBJ+yAtaLipsUA@mail.gmail.com>
Subject: Re: [XEN PATCH v2 0/5] build: reduce number of $(shell) execution on
 make 4.4
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Connor Davis <connojdavis@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bob Eshleman <bobbyeshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 11:31=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build=
-exported-shell-command-value-v2
>
> v2:
> - new patches removing TARGET_SUBARCH and TARGET_ARCH.
> - style change in first patch

For the v2 series:
Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

