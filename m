Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299527F72FD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:44:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640588.999015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Uak-0001Nn-61; Fri, 24 Nov 2023 11:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640588.999015; Fri, 24 Nov 2023 11:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Uak-0001JA-3N; Fri, 24 Nov 2023 11:43:26 +0000
Received: by outflank-mailman (input) for mailman id 640588;
 Fri, 24 Nov 2023 11:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duVF=HF=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1r6Uai-0001H6-V6
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:43:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aac8d173-8abe-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 12:43:21 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40b36339549so11424905e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 03:43:21 -0800 (PST)
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
X-Inumbo-ID: aac8d173-8abe-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700826200; x=1701431000; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfrB3biUnqKTE9rzNIaB9S0krvx419fPma1fwrnHOA8=;
        b=aD/yNoXaZdGuYBoOjlGrOGBOaZuFC6I57bMbJbtNw6BzNojPp0yPp34yQy1H/Ug1Ea
         YstRFPolUSFZMZsKSIzR0RSepAHJGrygmFonML0sceLJO59RpnGdZR5tadAVpcGaBzxa
         3oG3rvgObLsJ/vYJpJOje7ddmtE/ZYv9hkZBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700826200; x=1701431000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfrB3biUnqKTE9rzNIaB9S0krvx419fPma1fwrnHOA8=;
        b=Xls3CEkOczjomKCl5v+EteUk40rGW0i3jrt/BIzbw03UCj2hMyS1lv/S6N31Mnsf6A
         cOs09EuE03CwV19vYu6um0qJbs3mf3QTA5U3ZA6VC124l1RsZs7N3DyJvRX2BNosuyPP
         NaHyEaezk9EdX0khwYsh8eB/jOcUBb1X0X4Dvmsna+bjqC0fAagMHlIcqcAzhKGX41M4
         FhDKSn0WErOUx/iovvJtDfUThZawm79/wyAw/mjihMtYCGXGKBnsPeNtSXXkeqMsi50a
         U325ND3EWV6wD/S90EOsBYrLfWdgLSdRMPgBQk6CqoScdI18wzshBxRhCuibe2P8HG+a
         8e5g==
X-Gm-Message-State: AOJu0YxHJnL6+NdRZzLHaMZrma+fN2UvzX4HBsWiSsowFW3ChnZZch8K
	OeGbyh5nJsVHAjn45TAe/5ma/QNpq+196rDUHYwm
X-Google-Smtp-Source: AGHT+IHUcVQQ6wohs/QUxoX+U8k5mNx7cQcbmuzO97AUA7Az8YgABGgq7xJBoZtPyzmot4txTBRAjyEWcSER08LfN0Y=
X-Received: by 2002:a05:600c:9a2:b0:409:7900:f3d0 with SMTP id
 w34-20020a05600c09a200b004097900f3d0mr1971055wmp.34.1700826200510; Fri, 24
 Nov 2023 03:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20231123160535.18658-1-roger.pau@citrix.com> <20231123160535.18658-2-roger.pau@citrix.com>
In-Reply-To: <20231123160535.18658-2-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Fri, 24 Nov 2023 11:43:09 +0000
Message-ID: <CAG7k0EqQZLZDMMJg=20EgnKwhbXZ9US-9zMs0NkJD7eWYR2vtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] livepatch-build-tools: remove usage of gawk
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 4:08=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> And instead use plain awk.
>
> There's no need to use the --non-decimal-data option for gawk, since the
> numbers that we want to print are already prefixed with '0x', and so plai=
n awk
> will do the conversion from hexadecimal to decimal just fine.

I don't think that's true (at least with gnu awk 5.1.1):

$ echo '<e98b7>   DW_AT_byte_size   : 0x14' | awk '{printf("%d\n", $4)}'
0

Having said that, my version of readelf actually gives the value in
decimal so the patch still works. But is that the case for all
versions of readelf? I assume the code was written like that for a
reason...

Ross

