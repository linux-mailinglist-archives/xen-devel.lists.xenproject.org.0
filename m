Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB887BAB4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 10:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693087.1080835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhic-0006CG-AG; Thu, 14 Mar 2024 09:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693087.1080835; Thu, 14 Mar 2024 09:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhic-0006AH-6V; Thu, 14 Mar 2024 09:49:46 +0000
Received: by outflank-mailman (input) for mailman id 693087;
 Thu, 14 Mar 2024 09:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P774=KU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rkhia-000655-Fe
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 09:49:44 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e79f76f-e1e8-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 10:49:43 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-42edf8325f6so3436041cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 02:49:42 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b004309dec7efdsm456427qta.44.2024.03.14.02.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 02:49:41 -0700 (PDT)
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
X-Inumbo-ID: 2e79f76f-e1e8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710409782; x=1711014582; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=egW0tuoipRPbKvhh5ZNSPDl4SE4lfrMigWlgO5Xq9fQ=;
        b=KrYnHxQdnNnJHJ3XWzDd4lgt2/D53hdtXVV5gFM+7UiCNyb24iGLjxjkSI2CPn/FWS
         9Hq2OHAsIw/UbEQMFkslwonCYcRfN5f4k/ySJE37gxMZRUzLr330Y4nJhA7kf93jM1E2
         g5Nq18ln/P2J26xoEMjMXzsTw1nAWlWie4cgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710409782; x=1711014582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egW0tuoipRPbKvhh5ZNSPDl4SE4lfrMigWlgO5Xq9fQ=;
        b=tTwY8rRKMzvGkNNljGX3Q7faqOG6hQ8AkYMEJdofqbHupsfhThuy9jhFKyXyAtI2sG
         fxifgA2yx5U+i2Tt1fMoPO6nL7/cCDADlyGKCwFyax9GsDkbLKpOatk/wrEsxp3E1arj
         51vCaei04MBQjlZqUjz/NYLy6298hAxIdCmVZ8rygfOLFkdHfbD4YsSzPEN2/G43UWQp
         L/OBuXcAIJCOc3xhkR6Bqoue9jXyyyNvzG34+3On0VXIbP+tNmgUUBF0M7z5T811o8QR
         BYM2YCggbXq3bhj2jJMrdwiOCrFCV3/gxhaE8nowYnFtWNnwoQlc5kUUFxaYYG7LoTf6
         0SRA==
X-Forwarded-Encrypted: i=1; AJvYcCV8zgqO2SMO18gvQCEDSL6k8n2qCUZ87blu7PARpeaSurxrI6dbpNkGhz1nLyJYlQvqEqHenv/I1COjFkX1JWlAtwJXdumskzHO7R2xQQE=
X-Gm-Message-State: AOJu0YwND8zVbZLT8n7bDDdJwvkUmHrM+Ri1KlrugCFjcXrV6KDufLvQ
	DVjbCzEAkqgXOiNmtleSAeDw46Xuel2TAakPvZ5C+WEjQYItG9gPJtPf3N/N2V6GS/nkel7ZSeV
	G
X-Google-Smtp-Source: AGHT+IFAw7BEKOo7VsS7XC6Wi19P/R8ILKGF4EoKyzaij3dojhqVF2DEiqsr9fQc6Zh/p+WQIlRkpQ==
X-Received: by 2002:a05:622a:4b:b0:430:9e89:9f33 with SMTP id y11-20020a05622a004b00b004309e899f33mr944532qtw.62.1710409781841;
        Thu, 14 Mar 2024 02:49:41 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:49:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org,
	michal.orzel@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] MAINTAINERS: make Roger an IOMMU Maintainer
Message-ID: <ZfLIMx193FAIIGi5@macbook>
References: <alpine.DEB.2.22.394.2403131638530.853156@ubuntu-linux-20-04-desktop>
 <97516382-b756-48da-a358-6b093c4cb20f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97516382-b756-48da-a358-6b093c4cb20f@suse.com>

On Thu, Mar 14, 2024 at 08:06:27AM +0100, Jan Beulich wrote:
> On 14.03.2024 00:40, Stefano Stabellini wrote:
> > Roger kindly volunteered to step up as IOMMU Maintainer.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

