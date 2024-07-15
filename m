Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB69315D3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758891.1168419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLo5-00021t-2r; Mon, 15 Jul 2024 13:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758891.1168419; Mon, 15 Jul 2024 13:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLo5-0001zK-09; Mon, 15 Jul 2024 13:31:57 +0000
Received: by outflank-mailman (input) for mailman id 758891;
 Mon, 15 Jul 2024 13:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/7M=OP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sTLo3-0001z9-Ol
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:31:55 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9748887a-42ae-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 15:31:51 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso5265173a12.3; 
 Mon, 15 Jul 2024 06:31:50 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b268a271fsm3387617a12.78.2024.07.15.06.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:31:49 -0700 (PDT)
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
X-Inumbo-ID: 9748887a-42ae-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721050309; x=1721655109; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4xl7fTSuRDzF/uDlVK7TVXULDCM6JRV9CWT9g08FG3E=;
        b=OUwVJzu3yC6Jdf53PHfmW2n8rkd7JKcMY/l/XJbl+I6RGBXI1xJD+59a/hTuAVbFuR
         rI0n1zVORnO04AcirxhB4OGUcLuPU5g7RUhnfH1MkhL3VmwV5Tv1XGH7syuyM9AMAju5
         Ggn89p/WVlVv9ExI+x8n5WoipRJCvF/5UxT69zrGB4FYt3dRIz/iwWazTZrMxYqZK7Sd
         EqtKnWpjnNOft9fmWx0yVAPLyc25tGkbCxaGz2PTfh4CIxHkLM28CmF1pOMIJSofIvZK
         Kks2dB9c7SgR6/5A5Z6S/1HOtiFl5Z0ioQVNYil0nowXfuYgeuYbMCHqIGnNyqNDOzJE
         bC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050309; x=1721655109;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xl7fTSuRDzF/uDlVK7TVXULDCM6JRV9CWT9g08FG3E=;
        b=fWQ6RYi1r5pf+gmxkXVTjapyVcY9dvo5MsPbaoExYRFTsz5PzVRnJmenLi5ju7ihNT
         QN1TFFTwddaajSd3ytg8P78FbfViOIFmCG2POYwRYBnG9S3IB8VFnjw6/nn1cjGsNew8
         lnNWCISYopdDAofKEJL4zV9qhk2ub7UCh+mkWFF6mQZ5CB5uJmCaBu4GpWr7+197X4ZD
         aWm3DP2CyeVFhCge9tUtTTZzKg2v6hEFkMi6i32gWyzK4xuVxokE/F3NxJ6TY+W6xi1p
         sd/MI7+n632SvtvaPP/oDWUbqY6hItM5u8EeqFg+oBUcyO3EqgulzhGF2PIpBX9LkA01
         RG7g==
X-Forwarded-Encrypted: i=1; AJvYcCWu95+fncmRuNJnyhnlqwrdKJmSZTclsGvnoX2FIGb2OQznwan9DoBxwEFsSDHYnTCTfGqkLzi7U0FxUCq4PatYHqrCqEkRClf1LhPlD5VkfTI=
X-Gm-Message-State: AOJu0YwPrGFMtE7ZYmlsEmsLv7e1ygaZo7ylEEX/1gDbKDX9nu/Stlho
	NkucFQn/2QSOoEGRiIPcOUXxvWx7e6XOo8yfWbHgOmNFT541VSLDvh4JmfDN
X-Google-Smtp-Source: AGHT+IE0Mb27qv/iABdf3pajEE2HXmNtmggoR6AelExNcrDbdL53TQYYnBwfkNi9o92Q+8O6aasLEg==
X-Received: by 2002:a50:ed04:0:b0:58c:34cb:16ca with SMTP id 4fb4d7f45d1cf-594bc7c7e6cmr9957943a12.28.1721050309313;
        Mon, 15 Jul 2024 06:31:49 -0700 (PDT)
Message-ID: <2bb693bac4011fdd8d5526df38e7ebd39305dd68.camel@gmail.com>
Subject: Xen 4.19-rc3
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org
Date: Mon, 15 Jul 2024 15:31:48 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi all,

Xen 4.19-rc3 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.19.0-rc3

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.19.0-rc3/xen-4.19.0-rc3.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.19.0-rc3/xen-4.19.0-rc3.tar.=
gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Best regards,
 Oleksii

