Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A87E8A34
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 11:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630926.984080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1lBg-00037a-0g; Sat, 11 Nov 2023 10:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630926.984080; Sat, 11 Nov 2023 10:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1lBf-00034y-Tv; Sat, 11 Nov 2023 10:25:59 +0000
Received: by outflank-mailman (input) for mailman id 630926;
 Sat, 11 Nov 2023 10:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myXE=GY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1lBe-00034o-NF
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 10:25:58 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b31ba5da-807c-11ee-9b0e-b553b5be7939;
 Sat, 11 Nov 2023 11:25:56 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9dd3f4a0f5aso454771666b.1
 for <xen-devel@lists.xenproject.org>; Sat, 11 Nov 2023 02:25:56 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 uz4-20020a170907118400b0099290e2c163sm838644ejb.204.2023.11.11.02.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:25:54 -0800 (PST)
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
X-Inumbo-ID: b31ba5da-807c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699698355; x=1700303155; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9nFw4vByno42rpl+iWpdPWrnlzh718eU956fTv/JX74=;
        b=MjxP9yHfC90qk6GUL1XJm735lwMQkrG/ELnJHs4ae5Qyj2VQqNrvx5T9Jp+LRJf2XY
         93XWYPY34ktwLPNypXjDhxz0DUYJuDCMpT1Wq52LkWovGxuUYs+jR1m3V/9fIP6DxzQF
         awfgSNhrnQZyqseDFgs7CK96C25A4meGIuUyTT1Lwo+Y4Iuxh5eXQ+4qcM08PksMHgJK
         W3A8O+oejwochCDFXjHeWqUbjaCco1Rx4amnhQsgBpEmlY9aagTLdmdBYjN9tdmR1k9H
         iFuWAUuZ+ozVWRV1BgWof6WFwpbtnt/IOVGaQQQJU0tuu2Xbc+fejxT/Aus7Un/1eJq4
         ZgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699698355; x=1700303155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nFw4vByno42rpl+iWpdPWrnlzh718eU956fTv/JX74=;
        b=czP+268T5QJGP2FLRFf14A5csbSJWI7O7LDzxxO/Cb2iOVg7ekw2WWypVA9VzL8La+
         aY7X9NEDPlXjna5EYklBHxMs0zJs4+auFUBXCe6Pm9UWYP6tKoL12//InrGwzzQI4ytD
         peK2/BiVYNlnXgtrvr8/DcYm8jo5rxiumjC6XePF6uBTMT18xBSBKEtrY+d2yiDEoNka
         5dioBmC67/eqTLo5ss6GWfpG55ZttzWqMm46+FPhzQbK43UzkDkD8IXYYZ/oOLEAHUem
         nosKcmhaQ1dkgXRcafm1bfvezVq7Gcj/xVlS0jQueYqbgl2GnIdJanH6bapIm9yrvoUR
         awmw==
X-Gm-Message-State: AOJu0YxoZDCObGPoyx2CoXjNxj3tW+Q1ehLZA+AH3yy1tWR8QBMDD4M/
	dWVLrnf+vjVA+PXc5UHxdtbmlFoLLfQ=
X-Google-Smtp-Source: AGHT+IHUa7xdR+1TgiGjrnSzQ/E4ca4uZqBA8nq998RSk6tXrKHirkZkq69hvboPXHND0rW4SQ49eQ==
X-Received: by 2002:a17:906:1d0b:b0:9df:2fb1:1a83 with SMTP id n11-20020a1709061d0b00b009df2fb11a83mr1047225ejh.39.1699698355128;
        Sat, 11 Nov 2023 02:25:55 -0800 (PST)
Message-ID: <928557f8d62941a2524fc67b7067a777e2180db2.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>
Date: Sat, 11 Nov 2023 12:25:53 +0200
In-Reply-To: <cd1341ae337fc9a1619d747b3db1a7a5cd6ad2fb.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <cd1341ae337fc9a1619d747b3db1a7a5cd6ad2fb.1699633310.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

I missed to check the patch properly.

The patch fails for Arm randconfigs:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1068865674

I need to do an additional investigation.

Does it make sense to re-send this patch separately out of this patch
series?

~ Oleksii

On Fri, 2023-11-10 at 18:30 +0200, Oleksii Kurochko wrote:
> Ifdefing inclusion of <asm/grant_table.h> allows to avoid
> generation of empty <asm/grant_table.h> for cases when
> CONFIG_GRANT_TABLE is not enabled.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- ifdef inclusion of asm/=
grant_table.h in xen/grant_table.h
> to avoid
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generation of empt=
y headers for PPC and RISC-V archs.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update commit message
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- add Suggested-by: Jan B=
eulich <jbeulich@suse.com>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- Remove provided before =
asm-generic/grant_table.h header.
> ---
> =C2=A0xen/include/xen/grant_table.h | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/xen/include/xen/grant_table.h
> b/xen/include/xen/grant_table.h
> index 85fe6b7b5e..50edfecfb6 100644
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -26,7 +26,10 @@
> =C2=A0#include <xen/mm-frame.h>
> =C2=A0#include <xen/rwlock.h>
> =C2=A0#include <public/grant_table.h>
> +
> +#ifdef CONFIG_GRANT_TABLE
> =C2=A0#include <asm/grant_table.h>
> +#endif
> =C2=A0
> =C2=A0struct grant_table;
> =C2=A0


