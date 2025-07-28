Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD34B14067
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 18:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061765.1427352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQpI-0008Rz-Ct; Mon, 28 Jul 2025 16:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061765.1427352; Mon, 28 Jul 2025 16:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugQpI-0008PK-A4; Mon, 28 Jul 2025 16:35:48 +0000
Received: by outflank-mailman (input) for mailman id 1061765;
 Mon, 28 Jul 2025 16:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYbC=2J=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ugQpH-0008PE-68
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 16:35:47 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8caf78e-6bd0-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 18:35:46 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-60402c94319so2381655eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 09:35:45 -0700 (PDT)
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
X-Inumbo-ID: e8caf78e-6bd0-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753720544; x=1754325344; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYLqy6kJ3QYDs7hk3+pODY+/HAoKckG+3PlWNXU2EDg=;
        b=dTr30bW4wmuvDBwNqPh6QYI5KJBgOuri6Z03I++w0sTuwWtyY8vjpQbNPoGSfhT5lm
         x3Tms0kcF2xQjvM9cLKJJ+F0zLsRSEquoXsYlnJ7dkTRjM5rp9HfA5rw2hUU+TQSIBCi
         644TDvZNyliRsixM57Gduzji7DmIk7jYdqoYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753720544; x=1754325344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYLqy6kJ3QYDs7hk3+pODY+/HAoKckG+3PlWNXU2EDg=;
        b=PzqqdLt+6vpRRUeUquKbheOzNDqI0Sqsg8UNdaXHhTMODRhPVsHiXOZQbLS11FhDQE
         H6Q97V3tA8nU2ltcDmr5gsHEremIfIohSG1FZ9szEcBa71clLHjKGLxrgYGcuQ+b0jUw
         rTTxcC9mh1wckyDemdQqCIb7qernSma87FmmA2aDJOLmNqLyLmV9QvyuT43X1SV6iqOj
         MSAMPUSMw8FyOfsCeeY0K8LBJ+fZ9yt9jSKS62fJbc4i7m5lKwSjaFBTLuRFyvHR+7BU
         9F/yRolzWYFhVwRVUFY/okxtN3sbJGAiio3cyR/umsS/FOVjSMCCsCgB0ZEJw8aHSxWw
         0I/A==
X-Gm-Message-State: AOJu0Ywzw/CtsHHN7hFLlqnZF5ue2VZZyo9MbW6+dGhhRnr8gf6pdWum
	OTG/O8nva87ErcLLBlkS6UNUiL6/JfZdAFGGRKd85e2fa+OCWOXa/xQNvDrB5wu7opLulJn+qwl
	zTWGPtRP1VD6pbR4x4DBLX4bmTqSay1CeOh5YPaEP
X-Gm-Gg: ASbGncvWTYolvM19KP+74abOybh6WU+gF8Xl4RlLOMONIRDY0zaisow8sKHWCD5ikI8
	ZkD3EDCHIHW5qqMUyhJ+mO4EcnO8Z9ZYrAHJl2vxnq65a4TuT7QE4/KpbfI5c5jJElh/RcTwIGI
	aQEqS26Efm2xvhnShlBbhMeW2zCcC/5JOxPGeqgonPKK+CBilsRcu3ji495/4BPdoSq6VwK9vmX
	KfadQ==
X-Google-Smtp-Source: AGHT+IE3A4u2xBqCn8FjUuNSoabWvOnqMHCzwIZ70M5W1NqUyoF5hUjwHq9NZHRcnnTPQ5eQ/40xnnveCWE7YUHfWi4=
X-Received: by 2002:a05:6820:4dc3:b0:615:ecc5:c07b with SMTP id
 006d021491bc7-6190c6ed03fmr5943973eaf.0.1753720544443; Mon, 28 Jul 2025
 09:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250724125950.31849-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250724125950.31849-1-frediano.ziglio@cloud.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 28 Jul 2025 17:35:31 +0100
X-Gm-Features: Ac12FXwsGnDwpWUeuhaW3PeVMOvkdqYyJ2anG3nywow-9XD4iODCOTezXGSkv4E
Message-ID: <CAG7k0EpJVAfaNFq7RO2zCNajk9Dn_5YRwcvf=KoWkKg6mfHdVQ@mail.gmail.com>
Subject: Re: [PATCH livepatch-build-tools] livepatch-build: allow different
 build ID length
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 1:59=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> The size of the build ID for a PE file can be different from
> ELF one, specifically 16 bytes instead of 20.
> Allows to embed arbitrary build ID lengths.
> The Xen ABI for retrieving the build ID allows arbitrary
> lengths too (for instance see "xl info").
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

