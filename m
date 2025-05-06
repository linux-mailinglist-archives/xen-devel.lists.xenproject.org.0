Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE9DAAC6DA
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977273.1364306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIdV-0003nA-0Y; Tue, 06 May 2025 13:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977273.1364306; Tue, 06 May 2025 13:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIdU-0003kx-U9; Tue, 06 May 2025 13:47:04 +0000
Received: by outflank-mailman (input) for mailman id 977273;
 Tue, 06 May 2025 13:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCIdS-0003ko-R3
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:47:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 968290b6-2a80-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 15:47:01 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso39861325e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:47:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b89cc441sm173490225e9.3.2025.05.06.06.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:47:00 -0700 (PDT)
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
X-Inumbo-ID: 968290b6-2a80-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746539221; x=1747144021; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0g2iJRiZOVC1jLAzQlPCvbZ1weyKvYSprS/XScBn20=;
        b=pQU0WFimhUQ4ByNKg6rpW9lpZdKbLSZQn47xGkVpWzpqRTIMUB5vV0vi9ekBzgm2/6
         JwDzNoJExb9hfcscJgrXr1wViRP2uR9mwfcV0HF60VhtJ9iFxnrzNl9ftvHX/z33SaFO
         bfGGsufAYj9/2GoGU4wgCaEvEP0edlbhGB+Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539221; x=1747144021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0g2iJRiZOVC1jLAzQlPCvbZ1weyKvYSprS/XScBn20=;
        b=QZvqrPaiF36y9+dI1eY1Yyv5h4uOUAaymBk2ndkvYro22sewQSPogz6eNmcbNby6sy
         /3IKOvZinlaIMldhJUJMwXjUmV0uqoecMOdF2c4qYz5/dlRDs1CFbdwkjmYppJfcw1wa
         REa9xbs4mV6cJJIH03R99pfKP0tpQhJVLh13DRbhPsEJDaOB1rabYSqgUjWsvEilMi+n
         y4qHWEBZLU1JPzdxmtaocUlAdwmrYbZkOaTVS6Lcj7WkK/P4gAbArj07IV0ElJjMK5Q3
         z+rW+OFqgxTcqkw0BPd8D6I+8O6PxgTaVryO9QlihyG8IrZ54yiS9EXhYpbO0YE+T32B
         0NYg==
X-Gm-Message-State: AOJu0YzFRaPlZiPXkC368fFvSY6myUNUEJ4wSwnlCPBCYsOJXyUf89XS
	vXr+sgq9niBXEeM1r6fDMbfASpy25TNOhCuKCtyOkYxFKf/eHH+VGAL+l6aTc9I=
X-Gm-Gg: ASbGncv7SFrbSM8AUp4GiFc9HgcYePv+RNaQEPlGQwHjLJIdt7e1oI+vmG4JB166tR9
	EstY8VmIrPC8Mvt4OaAWNAM/qmX/mhyIOxBk+JYcc1JFSk6gqAxwbw4umQAyttE3qwzGJW/nT4v
	nl/b2cAnoqaCojL9sXaM45opISgXuxCDhSfnEktHTHxemmZ+zKoOLWVM5yIlHi3KyMr6q69goyR
	YdAs1L8TZnU5SGNWDN8NbWM8DCPRvkV8JyjwLWwmDWMqMp2AchUgUF3PSXucAngZ72s6Htbvszh
	uzWkulIGlJSYhNESe2CIly5HXXphGdaAIdV6d6gxGxlRJA==
X-Google-Smtp-Source: AGHT+IEqKlQtGmUA+l2OGBr4PvF7P+jbTwyWTk4dDphqOjYiPFPf5GTTrTrvLxDMnhv3scbFxFzHXA==
X-Received: by 2002:a05:600c:1d8c:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-441c48bc74fmr107910385e9.9.1746539221359;
        Tue, 06 May 2025 06:47:01 -0700 (PDT)
Date: Tue, 6 May 2025 15:47:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Message-ID: <aBoS1OLJau1G4oDI@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-4-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:55PM +0800, Jiqian Chen wrote:
> Current logic of emulating legacy capability list is only for domU.
> So, expand it to emulate for dom0 too. Then it will be easy to hide
> a capability whose initialization fails in a function.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

With the comment from Jan addressed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

