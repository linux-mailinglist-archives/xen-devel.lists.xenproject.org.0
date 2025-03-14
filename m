Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FDA60F2B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 11:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914341.1320121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2Rh-0008IB-EX; Fri, 14 Mar 2025 10:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914341.1320121; Fri, 14 Mar 2025 10:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2Rh-0008Fz-Bd; Fri, 14 Mar 2025 10:39:17 +0000
Received: by outflank-mailman (input) for mailman id 914341;
 Fri, 14 Mar 2025 10:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt2Rf-0008Ft-8W
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 10:39:15 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9224d039-00c0-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 11:39:13 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so377814766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 03:39:13 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149d0bfbsm210057866b.95.2025.03.14.03.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 03:39:12 -0700 (PDT)
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
X-Inumbo-ID: 9224d039-00c0-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741948753; x=1742553553; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULN6swvzDosjW4dBgOc1H3sXcVGUEArw17CMTPoO5eo=;
        b=V6tiW7G7act/QT2EBDJPDsEquP61OExKstdbFZKo/4XTkQX9DcUsbUv+CAY62afVV2
         nnAt+ErwsOEC0W+MszZhkvI07GSU5+vwGsI5MhN1y/g9o9Ndmuv1oFS61dyVIAg9YET3
         P/kWbUNiymX72fzHFpgxMCMXGm8j4zNsW1UOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948753; x=1742553553;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ULN6swvzDosjW4dBgOc1H3sXcVGUEArw17CMTPoO5eo=;
        b=GuqDLNfenYndR5ZWsXbMguB/CbK7hFSSK5SAunj6R+Q/F5LvKcjb507pSYle1XpO2y
         N/SMwHdnKw69+q5AxKU1u799tIcToOM/XnZPcgJyrU8DtcIQV/5JW3N9yr0ty1oCLc0x
         8yXWfIh3VSSVh27QzjcBEZg8tjhqDdTFoacJ3S9Gy7dWXzXnMcuUa9ZcHO0g9AkWLTLF
         OG1ZGvGKjdGNXkA1kob2rYAnL8Yhv7eZ393EOgoEPdIS1cL7MVtFve8cE1KNsoHmwLnA
         XjG+j/0pHGeDzZUnv0ZSGetJtz2h+JFXHVptjnl+vlvHPwHJeKlDMmHorvOlB2oXfZCe
         ui5w==
X-Forwarded-Encrypted: i=1; AJvYcCVJMAno7XRjJ/CXMDp+3XTh/xdfC4Jyxr+RomGGyWP1d+N+bVZs2EN/u6bhT8NDhXFtSP9whRmTFnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGv4DptaWiBooof5bsjx2cwa48SZ6FT02gBpsRHPEeaPpAZqxe
	qcQphAbi8zDmEW/urHCysdfw74vhsf8PXzYKwbL2lA2x6JBDXFNprF59yV7RIx0=
X-Gm-Gg: ASbGncspKMAFzGlCt+VhOgG5j7PWrUp3y7bma487XbCNkbWMjGb8Ppj3WeEjvYLiBid
	ukopakLxSG+uaXWUUttFUYCzBry/pJS0S+SQphKdhXPrJuOe39R78nghTLXKX/vUMLSwE0lcEQV
	kj771JHiI9QRDddBVisnc7qlbOCIPp7WpN0JuCjEK0aUNhEt70gs1GKSGPOPqEbKZ6mq+Hf13AS
	PEoYbS4/PVCVqntM7NJ+7mtPaI1S1k4mq4fAlbuBTX26vy0dj1TimHNsqIWldGJvl4eWohzCKG7
	ExsFZXi8Ue0PyRxaoBbBYy4Jo8aV41J/ryf4YKyLgnK2CbVIA7k=
X-Google-Smtp-Source: AGHT+IEFe8avrpBaFzzcRZrEcldvsNGjk81I5sL5wszR96qFlb+zzYcGBDOlGrDx7N41bJCmUWLkjQ==
X-Received: by 2002:a17:907:7290:b0:ac2:fd70:dd98 with SMTP id a640c23a62f3a-ac3301ea161mr201777666b.22.1741948752947;
        Fri, 14 Mar 2025 03:39:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Mar 2025 10:39:04 +0000
Message-Id: <D8FXALVEWMGZ.2C16ABCKLKQRY@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Stewart Hildebrand" <stewart.hildebrand@amd.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <D8F8IW559J11.2G40MDQH23I44@cloud.com>
 <7b4f47c2-ce03-44e9-907a-acd56e56a9ff@amd.com>
In-Reply-To: <7b4f47c2-ce03-44e9-907a-acd56e56a9ff@amd.com>

On Thu Mar 13, 2025 at 5:43 PM GMT, Stewart Hildebrand wrote:
> The idea was that the unmap-then-map operation would appear atomic from
> the guest's point of view. I've only queued up the unmap operation at
> this point in the new logic. Due to the mentioned limitation in the BAR
> mapping deferral machinery, I wanted to make sure *this BAR* was
> unmapped before queuing up the map operation (see below). Waiting for
> *all* pending operations to finish here is likely not appropriate.

Looking more closely after reading Roger's answer, I misunderstood what was
being queued where. There's space for a single deferred operation that's
retried if pending on each attempt to resume the vCPU, whereas I initially
thought it was the mutations to the p2m (which would've competed with other
mutations from other vCPUs). This makes more sense, sorry for the noise.

> I think this just reinforces the need to rework the BAR mapping
> machinery.

Right. The most delicate part is dealing with races with another vCPU when =
the
unmap-then-map operation does not complete in a single taking of the vpci l=
ock
I'd say. And that much is unavoidable, I think, because either unmapping or
mapping might take a while.

>
> > Do you know if Linux intentionally skips disabling decode? Or is it a b=
ug?
>
> I think it's intentional. See https://gitlab.com/xen-project/xen/-/issues=
/197

Interesting. I seemed to recall some devices being able to decode their own=
 BAR
accesses. But I must've been wrong.

>
> >> +            }
> >> +        }
> >> +        else
> >> +            return;
> >>      }
> >> =20
> >> =20
> >> @@ -610,6 +647,10 @@ static void cf_check bar_write(
> >>      }
> >> =20
> >>      pci_conf_write32(pdev->sbdf, reg, val);
> >> +
> >> +    if ( reenable )
> >> +        /* Write-while-mapped: map the new BAR in p2m. OK to defer. *=
/
> >> +        modify_bars(pdev, cmd, false);
>
> This call to modify_bars() will raise a softirq for the map operation.

Ah, fair enough. I clearly didn't look closely enough.

Cheers,
Alejandro

