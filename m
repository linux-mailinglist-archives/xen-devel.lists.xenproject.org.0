Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E7467B09
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 17:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237814.412442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtB98-0005fk-05; Fri, 03 Dec 2021 16:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237814.412442; Fri, 03 Dec 2021 16:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtB97-0005dX-S7; Fri, 03 Dec 2021 16:10:49 +0000
Received: by outflank-mailman (input) for mailman id 237814;
 Fri, 03 Dec 2021 16:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BQRQ=QU=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mtB95-0005N2-Vx
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 16:10:48 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92c37a01-5453-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 17:10:47 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id o4so3300734pfp.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Dec 2021 08:10:47 -0800 (PST)
Received: from [10.11.23.113] (wsip-24-120-54-60.lv.lv.cox.net. [24.120.54.60])
 by smtp.gmail.com with ESMTPSA id w19sm2713866pjh.10.2021.12.03.08.10.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 08:10:45 -0800 (PST)
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
X-Inumbo-ID: 92c37a01-5453-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XoL6Grb/bJtvvyOFRBlLY63JKkRh7VeY4v7ZnbbCBGc=;
        b=SOJ9rHCIYoJDRrUPHbyhGDiYgj+aySuB4y+E/XCdhYGTrFwsF33KPzFqQ3hZv5IWko
         +TuSKC4S6vNYpqWr7C8qXvonSErwcyLHUjHdjPF9QA9bfrIPBssnXrCdV2NqTEInCmLV
         aeLD3da2lrR/YyXVN9qOL7mXx3WeODtEsfNRbFhrSmqzoGIYZc5pKUZXWSQpS0q9wEpH
         QDGjitscNjuDF2reREItCqYWzzL4nvA54zGmLtepve/KOADCPu1zKg3j59QFDWCumuFZ
         CKQwLVrjVoy820JjJ7So5sTjY1VTlgZx6crjGqXHVzqF/jH8LcvdgYhkk8LIriNP2nVV
         vrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XoL6Grb/bJtvvyOFRBlLY63JKkRh7VeY4v7ZnbbCBGc=;
        b=eSntKCmqoC6Y93LB31NaMtyukdDSwjkCTfw+uIaTPjXlNy+X6Zukb8WYnk5KsPItEm
         0jhry54Y+jKqknLr+nMZWHHtl6wL0I6vERFwlsf1Fy8xWzT5ukUXimtRht9h2XuDosEF
         jUaDt593xOkgSrIX2l+uJzcjlY4n3OWo2fRLBEHxBEIF3TJSwlE8xqE2hQ1eZrE/3KGr
         ITyvAFgGEiqj4YoI225m7Ll/PZrZWcj5o8kMj2aFsoarxu0ymynSXTmZnpc6UcKc8vug
         Z2gLnS1NtHVon1RBfD9ZOBuFnFLQno+fcefSqTiYyXENQaWbXFRLNtYg0Eo1sDNRAUPV
         aitw==
X-Gm-Message-State: AOAM531qLlWcukROFYW8DLE8yZhhKKnnn3Z9x6sOehj6yrqIIE5z/+nk
	Q3PqdRL38YWVBwM6JinSbBDIxltQ8aL/UQ==
X-Google-Smtp-Source: ABdhPJx08RY05QSK05UPhcxaDTteUlpF6rLSoyl/NUtBTZOTZsPu9PiBsb1TbIMex8WKD+j4C1lw0g==
X-Received: by 2002:a65:5ccb:: with SMTP id b11mr5039148pgt.408.1638547845685;
        Fri, 03 Dec 2021 08:10:45 -0800 (PST)
Message-ID: <9647b586-e325-0d3a-3369-e3b13e45af9d@gmail.com>
Date: Fri, 3 Dec 2021 08:10:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 6/7] xen/arm: process pending vPCI map/unmap operations
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20211124075942.2645445-1-andr2000@gmail.com>
 <20211124075942.2645445-7-andr2000@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20211124075942.2645445-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2021 23:59, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> 
> Currently this deferred processing is happening in common IOREQ code
> which doesn't seem to be the right place for x86 and is even more
> doubtful because IOREQ may not be enabled for Arm at all.
> So, for Arm the pending vPCI work may have no chance to be executed
> if the processing is left as is in the common IOREQ code only.
> For that reason make vPCI processing happen in arch specific code.
> 
> Please be aware that there are a few outstanding TODOs affecting this
> code path, see xen/drivers/vpci/header.c:map_range and
> xen/drivers/vpci/header.c:vpci_process_pending.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> [x86 part]
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Paul Durrant <paul@xen.org>

