Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B04A1B64D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 13:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876767.1287123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbJ8q-0001NG-GS; Fri, 24 Jan 2025 12:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876767.1287123; Fri, 24 Jan 2025 12:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbJ8q-0001LQ-DR; Fri, 24 Jan 2025 12:50:32 +0000
Received: by outflank-mailman (input) for mailman id 876767;
 Fri, 24 Jan 2025 12:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEkt=UQ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1tbJ8p-0001LK-Eg
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 12:50:31 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb01e4af-da51-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 13:50:30 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5dbfab8a2b0so3954884a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 04:50:30 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d905asm1135005a12.79.2025.01.24.04.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:50:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2C1185F8D0;
 Fri, 24 Jan 2025 12:50:28 +0000 (GMT)
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
X-Inumbo-ID: cb01e4af-da51-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737723030; x=1738327830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB2Veo0ifNebcRcOL1ytt2gp+aiTiH3Sf5xY6qaSWgQ=;
        b=hteSdQFHbkx/KaSis005MSh1PJMc7PZd4hs+RqmLN9/JY7orduJyueQQugva8kI1ga
         2vjuwuEhVZcRNSuoxD9+oo35h7LboJmloaCGUCtkhcmaaTwzTlXlWyqiVY6Wh4uoC2pa
         MIVKZWRDd2SR9S5zjIJLx8xMuxqjRzT1E1EZNYfYaQBpU1Oj8901H0QiA/DHCcfiuG/+
         0Hp0I6thTFM6R5H60DdO2m1xjtIgA/09J7LprG8Kc38E/B1/kiFls7wU2WnLnj8S15Z/
         bml62UryxdnqVFSme7JiiPvyQ0iy0dr5ofmRw0btJtEO9JVTD4VPJbQFcR0/MxQ+GI6h
         NUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723030; x=1738327830;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AB2Veo0ifNebcRcOL1ytt2gp+aiTiH3Sf5xY6qaSWgQ=;
        b=QVfH0/i0PrZzzlbjKwyoQhDJTqL6Mhv6YhHmMuz48xUQTWFzAbYj6Z4/RRnJu75r43
         FViiB+PRHZdzXLeApQLkGYiZhneGipeQAF+0XVxHZMWyCnqR8lrTNCS0YfG76WMeVPxD
         Mx3CScFEQyiHURTPvdh0r2VhgO9pkc7ODIPksiwzmyG6pcQUSP7YrmbjA1FqGYdtNJ9p
         L6X1cc5FvIsQZwCxa16Zuh99gLYuQVN8PAvSAgcKqjCrRJnRAkNpRYZuqfIqSmEMUPAX
         31tKTNMQ+0qAR08yEGuN+wNBQT+0yib8OpTBtTogz10Ji2YAaSW7O0ysawjrhXgTXbI/
         jGyw==
X-Forwarded-Encrypted: i=1; AJvYcCWrdn7ETFmSuajYDFKiApbSve6hxDQFMdgfTSWXWFfY1bB4zqK9u2IucT2k7VdysU7dQ3J+EFpcHmU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywpkv037ZtRlsdY6N8IY61P7dwGq1l3JvtTlJ2uaUu8QGJEigPL
	XLcd/dSbcya/YojRUnasrkIJrCWMw7J22BCgiEM+GR3YYdYkgomY7qXyuNwPDCQ=
X-Gm-Gg: ASbGncsHfd1BLvvQSYstTjxSFp+PEmPgl4q/F4Md1qKrpMgolQXfWsY8nm+DPgYbIti
	GUyllPUpg/nrP4xbPhwDngR3oamuQWN7EfYJGa7PXLjDzKXA6Q8GT6B9vWJiL+vWPraIjftz7Vv
	UG4g4hrNxNCpMj2MAGZDklqvJnIfTh3C41zACa8T/LkpLg4AgeruAqj41twO9Y3/rW2ZfLJrEBu
	mXJFIGdHMZ6uzvi9A+bbdTV/UfR/kpJniKTM8PqJrWklJMAVXuYGG383w/9uTrrNYTkc2+bhvMq
	n1I=
X-Google-Smtp-Source: AGHT+IHgpCErm6J9FACp/DlMJmoU6m0AQvWBem6CobohmkoE2PSx9F3d28v8z9FWDQeB/0B9Gf2dDQ==
X-Received: by 2002:a05:6402:4403:b0:5da:b47:1092 with SMTP id 4fb4d7f45d1cf-5db7d2f9b01mr25474703a12.10.1737723030120;
        Fri, 24 Jan 2025 04:50:30 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  Igor Mammedov
 <imammedo@redhat.com>,  kvm@vger.kernel.org,  qemu-ppc@nongnu.org,
  qemu-riscv@nongnu.org,  David Hildenbrand <david@redhat.com>,
  qemu-s390x@nongnu.org,  xen-devel@lists.xenproject.org,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
In-Reply-To: <20250123234415.59850-4-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 24 Jan 2025 00:43:57
 +0100")
References: <20250123234415.59850-1-philmd@linaro.org>
	<20250123234415.59850-4-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 24 Jan 2025 12:50:28 +0000
Message-ID: <878qr0jrzf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Use the tcg_enabled() check so the compiler can elide
> the call when TCG isn't available, allowing to remove
> the tb_flush() stub.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

