Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3160E81E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 21:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430736.682750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onleq-0006Zi-Q6; Wed, 26 Oct 2022 19:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430736.682750; Wed, 26 Oct 2022 19:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onleq-0006Wv-NK; Wed, 26 Oct 2022 19:01:44 +0000
Received: by outflank-mailman (input) for mailman id 430736;
 Wed, 26 Oct 2022 19:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Su4L=23=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onleo-0006Wp-Qz
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 19:01:42 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0568b5c-5560-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 21:01:41 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d389c41so1321245wma.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 12:01:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfaa05000000b002366f9bd717sm7165399wrd.45.2022.10.26.12.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:01:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B0631FFB7;
 Wed, 26 Oct 2022 20:01:40 +0100 (BST)
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
X-Inumbo-ID: a0568b5c-5560-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpzp4aOdkkISx5ILcz2RiZRzgoDoLjsOb8Q83qDZTuo=;
        b=g43jYRFfdAkmpnCeBkFk26McMgzkKS7nAuOKg/fO6paxLU22nK0yZx/x6sIsTKP2QG
         ceZMcomWlZ4Qqdr9tiRbWw08c6rxc3Uh23la9I7wr2Cn4es2aNmVO+nSZfimEGiHMSQ1
         nPgRblPQSj3/6Z3O5RuGEa+vbjbKHu1Kd4W00n9dX9NZ4V+lehuF+YhnPI9xJ7F0iF+L
         ayRMtgchppJNjvmi537QMxKjBNlzUdpvWU+NpY9hqVIG6lQyjJLtw3I7aUhTpux+3ywF
         6pNDyWCE8JgsFfOOVA2x6R6TRIqT+Pnb4ovKdxAN9TAaI8XyINmrWtrAx4VU9jWcKhf6
         trXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zpzp4aOdkkISx5ILcz2RiZRzgoDoLjsOb8Q83qDZTuo=;
        b=CKTbJ6U2JcwTXNsog6nEtIUjmi5SoomwEh/19zTVRZKtf71sV8grk+CXrHD5SWE6d8
         A2sdUgJFPQbmKLtHxer1LHBonl2g5fn+pY2rOAUbKDpzzm++mIdoAi0oz8oYDtTfH9Ze
         xXMnn9JOzi+XKGwEbgrPJ/m4b5tDfB7/eGnPK+TQ9It2AQplMOz7FqcDJhVGrhDIIE2y
         MX3HcnR2Qp9R3ZBrNXHy3w5w1l0OpsjUOMvp6KcJl31gYFr37TAf6Wzg9f+kz+rXYTHQ
         NemCvL12TIC48bt8lv48LB/zcgEYFaK8KsgtKXhohrq3IkzLSUXqvXfqUaIk1Egw0j+Y
         JMsw==
X-Gm-Message-State: ACrzQf0b03zui5T5zhU/MUPjZsZzMCGTNGqSjS0i82OHvpXqev7lihMA
	iw+GHp7XzuXOI7nQrDOm6niNrw==
X-Google-Smtp-Source: AMsMyM6aXssRV9cCopFQKhvSSRLqDTri2SN4+sODUiVIOnw54XkFIoRxASG0kxB53TgxohdplKz2Bw==
X-Received: by 2002:a05:600c:4ec6:b0:3c6:c469:d295 with SMTP id g6-20020a05600c4ec600b003c6c469d295mr3555807wmq.117.1666810900982;
        Wed, 26 Oct 2022 12:01:40 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-2-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
  Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 01/12] hw/xen: Correct build config for xen_pt_stub
Date: Wed, 26 Oct 2022 20:01:35 +0100
In-reply-to: <20221015050750.4185-2-vikram.garhwal@amd.com>
Message-ID: <871qqu4dez.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Build fails when have_xen_pci_passthrough is disabled. This is because of
> incorrect build configuration for xen_pt_stub.c.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

