Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6EA934D31
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760451.1170305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQCf-0000aE-Hy; Thu, 18 Jul 2024 12:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760451.1170305; Thu, 18 Jul 2024 12:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQCf-0000X3-Eo; Thu, 18 Jul 2024 12:25:45 +0000
Received: by outflank-mailman (input) for mailman id 760451;
 Thu, 18 Jul 2024 12:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9B5K=OS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sUQCe-0000Wh-CT
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:25:44 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98c0942-4500-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 14:25:43 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-447e02f3ac9so1151841cf.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 05:25:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f969a24d3sm1871281cf.12.2024.07.18.05.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 05:25:41 -0700 (PDT)
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
X-Inumbo-ID: d98c0942-4500-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721305542; x=1721910342; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6MPbPAAKzL4JzxDE/n3qmKVDMq+ZG2ID2v/EiUjazHQ=;
        b=WClkPGLZkqbNOUhFCD9SpclYnPBOB+Pvj0kGOuMavpRkWMOmE1o1l5QcqbH66hzJ1D
         ZgmRjgDkuScrXKslTmymiMpfXWsCeCoodEIdUxufUXRSY2q1hQlFyU7F7HYMH1dEl/4k
         QsrOJHGaEvSkvgpENaN9d7iSin+7U17DJe7PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721305542; x=1721910342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MPbPAAKzL4JzxDE/n3qmKVDMq+ZG2ID2v/EiUjazHQ=;
        b=JqdsAJlFjuQFju5vXdgsBf8ALB7NuaNFT/1HyeLeBn3q5utUzrsPhj/O/DhtfIUDuy
         21Y7oc5w46Zg2F8+zkf4d/QoPdlLEnIKKa8RJ4Rzvs4XHQYtATjsm37LmfUG6+wBPMKF
         cEI0mqCbfAG85hKrUNrWJgTXNu3iAanIXB6BAKFhJW6TImnX9h/AcLGRZG+BgsUI4+Mv
         jl11yAcRhbCz1tqqwgLFW2YyxzSRgT10eE54tG2H4uS4uX08m//0pcpx2FPctIfi5vz3
         +k2Y1YsW+1vrrFYN+5YNUunkr5c8gzvRjypTFGCnEwtO7KfEp0539AqiTvAno9SM42VP
         oHxA==
X-Gm-Message-State: AOJu0Yw48rTzxII4NwJ3r0LCTikO2W9Jr+kGT/6iJtw3nLbmR4pp6++Q
	h2Y5ro9S799tUvCQjLJF7ilcSHYC7Rd72Pf1djiOId4qmxbXGI0Pypc0c+sih+0=
X-Google-Smtp-Source: AGHT+IG/7P3GfdgW3bSX/gfzesGLJY1axYrCCUCpaaEpJnMGzlOrTpkAaFU7q1RXUcI0y/HW94DbLQ==
X-Received: by 2002:a05:622a:13ce:b0:441:315:1c90 with SMTP id d75a77b69052e-44f96966830mr7149111cf.12.1721305541996;
        Thu, 18 Jul 2024 05:25:41 -0700 (PDT)
Date: Thu, 18 Jul 2024 14:25:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] MAINTAINERS: drop separate x86/mm section
Message-ID: <ZpkJwgHMm7RCQukB@macbook>
References: <f3998ed5-4122-487b-aaa8-8683bddb6e63@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3998ed5-4122-487b-aaa8-8683bddb6e63@suse.com>

On Thu, Jul 18, 2024 at 12:30:10PM +0200, Jan Beulich wrote:
> Let the subtree fall under general x86 maintainership instead, then also
> properly reflecting Roger's role there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

