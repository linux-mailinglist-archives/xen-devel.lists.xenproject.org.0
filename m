Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F5AAC787
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 16:12:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977371.1364386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJ1j-0004D5-KC; Tue, 06 May 2025 14:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977371.1364386; Tue, 06 May 2025 14:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCJ1j-0004AB-HD; Tue, 06 May 2025 14:12:07 +0000
Received: by outflank-mailman (input) for mailman id 977371;
 Tue, 06 May 2025 14:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kwV=XW=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1uCJ1h-0004A5-VA
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 14:12:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 164583d8-2a84-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 16:12:04 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so22948955e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 07:12:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d1266624sm14510405e9.2.2025.05.06.07.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:12:03 -0700 (PDT)
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
X-Inumbo-ID: 164583d8-2a84-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746540724; x=1747145524; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8uvLKZXT8Vp9GWlOaZIY/aoJ+NYq9e+xVhtrUg3o9U=;
        b=O8WTKYFKXEXLiD8SNinKBP1U0GMDSxOyuapjaSvX+0QChTLEwsbDTEU07GzA59nakT
         y7IZeEmuoPtG37lPu+OubjHbjeIuIhyPqU0hGeOpK3xPZG2tZvzaR6Z//3WLXci5vmNg
         NbLpyViFSDm2u9T9eBkLg0cAR9SIeJhuUJZ9VNBCKOGVbK7Yx6oHPjOKIHUdDkz87g3Q
         FfLPY0NAR/SKb9I6fzVrUkLuILxu8LJfpyPmerpKrbnUSG03pTkHrYuAxNMRQgtpeU7g
         Dcy2FGYVMWybGX429618zIFCqEECI63v6uUX+4HCqkwRjTeiQ51eYvTkCqEi39/YVAvi
         BnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540724; x=1747145524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8uvLKZXT8Vp9GWlOaZIY/aoJ+NYq9e+xVhtrUg3o9U=;
        b=TfJK3Q1K4OCnM1xnjXnJIvWagvzic/2YH0EBx3qqPDw6nc8A4z6LU1SFwg7XqdfHSe
         1clSJE1L8g3fE8lsWLsLUdSqnmHl3yoAIgVCnqevkM6DTx6zegUfw+cxP5AmZA/+SI/w
         HPVwvcA/HB0Dxu+xHdN2Sy4n2+Qy0C6KvgD+nJEwSWz437Sb29SiX2XmPUpe0LZyCIZu
         bnb6wGnM04UNt6pxMSmS/DwH91fl58vYzM8vGAPx6bmjtxDA7h5iJ5DAO571dNGOsxjJ
         6hMdFX5FEsuXtHenDf7wW/oj5Ho1FB3KoKikSUrFEciKAmlN/XW2XuIuRxsj23DboXSU
         rUMA==
X-Forwarded-Encrypted: i=1; AJvYcCU1GAubkwmXk5AjU58Sgi1PTNd5QddaNx2Xor6jr98WGlNsU5R9Y6F7aXqDK+gD+xGioWxOpFCLJpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuW7/rSp1HAcWLjYE4yRl1432z9qyUwCNBf0j6oUzhQPWa6kPg
	s8NKFCxbFrUenxfqouxlDFt3Da7arM3PmOZOidAjAQ7WjfgjDuJy
X-Gm-Gg: ASbGncuBSfe/d0cf6Yag4yLs3zDcZoSSezzHd17ECleTI+28enNIy6s1sNSf62VDC0e
	OHuHcVVqaetb/eWO79fc011gC6f6vY36bGcPj8o5248nA+ztiL9brQtcXqojrQ6XnMn6gWV/LNi
	ynlhqJrI6YbemkOCHYSt2ddS79CqfxnxZedmvXJbSIeimwcX/KK2nQsxKHnwjbc97/Yw0uMGYo7
	pxdqlfTCjnkmzv+1zAjqKXPgD7OHKWobCq5sRKsy7BqJWtC6y+jXfGDDAgPHvYEpP3XVhpVBpXM
	KNo3ulNSji+yjozQolehHu983vz9baCEyQMG70NHWi+gWaD5Ns9SVaCNhCMPCu40xgQ04DONva3
	9PEnnAOAT6Cn8WEdDY8NBkTRBbWl73NepFY0oD626je0=
X-Google-Smtp-Source: AGHT+IHAPtErJzs/PpDmC/McmTo1ZR1yyAn4W7biUk0n0KPEpdsjw5oRWVZX/I3wjLVQJPvhu00hbg==
X-Received: by 2002:a05:600c:871b:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-441d053bf8dmr35903265e9.33.1746540723921;
        Tue, 06 May 2025 07:12:03 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
X-Google-Original-From: Andrii Sultanov <andriy.sultanov@vates.tech>
To: frediano.ziglio@cloud.com
Cc: Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	bertrand.marquis@arm.com,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/4] Allows Secure Boot for Kexec
Date: Tue,  6 May 2025 15:11:53 +0100
Message-ID: <20250506141153.994534-1-andriy.sultanov@vates.tech>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506135655.187014-1-frediano.ziglio@cloud.com>
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2nd and 3rd patches got lost somewhere and do not seem to be shown on lore,
at the very least.

