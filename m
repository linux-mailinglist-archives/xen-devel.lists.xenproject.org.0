Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885C8420A8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 11:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673283.1047614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUl1q-00029H-1j; Tue, 30 Jan 2024 10:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673283.1047614; Tue, 30 Jan 2024 10:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUl1p-00025q-VH; Tue, 30 Jan 2024 10:07:41 +0000
Received: by outflank-mailman (input) for mailman id 673283;
 Tue, 30 Jan 2024 10:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjb=JI=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rUl1p-0001t3-5X
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 10:07:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66e9d310-bf57-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 11:07:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40efcb37373so7937845e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 02:07:40 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 je16-20020a05600c1f9000b0040ec66021a7sm12753644wmb.1.2024.01.30.02.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 02:07:39 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7BEC85F9D3;
 Tue, 30 Jan 2024 10:07:39 +0000 (GMT)
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
X-Inumbo-ID: 66e9d310-bf57-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706609260; x=1707214060; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrBGU+qDa/6KJNKxM+pthgM0a/T7J2ZKOG1Ii2mKor8=;
        b=n9tjdI54rP2bzCS7V9/b8u3TeBPx8pdjRpNlJrvLBFMLjixBF/SK3Balppjfe6lwSN
         kXoXwfq3Z1DNVbGW+YcbDjjis33RsFkfLZNRMX6G5MgIL7ku1TP+xBghAmFdkgeXq4hh
         Nyawh8TjqXpFe4o19Tk59Z0r3c67imC+77csL/iyXfavoRxQWJHQbs56UXCpIeVVw5wr
         sU/vFoprejP9C1rikU8G3zTWsYFgepJx2SVwhdL1SB7RARG8SqMSRhG6dZvQ+Mbackma
         uSDVIjfv6k1GCV07uOKD03f4cuus8zlL5he/76YbAbJDMols8Q1m6l+6OB+tf6alnUJZ
         Um9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706609260; x=1707214060;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrBGU+qDa/6KJNKxM+pthgM0a/T7J2ZKOG1Ii2mKor8=;
        b=So+TSA1LhqgJkHZCvA/UNWmElhFnAkWopIBhlLm4PO56EwM+VZdJuFUW1yrt/93sus
         F29mDv17+ZeW03Ry07WV0HgCI99LLSX2gnVU9/xC6RYz+ox8rl7G4Eo8kANEkKy+gIa2
         w7jrTBPgt+x7Gb5N426XdKzHxeEDjZthu7AJ7OxRHBD0KwuEJAdr3AVbjEw0zAZvoeTZ
         IfomRkKZVdaHMC22K3QBva+BIn6ydvpaPARvydVxAs/w3SvKAH6HBt0Q0XBoP2V1eTWX
         Qc0yAO3arN3S8VAqpK2dCAOHBikEZg1a12djx0S6Ea3mUSEH8G0HlH6RrVdqpiZSGQ0T
         AtIw==
X-Gm-Message-State: AOJu0YyJZIUKe73pBdqCPr8fFAWsz+YFTBTNstwUEHBH4YJFhIxY8Ike
	Q6jeXKvMA59vAIwL2YQLAUVa+PuWPHVOVuH5ygrf9O2mYlALZyr3gEFpAQmXN7g=
X-Google-Smtp-Source: AGHT+IES4a1D5D/9PcTpQY4/2BqtkiUs1Bf3okY6vJmhQUyyk2+tOC1WoIESqOxxrhdVtU+DIcQgzQ==
X-Received: by 2002:a05:600c:4f92:b0:40e:6650:b883 with SMTP id n18-20020a05600c4f9200b0040e6650b883mr6403716wmq.18.1706609260100;
        Tue, 30 Jan 2024 02:07:40 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  peter.maydell@linaro.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Paul Durrant <paul@xen.org>,
  xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 6/6] hw/xen: convert stderr prints to error/warn reports
In-Reply-To: <42a8953553cf68e8bacada966f93af4fbce45919.1706544115.git.manos.pitsidianakis@linaro.org>
	(Manos Pitsidianakis's message of "Mon, 29 Jan 2024 18:09:42 +0200")
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
	<42a8953553cf68e8bacada966f93af4fbce45919.1706544115.git.manos.pitsidianakis@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 10:07:39 +0000
Message-ID: <87zfwnp21g.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> According to the QEMU Coding Style document:
>
>> Do not use printf(), fprintf() or monitor_printf(). Instead, use
>> error_report() or error_vreport() from error-report.h. This ensures the
>> error is reported in the right place (current monitor or stderr), and in
>> a uniform format.
>> Use error_printf() & friends to print additional information.
>
> This commit changes fprintfs that report warnings and errors to the
> appropriate report functions.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

