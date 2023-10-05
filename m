Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B667B9C69
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 12:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612939.953127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoLGT-0000Aw-Vj; Thu, 05 Oct 2023 10:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612939.953127; Thu, 05 Oct 2023 10:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoLGT-000080-Rn; Thu, 05 Oct 2023 10:07:29 +0000
Received: by outflank-mailman (input) for mailman id 612939;
 Thu, 05 Oct 2023 10:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGTv=FT=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qoLGS-00007u-Ee
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 10:07:28 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc1b17b3-6366-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 12:07:27 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c752caeaa6so5682125ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 03:07:27 -0700 (PDT)
Received: from localhost ([122.172.81.92]) by smtp.gmail.com with ESMTPSA id
 p20-20020a170902ead400b001c3e732b8dbsm1244304pld.168.2023.10.05.03.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 03:07:24 -0700 (PDT)
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
X-Inumbo-ID: fc1b17b3-6366-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696500445; x=1697105245; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLWFeSVond74tkZOqvEba086Qve4qLpMCCHqTH1lxBk=;
        b=SGmr7NGyBcRXDYfn4/vgQfOl4/kN1FPrwBB+54XxaI3/3w+77POppNpr1EW/slxM4w
         GK7LjNZcPoFj2WikBpckyOPx9ztiiG2LJUmJLhttDcNB1hj9nZc4QCk1mtBClHdNN1oW
         BtjD9N5KPtKSzDw4pH9/LkM7NeWj5UaL95751kvnEB+3m/7Hr+vxoXaqroULZaBaCwJn
         aSKdsusqOhkLQo4IOYKct50GnJuZNeTG8sg/lCj5jfBsNGoW7rHxEFp/tFovmEx6XcVU
         Muve8Kz5Dl5wViUtDejlxvGyPhGVwj6YVo6OLnKIthO2b9goc1qp0Utpx+a6wOb3dTTM
         YfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696500445; x=1697105245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLWFeSVond74tkZOqvEba086Qve4qLpMCCHqTH1lxBk=;
        b=h/yFvwd3z4gK4Qkv7sbq8w0/ilPh62Q6ieJrPkL0APGCGgweE9pDbBmQPGFKy9M6xC
         6FJ18STzzoTSiz/npdu0g/tKW3tQufEyzVxcevg1dOUBTKsGsnV5+E+NOgbtEFYJ4A+v
         Tr8Xc3/b4OmRZ+SCLiFMDN6RJl1SAILQjy4NksbsoFwfUCUi9FbPGxUIaYGnMPpU119q
         v+Ll28z4AG0+7xSI1vR+8kSL19ThBo8Ue+JzEgEeWQG7AHoe2tCwlsJzQwbZWpazP/pG
         DiG3owfnfzVfnlKB64eW9VOQJLK1WzPKvJ2WA85U2ynJpSxucdDJhDSMbi4KqLCgdzlj
         X7pg==
X-Gm-Message-State: AOJu0Yx9Xb2Dq+f0+HWrKzmcIxHupQ+inVcnAVoSBqYCqJqa96Bg4n8r
	B+o7GALLTl8BLbiuaLZXUod/Tw==
X-Google-Smtp-Source: AGHT+IHDCQEsjSU/8o8lSlZdriKzqJWmPSyvLf2DgrNbq7AdX5GK/V8t/tO5R5jRak2/UJfY8QjkJQ==
X-Received: by 2002:a17:902:7d92:b0:1c3:2ee6:3802 with SMTP id a18-20020a1709027d9200b001c32ee63802mr3845036plm.47.1696500445611;
        Thu, 05 Oct 2023 03:07:25 -0700 (PDT)
Date: Thu, 5 Oct 2023 15:37:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen: privcmd: Add support for ioeventfd
Message-ID: <20231005100723.krikk4oauyb4nm2d@vireshk-i7>
References: <cover.1693311370.git.viresh.kumar@linaro.org>
 <52b07a3861a34fb0deb6251bae8bd885815c6944.1693311370.git.viresh.kumar@linaro.org>
 <fb79fa9a-e91c-4bb7-8aee-c384b99df953@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb79fa9a-e91c-4bb7-8aee-c384b99df953@suse.com>

On 29-09-23, 07:46, Juergen Gross wrote:
> This is populated from a __u64 field. Maybe make it uint64_t?

Checkpatch warns about this, will use u64 instead.

CHECK: Prefer kernel type 'u64' over 'uint64_t'
#124: FILE: drivers/xen/privcmd.c:1097:
+	uint64_t addr;

-- 
viresh

