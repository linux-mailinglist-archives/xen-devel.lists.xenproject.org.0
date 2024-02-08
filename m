Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F584D764
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 02:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677945.1054890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsmr-0004xU-Dl; Thu, 08 Feb 2024 01:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677945.1054890; Thu, 08 Feb 2024 01:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXsmr-0004tB-AL; Thu, 08 Feb 2024 01:01:09 +0000
Received: by outflank-mailman (input) for mailman id 677945;
 Thu, 08 Feb 2024 01:01:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXsmq-0004SB-Er
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 01:01:08 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a89d11b-c61d-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 02:01:07 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-511612e0c57so2228961e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 17:01:07 -0800 (PST)
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
X-Inumbo-ID: 8a89d11b-c61d-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707354067; x=1707958867; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/DzsEsEP9tjAI36Ecp36ox2GViiOlgStXseU82a9Xo=;
        b=BktMQJjXkvbmqhDDG5wabFNWNBc9LyLg9133Mf1q/1+2fn5Bz71fZuyEHG3cM5q6y7
         G66sAdm7ocah0cO4pHh3ggm0O2u3eOoJUUKMAWZVJ7xbm4wMrUW44tPWEdTHamqTEw2b
         Qgkgra1RLdg1v1te2QTT51GqZltSRK4U32r35kLKZku1kESuAaKcpSyDxuu3BCNdK5D2
         h7407Wy6eU0Bh2i6quacsEXe1XOOXLHQThEjHXA9cpoY0sXdKP3Qrdkxf07QwXuSoU/m
         k9QdPl8Aomd7Ky8FIfJxhRXhOxx2AakVCSWjTQmW3OGltircEiOaAA/4beY/MmGqvA4b
         JTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707354067; x=1707958867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/DzsEsEP9tjAI36Ecp36ox2GViiOlgStXseU82a9Xo=;
        b=GHWETvxHBhm7sYLF/tQggrISVwbvdxCT841lZINrxItdKL5soMEqnDQYXtM6NoJ+66
         lr5tti3jNzjSU1I//YmJ/dtY1Kk4GTC6jbflacDsh72r53oHrkJsQTJ6sS0D4PghDPN4
         QPWnxw3s8l3CgoUFiO2axyFlm39dvREAGhJT2glmLtHX4U3Y/fAq+v26btkUfoZ7dDBO
         l5FWWtskaakdKfJiEtvjI5IAvCjJcN0iQ0NW5n1fiX5ZxdtoPF4cF3fnsURbuDkicIxw
         vl9TGtXCAz441ebiELzQpEow7ASHXKYvhBCpLkJZmJkGOK/5d/HyMRco8ps2SFviQqVm
         eRcQ==
X-Gm-Message-State: AOJu0Yzeo+E7NKXGI0Z6KWVYnMsaZXEYFpk7sq15aKHyWcnwyvtF84K8
	IFpp2cZQH68Fp5cMdh1uMiAIbkTXBIDtdYBIY3tezWVVdHwAE5saWS4hM3rpQqdDrHU4v1V4xg2
	lPXIBOjYFV4J/wTBdfDrmOGXcDBA=
X-Google-Smtp-Source: AGHT+IF4hBGKy/zn4zeAzvvHT2G3779htxiQ0fcDKukuf+DkjppCAyx7m1KDLqG9qCbLlMNtIq2M+pOLFOKK1+x/0ek=
X-Received: by 2002:a2e:be0f:0:b0:2d0:bf87:b3a6 with SMTP id
 z15-20020a2ebe0f000000b002d0bf87b3a6mr5122694ljq.37.1707354067011; Wed, 07
 Feb 2024 17:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20240205105001.24171-1-jgross@suse.com> <20240205105001.24171-12-jgross@suse.com>
In-Reply-To: <20240205105001.24171-12-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 20:00:55 -0500
Message-ID: <CAKf6xps64YBzg9pRZjtZ1RiQqMVPhi4Qcwwbd+4g6wyXouzaPA@mail.gmail.com>
Subject: Re: [PATCH v4 11/32] tools/xen-9pfsd: add 9pfs create request support
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 6:21=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the create request of the 9pfs protocol.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

