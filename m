Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 302DA6C9E8C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 10:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515076.797606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgiXm-0001C3-Ir; Mon, 27 Mar 2023 08:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515076.797606; Mon, 27 Mar 2023 08:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgiXm-00019k-G7; Mon, 27 Mar 2023 08:49:34 +0000
Received: by outflank-mailman (input) for mailman id 515076;
 Mon, 27 Mar 2023 08:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pgiXl-00019d-16
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 08:49:33 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49282e86-cc7c-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 10:49:29 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id g17so10330404lfv.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 01:49:30 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05651203c900b004db2ac3a522sm4610083lfp.62.2023.03.27.01.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 01:49:29 -0700 (PDT)
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
X-Inumbo-ID: 49282e86-cc7c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679906970;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kC7uDdIFlswVTL4rW/vkd+1v8Pnz8G0nfTVZUxf2poc=;
        b=HXQQrM/Y50NxsU1tBebHog9Ke91G4cslgdVPnn/ObFXjNQ+Wj2hRgApI/g95TWI8vz
         SQM27iNQ0/Xq6XUpf9X3LrIG5LJ4Md6kyx90LmhGOhC1zq9DSxKntUHKGEYUSBlKwsOA
         VbfiiSDq0pPRDyk18EFCfcVOha/d5DxUvkVGbJR9UBk7ArMVF++Snd2PhREDl5O+89LM
         L4b1RuAN5GZS1OjrjaveszQmeByYv9jpEQPQdMMCssWYcDWMKndv15pX4wMm88nde/31
         FYQZhsPuZOffI5PXXlUQrUetX0eJRadN19iE6/lfXi5AP4NWrshYr4iqB0baZwcnsyEq
         fCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906970;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kC7uDdIFlswVTL4rW/vkd+1v8Pnz8G0nfTVZUxf2poc=;
        b=o6AgJcTPmG6dGuRVd9I3zjnSBKv15LbwZeOuSSOkJd+aZaDZ3IQbn5/CUJYfd+VRLL
         xkXirVD6KFtWsbEglSIf0pyJaaZY2UWWtgDjTTIIgrQ6UiPlmTjmKN/mcLna9mJwJNyY
         wbOCWbM2bpbaIz0OIs7M2nNU9gEUW6kN99zTWux/MPkfqGvR9TEf0mJTdiKi7jUjvQWj
         ef/OatCbas+SkPJOUGifjfiO46CXbMKmrOkZEFlFgonF+svckUcgyUCTAk1MFvHxkdan
         29FR3P9iD43C8RSPTVhZkqrFHELL/aqFD7JdiW04gtA3s/VqJZAWrd9SN6jXbxQzZqZR
         esQg==
X-Gm-Message-State: AAQBX9fjk0vBI8j/kZ+TQao24TjPUX327IcZLxoNDcJo6gnW3wI8eFZo
	YGZNxyYoDiDeKNciYSXvprY=
X-Google-Smtp-Source: AKy350aPHOao6x8u8Vww5TtAlnqcCAe/9eeiiy7UUlQuuUO+PZU2SXRksiJCdtXRpyB2yuKvf+OoFg==
X-Received: by 2002:a19:ae16:0:b0:4ea:e5b9:23b7 with SMTP id f22-20020a19ae16000000b004eae5b923b7mr3294322lfc.2.1679906970102;
        Mon, 27 Mar 2023 01:49:30 -0700 (PDT)
Message-ID: <2eac85c13b4454de2bfb80bc99ba2db0ddff0c1e.camel@gmail.com>
Subject: Re: [PATCH] ARM+RISC-V: BSS handling improvements
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Connor Davis
 <connojdavis@gmail.com>
Date: Mon, 27 Mar 2023 11:49:29 +0300
In-Reply-To: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
References: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Andrew,

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

