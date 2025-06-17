Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33386ADCF74
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 16:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018259.1395158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRXBQ-0001Mu-GK; Tue, 17 Jun 2025 14:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018259.1395158; Tue, 17 Jun 2025 14:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRXBQ-0001LJ-DP; Tue, 17 Jun 2025 14:21:04 +0000
Received: by outflank-mailman (input) for mailman id 1018259;
 Tue, 17 Jun 2025 14:21:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Un2b=ZA=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1uRXBP-0001LD-Dz
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 14:21:03 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bcd73f4-4b86-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 16:21:01 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54b09cb06b0so6503451e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 07:21:01 -0700 (PDT)
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
X-Inumbo-ID: 4bcd73f4-4b86-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750170061; x=1750774861; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb1p60QKBhAo5gm48IbBprTChd0rb8NUwjl2AKG+uAU=;
        b=ZFWzctj0Hg8bFbFFZdCNX84eKHkyowcRCfUraFMzECdFEjDrY2cXOpweobIeW1gzbV
         PvwlbrYYLn11SvUSowIwXVxorQpMeCcilkiCqtJWkNSbps1Ll+3VT/qDI/DF/VZ0mEMT
         8qMn66XB4QL6z4DpNkt+q8Nzb+tn+pPsRdUtPDKljnnXz+ywuJ1aZTt5Kzep4FljMe5h
         6Ff7hyM8b3M3tl9RQrsenX2JoDFApNv8U0F3eEC5ZQ3BFTRo8zCV6URksRSL1vtQi0uG
         aCXJgwMVHAvEtUonkiE7E1bPM9UMGd455UEIsZbLLndbzqTRwSOg4nLU5O2vMhjiixqq
         XlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170061; x=1750774861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb1p60QKBhAo5gm48IbBprTChd0rb8NUwjl2AKG+uAU=;
        b=T7/Ts0Q4KZmI0BoYs1kpSVTTFlqeWWoc4yn6GY8ArKJVz0bu8PtNwbyW5bKsDeV1v5
         mr3pt7SzBQiXNdIKHGwB7Dg8T3KIYO7/t+Ut6zLpqZWEWlDAMsMc148Q5g5fg5wAGYjU
         VreR3Yjloy58Nmsk8o8UgAVAgX2LeUCEwBeZEIIU+ENA2qlkzOPbID452O1L3flvxnxw
         BbmV0d30G8hlThBJmW4H5F6U9TzkBS4xmdnuxt4z40gA+4O1A2CboZIm43ko5DPusoZv
         99yWK6KnfOTHSPeoIYkkdVc6I+AIQh9BPKayWWpqNbS1G8pJzl5aAcRucRegWpAvCj9U
         V4vg==
X-Gm-Message-State: AOJu0YxtgjeaJgxfz7SZXRzUCYgDP3IMv6WDRj0Art0av0+iJQlJbHCY
	9MLe5zAHTCKF+fZbmcVNmtCu8moLEPzhzxj5104rVDB2gsqzBI6bumpiFcVaaObPFpKDy5ec9rS
	DNtT+9cSmI1dUS/4C+nrKBsc+ndOXgng=
X-Gm-Gg: ASbGncvVFVVjmh/O1YKOVVXdDQaXVphGWTCSNh5cRqAfNQWH32BdGzbU8pR6ZazgZWz
	6UKAPyXVFTfYZTLJAc/EqQtYpuoAMucgqa8FKZ86BXpxN11n3u9icqZ+zyBUm2ZrLjPk0BwL3NK
	MVPfqUvNh3jeuHmVI5nlPfiCFAjmpCdoI60qfGH3fXww==
X-Google-Smtp-Source: AGHT+IGpDLlB2hDY8gGqmKWsHL6uzavqzlynacH+3UmZ6F5ABRmviyigN5EacpqL+Rtbi5602dvff4p0hsFbTijEx/0=
X-Received: by 2002:a05:6512:6ca:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-553b6f43b4cmr3467607e87.46.1750170060891; Tue, 17 Jun 2025
 07:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250616153826.404927-1-edgar.iglesias@gmail.com> <20250616155306.405257-3-edgar.iglesias@gmail.com>
In-Reply-To: <20250616155306.405257-3-edgar.iglesias@gmail.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 17 Jun 2025 10:20:48 -0400
X-Gm-Features: AX0GCFu-1vtvMVC7dIRnYOZGf23BFMdfvzA3WdOumLzAWNbjfNXpK22jyUACsZI
Message-ID: <CAEBZRSdGv_2Wsh1Q7qQbVmfCzQ-ssbGXc1Hbu6gboms+2zpKkw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] tools/golang: Regenerate bindings for trap_unmapped_accesses
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
	andrew.cooper3@citrix.com, anthony.perard@vates.tech, gwd@xenproject.org, 
	edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 11:53=E2=80=AFAM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Nick Rosbrook <rosbrookn@gmail.com>

Sorry for the delay.

-Nick

