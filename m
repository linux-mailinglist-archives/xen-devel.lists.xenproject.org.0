Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E19B0029
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 12:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825999.1240377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Hax-0005Gr-2W; Fri, 25 Oct 2024 10:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825999.1240377; Fri, 25 Oct 2024 10:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Haw-0005Dr-WB; Fri, 25 Oct 2024 10:31:02 +0000
Received: by outflank-mailman (input) for mailman id 825999;
 Fri, 25 Oct 2024 10:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hagD=RV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t4Hav-0005BE-7O
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 10:31:01 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 397e7792-92bc-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 12:30:58 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso29237541fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 03:30:59 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f02989bsm54774866b.80.2024.10.25.03.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 03:30:57 -0700 (PDT)
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
X-Inumbo-ID: 397e7792-92bc-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729852258; x=1730457058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C5CkQd0BCM/pGul5I9/iyw5Q1vTMTxTJgG7VAFArIRE=;
        b=mGz0Egw7B43jsXezb1TPDWXcWBAyXjzcOHimZwvce6Iq7GZomrzm3alP0oO4A/0L06
         FzdWWsIPx/F404XUwen5Qj4w8EO3x7daArNHmZXTtEK9RKwQjUEN5hYhte2gkNKWniMm
         doHME2w4B1/NVr+l+oc9rd7ZF2C0kVRhl0mjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729852258; x=1730457058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5CkQd0BCM/pGul5I9/iyw5Q1vTMTxTJgG7VAFArIRE=;
        b=FP1cA0gDw4iVIO58rOU6GHF4Cx7P3Swt+soVQM92BdAFuIcXo15dTpeQ518LJ876kf
         igytiv4eTttscu8Xg6NlimF1jir7pNl/Dl3FOHxxNSJBy9MG9VbvhMByv+Mdkqw+7y8z
         SGVYsJTexij5ANO2Nsn0NySWhfjDbB8Y1XHjPe/BingJOOi43v/o/G6XCP9i+GrfFRKA
         nzKZeH1Yz75SdLrkdccIvvzGA4nCyvNEAbvFM5VkIX/1RiDbhqPm1p8V0cHS30RaSC7a
         OPxr06eOGkEYA7ZNAckaeeeTrj58xPFeFeDZFVLuTDJW18FrMA5iBetL95DqAWmDgVcc
         DjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAILX8Cq3UcOXMML5v+SYLUqGuI8QqCGHuXonwazM70b9ELaKNKnz/dMjdAKNP0O7g8Go3HWSeyOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYFh9TfQBM8iEjJSc/vm1GzR5ds95+bNdbIEnSI9vpMuWNofAY
	Vss++WUylpmKXxwMS789tOgPHOuxmas9qPSJLrQC8XaT+pNsLYStoh7WpIgzzxw=
X-Google-Smtp-Source: AGHT+IEAfPMf9p0bUmi+Xjiu7iOoy/yAN+Thgvmcq3WEobywbEfihu8PrkPyq3pyYSNWmAhedF/UjA==
X-Received: by 2002:a05:6512:1282:b0:533:4785:82ab with SMTP id 2adb3069b0e04-53b1a315e50mr9246019e87.1.1729852258350;
        Fri, 25 Oct 2024 03:30:58 -0700 (PDT)
Message-ID: <8243b5b3-1615-4b46-80be-e1e0e8540be7@citrix.com>
Date: Fri, 25 Oct 2024 11:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/13] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-2-carlo.nonato@minervasys.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241025095014.42376-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2024 10:50 am, Carlo Nonato wrote:
>  SUPPORT.md                        |   7 ++
>  docs/misc/cache-coloring.rst      | 116 ++++++++++++++++++++++++++++++
>  docs/misc/xen-command-line.pandoc |  37 ++++++++++
>  xen/common/Kconfig                |  22 ++++++
>  xen/common/Makefile               |   1 +
>  xen/common/keyhandler.c           |   3 +
>  xen/common/llc-coloring.c         | 111 ++++++++++++++++++++++++++++
>  xen/common/page_alloc.c           |   3 +
>  xen/include/xen/llc-coloring.h    |  36 ++++++++++
>  xen/include/xen/sched.h           |   5 ++
>  10 files changed, 341 insertions(+)
>  create mode 100644 docs/misc/cache-coloring.rst
>  create mode 100644 xen/common/llc-coloring.c
>  create mode 100644 xen/include/xen/llc-coloring.h

I see you've got cache-coloring.rst which is great, but it's not wired
into the toctree.

We do have real Sphinx docs, https://xenbits.xen.org/docs/latest/
rendered from the tree.  For now, feel free to put it in Unsorted Documents.

Per the root COPYING file, Sphinx docs are licensed CC-BY-4.0.  Please
include an SPDX tag, as you don't have one currently (see other rst
files for how.)

~Andrew

