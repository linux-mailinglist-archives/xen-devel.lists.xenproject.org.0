Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A927FC554
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 21:26:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643468.1003733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84f5-0001SE-L6; Tue, 28 Nov 2023 20:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643468.1003733; Tue, 28 Nov 2023 20:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r84f5-0001P9-I9; Tue, 28 Nov 2023 20:26:27 +0000
Received: by outflank-mailman (input) for mailman id 643468;
 Tue, 28 Nov 2023 20:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxdS=HJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r84f4-0001P1-EX
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 20:26:26 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 668d3a9e-8e2c-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 21:26:24 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bbc36f767so1536092e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 12:26:24 -0800 (PST)
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
X-Inumbo-ID: 668d3a9e-8e2c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701203184; x=1701807984; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6tMctuMlkz4UJzr8iKkG27gUxOnsLIGdAIOxSZu4Ws=;
        b=VayfySyUYe7CFZ/w9ni5NC2FMI2QiETOuRgcy2Ov3gxmfMcFLY8ju4b/xu7FQ1tgiH
         v4P937ql7RgTfe71u+TNKYFosJzZ3nxY4DtQP9HE4SK77FeLmvB5m3CIruyk6NaxGkTx
         nhWC7Biu1o6n+RvrONGUqN1kKHrbmGL/WiCPrnpDMRSuf+yz19HRnTopey8dA+4DonNp
         BWp1G9pYNh7To/hsWDXCNEiL04M4E6M2OPht2y1ILMDwPMM0R3g3flok1FcFAvX6t8C+
         FYxrP2gyaDpvwS+/PDaM0AVCzbVZ39yHgxaRnfyZApjNbb1EqpAnnolgqEJ8NrGyOiQ6
         5xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701203184; x=1701807984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6tMctuMlkz4UJzr8iKkG27gUxOnsLIGdAIOxSZu4Ws=;
        b=xEPiVmi7oosPqILJav5eQaE4jDDY8WFpB1OLZUSAcFMLksfx8xdV+09Sdb6Ue5LZuA
         /qU5z/95K0H4e8PpXkMJ0lwrYPpPYXfpSoZtGmvCjBx2X1nyx/VrS74L2nuYlYHSUWHu
         QwrAI69KwENp50EjFf/Dl4IwMaxUdpgXx5DjzqCAggDk4WU8bzO+82Uj4Uhb0FjCy3Sx
         JlDDsPtP5sbs2cddT1HnclWsFGx/huQoewY6W3jQ7U1vZ4HmH5S/NN7GR72tsOcZmhIz
         KrHb9NZjNuFTAtjGnzQxA9f5E6O3muFvZJDFkEGp8ncWW1nEH+T+KDj3H7LCduLxwt7Z
         sw+w==
X-Gm-Message-State: AOJu0YxLFytm90j8khPpl+pOgxDLKhNmIPhs6fM8si2FGJL6BgoZ27ky
	0C0fMHpQtgvR6E+bzsA90wymJDXCZC0qW+A91ZA=
X-Google-Smtp-Source: AGHT+IHA4PyT/KRwDt+zExA0zqtE4HNF+uQUQ8KMt5GmbiusIQw3uYA43GJ8Cm/Th1oh3W6Sc4Ne/OuMDlIn8OHMsVI=
X-Received: by 2002:a05:6512:2343:b0:509:455c:9e3d with SMTP id
 p3-20020a056512234300b00509455c9e3dmr9451935lfu.18.1701203183824; Tue, 28 Nov
 2023 12:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-19-jgross@suse.com>
In-Reply-To: <20231110160804.29021-19-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 28 Nov 2023 15:26:12 -0500
Message-ID: <CAKf6xpsk4kZcomvxyDiLwsp-pu6+x3TpipJj-s4iwxHm6YJHgg@mail.gmail.com>
Subject: Re: [PATCH v2 18/29] tools/xenstored: rename xenbus_evtchn()
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:23=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
>
> Rename the xenbus_evtchn() function to get_xenbus_evtchn() in order to
> avoid two externally visible symbols with the same name when Xenstore-
> stubdom is being built with a Mini-OS with CONFIG_XENBUS set.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

