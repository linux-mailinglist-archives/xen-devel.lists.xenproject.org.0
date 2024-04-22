Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6098AD32B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 19:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710168.1109254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxE9-0004Gr-0s; Mon, 22 Apr 2024 17:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710168.1109254; Mon, 22 Apr 2024 17:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxE8-0004Ek-Tp; Mon, 22 Apr 2024 17:13:12 +0000
Received: by outflank-mailman (input) for mailman id 710168;
 Mon, 22 Apr 2024 17:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryxE7-0004Ee-Rc
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:13:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c1d114-00cb-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 19:13:09 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so3994420f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:13:09 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a12-20020adfed0c000000b0034635bd6ba5sm12553872wro.92.2024.04.22.10.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:13:08 -0700 (PDT)
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
X-Inumbo-ID: 97c1d114-00cb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713805989; x=1714410789; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/02DGznyjoukMU713Yj43l2glXrU2YEu2TipWgD/B1E=;
        b=cA2p8gx9XiPmo0UQ2hO+EGi1ItFNhFyerupIiY4C6dtOEqdOGavrslcD/FoBQSu8ZQ
         /kBlpUjM3pNQa/krbBNsGTKBpVtdrgepUztNDmO0FT9evlBUK7tXOW7nuyFek7ygbn48
         epRqlY9xC28b1ksFzLBEW5ispW//JsQLv+DLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805989; x=1714410789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/02DGznyjoukMU713Yj43l2glXrU2YEu2TipWgD/B1E=;
        b=W9O1E+44a3+WWEjFDAo4iPJytRWJx4839KvlygEn7lDEZSvzFCvxNibwu21N05NGJ+
         vApP0ECtIo/JmnSZdCBLL50njjFZTfCCuOj4GEM+AZYxIQ8sA2GLaqR7lrDxNnArq5KA
         ZrEytQMMhvQ8gJtf+pDgrWVdYizO2z5UBbRZsNGbNQ3RD/L1wnS5wEhxlKkg2gOILZV8
         cTZU9CIcRWlICyU8Tzn6OHIwhkwLgMcc+yyKXAMPuqbXn/U8eZkD2N3iAL9Rc4CfOMaY
         3MH08EDcl8T2gEeRX4Xw9XnFKW2HNwBwqQL0rNbw71nr1HU1PExAWJLscrpHTLSc6zOo
         q0Ag==
X-Gm-Message-State: AOJu0YzL1++iaUVY9JVvuD2NabINYDt8g0J/thi0LtP/ipFwbyDMGJqT
	f0HOBCLSdb5aEzkbzbm8oXja7YpRRtxgwu4qLIjaYG1FGuMF3mMe4I7PnwPdPmY=
X-Google-Smtp-Source: AGHT+IFMdpVBohRR7ZqBRbvaY4T5SAfQaCuAdo+j69Vhf4KOSN/OutD6MVUH2zeH41e7WlpIimLWwg==
X-Received: by 2002:a5d:628c:0:b0:347:868:9dd2 with SMTP id k12-20020a5d628c000000b0034708689dd2mr6728245wru.20.1713805989230;
        Mon, 22 Apr 2024 10:13:09 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:13:07 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v3 4/4] docs/man: Add xenwatchdog manual page
Message-ID: <d5c94154-1145-4781-95ff-9449fddd0643@perard>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
 <20240411182023.56309-5-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411182023.56309-5-leigh@solinno.co.uk>

On Thu, Apr 11, 2024 at 07:20:23PM +0100, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Add a manual page for xenwatchdogd.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

