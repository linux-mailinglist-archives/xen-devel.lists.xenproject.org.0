Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59527A06082
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867638.1279207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVYFN-0001SV-Ad; Wed, 08 Jan 2025 15:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867638.1279207; Wed, 08 Jan 2025 15:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVYFN-0001Q0-6y; Wed, 08 Jan 2025 15:45:29 +0000
Received: by outflank-mailman (input) for mailman id 867638;
 Wed, 08 Jan 2025 15:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVYFL-0001Ps-Ib
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:45:27 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94809e06-cdd7-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:45:26 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso12862993f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:45:26 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f60asm2543024266b.28.2025.01.08.07.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 07:45:25 -0800 (PST)
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
X-Inumbo-ID: 94809e06-cdd7-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736351126; x=1736955926; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAjEOfBmhiiE2DME1yP7kSdCmLUdBEtt2iyEXv5G4rY=;
        b=gIw54+aKuA7PdmmY0h/PbE/PnqlXMMgd2GK+fgoRQHylwX6CPpQsyp1mFG+zrVN19O
         eN2QN4z7rLv+d6idYH3iq5/mhX3GGpezkjT3BnnoctjoZab78PYODOF6gUB7TpjAUzG8
         6GQLDQBkQN4UInFQe7JtQBOhK1Y1QXaROkh3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736351126; x=1736955926;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SAjEOfBmhiiE2DME1yP7kSdCmLUdBEtt2iyEXv5G4rY=;
        b=Guf4PNz+LF9/vlkDIkPEDRsVRa44t1x2W6lOuj3npr+w+MAEA92MNO11UjmjQE2+Bi
         A3EajcwuqqTH3G2tOETSjQiIp1o3NHkTsbipjgH3HSOJiAcUgoWnDRCaNB6+RIF+WvUf
         aS4ySAfnvjBqh4JdyQlzXAyEHyylz+D14fvF2isSjhGsnEIU/qnCwD5w6ILocBZuuplM
         jJvqTrx+qscd49hxPiEhtVrz/gSxic9x3ZrAMRCeAZ8+5oJjcjPssrbSA7t2cIEN982N
         7j574it46TCKqGGyOxTKpWhPIApEE2WDjOChOX6MVK99lHXXquld6oRwJM4w+4PMBLx3
         qW/g==
X-Forwarded-Encrypted: i=1; AJvYcCW29IlnnFE1cuYo1Yn8XfXVAYZr5jonx9XDxUYlEZUzByW64Asig7T8A2x2FeHg89b9FrHZnNa/Qww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ69vPFcus5wqk1P0yxs6u/Xxv17Nmc49FA7DV7vLQtjc/IUiv
	iDJUBdtpR4+bRbUYgtmK5gWoZ7VA0dirNVWYs4OWLmOBjxi9SQMKvD2nNBQqIB0=
X-Gm-Gg: ASbGncvpyu/9o8pHKIUoAQ+aul+2KztRgNud0booQMPcqo2AYiC4trIlW/tw/T256m8
	ELHYRCkpUMvtURi2Vdp9tRmfDLoxBtpgdmM04dKM2EEEmUt3zO7JVhpV6DJm4dIVdV5Akkpiv6K
	CteUm/T/e3HcDd/kTHS+MLK7Nmj8alRhJWwlhDfiu+6V/O30iZPQl8pV6PpdrPlIfAH9uzXCHHw
	0cfykK+Mh9vS+B5w/8ltgrX5Oz6EOiMqx3OkosEG+YKmoStiFdm9/eRQNY8fmQ=
X-Google-Smtp-Source: AGHT+IG+sQEDWfRAZQ0YkfEs6FPvhz9Lib6SrkoSA6TTOxncQgdbKzbr1Q9CTmuC4dguJPdeFirCbQ==
X-Received: by 2002:a05:6000:1447:b0:385:fb34:d5a0 with SMTP id ffacd0b85a97d-38a8731f4fcmr2930660f8f.29.1736351126074;
        Wed, 08 Jan 2025 07:45:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 15:45:24 +0000
Message-Id: <D6WT3QSKXNG4.162UPSGMQ1ZIS@cloud.com>
Cc: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>, "Bertrand Marquis"
 <bertrand.marquis@arm.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Julien Grall" <julien@xen.org>, "Michal Orzel" <michal.orzel@amd.com>,
 "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/arm: ffa: fix build with clang
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Stewart Hildebrand" <stewart.hildebrand@amd.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108152317.335441-1-stewart.hildebrand@amd.com>
In-Reply-To: <20250108152317.335441-1-stewart.hildebrand@amd.com>

Hi,

On Wed Jan 8, 2025 at 3:23 PM GMT, Stewart Hildebrand wrote:
> Clang 16 reports:
>
> In file included from arch/arm/tee/ffa.c:72:
> arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a n=
on-definition declaration [-Werror,-Wignored-attributes]
> extern uint32_t __ro_after_init ffa_fw_version;
>                 ^
>
> Remove the attribute from the header to resolve this. The attribute in
> ffa.c is the one the matters anyway.
>
> Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> It appears the variable ffa_fw_version is only used in ffa.c. Was there
> any rationale for exporting the symbol in 2f9f240a5e87 ("xen/arm: ffa:
> Fine granular call support")? If not, perhaps we ought to make it static
> again and remove the declaration in the header.

The only reason I can think of is wanting to have it in the symbol table of=
 the
ELF file for some reason (livepatching?). But that's far fetched at best.

> ---
>  xen/arch/arm/tee/ffa_private.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index d441c0ca5598..05368d5a88d3 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -326,7 +326,7 @@ extern void *ffa_rx;
>  extern void *ffa_tx;
>  extern spinlock_t ffa_rx_buffer_lock;
>  extern spinlock_t ffa_tx_buffer_lock;
> -extern uint32_t __ro_after_init ffa_fw_version;
> +extern uint32_t ffa_fw_version;
>  extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> =20
>  bool ffa_shm_domain_destroy(struct domain *d);
>
> base-commit: 70f5a875becc9444a959830b10a361982c31a366

IMO, it makes sense to make it static and remove this line altogether as yo=
u
suggest. If it needs to be exported later on it can be adjusted as needed.

Cheers,
Alejandro

