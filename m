Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E668420A2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:07:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673281.1047604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUl1R-0001WR-OO; Tue, 30 Jan 2024 10:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673281.1047604; Tue, 30 Jan 2024 10:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUl1R-0001Ur-Li; Tue, 30 Jan 2024 10:07:17 +0000
Received: by outflank-mailman (input) for mailman id 673281;
 Tue, 30 Jan 2024 10:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjb=JI=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rUl1R-0001SN-2f
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:07:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f26942-bf57-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 11:07:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e8fec0968so44760625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:07:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c510400b0040ef7186b7esm5407320wms.29.2024.01.30.02.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:07:14 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6D6A85F9D3;
 Tue, 30 Jan 2024 10:07:14 +0000 (GMT)
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
X-Inumbo-ID: 57f26942-bf57-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706609235; x=1707214035; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGjj4t6Tt0bfPXKL4DzHKstkGoaCWrviJvk5cF8v3JI=;
        b=M3cnyafSGZwZJLf9egoxnK7/34fuOIn7n3fIOdSx/w+gLkdcTnrnSBbT5VRzVIJTCK
         KuTp6nens6g0j4RXNvicv4GvaYY7YsR4YCaShDB4CJt4Qx3wPu2SbuEfY+xcAAs0B8cG
         KTac1qcCF701kOeI9hmKD8b2k2GocuijJuF6HuismSrJJzizARbsXcX2o8l8hps2/dpn
         qwbKw4uLhqC0urXwWf8vChetH0tFbbCRJivoV4kh5KYN4rbgH77jeGSZGS5ntyNkAmuM
         OZbqP57D3ts03Wmv2SG2B1cSzd2K0ch0eDgrgHiuSDqMOV55/i5svhEVQ3BJOfnUxO16
         ecBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706609235; x=1707214035;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGjj4t6Tt0bfPXKL4DzHKstkGoaCWrviJvk5cF8v3JI=;
        b=vJ8DkfqHCPN5hKxAyLUPQt2+4KkMLDOAY7KO27xGnzcY1UBxSUBu428z3OCpPs0V9e
         mWSVDptCRzM1wvN2xHnHgd151+pIEHjBVbaSDqkQ8IfaDbd7DlygTf1l6NZiDW8YYZ9Q
         5nahBKHlIb/zRAQaG+FwjVMfc2xY+aANHyEhWRJarvt6JFkwabKTJyEM1RnbkLj+aShg
         nPna23Uk3ASAgzX7gnR98zKP4EV9pd7fxwaRQyQeM3SG70FqewHxdAmqmOcAzFXGtuh4
         8116zntOCPWajBEWxrluzkCtJgvblpehd7+Fmf5DwDhEef8a+Y0+QNLDwVl+H70jsoQN
         Tyuw==
X-Gm-Message-State: AOJu0Yxofz+KnD1Yp2y8tR4Fm7k3V3GgAMNdN3cq6LI3zc6Kq9dvyMP8
	J+luM3122dIbKjpBpYT4/BS1USfDFbndow7KQ/8R1Cae8LgfTBCWb6vczVugkPg=
X-Google-Smtp-Source: AGHT+IE7QsQJ7kkSQIjk2V0TGDwvEWJaRk+GZiIrwssmHhuaqa3cvXIIzBIMhev6goWvmAyhrCETMg==
X-Received: by 2002:a05:600c:458d:b0:40e:fb90:207 with SMTP id r13-20020a05600c458d00b0040efb900207mr2695218wmo.25.1706609235041;
        Tue, 30 Jan 2024 02:07:15 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  peter.maydell@linaro.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 5/6] hw/xen/xen-hvm-common.c: convert DPRINTF to
 tracepoints
In-Reply-To: <b000ab73022dfeb7a7ab0ee8fd0f41fb208adaf0.1706544115.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Mon, 29 Jan 2024 18:09:41 +0200")
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
	<b000ab73022dfeb7a7ab0ee8fd0f41fb208adaf0.1706544115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 10:07:14 +0000
Message-ID: <875xzbqgml.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Tracing DPRINTFs to stderr might not be desired. A developer that relies
> on tracepoints should be able to opt-in to each tracepoint and rely on
> QEMU's log redirection, instead of stderr by default.
>
> This commit converts DPRINTFs in this file that are used for tracing
> into tracepoints.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

