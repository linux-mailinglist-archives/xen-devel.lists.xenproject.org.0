Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8E82D77C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 11:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667284.1038393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKKw-00027x-8D; Mon, 15 Jan 2024 10:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667284.1038393; Mon, 15 Jan 2024 10:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPKKw-00026M-53; Mon, 15 Jan 2024 10:36:58 +0000
Received: by outflank-mailman (input) for mailman id 667284;
 Mon, 15 Jan 2024 10:36:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TGva=IZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPKKu-0001ah-Tf
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 10:36:56 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 014ab31a-b392-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 11:36:56 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cda523725bso17448031fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 02:36:56 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a05651232a100b0050ec4839e23sm1414114lfe.195.2024.01.15.02.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:36:55 -0800 (PST)
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
X-Inumbo-ID: 014ab31a-b392-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705315016; x=1705919816; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=haNGLYASDeou/aJYA7rZb1xeWzzh0nnjlRJbbFbhGoc=;
        b=YJCPNRHbpOve0FBBGpHpwEV9Oy4KHsTN6VOBRcL/C4piSLxv4rYOx0f6whUDU8KDX4
         pakja56VrS0jtK9mVkokGcyAgivfMd19IBRrim6XLHPlV/sHhaPd/KgXioPPQbVCIB0R
         hARjeD2JdkfYYxlmpIriz5V8nVSBEqPhm0zB97N8HfU+cbfDwJFss6kg6lB9uo+RLw70
         d7IiMmwO9g3im9B9Lzw/b7viteRldhvn2LO+STiYEfA8vcLqVPEQWqQO91+mfgccmSXM
         6iDhE0ErG9GC+VzLue0RIIDywm0Pp2uDZln1GNd9bgSqBya8yXefrS4aqK/4wq/fqGbH
         53kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705315016; x=1705919816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haNGLYASDeou/aJYA7rZb1xeWzzh0nnjlRJbbFbhGoc=;
        b=n/dgE5va9Wx5aTmp2GTKrROimqrwY4RJsW6AyJuncpfzmy072iPqhVcZf90DYjV0y7
         adEGs9yVg8O2CuBYyET2Lght1rhP2iSuWV9nPA9+KY1Pf6lomglIBs6dA4PD89Yf0jla
         XEUuL80X0Nt+e/eDzeyIuVwOivmNFo/EbM2DxRwRskV6OnVb02JKDiZwNJjkZTj7mw8F
         +PvcRtUqFoO4l5Xg7eXj0dTBLeX5GwwTGaTBFxzsmA7sHxzJ0Rfr9qgBHD9YUir2jGkm
         OMiqWKn1uj6+DHUg40yivXfQ/86oEG3dgIjFKFBz3SBrk39FrPoo5U0lH8WTNktLDdcs
         WBMQ==
X-Gm-Message-State: AOJu0YyWU3WWQuv+FecPytxXMOUYBXKpKc6BXPFKZwczFrGZeW+Zth+l
	gHlFIMaxcj9LY7T12tZie1Y=
X-Google-Smtp-Source: AGHT+IHSdP6ZVznBDxBYqMxg8j5Vw+jxgWDspNmpSGGp8Sf17CI3f+9FVw9q/YcZNaZ8BO2U7DHiiA==
X-Received: by 2002:a05:6512:31d2:b0:50e:3d3b:93fa with SMTP id j18-20020a05651231d200b0050e3d3b93famr2068100lfe.12.1705315015648;
        Mon, 15 Jan 2024 02:36:55 -0800 (PST)
Message-ID: <64c0e5b049d8d26161b9c87e25824c1adee649c6.camel@gmail.com>
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 15 Jan 2024 12:36:54 +0200
In-Reply-To: <7609d810-a2f0-4843-b019-0f9e700aa1e3@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
	 <3231bf55d5da1d3e1eb03a43759932d8ebcca8de.camel@gmail.com>
	 <7609d810-a2f0-4843-b019-0f9e700aa1e3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-11 at 17:43 +0100, Jan Beulich wrote:
> On 22.12.2023 17:32, Oleksii wrote:
> > > +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
> > I missed saving these changes. It should be _pfn -> pfn_. (Just a
> > reminder for me).
>=20
> And what purpose would the trailing underscore serve here?
There is no any. I'll use just pfn. Thanks for noticing that.

~ Oleksii

