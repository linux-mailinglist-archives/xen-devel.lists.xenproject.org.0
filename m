Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4555AF5863
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031132.1404863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxMj-0002HH-Rb; Wed, 02 Jul 2025 13:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031132.1404863; Wed, 02 Jul 2025 13:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxMj-0002Fp-Ot; Wed, 02 Jul 2025 13:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1031132;
 Wed, 02 Jul 2025 13:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCPO=ZP=canonical.com=nick.rosbrook@srs-se1.protection.inumbo.net>)
 id 1uWxLZ-0001mM-4r
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:17:57 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6f1e27f-5746-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 15:17:55 +0200 (CEST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 667023F452
 for <xen-devel@lists.xenproject.org>; Wed,  2 Jul 2025 13:17:55 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso5150168a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 06:17:55 -0700 (PDT)
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
X-Inumbo-ID: f6f1e27f-5746-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751462275;
	bh=L2dNYcUrvaoQhhL9Z8RzTJ41BbPNvKIefzA/ihYBfdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hmbtL7O23hDe7gOqHHRovP8XsqdLdB4ATzRGhyDfm5Xu5L0OFmmXRJw+zwHE6uADj
	 cDJJ1+c4yrBMWvR4J7MFoBLd+Jkl3DlcfdVETnUlp3d5KNs7hkOqoz2thNoFHaQ4sG
	 phg5zY6eTm9j78ZLouMg0dhMBIH/HqDYnmhuOfYrZEsn4+NJ8Qr85my+KZd+j9IEpV
	 +nWI9rEN0zMY0PNAW15TbiM2vYeM9tL3gBTwnLiATl8Rta/RmdPfJgOVu4zA5VVcb+
	 vcUCRaq+x+aXLxfeCaVazmo3E3iuET5PkdNzO12AmZgLabfBI4bzB/ylisRrXJpQxM
	 Z0DJhadvTtP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462274; x=1752067074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2dNYcUrvaoQhhL9Z8RzTJ41BbPNvKIefzA/ihYBfdk=;
        b=tKZ6gyP+gKPunaRLFPl/m+dGL60PQIk3GRpyy8Cq1iLjfgwhaiUQra9J2AyILlaHwt
         fXuSMwxE8kVTFy4kENRgx7jT6BjkFI+ubt6fjfeRSWoVzlhZLo/zpfu1YLkKI3sC0GG4
         fADYtFbAFXDjGXKMsVo6VFFyYSjFQJQW1mu0ZMjxNUKhGV61gHtXYEzKvaqeE/ZTL5re
         c6LkrigYSNjdQ5apGQ845YfEotu7hpWhuzPqJ5Tek+ZsRUQ+vwNpaGKkfzCeOlvCnd2d
         O0/l++53MTvXBPbA1+vN/XyIB/x7r5cjUWXuFE8rpCt4CVZe2ZQbeMjCYk7W1r2E9lI2
         /qqg==
X-Gm-Message-State: AOJu0YyIxVaAdWcwnWqQzrbQGFfr8GfcpXu4qefCwtJ2aTj+we9D3Tsv
	6pV0a9NfNqSc+6gODSp+DE3HYspkjbuJCLPjW0YUOdNaelScEqnutLX5HEexRnv3E0xL+Fo2aS5
	memLiDNMT2ZPn2A2LowlnuGp9M8cvgp4qxPtOhDfLxxa3TFtEX1qY31ib+ZCnhYE9qiYKGX4W3S
	KQA9OAG/Z0vFxI+sAvwF/8zFSbXZUboRwgyaP5JvBAwMqdnWAfv1bIk8qui4Jz8MEknvedQg==
X-Gm-Gg: ASbGnctqKjAzTwmBvTjADP7MBCFUb6xqbG9f971oeZis7rUTJ3FdQddYTE5Rm31WTYq
	ReKOrQSXbBACJZEwjBHXvlJfeZsXDEVCBNn4bmIVWSiJ1iZnZfXfCy/aW79HH1WS+qoeUU1Gv5f
	yuAQ==
X-Received: by 2002:a17:90a:c105:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-31a90bf0b37mr4423779a91.24.1751462273922;
        Wed, 02 Jul 2025 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1d2YNsrPsuK8q1KVwwEPlnFGjigLz3kMtwF34t0VoyrMVcLajDj6AUXJ0Q1RnhoguuOf1/DO6xQultLychlo=
X-Received: by 2002:a17:90a:c105:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-31a90bf0b37mr4423724a91.24.1751462273544; Wed, 02 Jul 2025
 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250702095639.90927-1-roger.pau@citrix.com>
In-Reply-To: <20250702095639.90927-1-roger.pau@citrix.com>
From: Nick Rosbrook <nick.rosbrook@canonical.com>
Date: Wed, 2 Jul 2025 09:17:41 -0400
X-Gm-Features: Ac12FXxsTNPiYCwmlHJ_UkfsMF-_2mxcVwTiXSx2U3tO4R4qFmRcjl9Kdzt1t38
Message-ID: <CAEN5XSFx=vEnxeyCcmdK0bcST=H_S5QECvLCGOhMyhgLHiNgbA@mail.gmail.com>
Subject: Re: [PATCH] tools/golang: update auto-generated libxl based types
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:56=E2=80=AFAM Roger Pau Monne <roger.pau@citrix.co=
m> wrote:
>
> As a result of the addition of a new field in libxl domain build info
> structure the golang types need to be regnerated, this was missing as par=
t
> of 22650d6054.
>
> Regenerate the headers now.
>
> Reported-by: Juergen Gross <jgross@suse.com>
> Fixes: 22650d605462 ('x86/hvmloader: select xen platform pci MMIO BAR UC =
or WB MTRR cache attribute')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Nick Rosbrook <enr0n@ubuntu.com>

