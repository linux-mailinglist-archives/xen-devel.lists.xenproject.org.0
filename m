Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84798257E7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 17:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662242.1032261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLmts-0004LZ-Gn; Fri, 05 Jan 2024 16:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662242.1032261; Fri, 05 Jan 2024 16:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLmts-0004Jy-EE; Fri, 05 Jan 2024 16:18:24 +0000
Received: by outflank-mailman (input) for mailman id 662242;
 Fri, 05 Jan 2024 16:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7fs=IP=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rLmtr-0004Js-Nz
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 16:18:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b56173a-abe6-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 17:18:21 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so17734805e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 08:18:21 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c1d0800b0040d6e07a147sm2023004wms.23.2024.01.05.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 08:18:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 805485F933;
 Fri,  5 Jan 2024 16:18:20 +0000 (GMT)
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
X-Inumbo-ID: 0b56173a-abe6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704471501; x=1705076301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEiADKruN8GjNvJIGFayWYZ3vy9JdtqPKB4YiY3EGLE=;
        b=jIuIwiwKhdRhGM/Nue/IDJImRDhvRnUhjt0QXgHV47nClpq13UyaicmnTR0KOCqyio
         zxbTjvJLwFbQfVj+NpeHEePSDXla5YLKG6kAybsQVrrMKpioXndoChZODLAFguNprvle
         dPFbNFZ4xkWJO4ptpGgeIX4Sf9Ict/fiFuNNYIXx4EfVWhO/3+U0AYQ3aNnSzqEOS4cu
         7J8W5ePhOojAunXFcEXpXfYJT1xvhvrFxmJAEI79jwvO7LW9xStASDtZd8f12DYmk6/D
         6wJiT2Di5jcA2mRPn0Wav0R0dkCPw72CyPZUYmQuTU/qn9Ox7izZMcCmFF/J0KTi35Pl
         cHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704471501; x=1705076301;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SEiADKruN8GjNvJIGFayWYZ3vy9JdtqPKB4YiY3EGLE=;
        b=FATGk4XLfHX0HZUZyKLy5AAgjKLu4Uk1/bxE1fyEdYcZYFVlu92dc6TsSKmPs8CU7+
         oEOyO/lrUZsbqEwMKhT4ygun4BBqnIjYM/yA2AiNt3DsZ2z7aai3UXytKSO6M+mWL46W
         Uyko6/kll6sdthl6p4fixX1qYH+HyNe3hHvYNNuhH5J5ESGUbVr3aZFgc7e4z5fWWZeZ
         yN6hR/rNi66FvGORFEhArvhhs5lUYGF+3v7Rvp8EX54E7aX0aQCOFvauLn64ZHolwbsI
         4Bk0CeQftEIAGeB2I9yPV00Ds+tcmLPgAyPGgwvpC0cTNA5zRMZQIGf41jqKWB/moH/M
         dBow==
X-Gm-Message-State: AOJu0YymYszx4AC4OnvmZj8eprxXNh+RNvAq2xOICQhhvYZOp1I4LUvz
	HltHOpOwxRV5qOF0QTJPlL35SFzVEpS6Xg==
X-Google-Smtp-Source: AGHT+IFLOdfJJ812jifatfiC3IcTBBvRkTvL8BUTT061m8hZIOGYUty7xb39NvJ0LSVQxWL6yhDAWg==
X-Received: by 2002:a05:600c:1d95:b0:40e:3733:3a81 with SMTP id p21-20020a05600c1d9500b0040e37333a81mr655985wms.46.1704471501225;
        Fri, 05 Jan 2024 08:18:21 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Huang Rui <ray.huang@amd.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Gerd Hoffmann <kraxel@redhat.com>,  "Michael S . Tsirkin"
 <mst@redhat.com>,  "Stefano Stabellini" <sstabellini@kernel.org>,  Anthony
 PERARD <anthony.perard@citrix.com>,  Antonio Caggiano
 <quic_acaggian@quicinc.com>,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Robert Beckett <bob.beckett@collabora.com>,
  Dmitry Osipenko <dmitry.osipenko@collabora.com>,  Gert Wollny
 <gert.wollny@collabora.com>,  <qemu-devel@nongnu.org>,
  <xen-devel@lists.xenproject.org>,  Gurchetan Singh
 <gurchetansingh@chromium.org>,  <ernunes@redhat.com>,  Alyssa Ross
 <hi@alyssa.is>,  Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
  Alex Deucher
 <alexander.deucher@amd.com>,  Stefano Stabellini
 <stefano.stabellini@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  Xenia Ragiadakou <xenia.ragiadakou@amd.com>,  Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>,  "Honglei Huang"
 <honglei1.huang@amd.com>,  Julia Zhang <julia.zhang@amd.com>,  "Chen
 Jiqian" <Jiqian.Chen@amd.com>,  Antonio Caggiano
 <antonio.caggiano@collabora.com>
Subject: Re: [PATCH v6 02/11] virtio-gpu: Configure new feature flag
 context_create_with_flags for virglrenderer
In-Reply-To: <20231219075320.165227-3-ray.huang@amd.com> (Huang Rui's message
	of "Tue, 19 Dec 2023 15:53:11 +0800")
References: <20231219075320.165227-1-ray.huang@amd.com>
	<20231219075320.165227-3-ray.huang@amd.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 05 Jan 2024 16:18:20 +0000
Message-ID: <8734vbg3eb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Huang Rui <ray.huang@amd.com> writes:

> Configure a new feature flag (context_create_with_flags) for
> virglrenderer.
>
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

