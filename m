Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C592CAFA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 08:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756557.1165214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRQk1-0006rB-H4; Wed, 10 Jul 2024 06:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756557.1165214; Wed, 10 Jul 2024 06:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRQk1-0006ph-EM; Wed, 10 Jul 2024 06:23:49 +0000
Received: by outflank-mailman (input) for mailman id 756557;
 Wed, 10 Jul 2024 06:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ft4p=OK=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1sRQk0-0006pb-D2
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 06:23:48 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6f557a6-3e84-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 08:23:47 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52e9ebb9cbaso742424e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 23:23:47 -0700 (PDT)
Received: from [127.0.0.1] (87-52-80-167-dynamic.dk.customer.tdc.net.
 [87.52.80.167]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb90670b6sm463892e87.197.2024.07.09.23.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 23:23:46 -0700 (PDT)
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
X-Inumbo-ID: f6f557a6-3e84-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720592627; x=1721197427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peZsNPj1BNH4twyiHnIZz89+5SLDTDtVFfp9lmKUxv4=;
        b=ue2/pMdW59XjNd0CBG23c8gNKU2W13V8ZcO5mcqc6D6bMh4CRXxe4FatCsXHfexhWo
         s4IAY/0jn1DDs8+PHFoUBRco9t6PclorIo1l5feA4jlUeGJZOPZIVQ3mx0njQ5G/JkFu
         z9zEPDyrOAJSVuDxwNjj+bWtkbMuEWcrw2aKugZbV5er+0GcjSQRJ1eaoCFKCp1YJQqr
         xxDbagWqKNxMcK7vQ+XXAhRjpgaLfdQGDcHDexnTriY2yZlfQ2nKr0f7ZNJZR0ZuHgJC
         2Q1000qWlrlKpuRjsS3Y+50EH5BVL9+xxO4rDS7Usmaq89aoFCavrjHJsWWSL71tV+Ju
         hBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592627; x=1721197427;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peZsNPj1BNH4twyiHnIZz89+5SLDTDtVFfp9lmKUxv4=;
        b=Q1rBMXJmAq3Ot9OuaXbDKHfI7StyZxJo6Rzyb/v/oCH20BcaSS1GsYX0gZRX8u82x5
         VvY7/LgpORX13lx/P297S5sucEfbU8OODjqoTcBZjvxIAwJ5Qbxo4ZpXRXwy8MFg3CLH
         KDtP/IwT79wgJxYgzjbe0YwrbM4saAuk2Bu0Rbc4oiAin/QUANHdtgX8Onb38fWQ+PkD
         NcoQgOBpDzmv1Hi/ICMBusTKnhGrsgTmOX31kzZowEXAMTXl4Ltudjrq0YHW9yEFt50s
         xmXsBb1zIRKZUQZemPNQMC7SutYcRnN3nIzw5pBUglWiIJogR6KwvTQkj5b+8EMzJUxA
         SikA==
X-Gm-Message-State: AOJu0Yw5+R8CJhrBBvfLHRkBSZ461NVVaL5JHljKo/q/76mXQn1Uqqp0
	PEAbQDUr2hcGhV1RWHxCgSI7jKiH6gbJcXtYdd32xkkV/A6Qun1VWO/rW0snf+o=
X-Google-Smtp-Source: AGHT+IH5aoFqMDetAj6DeM6xs7OgL2qyb/6WTEb5Xw8gbWI7SvdV3F54U25nwN6xMLvlPI5WP9QFwA==
X-Received: by 2002:a05:6512:3d8e:b0:52c:f533:1e21 with SMTP id 2adb3069b0e04-52eb97586acmr3136252e87.0.1720592626693;
        Tue, 09 Jul 2024 23:23:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-block-xen-blkback-v1-1-6ff5b58bdee1@quicinc.com>
References: <20240602-md-block-xen-blkback-v1-1-6ff5b58bdee1@quicinc.com>
Subject: Re: [PATCH] xen/blkback: add missing MODULE_DESCRIPTION() macro
Message-Id: <172059262581.380385.3520658420031785227.b4-ty@kernel.dk>
Date: Wed, 10 Jul 2024 00:23:45 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sun, 02 Jun 2024 17:37:28 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/xen-blkback/xen-blkback.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied, thanks!

[1/1] xen/blkback: add missing MODULE_DESCRIPTION() macro
      commit: 4c33e39f6201ab130719d44d6f6f25ec02e1b306

Best regards,
-- 
Jens Axboe




