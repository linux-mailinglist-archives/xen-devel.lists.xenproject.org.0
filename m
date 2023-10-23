Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404677D3231
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621368.967750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusvj-0003R9-KR; Mon, 23 Oct 2023 11:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621368.967750; Mon, 23 Oct 2023 11:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qusvj-0003OX-Gb; Mon, 23 Oct 2023 11:17:07 +0000
Received: by outflank-mailman (input) for mailman id 621368;
 Mon, 23 Oct 2023 11:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qusvi-0003OR-QO
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:17:06 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2025594-7195-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 13:17:04 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507e85ebf50so2878920e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:17:04 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 6-20020ac25f46000000b00502e2ab7118sm1670433lfz.50.2023.10.23.04.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:17:03 -0700 (PDT)
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
X-Inumbo-ID: b2025594-7195-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698059824; x=1698664624; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vw5h5w4fykrcnju+pG/ucqwn722KGqtpnI6e2mBVktA=;
        b=Gvn2o/S9LZ347wiFdfdAZd10uYY4PcghjMV7fLeIP02ezeuptWyZ+9mnDAuJTPHwY7
         rXn/SoFp3PSbcXe+1MBYVHDs3yM5Hp1jqBn6ErEly/MA42sdCrzIu/wPEp9CSH2g6chT
         sRHvbGQ2P1beJts+NIU1CCKMAyOKS5Ee+NChH0cfufy77vl9bMp5OozqW7zczbtoSe0n
         mzwEWyUXs3jMtLBGIL/DX+e1CQQ8wDt70uTy9W8TaQo7C5kAUi/wcBh7ABJExcsq848J
         cICSEFq/bu2z16Tq/+eag7/qh4FcFXclEqZLoO6A/kRLsUYzleFinoioIeD6bWMx8vku
         alTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059824; x=1698664624;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw5h5w4fykrcnju+pG/ucqwn722KGqtpnI6e2mBVktA=;
        b=sHtX/NV9MwOBWN+ggN7VmsLdvFczimSgOXYtnyvMWs8kSFLac7YVAm1gxrmiP0ndbY
         Bfs8S4gLSOd5VXkaIBDKBAMcaNA3l/nujayINHA7wiT1zUT4zM21YkXk1m8bM6YXUXuL
         UWnIaPby12KbiEDxXHp136KXfbak9O09cNdwMLax/SGgLx9wCvHRCNsJ4mL0WCPztsC+
         K8ixC3j0BvmVy72or1cXYECWXd7FFaKZaOuNuf4dyZcC9vlCRIRWJYJ23kr5mYSg7vfq
         pYoLDXucHELbBbYQ6qVTk7Eyr83gSaGwl8JhbrDJ5lqPh1cTAIx6WYmgWUmibk2UQBl4
         5Sqg==
X-Gm-Message-State: AOJu0Yxe0N7p424tLXG4vPoAzNYGsgdUHC7lgcOijDESzEcCa2FIyvgb
	f4VpSihBJsTzFeJyWgJJ2UE=
X-Google-Smtp-Source: AGHT+IHdkKMsEbkcIJHZ72Y3sBHP6yQn+g3i38oaVX5H5/bLFR/nRH0XscWo1H01z/kC5fAjuxs56w==
X-Received: by 2002:ac2:4e08:0:b0:4f8:714e:27a8 with SMTP id e8-20020ac24e08000000b004f8714e27a8mr7471574lfr.0.1698059823990;
        Mon, 23 Oct 2023 04:17:03 -0700 (PDT)
Message-ID: <a5d5598d4c0929a69cddbe75d4d17f9521def008.camel@gmail.com>
Subject: Re: [PATCH v1 15/29] xen/asm-generic: introduce stub header
 xenoprof.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:17:01 +0300
In-Reply-To: <0efa2ef6-8815-4b39-bb53-f1d5902e71c7@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <0b7805d6bd5f16d06656093d964d5d90030958d7.1694702259.git.oleksii.kurochko@gmail.com>
	 <0efa2ef6-8815-4b39-bb53-f1d5902e71c7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 12:09 +0200, Jan Beulich wrote:
> I've made a patch to move #include-s in xen/xenoprof.h, dropping
> Arm's
> header (and none going to be needed for RISC-V or PPC). I'll send
> that
> patch in due course.
Could you please share a link with me? I can't find for some reason...

~ Oleksii



