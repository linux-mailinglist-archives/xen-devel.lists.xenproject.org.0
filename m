Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D56CBD9C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 13:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515671.798791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7VW-00012y-By; Tue, 28 Mar 2023 11:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515671.798791; Tue, 28 Mar 2023 11:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7VW-00010V-8I; Tue, 28 Mar 2023 11:28:54 +0000
Received: by outflank-mailman (input) for mailman id 515671;
 Tue, 28 Mar 2023 11:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbbH=7U=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1ph7VU-00010O-TC
 for xen-devel@lists.xen.org; Tue, 28 Mar 2023 11:28:52 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7532aff-cd5b-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 13:28:52 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id u1so6705567wmn.5
 for <xen-devel@lists.xen.org>; Tue, 28 Mar 2023 04:28:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003edef091b17sm16896279wmr.37.2023.03.28.04.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 04:28:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5E1A1FFB7;
 Tue, 28 Mar 2023 12:28:50 +0100 (BST)
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
X-Inumbo-ID: b7532aff-cd5b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680002931;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb0DTSv9wEHNLZijpIORbSppIJNmyE3YOU6O+WGux0E=;
        b=h2z8xiA4BAvpHt8YCGoGagfxlAgNHvIX/uZXc5kpXiDtN5Z+d8vGnpc25lcrtP84yK
         H62NA4mSkvxVywzE2GUXVDmmKyBm8XCXn4GUXzftjKCATz4uj5s8G2vOgH/PKrmZDQPP
         HnpmRcpGILgpwbHDItUujilSlsmBNhlwy0nAk1KFndHLd8eHmp+CYAFR87A1Ph3C9oNm
         pGYWmTgO7EHdAWvXAxw5xIGfN5SLN/nzw0WIhE9KfGAGbm3GB5PXZQYp1TFSym+Cq9q0
         a9vJ9ZuX8fEMdxRKoBcWk8fOlI+q2BpCsbZ/WpzkbVJEvPqPYupyKyrjxFfjtBFpUcHJ
         8qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680002931;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vb0DTSv9wEHNLZijpIORbSppIJNmyE3YOU6O+WGux0E=;
        b=upKy9fzRXyRi51W6t2MCbWnU/fN0XZQvDb+Swzyq3qaa20YyURgfFsaTTCxOnOvtGu
         BWkxbSYfoiFN9HZZ3+wIWAzkbLmVeUxy9+jT1QwW3MNVf5RaGa9YiUhjicg7ibV0XRvz
         xS+QhPoxxJZeGDHSriRskTPtVdxVfIQbqUZYedao++QVkRjxcYwAAlqj+QLMvi6xY4Sc
         uZ+IaYcwUht56gfaSNGNwFr77/kqX+B5OBe6XHtebzJAdF1RVKuEHsIzpE9GD/xQ6CSq
         Fz2bNIEYYW9dzJzHhGrQqEIFP35ElX9R9RJSGdkDFdUJ8BxiFDR6vfjStAxN1QrTkSNj
         wHFA==
X-Gm-Message-State: AO0yUKUd8HKPxyvYCU6R/RQfzwPb12jFyYxu2zrzehcg4/7gt8RuuQCY
	YLAbu6k2hjnwLrtVe213EVkcXQ==
X-Google-Smtp-Source: AK7set9dTJkMQYlZNEtMnnUsOG7J832VNvyYYZs/1b3NcBIGkUnLhqbfE5332XP0aXA1RG5zIZ9LYw==
X-Received: by 2002:a7b:ce16:0:b0:3ed:9b20:c7c1 with SMTP id m22-20020a7bce16000000b003ed9b20c7c1mr10702075wmc.20.1680002931595;
        Tue, 28 Mar 2023 04:28:51 -0700 (PDT)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Liu Jiang
 <gerry@linux.alibaba.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 2/2] docs: vhost-user: Add Xen specific memory
 mapping support
Date: Tue, 28 Mar 2023 12:28:45 +0100
In-reply-to: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
Message-ID: <87wn31qfm5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Viresh Kumar <viresh.kumar@linaro.org> writes:

> The current model of memory mapping at the back-end works fine where a
> standard call to mmap() (for the respective file descriptor) is enough
> before the front-end can start accessing the guest memory.
>
> There are other complex cases though where the back-end needs more
> information and simple mmap() isn't enough. For example Xen, a type-1
> hypervisor, currently supports memory mapping via two different methods,
> foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
> both these cases, the back-end needs to call mmap() and ioctl(), with
> extra information like the Xen domain-id of the guest whose memory we
> are trying to map.
>
> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
> the back-end know about the additional memory mapping requirements.
> When this feature is negotiated, the front-end will send the additional
> information within the memory regions themselves.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

