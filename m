Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330588ADF98
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710377.1109552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBN9-00014M-QP; Tue, 23 Apr 2024 08:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710377.1109552; Tue, 23 Apr 2024 08:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBN9-00011A-LS; Tue, 23 Apr 2024 08:19:27 +0000
Received: by outflank-mailman (input) for mailman id 710377;
 Tue, 23 Apr 2024 08:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nc7B=L4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzBN8-000114-WA
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:19:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3271364b-014a-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 10:19:25 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41a4f291f9dso14418305e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 01:19:25 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b00418a386c17bsm23049771wmq.12.2024.04.23.01.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 01:19:24 -0700 (PDT)
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
X-Inumbo-ID: 3271364b-014a-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713860365; x=1714465165; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mghPUcwmidzZd+YsEtASL+rkxp1mbAIVaNehj1oIds=;
        b=baLm68iVeP3tzpb8GaqZnEh87W2V7Bk/peS7BAFPB6N5xBPeNjy3uSpKH5Ze/YeiWu
         WzQTakwZPMbphiisI2ng4WxCAljgTFiZP260uz2TPDfB/ho4I3AVb3+3yOnevL47dzK8
         WeXwVrxi+lSNjj/Fsut1j5IUxfiXepFcXirdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713860365; x=1714465165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mghPUcwmidzZd+YsEtASL+rkxp1mbAIVaNehj1oIds=;
        b=eW+K2U17HL5ejG1NQhC4i6MTaRIc0rtddavPobJXCnXdrnwbD9DlJ8qeH6ln9GeFRM
         x3rgG4SdY8lXfe0fxOQ2Qv495bnda9c6X3yD3rWjS10j6wSed4Zz1SM++cojsSnJdxLH
         DohPX2c3SpUiTvHk7cRniV9fLtFKdA7Q0qzHog03dUzOM9GarOs5iT4WpaDFYw4Ie1TF
         G/Z4rl2AYwGIWgp/b4P85lD4XIag1wlRF5Kl+sfs/u8oNxSs1GiQtnlPpRwcFGs9G45h
         DDcgSxMB3K1LHFR3KCJC1ttpR2sp3FiUkeTlXj5vRz5wn69l3qfo2wEJUTxq4pTRW1UM
         P5JQ==
X-Gm-Message-State: AOJu0Yx0C1MKPpTXFzQwKaYV2qJkusejXMRLaqwyLi+2fMOzqFP+iHNY
	ePH24gKgWkxRlb2fhrOkhM5o7Dl3umG+aEY7UzHpyfaTG+suPHWX/O0LSbupSKk=
X-Google-Smtp-Source: AGHT+IH4f7+cZ7JoWdOEMSGpcuTSpvPGfPY16rVv32A1blrBxArW5okv8dN7ey9ycODDxbuDVcopyA==
X-Received: by 2002:a05:600c:190e:b0:418:d91b:f1a3 with SMTP id j14-20020a05600c190e00b00418d91bf1a3mr9416287wmq.38.1713860365239;
        Tue, 23 Apr 2024 01:19:25 -0700 (PDT)
Date: Tue, 23 Apr 2024 10:19:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/MTRR: correct inadvertently inverted WC check
Message-ID: <ZidvC8cDwlniIBov@macbook>
References: <bcdd2e19-b89e-4cb5-86ec-f84e38db2c98@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcdd2e19-b89e-4cb5-86ec-f84e38db2c98@suse.com>

On Tue, Apr 23, 2024 at 09:51:46AM +0200, Jan Beulich wrote:
> The ! clearly got lost by mistake.
> 
> Fixes: e9e0eb30d4d6 ("x86/MTRR: avoid several indirect calls")
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

