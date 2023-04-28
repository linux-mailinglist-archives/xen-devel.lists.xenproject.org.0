Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6846F1891
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527322.819837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNg5-0000La-SO; Fri, 28 Apr 2023 12:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527322.819837; Fri, 28 Apr 2023 12:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNg5-0000Js-PY; Fri, 28 Apr 2023 12:58:21 +0000
Received: by outflank-mailman (input) for mailman id 527322;
 Fri, 28 Apr 2023 12:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psNg4-0000Jm-01
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:58:20 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58175972-e5c4-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 14:58:17 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso67067555e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 05:58:17 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b002f6962ee703sm21079612wrq.61.2023.04.28.05.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 05:58:15 -0700 (PDT)
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
X-Inumbo-ID: 58175972-e5c4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682686697; x=1685278697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4CBZO3VZzr3VcxoHMJPx5192j4wNQ7zuHM7OHU5MIM=;
        b=IQSaG0SdU23395dtkSsY+HynAQU2XjUeVBfWYZyxAjcrfTcxFw3TtKqvp3geSNf0EJ
         Tl4kfmNb1sAJ6MbM8+x/0Y81D9eRjOkZ/Uu/u+6Kg4RRu5a37uvNsbzlrnj5svNsnPOT
         afiy87iiuC1YtaMRc7+intkpRmfECpJtzTgM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682686697; x=1685278697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4CBZO3VZzr3VcxoHMJPx5192j4wNQ7zuHM7OHU5MIM=;
        b=UbTQFqDfhYF04XM3sK2mIoI/V7QV+A9EpSi2jmhcVya2vt5Nfscj4Q23bvnCf+/IWs
         Kid7005VkM3qRjTTb0wTNHbVyVmUJEGaCccBquNje8eabbw3vXEw8iKu0MGk1wnP675x
         3fz8BRwR4jR0F1tL51U2IK67RMT6UeZVZ8QAoEAbb50/gRMqZsvYd2PlVdUHaviP6aYj
         Tpmiv8gMfoVhhIRrQKCxg9CCJq7s9duAjUZMEJVKQEMts8Kdqh0AcOrnoUgsTY/rMArA
         kJKr8M5+2s+pFtOQ33QZQMC8+YpLnUFcVnkpA0XmmLX/XrEwAszUIzR3A807bFnsZG7U
         9yUg==
X-Gm-Message-State: AC+VfDxCtEQb5TBulcn+/GWlsKc9DokBEjK2J2BPsgEQ6uV8b9GZ+9Vl
	5nhSS930DkpKdiIg/gY4WPItmQ==
X-Google-Smtp-Source: ACHHUZ5nrK2nv4OlTQdMdEE7E/5dunabfIbYBIfbK4/GYZG7Rwz7K4+HAjysidp9jBFEH/wmE2va3Q==
X-Received: by 2002:a7b:cc16:0:b0:3ed:f5b5:37fc with SMTP id f22-20020a7bcc16000000b003edf5b537fcmr3939461wmh.1.1682686696846;
        Fri, 28 Apr 2023 05:58:16 -0700 (PDT)
Message-ID: <644bc2e7.5d0a0220.3e72d.ff3d@mx.google.com>
X-Google-Original-Message-ID: <ZEvC5ODtE7W+hPL+@EMEAENGAAD19049.>
Date: Fri, 28 Apr 2023 13:58:12 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 3/7] tools: Refactor console/io.c to avoid using
 xc_domain_getinfo()
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-4-alejandro.vallejo@cloud.com>
 <91438b54-df82-f790-7154-c76feea90f18@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91438b54-df82-f790-7154-c76feea90f18@citrix.com>

On Fri, Apr 28, 2023 at 01:33:45PM +0100, Andrew Cooper wrote:
> On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> > It has 2 avoidable occurences
> >
> > * Check whether a domain is valid, which can be done faster with
> >     xc_domain_getinfo_single()
> > * Domain discovery, which can be done much faster with the sysctl
> >     interface through xc_domain_getinfolist().
> 
> It occurs to me that this isn't really right here.
> 
> It's true in principle, but switching to requesting all domains at once
> is a fix for a race condition.
> 
> I'd suggest "which can be done in a race free way through ..." and avoid
> saying faster.  It's likely not faster now with the 4M bounce, but we
> can fix that in due course.

I agree, yes.

Alejandro

