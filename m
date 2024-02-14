Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2468548E4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:04:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680683.1058735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDzt-0006QG-LB; Wed, 14 Feb 2024 12:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680683.1058735; Wed, 14 Feb 2024 12:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDzt-0006OY-IB; Wed, 14 Feb 2024 12:04:17 +0000
Received: by outflank-mailman (input) for mailman id 680683;
 Wed, 14 Feb 2024 12:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDzs-0006OP-Dm
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:04:16 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c7f8980-cb31-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 13:04:15 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5118d65cf9cso3940626e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 04:04:15 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h22-20020ac85056000000b0042dbbe27a55sm430962qtm.66.2024.02.14.04.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 04:04:14 -0800 (PST)
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
X-Inumbo-ID: 2c7f8980-cb31-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707912255; x=1708517055; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UDsEfgwp8wcDvHYNMbE3kESDb0kSmC9ET3bXxl+wzto=;
        b=G9itvYDx3F3wE38tqRhfCDpkblVEsUkxk/ctvLLQf2zAVgbUo6EV3oZ3QFM6TQ32Lo
         erFk9i9IMqgwrpAYqPCQ3ERDZCIi/6nZfWYbjionmhfZiCUT+gdz0b/hY+ob8/MHTrPW
         HhVBn7pU3pZ7NCPLKJJEey+N/wtfXlybvKNa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707912255; x=1708517055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDsEfgwp8wcDvHYNMbE3kESDb0kSmC9ET3bXxl+wzto=;
        b=WSw8vc0MYsqZXx8TxuifdhClK3TR4nR39Eme1Edoj8G49sRXQDOuPhM2HDvLt7F730
         kNweqSI7UlzRrFWtXCpCzVTdmbDEfCukoxS5zN563d5HFPOXqccoIjYuAk+gWx8QC31C
         6P7drq39paL3PK/7xl9fzJo1hEuv0H2r5ek1g5ML/mutdy9sNxcMSMLeM3pA2OybgJbN
         nkDae/PgMsbA9dBMzDYvmoLmPEMZMoufPK3tBLNpZYh6ZsF23zL4NP0kO4v+9O9e4tRW
         kJ2negvayz1pK5ESAuqI3mid7LUeffdJOUXw5OpSZ0jd5yBk0fJdrtDUL0jy613aKdpf
         n97A==
X-Forwarded-Encrypted: i=1; AJvYcCUI5rTlYk0EYI3ZJrTruLA9NLKhEf3YGNhKzili38rDEdb1Qi745uUV46EZB8HjNeNugs4RRMhaTN0Fz/bUffs4L00Taz6ze4FpyIt9wHM=
X-Gm-Message-State: AOJu0YwTy0H6rW+hRzdCXBWhS8Z75l3uwmeNDfU3p4rFWcCKLmwMs+NF
	xX45K6S59TLoY1ppvcABnoszSz8MBIJAs2yg8woEp3t3c/EGr1hagYPdYUvT3Ss=
X-Google-Smtp-Source: AGHT+IGxiGlwLPi/moC75NIUet2FgAUQsi4O6r4RrNMf8WHSEYZFYneKm2D/gkoO4rnvgXhM/iCATw==
X-Received: by 2002:a05:6512:2026:b0:511:69b3:a47e with SMTP id s6-20020a056512202600b0051169b3a47emr1582330lfs.52.1707912255065;
        Wed, 14 Feb 2024 04:04:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXspfXe6IhdjYPjAiKekEE0zoaF41AO8//AX/HQGibEgLkhVA8YUvUizB0h63p56RUZQM0ZwEGLYPN3Wj+XgiOdoYni3T+bdXC/lp/oWf4=
Date: Wed, 14 Feb 2024 13:04:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] iommu/x86: fix IVMD/RMRR range checker loop increment
Message-ID: <ZcysPDDHvkEuFrgJ@macbook>
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-2-roger.pau@citrix.com>
 <b2433393-1a04-4570-abe6-0356db9976f8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2433393-1a04-4570-abe6-0356db9976f8@suse.com>

On Wed, Feb 14, 2024 at 12:51:36PM +0100, Jan Beulich wrote:
> On 14.02.2024 11:37, Roger Pau Monne wrote:
> > mfn_add() doesn't store the incremented value in the parameter, and instead
> > returns it to the caller.  As a result, the loop in iommu_unity_region_ok()
> > didn't make progress.  Fix it by storing the incremented value.
> > 
> > Fixes: e45801dea17b ('iommu/x86: introduce a generic IVMD/RMRR range validity helper')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Should Andrew get a Reported-by here? And surely we want to list the
> Coverity ID as well? (Happy to take of both while committing, so long
> as you agree.)

Oh, I didn't add those here, yes, sure, feel free to add.

Thanks, Roger.

