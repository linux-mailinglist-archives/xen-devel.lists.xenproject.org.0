Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891D7E2028
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627934.978857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxwb-00064T-Im; Mon, 06 Nov 2023 11:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627934.978857; Mon, 06 Nov 2023 11:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxwb-00062W-Fd; Mon, 06 Nov 2023 11:39:01 +0000
Received: by outflank-mailman (input) for mailman id 627934;
 Mon, 06 Nov 2023 11:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wfGl=GT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qzxwa-00062Q-1A
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:39:00 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 132facad-7c99-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 12:38:58 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50931355d48so5800144e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 03:38:58 -0800 (PST)
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
X-Inumbo-ID: 132facad-7c99-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699270738; x=1699875538; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIQKgSzgwbku1JPn/gvo5ekb9GLKzMwMF5PjP2lXSxo=;
        b=Fhth9GF1Fiml1025U+7ByGxqT0kpjnTSYo3yq4HIFP0T4XM+GR5wvNSgxZ23T/NuIL
         48fxWsetsKbizYsxfs6is3OxhU8ChTzdSNYk9hSOTvmKXIceGnYPLDuwyLlYC9a03BBF
         H4nVZvhUhzqVf0MlqDJPJr9jSFcLa1GMcBR3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270738; x=1699875538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIQKgSzgwbku1JPn/gvo5ekb9GLKzMwMF5PjP2lXSxo=;
        b=NhoigaubSDbsWTP42JpYrA0dpLIjKkqrxCZD0jwHAN7TjgGciyC2tpYzHa2GKxae/Z
         qQbJat4dIGQBDGUsYR0+8647MetGPxFQz8zq+czwUIPLcL/Vthw8Eqa/svoUGK9I4Kmu
         LoS5pK7KQf5zivVbey5rZEkjkMFUPHiIRQxteeOG1t8A6Ei2xfK813l+m0DPWX/WRQc0
         7+ICV/TUfX3e6wrelo9IuL8nuMJOTr9avHVGRJy5yTARJ//6MMNa2DdPKDj74Shbz/T7
         BWOgjH+EKymxqGYKxFLECX7RUKZk29heHW5IncP6zoVFtC1htCFjG9pGZohMJ1JSH3jL
         JNMA==
X-Gm-Message-State: AOJu0Ywd61mBXDqeIGdJtY0hjp8fLzf/qgHYh+KEVoLLZgyiRgqvlH2e
	pSTVS3y+Zb5pSrsOE7rFS2rlOMsyayAnyWkG9aKeVw==
X-Google-Smtp-Source: AGHT+IG7Oqnsnn4fR5WLixXNZL+Dp3LkmTEIqoDua1cMcKer/gD/9lLY47dlnFPYR53nMWMSloXO66U5uTVka1Nv2aQ=
X-Received: by 2002:a05:6512:114b:b0:507:9ae6:6913 with SMTP id
 m11-20020a056512114b00b005079ae66913mr27173892lfg.28.1699270738444; Mon, 06
 Nov 2023 03:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20231103194551.64448-1-jandryuk@gmail.com> <20231103194551.64448-2-jandryuk@gmail.com>
In-Reply-To: <20231103194551.64448-2-jandryuk@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 6 Nov 2023 11:38:47 +0000
Message-ID: <CA+zSX=aL0npFkNbTVV8Br2e=0nQrCau13GWpA9=SBcujx7838A@mail.gmail.com>
Subject: Re: [PATCH for-4.18 1/2] golang: Fixup binding for Arm FF-A
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 7:46=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com> w=
rote:
>
> The new FF-A TEE type changed the go bindings.  Update them.
>
> Fixes: 8abdd8d52862 ("tools: add Arm FF-A mediator")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

