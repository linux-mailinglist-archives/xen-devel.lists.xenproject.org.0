Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D9698235
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 18:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496163.766757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLfJ-00079W-Gv; Wed, 15 Feb 2023 17:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496163.766757; Wed, 15 Feb 2023 17:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLfJ-00077N-DG; Wed, 15 Feb 2023 17:33:57 +0000
Received: by outflank-mailman (input) for mailman id 496163;
 Wed, 15 Feb 2023 17:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yo9K=6L=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pSLfH-00077H-Hu
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 17:33:55 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea99a9b2-ad56-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 18:33:53 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id a2so19957749wrd.6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 09:33:53 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4cc5000000b002c558869934sm8186388wrt.81.2023.02.15.09.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:33:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E55E1FFB7;
 Wed, 15 Feb 2023 17:33:52 +0000 (GMT)
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
X-Inumbo-ID: ea99a9b2-ad56-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcVGeHtYBRBwgzlnj8UOcf+La3RPbj1Pw6zmXVeuBcc=;
        b=TY7dQXLP+3LKCNRuwKAhQmsMNW6yqGfShnlxc5kciH5j7CHP+SAxHky6xXlncBZX8n
         BSRTzK10dxcoqsQWFT6WpcC4ts45JbA73YMYClqbr8qB8vQM4QPLTySoSrxejp0q3EhB
         OzQYrzzV8cm6EH9EIpXR4FgnxdfxrSN+XZs5wybmiFW4XepspjZZU46ghYGMF5Sc7jQ0
         mFA/6gX52831D1p1t/G9uRZPGG8OyXYpv2TKYP6skVcjNd523BUCP9XAZgLNOqMnmvKq
         +va/iwCGtw5knvxrKiOY7JqgDep8sgKDqLp2xpItOUb7WFnF3Ad/zBZ7m2uDFP30urqx
         4txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcVGeHtYBRBwgzlnj8UOcf+La3RPbj1Pw6zmXVeuBcc=;
        b=Hc+3GiHUGtuBFuSsKWYP73F+zkWtVQIPBlw/BWC/tdXNu7dOd5ed02zrCZVEp9FBwx
         9xlAjHmtd4tvXFfX8TSNBe0/xJNvpDPfLnyyBn6qWBu9A3WcJc5AQIf+pAdBZ5ivnB2A
         rk9mITGg4xEgxnYdNUSm/ZCOX0XUPTKn+w/pO/P9AdSAoq7u+qJZm+iRhZvSxSbYCYZY
         ouVwP08RUtJdbiKtYD6GwpBDMRGckk1R0T3K0RGkyOP7yCbDAjuh/f1dNIc3Sr5metrk
         aw4X8nqmKgbZ3lZxJhvmn29ZKEZAf5f7iOPi+cfNFkZXBxi8K1LO7nRG7DuAuo8Z6cYA
         REOA==
X-Gm-Message-State: AO0yUKWhVIyRwjBk0INEUccfj5pZoLEs++aXtJtT2CxS8LyvcMeYX2id
	jzJGVVqXM1zE3198hLJYBbx2cQ==
X-Google-Smtp-Source: AK7set+YVSC2ETEfLUAdM7ZmVXyP2J/zSok3OF7fsnYAGSVBSonf4LmvlhvvVw86fx22TDcCI9+cNA==
X-Received: by 2002:adf:ee92:0:b0:2c3:ed68:5600 with SMTP id b18-20020adfee92000000b002c3ed685600mr2446540wro.38.1676482433071;
        Wed, 15 Feb 2023 09:33:53 -0800 (PST)
References: <20230215153451.30626-1-philmd@linaro.org>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] accel/xen: Remove dead code
Date: Wed, 15 Feb 2023 17:33:48 +0000
In-reply-to: <20230215153451.30626-1-philmd@linaro.org>
Message-ID: <87sff696kf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Unused since introduction in commit 04b0de0ee8
> ("xen: factor out common functions").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

