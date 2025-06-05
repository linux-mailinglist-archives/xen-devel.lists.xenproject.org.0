Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28294ACED1F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 11:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006482.1385660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7Ha-0003ct-Ab; Thu, 05 Jun 2025 09:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006482.1385660; Thu, 05 Jun 2025 09:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7Ha-0003aK-6x; Thu, 05 Jun 2025 09:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1006482;
 Thu, 05 Jun 2025 09:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN7HY-0003aE-Jb
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 09:53:08 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d0aa6d-41f2-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 11:53:07 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-450d37d4699so4457635e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 02:53:07 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f990cf14sm19261945e9.25.2025.06.05.02.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:53:06 -0700 (PDT)
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
X-Inumbo-ID: e1d0aa6d-41f2-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749117187; x=1749721987; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/mCIEOe+99EBm3J56KANgiQehCzEa9feY9OP5XC5xeE=;
        b=URsbV5Jy3ALQ2GsZfgLI9RzrtQ7nVI1z2NPngwg3AWAd4qbMKfiPyeDRklCCimEolB
         SlDf1u9tsL0xvy7leHTON8kf/ePhhMBxjPWoRY+GqJjhmd8JCSHRm1ooYLaYgfxFqkj3
         cZfSUzNo+BclD/uWuxzvKng59aVfdevRYhL6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749117187; x=1749721987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mCIEOe+99EBm3J56KANgiQehCzEa9feY9OP5XC5xeE=;
        b=bYha/0hST9cvfKiagZuGyvymjcKHYR3ex6/CAXussV4IWr1d/GkzzDBr6+NhFwF1kl
         iySn+/+jvd2vEFFu+0TYQe7iOAGgt9VBmjaFlcGNh+D2Q9Fiug3yUdMB093+8StQCtm2
         /GOIQFUHw771aP8TI+h/ln7ZgC0yuGbESFA9EV2tM3ItNWGWx2B4w6WnirEpm6QHhXNm
         S3T/A8Ujx8TSLmW4P0ZbdBTEoMWhSOhOoVr6mgzMd66zJx8WBTOhh95LMbgfVunFr5Qx
         N8SjrxDHR5WJGzfOeLmcpsrAG9+EllpqxJha6x8My+20/r3Kp+CbRn3tTTbktGCLaR3g
         Znhg==
X-Gm-Message-State: AOJu0YwYzv+I7lS2d1WdV00JTG7IP8YG6kBH4Nc340ukErdKLi4ZEa8p
	ykBEwGYONZRNnpMhl6OBvkFjNfA/Ijqe+zGuJCg2wfL+7/9kEDlYjZSMyUC2A+HaTdA=
X-Gm-Gg: ASbGncuwS/p92+ngyePFKYeBY+JXaq0uil35Dx4FeMPqlKIt5JzLsuEHyofv1+hMRqN
	OnLsH5HXkZnpxzwNaTmK3GjKtdw9yXIujcQdpstzX1SVn6j/RBaAdLRWvPM7tolpyJgjiiIUr3u
	pOKgGwTRBOLbuNdu3Do5jX+FjIGCFyHKAHVZSy+xt5gC/yoVCQQSqErTLhDw8UMlO4JrVoZmcdc
	X4SIwKSNAUsJsEBFLXJXxbPUTgPDUOmgfsf/CIhoPJj4zhI62lubEMj/hTLhvl4W3Tde3IExToj
	Y+ZebxQYb0dO3hBW0tQG2KQFWUi4VmkSICslDXSF/X+J+mmglUebypvf28sRP4KI1dfdD+Jgrg0
	niYeRs+rVWj023nzcT9Vu+0Ig
X-Google-Smtp-Source: AGHT+IEyfelTcYbH/SsNwWATuIN0KgUNEr/rax+fv89GQzNHgpgRc/4oKuAdqEil1SE1CxyA8CRIbw==
X-Received: by 2002:a05:600c:c4aa:b0:44b:eb56:1d48 with SMTP id 5b1f17b1804b1-451f2d05ce2mr56012105e9.4.1749117187003;
        Thu, 05 Jun 2025 02:53:07 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:53:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/5] vpci: rework error path in vpci_process_pending()
Message-ID: <aEFpARzSGJjFCjN1@macbook.local>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250531125405.268984-3-stewart.hildebrand@amd.com>

On Sat, May 31, 2025 at 08:54:00AM -0400, Stewart Hildebrand wrote:
> This will make further refactoring simpler.

I think you want to add:

No functional change intended.

To the commit message.

> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

The success and error paths have some shared code, that might be good
to unify, but that requires further rework.

Thanks, Roger.

