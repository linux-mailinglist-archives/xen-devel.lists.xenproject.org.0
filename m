Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317389D5037
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 16:57:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841562.1257051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9Xw-0007iu-0o; Thu, 21 Nov 2024 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841562.1257051; Thu, 21 Nov 2024 15:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9Xv-0007hP-Tu; Thu, 21 Nov 2024 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 841562;
 Thu, 21 Nov 2024 15:56:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE9Xu-0007hJ-BB
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 15:56:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30fa229e-a821-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 16:56:38 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so192346766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 07:56:38 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4319b75sm95378466b.148.2024.11.21.07.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 07:56:37 -0800 (PST)
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
X-Inumbo-ID: 30fa229e-a821-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwZmEyMjllLWE4MjEtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjA0NTk4LjMyMzc3Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732204597; x=1732809397; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxuEjEsh36RGixj1gtqJiNt7nF+wuQJGFevrh/T9/EM=;
        b=Sce3CMUYiUFRxsVGmfumTTx6rLXPY7PPXVZ/nD0+g/xM223i6nv2fxsxt2QnxxD7EL
         LG8sHc2X/XHDMfX6kXJl+PxTAtHUDF+qcf11bz8s9VKgpYIL2P90wMYY7/t0zu4NoMnZ
         OmB8yOxPk0sdRMQe6/QpVxj2Jn6vsbsdPjCqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732204597; x=1732809397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxuEjEsh36RGixj1gtqJiNt7nF+wuQJGFevrh/T9/EM=;
        b=FY+LkEGNmKnv0DiVtKfpOQmqMmjTRsxWMJbVSZduHoOe16/dbxhzWcqarVAMBBNYpM
         sxS7VqyrU/SC8OVB5mvNmeEDWboEXSGsG6jPkeWHfdm1FyOVEjVkBq76cBelAUjfad3G
         KvCDh8OU+aw7SeV3v/Dn9rkn9Aj/C7ihZxk4RZupEDz1StHZYulwra5IWBGTAwR1ws0z
         s+T4o+F4jF4BBVfZbfD5XbjVB0L0f1dlaHDg4whPzaw+dzt6n2Umjtkb6j4TdhTj3pgQ
         1ke+QKvQdjOCgbH7sC/CNqmYvGXeKeXEp5trgkYtMwOZZdPGlgoufTi2UN5AcBy4aBdy
         aVvw==
X-Gm-Message-State: AOJu0YwD72WZGXeYK316lmxnFcMo4x8ZNa+5ErQb7gC2iIrd98dB59qt
	pUk56DHUJ+Q6Ji/LmxL9OSx0ILuqLyIQT+A24KAxTcVMoKj3jX7+Bm+0xKlYl4qFJyqFrrg8oP0
	F
X-Gm-Gg: ASbGnctD2WtoEaUat5InfvqeA/BtiMoQvzP3XQb+d6Ze1Di8FJZxNtN56z2phoEcAOO
	npw+r3ORfbiV1FKGdB8mE8oI65G1PgFC1pUozJOBKAISsuzxGsIEqmfUH+T44vJ5a8GIxendLJj
	zWGPBQSv3s9aixX2bteLB3qBTSrHiApfIDpvGOEEKi7DtxwuNxX+vL1oLKIPMHGJix2IpINXzTs
	JsL7yRP+jGYFvO4ykgm9NrRQW0gm0FuH2a+IH3fayb2uONUTX8KU3tsdkU=
X-Google-Smtp-Source: AGHT+IEd/ZbIedRyAJs0kOsvuEViLz1lXYM/YjJq2XIDDvCOsTtdy4RChc2oIClAc0wYubW+3tSdRw==
X-Received: by 2002:a17:907:789:b0:a9a:80cc:d7b0 with SMTP id a640c23a62f3a-aa4dd72bd71mr682890666b.44.1732204597417;
        Thu, 21 Nov 2024 07:56:37 -0800 (PST)
Date: Thu, 21 Nov 2024 16:56:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number
 of vCPUs
Message-ID: <Zz9YM_MB1AoLqSIE@macbook>
References: <20241121111218.50984-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121111218.50984-1-roger.pau@citrix.com>

On Thu, Nov 21, 2024 at 12:12:18PM +0100, Roger Pau Monne wrote:
> The allocation of the paging structures in the per-domain area for mapping the
> guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
> have.  The maximum number of vCPUs is available at domain creation since commit
> 4737fa52ce86.
> 
> Limiting to the actual number of vCPUs avoids wasting memory for paging
> structures that will never be used.  Current logic unconditionally uses 513
> pages, one page for the L3, plus 512 L1 pages.

This is not true, I was confused with the logic in
create_perdomain_mapping().  When create_perdomain_mapping() is called
with pl1tab == NULL and ppg == NULL it just allocates the L2, but not
the L1 tables.

So the purpose of the create_perdomain_mapping(d, GDT_LDT_VIRT_START,
...) in pv_domain_initialise() is even more dubious now - as it just
allocates a page to use as L2.  I'm tempted to just remove it if you
agree, since I don't consider this useful.  The allocation will
already be done at vCPU initialization.

Thanks, Roger.

