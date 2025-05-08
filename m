Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A1AAF39E
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 08:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978991.1365746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCucO-000323-HE; Thu, 08 May 2025 06:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978991.1365746; Thu, 08 May 2025 06:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCucO-0002zV-D5; Thu, 08 May 2025 06:20:28 +0000
Received: by outflank-mailman (input) for mailman id 978991;
 Thu, 08 May 2025 06:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vw9d=XY=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1uCucM-0002zO-GW
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 06:20:26 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86ca7521-2bd4-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 08:20:24 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso3397015e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 23:20:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442cd331281sm24790075e9.15.2025.05.07.23.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 23:20:23 -0700 (PDT)
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
X-Inumbo-ID: 86ca7521-2bd4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746685224; x=1747290024; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erP9N5irA1Qn4rtwySzPgfrOs/l9lOODRxSitTYyXXo=;
        b=JqX73l3xnz4P6NrflpsMfeYmitFmcTHx8cuMiczgNkIdoVFlTPasrGmvo7KSnpOOv3
         nnGeOq//Mo0GMYvj6iU9FalUQNtWqwqmRJDuvVv5UBebRoejLSfQyoxzt7+tIne8K6Nw
         TG/XZDFKNlKJJcl16inbKIB7AkUCc0bi+7WBA2ouoilKExKQsndHHDPY1EfuDwjHyQkJ
         u9rIAALAnuu2gxHIXyIFYx/5DfFVuFu6GTE0C3iIFWasqqbs9NQzgcHk4rwbeUgIiwvx
         O8BbLRE8aFlZTKn1UQYZuorezY2s18nDtFF72adVMGhPk7YqAK7RDO/EYbIvJUlyoo7H
         Wl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746685224; x=1747290024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erP9N5irA1Qn4rtwySzPgfrOs/l9lOODRxSitTYyXXo=;
        b=QtGFYPSUT+lHx4naSLFG6apOWLHWfCN7zqtxj92LYxij94IbCGhQq0k4U5cQ6w4BVG
         wKvZRDOwcRJcNozQPSRqbmBsWjeTPmILQamV1OidSx/84cUnVzOc60i2T/nIy2+Z/8Z6
         FcSQ6v+sB6enuWCO3qHzWeIS2zMN0tzKCINcxHGYlqjam5UDmkYsiPR7grfkWlBfhjo6
         VR/3DSPW3RoSddyZBHpiu/6HF4fYRJ/0H32k8oZ5t1vQxtsEep0E0b0W43CzHhTV3wV+
         DNdcVJQMHJ+8ixIF3VbXFOUe1VkjTMBBivYJ2pI/Esecgw+PLLL+toWIvfNFP2XSBmOG
         cSDQ==
X-Gm-Message-State: AOJu0Ywh59Jr6LKEsSKKzZx4DHLD8vPCHl12Vlzg0pZorl3epYB6Ta2D
	MAd/ij3DDruh7RsAMgi49uXNAhb1tWpLjG7Nw/F5ExvyKBAgjlyh2Zs3gS56Tbvo5xNrkUBlGI4
	8
X-Gm-Gg: ASbGnct0Jc72/g5r9vhZB6XyDHW6OMdNmiXRp9L1So0dcA1Ys/ibW9ZyTHDu8I1Ao42
	9FE+h7tRB+SKhj6kv8oxaDr0v99FzE8YCM3VU4j97dOyUiUW80b5l1bPsqSK1AafhHDhgf/wodg
	OsDB0Xr7XUeZ/GuiBsVhWYJaumP1OA9hrWFqf34PoThtBebGVZpT6Yll2e7tKSDJQzPMyU0iT9F
	U9hOVvF62oMw5frJeLDrtqOh6v4kJbgVkdvTQEKAvKcxTUOfVy3CJPKHx2eyKdBzlzCy6ylVEs/
	IpnJRsyENzVpQX7AY2Am6IofuKtAmNSSy79sB89FD4kiLg==
X-Google-Smtp-Source: AGHT+IHo8NnLYyInT7/v8s7jzqlUhT5bNQvADa53LAavwKI6cC2BBKGtm3E5BcvLUbGxeJwnQ4G6SA==
X-Received: by 2002:a05:600c:3b11:b0:43d:526:e0ce with SMTP id 5b1f17b1804b1-442d095337emr12392365e9.21.1746685223859;
        Wed, 07 May 2025 23:20:23 -0700 (PDT)
Date: Thu, 8 May 2025 09:20:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xin Li <xin@zytor.com>
Cc: xen-devel@lists.xenproject.org
Subject: [bug report] x86/xen/msr: Remove calling
 native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()
Message-ID: <aBxNI_Q0-MhtBSZG@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Xin Li (Intel),

Commit 0cb6f4128a7d ("x86/xen/msr: Remove calling
native_{read,write}_msr{,_safe}() in pmu_msr_{read,write}()") from
Apr 27, 2025 (linux-next), leads to the following Smatch static
checker warning:

	arch/x86/xen/enlighten_pv.c:1168 xen_read_msr_safe()
	error: uninitialized symbol 'err'.

arch/x86/xen/enlighten_pv.c
    1163 static int xen_read_msr_safe(u32 msr, u64 *val)
    1164 {
    1165         int err;
    1166 
    1167         *val = xen_do_read_msr(msr, &err);
                                              ^^^
The first return in xen_do_read_msr() doesn't set *err.

--> 1168         return err;
    1169 }

regards,
dan carpenter

