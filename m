Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102516CBD8B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 13:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515668.798780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7U0-0000VU-0I; Tue, 28 Mar 2023 11:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515668.798780; Tue, 28 Mar 2023 11:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph7Tz-0000TE-Tf; Tue, 28 Mar 2023 11:27:19 +0000
Received: by outflank-mailman (input) for mailman id 515668;
 Tue, 28 Mar 2023 11:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbbH=7U=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1ph7Tx-0000T8-Oj
 for xen-devel@lists.xen.org; Tue, 28 Mar 2023 11:27:17 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dbe7cd2-cd5b-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 13:27:16 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so3736347wms.5
 for <xen-devel@lists.xen.org>; Tue, 28 Mar 2023 04:27:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b002dfca33ba36sm5932061wru.8.2023.03.28.04.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 04:27:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4841F1FFB7;
 Tue, 28 Mar 2023 12:27:14 +0100 (BST)
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
X-Inumbo-ID: 7dbe7cd2-cd5b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680002835;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmLVWRHv9Mce/1Gxtf/hiKt4uOFJk025+sXNL5BqVhI=;
        b=YbTyLOPmPySapMP2QBhlVXPUCcCkd6KpTjdJOInijHZXQvUz9MLJDoti6nyk+3EuYF
         iMAaopafZHrwY7fXxRGIjeIOXQUJEfuLOjdioqxSS07SI/yzrlw8OPLON59sdXBlAl24
         VJeDRAxmEfB4fgWLOqI+ct4Cu2eQ9d08cB3Yvdc9bNrhy/pBly83H6Gtj8bCUmdfU7LR
         pvuFwYCiBc2dJpeAXZwdoowyWSJsmZ6Fir9a6c7JOTQuEl0NcXUKo1Ch0ieJGcK++fu+
         jpflbace6M0fFT8n+Rs1pd3CIMF+chP0c0Cy9rXxbHFTy1j9QDUghSZOZmw8APT9Y/SO
         FKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680002835;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mmLVWRHv9Mce/1Gxtf/hiKt4uOFJk025+sXNL5BqVhI=;
        b=i7YviKzA1CTj+n0ThlRqbBfK93tK2qq8INpc1raHEwYYiR8FbzxxZlrnxJgNYeBOep
         tM2wOmhynpL7htLHGJrOl+ZQ89JP+UcZ7HUcuiLmbRNTC9ByVQblqOACKej/x0ljRROD
         XDj6dkFRBJCgC9LJBBiOLyto0P0XxTDVZ1Z2DU/aT2x/xHR18syAuWQjNvEMkuJqTskL
         H4UL4AcUNjpk3Pkelg+BhJ8R0DKo+2yr3mJWcdyjLx0/lV7/oz/uudNVXU6q0gbOPf2x
         u1tv8/DaZcH8PU5CKP5iwlz8qd/p0zQ2Y9w14RaMHrRFXIEYEkehySrI3c5bluUDbUmW
         Qbjw==
X-Gm-Message-State: AO0yUKU/fCmcZ5NNvASnCM3xeKn8APm1Qx5QJPZ8Nlp+9JP11uYeI7E0
	gp76huZItQyVd0/VJ3UnLfSR8w==
X-Google-Smtp-Source: AK7set/rKuJeCLEfn8iMwesAs+RUH7DbxCveNvjd+59wlqYXnKCIHEaAUVqNtzWdJIjs2hdckl2YNw==
X-Received: by 2002:a7b:cd88:0:b0:3ee:7061:1bdd with SMTP id y8-20020a7bcd88000000b003ee70611bddmr11925479wmj.4.1680002834958;
        Tue, 28 Mar 2023 04:27:14 -0700 (PDT)
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
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
Subject: Re: [PATCH V3 1/2] docs: vhost-user: Define memory region separately
Date: Tue, 28 Mar 2023 12:27:09 +0100
In-reply-to: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
Message-ID: <871ql9ru99.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Viresh Kumar <viresh.kumar@linaro.org> writes:

> The same layout is defined twice, once in "single memory region
> description" and then in "memory regions description".
>
> Separate out details of memory region from these two and reuse the same
> definition later on.
>
> While at it, also rename "memory regions description" to "multiple
> memory regions description", to avoid potential confusion around similar
> names. And define single region before multiple ones.
>
> This is just a documentation optimization, the protocol remains the same.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

