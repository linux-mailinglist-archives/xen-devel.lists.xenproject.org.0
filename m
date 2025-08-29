Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FEB3B648
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 10:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100879.1454149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urumM-0002ik-QE; Fri, 29 Aug 2025 08:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100879.1454149; Fri, 29 Aug 2025 08:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urumM-0002gi-NX; Fri, 29 Aug 2025 08:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1100879;
 Fri, 29 Aug 2025 08:48:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7Ro=3J=cloud.com=mark.syms@srs-se1.protection.inumbo.net>)
 id 1urumL-0002gc-9q
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 08:48:13 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4541b52-84b4-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 10:48:11 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afebe21a1a3so311309566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 01:48:10 -0700 (PDT)
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
X-Inumbo-ID: e4541b52-84b4-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1756457290; x=1757062090; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wR86rOeovbcehjRsjPioiloHDl9UqjtMkmefBWaXrU=;
        b=BSP8sq+qJrMVa9AdUDEOUWHSatXLxJcLtUT1LdygjQiQHdDfZcDI7bKO/nlvM9w5k/
         r71z58cuQMAfe6vCaKLSvNQRcSH1sOXmPXhSeKl4YqABYRq0KxEtcFU2Eqx2XZ+8DkdT
         MS/ZBvGNSYA8QLlGGSaTAYg+fl+L5b855qul8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457290; x=1757062090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wR86rOeovbcehjRsjPioiloHDl9UqjtMkmefBWaXrU=;
        b=uvQEzg4wpij3haVHBu3qKPJcBaMXq/6QHJoP9YuzPC4a56uOZQeTO+ywr5zKxKTo7o
         1SqtUKXPlXdXE8KKJ+exjfeylDQwiNSNdGWFAWW1MH2il9IWWwKXwNIDcWRtbgj4ObND
         0oaXEzdCEP2wEPv85XeuJWKcFNknYP3YCgms/7XySgYN7EdLFDv139DJEn4MFHW6s3uo
         4MiF0dvE4FlwiFUCi2Gs9mph4XWVbZci0Zqpz75wNUrsCUQ/LP6AnaOgDvz9CZR/T3xg
         sHo25aBNBXL/72rxwynWd2wX3dcaI/HExdIIuKTeRRVWhM8nh4GVhb2bn5J0+nIgTWzD
         Ok5A==
X-Forwarded-Encrypted: i=1; AJvYcCWtA2p2kTKwS7OWSz9QpwiQLCHIIEVHA+MF9AXMlidlvDpOWm0H3UjAdCccptzU09rMivvrlJdiw+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPSRW4w7qEMDSw9ErSORnDoc6sR50r2r9nFe/vMuwDtzR0QVb5
	Xr5/ZRgYylG7jmtrBma5NaT0CuLKBp/AfrIVa2G1FjCmFNbLUudmsX+uiEdUFdsSuqTNY621gmb
	HSwBlXrEQ+kV4XEdTp32YFCnQbu9c0EFPppZGw2kQN3LIgl5k+9UoL/U=
X-Gm-Gg: ASbGncsbIstn2GaY/Yqi0Lb1inK2xkKtcvBEhOPi5u/x8kBoJ+Y3jeYEOP4QZAweb2R
	uY/GzDAjBd/bckBFCSkGE5Po46AKlHa2+EjOSROFSaHV30Q+S5iV0BknMKrD11d0Z1xBU0hdwJ3
	xmrw9nre1I4jAURUz5Pu5SW+VOO6MHxfC6pp1fuQ3HQAZVS10b6lH3disfTyL0CLwqwPJ+Ky3rH
	ehmq5MyqDtZVDgdfsw=
X-Google-Smtp-Source: AGHT+IFnYmLPFs8b90UDmuWXrBJG3qnSC/RPieImWqQ3J5srYn4cU8bHIaHq1DvGA5C9/a+UlPVQ1gOZmAUC1jWBwN4=
X-Received: by 2002:a17:906:c104:b0:afe:82d3:4499 with SMTP id
 a640c23a62f3a-afeafec64c5mr1088112266b.25.1756457290283; Fri, 29 Aug 2025
 01:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250828093821.372024-1-mark.syms@cloud.com> <aLFZrnHpul61b-5E@Mac.lan>
In-Reply-To: <aLFZrnHpul61b-5E@Mac.lan>
From: Mark Syms <mark.syms@cloud.com>
Date: Fri, 29 Aug 2025 09:47:57 +0100
X-Gm-Features: Ac12FXwiyXFqkPvlUh7iebr9fijXTflgdDtFwPAnBLxwdVeDAbYg62tr2IB6wdQ
Message-ID: <CAPYKksWZGnYSGyzgHVoOzVZAVWP4YPa8DEm7GEjAYHwDWTmovQ@mail.gmail.com>
Subject: Re: [PATCH] Clarify the cases where BLKIF_RSP_EOPNOTSUPP can be returned.
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Aug 2025 at 08:41, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
> I think there's no need to mention the specific operations. FWIW,
> blkback will return BLKIF_RSP_EOPNOTSUPP for any request type it
> doesn't understand (see dispatch_other_io()), which covers any
> possible request type that's not yet defined:
>
> /* Operation not supported. */
> #define BLKIF_RSP_EOPNOTSUPP  -2
>
> Should be fine.

OK, I'll reduce that comment to the minimum then, I was just trying to
be helpful to future us :)

