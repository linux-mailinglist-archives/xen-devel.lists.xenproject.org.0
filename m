Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE21988789
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 16:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806347.1217678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suCIi-0006wt-GX; Fri, 27 Sep 2024 14:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806347.1217678; Fri, 27 Sep 2024 14:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suCIi-0006v3-D6; Fri, 27 Sep 2024 14:50:32 +0000
Received: by outflank-mailman (input) for mailman id 806347;
 Fri, 27 Sep 2024 14:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lwNM=QZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1suCIh-0006uv-As
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 14:50:31 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d737ed80-7cdf-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 16:50:30 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso319408866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 07:50:30 -0700 (PDT)
Received: from localhost ([52.174.59.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27773c0sm143643866b.1.2024.09.27.07.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 07:50:29 -0700 (PDT)
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
X-Inumbo-ID: d737ed80-7cdf-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727448630; x=1728053430; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3gd1328KWvh145grTgDSM4/u8C9esU1aVT7nnzi/lU=;
        b=WWoL/98i5V4PFiIpfDP89Txp0HkiSwdWCg0grotFzHjxROpn2UahlJdiDwORGVJp0l
         /8ui51xHQ0i6bZ3GsyEXOm1bMoRT7R8Cjs5n7F/IAp0LXMsnXx6jqxyGp2wJWRqij6Ak
         tgvKmU2nvK8XycsYCqZlqjLUOnMEZZmN6i6Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727448630; x=1728053430;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3gd1328KWvh145grTgDSM4/u8C9esU1aVT7nnzi/lU=;
        b=p3bEOHczf/T+m1NuRKoLppUYSLd33+NdiQEO/6VLTZmQKqpuyg99YKtbqatEtaGgq5
         tP8/tGhbin9M0XV6UQGiatqElKVnJHzK5J2E6NHiZshBCxeR8sk7W4q/3oiPmzXIcTI4
         JssfWiFum9MD1G3BYU3M5qL3WmGmMYIkqnyFiA5rNvuvDM8dciuMBVpVteR5kv3QpKkk
         zx1FqKwWXk3yaYs6aPkqikN9snAU28ZmXxUDb6R3+cOTtJ2Gite3+00tupZ2WdgtM7d4
         S1mZEBff57YX2tecJs10Kdj9iX4UxDetDO4HVoTel7+58k0Sny+map/aUIC6dvg+vHAf
         YNTA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5B9dQxcpHWFud4dDMp2vpQg8v36M1SAmDGiwFUfNjZaTS0OU9lU7h61cqjV3lLMB99r2+Fto03A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1NjgktJmto7wijTWAMf1uMox0Kaz6F2xcM9TElWOpsWwPAE4N
	cqr29wOMYcBov0TOLr4bHubvceYDCvh5JTT4e7XpI98cmQwT2InwHmVAjMeibqE=
X-Google-Smtp-Source: AGHT+IHl2UU1PqB7RurWWwVjZO9gPByiHgANjIdrME7wnpAvS7SzoG9qYF8b5hY/xFrHWy9u/HCoaw==
X-Received: by 2002:a17:907:9493:b0:a77:cca9:b212 with SMTP id a640c23a62f3a-a93c4a60b54mr362197566b.45.1727448629793;
        Fri, 27 Sep 2024 07:50:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Sep 2024 15:50:28 +0100
Message-Id: <D4H5FKL5IER9.JQFC7I39P8EU@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v3] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20240927142305.299841-1-alejandro.vallejo@cloud.com>
 <D4H575Q7NIO1.155E12B37CBAQ@cloud.com>
In-Reply-To: <D4H575Q7NIO1.155E12B37CBAQ@cloud.com>

On Fri Sep 27, 2024 at 3:39 PM BST, Alejandro Vallejo wrote:
> Would whoever planned to commit this mind replacing the commit msg on com=
mit?
> Otherwise I'll just resend.

Actually, I've just re-sent it to avoid confusions. Apologies.

Cheers,
Alejandro

