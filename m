Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893185CE8B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 04:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683787.1063394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccvp-0006X9-M4; Wed, 21 Feb 2024 03:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683787.1063394; Wed, 21 Feb 2024 03:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccvp-0006U1-IP; Wed, 21 Feb 2024 03:06:01 +0000
Received: by outflank-mailman (input) for mailman id 683787;
 Wed, 21 Feb 2024 03:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rccvo-0006Tv-KA
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 03:06:00 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23730c57-d066-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 04:05:59 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512aafb3ca8so3261790e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 19:05:59 -0800 (PST)
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
X-Inumbo-ID: 23730c57-d066-11ee-8a53-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708484759; x=1709089559; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDVWoH+nKiVWuUc0iKL9rSHj/ShAiT6i2MROjC3kJK0=;
        b=EWRLju4j2T545fPdl5AMRp1wlbH31YyBhtHz/NzB2P9Tr13PRfMZ5rP6NHnNxTC+6T
         0EyjE8yJqnFJzkxFFV8MaMdls/94bUpom1a4C8OhjzcgZMZ+HLInyNTfwFN92g91KZQH
         KSJWLjeHQtFt8VA6bECv+d0XdxUycIVTteaCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708484759; x=1709089559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDVWoH+nKiVWuUc0iKL9rSHj/ShAiT6i2MROjC3kJK0=;
        b=d0UfIozng1Ov0unHqgRWauyuEiOlc4cWygv03kHComd293yfvRaU2FGZ0OBoNzwjb2
         sHeYErbMS4tzjsZgkgOwl4ve5FWwxjV4K9g4i5AM8dehxpIMIsPlEwx/tfCeNF6/o4nS
         xfh2sLmU7sDeFYutcWA6nln9oJ7Cn86mKIfv+pcvt/D/5K7/pvsFdav8WJCcZHO1ThZ5
         fd5JuJ1bKwRGm2ukgnEl7U78JgSxtMMf+7Y5UK9lBErnQpqvqUMvflDYb6KA0ikBlIiN
         5S5ulRCo8ulEdmaXpC8loeyOVEmMRWs6WCEdrA490czew6ssl10n1OFPm+43GHOfi70C
         sB1g==
X-Gm-Message-State: AOJu0Yx7zFiO01/aCOSO+OZWuULVVUNrm747664yIQF7EU4xYWrHZ8cp
	C4/SteAJxcTPcuwPsSksISmTn8iAPQEZ42HrbUdOPI0Wu2/mZngjiAg8xVPQ4fljN9sqS/lnwdg
	iEG4Sa/hy9pZ1jEZSQm3Onkr8+JIYPcRFyLnYrQ==
X-Google-Smtp-Source: AGHT+IHPepeK4YFR8HmlROaoNLv3XTMXF4DHgTC+llsoJqDqDIxMyy7bURyiPYhiWIR4aJSpuOad2MVc/ehhL1KXrIQ=
X-Received: by 2002:ac2:4859:0:b0:512:b788:2c0e with SMTP id
 25-20020ac24859000000b00512b7882c0emr4231908lfy.43.1708484759122; Tue, 20 Feb
 2024 19:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20240215150644.2477378-1-olekstysh@gmail.com>
In-Reply-To: <20240215150644.2477378-1-olekstysh@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 11:05:47 +0800
Message-ID: <CA+zSX=bXcSa6JWCSVkNSmcbtJ10St8PAmSeTrhRMt3XL95M6Ng@mail.gmail.com>
Subject: Re: [PATCH V3] libxl: Add "grant_usage" parameter for virtio disk devices
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 11:07=E2=80=AFPM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
>
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Allow administrators to control whether Xen grant mappings for
> the virtio disk devices should be used. By default (when new
> parameter is not specified), the existing behavior is retained
> (we enable grants if backend-domid !=3D 0).
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Golang bits:

Acked-by: George Dunlap <george.dunlap@cloud.com>

