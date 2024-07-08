Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217F929ED0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755230.1163532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkUj-0001ps-Vx; Mon, 08 Jul 2024 09:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755230.1163532; Mon, 08 Jul 2024 09:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkUj-0001nG-TN; Mon, 08 Jul 2024 09:17:13 +0000
Received: by outflank-mailman (input) for mailman id 755230;
 Mon, 08 Jul 2024 09:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xFgZ=OI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sQkUi-0000P7-3w
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:17:12 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db97bebf-3d0a-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:17:11 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-426606f80ebso10166995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:17:11 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fc9b3sm156670605e9.46.2024.07.08.02.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 02:17:10 -0700 (PDT)
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
X-Inumbo-ID: db97bebf-3d0a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720430231; x=1721035031; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZSttxX6CIu15bAHj/YODinGAWTkbmDnzVBd/Y7OIG4=;
        b=Qf+cL+Tvl1Npi5oinmnmewN6KB9I03e3AlUiwYfmGYBPs408xT9iEyV8SBZ0qTd7K0
         HIiG/a0lVvSaMGvE1wlKFvA1mIuXHxnx8miPIcwp41+SBMr/7x/jXj2UhuGaq7DQdzXk
         r677OBJWHoZSSfy+jYbfxU63zpvNLswHG1Ns8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430231; x=1721035031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZSttxX6CIu15bAHj/YODinGAWTkbmDnzVBd/Y7OIG4=;
        b=SPIIYnoZO0WzWuPsDzMri2iPi4IomupwAoFnuC+LaFHqS1MpJQkYb8yztUVQ+hRjgm
         q63ziCGjlMrpnCR7YdzPcv1doMu21/CnEKe6+R2GTFDXQ6tBWaXYYfqV52pKMIKessHy
         rVjXZocm0DnarEK6IykKBMnAG/5Gs36t64Q/K7nGioRfdaRdW4dPPW9U2jxW/DxJtMS7
         ZhRDpcaHMQQ6jLa5haGjC7lvAOVcwRVfmKom2w76J5De/+iJdyb4tx+ZviqVaYOCe2If
         Oml6PDW9JMMCFHasLaZ0Y9BqdbnwAC9I53/WvZW3SRBhrUuMkaH4PzKac9a9BkNp9tcb
         453w==
X-Gm-Message-State: AOJu0YwuvH6bmnALyVmFMJfIozbplZYItbiJI3IOLDWBKZ3X17GJzLVQ
	dZwZ1kaLQZRJuEKzqgNYhbk65KU2nmcjoqo1GdRaG7WeqzaxPsO9fMhgsazH71w=
X-Google-Smtp-Source: AGHT+IGw3SwUuKO33TIO1Ia/8h47RpO0o9gyOT6M4VMsVBVNnakMuZAJRFRFfbXyl2fHv9t2Hl/djA==
X-Received: by 2002:a05:600c:1587:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-426616edbb7mr33441975e9.15.1720430231111;
        Mon, 08 Jul 2024 02:17:11 -0700 (PDT)
Date: Mon, 8 Jul 2024 11:17:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19 4/6] build: Drop openssl as a build dependency
Message-ID: <ZouulqBYsNQdKqnv@macbook.local>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705152037.1920276-5-andrew.cooper3@citrix.com>

On Fri, Jul 05, 2024 at 04:20:35PM +0100, Andrew Cooper wrote:
> The final user was blktap1, removed in Xen 4.6.
> 
> Fixes: f6bcc035084a ("tools: remove blktap1")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

