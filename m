Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCB84277B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673537.1047894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpd7-0002fX-34; Tue, 30 Jan 2024 15:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673537.1047894; Tue, 30 Jan 2024 15:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpd7-0002dH-0W; Tue, 30 Jan 2024 15:02:29 +0000
Received: by outflank-mailman (input) for mailman id 673537;
 Tue, 30 Jan 2024 15:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUpd5-0002d7-LO
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:02:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a339d9-bf80-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:02:25 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so19837535e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:02:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b0040efb503d58sm4444424wmq.28.2024.01.30.07.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 07:02:24 -0800 (PST)
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
X-Inumbo-ID: 93a339d9-bf80-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706626944; x=1707231744; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nvr2p5Ov0mwYAE6lMhzUJeKVmyCqEFoaHrSzCAcpdYU=;
        b=QivncVq1HP5MkrSKoXkoKolcApcpVL775B9/wx9aZ1X8YfnFF0Dmv8jHXiS71sL/AO
         ICXpaPu6NFwsTl1cqpoEBwM8zZbLS4CcpuKvzrzRNYa69BhMtiHJx+fHN9tRSw8kaG5I
         fp0KASQfl4dLH90MAYteww2BxRW5ANBYzWyTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626944; x=1707231744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvr2p5Ov0mwYAE6lMhzUJeKVmyCqEFoaHrSzCAcpdYU=;
        b=qipBhFQfBFnc/ue0gGUjIfd/wVpk0MlOVoKK8gF9Pu8vT7OpZ7P6aZeYWCSOMFdekI
         A4FXurmd9thNp+e9vsxE7ueZAW94TuioDlYhxrag78L0Jv8LltTFEX3ISnXNtBMh7emy
         jsJTsXYpPdTmuMzsqG+aPNqj03JyRi5XRMYA8/f/ryaK90l8eV8NmgNVo1icxB9+5i5A
         nXSlB8y3X9jY8PIYonbYwYyhqTVMTl8PE54XNFlU2bcFW1a/BYnlawsqsINjTXr5PZ/3
         ttqlxtXkCF+v1c0mLBcJD5Uq5/R/xMDaGMPzFqfUr54e2lrhgCNzqdasXNOAeBpV0WSr
         gK0A==
X-Gm-Message-State: AOJu0Yyf8JHikQLM4syS0nNGROzKLYThutOeBnJIRW8eEvZvJp6zzCiY
	114FkeUo70B+kQSph7IQzUcSXpgvKvnltFW2ZoH+UzgFtTWVe/GjsMdZuv3JohQ=
X-Google-Smtp-Source: AGHT+IGjwqKJxlsXNLfuXGS5gZcoNxMFyxqmlMmTPQN8ryzVCK93VkRFw0AYXDhFJKACduVk51YCYA==
X-Received: by 2002:a05:600c:46d0:b0:40f:afdc:7477 with SMTP id q16-20020a05600c46d000b0040fafdc7477mr538797wmo.20.1706626944471;
        Tue, 30 Jan 2024 07:02:24 -0800 (PST)
Date: Tue, 30 Jan 2024 16:02:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] XTF: tests SPEC_CTRL added bits
Message-ID: <ZbkPf0Ji4LRHBwOz@macbook>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130102719.51150-1-roger.pau@citrix.com>
 <7f514c59-dbf1-44ea-a589-dbc43f0b4ee4@suse.com>
 <Zbjhica05LIMB9zX@macbook>
 <2ded2ffa-70cb-4d91-8c52-d36bc2ee3705@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ded2ffa-70cb-4d91-8c52-d36bc2ee3705@suse.com>

On Tue, Jan 30, 2024 at 01:55:56PM +0100, Jan Beulich wrote:
> On 30.01.2024 12:46, Roger Pau Monné wrote:
> > On Tue, Jan 30, 2024 at 11:42:43AM +0100, Jan Beulich wrote:
> >> On 30.01.2024 11:27, Roger Pau Monne wrote:
> >>> Dummy set/clear tests for additional spec_ctrl bits.
> >>> ---
> >>>  docs/all-tests.dox  |   2 +
> >>>  tests/test/Makefile |   9 ++++
> >>>  tests/test/main.c   | 100 ++++++++++++++++++++++++++++++++++++++++++++
> >>>  3 files changed, 111 insertions(+)
> >>>  create mode 100644 tests/test/Makefile
> >>>  create mode 100644 tests/test/main.c
> >>
> >> I'm puzzled: Why "test"? That doesn't describe in any way what this test
> >> is about.
> > 
> > That's just my place holder for random XTF stuff.  I don't intend this
> > to be committed.
> 
> Could have been said then one way or another.

Yes, realized later when speaking with Andrew that I had forgot to send
the test I've used, and then didn't adjust the message when sending to
note this wasn't supposed to be applied.

Regards, Roger.

