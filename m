Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFDC97D3EE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 11:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801119.1211162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sraNT-00066q-MV; Fri, 20 Sep 2024 09:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801119.1211162; Fri, 20 Sep 2024 09:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sraNT-00064I-JT; Fri, 20 Sep 2024 09:56:39 +0000
Received: by outflank-mailman (input) for mailman id 801119;
 Fri, 20 Sep 2024 09:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sraNS-00064C-GJ
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 09:56:38 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fcf901c-7736-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 11:56:36 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso216967966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 02:56:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612df75csm833856066b.149.2024.09.20.02.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 02:56:34 -0700 (PDT)
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
X-Inumbo-ID: 9fcf901c-7736-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726826195; x=1727430995; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VOibEdmL5ZCPv/sq6qBabt4WwhT4NdfjzA5e+c/ONJ8=;
        b=a3T97e+b55urxaKSphmES2kttNpKvhDMFEC1MJTFeX9Y7dvvCyB1w1N8JSkdvpTRnD
         D8mbpJDbzOZyn7perygIo44wbL9il29XV7lH2p0p3IGOOtirhyYfP2ie1tuqP7cvtWrZ
         97ORwD/mEID2nwrOiFDJelbL1wKGH5gydv1h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726826195; x=1727430995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOibEdmL5ZCPv/sq6qBabt4WwhT4NdfjzA5e+c/ONJ8=;
        b=LXoT8gUYI6Jz4eI3Oj3OSeZ0AjU+rqRpe1kFz+7Kai2glyCjXqlGIT1+M8nkc0Ft/Q
         ETCgV9XvkzSk5V141VNUIy8p/Qxu/Lhcj9kF09Rb8weX925xt9d0epdKvHX78xPBrE+4
         jGXpiqppGoDhHY1LtXoXNbtA+Nh6jOCiauT9PbCeHtclKmgrKGbIgKZndIlhYL85ljNq
         UELS8DunUf+Qv7ufrib72mHaljIwhcZDivn9WrCJS2JE/X+ybM9ztgl4lkpIasprjhau
         VlY6JOep5+10+CoYqmRv1+9xgnyFpW8euSqzykIVisq4IBPytzbROe42Xa6C44LNY2zf
         IkdQ==
X-Gm-Message-State: AOJu0Yx17RGRojM6jfvhv9ie9hbNhNsg/Eke7aZTEVvfquLlkiaOy4bu
	vJINTTrZ7vaVRO/rf0YPfPKAMob+jufMa+iJyNHXYTiFSSE7cNirilhY40wMkGtW8cpk8tpqqzw
	c
X-Google-Smtp-Source: AGHT+IHpfEfwOY8cWYfRdldDBH03S7K4ma5hsZ4X4wLIHQq9699l4xAYngyXCMepDNv63TXJVFOR0w==
X-Received: by 2002:a17:906:478c:b0:a90:b73f:61c1 with SMTP id a640c23a62f3a-a90d51977c9mr204950566b.61.1726826195179;
        Fri, 20 Sep 2024 02:56:35 -0700 (PDT)
Date: Fri, 20 Sep 2024 11:56:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 2/3] xen/livepatch: do build-id check earlier
Message-ID: <Zu1G0ilYNOgxdT7O@macbook.local>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240920093656.48879-4-roger.pau@citrix.com>

Ignore this one, I forgot to cleanup my output folder before
re-generating the patch series.  The correct 2/3 is:

"xen/livepatch: do Xen build-id check earlier"

Thanks, Roger.

