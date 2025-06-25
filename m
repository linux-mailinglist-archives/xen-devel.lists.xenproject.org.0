Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92453AE888F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025261.1400885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSKg-0005sW-Mw; Wed, 25 Jun 2025 15:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025261.1400885; Wed, 25 Jun 2025 15:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSKg-0005pb-K8; Wed, 25 Jun 2025 15:46:42 +0000
Received: by outflank-mailman (input) for mailman id 1025261;
 Wed, 25 Jun 2025 15:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUSKf-0005pV-1q
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:46:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9511c2c2-51db-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 17:46:39 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so3836191f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:46:39 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6e805d1e2sm4899093f8f.24.2025.06.25.08.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:46:38 -0700 (PDT)
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
X-Inumbo-ID: 9511c2c2-51db-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750866398; x=1751471198; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LojgLOCtW02dabTp+YFhUX08RNdTWTM2YGGvpuBMsg=;
        b=BNU8/zFsV7By3U2mWhPmAQdlMqmatRPuPxSASwrTFIyocS40vxCab3SS8+NPARkqkj
         166L+Wn3hGXO6hHbsG04Rj8+WasOzr5XIEgNfol+6/POPU8ZgcCS9k0q0KKLmeHH2Yun
         puXF9XD9jeWbqtXpqSekxVBMbx5HYRjR+o+9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866398; x=1751471198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LojgLOCtW02dabTp+YFhUX08RNdTWTM2YGGvpuBMsg=;
        b=Pt3ltWytwZpXZLPpgiHxW04bdcfPK1PhUzogYprxayONppRYcBn2cLumZCDDP7iJCy
         E4LB+YhfXuv/ZI4JA4D/SZWv+zl3b3BYr2EEUye0feR4cBub1OSTFT6MdIMQuz+a9ZNN
         R5oyCTQCyIuNzWyWFRKc2dTCQODTuggq8A3aJAxi506MeIbgRoc01AI6KS2q9qSgCKIL
         qz576tYur1BdGLe8IJcvlUWkkXD/4Autd8BuUKRVeGbSPf4w3FK9gS8nUxEtmYIWMO6d
         B+buagr0E7fOMIJ62FpDQWaB/Wo9oIf9uPQjQnZsMpa+DLmEiwsdtxbQkwhKMK560tFN
         n4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ey9Tw+FgKrv+1l8wVKpoj7WrAVydNdT4OkKGj8OrsgrJgOqVn7SEzzRMPhxx4HABjGiDmuCqazU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL6jLWC2Y2vPglsIN4fkSUZ3cceACdeOnUWP3RgxJnDnTg6lsB
	kAXsVFRk0qdtte93I+3SRYzWfpQnMJjVfhWLsKVF4gymYfJF7HNdkdb1vLdJTd1VNdk=
X-Gm-Gg: ASbGncszbrJrifQu7636Pd2/kRweJwnLx19JE6UQ97nXUVzECNz6mpZz7h/DayEs90f
	6G5o86ERsFMJjXcAl2mQDsNMLM6b7llkhf4nnEwEtEkQE7gYJi9WlnTZ67KjiSrwKKYH02zRBjE
	w66d98dtg8M0VNqrY8pcGCZ2QnhbSYkSiU22hGItv5NUih0+xrAPjbZI847DvgNAGjltpGfu2Ht
	ZlzefqGgg8K8X6YsDlqN4gjR1NjSFDo0LgDjmQGYisHgp/HuAZ/6USixQPYWnTxXvXLi+nLeL40
	RyElNCM0DrVfK12BvGcTOHy77BI0zkQoMV2F5bawxxgFeJeC7jozkYiX8eRmdBBVFCZ/VdRhP6l
	2jzKgAtd7I1Euw4jaI8ndWF+Jw/byhw==
X-Google-Smtp-Source: AGHT+IEaBje4n4tW3pprxvp31ACccblpyQwMt4pKIXwM5W+3kLDRM7hnt4DoqIiRPWBIazp78/ydjQ==
X-Received: by 2002:a05:6000:2287:b0:3a5:27ba:47a8 with SMTP id ffacd0b85a97d-3a6ed65d23amr2936984f8f.52.1750866398437;
        Wed, 25 Jun 2025 08:46:38 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:46:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/8] pdx: introduce command line compression toggle
Message-ID: <aFwZ3dSo1MHMf-Em@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-5-roger.pau@citrix.com>
 <b7e9bca9-5fd6-479c-91eb-202f85efa44e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e9bca9-5fd6-479c-91eb-202f85efa44e@suse.com>

On Tue, Jun 24, 2025 at 03:40:16PM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > Introduce a command line option to allow disabling PDX compression.  The
> > disabling is done by turning pfn_pdx_add_region() into a no-op, so when
> > attempting to initialize the selected compression algorithm the array of
> > ranges to compress is empty.
> 
> While neat, this also feels fragile. It's not obvious that for any
> algorithm pfn_pdx_compression_setup() would leave compression disabled
> when there are zero ranges. In principle, if it was written differently
> for mask compression, there being no ranges could result in compression
> simply squeezing out all of the address bits. Yet as long as we think
> we're going to keep this in mind ...

It seemed to me that nr_rages == 0 (so no ranges reported) should
result in no compression, for example on x86 this means there's no
SRAT.

> > Signed-off-by: Roger Pau Monné <roger.pau@cloud.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

