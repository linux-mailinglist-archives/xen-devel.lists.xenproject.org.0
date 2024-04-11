Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF08A125F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 12:58:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703844.1099749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rus8b-0006GS-Mk; Thu, 11 Apr 2024 10:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703844.1099749; Thu, 11 Apr 2024 10:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rus8b-0006Ev-If; Thu, 11 Apr 2024 10:58:37 +0000
Received: by outflank-mailman (input) for mailman id 703844;
 Thu, 11 Apr 2024 10:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Poi8=LQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rus8a-0006EO-BW
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 10:58:36 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 716fd4a1-f7f2-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 12:58:35 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-69625f89aa2so58400496d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 03:58:35 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 oj6-20020a056214440600b006986db59235sm787313qvb.68.2024.04.11.03.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 03:58:34 -0700 (PDT)
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
X-Inumbo-ID: 716fd4a1-f7f2-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712833115; x=1713437915; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEWVJ0k1wnRaeVKyvNWmhsqfjvMy+N1ww5EbTYXqA44=;
        b=Zf2HHr8ETM5PA6qmxdmMsF4e1fB5H7jQsiAc4Egr/+3zaC3UNOXtt/7DLwyqLldcL6
         8CxKD/YF+A8JVuzCSpFiQPT6WqZB2otTMjC3dLqxccz1rkzQRXnWoLgGrsvBejVv4i9O
         IXFkJmTBvJZ9ze4Hj0FUQD3g0FydnL+iCH2RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712833115; x=1713437915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEWVJ0k1wnRaeVKyvNWmhsqfjvMy+N1ww5EbTYXqA44=;
        b=MU4tiynM09H7mAaFL3nQmDYJ4FXh3Z8MWWnj18xSZFSYnrpj6TzawydPV6aNw31bCq
         I4Ohs09skTJ62OlgwrxQM0kizJ4ehTDk/2Rbc0i0PFZjo1iTYWya3vcEmOvPVJp6UaZM
         xf0j+NiqsVIQJ8wfLoxW1vfp8+bNieYsXf6PiKymvzVTwF96WeWQemoSwA/INih5551L
         Uh6MfnssoTz/TXE4PSztOXUchnBD1rtYOK/4lQ6gx5fGoTean+4CV1vZRWFkD7Uv86zE
         +Nclt/xKMU+rR3gqRw9kV4RGbE0nQHGSNTouiVyr4RqI7aaYX+fAx4ljIkm/avCjzC1C
         9OmQ==
X-Gm-Message-State: AOJu0Yw4rQN0wWTeIjBHlcLrwGiYFUY+a3cXGpBO6Qcr6Nj3UjUVxyqv
	MFgPWcuQ/GmwDRM2j34A6c7zqC6ybOMFWjxsRNuiTZmeYvPvyQ2GKCUWaxKCxLk=
X-Google-Smtp-Source: AGHT+IEXrE3cKMbSHUK0Wk6NzurV7bPHvnoNY3oJHo+edlhqCx3d2d1LrOKnN8TU1AbGeJ6iw2RRUA==
X-Received: by 2002:a05:6214:29e2:b0:69b:215f:e2b0 with SMTP id jv2-20020a05621429e200b0069b215fe2b0mr5612919qvb.55.1712833114685;
        Thu, 11 Apr 2024 03:58:34 -0700 (PDT)
Date: Thu, 11 Apr 2024 12:58:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/vPCI: Remove shadowed variable
Message-ID: <ZhfCWGzazXFNxSCk@macbook>
References: <20240410193348.1492018-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410193348.1492018-1-andrew.cooper3@citrix.com>

On Wed, Apr 10, 2024 at 08:33:48PM +0100, Andrew Cooper wrote:
> Resolves a MISRA R5.3 violation.
> 
> Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

