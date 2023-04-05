Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC86D7E37
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 15:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518552.805237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3e2-00014c-Q6; Wed, 05 Apr 2023 13:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518552.805237; Wed, 05 Apr 2023 13:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk3e2-00012I-Mn; Wed, 05 Apr 2023 13:57:50 +0000
Received: by outflank-mailman (input) for mailman id 518552;
 Wed, 05 Apr 2023 13:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv/O=74=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pk3e1-0000PU-4N
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 13:57:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8f46431-d3b9-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 15:57:48 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so18489378wmq.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 06:57:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a7bc3cc000000b003ee42696acesm2281079wmj.16.2023.04.05.06.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:57:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E0D531FFB7;
 Wed,  5 Apr 2023 14:57:46 +0100 (BST)
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
X-Inumbo-ID: d8f46431-d3b9-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680703067;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NetuLM1YNy+KIDJo2AuRwk1MQSAg78qWWaqODIp3uM=;
        b=STRahmuuUI8KQBpKkK6/PybRdBaAfHp1W+GWkva9949DvsniQ47A/YBs4/K6otGmIQ
         A7oHq5QZml8oDY9OkaJYXNIDicXknAlahrTy0t885QBs0Lt5BGqY/X1A5hzP+3cG4jyG
         hqExCPaaG4YfjYDF2Lvk4KZCMdUASYLq+3mofYtWUXbekaC+KANqj/gZ2+SaWy51z2Gx
         IK4y7wRVW/r+5NSnoD08WImnjxGuzAjZRzafDn3YXT4lhfyMCg0hk6YePHsX9rGEZ0yO
         5bbeqBjbAXiB4zUJZFVItGQ8ztZK7Dl/a/IVEwL731YIWMclVzlyNQOD4tFezaYuIqhf
         O8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680703067;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7NetuLM1YNy+KIDJo2AuRwk1MQSAg78qWWaqODIp3uM=;
        b=1zijq7juwmx3MMCqfyV/5sETlfwybfychoJRxCHE3bQNaUuJac3qIvr1hUIuV4bNN4
         luYyvIX76KaC6Fb2IJ49yOOh1lStzs6nOZxOngo6vZD4Z/f/XvfF6v5LgciIwISdkjLj
         X3Z06k8ZDLBkzHWCG++lXAiWQ62Ul78CS+S+uCQXSfgOuSMT2BaXU4XPT5Y4Kl97ErG7
         nEJsVrkP8Kd5tVu8+RKIqiTsMuYt/vX4njlS2oSzSfynbCX1VlR6UeChanxex0RLF2H0
         8kyq1/637PdJZCLbMxsMofZaHhVz+Sbw3M6DLh6k1Pvxml8rczCRdL/nQHNzAOSSxx/B
         Uesw==
X-Gm-Message-State: AAQBX9flo6vaYCRLpeTPih80o29MQvwCCIUlOSGnmnX/DDPY2lJMpSwO
	mM2hNQljH9D05932O7RgvwHB+Q==
X-Google-Smtp-Source: AKy350amvRA+LsVe3Qrc1qOw8K7TS5SLWtfzWAgqhDokCIDVgX46fW59a21dzTrAyh+jdrLxrPgnHA==
X-Received: by 2002:a1c:e916:0:b0:3f0:4f83:22f4 with SMTP id q22-20020a1ce916000000b003f04f8322f4mr4568690wmc.20.1680703067664;
        Wed, 05 Apr 2023 06:57:47 -0700 (PDT)
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-10-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org, Reinoud Zandijk
 <reinoud@netbsd.org>
Subject: Re: [PATCH 09/14] accel: Allocate NVMM vCPU using g_try_FOO()
Date: Wed, 05 Apr 2023 14:55:41 +0100
In-reply-to: <20230405101811.76663-10-philmd@linaro.org>
Message-ID: <874jpul9d1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> g_malloc0() can not fail. Use g_try_malloc0() instead.
>
> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#g=
lib-Memory-Allocation.description
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/nvmm/nvmm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 3c7bdd560f..45fd318d23 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
>          }
>      }
>=20=20
> -    qcpu =3D g_malloc0(sizeof(*qcpu));
> +    qcpu =3D g_try_malloc0(sizeof(*qcpu));
>      if (qcpu =3D=3D NULL) {
>          error_report("NVMM: Failed to allocate VCPU context.");
>          return -ENOMEM;

Why - if we fail to allocate the vCPU context its game over anyway any
established QEMU practice is its ok to assert fail on a malloc when
there isn't enough memory. IOW keep the g_malloc0 and remove the error
handling case.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

