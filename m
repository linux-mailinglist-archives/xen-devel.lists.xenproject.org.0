Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091018C1F6F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 10:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719567.1122379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5LID-0002vh-JR; Fri, 10 May 2024 08:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719567.1122379; Fri, 10 May 2024 08:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5LID-0002uD-F5; Fri, 10 May 2024 08:07:49 +0000
Received: by outflank-mailman (input) for mailman id 719567;
 Fri, 10 May 2024 08:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zKRT=MN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s5LIB-0002td-CO
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 08:07:47 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62169674-0ea4-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 10:07:45 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51ff65b1e14so1860252e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 01:07:45 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba746sm601833e87.104.2024.05.10.01.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 01:07:44 -0700 (PDT)
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
X-Inumbo-ID: 62169674-0ea4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715328465; x=1715933265; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yt+2vWS4MhJW/ZahGWzw0UqXhZCmCY00qcl6efnl6W8=;
        b=BrB19D/LMJnvsIhkpMz953U913aKx32hlrYpA0UwajYCOwboZbkyrrFqJ/ktSG+Bt7
         u+7jBnAQSGYH66d9WNk08EhUd0XsnhLoncyfEfj6Q1OeBaE2qpAJr6b7ovNq8dJb7gK7
         JPwvUfDtOxlflphQ9tbxNOSC04VW7qmLPIAFY7i9ZwFiYF0WazYjRt8XylZGH2wIKgQk
         KiV/fUK9W5tjz0fDit2b/96HGxiC6W/RuHv413Z5Yq3n/fyNyMhhtip9ijq00bqo/T4P
         taPkSEOsD7HCMs8N2fUTOhD6QXpfEJ5K1BKyi+KhVpY90GkPDom0s4AOwTE+BXQQj1A9
         ytEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715328465; x=1715933265;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt+2vWS4MhJW/ZahGWzw0UqXhZCmCY00qcl6efnl6W8=;
        b=sBNoxJDRwIyJcyuBENkDa7bzgh7NyHLbDRpjyGPLvJJFt0OdtnSLFX1veduHXtSDcY
         329ADFLyQEmgr3gmNfSJW9G2xdQWRoZB0gxyDlNTPzKiEyjaTF47S3rJZR8IELpkdDTO
         XuDmW7Pr/JrMCNZERXrGNNF2zdspMYlrv/7d9djSNVuOxBSCfQlnju3SUZcDjPH5VOah
         Z66rxMZgfEufvpJGceo7SUxyKWE0gWfPnvBaHc7MiI+AJLsgKV8VEp5q/zQOdAP03FUf
         m8ecWQjbvLcq2epLKjrlVYkAucr94bsoIdrsg2Y4z1ScTf07MuDXDiZP3i1qikLsD6z5
         rAMA==
X-Gm-Message-State: AOJu0YxMaNPX5HVbtikZlsInd1qhCsDQH2eFHQU/X7ssJioynHgDmO/J
	NR/fEk4Cs8TfoYLDKROElmF94+DdymYxocHsd5pn7Kxl4TFEo3B5H1s+4ZVx
X-Google-Smtp-Source: AGHT+IHQdRxDmI1bON/ZGGjaBKA/weZ6303htgZ2XJ+ksSbF6GmId73RmTiFoKy/trTXz5tQyGMjSQ==
X-Received: by 2002:a05:6512:38d1:b0:51f:1853:25f with SMTP id 2adb3069b0e04-5220fc79467mr1187814e87.19.1715328464474;
        Fri, 10 May 2024 01:07:44 -0700 (PDT)
Message-ID: <b2360598c0753717463d5c206fc2020e09d0fdf7.camel@gmail.com>
Subject: Feature freeze date for Xen 4.19 is 17.05.2024
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Fri, 10 May 2024 10:07:43 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

Hi all,

I would like to remind that the feature freeze date for Xen 4.19 is May
17, 2024. If you want your features to be included for the release,
please make sure they are committed by May 17, 2024.

Have a nice day!

Best regards,
 Oleksii

