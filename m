Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351C67825A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483136.749111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK07K-0001nx-VD; Mon, 23 Jan 2023 16:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483136.749111; Mon, 23 Jan 2023 16:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK07K-0001lV-Ri; Mon, 23 Jan 2023 16:56:22 +0000
Received: by outflank-mailman (input) for mailman id 483136;
 Mon, 23 Jan 2023 16:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pK07J-0001Uj-LH
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:56:21 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc7c58b3-9b3e-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 17:56:20 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id g10so9558430wmo.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 08:56:20 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 fc17-20020a05600c525100b003db1d9553e7sm12419990wmb.32.2023.01.23.08.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 08:56:20 -0800 (PST)
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
X-Inumbo-ID: dc7c58b3-9b3e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OLPiIGqZ1pWrMRYCqpLN8WCCbMOzk8Ez8Nscxlk4waI=;
        b=YwUjyQCzePObmOfPpq4HR8/vXIiXWKHdOJuYeAJfbtakR7aqfx7z4wvTBL0nrPo6Nh
         soXvwg44Zv2pvOd5WNLfG/scG+fqmFNfupOC7aw5rUzLuvUs6bLHMt7OA7m2vgz4aZ3W
         uhpat5VF9sKj/7EKGUWr1sBD4rY1HH7mXbIXKL6hWO0WTZ6g2NzoB3CVWoZ1uN86vJga
         pCI1X5UEeJ/ojTn2YV+rLW2+wkrmo913P83zeOyEhYG3C/HWPSFKZ1ONC/Lx9UJq1UG3
         wZmjoA0QXGdDc857bJOFcFIPKV/rjseVf3BsJGustSPX6omVntrKMlJvsDRGkzEtQDBz
         52dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLPiIGqZ1pWrMRYCqpLN8WCCbMOzk8Ez8Nscxlk4waI=;
        b=hukF0haVEkbCazFLT0//3P/eHvExtG/AD4q4wqHmwskjXTUdXSO5KcWVsUnqEF1+CI
         tfel2kk/1fr9RbR8+lcreLCHjz2NdNHU4soXODiSW+iGbxbHxyaS6qoukKui8CX+M9gq
         nKTWW0UoH8KITfU/8GeY/+csSuUNvWdrG5ZaagSIrNJJS8gSkPg2WFy8DVBIlqr83wfc
         1oL0a5Ke+XiYVaut5ilRW+6ATmw6cpJ4GodH4qKhD54RpZv8L0mMbt1JWJ5kDRR6CccR
         O+KAUhAarLio6/0GMEnVYPPkYtSoQTPVCbis8sdkIDQrpfEImrQuPuCJMn5MomYkABkc
         hfWw==
X-Gm-Message-State: AFqh2kp+ezgQuvXCB2zO0FdYnSAxNZB43pQ/PcDsnTOUXNlJnbG9/6t7
	XN6OsGmIIygkMV/+/qrFE3Q=
X-Google-Smtp-Source: AMrXdXt1erXP/MU2EGAfeExoiz8uLcep+82Lj6Uh3s7Gi0MvEWA2iTuw25hb9/6V6hR47rF/TfO0rQ==
X-Received: by 2002:a7b:c5cb:0:b0:3d3:4f99:bb32 with SMTP id n11-20020a7bc5cb000000b003d34f99bb32mr23611659wmk.36.1674492980339;
        Mon, 23 Jan 2023 08:56:20 -0800 (PST)
Message-ID: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
Subject: [RISC-V] Switch  to H-mode
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, 
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 23 Jan 2023 18:56:19 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Alistair and community,

I am working on RISC-V support upstream for Xen based on your and Bobby
patches.

Adding the RISC-V support I realized that Xen is ran in S-mode. Output
of OpenSBI:
    ...
    Domain0 Next Mode         : S-mode
    ...
So the first my question is shouldn't it be in H-mode?

If I am right than it looks like we have to do a patch to OpenSBI to
add support of H-mode as it is not supported now:
[1]
https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_domai=
n.c#L380
[2]
https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/riscv=
_encoding.h#L110
Please correct me if I am wrong.

The other option I see is to switch to H-mode in U-boot as I understand
the classical boot flow is:
    OpenSBI -> U-boot -> Xen -> Domain{0,...}
If it is at all possible since U-boot will be in S mode after OpenSBI.

Thanks in advance.

~ Oleksii

