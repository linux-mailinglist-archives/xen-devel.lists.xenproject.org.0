Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277848A4A64
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 10:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705927.1102863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwHmH-0006rs-6B; Mon, 15 Apr 2024 08:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705927.1102863; Mon, 15 Apr 2024 08:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwHmH-0006p8-3W; Mon, 15 Apr 2024 08:33:25 +0000
Received: by outflank-mailman (input) for mailman id 705927;
 Mon, 15 Apr 2024 08:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/mT=LU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rwHmF-0006p2-S9
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 08:33:23 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b54566-fb02-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 10:33:22 +0200 (CEST)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4dad331b828so1190733e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 01:33:22 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 fb20-20020ad44f14000000b0069b4fe0569fsm5399546qvb.109.2024.04.15.01.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 01:33:21 -0700 (PDT)
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
X-Inumbo-ID: d1b54566-fb02-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713170001; x=1713774801; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKRnV28M2bAJ3B+jDUPIHn7QHZ41qFXsE/g5/Q8S5y4=;
        b=RT6dDnGlAhE9MtoYZ8q+YX4/3Ko2kcmCroMLrzeST0ofO9apEGz4qIPNLhVEO4cQbn
         LLRo5ZCa23zCHHTzBaJlw7FGAspoOe5ARC90+czyOeyuua8YA8i7vMnFca5Ci+sTRiq1
         VF9GXxfamCG1Cnyl2Uopeor+cGdbLsLgmrScQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170001; x=1713774801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKRnV28M2bAJ3B+jDUPIHn7QHZ41qFXsE/g5/Q8S5y4=;
        b=apMr1vDTbRqKJYkkny58+5vZFUheRxN89QSN4tADZ4W5UJ8WjYbCwmFnmywjiZ4vWt
         1tDH3cRVgZ6fmTY7/cJaDX63pwBVxDUUXJRLS64gV63LbR60bmml0TZnk6r5aHJ4pwpG
         0r9TIeq8RPoIhL/2eSNSeYjePZxfjMu7UGy6QzbDPb5ST9MM0ZyQ5sOUAKnoKxmXjo0h
         oPwlaDkresTiIrQT5py89Jwey0IHT2P5mogJoVCXyQlEbLBLehDqp5dvW3i+1V8QI6Zy
         ecR701JVrn1ZU/ODBzK5fKLn++cZeS7Brum+50InPlw16+4YKnHL9WxxsUiM42LELjfx
         mVQA==
X-Gm-Message-State: AOJu0Yxcx0gNCgrt2YuLsY/ONmXxd+Y6Vj+CmSzcX1qXleoJf9IyHT4c
	WyrfBHIUEB2js33+6qQffSxjTNewRZa4Pe6u4IGCroGKerHmUe8ldXXC+WX3528=
X-Google-Smtp-Source: AGHT+IEp9U4EKBPn49PBNRV1hBVCUb8AQsdK3+PsGEQGyqOO3iYLioivXocctAfDS9/u95PuUFz5aw==
X-Received: by 2002:a05:6122:208e:b0:4d4:1a1a:6db7 with SMTP id i14-20020a056122208e00b004d41a1a6db7mr6637067vkd.2.1713170001645;
        Mon, 15 Apr 2024 01:33:21 -0700 (PDT)
Date: Mon, 15 Apr 2024 10:33:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] osstest: increase boot timeout for Debian PV guests
Message-ID: <ZhzmTwP9_90GOnpw@macbook>
References: <20240412141121.79280-1-roger.pau@citrix.com>
 <2f7689f1-ac3c-47b7-8ba6-b6b9b9e82749@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f7689f1-ac3c-47b7-8ba6-b6b9b9e82749@perard>

On Mon, Apr 15, 2024 at 09:15:51AM +0100, Anthony PERARD wrote:
> On Fri, Apr 12, 2024 at 04:11:21PM +0200, Roger Pau Monne wrote:
> > The current timeout of 40s seems to be too low for AMD boxes (pinots and
> > rimavas) in the lab after XSA-455, see:
> 
> There's something else we can tweak if only some machine need extra
> time, it is an host property "TimeoutFactor", which can increase all
> timeout for a single machine. (It's use on the cubietruck for example.)
> 
> Or is it better to just increase boot time for all (or at least those)
> pv guest?

I did consider that, but given the timeout is just limited to PV guest
startup I considered the "TimeoutFactor" too broad.  I think
increasing the Debian PV boot timeout from 40s to 60s is a minor
adjustment, and shouldn't affect other tests.

Let me know if you still prefer to use "TimeoutFactor" and I will look
into it.

Thanks, Roger.

