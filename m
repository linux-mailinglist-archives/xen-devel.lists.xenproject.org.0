Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E892A393
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 15:24:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755407.1163763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQoLU-0001Qt-EP; Mon, 08 Jul 2024 13:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755407.1163763; Mon, 08 Jul 2024 13:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQoLU-0001PJ-AU; Mon, 08 Jul 2024 13:23:56 +0000
Received: by outflank-mailman (input) for mailman id 755407;
 Mon, 08 Jul 2024 13:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m90j=OI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sQoLS-0001PB-DM
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 13:23:54 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5243e580-3d2d-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 15:23:53 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ee910d6a9eso28976221fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 06:23:53 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee9183d72csm12072041fa.122.2024.07.08.06.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 06:23:52 -0700 (PDT)
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
X-Inumbo-ID: 5243e580-3d2d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720445033; x=1721049833; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2k5/8gErrx/CRuafoIuSE0K/XH75IaHqQs1mUeKjZo=;
        b=nZ+4wFSPu2fAzMEUYiKEpjXjiQ7HwVOLwyDOFMfCJkPsW0kVDbvgEIgQCwsLY3ucXL
         lCDUkeY4vSvaY/MZrJqetefOvO3dWz7n1pCXUUStrwK1p4AdWvfDVZTg4ja1bPFc9Uum
         7+14ZyotVn2TAZx3JNikx1ejTrTuXJ7bAkVvpn+MpiDYL+KTbN0xAPFGnbSTGUB8yk+Y
         kl5QftakxWcTVX5syOqs7016rvlXTY5mqpSzUXQW5oEidxJEejLlmP2yXKDnCH8Pgl0O
         WnTKjL/gkRI5138YP0irHU5L+XRWjwnYR9xgI/3eRBq1j6v5lRG73k7bR/nTnLyu/WGX
         SXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445033; x=1721049833;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2k5/8gErrx/CRuafoIuSE0K/XH75IaHqQs1mUeKjZo=;
        b=oGAIYEJFMFdWGbeHfl3BJ9TZIycWrXdn/BV5H9lEamtSWxAEFXFInvQDRc0HlJUg0+
         ET7469jHH3ZUsN/+TS/ynrf6GXIOfAwe3GocctdzgrHvKcQmJYybygr60D+m09zjM0hR
         ee6N9Pq42k8VYiesqZ65hNC5MCnM2omYqj3IeloxnSUe7gZpMgeFJ78iCS+/BecPB0+E
         pj9YBAgyKWYlmDRt06/q2+I4XGnh5nFMCLUcLbe5gpyELNnocYiJBJHGm1SIgMZ5e8wa
         Ajo2H3aPDSVY6W2nZ1wDJXmFQJhO6L8/DBko1F7d+9d7bciutAIBWKl+AdSW//mGsqeD
         jYvg==
X-Forwarded-Encrypted: i=1; AJvYcCU7TIyKZ7sqecrG1oj8Gvi3+QkML0nBCcpupSEGtwMgHfxhgZIbrreWE8GUu21zf1f0Jfnszrq7dW+AkLBDuyvu3K/8fl+ClhvnlsF1+EU=
X-Gm-Message-State: AOJu0Yy+PU7kfDfccRYab8ZDlNG57hRWItHFiqk7GpJGNqQpbRrznzkq
	zWqMppMILXual5WLMiMtK1lrjA3+nNxu1s3iaBMvfJFooujiFHFk
X-Google-Smtp-Source: AGHT+IHG0eVEByzJaCgp8izXRtN4x2L1wD+UE18mgM6sXYLySky/mxI7EaSSl83/+zrEZeHC3jzbfw==
X-Received: by 2002:a2e:9118:0:b0:2ee:6bdb:59e6 with SMTP id 38308e7fff4ca-2ee8f2f2ab1mr35047801fa.17.1720445032707;
        Mon, 08 Jul 2024 06:23:52 -0700 (PDT)
Message-ID: <de2584a9be63e17c4d43d200dc445af706edb012.camel@gmail.com>
Subject: Re: [PATCH for-4.19 v2] x86/physdev: Return pirq that irq was
 already mapped to
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jiqian Chen
 <Jiqian.Chen@amd.com>,  xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Huang Rui <ray.huang@amd.com>
Date: Mon, 08 Jul 2024 15:23:51 +0200
In-Reply-To: <905c2eb7-9fe2-4a7c-91b3-1f9df245c5a3@citrix.com>
References: <20240708080456.401764-1-Jiqian.Chen@amd.com>
	 <905c2eb7-9fe2-4a7c-91b3-1f9df245c5a3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-08 at 11:32 +0100, Andrew Cooper wrote:
> On 08/07/2024 9:04 am, Jiqian Chen wrote:
> > Fix bug introduced by 0762e2502f1f ("x86/physdev: factor out the
> > code to allocate and
> > map a pirq"). After that re-factoring, when pirq<0 and
> > current_pirq>0, it means
> > caller want to allocate a free pirq for irq but irq already has a
> > mapped pirq, then
> > it returns the negative pirq, so it fails. However, the logic
> > before that
> > re-factoring is different, it should return the current_pirq that
> > irq was already
> > mapped to and make the call success.
> >=20
> > Fixes: 0762e2502f1f ("x86/physdev: factor out the code to allocate
> > and map a pirq")
> >=20
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> As a minor note, we treat Fixes: as a tag like all the others, so
> tend
> not to have a blank line between it an the SoB.
>=20
> Can be fixed on commit - no need to resend.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

